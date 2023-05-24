<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>


<%

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String mobileNumber = request.getParameter("phoneNumber");
	String securtyquestion = request.getParameter("securityQuestion");
	String answer = request.getParameter("answer");
	String city="";
	String state = "";
	String country = "";
	try
	{
		Connection connection = ConnectionDao.getConnection();
		String query = "insert into users values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, name);
		statement.setString(2, email);
		statement.setString(3, password);
		statement.setString(4, mobileNumber);
		statement.setString(5, securtyquestion);
		statement.setString(6, answer);
		statement.setString(7, city);
		statement.setString(8, state);
		statement.setString(9, country);
		
		statement.executeUpdate();
		response.sendRedirect("signup.jsp?msg=valid");
	}
	catch(Exception e)
	{
			out.print(e);
			response.sendRedirect("signup.jsp?msg=invalid");
	}

%>