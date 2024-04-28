<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="web.dbcon"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/upl.css">
</head>
<body>
	<details> <summary></summary> 
			<nav class="menu"> 
			<a href="homepage.jsp">Home</a>
			 <a href="upload.jsp">Upload File</a> 
			 <a	href="download.jsp">Download FIle</a>
			  <a href="share.jsp">Share File</a> 
			  <a href="access.jsp">Access File</a> 
				<a href="logout.jsp">Logout</a>
			</nav> 
	</details>
	
	<form action="upload" method="post" enctype="multipart/form-data">
		<div class="a">
			<div class="row">
			<h3 color="red"><b><u>:ONLY ADMIN CAN UPLOAD FILES:</u></b></h3>
				<input type="file" name="file" align="middle" class="btn">
				<br> <input type="submit" value="submit" name="sub" class="btn">
		
			</div>
		</div>
		
	<%
		String admin = (String) session.getAttribute("admin");
		String user = (String) session.getAttribute("user");

			try {
				Connection db = dbcon.connect();
				String query;
			query = "Select * from radmin where emailid='"+admin+"'";

				Statement stmt = db.createStatement();
				ResultSet rs = stmt.executeQuery(query);

				stmt.close();
				db.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	%>


	</form>
</body>
</html>