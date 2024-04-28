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
<form action="sharefile.jsp" method="post">
	<div class="a">
				<div class="row">		
							<h1 align="center">Share Files:</h1>
							<table>
							<h3 align="center" color="red"><b><u>:ONLY ADMIN CAN SHARE FILES:</u></b></h3>
		<%
		String admin = (String) session.getAttribute("admin");
		String user = (String) session.getAttribute("user");
							try{
								Connection db = dbcon.connect();
								Statement st = db.createStatement();
								
								String query;
								query= "select fname from file where email='"+admin+"' ";
								
								//query=" select fname from file  ";
								ResultSet rs = st.executeQuery(query);								
								while(rs.next())
								{
		%>		
		
				<tr>
					<td>
					
								<input type="radio" name="file" value="<%=rs.getString(1)%>" ><%=rs.getString(1)%>
					</td> 
				</tr>
							
		<%	
							}
								 st.close();
								    db.close();
								    }
								catch(Exception e)
								{
									System.out.println(e);
								}
		%>	
							</table>				
				</div>
		
		<div class="row" align="center">	
			<input type="submit" value="NEXT" class="btn"><br><br>
		</div>		
		</div>
</form>
</body>
</html>