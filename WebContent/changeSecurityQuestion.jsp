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
  
 <hr>
 <h3>Enter Your New Answer</h3>
 
<hr>
<h3>Enter Password (For Security)</h3>

<hr>
 <i class='far fa-arrow-alt-circle-right'></i>
</form>
</body>
<br><br><br>
</html>