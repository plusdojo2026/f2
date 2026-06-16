package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Template;

public class TemplateDAO {
	// 引数card指定された項目で検索して、取得されたデータのリストを返す
	public List<Template> findAll() {
		Connection conn = null;
		List<Template> templateList = new ArrayList<>();

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/f2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する
			String sql = "SELECT sentence FROM templates WHERE ORDER BY genre_no";
			
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Template tem = new Template(rs.getString("sentence"));
				templateList.add(tem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			templateList = null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			templateList = null;
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					templateList = null;
				}
			}
		}

		// 結果を返す
		return templateList;
	}
}