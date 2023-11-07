<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<style>
	body {background-color: powderblue;}
	
	.table-style, th, td, tr
	{
		border: 1px solid black;
  		border-collapse: collapse;
  		padding: 20px;
  		margin-left: auto;
		margin-right: auto;
	}
	.createalert
	{
		text-align: center;
	}
	
</style>
<meta charset="ISO-8859-1">
<title>BuyMe: View Alerts</title>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="Home.jsp">BuyMe: Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link" href="DisplayAlert.jsp">My_Alerts</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AuctionHistory.jsp">Auction_History</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="postQuestion.jsp">Help_QA</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ChooseAuctionItem.jsp">Sell_Item</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="BidStatus.jsp">Bid_Alerts</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Logout.jsp">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<br><br><br>

<table class="table-style">
			<tr>
				<th>
					<%out.print("Product Type"); %>
				</th>
				<th>
					<%out.print("Model"); %>
				</th>
				<th>
					<%out.print("Brand"); %>
				</th>
				<th>
					<%out.print("Additional Description"); %>
				</th>
				<th>
					<%out.print("Status"); %>				
				</th>
			</tr>
<%
try
{
	SqlConnection2 db = new SqlConnection2();
	Connection con = db.getConnection();
	Statement stmt1 = con.createStatement();
	Statement stmt2 = con.createStatement();
	
	String query1 = "SELECT * FROM clone.product";
	String query2 = "SELECt * FROM clone.alerts";
	ResultSet rs2 = stmt1.executeQuery(query2);
	while(rs2.next())
	{
		boolean flag = false;
		ResultSet rs1 = stmt2.executeQuery(query1);
		while(rs1.next())
		{
			if(rs1.getString("product_Type").equalsIgnoreCase(rs2.getString("Product_Type")) && rs1.getString("Model").equalsIgnoreCase(rs2.getString("Model")) && rs1.getString("Brand").equalsIgnoreCase(rs2.getString("Brand")) && rs1.getString("Description").contains(rs2.getString("Description")))
			{
				if(rs1.getInt("Quantity") > 1)
				{
					flag = true;
				}
			}
		}
		
		
		%>
		<tr>
			<th><%out.println(rs2.getString("Product_Type")); %></th>
			<th><%out.println(rs2.getString("Model")); %></th>
			<th><%out.println(rs2.getString("Brand")); %></th>
			<th><%out.println(rs2.getString("Description")); %></th>
			<th>
<%
				if(flag)
				{
					out.print("Available");
				}
				else
				{
					out.print("Not Available");
				}
%>
			</th>
		</tr>
<%
		
		
		
		rs1.close();
	}
	rs2.close();
	stmt1.close();
	stmt2.close();
	con.close();	
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</table>

<br><br>
<div class="createalert">
	<p>Didn't find what you were looking for?<br>
	We can help you set up an alert and you will be notified when the product becomes available.</p>
	<form action="CreateAlert.jsp">
		<input type="submit" name="createalert" value="Create Alert?">
	</form>
</div>
<br><br>


</body>
</html>