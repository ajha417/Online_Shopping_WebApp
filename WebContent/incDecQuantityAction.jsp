<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>

<%

	String email = session.getAttribute("email").toString();
	String id = request.getParameter("id");
	String incDec = request.getParameter("quantity");
	
	
	int total = 0;
	int price = 0;
	int quantity = 0;
	int final_total = 0;

	try
	{
		Connection conn = ConnectionDao.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from cart where email='"+email+"' and product_id='"+id+"' and address is NULL");
		while(rs.next())
		{
			price = rs.getInt(4);
			total = rs.getInt(5);
			quantity = rs.getInt(3);
		}
		if(quantity==1 && incDec.equals("dec"))
		{
			response.sendRedirect("myCart.jsp?msg=notPossible");
		}
		else if(quantity != 1 && incDec.equals("dec"))
		{
			total = total - price;
			quantity -= 1;
			st.executeUpdate("update cart set total="+total+",quantity="+quantity+" where email='"+email+"' and product_id='"+id+"' and address is NULL");
			response.sendRedirect("myCart.jsp?msg=decreased");
		}
		else
		{
			total = total + price;
			quantity += 1;
			st.executeUpdate("update cart set total="+total+",quantity="+quantity+" where email='"+email+"' and product_id='"+id+"' and address is NULL");
			response.sendRedirect("myCart.jsp?msg=increased");
		}
	}
	catch(Exception e)
	{
		out.println(e);
		//response.sendRedirect("myCart.jsp?msg=error");
	}

%>