package web;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class share
 */
@WebServlet("/share")
public class share extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public share() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		String user = (String) session.getAttribute("user");

		try {
			Connection db = dbcon.connect();
			Statement st = (Statement) db.createStatement();

			String[] username = request.getParameterValues("email");
			String filename = request.getParameter("file");

			for (int i = 0; i < username.length; i++) {
				String query = "insert into share(user,filename,admin) values('"+username[i]+"','"+filename+"','"+admin+"')";
				// String query =
				// "insert into share (user,filename)values ('"+username[i]+"','"+filename+"')";
				st.executeUpdate(query);
			}
			System.out.println("Data is Added in Table:");
		} catch (Exception e) {
			System.out.println(e);
		}
		RequestDispatcher rd = request.getRequestDispatcher("share.jsp");
		rd.include(request, response);
	}

}
