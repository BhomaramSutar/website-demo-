<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="Yinka Enoch Adedokun">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/t.css">
</head>
<body>
	<!-- Main Content -->
	<div class="bo">
	<div class="container-fluid">
		<div class="row main-content bg-success text-center">
			<div class="col-md-4 text-center company__info">
				<span class="company__logo"><h2><span class="fa fa-android"></span></h2></span>
				<h4 class="company_title" align="center">&emsp;&emsp;Welcome  &emsp;&emsp;</h4>
			</div>
			<div class="col-md-8 col-xs-12 col-sm-12 login_form ">
				<div class="container-fluid">
						
						<form control="" class="form-group" action="login" method="post">
					<div class="row">
						<h2 align="center">Log In</h2>
					</div>
				<div class="wrapper">
								 <input type="radio" name="select" id="option-1"  value="admin" checked>
								 <input type="radio" name="select" id="option-2" value="user">
								   <label for="option-1" class="option option-1">
								     <div class="dot" ><span>Admin</span></div>
								     </label>
								      
								   <label for="option-2" class="option option-2">
								     <div class="dot" > <span>User</span></div>								     
								   </label>
									</div>
			
							<div class="row">
								<input type="email" name="uname" id="username" class="form__input" placeholder="Enter Email">
							</div>
							<div class="row">
								<!-- <span class="fa fa-lock"></span> -->
								<input type="password" name="pass" id="password" class="form__input" placeholder="Password">
							</div>
						
							<div class="row">
								<input type="submit" value="LogIn" class="btn">
							</div>
							<div class="row">
							 <a href="registration.jsp">	<input type=button value="Registration" class="btn" name="s1"></a>
							</div>
						</form>
					
					
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>