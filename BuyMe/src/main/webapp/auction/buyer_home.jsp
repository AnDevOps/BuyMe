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

BuyMe Watchlist


<!-- logout form  -->			  
	<br>
		<form method="post" action="../login/logout_customer_form.jsp">
		<input type="submit" value="Logout">
		</form>
	<br>

<hr noshade size="16">
<b><br>Your Watchlisted Items</br></b>
<table border="2">
	<tr>
	<td>Item ID</td>
	<td>Name</td>
	<td>Type</td>
	<td>Initial Price</td>
	<td>Current Offer</td>
	<td>Start Date</td>
	<td>End Date</td>
	<td>Seller</td>

<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			String user = (String)session.getAttribute("user"); 
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			ResultSet items_info = stmt.executeQuery("select * from items where item_id in (select item_id from watchlists where username = '"+user+"')");

			
			while(items_info.next()) {
				%>
				<tr>
				<td><%=items_info.getInt("item_id") %></td>
				<td><%=items_info.getString("name") %></td>
				<td><%=items_info.getString("clothing_type") %></td>
				<td><%=items_info.getInt("initial_price") %></td>
				<td><%=items_info.getInt("current_offer") %></td>
				<td><%=items_info.getDate("start_date") %></td>
				<td><%=items_info.getDate("end_date") %></td>
				<td><%=items_info.getString("username") %></td>
				</tr>
<%
			}
		} catch (Exception e) {
			//out.print(e);
			out.println("an error has occurred.");%>
			<button type="button" name="back" onclick="history.back()">Try Again.</button>
		<%
		}
		
	%>

</table>

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