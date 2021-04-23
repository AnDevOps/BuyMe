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
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Buyer Options</h5>
    <form method="post" action="buyer_home.jsp">
    <input type ="submit" value="Access Buyer Page" >
   
    </form>
  </div>
</div>
</th>

<!-- Seller Page -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Seller Options </h5>
    <form method="post" action="../seller/seller_home.jsp">
    <input type ="submit" value="Access Seller Page" >
    </form>
  </div>
</div>
</th>

<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Questions</h5>
    <form method="post" action="question_home.jsp">
    <input type ="submit" value="Access Questions Page" >
    </form>
  </div>
</div>
</th>

</tr>
</thead>
</table>

<hr noshade size="16">
<b><br>Auction House</br></b>
<table border="2">
	<tr>
	<td>Item ID</td>
	<td>Name</td>
	<td>Type</td>
	<td>Initial Price</td>
	<td>Increment</td>
	<td>Start Date</td>
	<td>End Date</td>
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
				<td><%=items_info.getString("name") %></td>
				<td><%=items_info.getString("clothing_type") %></td>
				<td><%=items_info.getInt("initial_price") %></td>
				<td><%=items_info.getInt("increment") %></td>
				<td><%=items_info.getTimestamp("start_date") %></td>
				<td><%=items_info.getTimestamp("end_date") %></td>
				<td><%=items_info.getInt("rating") %></td>
				<td><%=items_info.getString("username") %></td>
				</tr>
<%
			}
			
			items_info.close();
			ResultSet get_current_time = stmt.executeQuery("SELECT CURRENT_TIMESTAMP");
			get_current_time.next();
			out.println(get_current_time.getTimestamp("CURRENT_TIMESTAMP"));
			
		} catch (Exception e) {
			//out.print(e);
			out.println("an error has occurred.");%>
			<button type="button" name="back" onclick="history.back()">Try Again.</button>
		<%
		}
		
	%>

</table>
</div>

<div align='center'> 

		<form method="post" action="../auction/request_item_page.jsp">
		<table>
		<tr>    
		<td>Item ID</td><td><input type="text" name="item_id"> <input type="submit" value="Access Item Page"> </td> 
		</tr>
		<tr><td>
		</table>
		</form>


</div>



</html>
