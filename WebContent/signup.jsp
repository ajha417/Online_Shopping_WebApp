<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    	
      <form action="signupAction.jsp" method="post">
      	<input type="text" name="name" placeholder="Enter your name" required>
      	<input type="email" name="email" placeholder="Enter your email" required>
      	<input type="password" name="password" placeholder="Enter password" required>
      	<input type="number" name="phoneNumber" placeholder="Enter your phone number" required>
      	<select name="securityQuestion" required>
      		<option value="what was your school name?">what was your school name?</option>
      		<option value="what is your nickname?">what is your nickname?</option>
      		<option value="who was your childhood hero?">who was your childhood hero?</option>
      		<option value="who is your best friend?">who is your best friend?</option>
      		<option value="which is your favourite sports?">which is your favourite sports?</option>
      	</select>
      	<input type="text" name="answer" placeholder="Enter answer" required>
      	<input type="submit" value="signup">
      </form>	
      <h2><a href="">Login</a></h2>
  </div>
  <div class='whysign'>

<%

	String msg = request.getParameter("msg");
	if("valid".equals(msg))
	{ %>
	<h1> Registered successfully</h1>	
<% } %>
<%


	if("invalid".equals(msg))
	{ %>
	<h1> Something went wrong</h1>	
<% } %>





    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>