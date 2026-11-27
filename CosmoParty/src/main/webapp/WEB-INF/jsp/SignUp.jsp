<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>プレイヤー登録</title>

<!--    <link rel="stylesheet"-->
<!--          href="${pageContext.request.contextPath}/css/SignUp.css">-->
<style>
/* ================================
   全体
================================ */
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #1c1e3b;
	font-family: "Noto Sans JP", "Meiryo", sans-serif;
	color: white;
}

/* ================================
   タイトル
================================ */
h1 {
	margin: 0 0 20px;
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	color: #f5f5ff;
}

/* ================================
   入力項目
================================ */
.form-group {
	margin-bottom: 12px;
}

.form-group>label {
	display: block;
	margin-bottom: 5px;
	font-size: 13px;
	color: #a5a8c3;
}

/* テキスト・パスワード入力 */
.form-group input[type="text"], .form-group input[type="password"] {
	display: block;
	width: 100%;
	height: 40px;
	padding: 10px;
	border: 1px solid #c5c5d5;
	border-radius: 7px;
	background-color: #f5f5ff;
	font-size: 14px;
	color: #1c1e3b;
	outline: none;
}

/* フォーカス時 */
.form-group input[type="text"]:focus, .form-group input[type="password"]:focus
	{
	border: 2px solid #f45b70;
}

/* ================================
   アバターカラー
================================ */
.color-group {
	margin-top: 15px;
	margin-bottom: 20px;
}

.color-list {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 8px;
	width: 100%;
	margin-top: 10px;
}

/* ラジオボタンを囲むラベル */
.color-option {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 35px;
	height: 35px;
	flex-shrink: 0;
	margin: 0;
	cursor: pointer;
}

/* ラジオボタン本体を非表示 */
.color-option input[type="radio"] {
	display: none;
}

/* カラーの丸 */
.color-circle {
	display: block;
	width: 35px;
	height: 35px;
	border-radius: 50%;
	background-color: var(--avatar-color);
	border: 3px solid transparent;
	transition: transform 0.2s, border 0.2s;
}

/* 選択時 */
.color-option input[type="radio"]:checked+.color-circle {
	border: 3px solid white;
	transform: scale(1.15);
}

/* カーソルを合わせたとき */
.color-option:hover .color-circle {
	transform: scale(1.1);
}

/* 選択時の拡大を維持 */
.color-option input[type="radio"]:checked+.color-circle:hover {
	transform: scale(1.15);
}

/* ================================
   エラーメッセージ
================================ */
.error-message {
	min-height: 0;
	margin: 4px 0 0;
	font-size: 12px;
	color: #ff626c;
}

/* ================================
   登録ボタン
================================ */
.register-btn {
	display: block;
	width: 100%;
	height: 42px;
	margin-top: 10px;
	border: none;
	border-radius: 7px;
	background-color: #f45b70;
	color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.2s, transform 0.1s;
}

/* ホバー時 */
.register-btn:hover {
	background-color: #ff7486;
}

/* 押下時 */
.register-btn:active {
	transform: scale(0.98);
}

/* ================================
   戻るリンク
================================ */
.back-link {
	display: inline-block;
	margin-top: 15px;
	color: #a5a8c3;
	font-size: 13px;
	text-decoration: none;
}

/* ホバー時 */
.back-link:hover {
	color: white;
}
</style>
</head>

<body>

	<main class="register-container">

		<h1>プレイヤー登録</h1>

		<!-- 登録フォーム -->
		<form action="${pageContext.request.contextPath}/SignUp" method="post">

			<!-- プレイヤー名 -->
			<div class="form-group">

				<label for="playerName">プレイヤー名</label> <input type="text"
					id="playerName" name="playerName" placeholder="name" maxlength="20"
					autocomplete="off" required>

				<p class="error-message">${nameError}</p>

			</div>


			<!-- パスワード -->
			<div class="form-group">

				<label for="password">パスワード</label> <input type="password"
					id="password" name="password" placeholder="●●●●●●"
					autocomplete="new-password" required>

				<p class="error-message">${passwordError}</p>

			</div>


			<!-- パスワード再入力 -->
			<div class="form-group">

				<label for="confirmPassword"> パスワード（再度入力） </label> <input
					type="password" id="confirmPassword" name="confirmPassword"
					placeholder="●●●●●●" autocomplete="new-password" required>

				<p class="error-message">${passwordMatchError}</p>

			</div>


			<!-- アバターカラー -->
			<div class="form-group color-group">

				<label>アバターカラー</label>

				<div class="color-list">

					<label class="color-option"> <input type="radio"
						name="color" value="1" required> <span
						class="color-circle" style="--avatar-color: #ff626c;"></span>
					</label> <label class="color-option"> <input type="radio"
						name="color" value="2"> <span class="color-circle"
						style="--avatar-color: #ff914d;"></span>
					</label> <label class="color-option"> <input type="radio"
						name="color" value="3"> <span class="color-circle"
						style="--avatar-color: #ffd43b;"></span>
					</label> <label class="color-option"> <input type="radio"
						name="color" value="4"> <span class="color-circle"
						style="--avatar-color: #a9e34b;"></span>
					</label> <label class="color-option"> <input type="radio"
						name="color" value="5"> <span class="color-circle"
						style="--avatar-color: #69db7c;"></span>
					</label> <label class="color-option"> <input type="radio"
						name="color" value="6"> <span class="color-circle"
						style="--avatar-color: #38d9a9;"></span>
					</label> <label class="color-option"> <input type="radio"
						name="color" value="7"> <span class="color-circle"
						style="--avatar-color: #66d9ff;"></span>
					</label> <label class="color-option"> <input type="radio"
						name="color" value="8"> <span class="color-circle"
						style="--avatar-color: #5c7cfa;"></span>
					</label> <label class="color-option"> <input type="radio"
						name="color" value="9"> <span class="color-circle"
						style="--avatar-color: #9775fa;"></span>
					</label> <label class="color-option"> <input type="radio"
						name="color" value="10"> <span class="color-circle"
						style="--avatar-color: #f065c2;"></span>
					</label>

				</div>

				<p class="error-message">${colorError}</p>

			</div>


			<!-- 登録ボタン -->
			<div class="form-row">

				<button type="submit" class="register-btn">登録する</button>

			</div>

		</form>


		<!-- 戻る -->
		<div class="back-area">

			<a href="${pageContext.request.contextPath}/TitleCon"
				class="back-link"> ← 戻る </a>

		</div>

	</main>

<!--	<script>-->
<!--		// カラー選択-->
<!--		var colorOptions = document.querySelectorAll(-->
<!--		    'input[name="avatarColor"]'-->
<!--		);-->

<!--		var selectedColor = null;-->

<!--		colorOptions.forEach(function(color) {-->
<!--		    color.addEventListener('change', function() {-->
<!--		        selectedColor = Number(color.value);-->
<!--		    });-->
<!--		});-->


<!--		// 登録ボタン-->
<!--		document.getElementById("registerBtn")-->
<!--		    .addEventListener("click", async function() {-->

<!--		        var name = document.getElementById("playerName").value.trim();-->
<!--		        var password = document.getElementById("password").value;-->
<!--		        var confirmPassword = document.getElementById("confirmPassword").value;-->

<!--		        // エラー初期化-->
<!--		        document.getElementById("nameError").textContent = "";-->
<!--		        document.getElementById("passwordError").textContent = "";-->
<!--		        document.getElementById("passwordMatchError").textContent = "";-->
<!--		        document.getElementById("colorError").textContent = "";-->

<!--		        var valid = true;-->

<!--		        // プレイヤー名-->
<!--		        if (name === "") {-->
<!--		            document.getElementById("nameError").textContent =-->
<!--		                "プレイヤー名を入力してください";-->
<!--		            valid = false;-->
<!--		        }-->

<!--		        // パスワード-->
<!--		        if (password === "") {-->
<!--		            document.getElementById("passwordError").textContent =-->
<!--		                "パスワードを入力してください";-->
<!--		            valid = false;-->
<!--		        }-->

<!--		        // パスワード一致確認-->
<!--		        if (confirmPassword === "") {-->
<!--		            document.getElementById("passwordMatchError").textContent =-->
<!--		                "再入力してください";-->
<!--		            valid = false;-->
<!--		        } else if (password !== confirmPassword) {-->
<!--		            document.getElementById("passwordMatchError").textContent =-->
<!--		                "パスワードが一致しません";-->
<!--		            valid = false;-->
<!--		        }-->

<!--		        // カラー未選択-->
<!--		        if (selectedColor === null) {-->
<!--		            document.getElementById("colorError").textContent =-->
<!--		                "カラーを選択してください";-->
<!--		            valid = false;-->
<!--		        }-->

<!--		        // 入力エラーがあれば終了-->
<!--		        if (!valid) {-->
<!--		            return;-->
<!--		        }-->

<!--		        // サーブレットに送るデータ-->
<!--		        var userData = new URLSearchParams();-->

<!--		        userData.append("playerName", name);-->
<!--		        userData.append("password", password);-->
<!--		        userData.append("color", selectedColor);-->

<!--		        try {-->
<!--		            // サーブレットへ送信-->
<!--		            var response = await fetch(-->
<!--		                document.getElementById("registerBtn").dataset.url,-->
<!--		                {-->
<!--		                    method: "POST",-->
<!--		                    headers: {-->
<!--		                        "Content-Type": "application/x-www-form-urlencoded"-->
<!--		                    },-->
<!--		                    body: userData.toString()-->
<!--		                }-->
<!--		            );-->

<!--		            if (!response.ok) {-->
<!--		                throw new Error("HTTPエラー: " + response.status);-->
<!--		            }-->

<!--		            var result = await response.json();-->

<!--		            if (result.success) {-->
<!--		                alert("登録成功");-->
<!--		            } else {-->
<!--		                alert(result.message || "登録失敗");-->
<!--		            }-->

<!--		        } catch (error) {-->
<!--		            console.error(error);-->
<!--		            alert("サーバー接続エラー");-->
<!--		        }-->
<!--		    });</script>-->

</body>

</html>