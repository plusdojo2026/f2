package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TemplateDAO;
import dto.Template;

/**
 * Servlet implementation class MagicServlet
 */
@WebServlet("/MagicServlet")
public class MagicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//確認用。home.jspが出来たら削除する！！！
	//確認用。home.jspが出来たら削除する！！！
	//確認用。home.jspが出来たら削除する！！！
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		//jspからのキー入力値受け取り
		int genre_no = 1; //= Integer.parseInt(request.getParameter("genre_no"));
		
		Template temp = new Template(genre_no);
		
		//jspで選択されたジャンルを条件として、該当するテンプレート文を取得する。
		TemplateDAO dao = new TemplateDAO();
		Template templ = dao.getTemplate(temp);
		
		request.setAttribute("temple", templ);
		
		//magic.jspにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/magic.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 選択された条件を受け取って、検索結果をmagic.jspに返す箇所
		
		//文字化け防止のエンコーディング
		request.setCharacterEncoding("UTF-8");

		//jspからのキー入力値受け取り
		int genre_no = 3; //= Integer.parseInt(request.getParameter("genre_no"));
		
		Template temp = new Template(genre_no);
		
		//jspで選択されたジャンルを条件として、該当するテンプレート文を取得する。
		TemplateDAO dao = new TemplateDAO();
		Template temple = dao.getTemplate(temp);
		
		request.setAttribute("temple", temple);
		
		//magic.jspにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/magic.jsp");
		dispatcher.forward(request, response);
	}
}
