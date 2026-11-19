<%-- 文字コードをUTF-8にする --%>
	<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<!DOCTYPE html>
		<html lang="ja">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>プレイヤー登録</title>

			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SignUp.css">

			<style>
				input[type="radio"] {
					display: none;
				}
			</style>
		</head>

		<body>

			<div class="register-container">

				<h1>プレイヤー登録</h1>

				<!-- プレイヤー名 -->
				<div class="form-row">
					<div class="input-area">
						<label for="playerName">プレイヤー名</label> <input type="text" id="playerName" placeholder="name">
						<span class="error-message" id="nameError"></span>
					</div>
				</div>

				<!-- パスワード -->
				<div class="form-row">
					<div class="input-area">
						<label for="password">パスワード</label> <input type="password" id="password" placeholder="••••••">
						<span class="error-message" id="passwordError"></span>
					</div>
				</div>

				<!-- パスワード再入力 -->
				<div class="form-row">
					<div class="input-area">

						<label for="confirmPassword"> パスワード（再度入力） </label> <input type="password" id="confirmPassword"
							placeholder="••••••">

						<span class="error-message" id="passwordMatchError"> </span>

					</div>
				</div>

				<!-- アバターカラー -->
				<div class="form-row">
					<div class="input-area">

						<div class="label-line">
							<label>アバターカラー</label> <span class="error-message" id="colorError">
							</span>
						</div>

						<div class="color-list">

							<div class="color-option" data-color="#ff6b6b" style="background: #ff6b6b;">
								<label class="a"> <input type="radio" name="avatarColor" value="01"> <span
										style="background: #ff6b6b;"></span>
								</label>
							</div>
							<div class="color-option" data-color="#ff944d" style="background: #ff944d;">
								<label> <input type="radio" name="avatarColor" value="02"> <span
										style="background: #ff944d;"></span>
								</label>
							</div>
							<div class="color-option" data-color="#ffd43b" style="background: #ffd43b;">
								<label> <input type="radio" name="avatarColor" value="03"> <span
										style="background: #ffd43b;"></span>
								</label>
							</div>
							<div class="color-option" data-color="#a9e34b" style="background: #a9e34b;">
								<label> <input type="radio" name="avatarColor" value="04"> <span
										style="background: #a9e34b;"></span>
								</label>
							</div>
							<div class="color-option" data-color="#69db7c" style="background: #69db7c;">
								<label> <input type="radio" name="avatarColor" value="05"> <span
										style="background: #69db7c;"></span>
								</label>
							</div>
							<div class="color-option" data-color="#38d9a9" style="background: #38d9a9;">
								<label> <input type="radio" name="avatarColor" value="06"> <span
										style="background: #38d9a9;"></span>
								</label>
							</div>
							<div class="color-option" data-color="#66d9ff" style="background: #66d9ff;">
								<label> <input type="radio" name="avatarColor" value="07"> <span
										style="background: #66d9ff;"></span>
								</label>
							</div>
							<div class="color-option" data-color="#5c7cfa" style="background: #5c7cfa;">
								<label> <input type="radio" name="avatarColor" value="08"> <span
										style="background: #5c7cfa;"></span>
								</label>
							</div>
							<div class="color-option" data-color="#9775fa" style="background: #9775fa;">
								<label> <input type="radio" name="avatarColor" value="09"> <span
										style="background: #9775fa;"></span>
								</label>
							</div>
							<div class="color-option" data-color="#f065c2" style="background: #f065c2;">
								<label> <input type="radio" name="avatarColor" value="10"> <span
										style="background: #f065c2;"></span>
								</label>
							</div>

						</div>

					</div>
				</div>

				<!-- 登録ボタン -->
				<div class="form-row">
					<button id="registerBtn" class="register-btn" data-url="${pageContext.request.contextPath}/SignUp">
						登録する
					</button>
				</div>

				<!-- 戻るボタン -->
				<div class="back-area">
					<a href="${pageContext.request.contextPath}/TitleCon" class="back-link"> ← 戻る </a>
				</div>

			</div>

			<script src="${pageContext.request.contextPath}/js/SignUp.js"></script>

		</body>

		</html>