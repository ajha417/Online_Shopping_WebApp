<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>

<%

	String email = session.getAttribute("email").toString();
	String status = "processing";
	try
	{
		Connection conn = ConnectionDao.getConnection();
		PreparedStatement st = conn.prepareStatement("update cart set status=? where email=? and status='bill'");
		st.setString(1, status);
		st.setString(2,email);
		st.executeUpdate();
		response.sendRedirect("home.jsp");
	}
	catch(Exception e)
	{
		out.println(e);
	}


%>