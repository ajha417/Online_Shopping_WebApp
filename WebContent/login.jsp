
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     
      <form action="Login" method="post">
      
      	<input type="email" placeholder="Enter email" name="email">
      	<input type="password" placeholder="Enter password" name="password">
      	<input type="submit" value="Login">
      </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  
  <%

	String msg = request.getParameter("msg");
	if("nouser".equals(msg))
	{ %>
	<h1>Incorrect Username or Password</h1>
<% } %>
  
  <%


	if("invalid".equals(msg))
	{ %>
	<h1>Some thing Went Wrong! Try Again !</h1>	
<% } %>
  
  



    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>