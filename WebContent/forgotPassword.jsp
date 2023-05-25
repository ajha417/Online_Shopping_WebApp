<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="forgotPasswordAction.jsp" method="post">
      	<input type="email" name="email" placeholder="Enter email" required>
      	<input type="number" name="mobileNumber" placeholder="Enter phone number" required>
      	<select name="securityQuestion">
      		<option value="what was your school name?">what was your school name?</option>
      		<option value="what is your nickname?">what is your nickname?</option>
      		<option value="who was your childhood hero?">who was your childhood hero?</option>
      		<option value="who is your best friend?">who is your best friend?</option>
      		<option value="which is your favourite sports?">which is your favourite sports?</option>
      	</select>
      	<input type="text" name="answer" placeholder="Enter your answer" required>
      	<input type="password" name="newPassword" placeholder="Enter new password" required>
      	<input type="submit" value="Save">
      </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
   
     <%

	String msg = request.getParameter("msg");
	if("success".equals(msg))
	{ %>
	<h1>Password Changed Successfully!</h1>
<% } %>
   <%


	if("invalid".equals(msg))
	{ %>
	<h1>Some thing Went Wrong! Try Again !</h1>	
<% } %>
   
<%


	if("some".equals(msg))
	{ %>
	<h1>Some Error occured! Try Again !</h1>	
<% } %>


    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>