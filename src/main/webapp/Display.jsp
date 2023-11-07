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
	.sort
	{
		padding-left: 530px;
	}
	.sort1
	{
		padding-left: 720px;
	}
	
</style>
<meta charset="ISO-8859-1">
<title>BuyMe: Auction Services</title>
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

		<p class="sort"><span style="font-size: 25px">Sort your results based on one of the following?</span></p>
		<form action="DisplaySort.jsp">
		<p class="sort1">
			<input type="checkbox" id="sortprice" name="sortprice" value="price">
			<label for="sortprice"> Price</label><br>
			<input type="checkbox" id="sortproducttype" name="sortproducttype" value="producttype">
			<label for="sortproducttype"> Product Type</label><br>
			<input type="checkbox" id="available" name="available" value="available">
			<label for="available"> Availability</label><br>
			<input type="Submit" name="SortSubmit" value="Apply Filters?">
		</p>
		</form>
		
		<form action = "ViewUserAuction.jsp">
		<p class="text-center">
			<span style="font-size: 20px">Please enter the Product Number that you want to see the auction details for:</span><br>
			<input type="text" name="pinput" placeholder="Enter Product Number"><br>
			<input type="Submit" name="asubmit" value="View Auction?">
		</p>
		</form>

<table class="table-style">
			<tr>
				<th>
					<%out.print("Product Number"); %>
				</th>
				<th>
					<%out.print("Product Type"); %>
				</th>
				<th>
					<%out.print("Product Description"); %>
				</th>
				<th>
					<%out.print("Product Price"); %>
				</th>
				<th>
					<%out.print("Quantity"); %>
				</th>
				<th>
					<%out.print("Highest Bid"); %>
				</th>
				<th>
					<%out.print("End Date & Time"); %>
				</th>
			</tr>
<%
	try
	{
		SqlConnection2 db = new SqlConnection2();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		StringBuilder query = new StringBuilder("");
		String image  = request.getParameter("img");
		String input = request.getParameter("Search");
		String cs = request.getParameter("producttype");
		
		if(cs == null)
		{
			cs = "";
		}
		if(cs.equals("0"))
		{
			cs = "Phone";
			String brand = request.getParameter("pbrand");
			String model = request.getParameter("pmodel");
			String color = request.getParameter("pcolor");
			String storage = request.getParameter("pstorage");
			String carrier = request.getParameter("pcarrier");
			String condition = request.getParameter("pcondition");
			query.append("SELECT * FROM clone.Product p JOIN clone.product_for_auction pfa ON p.Pid=pfa.Pid JOIN clone.Auctions a ON a.Auction_Num=pfa.Auction_Num WHERE p.Product_Type='"+cs+"'");
			if(brand != "")
			{
				query.append(" and p.Brand='"+brand+"'");
			}
			if(model != "")
			{
				query.append(" and p.Model='"+model+"'");
			}
			if(color != "")
			{
				query.append(" and p.Color='"+color+"'");
			}
			if(storage != "")
			{
				query.append(" and p.Storage_Cap='"+storage+"'");
			}
			if(carrier != "")
			{
				query.append(" and p.Carrier='"+carrier+"'");
			}
			if(condition != "")
			{
				query.append(" and p.Conditions='"+condition+"'");
			}
		}
		else if(cs.equals("1"))
		{
			cs = "TV";
			String brand = request.getParameter("tvbrand");
			String model = request.getParameter("tvmodel");
			String color = request.getParameter("tvcolor");
			String size = request.getParameter("tvsize");
			String type = request.getParameter("tvtype");
			String resolution = request.getParameter("tvresolution");
			String condition = request.getParameter("tvcondition");
			
			query.append("SELECT * FROM clone.Product p JOIN clone.product_for_auction pfa ON p.Pid=pfa.Pid JOIN clone.Auctions a ON a.Auction_Num=pfa.Auction_Num WHERE Product_Type='"+cs+"'");
			if(brand != "")
			{
				query.append(" and Brand='"+brand+"'");
			}
			if(model != "")
			{
				query.append(" and Model='"+model+"'");
			}
			if(color != "")
			{
				query.append(" and Color='"+color+"'");
			}
			if(size != "")
			{
				query.append(" and Screen_Size='"+size+"'");
			}
			if(type != "")
			{
				query.append(" and Screen_Type='"+type+"'");
			}
			if(resolution != "")
			{
				query.append(" and Resolution='"+resolution+"'");
			}
			if(condition != "")
			{
				query.append(" and Conditions='"+condition+"'");
			}
		}
		else if(cs.equals("2"))
		{
			cs = "Laptop";
			String brand = request.getParameter("lbrand");
			String model = request.getParameter("lmodel");
			String color = request.getParameter("lcolor");
			String screensize = request.getParameter("lscreensize");
			String processor = request.getParameter("lprocessor");
			String ram = request.getParameter("lram");
			String operatingsys = request.getParameter("loperatingsys");
			String condition = request.getParameter("lcondition");
			query.append("SELECT * FROM clone.Product p JOIN clone.product_for_auction pfa ON p.Pid=pfa.Pid JOIN clone.Auctions a ON a.Auction_Num=pfa.Auction_Num WHERE Product_Type='"+cs+"'");
			if(brand != "")
			{
				query.append(" and Brand='"+brand+"'");
			}
			if(model != "")
			{
				query.append(" and Model='"+model+"'");
			}
			if(color != "")
			{
				query.append(" and Color='"+color+"'");
			}
			if(screensize != "")
			{
				query.append(" and Screen_Size='"+screensize+"'");
			}
			if(processor != "")
			{
				query.append(" and Processor='"+processor+"'");
			}
			if(ram != "")
			{
				query.append(" and RAM='"+ram+"'");
			}
			if(operatingsys != "")
			{
				query.append(" and Operating_Sys='"+operatingsys+"'");
			}
			if(condition != "")
			{
				query.append(" and Conditions='"+condition+"'");
			}
		}
		
		if(image == null)
		{
			image = "";
		}
		if(image.equals("Click here to view latest deals on Phones!!!"))
		{
			String a = "Phone";
			query.append("SELECT * FROM clone.Product p JOIN clone.product_for_auction pfa ON p.Pid=pfa.Pid JOIN clone.Auctions a ON a.Auction_Num=pfa.Auction_Num WHERE product_Type='"+a+"'");		}
		else if(image.equals("Click here to view latest deals on Laptops!!!"))
		{
			String a = "Laptop";
			query.append("SELECT * FROM clone.Product p JOIN clone.product_for_auction pfa ON p.Pid=pfa.Pid JOIN clone.Auctions a ON a.Auction_Num=pfa.Auction_Num WHERE product_Type='"+a+"'");
		}
		else if(image.equals("Click here to view latest deals on TV's!!!"))
		{
			String a = "TV";
			query.append("SELECT * FROM clone.Product p JOIN clone.product_for_auction pfa ON p.Pid=pfa.Pid JOIN clone.Auctions a ON a.Auction_Num=pfa.Auction_Num WHERE product_Type='"+a+"'");
		}
		else if(input != null)
		{
			if(input.equals(""))
			{
				response.sendRedirect("Home.jsp");
			}
			input = input.toLowerCase().trim();
			String[] arrOfStr = input.split(" ", 10);
			int len = arrOfStr.length;

			query.append("SELECT * FROM clone.Product p JOIN clone.product_for_auction pfa ON p.Pid=pfa.Pid JOIN clone.Auctions a ON a.Auction_Num=pfa.Auction_Num WHERE");
			for(int i=0; i<len; i++)
			{
				query.append(" description LIKE '%" + arrOfStr[i] + "%'");
				if(i != (len-1))
					query.append(" AND");
			}
		}
		
		if(query.toString() != null || !(query.toString().equals("")))
		{
			String q = query.toString();
			HttpSession sess = request.getSession(false);
			sess.setAttribute("q1", q);
		}
		ResultSet rs = stmt.executeQuery(query.toString());
		while(rs.next())
		{
			if(rs.getInt("Active") == 1)
			{
				int p1 = 0;
				int temp = rs.getInt("Auction_Num");
				String q1 = "SELECT * FROM clone.buyer_bids WHERE Auction_Num='"+temp+"'";
				Statement s1 = con.createStatement();
				ResultSet r1 = s1.executeQuery(q1);
				while(r1.next())
				{
					if(r1.getInt("Bid_Price") > p1)
					{
						p1 = r1.getInt("Bid_Price");
					}
				}
%>
			<tr>
				<th><%out.println(rs.getString("Pid")); %></th>
				<th><%out.println(rs.getString("Product_Type")); %></th>
				<th><%out.println(rs.getString("Description")); %></th>
				<th><%out.println(rs.getInt("Price")); %></th>
				<th><%out.println(rs.getInt("Quantity")); %></th>
				<th><%out.println(p1); %></th>
				<th><%out.println(rs.getString("End_Date_Time")); %></th>
			</tr>
<%
			}
		}
		stmt.close();
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
	<br><br>
</div>
</body>
</html>