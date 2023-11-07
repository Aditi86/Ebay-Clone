<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.time.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
.image{
	width: 250px;
    height: 250px;
    align: center;
}
h1{
	font-size: 40px;
	text-align: center;
}
</style>

</head>
<body>
<br><br><br><br><br>
<center><img class="image" src="img/logo.png"></center>

<center>
<h2>Sign in to BuyME or 
<a id="create-account-link" href="CreateNewUserFront.jsp">Create an Account</a>
</h2>
	<form action="LoginCheck.jsp" method="POST">
       UserName: <input type="text" name="Username"/> <br><br>
       Password: <input type="password" name="Password"/> <br><br>
       Log-in as 
			<select name="Login_Type" size=1 required>
				<option value="admin">Admin</option>
				<option value="customer_representative">Customer Representative</option>
				<option value="user">User</option>
			</select>
			<br><br>
			<input type="submit" value="Login">
     </form>
</center>

</body>
</html>