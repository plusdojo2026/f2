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
 * Servlet implementation class HomeServlet
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//こっちはスタート画面以外から戻るボタン等で戻ってきたときに通る箇所
		
		//各画面からホーム画面に戻るとき
		WordsDAO dao = new WordsDAO();
		
		//単語をランダムに一つ取得する
		Word word = dao.getTheme();
		request.setAttribute("word",word);
		
		//home.jspにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//こっちはスタート画面からホーム画面に行くときに通る箇所
		
		//StartServletで保存しておいた"word"セッション(スタート画面に表示されている単語)を取得する
		HttpSession session = request.getSession();
		String word = (String)session.getAttribute("word");
		request.setAttribute("word",word);
		
		//home.jspにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
		dispatcher.forward(request, response);
	}

}
