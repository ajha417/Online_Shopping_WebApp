<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>


<%

	String email = request.getParameter("email");
	String mobileNumber = request.getParameter("mobileNumber");
	String securityQuestion = request.getParameter("securityQuestion");
	String answer = request.getParameter("answer");
	String newPassword = request.getParameter("newPassword");
	
	try
	{
		Connection conn = ConnectionDao.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and mobilenumber='"+mobileNumber+"'");
		if(rs.next())
		{
			st.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
			response.sendRedirect("forgotPassword.jsp?msg=success");
		}
		else
		{
			response.sendRedirect("forgotPassword.jsp?msg=invalid");	
		}
	}
	catch(Exception e)
	{
		out.println(e);
		response.sendRedirect("forgotPassword.jsp?msg=some");
	}

%>