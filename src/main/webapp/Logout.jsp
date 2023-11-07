<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
<title>Logout Success</title>
</head>
<body>
 
		<%
			session.invalidate();
			response.sendRedirect("user_interface_login.jsp");
		%>
		
		<h2>You have successfully logged out. </h2> 
</body>
</html>