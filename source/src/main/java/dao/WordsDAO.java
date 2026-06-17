package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Word;

public class WordsDAO {
	public Word getTheme() {
		Connection conn = null;
		Word word = new Word();

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/f2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する
			String sql = "SELECT word FROM words ORDER BY RAND() LIMIT 1;";
			
			//データベースに直接ユーザー入力値を入れず、?を介して安全に値をセットする(対SQLインジェクション)
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				word = new Word(rs.getString("word"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return word;
	}
	
	public Word getLevel1() {
		Word word = null;
		Connection conn = null;
		

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/f2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する
			String sql = "SELECT word, pronounce, meaning FROM words WHERE level = 1 ORDER BY RAND() LIMIT 1;";
			
			//データベースに直接ユーザー入力値を入れず、?を介して安全に値をセットする(対SQLインジェクション)
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				word = new Word(rs.getString("word"),rs.getString("pronounce"),rs.getString("meaning"));
				// 結果を返す
				return word;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return word;
		
		
	}
	
	public Word getLevel2() {
		Word word = null;
		Connection conn = null;
		

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/f2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する
			String sql = "SELECT word, pronounce, meaning FROM words WHERE level = 2 ORDER BY RAND() LIMIT 1;";
			
			//データベースに直接ユーザー入力値を入れず、?を介して安全に値をセットする(対SQLインジェクション)
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				word = new Word(rs.getString("word"),rs.getString("pronounce"),rs.getString("meaning"));
				// 結果を返す
				return word;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return word;
		
		
	}
	
	public Word getLevel3() {
		Word word = null;
		Connection conn = null;
		

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/f2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する
			String sql = "SELECT word, pronounce, meaning FROM words WHERE level = 3 ORDER BY RAND() LIMIT 1;";
			
			//データベースに直接ユーザー入力値を入れず、?を介して安全に値をセットする(対SQLインジェクション)
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				word = new Word(rs.getString("word"),rs.getString("pronounce"),rs.getString("meaning"));
				// 結果を返す
				return word;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return word;
		
		
	}
}
