package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.GameJb;

public class game extends base {
	protected ArrayList<GameJb> find() {
		ArrayList<GameJb> list = new ArrayList<GameJb>();

		try {
			connect();

			final String sql = """
					SELECT * FROM game
					""";

			PreparedStatement ps = con.prepareStatement(sql);

			//結果を取得
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				GameJb game = new GameJb();
				game.setId(rs.getInt("id"));
				game.setName(rs.getString("name"));

				list.add(game);
			}

		} catch (SQLException e) {
			System.out.println("SQL関係のエラーです");
			e.printStackTrace();
			list = null;

		} catch (ClassNotFoundException e) {
			System.out.println("クラス指定を間違えています。");
			e.printStackTrace();
			list = null;
		} finally {

			try {
				this.disConnect();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return list;
	}
}
