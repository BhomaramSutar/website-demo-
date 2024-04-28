<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reg.css">
<link rel="stylesheet" type="text/css" href="css/tog.css">
</head>
<body>
	 							
<div class="form-bg">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <div class="form-container">
                  
                    <h3 class="title">Register</h3>
                    <form class="form-horizontal" action="regist" method="post">
                  
                    <table>
                    <tr>  
                    		<div class="wrapper">
								 <input type="radio" name="select" id="option-1"  value="admin" checked>
								 <input type="radio" name="select" id="option-2" value="user">
								   <label for="option-1" class="option option-1" >
								     <div class="dot" ><span>Admin</span></div>
								     </label>
								      
								   <label for="option-2" class="option option-2" >
								     <div class="dot" > <span>User</span></div>								     
								   </label>
									</div>
							</tr>
              <tr>    
                    <td>		<div class="form-group">
                            		<label>User Name</label>
                      		<td> <input type="text" class="form-control" placeholder="User Name" name="uname" required></td>
                       		 	    </div>
                     </td>
               </tr>
                       
               <tr>
                       <td> 	<div class="form-group">
                            		<label>Email ID</label>
                         		<td><input type="email" class="form-control" placeholder="Email Address" name="email" required></td>
                        			</div>
                       </td>
                </tr>
                
                <tr>
                       	<td> <div class="form-group">
		                            <label>Password</label>
		                   			<td><input type="password" class="form-control" placeholder="Password" name="pass" required></td>
                       			 </div>
                       	 </td>
                  </tr>
                  
                <tr>
                       <td> <div class="form-group">
		                            <label>Phone No.</label>
		                           <td> <input type="text" class="form-control" placeholder="Phone Number" name="pno" required></td>
		                        </div>
                        </td>
                  </tr>   
              
                     <tr>                       
                     		<td>   <button class="btn" type="submit">Create Account</button></td>
                     			<td>   <button class="btn" type="reset">Clear</button></td>
                       </tr>
                        </table> 
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>