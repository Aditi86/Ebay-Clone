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
	<form style="display: inline;" method="post" action="RemoveBidsFront.jsp"><input type="submit" value="Back"></form>
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

			String Id = request.getParameter("Id");
			String productId = request.getParameter("productID");
			
			Boolean Winner, CurrentWinner;
			String check = "Select * FROM clone.Bid_Information LEFT JOIN Auction Using (productId) WHERE productId = " + productId +" AND Bid_Information.currentBid = Auction.HighestBid";
			ResultSet result = stmt.executeQuery(check);
			
			
					String delete = "DELETE FROM clone.Bid_Information WHERE BidId = " + Id;
					PreparedStatement ps = connect.prepareStatement(delete);
					ps.executeUpdate();
					String update = "UPDATE clone.Auction SET HighestBid = (Select Max(currentBid) From Bid_Information Where productId = " + productId + ") WHERE productId = " + productId ;
					ps = connect.prepareStatement(update);
					ps.executeUpdate();
					
					out.print("Success! This Bid No Longer Exists!");
				
			
		
			connect.close();
			
		} catch (Exception ex) {
			out.print("Something Went Wrong!");
		}
%>
</body>
</html>
