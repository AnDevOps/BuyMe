<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserPage</title>
</head>
<body>

</body>
</html>
<%
	try{
		ApplicationDB db = new ApplicationDB(); 
		Connection con = db.getConnection(); 
		//Create sql statement 
		Statement stmt = con.createStatement(); 
		String userName = request.getParameter("userName");

		String sqlQuery = "select * from users where users.username like '%"; 
		sqlQuery+= userName; 
		sqlQuery+= "%' ";
		ResultSet result = stmt.executeQuery(sqlQuery);

	} catch(Exception E){
		
	}

%>