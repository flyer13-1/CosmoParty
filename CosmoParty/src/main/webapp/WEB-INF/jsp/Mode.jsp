<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="モード.css">
    <title>モード選択</title>
</head>
<body>
    <h1>モード選択</h1>
    <button id="choice">選択</button>
    <button id="random">ランダム</button>
   
    <div id="difficulty">
         <p>難易度</p>
<button>Easy</button>
<button>Normal</button>
<button>Hard</button>
    </div> 
    <script>
    document.getElementById("random").addEventListener("click", function() {
           document.getElementById("difficulty").style.display = "block";})
           document.getElementById("choice").addEventListener("click", function() {
    document.getElementById("difficulty").style.display = "none";
});</script><a href="タイトル.html"><button>戻る</button></a>
    <button>次へ</button>
</body>
</html>