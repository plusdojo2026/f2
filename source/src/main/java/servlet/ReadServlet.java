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
		//テレビ叩いて、問題リセットしたい時にもこっちを通る。
		
		HttpSession session = request.getSession();
		
		//game_countセッションに値が入っているか(初回か否か)を判断する。null(初回なら)、game_countを作成し、1問目を表す1をセットする。
		if(session.getAttribute("game_count") == null) {
			session.setAttribute("game_count", 1);
		} else {
			Word word = new Word();
			WordsDAO dao = new WordsDAO();
			int game_count = (Integer)session.getAttribute("game_count");
			
			switch(game_count) {
			case 1,2:
				//1,2問目の時の処理
				Word level1 = dao.getLevel1();
				session.setAttribute("pronounce",word.getPronounce());
				
				request.setAttribute("level1",level1);			
			case 3,4:
				//3,4問目の時の処理
				Word level2 = dao.getLevel2();
				session.setAttribute("pronounce",word.getPronounce());
				
				request.setAttribute("level2",level2);
			case 5:
				//5,6問目の時の処理
				
				//問題文取得,問題解答時にキー入力値と解答を比較するために、読み方("pronounce")をセッションに保存しておく処理。
				Word level3 = dao.getLevel3();
				session.setAttribute("pronounce",word.getPronounce());
				
				request.setAttribute("level3",level3);
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/read.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//キー入力して正誤判定を行う時はこっちを通る。
		
		HttpSession session = request.getSession();
		
		//文字化け防止のエンコーディング
		request.setCharacterEncoding("UTF-8");
		
		//jspからのキー入力値取得
		String pronounce = request.getParameter("pronounce");
		
		//入力された文字(pronounce)とdoGetでセッション保存しておいた答え("pronounce")を比較する処理。合ってたらtrue
		if(pronounce == session.getAttribute("pronounce")) {
			//正解だった時
			//次の問題に進むため、game_countを+1する。
			int game_count = (Integer)session.getAttribute("game_count");
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
