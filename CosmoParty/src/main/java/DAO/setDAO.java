package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.SetJb;

public class setDAO extends base{
	//設定記録
	public boolean insert(SetJb set) {
		boolean success =false;
		
		try {
			connect();

			final String sql = """
					INSERT INTO setings (name,lang,vol)
						VALUE(?,?,?);
					""";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, set.getName());
			ps.setString(2, set.getLang());
			ps.setInt(3, set.getVol());

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
	
	//設定記録確認
	public SetJb find(SetJb set) {
		SetJb result = null;

		try {
			connect();

			final String sql = """
					SELECT * FROM settings
						WHERE name = ?
					""";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, set.getName());

			//結果を取得
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				result=new SetJb();
				
				result.setName(rs.getString("name"));
				result.setLang(rs.getString("lang"));
				result.setVol(rs.getInt("vol"));

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
