<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Service Representative Home</title>
</head>
<body>
<table> 
<thead>
	<tr>
		<th>
			<h2>Edit Customer Information</h2>
			<form method="post" action="modify_customer.jsp">
				<table>
				<tr>    
				<td>Username</td><td><input type="text" name="username"></td>
				</tr>
				<tr>
				<td>Change password</td><td><input type="text" name="password"></td>
				</tr>
				<tr>
				<td>Change email</td><td><input type="text" name="email"></td>
				</tr>
				<tr><td>
				<br>
				</table>
				<input type="submit" value="Edit">
				<input type="submit" value="Go Back" formaction = "representative_home.jsp">
			</form>
		</th>
	</tr>
</thead>
</table> 
</body>
</html>