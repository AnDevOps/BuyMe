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
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String user_type = request.getParameter("user_type");

			ResultSet login_info;
			if(user_type.equals("User")) login_info = stmt.executeQuery("select * from users where username='"+username+"' and password='"+password+"'");
			else if (user_type.equals("Customer Representatives")) login_info = stmt.executeQuery("select * from CustomerServiceRep where username='"+username+"' and password='"+password+"'");
			else login_info = stmt.executeQuery("select * from admin where username='"+username+"' and password='"+password+"'");
			
	
			//close the connection.
			con.close();

		} catch (Exception e) {
			//out.print(e);
			out.println("Login Failed. Invalid login credentials");
		}
		
	%>
	
	
	<button type="button" name="back" onclick="history.back()">log out</button>

</body>
</html>
