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
<style type="text/css">
	body {background-color: powderblue;}
	.d-none
	{
		display: none;
	}
</style>

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
<br><br><br><br><br>

<main class="flex-shrink-0">
    <div class="container-fluid h-100 minHeight">
        <div class="row-12">
            <div class="col-12">
                <div class="bg-secondary text-light container h-100">
					<form action="Display.jsp">
	<p>Enter the type of product that you are looking for:</p>
	<select name="producttype" id="producttype" onchange="enableBrand(this)">
		<option value="-1">Please Select</option>
		<option value="0">Phone</option>
		<option value="1">TV</option>
		<option value="2">Laptop</option>
	</select>
	<p id="phone" class="d-none">
		
		Please enter the brand that you are looking for: <input type="text" name="pbrand" placeholder="Brand"><br><br>
		Please enter the model that you are looking for: <input type="text" name="pmodel" placeholder="Model"><br><br>
		Please enter the color that you are looking for: <input type="text" name="pcolor" placeholder="Color"><br><br>
		How much phone storage would you like? <input type="text" name="pstorage" placeholder="storage"><br><br>
		What network carrier provider would you like: <br>(Enter Unlocked for Unlocked)? <input type="text" name="pcarrier" placeholder="Carrier"><br><br>
		What condition should your phone be in? <input type="text" name="pcondition" placeholder="Eg: Refurbished"><br><br>
		<input type = "submit" value = "Apply Filters" name = "Phone"><br>
	</p>
	
	<p id="tv" class="d-none">
		Please enter the brand that you are looking for: <input type="text" name="tvbrand" placeholder="Brand"><br><br>
		Please enter the model that you are looking for: <input type="text" name="tvmodel" placeholder="Model"><br><br>
		Please enter the color that you are looking for: <input type="text" name="tvcolor" placeholder="Color"><br><br>
		What size TV are you looking for? <input type="text" name="tvsize" placeholder="Eg:16inches"><br><br>
		What screen type are you looking for: <input type="text" name="tvtype" placeholder="Eg:OLED"><br><br>
		What resolution are you looking for: <input type="text" name="tvresolution" placeholder="Eg:1000*1200"><br><br>
		What condition should your phone be in? <input type="text" name="tvcondition" placeholder="Eg: Refurbished"><br><br>

		<input type = "submit" value = "Apply Filters" name = "TV"><br>
	</p>
	
	<p id="laptop" class="d-none">
		Please enter the brand that you are looking for: <input type="text" name="lbrand" placeholder="Brand"><br><br>
		Please enter the model that you are looking for: <input type="text" name="lmodel" placeholder="Model"><br><br>
		Please enter the color that you are looking for: <input type="text" name="lcolor" placeholder="Color"><br><br>
		What screen size are you looking for? <input type="text" name="lscreensize" placeholder="Eg:16inches"><br><br>
		What Processor are you looking for: <input type="text" name="lprocessor" placeholder="Processor"><br><br>
		What RAM Size are you looking for: <input type="text" name="lram" placeholder="Eg:16GB"><br><br>
		What Operating System are you looking for? <input type="text" name="loperatingsys" placeholder="Eg:Windows"><br><br>
		What condition should your phone be in? <input type="text" name="lcondition" placeholder="Eg: Refurbished"><br><br>
		<input type = "submit" value = "Apply Filters" name = "Laptop"><br>
	</p>
</form>
				</div>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript">
		function enableBrand(answer)
		{
			if(answer.value == -1)
			{
				document.getElementById('phone').classList.add('d-none');
				document.getElementById('tv').classList.add('d-none');
				document.getElementById('laptop').classList.add('d-none');
			}
			
			if(answer.value == 0)
			{
				document.getElementById('phone').classList.remove('d-none');
			}
			else
			{
				document.getElementById('phone').classList.add('d-none');
			}
			
			if(answer.value == 1)
			{
				document.getElementById('tv').classList.remove('d-none');
			}
			else
			{
				document.getElementById('tv').classList.add('d-none');
			}
			
			if(answer.value == 2)
			{
				document.getElementById('laptop').classList.remove('d-none');
			}
			else
			{
				document.getElementById('laptop').classList.add('d-none');
			}
		}
	</script>

</body>
</html>