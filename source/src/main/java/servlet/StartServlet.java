package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.WordsDAO;
import dto.Word;

/**
 * Servlet implementation class StartServlet
 */
@WebServlet("")
public class StartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//スタート画面を表示するための処理
		WordsDAO dao = new WordsDAO();
		
		//ランダムに一つ単語を取得する。条件なし
		Word word = dao.getTheme();
		request.setAttribute("word",word);
		
		//home画面でstart画面のお題を表示するためのセッション保持
		HttpSession session = request.getSession();
		session.setAttribute("word", word);	
		
		// start.jspにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/start.jsp");
		dispatcher.forward(request, response);
	}

}
