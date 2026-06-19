package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WordsDAO;
import dto.Word;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 検索条件を受け取って、検索結果をsearchresult.jspに返す箇所
		
		//文字化け防止のエンコーディング
		request.setCharacterEncoding("UTF-8");
		
		//jspからのキー入力値受け取り
		int genre_no = Integer.parseInt(request.getParameter("genre_no"));
		int era_no = Integer.parseInt(request.getParameter("era_no"));
		String word = request.getParameter("word");
		
		WordsDAO dao =new WordsDAO();
		
		List<Word> list=dao.search(genre_no,era_no,word);
		
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/selectresult.jsp");
		dispatcher.forward(request, response);
		
		//HttpSession session=request.getSession();
		
		//     !!!!ラスボスが現れた!!!!
		
		//if(session.getAttribute("user_no")!=null) {
			//int user_no = (int)session.getAttribute("user_no");
			
			//HistoryDAO hdao = new HistoryDAO();
			//hdao.getHistory(user_no,list);
		//}
		
	}

}
