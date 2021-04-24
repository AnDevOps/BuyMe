<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Report</title>
</head>
<body>
	<br>
		<form method="post" action="login/logout_customer_form.jsp">
		<input type="submit" value="Logout">
		</form>
	<br>
<hr noshade size="16">
<h2>Sales Report</h2>
<table border="2">
	<tr>
	<td>Clothing Type</td>
	<td>Earnings</td>

<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			ResultSet clothing_info = 
					stmt.executeQuery(
"select t1.item_id, t1.username, sum(t1.bid_value) as total, items.end_date, items.name, items.clothing_type from(select * from bids where bid_value in (select max(bid_value) from bids group by item_id) group by item_id) as t1 join items on t1.item_id = items.item_id where end_date < current_timestamp group by items.clothing_type");
			while(clothing_info.next()) {
				%>
				<tr>
				<td><%=clothing_info.getString("clothing_type") %></td>
				<td><%=clothing_info.getString("total") %></td>
				</tr>
				<%
			}
			%>
			</table>
			<table border="2">
			<tr>
			<td>Username</td>
			<td>Earnings</td>
			<%
			clothing_info.close();
			
			ResultSet user_info = 
					stmt.executeQuery(
"select t1.item_id, items.username, sum(t1.bid_value) as total, items.clothing_type from(select * from bids where bid_value in (select max(bid_value) from bids group by item_id)) as t1 join items on t1.item_id = items.item_id where end_date < current_timestamp");	
			while(user_info.next()) {
				%>
				<tr>
				<td><%=user_info.getString("username") %></td>
				<td><%=user_info.getString("total") %></td>
				</tr>
				<%
			}
			user_info.close();
			%>
			</table>
			<h3>Hats</h3>
			<table border="2">
			<tr>
			<td>Item Type</td>
			<td>Earnings</td>
			<%
			ResultSet hat_type_info = 
					stmt.executeQuery(
					"select sum(price) as total, hats.type from (select max(bid_value) price, item_id from bids group by item_id) as t1, hats where t1.item_id = hats.item_id group by hats.type");	
			while(hat_type_info.next()) {
				%>
				<tr>
				<td><%=hat_type_info.getString("type") %></td>
				<td><%=hat_type_info.getString("total") %></td>
				</tr>
				<%
			}
			hat_type_info.close();
			%>
			</table>
			<h3>Shirts</h3>
			<table border="2">
			<tr>
			<td>Item Type</td>
			<td>Earnings</td>
			<%
			ResultSet shirt_type_info = 
					stmt.executeQuery(
					"select sum(price) as total, shirts.type from (select max(bid_value) price, item_id from bids group by item_id) as t1, shirts where t1.item_id = shirts.item_id group by shirts.type");	
			while(shirt_type_info.next()) {
				%>
				<tr>
				<td><%=shirt_type_info.getString("type") %></td>
				<td><%=shirt_type_info.getString("total") %></td>
				</tr>
				<%
			}
			shirt_type_info.close();
			%>
			</table>
			<h3>Shoes</h3>
			<table border="2">
			<tr>
			<td>Item Type</td>
			<td>Earnings</td>
			<%
			ResultSet shoe_type_info = 
					stmt.executeQuery(
					"select sum(price) as total, shoes.type from (select max(bid_value) price, item_id from bids group by item_id) as t1, shoes where t1.item_id = shoes.item_id group by shoes.type");	
			while(shoe_type_info.next()) {
				%>
				<tr>
				<td><%=shoe_type_info.getString("type") %></td>
				<td><%=shoe_type_info.getString("total") %></td>
				</tr>
				<%
			}
			shoe_type_info.close();
		} catch (Exception e) {
			out.print(e);
			//out.println("an error has occurred.");%>
			<button type="button" name="back" onclick="history.back()">Try Again.</button>
		<%
		}
		
	%>
</body>
</html>