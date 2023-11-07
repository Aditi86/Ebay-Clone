<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Sales Report</title>
</head>
<body>
<h3>Sales Reports</h3>
	<h4>Total Earning reports</h4>
	<form style="display: inline;" method="get" action="TotalEarning.jsp"> <input type="submit" value="Generate"></form>
	<h4>Earnings Per</h4>
	<form method="get" action="EarningPer.jsp">
			<select name="Type" size=1 required>
				<option value="Item">Item</option>
				<option value="Item_Type">Item Type</option>
				<option value="User">End-User</option>
			</select>
			<input type="submit" value="Generate">
	</form>
	<h4>Best Selling Items</h4> <form style="display: inline;" method="get" action="BestSellingItem.jsp"> <input type="submit" value="Generate"></form>
	<h4>Best Buyers</h4> <form style="display: inline;" method="get" action="BestBuyer.jsp"> <input type="submit" value="Generate"></form>
	
	
</body>
</html>