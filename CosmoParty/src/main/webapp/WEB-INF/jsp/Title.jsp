<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="タイトル.css">
    <title>Cosmo Party</title>
</head>
<body> <div id="message">
     <h1 id="title">Cosmo PartyⅡ</h1>  
   
       <p id="start">ボタンを押してください</p>
        </div>
        <div id="menu"><a href="モード.html">
<button id="ゲームスタート">モード選択</button>
</a>
    <button id="ユーザ登録">ユーザー登録</button>
    <button id="スコア">スコア</button>
    <button id="設定">設定</button>
    <button id="終了">終了</button></div>
           <script>
        document.addEventListener("keydown", function () {
            document.getElementById("start").style.display = "none";
             document.getElementById("title").style.transform = "translateX(-200px)  rotate(365deg)";
             document.getElementById("menu").style.display = "block";
        });
    </script>
</body>
</html>