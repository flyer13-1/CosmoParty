<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="ja">

	<head>
		<meta charset="UTF-8">
		<title>ハイスコア</title>

		<style>
			* {
				box-sizing: border-box;
			}

			body {
				margin: 0;
				width: 100vw;
				height: 100vh;
				background-color: #f5f5f5;
				font-family: "Meiryo", "Yu Gothic", sans-serif;
			}

			/* 画面全体 */
			.score-screen {
				width: 100vw;
				height: 100vh;
				background-color: #102B43;
				border: 3px solid #000;
				color: white;
				display: flex;
			}

			/* 左側：ゲーム選択 */
			.left-panel {
				width: 30%;
				padding: 35px;
				border-right: 1px solid #ccc;
				display: flex;
				flex-direction: column;
				justify-content: space-between;
			}

			/* ゲームボタン一覧 */
			.game-buttons {
				display: flex;
				flex-direction: column;
				gap: 15px;
			}

			/* ゲームボタン */
			.game-button {
				width: 100%;
				height: 60px;
				background-color: #fff;
				color: #102B43;
				border: 2px solid transparent;
				border-radius: 10px;
				font-size: 22px;
				font-weight: bold;
				cursor: pointer;
			}

			/* カーソルが合っているボタン */
			.game-button.focused,
			.difficulty-button.focused,
			.back-button.focused {
				border: 3px solid #FF803C;
			}

			/* 戻るボタン */
			.back-button {
				width: 140px;
				height: 55px;
				background-color: #fff;
				color: #102B43;
				border: none;
				border-radius: 10px;
				font-size: 22px;
				font-weight: bold;
				cursor: pointer;
			}

			/* 右側：スコア */
			.right-panel {
				flex: 1;
				padding: 35px;
				min-width: 0;
			}

			/* タイトル */
			.score-title {
				height: 70px;
				text-align: center;
				font-size: 35px;
				font-weight: bold;
				border-bottom: 1px solid #ccc;
				margin-bottom: 20px;
			}

			/* 難易度ボタン */
			.difficulty-buttons {
				display: flex;
				justify-content: space-between;
				gap: 20px;
				margin-bottom: 25px;
			}

			.difficulty-button {
				flex: 1;
				height: 55px;
				background-color: #fff;
				color: #102B43;
				border: 2px solid transparent;
				border-radius: 10px;
				font-size: 22px;
				font-weight: bold;
				cursor: pointer;
			}

			/* ランキング表 */
			.ranking-table {
				width: 100%;
				border-collapse: collapse;
				table-layout: fixed;
				text-align: center;
				font-size: 22px;
			}

			.ranking-table th {
				color: #FF803C;
				font-weight: bold;
				border-bottom: 1px solid #888;
				padding: 15px 5px;
				height: 60px;
			}

			.ranking-table td {
				height: auto;
				padding: 8px 5px;
				color: #ddd;
			}

			/* 列の区切り */
			.ranking-table th:not(:last-child),
			.ranking-table td:not(:last-child) {
				border-right: 1px solid #aaa;
			}

			/* 列の幅 */
			.ranking-table th:first-child,
			.ranking-table td:first-child {
				width: 18%;
			}

			.ranking-table th:nth-child(2),
			.ranking-table td:nth-child(2) {
				width: 24%;
			}

			.ranking-table th:nth-child(3),
			.ranking-table td:nth-child(3) {
				width: 27%;
			}

			.ranking-table th:nth-child(4),
			.ranking-table td:nth-child(4) {
				width: 31%;
			}

			/* 小さい画面向け */
			@media screen and (max-width: 620px) {
				.score-screen {
					height: auto;
					min-height: 342px;
				}

				.left-panel {
					width: 175px;
					padding-left: 10px;
					padding-right: 10px;
				}

				.game-button {
					width: 100%;
				}

				.right-panel {
					padding: 15px 10px;
				}

				.score-title {
					font-size: 19px;
				}

				.ranking-table {
					font-size: 11px;
				}
			}

			/* 操作していない側を薄暗くする */
			.inactive-panel {
				opacity: 0.4;
				transition: opacity 0.3s ease;
			}

			/* 操作している側 */
			.active-panel {
				opacity: 1;
				transition: opacity 0.3s ease;
			}
		</style>
	</head>

	<body>

		<div class="score-screen">

			<!-- 左側 -->
			<div class="left-panel" id="leftPanel">

				<div class="game-buttons">

					<button type="button" class="game-button focused" data-game="0">
						連打</button>

					<button type="button" class="game-button" data-game="1">
						心理戦</button>

					<button type="button" class="game-button" data-game="2">
						障害物避け</button>

					<button type="button" class="game-button" data-game="3">
						チキンレース</button>

					<button type="button" class="game-button" data-game="4">
						早打ち勝負</button>

					<button type="button" class="game-button" data-game="5">
						二者択一</button>

				</div>

				<button type="button" class="back-button" id="backButton">
					戻る</button>

			</div>


			<!-- 右側 -->
			<div class="right-panel" id="rightPanel">

				<!-- タイトル -->
				<div class="score-title">ハイスコア</div>

				<!-- 難易度 -->
				<div class="difficulty-buttons">

					<button type="button" class="difficulty-button" data-difficulty="0">
						easy</button>

					<button type="button" class="difficulty-button" data-difficulty="1">
						normal</button>

					<button type="button" class="difficulty-button" data-difficulty="2">
						hard</button>

				</div>

				<!-- ランキング -->
				<table class="ranking-table">

					<thead>
						<tr>
							<th>順位</th>
							<th>スコア</th>
							<th>ユーザ名</th>
							<th>日付</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>1</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td>2</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td>3</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td>4</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td>5</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td>6</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td>7</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td>8</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td>9</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td>10</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>

				</table>

			</div>

		</div>

	</body>

	<script>
		document.addEventListener("DOMContentLoaded", function () {

			// ゲーム一覧
			const gameButtons = document.querySelectorAll(".game-button");

			// 難易度一覧
			const difficultyButtons = document.querySelectorAll(".difficulty-button");

			// 戻るボタン
			const backButton = document.getElementById("backButton");

			const leftPanel = document.getElementById("leftPanel");
			const rightPanel = document.getElementById("rightPanel");


			// ゲーム名
			const gameNames = [
				"連打",
				"心理戦",
				"障害物避け",
				"チキンレース",
				"早打ち勝負",
				"二者択一"
			];

			// 難易度名
			const difficultyNames = [
				"easy",
				"normal",
				"hard"
			];


			// 現在のカーソル位置
			let gameIndex = 0;
			let difficultyIndex = 0;

			// 操作モード
			// game       : ゲーム選択中
			// difficulty : 難易度選択中
			// back       : 戻るボタン選択中
			let currentMode = "game";


			// カーソル表示を更新する
			function updateCursor() {
				// すべてのカーソル枠を一度解除
				gameButtons.forEach(button => button.classList.remove("focused"));
				difficultyButtons.forEach(button => button.classList.remove("focused"));
				backButton.classList.remove("focused");

				// ゲーム選択中
				if (currentMode === "game") {
					gameButtons[gameIndex].classList.add("focused");
				}

				// 難易度選択中
				else if (currentMode === "difficulty") {
					gameButtons[gameIndex].classList.add("focused");
				}

				// 戻るボタン選択中
				else if (currentMode === "back") {
					backButton.classList.add("focused");
				}

				// 現在選択されている難易度には常に枠を表示
				difficultyButtons[difficultyIndex].classList.add("focused");

				updatePanelBrightness();
			}


			// ランキング表示を切り替える
			function updateRanking() {

				const gameName = gameNames[gameIndex];
				const difficultyName = difficultyNames[difficultyIndex];

				// 現在選択されているゲームと難易度
				console.log("ゲーム：" + gameName);
				console.log("難易度：" + difficultyName);

				/*
				 * 今後ここにランキング切り替え処理を追加する。
				 *
				 * 例：
				 * サーバーにゲーム名と難易度を送信
				 * ↓
				 * データベースからランキングを取得
				 * ↓
				 * ランキング表を更新
				 */
			}


			// 初期表示
			updateCursor();
			updateRanking();


			// キーボード操作
			document.addEventListener("keydown", function (event) {

				const key = event.key;


				// --------------------------------
				// ゲーム一覧操作中
				// --------------------------------
				if (currentMode === "game") {

					// 上キー
					if (key === "ArrowUp") {
						event.preventDefault();

						// 一番上の場合は一番下へ移動
						if (gameIndex === 0) {
							gameIndex = gameButtons.length - 1;
						} else {
							gameIndex--;
						}

						updateCursor();
						updateRanking();
					}

					// 下キー
					else if (key === "ArrowDown") {
						event.preventDefault();

						// 一番下のゲームから下キーを押すと戻るボタンへ
						if (gameIndex === gameButtons.length - 1) {
							currentMode = "back";
						} else {
							gameIndex++;
						}

						updateCursor();
						updateRanking();
					}

					// Enterキー：難易度選択へ移動
					else if (key === "Enter") {
						event.preventDefault();

						currentMode = "difficulty";

						updateCursor();
						updateRanking();
					}

					// Escapeキー：戻るボタンへ移動
					else if (key === "Escape") {
						event.preventDefault();

						currentMode = "back";

						updateCursor();
					}

				}


				// --------------------------------
				// 難易度選択操作中
				// --------------------------------
				else if (currentMode === "difficulty") {

					// 左キー
					if (key === "ArrowLeft") {
						event.preventDefault();

						difficultyIndex--;

						if (difficultyIndex < 0) {
							difficultyIndex = difficultyButtons.length - 1;
						}

						updateCursor();
						updateRanking();
					}

					// 右キー
					else if (key === "ArrowRight") {
						event.preventDefault();

						difficultyIndex++;

						if (difficultyIndex >= difficultyButtons.length) {
							difficultyIndex = 0;
						}

						updateCursor();
						updateRanking();
					}

					// Enterキー：現在の難易度を決定
					else if (key === "Enter") {
						event.preventDefault();

						updateRanking();
					}

					// Escapeキー：ゲーム一覧に戻る
					else if (key === "Escape") {
						event.preventDefault();

						currentMode = "game";

						updateCursor();
						updateRanking();
					}

				}


				// --------------------------------
				// 戻るボタン選択中
				// --------------------------------
				// --------------------------------
				// 戻るボタン選択中
				// --------------------------------
				else if (currentMode === "back") {

					// Enterキー：戻るボタンを決定
					if (key === "Enter") {
						event.preventDefault();

						backButton.click();
					}

					// 上キー：ゲーム一覧の一番下へ戻る
					else if (key === "ArrowUp") {
						event.preventDefault();

						gameIndex = gameButtons.length - 1;
						currentMode = "game";

						updateCursor();
						updateRanking();
					}

				}

			});


			// ゲームボタンをマウスでクリックした場合
			gameButtons.forEach((button, index) => {

				button.addEventListener("click", function () {

					gameIndex = index;
					currentMode = "difficulty";

					updateCursor();
					updateRanking();

				});

			});


			// 難易度ボタンをマウスでクリックした場合
			difficultyButtons.forEach((button, index) => {

				button.addEventListener("click", function () {

					difficultyIndex = index;
					currentMode = "difficulty";

					updateCursor();
					updateRanking();

				});

			});

			function updatePanelBrightness() {
				// ゲーム選択中・戻るボタン選択中は左側を明るくする
				if (currentMode === "game" || currentMode === "back") {
					leftPanel.classList.add("active-panel");
					leftPanel.classList.remove("inactive-panel");

					rightPanel.classList.add("inactive-panel");
					rightPanel.classList.remove("active-panel");
				}

				// 難易度選択中は右側を明るくする
				else if (currentMode === "difficulty") {
					rightPanel.classList.add("active-panel");
					rightPanel.classList.remove("inactive-panel");

					leftPanel.classList.add("inactive-panel");
					leftPanel.classList.remove("active-panel");
				}
			}

		});
	</script>

	</html>