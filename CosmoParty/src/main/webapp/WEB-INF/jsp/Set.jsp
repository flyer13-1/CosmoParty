<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="設定.css">
    <title>設定</title>+
</head>

<body>
    

<h1>設定</h1>
<p>言語</p>
<button>日本語</button>
<button>Engllish</button>
<button>عربي</button>
<br>
<audio id="bgm" src="music.mp3" autoplay loop></audio>
<label for="volume">音量</label>
<input type="range" id="volume" min="0" max="100" value="50">

<script>
const bgm = document.getElementById("bgm");
const volume = document.getElementById("volume");

bgm.volume = 0.5;

volume.addEventListener("input", () => {
    bgm.volume = volume.value / 100;
});
</script>
<br>
<button>戻る</button>

    
</body>
</html>