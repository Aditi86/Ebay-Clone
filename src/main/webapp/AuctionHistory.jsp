<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>
<%@ page import = "java.time.*" %>

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
</style>
<meta charset="ISO-8859-1">
<title>BuyMe: Auction History</title>
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

<form action = "BidHistory.jsp">
		<p class="text-center">
			<span style="font-size: 20px">Please enter the Auction Number that you want to see the bid history for:</span><br>
			<input type="text" name="pinput" placeholder="Enter Auction Number"><br>
			<input type="Submit" name="asubmit" value="View Bid History?">
		</p>
</form>


<table class="table-style">
			<tr>
				<th>
					<%out.print("Auction Number"); %>
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
	HttpSession sess = request.getSession(false);
	String name = (String)sess.getAttribute("user");
	String query = "SELECT DISTINCT a.Auction_Num, a.Active, a.End_Date_Time, a.Winner FROM clone.buyer_bids b, clone.auctions a WHERE b.Auction_Num=a.Auction_Num AND b.User_Name='"+name+"'";
	ResultSet rs = stmt1.executeQuery(query);
	String flag = "";
	while(rs.next())
	{
		if(rs.getInt("Active") == 1)
		{
			flag = "This auction is active. It ends on " + rs.getString("End_Date_Time");
		}
		else
		{
			flag = "The auction has ended. The winner is " + rs.getString("Winner");
		}
%>
			<tr>
				<th><%out.println(rs.getInt("Auction_Num")); %></th>
				<th><%out.println(flag); %></th>
			</tr>
<%
	}
	
	
	rs.close();
	stmt1.close();
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</table><br><br>
</body>
</html>