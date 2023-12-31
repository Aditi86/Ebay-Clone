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
<title>BuyMe: Bid History</title>
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
<%
try
{
	SqlConnection2 db = new SqlConnection2();
	Connection con = db.getConnection();
	Statement stmt1 = con.createStatement();
	HttpSession sess = request.getSession(false);
	String name = (String)sess.getAttribute("user");
	String input = request.getParameter("pinput");
	String query = "SELECT * FROM clone.buyer_bids WHERE User_Name='"+name+"' AND Auction_Num='"+input+"'";
	ResultSet rs = stmt1.executeQuery(query);
%>
	<p class="text-center"><span style="font-size: 25px">Bid History for Auction Number <%out.print(input); %></span></p>
	<table class="table-style">
			<tr>
				<th>
					<%out.print("Bid Price"); %>
				</th>
				<th>
					<%out.print("Bid Date & Time"); %>
				</th>
				<th>
					<%out.print("Upper Limit"); %>
				</th>
				<th>
					<%out.print("Increment Price"); %>
				</th>
			</tr>
<%
	while(rs.next())
	{
%>
			<tr>
				<th><%out.println(rs.getInt("Bid_Price")); %></th>
				<th><%out.println(rs.getString("Date_Time")); %></th>
				<th><%out.println(rs.getInt("Upper_Limit")); %></th>
				<th><%out.println(rs.getString("Increment_Price")); %></th>
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