<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>

<%

	String msg = request.getParameter("msg");
	if("success".equals(msg))
	{
	%>
		<h3 class="alert">Product Added Successfully!</h3>
<% } %>

<%
	if("error".equals(msg))
	{
	%>
		<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% } %>




<%

	int id = 1;
	try
	{
		Connection conn = ConnectionDao.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from products");
		while(rs.next())
		{
			id = rs.getInt(1);
			
		}
		id = id + 1;
	}
	catch(Exception e)
	{
		out.print(e);
	}

%>


<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Product ID: <% out.println(id); %> </h3>
<input type="hidden" value="<% out.println(id); %>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input type="text" class="input-style" placeholder="Enter Product name" name="name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input type="text" class="input-style" placeholder="Enter Product category" name="category" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input type="number" class="input-style" placeholder="Enter Product price" name="price" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
   <select class="input-style" name="active">
   	<option value="yes">Yes</option>
   	<option value="no">No</option>
   </select>
<hr>
</div>
 <button class="button"> Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>