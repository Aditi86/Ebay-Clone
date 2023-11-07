<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" %>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
<title>BuyMe: Auction Services</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/site.css">
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Monoton&display=swap');
		body {background-color: powderblue;}
		
		main>.container {
		    padding: 60px 15px 0;
		}
		
		main>.container-fluid {
		    padding-top: 60px;
		}
		
		body> main {
		    margin-top: 20px;
		    margin-bottom: 40px;
		}
		
		.homeBG {
		    width: 100%;
		    background: url(/img/GridBG.png);
		    background-repeat: no-repeat;
		    background-position: center;
		    background-size: cover;
		    background-attachment: fixed;
		}
		
		.homeText {
		    font-family: 'Monoton', cursive;
		    color: yellow;
		}
		
		.minHeight {
		    min-height: 80vh;	    
		}
	</style>
</head>
<body class="d-flex flex-column h-100">

<%
		HttpSession sess = request.getSession(false);
		String name = (String)sess.getAttribute("user");
	
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		
		if(session.getAttribute("user")==null)
		{
		    response.sendRedirect(request.getContextPath() + "/Logout.jsp");
		}
%>

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

<main class="flex-shrink-0">
    <div class="container-fluid h-100 minHeight">
        <div class="row h-100 row-cols-1 row-cols-md-2 gy-2">
            <div class="col col-md-12">
                <div class="container text-center text-light h-100">

                    <form action = "Display.jsp">
						<Input Type = 'text' Placeholder = 'Search: Laptop,TV,Phone..' Name = 'Search'>
						<Input Type = 'Submit' Value = 'Search' Name = 'Click'>
					</form>
					
					<br>
					<form action = "ComplexSearch.jsp">
						<Input Type = 'Submit' Value = 'Try Complex Search Instead?' Name = 'Click'>
					</form>
					<br>

                </div>
            </div>
            <div class="col col-md-4 order-last">
                <div class="h-100">
                	<form action=Display.jsp>
						<img src="img/phoneimg.jpg" height="400" width="490" alt="Phone"><br><br>
						<center><Input Type ="Submit" Name="img" Value="Click here to view latest deals on Phones!!!"></center>
					</form>
                </div>
            </div>
            <div class="col col-md-4">
                <div class="h-100">
                    <form action=Display.jsp>
						<img src="img/laptopimg.jpg" height="400" width="490" alt="Laptop"><br><br>
						<center><input type ="Submit" name="img" value="Click here to view latest deals on Laptops!!!"></center>
					</form>
                </div>
            </div>
            <div class="col col-md-4">
                <div class="h-100">
                   	<form action=Display.jsp>
						<img src="img/tvimg.jpg" height="400" width="490" alt="TV"><br><br>
						<center><input type ="Submit" name="img" value="Click here to view latest deals on TV's!!!"></center>
					</form>
                </div>
            </div>
        </div>
   </div>
</main>

    <footer class="footer mt-auto py-3 bg-dark sticky-footer">
        <div class="container-fluid text-center">
            <span class="text-white">BuyMe: An Online Auction Service</span>
        	<span class="text-white">By Pavitra Patel, Aditi Patel, Romil Patel, & Smit Patel</span>
        </div>
    </footer>
</body>
</html>