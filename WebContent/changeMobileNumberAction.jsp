<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>


<%


	String email = session.getAttribute("email").toString();
	String newMobileNumber = request.getParameter("mobileNumber");
	String password = request.getParameter("password");
	try{
		
		Connection conn = ConnectionDao.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
		int check = 0;
		while(rs.next())
		{
			check = 1;
			st.executeUpdate("update users set mobilenumber='"+newMobileNumber+"' where email='"+email+"' and password='"+password+"'");
			response.sendRedirect("changeMobileNumber.jsp?msg=success");
		}
		if(check==0)
		{
			response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}

%>