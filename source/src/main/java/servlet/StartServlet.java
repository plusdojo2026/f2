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
@WebServlet("/StartServlet")
public class StartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//各画面からホーム画面に戻るとき
				WordsDAO dao = new WordsDAO();
				
				Word word = dao.getTheme();
				request.setAttribute("word",word);
				
				HttpSession session = request.getSession();
				session.setAttribute("word", word);	
				// スタート画面にフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/start.jsp");
				dispatcher.forward(request, response);
	}

}
