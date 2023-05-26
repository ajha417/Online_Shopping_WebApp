<%@page import="project.ConnectionDao"  %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>


 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>



<%

	String id = request.getParameter("id");
	
	try
	{
		Connection conn = ConnectionDao.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from products where id='"+id+"'");
		while(rs.next())
		{
%>
<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<% out.println(id); %>">
<div class="left-div">
 <h3>Enter Name</h3>
<input class="input-style" type="text" class="input-style" value="<%= rs.getString(2) %>"  name="name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" class="input-style" value="<%= rs.getString(3) %>"  name="category" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" class="input-style" value="<%= rs.getString(4) %>" name="price" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
	<select class="input-style" class="input-style" name="active">
	   	<option value="yes">Yes</option>
	   	<option value="no">No</option>
   </select>
 <hr>
</div>
 <button class="button"> Save <i class='far fa-arrow-alt-circle-right'></i></button>
 </form>
<%
		}

		}
		catch(Exception e)
		{
			out.print(e);
		}
%>


</body>
<br><br><br>
</body>
</html>