<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item</title>
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
			session.setAttribute("item_id", item_id);
			
			
			// creates an empty to query
			String query = "";
			
			// used to generate the generic item info
			ResultSet item_request = stmt.executeQuery("select * from items where item_id='"+item_id+"'");
			
			// used to generate the specific item info
			ResultSet specific_item;
			
			// used to generate the current_bid item info
			ResultSet item_bid;
			
			// user attribute used to allow whether they can bid or not
			String user = (String)session.getAttribute("user"); 
		
			
			if(item_request.next()) {	
				int initialprice = item_request.getInt("initial_price");
				session.setAttribute("initial_price",item_request.getInt("initial_price"));
				int itemid = item_request.getInt("item_id");
				int incrementamt = item_request.getInt("increment");
				session.setAttribute("increment",item_request.getInt("increment"));
				String username = item_request.getString("username");
				String clothingtype = item_request.getString("clothing_type");%>
				
				<% // table to show item descriptions %>
			
				<div align="center">
				<!-- logout form  -->			  
				<br>
				<form method="post" action="../auction/auction_redirect.jsp">
				<input type="submit" value="Auction Page">
				</form>
				<br>
				<b><br>BuyMe Item</br></b>
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
			
				<tr>
				<td><%=item_request.getInt("item_id") %></td>
				<td><%=item_request.getString("name") %></td>
				<td><%=item_request.getString("clothing_type") %></td>
				<td><%=initialprice%></td>
				<td><%=item_request.getInt("increment") %></td>
				<td><%=item_request.getDate("start_date") %></td>
				<td><%=item_request.getDate("end_date") %></td>
				<td><%=item_request.getInt("rating") %></td>
				<td><%=item_request.getString("username") %></td>
				</tr>
				</table>
				
				<hr noshade size="16">
				</div>
			<% 
			
			specific_item = stmt.executeQuery("select * from "+clothingtype+" where item_id = "+itemid+" ");
			if(specific_item.next()) {%>
				<%// item specifications (desc) %>
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
				<hr noshade size="16">
				
				<b><br>Auction Information</br></b>
				
				<%
				// bidding session. this should only occur if the user attribute in session != username
				// if the user is the seller, they cannot see the bid option.
				if(user.equals(username)) {
					%>
					<div align="center">
					<table border="1">
					<tr>
						<th>Seller Status</th>
						<td>Yes</td>
					</tr>

					</table>
					
					</div><% 
				} else {
					// condition where user is not a seller but they are a buyer --> they have access to the bid
					%>
					<div align="center">
					<table border="1">
					<tr>
						<th>Seller Status</th>
						<td>N/A</td>
					</tr>

					</table>
					
					</div>
					<% 
					

					item_bid =  stmt.executeQuery("select max(bid_value) from bids where item_id='"+itemid+"'"); 
					if(item_bid.next() && item_bid.getInt("max(bid_value)") != 0) {
						%>
						<div align="center">
						<table border="1">
						<tr>
							<th>Current Bid</th>
							<td>$ <%=item_bid.getInt("max(bid_value)") %></td>
						</tr>
						</table>
						</div>
						<% 
					} else {
						%>
						<div align="center">
						<table border="1">
						<tr>
							<th>Current Bid(Initial Price)</th>
							<td>$ <%=initialprice%></td>
						</tr>
						</table>
						</div>
						<% 
					}
					item_bid.close();
					
					
					
					// form to bid
					%>
					<br>
					
					<div align='center'> 
					<form method="post" action="../auction/bid_attempt.jsp">
					<table>
					<tr><td>Increase bid by</td><td><input type="number" value = 0 name="increase_bid_modifier"> * $<% out.println(" "+ incrementamt ); %></td></tr>
					<tr><td>Set max bid(Optional)</td><td><input type="number" value = 0 name="max_bid_modifier"> * $<% out.println(" "+ incrementamt); %></td></tr>
					</table>
					<input type="submit" value="Input Bid">
					</form>
					
					</div>
					
					<hr noshade size="16">
					<b><br>Bid Status </br></b>
					<div align="center">
					<form method="post" action="../auction/bid_status_check.jsp">
  					<input type="radio" id="item" name="item_id" value="<%=itemid%>" required>
  					<label for="item">Item ID: <%=itemid%></label><br>
  					<input type="submit" value="Check Bid Status"><input type="reset">
					</form>
					</div>
					
					
					<% 
				}
				%>
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
			out.print(e);
			out.println("error has occured.");%>
			<button type="button" name="back" onclick="history.back()">Try Again.</button>
		<%
		}
		
	%>
	
	

</body>
</html>
