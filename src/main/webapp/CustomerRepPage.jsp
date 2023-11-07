<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe CustomerRep</title>
</head>
<body>

Welcome <%=session.getAttribute("customerRep") %> To PhoneBay 

<div style="float: right;">
			<form style="display: inline;" method="post" action="Logout.jsp"><input type="submit" value="logout"></form>
		</div>
		<div style="clear: both;"></div>
		<hr/>
	<!-- End Header -->
	<h2>Customer Representative Page</h2>
	
	<br><br>
	<form style="display: inline;" method="get" action="AnswerQuestions.jsp"> <table> <tr> <td> <h4> Answer Unreplied Questions --> </h4> </td> <td><input type="submit" value="Go"></td> </tr> </table> </form>
	
	<br>
	<form style="display: inline;" method="get" action="RemoveBidsFront.jsp"> <table> <tr> <td> <h4>Remove Bids --> </h4></td> <td><input type="submit" value="Proceed"> </td> </tr> </table></form>
	
	<br>
	<form style="display: inline;" method="get" action="RemoveAuctionFront.jsp"> <table> <tr> <td> <h4>Remove Auctions --> </h4></td> <td><input type="submit" value="Proceed"> </td> </tr> </table></form>
	
	<br><h4>Edits/Removes Account Info : </h4>
	<form method="get" action="EditUser.jsp"> <input type="submit" value="Edit"></form>
	<form method="get" action="RemoveUser.jsp"><input type="submit" value="Remove"></form>
</body>
</html>
