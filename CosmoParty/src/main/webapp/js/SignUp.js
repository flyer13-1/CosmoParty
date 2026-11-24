window.addEventListener("DOMContentLoaded", () => {

    const characterImage =
        document.getElementById("characterImage");

    const colorRadios =
        document.querySelectorAll(
            'input[name="avatarColor"]'
        );

    const registerBtn =
        document.getElementById("registerBtn");

    const contextPath =
        "/" + window.location.pathname.split("/")[1];

    let selectedColor = null;

    // -------------------------
    // キャラクター変更
    // -------------------------
    colorRadios.forEach(radio => {

        radio.addEventListener("change", () => {

            selectedColor = Number(radio.value);

            let imagePath = "";

            switch (radio.value) {

                case "1":
                    imagePath =
                        contextPath + "/img/red.png";
                    break;

                case "2":
                    imagePath =
                        contextPath + "/img/orange.png";
                    break;

                case "3":
                    imagePath =
                        contextPath + "/img/yellow.png";
                    break;

                case "4":
                    imagePath =
                        contextPath + "/img/green.png";
                    break;

                case "5":
                    imagePath =
                        contextPath + "/img/lightgreen.png";
                    break;

                case "6":
                    imagePath =
                        contextPath + "/img/mint.png";
                    break;

                case "7":
                    imagePath =
                        contextPath + "/img/sky.png";
                    break;

                case "8":
                    imagePath =
                        contextPath + "/img/blue.png";
                    break;

                case "9":
                    imagePath =
                        contextPath + "/img/purple.png";
                    break;

                case "10":
                    imagePath =
                        contextPath + "/img/meteor.png";
                    break;
            }

            characterImage.src = imagePath;
            characterImage.style.display = "block";

        });

    });

    // -------------------------
    // 登録ボタン
    // -------------------------
    registerBtn.addEventListener("click", async () => {

        const name =
            document.getElementById("playerName")
                .value.trim();

        const password =
            document.getElementById("password")
                .value;

        const confirmPassword =
            document.getElementById("confirmPassword")
                .value;

        // -------------------------
        // エラー初期化
        // -------------------------
        document.getElementById("nameError")
            .textContent = "";

        document.getElementById("passwordError")
            .textContent = "";

        document.getElementById("passwordMatchError")
            .textContent = "";

        document.getElementById("colorError")
            .textContent = "";

        let valid = true;

        // -------------------------
        // プレイヤー名
        // -------------------------
        if (name === "") {

            document
                .getElementById("nameError")
                .textContent =
                "プレイヤー名を入力してください";

            valid = false;
        }

        // -------------------------
        // パスワード
        // -------------------------
        if (password === "") {

            document
                .getElementById("passwordError")
                .textContent =
                "パスワードを入力してください";

            valid = false;
        }

        // -------------------------
        // 確認パスワード
        // -------------------------
        if (confirmPassword === "") {

            document
                .getElementById("passwordMatchError")
                .textContent =
                "再入力してください";

            valid = false;
        }
        else if (password !== confirmPassword) {

            document
                .getElementById("passwordMatchError")
                .textContent =
                "パスワードが一致しません";

            valid = false;
        }

        // -------------------------
        // カラー
        // -------------------------
        if (selectedColor === null) {

            document
                .getElementById("colorError")
                .textContent =
                "カラーを選択してください";

            valid = false;
        }

        // -------------------------
        // エラーがあれば終了
        // -------------------------
        if (!valid) {
            return;
        }

        // -------------------------
        // 動作確認
        // -------------------------
        alert("入力チェック成功");

       /*
        本番用登録処理

        const userData =
            new URLSearchParams();

        userData.append(
            "playerName",
            name
        );

        userData.append(
            "password",
            password
        );

        userData.append(
            "color",
            selectedColor
        );

        try {

            const response =
                await fetch(
                    registerBtn.dataset.url,
                    {
                        method: "POST",
                        headers: {
                            "Content-Type":
                            "application/x-www-form-urlencoded"
                        },
                        body:
                            userData.toString()
                    }
                );

            const result =
                await response.json();

            if(result.success){
                alert("登録成功");
            }else{
                alert(result.message);
            }

        } catch(error){

            console.error(error);

            alert("サーバー接続エラー");
        }*/
        
    });

});