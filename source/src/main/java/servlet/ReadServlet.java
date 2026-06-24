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
		response.setContentType("application/json; charset=UTF-8");
		HttpSession session = request.getSession();
		
		//リロールかどうかの判断用	
		boolean reroll = false;
		reroll = Boolean.parseBoolean(request.getParameter("reroll"));
		
		//game_countセッションに値が入っているか(初回か否か)を判断する。null(初回なら)、game_countを作成し、1問目を表す1をセットする。
		if(session.getAttribute("game_count") == null || (int)session.getAttribute("game_count") > 5) {
			session.setAttribute("game_count", 1);
		}
			Word word = new Word();
			WordsDAO dao = new WordsDAO();
			int game_count = (Integer)session.getAttribute("game_count");
			
			switch(game_count) {
			case 1,2:
				//1,2問目の時の処理
				Word level1 = dao.getLevel1();
			
				session.setAttribute("currentWord", level1);
				
				request.setAttribute("word",level1);
				break;
			case 3,4:
				//3,4問目の時の処理
				Word level2 = dao.getLevel2();
			
				session.setAttribute("currentWord", level2);
				
				request.setAttribute("word",level2);
				break;
			case 5:
				//5,6問目の時の処理
				
				//問題文取得,問題解答時にキー入力値と解答を比較するために、読み方("pronounce")をセッションに保存しておく処理。
				Word level3 = dao.getLevel3();
				
				session.setAttribute("currentWord", level3);
				
				request.setAttribute("word",level3);
				break;
			}
			
			//上がリロールの時、下がページを開いたとき
			if(reroll) {
				response.setContentType("application/json; charset=UTF-8");
				String json;
				
				switch(game_count) {
				case 1,2:
					//1,2問目の時の処理
					Word re_level1 = dao.getLevel1();
				
					// 次の問題をセッションに保存
					session.setAttribute("currentWord", re_level1);
					
					json = "{ \"theme\": \"" + re_level1.getWord() + "\" }";
					response.getWriter().write(json);
					return;
				case 3,4:
					//3,4問目の時の処理
					Word re_level2 = dao.getLevel2();
				
					// 次の問題をセッションに保存
					session.setAttribute("currentWord", re_level2);

					json = "{ \"theme\": \"" + re_level2.getWord() + "\" }";
					response.getWriter().write(json);
					return;
				case 5:
					//5,6問目の時の処理
					
					//問題文取得,問題解答時にキー入力値と解答を比較するために、読み方("pronounce")をセッションに保存しておく処理。
					Word re_level3 = dao.getLevel3();
					
					// 次の問題をセッションに保存
					session.setAttribute("currentWord", re_level3);

					json = "{ \"theme\": \"" + re_level3.getWord() + "\" }";
					response.getWriter().write(json);
					return;
				}
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/read.jsp");
				dispatcher.forward(request, response);
			}
		}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//キー入力して正誤判定を行う時はこっちを通る。
		
		HttpSession session = request.getSession();
	    request.setCharacterEncoding("UTF-8");
	    Word currentWord = (Word) session.getAttribute("currentWord");
	    
	    WordsDAO wDao = new WordsDAO();
	    String tf;

	    String answer = request.getParameter("pronounce");
	    String pronounce = currentWord.getPronounce();

	    boolean isCorrect = pronounce != null && pronounce.equals(answer);

	    int game_count = (Integer) session.getAttribute("game_count");

	    if (isCorrect) {
	        game_count++;
	        session.setAttribute("game_count", game_count);
	        tf = "正解！！！";
	    } else {
	        tf = "不正解...";
	    }

	    // ★ 次の問題を取得（5問目以降は nextWord を null にしない）
	    Word nextWord = null;

	    switch (game_count) {
	    case 1:
	    case 2:
	        nextWord = wDao.getLevel1();
	        break;

	    case 3:
	    case 4:
	        nextWord = wDao.getLevel2();
	        break;

	    case 5:
	        nextWord = wDao.getLevel3();
	        break;

	    default:
	        // クリア後
	        nextWord = new Word();
	        nextWord.setWord("");
	        break;
	}

	    // ★ 次の問題をセッションに保存
	    session.setAttribute("currentWord", nextWord);

	    // ★ JSON は「今の問題の meaning / pronounce」を返す
	    String json = "{"
	            + "\"theme\": \"" + nextWord.getWord() + "\","
	            + "\"tf\": \"" + tf + "\","
	            + "\"meaning\": \"" + currentWord.getMeaning() + "\","
	            + "\"pronounce\": \"" + currentWord.getPronounce() + "\","
	            + "\"game_count\": " + game_count
	            + "}";

	    response.setContentType("application/json; charset=UTF-8");
	    response.getWriter().write(json);
	}

}
