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

BuyMe Buyer Functions


<!-- logout form  -->			  
	<br>
		<form method="post" action="../login/logout_customer_form.jsp">
		<input type="submit" value="Logout"><input type="submit" value="User Options" formaction="../auction/auction_home.jsp">
		</form>
	<br>

<table> 
<thead>
<tr> 

<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Items That User Is Interested In</h5>
    <form method="post" action="../buyer/watchlisted_items_alert.jsp">
    <input type ="submit" value="Watched List Items" >
   
    </form>
  </div>
</div>
</th>

<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">All Items User Placed Bid On </h5>
    <form method="post" action="../buyer/all_item_bidded.jsp">
    <input type ="submit" value="Access Item Bids" >
    </form>
  </div>
</div>
</th>

</tr>
</thead>
</table>



</tr>
</thead>
</table>

<hr noshade size="16">

<table>
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Alert: Check Which Auction User Bid Is Winning</h5>
    <form method="post" action="../buyer/winning_bid_alert.jsp">
    <input type ="submit" value="Access Winning Auctions" >
    </form>
  </div>
</div>
</th>

<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Alert: Higher Bid Placed </h5>
    <form method="post" action="../buyer/losing_bid_alert.jsp">
    <input type ="submit" value="Access Out-bidded Items" >
    </form>
  </div>
</div>
</th>

<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Alert: Auctions Won</h5>
    <form method="post" action="../buyer/items_won_alert.jsp">
    <input type ="submit" value="Access Items Won" >
    </form>
  </div>
</div>
</th>


</table>







</html>
