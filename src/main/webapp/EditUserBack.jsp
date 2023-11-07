<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="3;url=Login-Front.jsp" />
<title></title>
</head>
<body>
<%
	session.setAttribute("Modify User", request.getParameter("user"));
	String Type = request.getParameter("Type");
	if (Type.equals("Password")){response.sendRedirect("EditPassword.jsp");}
	else if (Type.equals("Email")) {response.sendRedirect("EditEmail.jsp");}
	else {}
%>

</body>
</html>
