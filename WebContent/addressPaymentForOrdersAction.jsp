<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>

<%

	String email = session.getAttribute("email").toString();
	if(email == null)
	{
		response.sendRedirect("login.jsp");
	}
	String address = request.getParameter("address");
	String state = request.getParameter("state");
	String city = request.getParameter("city");
	String country = request.getParameter("country");
	String mobileNumber = request.getParameter("mobileNumber");
	String paymentMethod = request.getParameter("paymentMethod");
	String transactionId = "";
	transactionId = request.getParameter("transactionId");
	
	String status = "bill";
	try
	{
		Connection conn = ConnectionDao.getConnection();
		PreparedStatement ps = conn.prepareStatement("update users set address=?,city=?,state=?,country=?,mobilenumber=? where email=?");
		ps.setString(1, address);
		ps.setString(2, city);
		ps.setString(3, state);
		ps.setString(4, country);
		ps.setString(5, mobileNumber);
		ps.setString(6, email);
		
		ps.executeUpdate();
		
		PreparedStatement ps2 = conn.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobilenumber=?,orderDate=now(),delivery=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transaction=?,status=? where email=? and address is NULL");
		ps2.setString(1, address);
		ps2.setString(2, city);
		ps2.setString(3, state);
		ps2.setString(4, country);
		ps2.setString(5, mobileNumber);
		ps2.setString(6, paymentMethod);
		ps2.setString(7, transactionId);
		ps2.setString(8, status);
		ps2.setString(9, email);
		ps2.executeUpdate();
		response.sendRedirect("bill.jsp");
		
	}
	catch(Exception e)
	{
		out.println(e);
	}
	
%>