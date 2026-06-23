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
		
		//両項目にちゃんと要素が入っているかを判断（空白チェック）
		if(mail_add.isEmpty() || password.isEmpty()) {
			//両項目のどちらかが空白だった場合。エラー処理。
			request.setAttribute("error", "メールアドレスかパスワードが空白です");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
			
			return;
		}
		
		User user = new User(mail_add,password);
		
		//ログイン処理。成功ならtrue,失敗ならfalseが返ってくる
		UserDAO dao = new UserDAO();
		boolean judge = dao.login(user);
		
		//ログインに失敗したか否かの判断文
		if(judge == true) {
			HttpSession session = request.getSession();
			
			// すでに別ユーザーでログイン中の場合に、複数アカウント同時ログイン防止のため、"user_no"セッションを削除
			if (session.getAttribute("user_no") != null) {
			    session.removeAttribute("user_no");
			 }
			  
			// ログインしたユーザー番号をセッションに保存
			session.setAttribute("user_no", dao.getUserNo(user));
			
			//MenuServletのdoGetメソッドにリダイレクトする
			response.sendRedirect("/f2/MenuServlet?from=login");
		}else {
			//何らかの理由でログイン失敗。login.jsp にフォワードする
			request.setAttribute("error", "メールアドレスかパスワードが違います");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
