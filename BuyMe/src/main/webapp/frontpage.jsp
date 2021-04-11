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

BuyMe Login Page

<table> 
<thead>
<tr> 

<!-- Customer Login -->
<th> 
<div class="card" style="width: 15rem;" >
  <div class="card-body">
    <h5 class="card-title">Customer</h5>
    <form method="post" action="login/customer_login_form.jsp">
    <input type ="submit" value="Login" >
    <input type ="submit" value="Register" formaction = "login/customer_register_form.jsp">
    </form>
  </div>
</div>
</th>

<!-- Customer Representative Login-->
<th> 
<div class="card" style="width: 15rem;" >
  <div class="card-body">
    <h5 class="card-title">Customer Representative </h5>
    <form method="post" action="login/representative_login_form.jsp">
    <input type ="submit" value="Login" >
    </form>
  </div>
</div>
</th>

<!-- Administrator Login -->
<th>
<div class="card" style="width: 15rem;" >
  <div class="card-body">
    <h5 class="card-title">Administrator </h5>
    <form method="post" action="login/admin_login_form.jsp">
    <input type ="submit" value="Login" >
    </form>
  </div>
</div>
</th> 
</tr>
</thead>
</table>
</div>



</html>