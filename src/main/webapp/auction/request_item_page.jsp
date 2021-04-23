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
			ResultSet item_request = stmt.executeQuery("select * from items where item_id='"+item_id+"'and end_date > now()");
			
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
				String username = item_request.getString("username");
				String clothingtype = item_request.getString("clothing_type");%>
				
				<% // table to show item descriptions %>
			
				<div align="center">
				<!-- logout form  -->			  
			
				<form method="post" action="../auction/auction_redirect.jsp">
				<input type="submit" value="Auction Page">
				</form>
				<br>
				<b><br>BuyMe Item Page</br></b>
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
				<td><%=item_request.getTimestamp("start_date") %></td>
				<td><%=item_request.getTimestamp("end_date") %></td>
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
				
				<div align="center">
				<form method="post" action="../buyer/watchlist_attempt.jsp">
				<input type="submit" value="Add Item To Watch List">
				</form>
				
				</div>
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
						</table>	<hr noshade size="16">
						</div>
						<% 
					}
			
					//now check if user can make the first bid on the item rather than subsequent bids
					 item_bid =  stmt.executeQuery("select * from bids  where item_id = '"+item_id+"' and username != 'default_bid' "); 
					if(item_bid.next()){
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
					}else{
						%>
							<div align="center">
							<form method="post" action="../auction/first_bid_attempt.jsp">
		 					<label for="item">Make initial bid?</label><br>
		 					Yes<input type="radio" id="item" name="item_id" value="<%=itemid%>" required><br>
		 					<input type="submit" value="submit">
							</form>
							</div>
						
						<% 
					}
					
					
					
				}
				%>
				<% 
				} else {
					out.println("The requested page for the item id does not exist.");
				%>
					<button type="button" name="back" onclick="history.back()">Try Again.</button>
				<%
				}
			} else {
				//check if the auction has ended first
		
				ResultSet date_request = stmt.executeQuery("select * from items where item_id='"+item_id+"'and end_date < now()");
				
				if(date_request.next()) {	
					
					//this item has ended - get the max bid for it and compare to current user, store min_win first
					int reserve = date_request.getInt("min_win");	
							
					//display item info here	
					int initialprice = date_request.getInt("initial_price");
					String clothingtype = date_request.getString("clothing_type");
					int itemid = date_request.getInt("item_id");
					 // table to show item descriptions %>
				
					<div align="center">
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
					<td><%=date_request.getInt("item_id") %></td>
					<td><%=date_request.getString("name") %></td>
					<td><%=date_request.getString("clothing_type") %></td>
					<td><%=initialprice%></td>
					<td><%=date_request.getInt("increment") %></td>
					<td><%=date_request.getTimestamp("start_date") %></td>
					<td><%=date_request.getTimestamp("end_date") %></td>
					<td><%=date_request.getInt("rating") %></td>
					<td><%=date_request.getString("username") %></td>
					</tr>
					</table>
					
					<hr noshade size="16">
					</div>
				<% 
				
				date_request = stmt.executeQuery("select * from "+clothingtype+" where item_id = "+itemid+" ");
				if(date_request.next()) {%>
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
					<td><%=date_request.getString("size") %></td>
					<td><%=date_request.getString("gender") %></td>
					<td><%=date_request.getString("color") %></td>
					<td><%=date_request.getString("type") %></td>
					<td><%=date_request.getString("clothing_type") %></td>
					</tr>
					</table>
					<hr noshade size="16">
					
					<b><br>Auction Information</br></b>
					
					<%
							
					date_request = stmt.executeQuery("select * from bids where bid_value in (select max(bid_value) from bids group by item_id) and item_id = '"+item_id+"' ");
						//if we successfully query the max bid for the item check that the username = current user and that the current bid > reserve
					if(date_request.next()) {
						if ( (date_request.getString("username").equals(user)) && (date_request.getInt("bid_value") >= reserve) ){
							%>
							You have won this item!
							<%
						//else if max_bid > reserve - what do?
						}else{
							%>
							You did not win this item! Better luck next time sport!
							<%
						}
					}else{
						out.println("The requested page for the item id does not exist.");
						%>
							<button type="button" name="back" onclick="history.back()">Try Again.</button>
						<%
					}
				
				//if query pulls nothing then the item_id is n/a
				}else{
					out.println("The requested page for the item id does not exist.");
				%>
					<button type="button" name="back" onclick="history.back()">Try Again.</button>
				<%
				}
				
			}
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
