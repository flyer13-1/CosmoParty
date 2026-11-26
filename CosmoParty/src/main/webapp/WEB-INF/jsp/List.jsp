
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ゲーム選択</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        background-color: #f5f5f5;
        font-family: "Meiryo", "Yu Gothic", sans-serif;
    }

    /* ゲーム選択画面全体 */
    .game-screen {
        width: 100%;
        max-width: 710px;
        min-height: 400px;
        margin: 20px auto;
        padding: 20px 45px 18px;
        background-color: #102B43;
        border: 4px solid #000;
        color: white;
    }

    /* タイトル */
    .screen-title {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 15px;
        padding-bottom: 10px;
        border-bottom: 1px solid #ddd;
    }

    /* ゲーム一覧 */
    .game-list {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 12px;
        margin: 10px 35px 18px;
    }

    /* ゲーム選択カード */
    .game-card {
        height: 118px;
        background-color: #e5e5e5;
        color: #111;
        border-radius: 20px;
        border: 2px solid transparent;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    /* 選択状態 */
    .game-card.selected {
        border: 4px solid #FF803C;
    }

    /* アイコン部分 */
    .game-icon {
        font-size: 13px;
        color: #52687a;
        margin-bottom: 10px;
    }

    /* ゲーム名 */
    .game-name {
        font-size: 18px;
        font-weight: bold;
    }

    /* 戻るボタン */
    .back-button {
        display: inline-block;
        width: 102px;
        height: 40px;
        margin-top: 0;
        border-radius: 8px;
        background-color: white;
        color: #102B43;
        font-size: 16px;
        font-weight: bold;
        text-align: center;
        line-height: 40px;
        text-decoration: none;
    }

    /* 画面が小さい場合 */
    @media screen and (max-width: 600px) {
        .game-screen {
            padding: 20px;
        }

        .game-list {
            margin: 10px 0 18px;
            gap: 8px;
        }

        .game-card {
            height: 100px;
        }

        .game-name {
            font-size: 14px;
        }
    }
</style>
</head>

<body>

<div class="game-screen">

    <!-- タイトル -->
    <div class="screen-title">
        ゲーム選択
    </div>

    <!-- ゲーム一覧 -->
    <div class="game-list">

        <div class="game-card selected">
            <div class="game-icon">icon</div>
            <div class="game-name">連打</div>
        </div>

        <div class="game-card">
            <div class="game-icon">icon</div>
            <div class="game-name">心理戦</div>
        </div>

        <div class="game-card">
            <div class="game-icon">icon</div>
            <div class="game-name">障害物避け</div>
        </div>

        <div class="game-card">
            <div class="game-icon">icon</div>
            <div class="game-name">チキンレース</div>
        </div>

        <div class="game-card">
            <div class="game-icon">icon</div>
            <div class="game-name">早打ち勝負</div>
        </div>

        <div class="game-card">
            <div class="game-icon">icon</div>
            <div class="game-name">二者択一</div>
        </div>

    </div>

    <!-- 戻るボタン -->
    <a href="#" class="back-button">戻る</a>

</div>

</body>
</html>
