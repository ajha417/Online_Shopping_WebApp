<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>

<%

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	if("admin@gmail.com".equals(email) && "admin".equals(password))
	{
		session.setAttribute("email", email);
		response.sendRedirect("admin/adminHome.jsp");
	}
	
	else
	{
		try
		{
			Connection conn = ConnectionDao.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
			if(rs.next())
			{
				session.setAttribute("email",email);
				response.sendRedirect("home.jsp");
			}
			else
			{
				response.sendRedirect("login.jsp?msg=nouser");	
			}
		}
		catch(Exception e)
		{
			out.print(e);
			response.sendRedirect("login.jsp?msg=invalid");
		}
	}


%>