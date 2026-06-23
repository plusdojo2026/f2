package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.User;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//signup.jsp にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/signup.jsp");
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
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/signup.jsp");
			dispatcher.forward(request, response);
			
			return;
		}
		
		User user = new User(mail_add,password);
		
		UserDAO dao = new UserDAO();
		// 入力したメールアドレスが既に登録済みかを調べる。一つでもヒットしたらtrue。一つもヒットしなかったらfalseが返る。
		boolean judge = dao.DuplicateMailAdd(user);
		
		if(judge == true) {
			//既に登録済みのパスワード。エラー処理
			request.setAttribute("error", "既に登録済みのメールアドレスです");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/signup.jsp");
			dispatcher.forward(request, response);
		}else {
			//実際に登録する処理
			if(dao.addAcount(user)) {
				//登録成功。signresult.jsp にフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/signresult.jsp");
				dispatcher.forward(request, response);
			}else {
				//何らかの理由で登録失敗。エラー処理
				request.setAttribute("error", "登録に失敗しました");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/signup.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

}
