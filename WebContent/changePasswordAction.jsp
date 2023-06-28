<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>


<%

	String email = session.getAttribute("email").toString();
	String oldPassword = request.getParameter("oldpassword");
	String newPassword = request.getParameter("newpassword");
	String confirmPassword = request.getParameter("confirmpassword");
	if(!confirmPassword.equals(newPassword))
	{
		response.sendRedirect("changePassword.jsp?msg=notMatch");
	}
	else
	{
		int check = 0;
		try{
			Connection conn = ConnectionDao.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+oldPassword+"'");
			while(rs.next())
			{
				check = 1;
			    st.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
			    response.sendRedirect("changePassword.jsp?msg=success");
			}
			//out.println(oldPassword);
			if(check==0)
				response.sendRedirect("changePassword.jsp?msg=wrong");
		}
		catch(Exception e)
		{
			out.println(e);	
		}
	}
%>