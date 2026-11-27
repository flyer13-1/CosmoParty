
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Menber.css">

<title>人数選択</title>

</head>

<body>

<div class="main-container">

    <div class="top-area">
        <h1>人数</h1>

        <button class="count-btn selected">1</button>
        <button class="count-btn">2</button>
        <button class="count-btn">3</button>
        <button class="count-btn">4</button>
    </div>

    <div class="player-area">

        <!-- 1P -->
        <div class="player-card">
            <div class="pad-box">

                <img id="pad1Img"
                     src="img/hello.png"
                     style="display:none;">

                <div id="pad1Text">
                    <h2>1P</h2>
                    <p>コントローラー<br>接続状態</p>
                </div>

            </div>

            <div class="player-name">
                1P
            </div>
        </div>

        <!-- 2P -->
        <div class="player-card">
            <div class="pad-box">
                <h2>2P</h2>
                <p>コントローラー<br>接続状態</p>
            </div>

            <div class="player-name">
                2P
            </div>
        </div>

        <!-- 3P -->
        <div class="player-card">
            <div class="pad-box">
                <h2>3P</h2>
                <p>コントローラー<br>接続状態</p>
            </div>

            <div class="player-name">
                3P
            </div>
        </div>

        <!-- 4P -->
        <div class="player-card">
            <div class="pad-box">
                <h2>4P</h2>
                <p>コントローラー<br>接続状態</p>
            </div>

            <div class="player-name">
                4P
            </div>
        </div>

    </div>

    <div class="bottom-area">
		
		<button type="button"
		        class="menu-btn"
		        onclick="history.back();">
		    戻る
		</button>
					
        <button class="menu-btn">次へ</button>
    </div>

</div>

<script>

function updatePads(){

    const pads = navigator.getGamepads();

    const pad1Img =
        document.getElementById("pad1Img");

    const pad1Text =
        document.getElementById("pad1Text");

    if(pads[0]){

        pad1Img.style.display="block";
        pad1Text.style.display="none";

    }else{

        pad1Img.style.display="none";
        pad1Text.style.display="block";

    }

    requestAnimationFrame(updatePads);
}

updatePads();

</script>

</body>
</html>