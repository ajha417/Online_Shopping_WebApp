<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>

<%

	try
	{
		Connection conn	= ConnectionDao.getConnection();
		Statement statement = conn.createStatement();
		String query = "create table users(name varchar(100),email varchar(100) primary key,password varchar(100),mobilenumber bigint,secuityquestion varchar(200),answer varchar(200),address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
		String q2 = "create table products(id int,name varchar(500),category varchar(200),price int,active varchar(10))";
		String q3 = "create table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(500),city varchat(100),state varchar(100),country(100),mobileNumber bigint,orderDate varchar(100),delivery varchar(100),paymentMethod varchar(100),transaction varchar(100),status varchar(10))";
		String q4 = "create table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobileNumber bigint, orderDate varchar(100),delivery varchar(100),paymentMethod varchar(100),transaction varchar(100),status varchar(10))";
		out.println(q4);
		//statement.execute(query);
		//statement.execute(q2);
		statement.execute(q4);
		out.print("table created");
		conn.close();
	}
	catch(Exception e)
	{
			out.print(e);
	}

%>