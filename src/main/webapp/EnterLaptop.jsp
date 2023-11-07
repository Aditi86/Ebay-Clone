<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>
<%@ page import = "java.time.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Me</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

</head>
<style>
	body
	{
		background-color:  #e6f3ff; 
		
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
	
		<h2 style = "font-family: monospace"> Enter information about your Laptop/s.</h2>
		
		<h3 style = "font-family: monospace">Brand: </h3>
		<input type = "text" placeholder = "Brand Name" name = "Brand" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Model: </h3>
		<input type = "text" placeholder = "Model Name" name = "Model" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Color: </h3>
		<input type = "text" placeholder = "Color" name = "Color" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Storage: </h3>
		<input type = "text" placeholder = "Storage" name = "Storage" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Ram: </h3>
		<input type = "text" placeholder = "Ram" name = "Ram" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Processor: </h3>
		<input type = "text" placeholder = "Processor" name = "Processor" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Screen size: </h3>
		<input type = "text" placeholder = "Screen size" name = "ScreenSize" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Screen Type: </h3>
		<input type = "text" placeholder = "Screen type" name = "ScreenType" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Condition: </h3>
		<input type = "text" placeholder = "Condition" name = "Condition" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Quantity: </h3>
		<input type = "number" placeholder = "Quantity" name = "Quantity" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Description: </h3>
		<textarea rows = "5" cols = "60" placeholder = "Description" name = "Description" style = "height:70px; width:300px; font-family: monospace; border-radius: 5px"> </textarea> <br>
		
		<input type = "submit" Value = "Next" name = "auction2" style = "height:30px; width:100px; font-family: monospace; border-radius: 5px">
		

	</form>
</body>
</html>