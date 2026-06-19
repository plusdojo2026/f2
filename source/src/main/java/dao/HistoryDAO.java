package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import dto.Word;

public class HistoryDAO {
	public boolean getHistory(int user_no,List<Word> list) {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/f2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");
			
			// SQL文を作成する
			String sql = "SELECT word_no FROM history WHERE user_no = ? AND word_no = ?";
			
			//データベースに直接ユーザー入力値を入れず、?を介して安全に値をセットする(対SQLインジェクション)
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			//?に値をセットする
			for(Word w:list) {
			pStmt.setInt(1, user_no);
			pStmt.setInt(2, w.getWord_no());
			}
			
			//SQL文を実行して検索結果を取得する
			ResultSet rs = pStmt.executeQuery();
			
			// 検索結果をコレクションに格納する
			while (rs.next()) {
				return true;
			}
			
		}catch(Exception e) {
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
}
