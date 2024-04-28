package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		
		 try
		    {
						Connection con=  (Connection) dbcon.connect();
						 Statement st = (Statement) con.createStatement(); 
					
					    String select = request.getParameter("select");
					    	
									  
			if(select.equals("admin"))
				{
								String uname = request.getParameter("uname");
						    	String pass = request.getParameter("pass");
								        System.out.println(uname);
								        System.out.println(pass);
			
								            PreparedStatement statement = (PreparedStatement) con.prepareStatement(
								            		"select emailid, password from radmin where emailid =? and password=?");
								            statement.setString(1, uname);
								            statement.setString(2, pass);
								            ResultSet rs = statement.executeQuery();
								  if(rs.next()){
								            	session.setAttribute("admin", rs.getString("emailid"));
								            	RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
								        		rd.include(request, response);
								        		System.out.println("Admin Login Successfully");
								            }
								  else{
								                System.out.println("username and password are incorrect");
								                RequestDispatcher rd = request.getRequestDispatcher("invalid.jsp");
								        		rd.include(request, response);
								            }
				}
					else{
											String uname = request.getParameter("uname");
									    	String pass = request.getParameter("pass");
									        System.out.println(uname);
									        System.out.println(pass);
						
									            PreparedStatement statement = (PreparedStatement) con.prepareStatement(
									            		"select emailid,password from ruser where emailid =? and password=?");
									            statement.setString(1, uname);
									            statement.setString(2, pass);
									            ResultSet rst = statement.executeQuery();
									if(rst.next()){
									            	session.setAttribute("user", rst.getString("emailid"));
									            	RequestDispatcher rd2 = request.getRequestDispatcher("homepage.jsp");
									        		rd2.include(request, response);
									        		System.out.println("User Login Successfully");
									            }
									 else{
									                System.out.println("username and password are incorrect");
									                RequestDispatcher rd2 = request.getRequestDispatcher("invalid.jsp");
									        		rd2.include(request, response);
									            	}
							}
					}
				catch(Exception ex)
							    {
							        ex.printStackTrace();
							    }
		 
	}

}
