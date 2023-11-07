<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Admin</title>
</head>
<body>

	Welcome <%=session.getAttribute("admin") %> To BuyMe
	
		<div style="float: right;">
			<form style="display: inline;" method="post" action="logout.jsp"> <input type="submit" value="logout"></form>
		</div>
		<div style="clear: both;"></div>
		<hr/>
	<!-- End Header -->
	<h2>Admin Page</h2>
	
	<h3>Creating New Customer Representative Account</h3>
	<form method="post" action="CreateNewCustomerRep.jsp">
		<table>
			<tr>
				<td>Name:</td><td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>Username:</td><td><input type="text" name="username" required></td>
			</tr>
			<tr>
				<td>Password:</td><td><input type="password" name="password" required></td>
			</tr>
		</table>
	
		<input type="submit" value="Create">
	</form>
	
	<br><form style="display: inline;" method="post" action="SalesReport.jsp"> <input type="submit" value="SalesReport"></form>
	
</body>
</html>
