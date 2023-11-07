<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>
<%@ page import = "java.time.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<style>
	body
	{
		background-color:  #FAD6A5; 
		
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


<form action = "StoreAuction" method = "Post">
	
		<h2 style = "font-family: monospace"> Enter information about your auction.</h2>
		
		<h3 style = "font-family: monospace">Price: </h3>
		<input type = "number" placeholder = "Price" name = "Price" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Increment amount: </h3>
		<input type = "number" placeholder = "Increment Amount" name = "IncrementAmount" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Minimum amount: </h3>
		<input type = "number" placeholder = "Minimum Amount" name = "MinimumAmount" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Shipping type: </h3>
		<input type = "text" placeholder = "eg. UPS, FedEx" name = "Shipping" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >End date: </h3>
		<input type = "Date" placeholder = "Date" name = "Date" style = "height:40px; width:150px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >End Time: </h3>
		<input type = "Time" placeholder = "Time" name = "Time" style = "height:40px; width:100px; font-family: monospace; border-radius: 5px">
		
		<input type = "submit" Value = "Done" name = "Done" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">
		

	</form>
</body>
</html>