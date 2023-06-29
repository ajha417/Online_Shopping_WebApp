<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>
 
 
 
 
 <%
 
 	String id = request.getParameter("id");
 	String email = request.getParameter("email");
 	String status = "delivered";
 	
 	try
 	{
 		
 		Connection conn = ConnectionDao.getConnection();
 		Statement st = conn.createStatement();
 		st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
 		response.sendRedirect("ordersReceived.jsp?msg=success");
 	}
 	catch(Exception e)
 	{
 		out.println(e);
 		response.sendRedirect("ordersReceived.jsp?msg=wrong");
 	}
 %>