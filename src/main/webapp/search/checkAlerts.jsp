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
	<%
	try{
		String user = (String)session.getAttribute("user"); 
		ApplicationDB db = new ApplicationDB(); 
		Connection con = db.getConnection(); 
		
		//Create sql statement 
		Statement stmt = con.createStatement(); 
		String sqlQuery = "select * from items, lookingfor where lookingfor.username = '" + user + "' and items.name = lookingfor.item_name and items.username != '" + user + "';";
		System.out.println(sqlQuery);
		ResultSet result = stmt.executeQuery(sqlQuery);
		
		if(result == null){ 
			%>
			<form method="post" action="chooseQueryPage.jsp">
			<input type ="submit" value="No auctions yet." >
			</form>
			<% 		
		} else {
			%>
			<div style ="overflow-y:auto" align='center'>
			<table border="2">
			<tr>
			<td>Item ID</td>
			<td>Name</td>
			<td>Clothing Type</td>
			<td>Start Date</td>
			<td>End Date</td>
			<td>Seller</td>
			<td>Rating</td>
			</tr>
	
			<% 
			while(result.next()){
%>
				<tr>
				<td><%=result.getInt("item_id") %></td>
				<td><%=result.getString("name") %></td>
				<td><%=result.getString("clothing_type") %></td>
				<td><%=result.getDate("start_date") %></td>
				<td><%=result.getDate("end_date") %></td>
				<td><%=result.getString("username") %></td>
				<td><%=result.getInt("rating") %></td>
				</tr>
			<% 	
			}
			%>
			</table>
			</div>		
			
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
			
			<div align='center'> 
			<form method="post" action="removeAlert.jsp">
			<table>
			<tr>    
			<td>Item Name</td><td><input type="text" name="item_name"> <input type="submit" value="Remove Alert"> </td> 
			</tr>
			<tr><td>
			</table>
			</form>
			</div>
			
			<form method="post" action="alert.jsp">
			<input type ="submit" value="Create Alert" >
			</form>
			<% 
			
		}
	}catch(Exception E){
		
	}
	%>

</body>
</html>