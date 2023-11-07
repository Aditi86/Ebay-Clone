<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify User Info</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="CustomerRepPage.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<!-- End Header -->
	<% try {
	
			//Get the database connection
			SqlConnection2 db = new SqlConnection2();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM clone.user";

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<h3>List of Users</h3>
	<table border = "1">
	
		<tr>  
			<td> Username </td>
			<!-- There will be a 5px space here -->
			<td> Password </td>
			<!-- There will be a 5px space here -->
			<td> Email </td>
			<!-- There will be a 5px space here -->
		</tr>
		
				<%
			//parse out the results
			if (!result.isBeforeFirst()){
				out.print("No Users Yet!");
			}
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("User_Name") %></td>
					<!-- There will be a 5px space here -->
					<td><%= result.getString("Password") %></td>
					<!-- There will be a 5px space here -->
					<td><%= result.getString("Email") %></td>
					<!-- There will be a 5px space here -->
					
				</tr>
			<% }
		
			//close the connection.
			db.closeConnection(con);
			%>
		</table>
		<br>
		<br>
		<form method="post" action="EditUserBack.jsp">
		<table>
			<tr>
				<td>Selected User To Modify:</td><td><input type="text" name="user" required></td>
			</tr>
			<tr>
			</tr>
		</table>
		What to Modify: 
		<select name="Type" size=1 required>
			<option value="Password">Password</option>
			<option value="Email">Email</option>
		</select>
	
		<input type="submit" value="Submit">
	</form>
			
		<%} catch (Exception e) {
			out.print("Error");
		}%>

</body>
</html>
