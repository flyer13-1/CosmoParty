let targetPlayers = 1;

// 1P～4Pに対応するGamepad番号を保存
const players = [null, null, null, null];

// ボタン前回状態
const padBtnBf = [false, false, false, false];

function setPlayerCount(num) {
  targetPlayers = num;

  for (let i = 1; i <= 4; i++) {
    document.getElementById(`player${i}`).style.display =
      i <= num ? "block" : "none";
  }

  checkReady();
}

function registerPad(padIndex) {
  // 既に参加済みなら無視
  if (players.includes(padIndex)) return;

  const playerIndex = players.indexOf(null);

  if (playerIndex === -1) return;

  const pad = navigator.getGamepads()[padIndex];

  players[playerIndex] = padIndex;

  document.getElementById(`pad${playerIndex + 1}Img`).style.display = "block";

  document.getElementById(`pad${playerIndex + 1}Text`).textContent = "参加完了";

  document.getElementById(`pad${playerIndex + 1}Name`).textContent = pad.id;

  checkReady();
}

function checkReady() {
  let joined = 0;

  for (let i = 0; i < targetPlayers; i++) {
    if (players[i] !== null) {
      joined++;
    }
  }

  document.getElementById("nextBtn").disabled = joined < targetPlayers;
}

function showConnectedPads() {
  const pads = navigator.getGamepads();

  let html = "<h2>接続中のコントローラー</h2>";

  let count = 0;

  for (let i = 0; i < pads.length; i++) {
    if (!pads[i]) continue;

    count++;

    html += `
            <div>
                Slot ${i}<br>
                ${pads[i].id}
            </div>
            <br>
        `;
  }

  if (count === 0) {
    html += "接続されていません";
  }

  document.getElementById("connectedPads").innerHTML = html;
}

function updatePads() {
  const pads = navigator.getGamepads();

  for (let i = 0; i < 4; i++) {
    const pad = pads[i];

    if (!pad) {
      padBtnBf[i] = false;
      continue;
    }

    // Aボタン
    const btnNow = pad.buttons[0].pressed;

    // 押した瞬間だけ参加
    if (btnNow && !padBtnBf[i]) {
      registerPad(i);
    }

    padBtnBf[i] = btnNow;
  }

  showConnectedPads();

  requestAnimationFrame(updatePads);
}

window.addEventListener("gamepadconnected", (e) => {
  console.log("接続:", e.gamepad.id);
});

window.addEventListener("gamepaddisconnected", (e) => {
  console.log("切断:", e.gamepad.id);
});

setPlayerCount(1);
updatePads();
