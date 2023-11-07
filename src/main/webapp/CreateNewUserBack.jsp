<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe - User Created</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="user_interface_login.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<!-- End Header -->
	<%
		try {
		//Get the database connection
		SqlConnection2 db = new SqlConnection2();	
		Connection connect = db.getConnection();
		
		//Create a SQL statement
		Statement stmt = connect.createStatement();
		
		String FirstName = request.getParameter("First_Name");
		String LastName = request.getParameter("Last_Name");
		String Email = request.getParameter("Email");
		String Username = request.getParameter("User_Name");
		String Password = request.getParameter("Password");

		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO clone.user(First_Name,Last_Name,Email,User_Name,Password)"
					+ "VALUES (?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = connect.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, FirstName);
			ps.setString(2, LastName);
			ps.setString(3, Email);
			ps.setString(4, Username);
			ps.setString(5, Password);

			ps.executeUpdate();

			connect.close();
			out.print("New User Created!");

		} 
	catch (Exception ex) 
	{
		out.print("Creation Failed, given username already exist!");
	}
	%>
</body>
</html>