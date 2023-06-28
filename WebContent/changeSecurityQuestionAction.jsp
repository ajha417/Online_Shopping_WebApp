<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>

<%

	String email = session.getAttribute("email").toString();
	String securityQuestion = request.getParameter("securityQuestion");
	String newAnswer = request.getParameter("newAnswer");
	String password = request.getParameter("password");
	int check = 0;
	try
	{
		Connection conn = ConnectionDao.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
		while(rs.next())
		{
			check = 1;
			st.executeUpdate("update users set secuityquestion='"+securityQuestion+"',answer='"+newAnswer+"' where email='"+email+"' and password='"+password+"'");
			response.sendRedirect("changeSecurityQuestion.jsp?msg=success");
		}
		if(check==0)
		{
			response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
		}
	}
	catch(Exception e)
	{
		out.println(e);
		//response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
	}

%>