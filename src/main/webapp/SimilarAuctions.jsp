<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>
<%@ page import = "java.time.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BuyMe: View Auction</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

</head>
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
					<%out.print("Auction Number"); %>
				</th>
				<th>
					<%out.print("Product Description"); %>
				</th>
				<th>
					<%out.print("Initial Price"); %>
				</th>
				<th>
					<%out.print("Winner"); %>
				</th>
				<th>
					<%out.print("Winning Price"); %>
				</th>
			</tr>


<%
try
{
	SqlConnection2 db = new SqlConnection2();
	Connection con = db.getConnection();
	Statement s = con.createStatement();
	Statement stmt = con.createStatement();
	Statement stmt1 = con.createStatement();
	HttpSession sess = request.getSession(false);
	int pid = (int)sess.getAttribute("productID");
	String query = "SELECT * FROM clone.product WHERE Pid='"+pid+"'";
	ResultSet rs = s.executeQuery(query);
	rs.next();
	String brand = rs.getString("Brand");
	String model = rs.getString("Model");
	String q = "SELECT * FROM clone.Product p JOIN clone.product_for_auction pfa ON p.Pid=pfa.Pid JOIN clone.Auctions a ON a.Auction_Num=pfa.Auction_Num WHERE p.Pid!='"+pid+"' AND p.Brand='"+brand+"' AND p.Model='"+model+"'";
	ResultSet rows = stmt.executeQuery(q);
	
	String currentDate = (LocalDate.now()).toString();
	String query3="";
	boolean status=false;
	while(rows.next())
	{
		status = false;
		int c=100;
		if(rows.getInt("Active") == 0)
		{
			query3 = "SELECT DATEDIFF('"+rows.getString("End_Date_Time")+"', '"+currentDate+"') AS DayLeft";
			ResultSet remaining = stmt1.executeQuery(query3);
			remaining.next();
			currentDate = remaining.getString("DayLeft");
			if(currentDate != null)
				c = Integer.parseInt(currentDate);
			c = Math.abs(c);
			if(c>=0 && c<=30)
			{
				status = true;
			}
			remaining.close();
		}
		if(status)
		{
%>
			<tr>
				<th><%out.println(rows.getInt("Auction_Num")); %></th>
				<th><%out.println(rows.getString("Description")); %></th>
				<th><%out.println(rows.getInt("Initial_Price")); %></th>
				<th><%out.println(rows.getString("Winner")); %></th>
				<th><%out.println(rows.getInt("Winning_Price")); %></th>
			</tr>
<%
		}
	}
	
	rs.close();
	stmt1.close();
	rows.close();
	s.close();
	stmt.close();
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