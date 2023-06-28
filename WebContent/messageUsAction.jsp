<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>

<%


	String email = session.getAttribute("email").toString();
	String subject = request.getParameter("subject");
	String body = request.getParameter("body");
	
	try
	{
		Connection conn = ConnectionDao.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into messages(email,subject,body) values(?,?,?)");
		ps.setString(1, email);
		ps.setString(2, subject);
		ps.setString(3, body);
		ps.executeUpdate();
		response.sendRedirect("messageUs.jsp?msg=success");
	}
	catch(Exception e)
	{
		out.println(e);
		response.sendRedirect("messageUs.jsp?msg=wrong");
	}

%>