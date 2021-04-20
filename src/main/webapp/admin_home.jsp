<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
</head>
<body>
<table> 
<thead>
<tr> 
 <th>
    <h5 class="card-title">Customer Service Representatives</h5>
    <form method="post" action="login/register_representative_form.jsp"> 
    <input type ="submit" value="Register">
    <input type ="submit" value="Delete Account" formaction = "login/delete_representative_form.jsp">
 	</form>
 </th>
</thead>
</table>
</body>
</html>