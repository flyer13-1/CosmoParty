/* ==========================================================
   Login.js  人数選択画面のログイン部分（全員同時に並行してログインする）
   ・コントローラの読み取りと、ログイン結果の保持は gamepadAPI.js 側
   ・このファイルは「ログインの列の表示」と「各Pの操作の進行」を担当する
   ・列は .player と同じ区切り（同じ数・同じ幅）で #loginPlace の中に作る。
     HTMLには書かない

   【Pごとの進み方】st = "name" → "pw" → "done"
     name … ユーザー名の一覧から選ぶ（↑↓で移動 / Aで決定）
            先頭の「ゲスト」を選んだ場合は pw を飛ばして done
     pw   … コマンド入力でパスワードを入れる
            ↑→↓← = N/E/S/W と A/B/X/Y の8文字種のみ（DBjob.md の仕様）
            STARTで決定 / SELECTで1字削除（空のときは name に戻る）
     done … ログイン済み。SELECTでやり直せる

   ※ パスワードは保存しない。決定したら変数からも消す
   ========================================================== */
"use strict"; //jsのモード
import * as GP from "./gamepadAPI.js";

/* ==========================================================
   ■ 要素の宣言
   ========================================================== */

/* ---- DOM要素宣言 ---- */
let root = null; // 列の置き場所（#loginPlace）。mk() で受け取る
const cels = []; // cels[p] = Pの列（div.user）

/* ---- 変数・定数宣言 ---- */
const GST = "ゲスト"; // 一覧の先頭に出す表示名（保存される名前は gamepadAPI 側の guest）
// TODO: サーブレットができたら fetch("MemberCom?act=users") の結果に差し替える
const NMS = ["TAKUTO", "KOGAWA", "MITUHIRA", "OGINO", "TAKAHASHI"]; // ダミーのユーザー名
const ROW = 5; // 一覧を一度に何行出すか（カーソルの周りだけ出す）

// [ボタン番号, 入れる文字]。↑→↓← は方角の頭文字（DBjob.md）
const PWK = [
  [12, "N"], // ↑
  [15, "E"], // →
  [13, "S"], // ↓
  [14, "W"], // ←
  [0, "A"],
  [1, "B"],
  [2, "X"],
  [3, "Y"],
];
const UP = 12; // ↑（一覧のカーソル移動）
const DW = 13; // ↓（一覧のカーソル移動）
const DEC = 0; // A（一覧の決定）
const OKB = 9; // START（パスワードの決定）
const NGB = 8; // SELECT（1字削除 / やり直し）
const MIN = 6; // パスワードの最小文字数（DBjob.md）
const MXL = 20; // パスワードの最大文字数（DBjob.md）

const sts = []; // sts[p] = Pの進み具合 { st, cur, nam, pw, err }

/* ==========================================================
   ■ 初期化
   ========================================================== */

/* ----------------------------------------------------------
   nSt(): 1Pぶんの進み具合を、最初の状態で作る
   ---------------------------------------------------------- */
function nSt() {
  return { st: "name", cur: 0, nam: "", pw: "", err: "" };
}

/* ----------------------------------------------------------
   mk(el): el（#loginPlace）の中に、Pごとの列を1回だけ作る
   中身（一覧・入力欄・説明）は drwU() が書き換える
   ---------------------------------------------------------- */
function mk(el) {
  root = el;
  for (let p = 0; p < GP.MAX; p++) {
    sts[p] = nSt();

    const c = document.createElement("div"); // 1Pぶんの列
    c.className = "user";
    c.dataset.n = p + 1;

    const h = document.createElement("h3"); // 「1P」など
    h.textContent = `${p + 1}P`;
    const l = document.createElement("div"); // ユーザー名の一覧 / 選んだ名前
    l.className = "list";
    const m = document.createElement("div"); // パスワードの入り具合
    m.className = "mask";
    const n = document.createElement("div"); // 操作の説明・エラー
    n.className = "hint";

    c.append(h, l, m, n);
    root.appendChild(c);
    cels[p] = c;
  }
}

/* ==========================================================
   ■ 共通機能
   ========================================================== */

/* ----------------------------------------------------------
   nams(): 一覧に出す名前の配列。先頭は必ずゲスト
   ---------------------------------------------------------- */
function nams() {
  return [GST, ...NMS];
}

/* ----------------------------------------------------------
   slt(p): Pのコントローラのスロット番号。つながっていなければ -1
   gamepadAPI の dn() はスロット番号で聞くので、ここで変換する
   ---------------------------------------------------------- */
function slt(p) {
  const g = GP.pad(p);
  return g ? g.index : -1;
}

/* ----------------------------------------------------------
   top(cur, len): 一覧の何行目から出すか（カーソルを真ん中あたりに置く）
   ---------------------------------------------------------- */
function top(cur, len) {
  if (len <= ROW) return 0; // 全部出せるなら先頭から
  let t = cur - Math.floor(ROW / 2);
  if (t < 0) t = 0;
  if (t > len - ROW) t = len - ROW;
  return t;
}

/* ----------------------------------------------------------
   row(txt, cls): 一覧の1行を作って返す
   ※ 名前はサーブレットから来る予定なので、innerHTML は使わず textContent で入れる
   ---------------------------------------------------------- */
function row(txt, cls) {
  const e = document.createElement("div");
  e.className = cls;
  e.textContent = txt;
  return e;
}

/* ==========================================================
   ■ 表示機能
   ========================================================== */

/* ----------------------------------------------------------
   drwU(p): Pの列を、今の進み具合に合わせて描き直す
   状態が変わったときだけ呼ぶ（毎フレームは呼ばない）
   ---------------------------------------------------------- */
function drwU(p) {
  const s = sts[p];
  const c = cels[p];
  const l = c.querySelector(".list");
  const m = c.querySelector(".mask");
  const n = c.querySelector(".hint");

  l.textContent = ""; // 一覧を作り直す

  if (s.st === "name") {
    const all = nams();
    const t = top(s.cur, all.length);
    for (let i = t; i < Math.min(t + ROW, all.length); i++) {
      l.appendChild(row(all[i], i === s.cur ? "row sel" : "row"));
    }
    m.textContent = "";
    n.textContent = "↑↓で選択 / Aで決定";
  } else if (s.st === "pw") {
    l.appendChild(row(s.nam, "row sel"));
    m.textContent = s.pw.length
      ? `${"●".repeat(s.pw.length)} (${s.pw.length})`
      : "パスワードを入力";
    n.textContent = s.err || "方向+ABXYで入力 / STARTで決定 / SELECTで削除";
  } else {
    l.appendChild(row(s.nam, "row ok"));
    m.textContent = "ログイン完了";
    n.textContent = "SELECTでやり直し";
  }
}

/* ==========================================================
   ■ 認証機能
   ========================================================== */

/* ----------------------------------------------------------
   auth(nam, pw): ログインを試して、成功ならトークン・失敗なら null を返す
   ※ 今はダミー。形式（8文字種・6〜20文字）が合っていれば成功とする。
     サーブレットができたら、ここを
     fetch("MemberCom?act=login", { method:"POST", body: ... }) に差し替える。
     そのときも、パスワードは送るだけで保存しないこと
   ---------------------------------------------------------- */
function auth(nam, pw) {
  if (!new RegExp(`^[NESWABXY]{${MIN},${MXL}}$`).test(pw)) return null;
  return `dummy-${nam}`; // 仮のトークン
}

/* ==========================================================
   ■ 操作機能（Pごと）
   ========================================================== */

/* ----------------------------------------------------------
   keyN(p, i, s): 名前を選んでいるときの操作
   ---------------------------------------------------------- */
function keyN(p, i, s) {
  const all = nams();
  let mv = false;

  if (GP.dn(i, UP)) {
    s.cur = (s.cur - 1 + all.length) % all.length; // 上端から下端へ回る
    mv = true;
  }
  if (GP.dn(i, DW)) {
    s.cur = (s.cur + 1) % all.length; // 下端から上端へ回る
    mv = true;
  }

  if (GP.dn(i, DEC)) {
    s.nam = all[s.cur];
    if (s.cur === 0) {
      GP.lout(p); // ゲストは認証なし（name=guest, tok=null）
      s.st = "done";
    } else {
      s.pw = ""; // パスワード入力へ
      s.err = "";
      s.st = "pw";
    }
    mv = true;
  }

  if (mv) drwU(p);
}

/* ----------------------------------------------------------
   keyP(p, i, s): パスワードを入れているときの操作
   ---------------------------------------------------------- */
function keyP(p, i, s) {
  let mv = false;

  // 8文字種の入力（上限まで）
  PWK.forEach(([b, ch]) => {
    if (!GP.dn(i, b)) return;
    if (s.pw.length >= MXL) {
      s.err = `${MXL}文字までです`;
    } else {
      s.pw += ch;
      s.err = "";
    }
    mv = true;
  });

  if (GP.dn(i, NGB)) {
    if (s.pw.length > 0) {
      s.pw = s.pw.slice(0, -1); // 1字削除
      s.err = "";
    } else {
      s.st = "name"; // 空のときは名前選びに戻る
    }
    mv = true;
  }

  if (GP.dn(i, OKB)) {
    if (s.pw.length < MIN) {
      s.err = `${MIN}文字以上です`;
    } else {
      const tok = auth(s.nam, s.pw);
      s.pw = ""; // パスワードは残さない
      if (tok === null) {
        s.err = "ログインできませんでした";
      } else {
        GP.lgin(p, s.nam, tok); // 結果だけ gamepadAPI に預ける
        s.err = "";
        s.st = "done";
      }
    }
    mv = true;
  }

  if (mv) drwU(p);
}

/* ----------------------------------------------------------
   keyD(p, i, s): ログイン済みのときの操作（やり直しだけ）
   ---------------------------------------------------------- */
function keyD(p, i, s) {
  if (!GP.dn(i, NGB)) return;
  GP.lout(p); // ゲストに戻す
  sts[p] = nSt();
  drwU(p);
}

/* ==========================================================
   ■ 進行機能（使う側のループから呼ぶ）
   ========================================================== */

/* ----------------------------------------------------------
   opn(n): ログインを始める。n人分の列だけ出して、最初から選び直させる
   ---------------------------------------------------------- */
function opn(n) {
  for (let p = 0; p < GP.MAX; p++) {
    sts[p] = nSt();
    cels[p].style.display = p < n ? "" : "none";
    drwU(p);
  }
  if (root) root.style.display = "";
}

/* ----------------------------------------------------------
   cls(): ログインの列を隠す（人数選択に戻るとき）
   ※ ログイン結果（name / tok）は gamepadAPI 側に残したままにする
   ---------------------------------------------------------- */
function cls() {
  if (root) root.style.display = "none";
}

/* ----------------------------------------------------------
   stp(n): 毎フレームの操作受け付け。n は参加人数
   つながっていないPは飛ばす
   ---------------------------------------------------------- */
function stp(n) {
  for (let p = 0; p < n; p++) {
    const i = slt(p);
    if (i < 0) continue; // 切断中

    const s = sts[p];
    if (s.st === "name") keyN(p, i, s);
    else if (s.st === "pw") keyP(p, i, s);
    else keyD(p, i, s);
  }
}

/* ----------------------------------------------------------
   fin(n): n人全員がログイン（またはゲスト確定）を終えたか
   ---------------------------------------------------------- */
function fin(n) {
  for (let p = 0; p < n; p++) {
    if (sts[p].st !== "done") return false;
  }
  return true;
}

/* ==========================================================
   ■ 公開する関数
   ========================================================== */
export { mk, opn, cls, stp, fin };
