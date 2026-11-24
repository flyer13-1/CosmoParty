<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html lang="ja">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>プレイヤー登録</title>

		  <link rel="stylesheet"
		        href="${pageContext.request.contextPath}/css/SignUp.css">
		
	</head>

	<body>

    <div class="page-layout">

        <!-- キャラクター表示 -->
        <div class="character-area">

           <img
    id="characterImage"
    src=""
    alt="キャラクター"
    style="display:none;">

        </div>

        <!-- 登録画面 -->
        <main class="register-container">

            <h1>プレイヤー登録</h1>

            <!-- プレイヤー名 -->
            <div class="form-group">

                <label for="playerName">プレイヤー名</label>

                <input
                    type="text"
                    id="playerName"
                    placeholder="name"
                    maxlength="20"
                    autocomplete="off">

                <p id="nameError" class="error-message"></p>

            </div>

            <!-- パスワード -->
            <div class="form-group">

                <label for="password">パスワード</label>

                <input
                    type="password"
                    id="password"
                    placeholder="●●●●●●"
                    autocomplete="new-password">

                <p id="passwordError" class="error-message"></p>

            </div>

            <!-- パスワード再入力 -->
            <div class="form-group">

                <label for="confirmPassword">
                    パスワード（再度入力）
                </label>

                <input
                    type="password"
                    id="confirmPassword"
                    placeholder="●●●●●●"
                    autocomplete="new-password">

                <p id="passwordMatchError"
                   class="error-message"></p>

            </div>

            <!-- カラー -->
            <div class="form-group color-group">

                <label>アバターカラー</label>

                <div class="color-list">

                    <label class="color-option">
                        <input type="radio"
                               name="avatarColor"
                               value="1">
                        <span class="color-circle"
                              style="--avatar-color:#ff626c;"></span>
                    </label>

                    <label class="color-option">
                        <input type="radio"
                               name="avatarColor"
                               value="2">
                        <span class="color-circle"
                              style="--avatar-color:#ff914d;"></span>
                    </label>

                    <label class="color-option">
                        <input type="radio"
                               name="avatarColor"
                               value="3">
                        <span class="color-circle"
                              style="--avatar-color:#ffd43b;"></span>
                    </label>

                    <label class="color-option">
                        <input type="radio"
                               name="avatarColor"
                               value="4">
                        <span class="color-circle"
                              style="--avatar-color:#a9e34b;"></span>
                    </label>

                    <label class="color-option">
                        <input type="radio"
                               name="avatarColor"
                               value="5">
                        <span class="color-circle"
                              style="--avatar-color:#69db7c;"></span>
                    </label>

                    <label class="color-option">
                        <input type="radio"
                               name="avatarColor"
                               value="6">
                        <span class="color-circle"
                              style="--avatar-color:#38d9a9;"></span>
                    </label>

                    <label class="color-option">
                        <input type="radio"
                               name="avatarColor"
                               value="7">
                        <span class="color-circle"
                              style="--avatar-color:#66d9ff;"></span>
                    </label>

                    <label class="color-option">
                        <input type="radio"
                               name="avatarColor"
                               value="8">
                        <span class="color-circle"
                              style="--avatar-color:#5c7cfa;"></span>
                    </label>

                    <label class="color-option">
                        <input type="radio"
                               name="avatarColor"
                               value="9">
                        <span class="color-circle"
                              style="--avatar-color:#9775fa;"></span>
                    </label>

                    <label class="color-option">
                        <input type="radio"
                               name="avatarColor"
                               value="10">
                        <span class="color-circle"
                              style="--avatar-color:#f065c2;"></span>
                    </label>

                </div>

                <p id="colorError"
                   class="error-message"></p>

            </div>

            <!-- 登録 -->
            <button
    type="button"
    id="registerBtn"
    class="register-btn"
    data-url="${pageContext.request.contextPath}/SignUp">

    登録する

</button>
            <!-- 戻る -->
            <div class="back-area">

                <a href="${pageContext.request.contextPath}/TitleCon"
                   class="back-link">

                    ← 戻る

                </a>

            </div>

        </main>

    </div>

    <script src="${pageContext.request.contextPath}/js/SignUp.js"></script>

</body>

	</html>