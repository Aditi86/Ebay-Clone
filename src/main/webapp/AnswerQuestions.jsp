<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>
<%@ page import = "java.time.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div style="float: right;">
	<form style="display: inline;" method="post" action="CustomerRepPage.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>

	<% try{
	
			//Get the database connection
			SqlConnection2 db = new SqlConnection2();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT questionId, question FROM clone.Question_Answers WHERE isAnswered = 0";

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<h3>Unanswered Questions</h3>
	<table border = "1">
		<tr>  
			<td> Ticket Number  </td>
			<!-- There will be a 5px space here -->
			<td> Question  </td>
			<!-- There will be a 5px space here -->
		</tr>
		
				<%
			//parse out the results
			if (!result.isBeforeFirst()){
				out.print("All Questions Has Been Answered!");
			}
				
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("questionId") %></td>
					<!-- There will be a 5px space here -->
					<td><%= result.getString("question") %></td>
					<!-- There will be a 5px space here -->
				</tr>
			<% } 
		
			//close the connection.
			db.closeConnection(con);
			%>
		</table>
		<br>
		<br>
		<form method="post" action="AnswerQuestionsBack.jsp">
		<table>
			<tr>
				<td>Ticket Number:</td><td><input type="text" name="Ticket_Number" required></td>
			</tr>
			<tr>
				<td>Response :</td><td><input type="text" name="Answer" style = "height:120px; width:200px;" required></td>
			</tr>
		</table>
	
		<input type="submit" value="Post Answer">
	</form>
			
		<%} catch(Exception e) {
			out.print("Error");
		} %>

</body>
</html>
