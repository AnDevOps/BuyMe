<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<hr noshade size="16">
<b><br>Auction House</br></b>
<table border="2">
	<tr>
	<td>Clothing Type</td>
	<td>Total Profit</td>
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
			ResultSet items_info = 
					stmt.executeQuery(
			"select t1.item_id, t1.username, t1.bid_value, items.end_date, items.name, items.clothing_type from(select * from bids where bid_value in (select max(bid_value) from bids group by item_id) group by item_id) as t1 join items on t1.item_id = items.item_id where end_date < current_timestamp");
			ResultSet total = stmt.executeQuery("select sum(bid_value) where items.");
			while(items_info.next()) {
				%>
				<tr>
				<td><%=items_info.getInt("clothing_type") %></td>
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
			out.println("Current Time: " + get_current_time.getTimestamp("CURRENT_TIMESTAMP"));
			
		} catch (Exception e) {
			//out.print(e);
			out.println("an error has occurred.");%>
			<button type="button" name="back" onclick="history.back()">Try Again.</button>
		<%
		}
		
	%>

</table>
</body>
</html>