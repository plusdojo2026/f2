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
 * Servlet implementation class ReadServlet
 */
@WebServlet("/ReadServlet")
public class ReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//初回通過時に来る。game_countセッションを作成し、何問目かを保持する。
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("game_count") == null) {
			session.setAttribute("game_count", 1);
		} else {
			Word word = new Word();
			WordsDAO dao = new WordsDAO();
			int game_count = (int)session.getAttribute("game_count");
			
			switch(game_count) {
			case 1,2:
				Word level1 = dao.getLevel1();
				session.setAttribute("pronounce",word.getPronounce());
				
				request.setAttribute("level1",level1);
				
				
			case 3,4:
				Word level2 = dao.getLevel2();
				session.setAttribute("pronounce",word.getPronounce());
				
				request.setAttribute("level2",level2);
				
				
			case 5:
				Word level3 = dao.getLevel3();
				session.setAttribute("pronounce",word.getPronounce());
				
				request.setAttribute("level3",level3);
				
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/read.jsp");
			dispatcher.forward(request, response);
		}
		//データベースから問題となる用語を持ってくるのもこっちで行う。何問目かで、もってくる問題のlevelが変わるのでgame_countをif文なりswitchなりかけて分ける。
		//テレビ叩いて、問題リセットしたい時にもこっちを通る。
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		//キー入力して成語判定を行う時はこっちを通る。
		request.setCharacterEncoding("UTF-8");
		
		String pronounce = request.getParameter("pronounce");
		
		if(pronounce == session.getAttribute("pronounce")) {
			//正解だった時
			int game_count = (int)session.getAttribute("game_count");
			game_count++;
			session.setAttribute("game_count",game_count);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/read.jsp");
			dispatcher.forward(request, response);
		} else {
			//間違いだった時
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/read.jsp");
			dispatcher.forward(request, response);
		}
	}
	

}
