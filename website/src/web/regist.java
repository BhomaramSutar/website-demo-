package web;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class regist
 */
@WebServlet("/regist")
public class regist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public regist() {
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

		try {
			Connection db = dbcon.connect();
			Statement st = db.createStatement();

			String select = request.getParameter("select");

			String name = request.getParameter("uname");
			String email = request.getParameter("email");
			String password = request.getParameter("pass");
			String pno = request.getParameter("pno");

			String query , query2;
			if (select.equals("admin"))
			{
				//select = admin;
				query = "insert into radmin (uname,emailid,password,pnum) values('"
						+ name
						+ "','"
						+ email
						+ "','"
						+ password
						+ "','"
						+ pno
						+ "' )";
				st.executeUpdate(query);
				System.out.println("data is added in admin");
			}else{
				select = "user";
				query2 = "insert into ruser (uname,emailid,password,pnum) values('"
						+ name
						+ "','"
						+ email
						+ "','"
						+ password
						+ "','"
						+ pno	
						+ "' )";
				st.executeUpdate(query2);
				System.out.println("data is added in user");
			}
		} catch (Exception e) {
			System.out.println(e);
			
		}
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.include(request, response);
	}

}
