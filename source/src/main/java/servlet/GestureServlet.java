package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WordsDAO;
import dto.Word;

/**
 * Servlet implementation class Gesture
 */
@WebServlet("/Gesture")
public class GestureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//文字化け防止のエンコーディング
		request.setCharacterEncoding("UTF-8");
		
		// ランダムに一つデータを取得する
		WordsDAO dao = new WordsDAO();
		Word word = dao.getTheme();
		
		//取得情報をリクエストスコープに格納する
		request.setAttribute("word", word);
		
		// gesture.jspにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/gesture.jsp");
		dispatcher.forward(request, response);
	}

}
