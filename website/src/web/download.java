package web;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class download
 */
@WebServlet("/download")
public class download extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public download() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession  session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		String user = (String) session.getAttribute("user");
	
		String data="";
		StringBuilder sb=new StringBuilder();
		ServletOutputStream os=response.getOutputStream();
		String file=request.getParameter("file");
		
		try{
			Connection db = dbcon.connect();
			Statement st = db.createStatement();
	
			String query="select * from file where fname='"+file+"' ";
			ResultSet rs = st.executeQuery(query);
			
			while( rs.next() )
			{
				data = rs.getString("fdata");
				sb.append(data);
			}
			System.out.println(data);
			
			response.setContentType("text/plain");
			response.setHeader("Content-Type","application/octet-stream");
			response.setHeader("Content-Disposition","attachment; filename=\"" + file + "\"");

			os.println(sb.toString());
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
