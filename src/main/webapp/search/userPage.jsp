<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Page</title>
</head>
<body>
<div align='center'>
<table border="2">
	<head>Bidding History</head>

	<tr>
	<td>UserName</td>
	<td>UserID</td>
	<td>Rating</td>
	</tr>
	<% 
	try{ 
		
		ApplicationDB db = new ApplicationDB(); 
		Connection con = db.getConnection(); 
		
		Statement stmt = con.createStatement(); 
		
		String username = request.getParameter("username");
		String sqlQuery = "select * from users where username = '" + username + "';";
		System.out.println(sqlQuery);
		ResultSet result = stmt.executeQuery(sqlQuery);
		result.next();
		%>
		<tr>
		<td><%= result.getString("username") %></td>
		<td><%= result.getInt("user_id") %></td>
		<td><%= result.getInt("rating") %></td>
		</tr>
		</table>
		</div>
		
		<div style ="overflow-y:auto" align='left'>
		<p>Bids</p>
		<table border="2">
		<tr>
		<td>Item ID </td>
		<td>Bid Value</td>
		<td>Max Bid </td>
		<td>Date Time</td>
		</tr>
		<% 
		sqlQuery = "select * from bids where username = '" + username + "';";
		System.out.println(sqlQuery);
		result = stmt.executeQuery(sqlQuery);
		
		while(result.next()){
			%>
			<tr>
			<td><%= result.getInt("item_id") %></td>
			<td><%= result.getInt("bid_value") %></td>
			<td><%= result.getInt("max_bid") %></td>
			<td><%= result.getDate("date_time") %></td>
			</tr>
			<% 
		}
		
		
%>		
		</table>
		</div>
		
		<div style ="overflow-y:auto" align='right'>
		<p>Sales</p>
		<table border="2">
		<tr>
		<td>Item ID </td>
		<td>Start Date</td>
		<td>End Date</td>
		<td>Name</td>
		<td>Clothing Type</td>
		</tr>
		<% 
		sqlQuery = "select * from items where username = '" + username + "';";
		System.out.println(sqlQuery);
		result = stmt.executeQuery(sqlQuery);
		
		while(result.next()){
			%>
			<tr>
			<td><%= result.getInt("item_id") %></td>
			<td><%= result.getDate("start_date") %></td>
			<td><%= result.getDate("end_date") %></td>
			<td><%= result.getString("name") %></td>
			<td><%= result.getString("clothing_type") %></td>
			</tr>
			<% 
		}
%>		
		</table>
		</div><% 
	} catch (Exception E){
		
	}
	%>
			
<form method="post" action="chooseQueryPage.jsp" align = "center">
<input type ="submit" value="back to search" >
</form>
		
</body>
</html>