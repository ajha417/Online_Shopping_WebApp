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
			Statement st = conn.createStatement();
			st.executeUpdate("update products set name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
			if(active.equals("no"))
			{
				st.executeUpdate("delete from products where product_id='"+id+"' and address is NULL");
			}
			response.sendRedirect("allProductEditProduct.jsp?msg=success");
		}
		catch(Exception e)
		{
			out.print(e);
			response.sendRedirect("allProductEditProduct.jsp?msg=error");
		}



%>