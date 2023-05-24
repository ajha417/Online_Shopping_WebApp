<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>

<%

	try
	{
		Connection conn	= ConnectionDao.getConnection();
		Statement statement = conn.createStatement();
		String query = "create table users(name varchar(100),email varchar(100) primary key,password varchar(100),mobilenumber bigint,secuityquestion varchar(200),answer varchar(200),address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
		out.println(query);
		statement.execute(query);
		out.print("table created");
		conn.close();
	}
	catch(Exception e)
	{
			out.print(e);
	}

%>