<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe - New User</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="user_interface_login.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<!-- End Header -->

	<h3>Creating New User Account</h3>
	<form method="post" action="CreateNewUserBack.jsp">
		<table>
			<tr>
				<td>FirstName:</td><td><input type="text" name="First_Name" required></td>
			</tr>
			<tr>
				<td>LastName:</td><td><input type="text" name="Last_Name" required></td>
			</tr>
			<tr>
				<td>Email:</td><td><input type="text" name="Email" required></td>
			</tr>
			<tr>
				<td>UserName:</td><td><input type="text" name="User_Name" required></td>
			</tr>
			<tr>
				<td>Password:</td><td><input type="password" name="Password" required></td>
			</tr>
		</table>
	
		<input type="submit" value="Create New Account">
	</form>
</body>
</html>
