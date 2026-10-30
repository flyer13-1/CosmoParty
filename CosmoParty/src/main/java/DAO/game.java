package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Game;

public class game extends base {
	protected ArrayList<Game> find() {
		ArrayList<Game> list = new ArrayList<Game>();

		try {
			connect();

			final String sql = """
					SELECT * FROM game
					""";

			PreparedStatement ps = con.prepareStatement(sql);

			//結果を取得
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				Game game = new Game();
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
