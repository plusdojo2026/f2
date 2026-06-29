package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HistoryDAO;

/**
 * Servlet implementation class HistoryServlet
 */
@WebServlet("/HistoryServlet")
public class HistoryServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int word_no = Integer.parseInt(request.getParameter("word_no"));

		HttpSession session = request.getSession();

		if(session.getAttribute("user_no") != null){

			int user_no =(Integer)session.getAttribute("user_no");

			HistoryDAO dao = new HistoryDAO();

			dao.addHistory(user_no, word_no);
			response.getWriter().print("login");
		}else {
			response.getWriter().print("nologin");
		}
	}
}
