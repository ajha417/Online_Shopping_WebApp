<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>

<%

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String price = request.getParameter("price");
	String category = request.getParameter("category");
	String active = request.getParameter("active");
	
	try
	{
		
		Connection conn = ConnectionDao.getConnection();
		PreparedStatement st = conn.prepareStatement("insert into products(name,category,price,active) values(?,?,?,?)");
		//st.setString(1, id);
		st.setString(1,name);
		st.setString(2,category);
		st.setString(3,price);
		st.setString(4,active);
		
		st.executeUpdate();
		response.sendRedirect("addNewProduct.jsp?msg=success");
	}
	catch(Exception e)
	{
		out.print(e);
		response.sendRedirect("addNewProduct.jsp?msg=error");
	}



%>