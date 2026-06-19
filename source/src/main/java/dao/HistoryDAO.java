package dao;

import java.sql.Connection;
import java.sql.DriverManager;

import dto.History;

public class HistoryDAO {
	public boolean check(History hist) {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/f2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");
			
			// SQL文を作成する
			String sql = "SELECT user_no,word_no FROM history WHERE mail_add = ? AND password = ?";
		}catch(Exception e) {
			
		}
	}
}
