<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body>

<%

	try
{
	
		Connection conn = ConnectionDao.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"'");
		while(rs.next())
		{
%>
<h3>Name:<%=rs.getString(1) %> </h3>
<hr>
 <h3>Email: <%=rs.getString(2) %> </h3>
 <hr>
 <h3>Mobile Number: <%=rs.getString(4) %> </h3>
 <hr>
<h3>Security Question:<%=rs.getString(5) %> </h3>
<hr>
      <br>
      <br>
      <br>
<%
		}
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>