package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReadServlet
 */
@WebServlet("/ReadServlet")
public class ReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//初回通過時に来る。game_countセッションを作成し、何問目かを保持する。
		//データベースから問題となる用語を持ってくるのもこっちで行う。何問目かで、もってくる問題のlevelが変わるのでgame_countをif文なりswitchなりかけて分ける。
		//テレビ叩いて、問題リセットしたい時にもこっちを通る。
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//キー入力して成語判定を行う時はこっちを通る。
	}

}
