<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>人数選択</title>
  </head>
  <body>
    <h1>人数</h1>
    <button>1人</button>
    <button>2人</button>
    <button>3人</button>
    <button>4人</button>
    <br />

    <div>
      <h3>1P</h3>
      <img id="pad1Img" src="img/hello.png" width="100" style="display: none" />
    </div>

    <br />
    <button>戻る</button>
    <button>次へ</button>
    <script>
      function updatePads() {
        const pads = navigator.getGamepads();

        const pad1Img = document.getElementById("pad1Img");

        if (pads[0]) {
          pad1Img.style.display = "block";
        } else {
          pad1Img.style.display = "none";
        }

        requestAnimationFrame(updatePads);
      }

      updatePads();
    </script>
  </body>
</html>
