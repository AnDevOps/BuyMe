<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Query Page</title>
</head>
<body>

	<form action="searchItemPage.jsp">
		<table>
			<tr>
				<td>
					<select name="SortingMethod">
						<option value="unsorted">Unsorted</option>
						<option value="alphabetical">Alphabetical</option>
						<option value="ascendingPrice">Ascending Price</option>
						<option value="descendingPrice">Descending Price</option>
					</select>
				</td>
				<td>
					<select name="queryType">
						<option value="Hats">Hats</option>
						<option value="Shirts">Shirts</option>
						<option value="Shoes">Shoes</option>
					</select>
					</td>
				</tr>
			<tr>
				<td>
					<select name="MaxPrice">
						<option value="0.0">No Max</option>
						<option value="50.0">$50</option>
						<option value="100.0">$100</option>
						<option value="200.0">$200</option>
						<option value="400.0">$400</option>
						<option value="800.0">$800</option>
						<option value="1600.0">$1600</option>
						<option value="3200.0">$3200</option>
						<option value="6400.0">$6400</option>
						<option value="12800.0">$12800</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<select name="gender">
						<option value="Mens">Mens</option>
						<option value="Womens">Womens</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Search</td><td><input type="text" name="query"></td>
			</tr>
			<tr>
				<td>Color</td><td><input type="text" name="color"></td>
			</tr>
		</table>
		<input type="submit" value="Search">
		</form>	 	
		
		<form action="searchUserPage.jsp">
			<table>
				<tr><td>Search User</td><td><input type="text" name="userName"></td></tr>
			</table>
			<input type="submit" value="Search User">
		</form>
		
</body>
</html>