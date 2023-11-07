<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" %>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

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
	<div class="container minHeight h-100">
		<div class="row-12 gy-2 h-100">
			<div class="col">
				<div class="bg-secondary text-light h-100 p-2">

<%
try
{
	SqlConnection2 db = new SqlConnection2();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	Random rand = new Random();
	
	HttpSession sess = request.getSession(false);
	String name = (String)sess.getAttribute("user");	
	String producttype = request.getParameter("producttype");
	String model = request.getParameter("model");
	String brand = request.getParameter("brand");
	String description = request.getParameter("description");
	int status=0;
		
	ResultSet rows;
	int alertid;
	do
	{
		alertid = rand.nextInt((99999 - 100) + 1) + 10;
		String sql1 = "SELECT Aid FROM clone.alerts WHERE Aid = '"+alertid+"'";
		rows = stmt.executeQuery(sql1);
	}
	while(rows.next());
	String insert = "INSERT INTO clone.alerts(User_Name,Aid,Product_Type,Model,Brand,Description,Status) VALUES" 
	+ "(?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement ps = con.prepareStatement(insert);
	ps.setString(1, name);
	ps.setInt(2, alertid);
	ps.setString(3, producttype);
	ps.setString(4, model);
	ps.setString(5, brand);
	ps.setString(6, description);
	ps.setInt(7, status);

	ps.executeUpdate();

	ps.close();
	rows.close();
	stmt.close();
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
					<h2>Alert Saved Successfully!!!</h2>
					<form action="DisplayAlert.jsp">
						<input type="Submit" value="View Alert Status(es)?">
					</form>

				</div>
			</div>
		</div>
	</div>
</main>
</body>
</html>