<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>隕石破壊ゲーム</title>

    <link rel="stylesheet" href="連打.css">
</head>
<body>

    <h1>隕石破壊ゲーム</h1>

    <div class="info">
        <div>破壊数：<span id="score">0</span></div>
        <div>残り時間：<span id="time">30</span>秒</div>
    </div>

    <div class="gameArea">
        <img src="img/隕石.png" id="meteor" alt="隕石">
    </div>

    <div class="hp-box">
        <div id="hpBar" class="hp-bar"></div>
    </div>

    <p>隕石HP：<span id="hpText"></span></p>

    <button id="attackButton">
        連打！！
    </button>

    <p id="message"></p>

    <script>

        let maxHp = Math.floor(Math.random() * 150) + 1;
        let hp = maxHp;

        let score = 0;
        let time = 30;
        let playing = true;
        let scale = 1;

        const meteor = document.getElementById("meteor");
        const hpBar = document.getElementById("hpBar");
        const hpText = document.getElementById("hpText");
        const scoreText = document.getElementById("score");
        const timeText = document.getElementById("time");
        const message = document.getElementById("message");
        const attackButton = document.getElementById("attackButton");

        function updateHP() {

            const percent = (hp / maxHp) * 100;

            hpBar.style.width = percent + "%";

            hpText.textContent = `${hp} / ${maxHp}`;

            if (percent > 60) {
                hpBar.style.backgroundColor = "limegreen";
            }
            else if (percent > 30) {
                hpBar.style.backgroundColor = "orange";
            }
            else {
                hpBar.style.backgroundColor = "red";
            }
        }

        function createMeteor() {

            maxHp = Math.floor(Math.random() * 150) + 1;
            hp = maxHp;

            scale = 1;

            meteor.style.transform = "scale(1)";

            updateHP();
        }

        function destroyMeteor() {

            score++;
            scoreText.textContent = score;

            message.textContent = "💥 隕石破壊！";

            createMeteor();

            setTimeout(() => {
                message.textContent = "";
            }, 500);
        }

        attackButton.addEventListener("click", () => {

            if (!playing) return;

            hp -= 10;

            if (hp <= 0) {

                hp = 0;
                updateHP();

                destroyMeteor();

            } else {

                updateHP();

            }

        });

        // 隕石が近づいてくる演出
        const meteorMove = setInterval(() => {

            if (!playing) return;

            scale += 0.02;

            meteor.style.transform =
                `scale(${scale}) rotate(${Date.now() / 50}deg)`;

        }, 100);

        const timer = setInterval(() => {

            time--;

            timeText.textContent = time;

            if (time <= 0) {

                playing = false;

                attackButton.disabled = true;

                clearInterval(timer);
                clearInterval(meteorMove);

                message.textContent =
                    `ゲーム終了！ ${score}個破壊しました！`;

            }

        }, 1000);

        updateHP();

    </script>

</body>
</html>