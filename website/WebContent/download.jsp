<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" import="java.util.*" import="web.dbcon" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/download.css">
</head>
<body>
<details>
  		<summary></summary>
				  <nav class="menu">
				    <a href="homepage.jsp">Home</a>
				    <a href="upload.jsp">Upload File</a>
				    <a href="download.jsp">Download FIle</a>
					<a href="share.jsp">Share File</a>
					    <a href="access.jsp">Access File</a>
				    <a href="logout.jsp">Logout</a>
				  </nav>
</details>
<form  >
		<div class="a">
						<div class="row">
								<table>
											<tr>
												<th>File Name</th>
												<th>Download File </th>
												<th>Delete File</th>
											</tr>
											
	<%       

	String admin = (String) session.getAttribute("admin");
	String user = (String) session.getAttribute("user");
			try
			{
			Connection db = dbcon.connect();
			//String query="select * from file ";
		
			String query="select * from file where email='"+admin+"'  ";
			
			Statement stmt=db.createStatement();
			ResultSet rs=stmt.executeQuery(query);

			while(rs.next())
			{
					if(admin.equals(admin)){
	%>		<tr>
						<td><%out.println(rs.getString(1)); %></td>
							<td>
									<a href="download?file=<%=rs.getString(1)%>">
									<input type="button" value="Download File"  name="down" class="btn">
									</a>
							</td>
							
							<td>
									<a href="delete?del=<%=rs.getString(1)%>">
									<input type="button" value="Delete File" 	name="del" 	 class="btn">
									</a>
							 </td>
											
					</tr>
		
	<%
								}
							}
							//  rs.close();
							    stmt.close();
							    db.close();
							    }
							catch(Exception e)
								{
							  	  e.printStackTrace();
							    }		
	%>		
							</table>
					</div>
			</div>
</form>
</body>
</html>