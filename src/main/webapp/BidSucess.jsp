<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>
<%@ page import = "java.time.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BuyMe: Bid Success</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

</head>

<style>
	body
	{
		background-color:  #CBEBC3; 
		
	}
	
.buttonHolder{ text-align: center; }
input {
  border-top-style: hidden;
  border-right-style: hidden;
  border-left-style: hidden;
  border-bottom-style: groove;
  background-color: #eee;
  text-align: center;
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

 
	<h1 style = "font-family: monospace; text-align: center"> Your bid has been successfully placed. </h1><br>
	<h2 style = "font-family: monospace; text-align: center"> Would you Like to set up auto bidding? </h2><br>
	
	<div class = "buttonHolder">
		<form  action = "Bidding_Buying" method = "Post">
 			<h2 style = "font-family: monospace">Increment Price: </h2>
 			<input type = "text" Placeholder = "Increment Price" name = "Increment" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
 			<h2 style = "font-family: monospace">Upper Limit: </h2>
 			<input type = "text" placeholder = "Upper Limit" name = "UpperLimit" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px"><br><br>
 			<input type = "submit" Value = "Set" name = "AutoSet" style = "height:50px; width:100px; font-family: monospace; border-radius: 5px; background-color: #FFF3DB"><br><br>
 		</form>
 		
 		<form action = "Home.jsp" >
 			<input type = "submit" Value = "Return to home page" name = "homePage" style = "height:50px; width:250px; font-family: monospace; border-radius: 5px; background-color: #FFF3DB">
 		</form>		
	</div>
	


</body>
</html>