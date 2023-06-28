<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add Or Change Address</title>
</head>
<body>
<%
	//String email = session.getAttribute("email").toString();
	String msg = request.getParameter("msg");
	if("valid".equals(msg)){
		
	
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%} %>
	<%
		if("invalid".equals(msg))
		{
	%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>

<% } %>
<%

	try{
		Connection conn = ConnectionDao.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"'");
		while(rs.next())
		{
			
	

%>
<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
 <input class="input-style" type="text" value="<%=rs.getString(7) %>" name="address" placeholder="Enter Address">
 <hr>
 <h3>Enter city</h3>
 <input class="input-style" type="text" name="city" value="<%=rs.getString(8) %>" placeholder="Enter City">
<hr>
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs.getString(9) %>" placeholder="Enter State">
<hr>
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rs.getString(10) %>" placeholder="Enter Country">
<hr>
 <button type="submit" class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
 </form>
<%

		}
		}
		catch(Exception e)
		{
			out.println(e);
		}
%>
</body>
<br><br><br><br><br>
</html>