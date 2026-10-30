package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Player;

public class player extends base{

	//アカウント登録
	protected boolean insert(Player player) {
		boolean success =false;
		
		try {
			connect();

			final String sql = """
					INSERT INTO players (name,password,color)
						VALUE(?,?,?);
					""";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, player.getName());
			ps.setString(2, player.getPass());
			ps.setInt(3, player.getColor());

			//結果を取得
			int rs = ps.executeUpdate();

			if (rs>0) {
				success=true;
			}

		} catch (SQLException e) {
			System.out.println("SQL関係のエラーです");
			e.printStackTrace();
			success =false;

		} catch (ClassNotFoundException e) {
			System.out.println("クラス指定を間違えています。");
			e.printStackTrace();
			success =false;
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
	
	//アカウント検索
	protected Player find(Player player) {
		Player result = null;

		try {
			connect();

			final String sql = """
					SELECT * FROM players
						WHERE name = ? AND password = ?
					""";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, player.getName());
			ps.setString(2, player.getPass());

			//結果を取得
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				result=new Player();
				
				result.setName(rs.getString("name"));
				result.setColor(rs.getInt("color"));

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
