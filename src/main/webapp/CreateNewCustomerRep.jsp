<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Creating Customer Rep</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="AdminPage.jsp"><input type="submit" value="Back"></form>
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

			String Username = request.getParameter("username");
			String Password = request.getParameter("password");
			String Name = request.getParameter("name");


			String get = "Select AdminId FROM clone.AdminInformation WHERE username = \"" + session.getAttribute("admin").toString() + "\"";
			
			ResultSet result = stmt.executeQuery(get);
			
			result.next();
			String Admin_ID = result.getString("AdminId");
			result.close();
			//Make an insert statement for the Sells table:
			String insert = "INSERT INTO clone.CustomerRepInformation(username, password, name, AdminId)"
					+ "VALUES (?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = connect.prepareStatement(insert);
	
			ps.setString(1, Username);
			ps.setString(2, Password);
			ps.setString(3, Name);
			ps.setString(4, Admin_ID);
			
			ps.executeUpdate();
	
			connect.close();
			out.print("New Customer Rep. Created!");
			
		} catch (Exception ex) {
			out.print("Creation Failed, given username already exist!");
		}
%>
</body>
</html>