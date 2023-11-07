<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

<%
    String userid = request.getParameter("Username");   
    String pass = request.getParameter("Password");
    String Login_Type = request.getParameter("Login_Type");
    
    SqlConnection2 db = new SqlConnection2();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet rs1;
    if (Login_Type.equals("user"))
    {
    	rs1 = stmt.executeQuery("select * from clone.user where User_Name='" + userid + "'");
    }
    else if (Login_Type.equals("admin"))
    {
        rs1 = stmt.executeQuery("select * from clone.AdminInformation where username='" + userid + "'");
    }
    else
    {
        rs1 = stmt.executeQuery("select * from clone.CustomerRepInformation where username='" + userid + "'");
    }
    
    if(Login_Type.equals("user"))
    {
    	if(rs1.next())
    	{
    		ResultSet rs2;
    	    rs2 = stmt.executeQuery("select * from clone.user where User_Name='" + userid + "' and Password='" + pass + "'");
    	    if(rs2.next())
    	    {
    	    	session.setAttribute("user", userid);
    	        response.sendRedirect("Home.jsp");
    	    }
    	    else
    	    {
    	        out.println("Invalid password <a href='user_interface_login.jsp'>try again</a>");
    	    }
    	}
	    else
	    {
	    	out.println("Username doesn't exist <a href='user_interface_login.jsp'>try again</a>");
	    }
    }
    
	if (Login_Type.equals("admin"))
	{
		if (rs1.next())
     	{
    		ResultSet rs2;
   	    	rs2 = stmt.executeQuery("select * from clone.AdminInformation where username='" + userid + "' and password='" + pass + "'");
   	    	if(rs2.next()) 
   	    	{
   	    		session.setAttribute("admin", userid); 
   	        	response.sendRedirect("AdminPage.jsp");
   	    	}
	   	    else
	   	    {
	   	        out.println("Invalid password <a href='user_interface_login.jsp'>try again</a>");
	   	    }
    	}
    	else
	    {
	    	out.println("Username doesn't exist <a href='user_interface_login.jsp'>try again</a>");
	    }
   }
   
	if(Login_Type.equals("customer_representative"))
   	{
    	if(rs1.next())
    	{
   			ResultSet rs2;
   	    	rs2 = stmt.executeQuery("select * from clone.CustomerRepInformation where username='" + userid + "' and password='" + pass + "'");
   	    	if(rs2.next()) 
   	    	{
   	    		session.setAttribute("customerRep", userid); 
   	        	response.sendRedirect("CustomerRepPage.jsp");
   	    	}
   	    	else
   	    	{
   	        	out.println("Invalid password <a href='user_interface_login.jsp'>try again</a>");
   	    	}
   		}
   		else
   		{
   			out.println("Username doesn't exist <a href='user_interface_login.jsp'>try again</a>");
   		}
   }

    try
    { 
    	rs1.close(); 
    }
    catch(Exception e) 
    {
    	
    }
    
    try 
    { 
    	stmt.close(); 
    }
    catch(Exception e)
    {
    	
    }
    
    try 
    { 
    	con.close();
    }
    catch(Exception e)
    {
    	
    }
%>

</body>
</html>