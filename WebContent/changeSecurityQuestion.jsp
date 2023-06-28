<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%

	String msg = request.getParameter("msg");
	if("success".equals(msg))
	{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
	<% } %>
	<% if("wrong".equals(msg))
		{%>
<h3 class="alert">Your Password is wrong!</h3>
	<%} %>

<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Securtiy Question</h3>
  	<select class="input-style" name="securityQuestion" required>
      		<option value="what was your school name?">what was your school name?</option>
      		<option value="what is your nickname?">what is your nickname?</option>
      		<option value="who was your childhood hero?">who was your childhood hero?</option>
      		<option value="who is your best friend?">who is your best friend?</option>
      		<option value="which is your favourite sports?">which is your favourite sports?</option>
   	</select>
 <hr>
 <h3>Enter Your New Answer</h3>
 	<input class="input-style" type="text" name="newAnswer" placeholder="Your new Answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
	<input class="input-style" type="password" name="password" placeholder="Enter your password" required>
<hr>
 <button type="submit" class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>