<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<style>
	body {background-color: powderblue;}
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
<br><br><br><br>

<main class="flex-shrink-0">
	<div class="container minHeight h-100">
		<div class="row-12 gy-2 h-100">
			<div class="col">
				<div class="bg-secondary text-light h-100 p-2">
					
					<form action="SaveAlert.jsp">
						<span style="font-size: 25px">Please enter details for the type of product that you want to setup the alert for:</span><br><br>
						Product Type: <input type="text" name="producttype" placeholder="Eg: Phone/Laptop/TV"><br><br>
						Brand: <input type="text" name="brand" placeholder="Eg: Apple/Dell/HP"><br><br>
						Model: <input type="text" name="model" placeholder="Eg: iPhone11"><br><br>
						Additional Description: <input type="text" name="description" placeholder="Eg: White Color"><br><br>
						<input type="Submit" name="Submit" value="Save Alert!">
					</form>
				</div>
			</div>
		</div>
	</div>
</main>
</body>
</html>