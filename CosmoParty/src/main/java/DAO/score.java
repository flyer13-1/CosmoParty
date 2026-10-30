package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Score;

public class score extends base {

	protected boolean insert(Score score) {
		boolean success = false;

		try {
			connect();

			final String sql = """
					INSERT INTO score (game_id,level_id,score,player)
						VALUE(?,?,?,?);
					""";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, score.getGameId());
			ps.setInt(2, score.getLvId());
			ps.setInt(3, score.getScore());
			ps.setString(4, score.getPlayer());

			//結果を取得
			int rs = ps.executeUpdate();

			if (rs > 0) {
				success = true;
			}

		} catch (SQLException e) {
			System.out.println("SQL関係のエラーです");
			e.printStackTrace();
			success = false;

		} catch (ClassNotFoundException e) {
			System.out.println("クラス指定を間違えています。");
			e.printStackTrace();
			success = false;
		} finally {
			try {
				this.disConnect();
			} catch (SQLException e) {
				System.out.println("dBを閉じることを失敗しました");
				e.printStackTrace();

			}

		}

		return success;
	}

	protected ArrayList<Score> find() {
		ArrayList<Score> result =new  ArrayList<Score>();

		try {
			connect();

			final String sql = """
					SELECT
					  g.name   AS gnm,   -- ゲーム名 (game.name)
					  l.name   AS lnm,   -- 難易度名 (level.name)
					  r.rk,              -- ゲーム×難易度内の順位
					  r.player,          -- プレイヤー名 (score.player = players.name)
					  p.color  AS clr,   -- アバターカラー番号 (players.color)
					  r.score,           -- スコア (score.score)
					  r.created_at       -- 記録日時 (score.created_at)
					FROM (
					  -- ① score表の各行に「ゲーム×難易度ごとの順位」を振る
					  SELECT
					    s.id,
					    s.game_id,
					    s.level_id,
					    s.player,
					    s.score,
					    s.created_at,
					    ROW_NUMBER() OVER (
					      PARTITION BY s.game_id, s.level_id        -- ゲーム＋難易度でグループ分け
					      ORDER BY s.score DESC,                     -- スコアの高い順
					               s.created_at ASC,                 -- 同点なら先に出した人が上
					               s.id ASC                          -- それでも同じならid順で順位を確定
					    ) AS rk
					  FROM score s
					) r
					-- ② 名前や色を出すために game / level / players を結合
					JOIN game    g ON g.id   = r.game_id    -- score.game_id  → game.id
					JOIN level   l ON l.id   = r.level_id   -- score.level_id → level.id
					JOIN players p ON p.name = r.player     -- score.player   → players.name ('guest'行もここで結合される)
					-- ③ 各グループの上位10件だけ残す
					WHERE r.rk <= 10
					-- ④ ゲーム昇順 → 難易度昇順 → 順位順
					ORDER BY g.id ASC, l.id ASC, r.rk ASC;
										""";

			PreparedStatement ps = con.prepareStatement(sql);

			// 結果を取得
			ResultSet rs = ps.executeQuery();

			// ランキングは複数行返るので while で全行を回す (if だと1行しか読めない)
			while (rs.next()) {
				Score sc = new Score();                          // 1行 = 1Bean

				sc.setGameId(rs.getInt("gid"));                  // ゲームID (SQLの g.id AS gid)
				sc.setLvId(rs.getInt("lid"));                    // 難易度ID (SQLの l.id AS lid)
				sc.setGameName(rs.getString("gnm"));             // ゲーム名
				sc.setLvName(rs.getString("lnm"));               // 難易度名
				sc.setRank(rs.getInt("rk"));                     // グループ内の順位
				sc.setPlayer(rs.getString("player"));            // プレイヤー名 (score.player)
				sc.setColor(rs.getInt("clr"));                   // アバターカラー番号
				sc.setScore(rs.getInt("score"));                 // スコア値
				sc.setCreatedAt(rs.getTimestamp("created_at"));  // 記録日時

				result.add(sc);                                  // ORDER BY の順のまま追加
			}

		} catch (SQLException e) {
			System.out.println("SQL関係のエラーです");
			e.printStackTrace();
			result = null;

		} catch (ClassNotFoundException e) {
			System.out.println("クラス指定を間違えています。");
			e.printStackTrace();
			result = null;
		} finally {

			try {
				this.disConnect();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return result;
	}

}
