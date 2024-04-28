package web;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import web.dbcon;

/**
 * Servlet implementation class upload
 */

@WebServlet("/upload")
@MultipartConfig(
		
		fileSizeThreshold = 1024 * 1024 * 1, 	// 1mb size
		maxFileSize = 1024 * 1024 * 10 ,		//10mb size
		maxRequestSize = 1024 * 1024 * 100 	//100mb size	

)


public class upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private String getFileName(final Part part) 
  	 {
  		 for (String content : part.getHeader("content-disposition").split(";"))
  		 {
  	       if (content.trim().startsWith("filename"))
  	       {
  	           return content.substring(content.indexOf("=") + 1).trim().replace("\""," ");
  	       }
  		 }
    return null;
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
		HttpSession  session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		String user = (String) session.getAttribute("user");
		
			Part filepart = request.getPart("file");  
			String filename = getFileName(filepart);
				System.out.println(filename);
				String fname = filename;
				
				InputStream is = filepart.getInputStream(); // binary code 
			
				String fdata=" ";
				
				StringBuilder sb = new StringBuilder();
				BufferedReader br = new BufferedReader(new InputStreamReader(is));
				
						while((fdata = br.readLine())!= null)
						{
							sb.append(fdata);
						}
						String fd = sb.toString();
						System.out.println(fd);
		    
		try{
		
			Connection db = (Connection) dbcon.connect();
			Statement st;
			st = (Statement) db.createStatement();
			
						String query = "insert into file values (?,?,?)";
				
				PreparedStatement ps = (PreparedStatement) db.prepareStatement(query);
				
				ps.setString(1, fname);
				ps.setString(2,fd);
				ps.setString(3, admin);
				
				ps.executeUpdate();
				System.out.println("File Is Uploaded");
		}catch(Exception e){
			System.out.println(e);
		}
		RequestDispatcher rd = request.getRequestDispatcher("upload.jsp");
		rd.include(request, response);
		
	}

}
