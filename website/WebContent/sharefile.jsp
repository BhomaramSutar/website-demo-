<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"  import="java.sql.*" import="web.dbcon" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/share.css">
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
	<form action="share" method="post">
	<div class="a">
				<div class="row">		
							<h1 align="center">Share Files:</h1>
			<table>
								
								<tr>
										<td>
										FILE NAME
													<input type="text"  name="file" value="<%=request.getParameter("file")%>" readonly="readonly">
												   
										</td>
								</tr>
	<%
	String admin = (String) session.getAttribute("admin");
	String user = (String) session.getAttribute("user");
							try{
								Connection db = dbcon.connect();
								Statement st = db.createStatement();
								
								String query;
								query= "select * from ruser  ";
								ResultSet rs = st.executeQuery(query);
								
								while(rs.next())
								{
								//if( !admin.equals(rs.getString(3)) || user.equals(rs.getString(3)) )
								//{
		%>		
				<tr>
					<td>
									<label class="container">
									  <input type="checkbox" name="email" 
									  	 value="<%out.println(rs.getString("emailid")); %>">
									  	 <%out.println(rs.getString("emailid"));%>
									  <span class="checkmark"></span>
									</label>
					</td> 
				</tr>
							
							<%
									//}
								}
							}
								catch(Exception e)
								{
									System.out.println(e);
								}
							%>	
							</table>				
				</div>
		
		<div class="row" align="center">	
			<input type="submit" value="save" class="btn"><br><br>
		</div>		
		</div>
	
	</form>
	
</body>
</html>