<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>隕石破壊ゲーム</title>

    <link rel="stylesheet" href="連打.css">
</head>
<body>

 <div class="player-select">

    <button onclick="setPlayers(1)">1人</button>
    <button onclick="setPlayers(2)">2人</button>
    <button onclick="setPlayers(3)">3人</button>
    <button onclick="setPlayers(4)">4人</button>

</div>
<div class="info">
    残り時間：<span id="time">30</span>秒
</div>
<div class="players">

    <div class="player" id="p1">
        <h2>1P</h2>
        <p>連打数: <span id="score1">0</span></p>
        <img src="img/hello2.png" id="meteor1">
        <div class="hp-box">
            <div id="hpBar1" class="hp-bar"></div>
        </div>
    </div>

    <div class="player" id="p2">
        <h2>2P</h2>
        <p>連打数: <span id="score2">0</span></p>
        <img src="img/hello.png" id="meteor2">
        <div class="hp-box">
            <div id="hpBar2" class="hp-bar"></div>
        </div>
    </div>

    <div class="player" id="p3">
        <h2>3P</h2>
        <p>連打数: <span id="score3">0</span></p>
        <img src="img/hello.png" id="meteor3">
        <div class="hp-box">
            <div id="hpBar3" class="hp-bar"></div>
        </div>
    </div>

    <div class="player" id="p4">
        <h2>4P</h2>
        <p>連打数: <span id="score4">0</span></p>
        <img src="img/hello.png" id="meteor4">
        <div class="hp-box">
            <div id="hpBar4" class="hp-bar"></div>
        </div>
    </div>

</div>
<p id="message"></p>
    <script>
let time = 30;
let playing = true;
let playerCount = 1;

function setPlayers(count){

    playerCount = count;

    for(let i = 1; i <= 4; i++){

        const player =
            document.getElementById(`p${i}`);

        if(i <= count){
            player.style.display = "block";
        }else{
            player.style.display = "none";
        }
    }
}

function detectPlayers(){

    const pads = navigator.getGamepads();

    let count = 0;

    for(let i = 0; i < pads.length; i++){

        if(pads[i]){
            count++;
        }
    }

    count = Math.max(1, Math.min(4, count));

    console.log("接続数:", count);

    setPlayers(count);
}

const players = [];

for(let i = 1; i <= 4; i++){

    players.push({
        score: 0,
        maxHp: Math.floor(Math.random() * 150) + 1,
        hp: 0,
        scale: 1,
        image: document.getElementById(`meteor${i}`),
        bar: document.getElementById(`hpBar${i}`),
        scoreText: document.getElementById(`score${i}`)
    });

    players[i - 1].hp =
        players[i - 1].maxHp;
}

players.forEach(player => {
    player.hp = player.maxHp;
});

const message =
    document.getElementById("message");

const timeText =
    document.getElementById("time");

function updatePlayer(player){

    const percent =
        (player.hp / player.maxHp) * 100;

    player.bar.style.width =
        percent + "%";

    if(percent > 60){

        player.bar.style.backgroundColor =
            "limegreen";

    }else if(percent > 30){

        player.bar.style.backgroundColor =
            "orange";

    }else{

        player.bar.style.backgroundColor =
            "red";
    }
}

function createMeteor(player){

    player.maxHp =
        Math.floor(Math.random() * 150) + 1;

    player.hp = player.maxHp;

    player.scale = 1;

    player.image.style.transform =
        "scale(1)";
}

function destroyMeteor(index){

    message.textContent =
        `${index + 1}P 隕石破壊！`;

    createMeteor(players[index]);

    setTimeout(() => {
        message.textContent = "";
    }, 500);
}

function attack(index){

    if(!playing) return;

    const player = players[index];

    player.score++;

    player.scoreText.textContent =
        player.score;

    player.hp -= 10;

    if(player.hp <= 0){

        player.hp = 0;

        updatePlayer(player);

        destroyMeteor(index);

    }else{

        updatePlayer(player);
    }
}

document.addEventListener("keydown", e => {

    const keys = [
        "KeyA",
        "KeyL",
        "KeyZ",
        "KeyM"
    ];

    const index =
        keys.indexOf(e.code);

    if(index !== -1 &&
       index < playerCount){

        attack(index);
    }
});

const padBtnBf =
    [false, false, false, false];

function gamepad(){

    const pads =
        navigator.getGamepads();

    for(let i = 0;
        i < playerCount;
        i++){

        const pad = pads[i];

        if(!pad){

            padBtnBf[i] = false;
            continue;
        }

        const padBtnNow =
            pad.buttons[0].pressed;

        if(padBtnNow &&
           !padBtnBf[i]){

            attack(i);
        }

        padBtnBf[i] = padBtnNow;
    }

    requestAnimationFrame(gamepad);
}

window.addEventListener(
    "gamepadconnected",
    e => {

        console.log(
            "接続:",
            e.gamepad.id
        );

        detectPlayers();
    }
);

window.addEventListener(
    "gamepaddisconnected",
    e => {

        console.log(
            "切断:",
            e.gamepad.id
        );

        detectPlayers();
    }
);

gamepad();

players.forEach(updatePlayer);

setTimeout(() => {
    detectPlayers();
}, 100);

const meteorMove =
setInterval(() => {

    if(!playing) return;

    players.forEach(player => {

        player.scale += 0.02;

        player.image.style.transform =
            `scale(${player.scale}) rotate(${Date.now()/50}deg)`;

    });

}, 100);

const timer =
setInterval(() => {

    time--;

    timeText.textContent = time;

    if(time <= 0){

        playing = false;

        clearInterval(timer);

        clearInterval(meteorMove);

        let winner = 0;

        for(let i = 1;
            i < playerCount;
            i++){

            if(
                players[i].score >
                players[winner].score
            ){
                winner = i;
            }
        }

        message.textContent =
`ゲーム終了！
勝者:${winner + 1}P
連打数:${players[winner].score}`;
    }

}, 1000);
    </script>

</body>
</html>