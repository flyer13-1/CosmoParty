CREATE TABLE `game` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `uk_game_name` (`name`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;

CREATE TABLE `level` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `uk_level_name` (`name`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=4
;

CREATE TABLE `players` (
	`name` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`password` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_general_ci',
	`color` TINYINT(3) UNSIGNED NOT NULL,
	PRIMARY KEY (`name`) USING BTREE,
	CONSTRAINT `chk_players_pw` CHECK (`name` = 'guest' or `password` regexp '(?-i)^[NESWABXY]{6,20}$')
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `score` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`game_id` INT(11) NOT NULL,
	`level_id` INT(11) NOT NULL,
	`score` INT(11) NOT NULL,
	`player` VARCHAR(30) NOT NULL DEFAULT 'guest' COLLATE 'utf8mb4_general_ci',
	`created_at` DATETIME NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `idx_rank` (`game_id`, `level_id`, `score`) USING BTREE,
	INDEX `fk_score_level` (`level_id`) USING BTREE,
	INDEX `fk_score_player` (`player`) USING BTREE,
	CONSTRAINT `fk_score_game` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `fk_score_level` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `fk_score_player` FOREIGN KEY (`player`) REFERENCES `players` (`name`) ON UPDATE CASCADE ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `settings` (
	`name` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`lang` VARCHAR(10) NOT NULL DEFAULT 'ja' COLLATE 'utf8mb4_general_ci',
	`vol` INT(11) NOT NULL DEFAULT '50',
	PRIMARY KEY (`name`) USING BTREE,
	CONSTRAINT `fk_settings_name` FOREIGN KEY (`name`) REFERENCES `players` (`name`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


-- 1. ゲスト用プレイヤー (score.player の DEFAULT 'guest' が参照するので最初に作る)
--    '!guest!' はコマンド入力できない文字なので、誰もログインできない
--    (CHECK制約は name='guest' を除外してあるので通る)
INSERT INTO players (name, password, color) VALUES ('guest', 'guest', 0);

-- 2. 設定 (guest にも設定を持たせる場合だけ。lang='ja', vol=50 の既定値が入る)
INSERT INTO settings (name) VALUES ('guest');

-- 3. 難易度 (名前は仮。実際に使う名前に直す)
INSERT INTO level (name) VALUES ('easy'), ('normal0'), ('hard');

-- 4. ゲーム名 (gameConf.md の8本。作らないものは消す)
INSERT INTO game (name) VALUES
  ('連打');