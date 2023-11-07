<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Report - Earning Per</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="SalesReport.jsp"><input type="submit" value="Back"></form>
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
			
			String type = request.getParameter("Type");
			
			String str;
			
			if (type.equals("Item")){ 
				str = "SELECT * FROM clone.Product p JOIN clone.product_for_auction pfa ON p.Pid=pfa.Pid JOIN clone.Auctions a ON a.Auction_Num=pfa.Auction_Num";
						//"SELECT p.Pid, p.Brand, p.Model, p.Color, p.Storage_Cap, a.Winning_Price FROM product AS p LEFT JOIN auctions AS a USING (Pid) GROUP BY Pid";
				}
			else if (type.equals("Item_Type")){
				str = "SELECT p.Brand, SUM(a.Winning_Price) AS Total FROM clone.Product p JOIN clone.product_for_auction pfa ON p.Pid=pfa.Pid JOIN clone.Auctions a ON a.Auction_Num=pfa.Auction_Num GROUP BY p.Brand";
						//"SELECT p.Brand, SUM(a.Winning_Price) AS Total FROM product AS p LEFT JOIN auctions AS a USING (Pid) GROUP BY p.Brand";
				}
			else {
				str = "SELECT a.User_Name, SUM(a.Winning_Price) AS Total FROM auctions AS a GROUP BY User_Name";
				}
		

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			Boolean APPLE = false;
			Boolean SAMSUNG = false;
			Boolean HP = false;
			
			out.print("<h4>");
			//print out column header
			out.print("Earning Per " + type);
			out.print("</h4>");
			

			
		//<!--  Make an HTML table to show the results in: -->
			out.print("<table border=\"1\">");
			out.print("<tr>");
			if (type.equals("Item")) {
				out.print("<td>");
				out.print("ProductId: ");
				out.print("</td>");
				out.print("<td>");
				out.print("Manufacturer: ");
				out.print("</td>");
				out.print("<td>");
				out.print("ProductName: ");
				out.print("</td>");
				out.print("<td>");
				out.print("Color: ");
				out.print("</td>");
				out.print("<td>");
				out.print("Capacity(GB):");
				out.print("</td>");
				out.print("<td>");
				out.print("Earning: ");
				out.print("</td>");
				
			}
			else if (type.equals("Item_Type")) {
				out.print("<td>");
				out.print("Manufacturer: ");
				out.print("</td>");
				out.print("<td>");
				out.print("Earning: ");
				out.print("</td>");
			}
			else {
				out.print("<td>");
				out.print("User: ");
				out.print("</td>");
				out.print("<td>");
				out.print("Earning: ");
				out.print("</td>");
			}
			out.print("</tr>");
			//parse out the results
			if (!result.isBeforeFirst()){
				if (type.equals("Item")) {
					out.print("<br> Nothing Has Been Sold Yet!");
				}
				else if (type.equals("Item_Type")){
					out.print("<tr>");
					out.print("<td>");
					out.print("APPLE");
					out.print("</td>");
					out.print("<td>");
					out.print("0");
					out.print("</td>");
					out.print("</tr>");
					
					out.print("<tr>");
					out.print("<td>");
					out.print("SAMSUNG");
					out.print("</td>");
					out.print("<td>");
					out.print("0");
					out.print("</td>");
					out.print("</tr>");
					
					out.print("<tr>");
					out.print("<td>");
					out.print("HP");
					out.print("</td>");
					out.print("<td>");
					out.print("0");
					out.print("</td>");
					out.print("</tr>");
				}
				else{
					out.print("<br> Nothing Has Been Sold Yet!");
				}
			}
			else { 
				while (result.next()) {
					out.print("<tr>");

					if (type.equals("Item")) {
						out.print("<td>");
						out.print(result.getString("Pid"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Brand"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Model"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Color"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Storage_Cap"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Winning_Price"));
						out.print("</td>");
						
					}
					else if (type.equals("Item_Type")) {
						out.print("<td>");
						out.print(result.getString("Brand"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Total"));
						out.print("</td>");
						if (result.getString("Brand").equals("Apple")) APPLE = true;
						else if (result.getString("Brand").equals("SAMSUNG")) SAMSUNG = true;
						else HP = true;
					}
					else {
						out.print("<td>");
						out.print(result.getString("User_Name"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Total"));
						out.print("</td>");
					}
					out.print("</tr>");
				}
			
			}
			
		
			//close the connection.
			out.print("</table>");
			db.closeConnection(con);

			
		} catch (Exception e) {
			//out.print("No Completed Transcation Yet!");
			e.printStackTrace();
		}%>

</body>
</html>