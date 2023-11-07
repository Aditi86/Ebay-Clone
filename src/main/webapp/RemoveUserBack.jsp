<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Bid</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="RemoveUser.jsp"><input type="submit" value="Back"></form>
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

			String User = request.getParameter("user");
			
			//Make an insert statement for the Sells table:
			String delete = "DELETE FROM clone.user WHERE User_Name = \"" + User + "\"";

			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = connect.prepareStatement(delete);
			
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.executeUpdate();
			connect.close();
			out.print("Success! This User No Longer Exists!");
			
		} catch (Exception ex) {
			out.print("Oops! Something Went Wrong!");
		}
%>
</body>
</html>
