<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get parameters from the HTML form at the index.jsp
			String item_id = request.getParameter("item_id");
			String query = "";
			ResultSet item_request = stmt.executeQuery("select * from items where item_id='"+item_id+"'");
			ResultSet specific_item;
			if(item_request.next()) {
			%>
				<div align="center">
				<b><br>BuyMe Item</br></b>
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

			
				<tr>
				<td><%=item_request.getInt("item_id") %></td>
				<td><%=item_request.getString("name") %></td>
				<td><%=item_request.getString("clothing_type") %></td>
				<td><%=item_request.getInt("initial_price") %></td>
				<td><%=item_request.getInt("current_offer") %></td>
				<td><%=item_request.getDate("start_date") %></td>
				<td><%=item_request.getDate("end_date") %></td>
				<td><%=item_request.getInt("rating") %></td>
				<td><%=item_request.getString("username") %></td>
				</tr>
				</table>
				
				<hr noshade size="16">
				</div>
				
			<% 
			
				if(item_request.getString("clothing_type").equals("shoes")) {
					query = "select * from shoes where item_id='"+item_request.getInt("item_id")+"' and clothing_type='"+"shoes"+"'";
				} else if(item_request.getString("clothing_type").equals("shirt")) {
					query = "select * from shirts where item_id='"+item_request.getInt("item_id")+"' and clothing_type='"+"shirts"+"'";
				} else if(item_request.getString("clothing_type").equals("hat")) {
					query = "select * from hats where item_id='"+item_request.getInt("item_id")+"' and clothing_type='"+"hats"+"'";
				}
			
				specific_item = stmt.executeQuery(query);
				if(specific_item.next()) {
					
					
					%> 
					<div align="center">
					<b><br>Item Descriptions</br></b>
					<table border="2">
					<tr>
					<td>Item Size</td>
					<td>Gender</td>
					<td>Color</td>
					<td>Type</td>
					<td>Clothing Type</td>
					</tr>
					</div>
					
					<tr>
					<td><%=specific_item.getString("size") %></td>
					<td><%=specific_item.getString("gender") %></td>
					<td><%=specific_item.getString("color") %></td>
					<td><%=specific_item.getString("type") %></td>
					<td><%=specific_item.getString("clothing_type") %></td>
					</tr>
					</table>
					
					
					
					<% 
				} else {
					out.println("The requested page for the item id does not exist.");%>
					<button type="button" name="back" onclick="history.back()">Try Again.</button>
				<%
				}
			} else {
				out.println("The requested page for the item id does not exist.");%>
				<button type="button" name="back" onclick="history.back()">Try Again.</button>
			<%
			}
		} catch (Exception e) {
			//out.print(e);
			out.println("error has occured.");%>
			<button type="button" name="back" onclick="history.back()">Try Again.</button>
		<%
		}
		
	%>
	
	

</body>
</html>
