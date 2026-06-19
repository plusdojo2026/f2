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
 * Servlet implementation class QuizServlet
 */
@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ランダムに一つデータを取得してquiz.jspに返す処理
		
		//文字化け防止のエンコーディング
		request.setCharacterEncoding("UTF-8");
		
		//リロールかどうかの判断用	
		boolean reroll = false;
		reroll = Boolean.parseBoolean(request.getParameter("reroll"));
		
		// ランダムに一つデータを取得する。条件なし。
		WordsDAO wDao = new WordsDAO();
		Word word = wDao.getTheme();
		
		//取得情報をリクエストスコープに格納する
		request.setAttribute("word", word);
		
		//上がリロールの時、下がページを開いたとき
		if(reroll) {
			response.setContentType("application/json; charset=UTF-8");

			Word re_word = wDao.getTheme();

			String json = "{ \"theme\": \"" + re_word.getWord() + "\" }";
			response.getWriter().write(json);
			return;
		} else {
			// quiz.jspにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/quiz.jsp");
			dispatcher.forward(request, response);
		}
	}

}
