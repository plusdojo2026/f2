package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.User;

public class UserDAO {
	// 入力したメールアドレスとパスワードがデータベースにあるかをチェックする
	public boolean login(User user) {
		// データベースに接続と切断を行うオブジェクト
		Connection conn = null;
			
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/f2?"
					+ "characterEncoding=utf8&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"f2", "VLKAX3uTDc9NJDQL");

			// SQL文を作成する
			String sql = "SELECT mail_add, password FROM users WHERE mail_add = ? AND password = ?";
			
			//データベースに直接ユーザー入力値を入れず、?を介して安全に値をセットする(対SQLインジェクション)
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			//?に値をセットする
			pStmt.setString(1, user.getMail_add());
			pStmt.setString(2, user.getPassword());

			//SQL文を実行して検索結果を取得する
			ResultSet rs = pStmt.executeQuery();

			// 検索結果をコレクションに格納する
			while (rs.next()) {
				return true;
			}
		}
		catch (Exception e) {
			// 例外処理
			e.printStackTrace();
		}
		finally {
			// データベースを切断する
			if (conn != null) {
				try {
					conn.close();
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return false;
	}
	
	// ログインしたユーザーのユーザー番号を取得するメソッド
	public int getUserNo(User user) {
		// データベースに接続と切断を行うオブジェクト
		Connection conn = null;
			
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/f2?"
					+ "characterEncoding=utf8&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"f2", "VLKAX3uTDc9NJDQL");

			// SQL文を作成する
			String sql = "SELECT user_no FROM users WHERE mail_add = ? AND password = ?";
			
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			//?に値をセットする
			pStmt.setString(1, user.getMail_add());
			pStmt.setString(2, user.getPassword());

			//SQL文を実行して検索結果を取得する
			ResultSet rs = pStmt.executeQuery();

			// 検索結果をコレクションに格納する
			while (rs.next()) {
				return rs.getInt("user_no");
			}
		}
		catch (Exception e) {
			// 例外処理
			e.printStackTrace();
		}
		finally {
			// データベースを切断する
			if (conn != null) {
				try {
					conn.close();
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return -1;
	}
	
	// 新規登録時、入力したメールアドレスがデータベースにあるかをチェックする(同じメールアドレスが複数あってはならないため)
	public boolean DuplicateMailAdd(User user) {
		// データベースに接続と切断を行うオブジェクト
		Connection conn = null;
			
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/f2?"
					+ "characterEncoding=utf8&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"f2", "VLKAX3uTDc9NJDQL");

			// SQL文を作成する
			String sql = "SELECT mail_add FROM users WHERE mail_add = ?";
			
			//データベースに直接ユーザー入力値を入れず、?を介して安全に値をセットする(対SQLインジェクション)
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			//?に値をセットする
			pStmt.setString(1, user.getMail_add());

			//SQL文を実行して検索結果を取得する
			ResultSet rs = pStmt.executeQuery();

			// 検索結果をコレクションに格納する
			while (rs.next()) {
				return true;
			}
		}
		catch (Exception e) {
			// 例外処理
			e.printStackTrace();
		}
		finally {
			// データベースを切断する
			if (conn != null) {
				try {
					conn.close();
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return false;
	}
	
	// 実際にメールアドレスとパスワードの登録を行う処理
	public boolean addAcount(User user) {
		// データベースに接続と切断を行うオブジェクト
		Connection conn = null;
			
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/f2?"
					+ "characterEncoding=utf8&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"f2", "VLKAX3uTDc9NJDQL");

			// SQL文を作成する
			String sql = "INSERT INTO users(mail_add,password) VALUES (?,?)";
			
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			pStmt.setString(1, user.getMail_add());
			pStmt.setString(2, user.getPassword());

			//SQL文を実行して検索結果を取得する
			pStmt.executeUpdate();

			//追加に成功
			return true;
		}
		catch (Exception e) {
			// 例外処理
			e.printStackTrace();
		}
		finally {
			// データベースを切断する
			if (conn != null) {
				try {
					conn.close();
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		//追加に失敗
		return false;
	}
}
