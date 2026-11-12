package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.LvJb;


public class lv extends base{

	protected ArrayList<LvJb> find() {
		ArrayList<LvJb> list = new ArrayList<LvJb>();

		try {
			connect();

			final String sql = """
					SELECT * FROM level
					""";

			PreparedStatement ps = con.prepareStatement(sql);

			//結果を取得
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				LvJb lv = new LvJb();
				lv.setId(rs.getInt("id"));
				lv.setName(rs.getString("name"));
				
				list.add(lv);
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
