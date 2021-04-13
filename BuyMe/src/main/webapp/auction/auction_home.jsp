  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BuyMe Site</title>
	</head>
	

<div align='center'> 

BuyMe Login Page


<!-- logout form  -->			  
	<br>
		<form method="post" action="../login/logout_customer_form.jsp">
		<input type="submit" value="Logout">
		</form>
	<br>

<table> 
<thead>
<tr> 

<!-- Customer Login -->
<th> 
<div class="card" style="width: 15rem;" >
  <div class="card-body">
    <h5 class="card-title">Buyer Options</h5>
    <form method="post" action="login/login_customer_form.jsp">
    <input type ="submit" value="Access Watched Items List" >
    <input type ="submit" value="Access Personal Sales" formaction = "login/register_customer_form.jsp">
    </form>
  </div>
</div>
</th>

<!-- Customer Representative Login-->
<th> 
<div class="card" style="width: 15rem;" >
  <div class="card-body">
    <h5 class="card-title">Seller Options </h5>
    <form method="post" action="login/login_representative_form.jsp">
    <input type ="submit" value="Login" >
    </form>
  </div>
</div>
</th>

</tr>
</thead>
</table>

<hr noshade size="15">
<b><br>Auction House</br></b>
<table border="2">
	<tr>
	<td>Item ID</td>
	<td>Initial Price</td>
	<td>Increment Amount</td>
	<td>Start Date</td>
	<td>End Date</td>
	<td>Name</td>
	<td>Rating</td>
	<td>Seller</td>

<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			ResultSet items_info = stmt.executeQuery("select * from items");

			while(items_info.next()) {
				%>
				<tr>
				<td><%=items_info.getInt("item_id") %></td>
				<td><%=items_info.getInt("initial_price") %></td>
				<td><%=items_info.getInt("increment_amt") %></td>
				<td><%=items_info.getDate("start_date") %></td>
				<td><%=items_info.getDate("end_date") %></td>
				<td><%=items_info.getString("name") %></td>
				<td><%=items_info.getInt("rating") %></td>
				<td><%=items_info.getString("username") %></td>
				</tr>
<%

			}

		} catch (Exception e) {
			//out.print(e);
			out.println("Login Failed. Invalid login credentials");%>
			<button type="button" name="back" onclick="history.back()">Try Again.</button>
		<%
		}
		
	%>

</table>
</div>



</html>
