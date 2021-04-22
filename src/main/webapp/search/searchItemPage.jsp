	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
</head>
<body>

<table border="2">
	<tr>
	<td>Item ID</td>
	<td>Name</td>
	<td>Type</td>
	<td>Initial Price</td>
	<td>Current Offer</td>
	<td>Start Date</td>
	<td>End Date</td>
	<td>Rating</td>
	<td>Seller</td>
	</tr>
	<%
		try{
			//Get DB connection
			ApplicationDB db = new ApplicationDB(); 
			Connection con = db.getConnection(); 
			
			//Create sql statement 
			Statement stmt = con.createStatement(); 
			String sqlQuery = "select * from items join ";
			
			String qType = request.getParameter("queryType");
			String gender = request.getParameter("gender");
			String name = request.getParameter("query");
			String color = request.getParameter("color");
			Double maxPrice = Double.parseDouble(request.getParameter("MaxPrice"));
			String sortingMethod = request.getParameter("SortingMethod");
			
			sqlQuery += qType;
			sqlQuery += "on(items.item_id = )";
			sqlQuery += qType; 
			sqlQuery += ".item_id)";
			sqlQuery += " where items.gender = ";
			sqlQuery += gender; 
			if(name != ""){
				sqlQuery += " and ";
				sqlQuery+= "items.type = %";
				sqlQuery+= name; 
				sqlQuery+= "%";
			}

			if(maxPrice != 0.0){
				sqlQuery+= " and ";
				sqlQuery+= "items.current_offer < ";
				sqlQuery+= Double.toString(maxPrice);
			}
			
			if(color != ""){
				sqlQuery+= " and ";
				sqlQuery+= "items.color < ";
				sqlQuery+= color;
			}
			
			if(sortingMethod == "alphabetical"){
				sqlQuery+= " order by type";
			} else if(sortingMethod == "ascendingPrice"){
				sqlQuery+= " order by current_offer ";
			} else if(sortingMethod == "descendingPrice"){
				sqlQuery+= " order by current_offer desc";
			}
			ResultSet result = stmt.executeQuery(sqlQuery);

			%>
			
			<tr>
				<td><%=result.getInt("item_id") %></td>
				<td><%=result.getString("name") %></td>
				<td><%=result.getString("clothing_type") %></td>
				<td><%=result.getInt("initial_price") %></td>
				<td><%=result.getInt("current_offer") %></td>
				<td><%=result.getDate("start_date") %></td>
				<td><%=result.getDate("end_date") %></td>
				<td><%=result.getInt("rating") %></td>
				<td><%=result.getString("username") %></td>
				<td><%=result.getString("gender") %></td>
				<td><%=result.getString("color") %></td>
				<td><%=result.getString("type") %></td>
				<td><%=result.getString("size") %></td>
			</tr>
		<%
			
		%>
		<% 	
		} catch (Exception E){
		
		}%>
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

</body>
</html>