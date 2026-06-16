package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dto.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//login.jsp にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//文字化け防止のエンコーディング
		request.setCharacterEncoding("UTF-8");

		//jspからのキー入力値受け取り
		String mail_add = request.getParameter("mail_add");
		String password = request.getParameter("password");
		
		User user = new User(mail_add,password);
		
		UserDAO dao = new UserDAO();
		boolean judge = dao.login(user);
		
		if(judge == true) {
			// セッションを取得（なければ作成）
			HttpSession session = request.getSession();
			  
			// ログインしたユーザー番号をセッションに保存
			session.setAttribute("user_no", dao.getUserNo(user));
			
			//menu.jsp にフォワードする
			response.sendRedirect("/MenuServlet");
		}else {
			//login.jsp にフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
