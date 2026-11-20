//
//// カラー選択
//var colorOptions = document.querySelectorAll(
//    'input[name="avatarColor"]'
//);
//
//var selectedColor = null;
//
//colorOptions.forEach(function(color) {
//    color.addEventListener('change', function() {
//        selectedColor = Number(color.value);
//    });
//});
//
//
//// 登録ボタン
//document.getElementById("registerBtn")
//    .addEventListener("click", async function() {
//
//        var name = document.getElementById("playerName").value.trim();
//        var password = document.getElementById("password").value;
//        var confirmPassword = document.getElementById("confirmPassword").value;
//
//        // エラー初期化
//        document.getElementById("nameError").textContent = "";
//        document.getElementById("passwordError").textContent = "";
//        document.getElementById("passwordMatchError").textContent = "";
//        document.getElementById("colorError").textContent = "";
//
//        var valid = true;
//
//        // プレイヤー名
//        if (name === "") {
//            document.getElementById("nameError").textContent =
//                "プレイヤー名を入力してください";
//            valid = false;
//        }
//
//        // パスワード
//        if (password === "") {
//            document.getElementById("passwordError").textContent =
//                "パスワードを入力してください";
//            valid = false;
//        }
//
//        // パスワード一致確認
//        if (confirmPassword === "") {
//            document.getElementById("passwordMatchError").textContent =
//                "再入力してください";
//            valid = false;
//        } else if (password !== confirmPassword) {
//            document.getElementById("passwordMatchError").textContent =
//                "パスワードが一致しません";
//            valid = false;
//        }
//
//        // カラー未選択
//        if (selectedColor === null) {
//            document.getElementById("colorError").textContent =
//                "カラーを選択してください";
//            valid = false;
//        }
//
//        // 入力エラーがあれば終了
//        if (!valid) {
//            return;
//        }
//
//        // サーブレットに送るデータ
//        var userData = new URLSearchParams();
//
//        userData.append("playerName", name);
//        userData.append("password", password);
//        userData.append("color", selectedColor);
//
//        try {
//            // サーブレットへ送信
//            var response = await fetch(
//                document.getElementById("registerBtn").dataset.url,
//                {
//                    method: "POST",
//                    headers: {
//                        "Content-Type": "application/x-www-form-urlencoded"
//                    },
//                    body: userData.toString()
//                }
//            );
//
//            if (!response.ok) {
//                throw new Error("HTTPエラー: " + response.status);
//            }
//
//            var result = await response.json();
//
//            if (result.success) {
//                alert("登録成功");
//            } else {
//                alert(result.message || "登録失敗");
//            }
//
//        } catch (error) {
//            console.error(error);
//            alert("サーバー接続エラー");
//        }
//    });