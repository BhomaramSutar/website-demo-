<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/nav.css">
</head>
<body>
 <details>
  		<summary></summary>
				  <nav class="menu">
				    <a href="homepage.jsp">Home</a>
				    <a href="upload.jsp">Upload file</a>
				     <a href="download.jsp">Download FIle</a>
				    <a href="share.jsp">Share File</a>
				        <a href="access.jsp">Access File</a>
				    <a href="logout.jsp">Logout</a>
				  </nav>
</details>
<h1 align="center"><u>*HOME PAGE*</u></h1>
		<%    
				String admin = (String) session.getAttribute("admin");
				String user = (String) session.getAttribute("user");
		%>
</body>
</html>