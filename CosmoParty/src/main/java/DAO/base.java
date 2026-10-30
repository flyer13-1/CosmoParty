package DAO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class base {

	// キーの名前
	private static final String URL = "DB＿URL";
	private static final String USER = "DB_USER";
	private static final String PW = "DB_PASS";

	//.envの中身の保持
	private static final Properties P = new Properties();

	// static初期化ブロック: baseが最初に使われた時に1回だけ実行される
	static {
		// クラスパス直下の .env を探す
		// base.classでsrc直下のクラスパスを指定
		
		try (InputStream in = base.class.getResourceAsStream("/.env")) {
			if (in == null) {
				throw new IllegalStateException(
					".env が見つかりません(Javaのソースフォルダ直下に置いてあるか確認)");
			}
			P.load(in); // 「キー=値」形式を読み込む
		} catch (IOException e) {
			throw new IllegalStateException(".env の読み込みに失敗", e);
		}
	
		// 3つの要素が揃っているか確認
		for (String k : new String[] { URL, USER, PW }) {
			String v = P.getProperty(k);
			if (v == null || v.isEmpty()) {
				throw new IllegalStateException(".env に " + k + " がありません");
			}
		}
	}
	
	
	// コネクション
	protected Connection con = null;
	
	// DB接続する
	protected void connect() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(URL, USER, PW);
	}
	
	// DB切断する
	protected void disConnect() throws SQLException {
		if (con != null) {
			con.close();
		}
	}
	
}
