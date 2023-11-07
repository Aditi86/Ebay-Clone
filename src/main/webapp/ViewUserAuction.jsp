<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>
<%@ page import = "java.time.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BuyMe: View Auction</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<style>
	body {background-color: powderblue;}
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

	<%
		try
		{
			SqlConnection2 db = new SqlConnection2();
			Connection con = db.getConnection();
			Statement s = con.createStatement();
			
			String pinput = request.getParameter("pinput");
			String query = "SELECT Auction_Num FROM clone.product_for_auction WHERE Pid='"+pinput+"'";
			
			int ain=0;
			int pin = Integer.parseInt(pinput);
			HttpSession sess = request.getSession(false);
			sess.setAttribute("productID", pin);
			
			ResultSet r = s.executeQuery(query);
			while(r.next())
			{
				ain = r.getInt("Auction_Num");
				sess.setAttribute("auctionID", ain);
			}
%>			
			<form action="SimilarAuctions.jsp">
				<p class="text-center">
				<input type = "Submit" value = "Click here to view similar items on auctions in the preceding month!!!" name = "Submit">
				</p>
			</form>
<%						
			Statement stmt1 = con.createStatement();
			Statement stmt2 = con.createStatement();
			
			String query1 = "SELECT product_Type FROM clone.product WHERE Pid = '"+pin+"'";
			String query2 = "", query3 = "", query4 = "";
			
			ResultSet type = stmt1.executeQuery(query1);
			type.next(); 
			
//****************************************************************************** FIRST IF CLAUSE *******************************************************************************************************************************************************************************************************************************************************************************************************
			
			if(type.getString(1).equalsIgnoreCase("Phone"))
			{
				query2 = "SELECT p.Brand, p.Model, p.Color, p.Storage_Cap, p. Carrier, p.Conditions, p.Quantity, p.Description,a.End_Date_Time, a.Increment_Amount, a.Initial_Price,"
						+ " a.Shipping FROM clone.Auctions a, clone.Product p WHERE p.Pid = '"+pin+"' AND a.Auction_Num = '"+ain+"'";
					
				ResultSet rows = stmt1.executeQuery(query2);
				while(rows.next())
				{ %>
				
				
<!--***********************************************************************  PRINTTING DATA IN HTML *************************************************************************************-->
					
					<h1 style = "font-family: monospace"><%= rows.getString("Brand")%> <%= rows.getString("Model")%> - <%= rows.getString("Storage_Cap")%> <%= rows.getString("Carrier")%> <%= rows.getString("Color")%> </h1>
					<hr style="height:2px;border-width:0;color:black;background-color:black; width: 35%; text-align:left;margin-left:0"> <br>
					<h2 style = "font-family: monospace"> Condition: <%= rows.getString(6)%> | Quantity : <%= rows.getString(7) %></h2>
					<h2 style = "font-family: monospace"> Description: <%= rows.getString(8) %></h2>
					<hr style="height:2px;border-width:0; width: 30%; text-align:left;margin-left:0; border-top: 2px dashed black"> <br>
					
<!--***********************************************************************************************************************************************************************************************************  -->
					
					<%
						String currentDate = (LocalDate.now()).toString();
						String  currentTime = (LocalTime.now()).toString();
					
						query3 = "SELECT DATEDIFF('"+rows.getString(9)+"', '"+currentDate+"') AS DayLeft";
						ResultSet remaining = stmt2.executeQuery(query3);
						remaining.next();
						currentDate = remaining.getString("DayLeft");
						
						query4 = "SELECT SUBTIME('"+rows.getString(9)+"','"+currentTime+"') AS TimeLeft";
						remaining = stmt2.executeQuery(query4);
						remaining.next();
						currentTime = remaining.getString("TimeLeft");
						currentTime = currentTime.substring(10, 19);
					%>
					
					
     <!--******************************************************  PRINTTING DATA IN HTML *************************************************************************-->

					
					<h2 style = "font-family: monospace"> Time left: <%=currentDate%> Days and <%= currentTime%></h2>					
					<h2 style = "font-family: monospace"> Starting bid: $<%= rows.getFloat(10) %></h2>
					   
					
					<form action = "Bidding_Buying" method = "Post">	    
					<input type = "number"  min= <%= rows.getFloat(10) %> placeholder = "Bid Amount" name = "BidAmount" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">
					<input type = "submit" value = "Bid" name = "Bid" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">
					</form>
					
					<h2 style = "font-family: monospace"> Initial Price: $<%= rows.getFloat(11) %></h2> 
					
					
					<form action = "Bidding_Buying" method = "post">
					 <input type = "submit" value = "Buy" name = "buy" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">		
					</form>	
					
					<h2 style = "font-family: monospace"> Shipping: <%=rows.getString("Shipping")%></h2>	
					
					
     <!--*********************************************************************************************************************************************************  -->

				<%}	
			}


//****************************************************************************** SECOND IF CLAUSE *******************************************************************************************************************************************************************************************************************************************************************************************************
			

			else if(type.getString(1).equalsIgnoreCase("TV"))
			{
				query2 = "SELECT p.Brand, p.Model, p.Resolution, p.Audio_Video_Inputs, p.Color,p.Screen_Size, p.Screen_Type, p.Conditions, p.Quantity, p.Description,a.End_Date_Time, a.Increment_Amount, a.Initial_Price,"
						+ " a.Shipping FROM clone.Auctions a, clone.Product p WHERE p.Pid = '"+pin+"' AND a.Auction_Num = '"+ain+"'";
					
				ResultSet rows = stmt1.executeQuery(query2);
				while(rows.next())
				{ %>
     <!--******************************************************  PRINTTING DATA IN HTML *************************************************************************-->


					<h1 style = "font-family: monospace"><%= rows.getString("Brand")%> <%= rows.getString("Model")%> - <%= rows.getString("Resolution")%> <%= rows.getString("Screen_Type")%> <%= rows.getString("Screen_Size")%> </h1>
					<hr style="height:2px;border-width:0;color:black;background-color:black; width: 35%; text-align:left;margin-left:0"> <br>
					<h2 style = "font-family: monospace"> Audio Video Inputs: <%=rows.getString("Audio_Video_Inputs")%>' </h2>
					<h2 style = "font-family: monospace"> Condition: <%= rows.getString("Conditions")%> | Quantity : <%= rows.getString("Quantity") %></h2>
					<h2 style = "font-family: monospace"> Description: <%= rows.getString("Description") %></h2>
					<hr style="height:2px;border-width:0; width: 30%; text-align:left;margin-left:0; border-top: 2px dashed black"> <br>
					
					
     <!--*********************************************************************************************************************************************************  -->
					
					
					<%
						String currentDate = (LocalDate.now()).toString();
						String  currentTime = (LocalTime.now()).toString();
					
						query3 = "SELECT DATEDIFF('"+rows.getString("End_Date_Time")+"', '"+currentDate+"') AS DayLeft";
						ResultSet remaining = stmt2.executeQuery(query3);
						remaining.next();
						currentDate = remaining.getString("DayLeft");
						
						query4 = "SELECT SUBTIME('"+rows.getString("End_Date_Time")+"','"+currentTime+"') AS TimeLeft";
						remaining = stmt2.executeQuery(query4);
						remaining.next();
						currentTime = remaining.getString("TimeLeft");
						currentTime = currentTime.substring(10, 19);
					%>

        <!--*****************************************************************  PRINTTING DATA IN HTML ******************************************************  ********-->

					<h2 style = "font-family: monospace"> Time left: <%=currentDate%> Days and <%= currentTime%></h2>
					<h2 style = "font-family: monospace"> Starting bid: $<%= rows.getFloat("Increment_Amount") %></h2>
						    
					<form action = "Bidding_Buying" method = "Post">	    
					<input type = "number"  min= <%= rows.getFloat("Increment_Amount")%> placeholder = "Bid Amount" name = "BidAmount" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">
					<input type = "submit" value = "Bid" name = "Bid" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">
					</form>
					
					<h2 style = "font-family: monospace"> Initial Price: $<%= rows.getFloat(12) %></h2> 
					
					<form action = "Bidding_Buying" method  = "Post">
					 <input type = "submit" value = "Buy" name = "buy" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">		
					</form>	
					
					<h2 style = "font-family: monospace"> Shipping: <%=rows.getString("Shipping")%></h2>
					
     <!--*********************************************************************************************************************************************************  -->

	
				<%}	
			}


//****************************************************************************** SECOND IF CLAUSE *******************************************************************************************************************************************************************************************************************************************************************************************************




			else if(type.getString(1).equalsIgnoreCase("Laptop"))
			{
				query2 = "SELECT p.Brand, p.Model, p.Resolution, p.Processor, p.Color, p.Storage_Cap, p.Screen_Size, p.Screen_Type, p.Ram, p. p.Conditions, p.Quantity, p.Description,a.End_Date_Time, a.Increment_Amount, a.Initial_Price,"
						+ " a.Shipping FROM clone.Auctions a, clone.Product p WHERE p.Pid = '"+pin+"' AND a.Auction_Num = '"+ain+"'";
					
				ResultSet rows = stmt1.executeQuery(query2);
				while(rows.next())
				{ %>
				
     <!--******************************************************  PRINTTING DATA IN HTML *************************************************************************-->

					<h1 style = "font-family: monospace"><%= rows.getString("Brand")%> <%= rows.getString("Model")%> - <%= rows.getString("Processor")%> <%= rows.getString("Ram")%> <%= rows.getString("Storage_Cap")%> </h1>
					<hr style="height:2px;border-width:0;color:black;background-color:black; width: 35%; text-align:left;margin-left:0"> <br>
					<h2 style = "font-family: monospace"> Screen size: <%=rows.getString("Screen_Size")%>' | Color: <%=rows.getString("Color")%> | Resolution: <%=rows.getString("Resolution") %> </h2>
					<h2 style = "font-family: monospace"> Condition: <%= rows.getString("Conditions")%> | Quantity : <%= rows.getString("Quantity") %></h2>
					<h2 style = "font-family: monospace"> Description: <%= rows.getString("Description") %></h2>
					<hr style="height:2px;border-width:0; width: 30%; text-align:left;margin-left:0; border-top: 2px dashed black"> <br>
					
     <!--*********************************************************************************************************************************************************  -->
      
					
					
					<%
						String currentDate = (LocalDate.now()).toString();
						String  currentTime = (LocalTime.now()).toString();
					
						query3 = "SELECT DATEDIFF('"+rows.getString("End_Date_Time")+"', '"+currentDate+"') AS DayLeft";
						ResultSet remaining = stmt2.executeQuery(query3);
						remaining.next();
						currentDate = remaining.getString("DayLeft");
						
						query4 = "SELECT SUBTIME('"+rows.getString("End_Date_Time")+"','"+currentTime+"') AS TimeLeft";
						remaining = stmt2.executeQuery(query4);
						remaining.next();
						currentTime = remaining.getString("TimeLeft");
						currentTime = currentTime.substring(10, 19);
					%>
      <!--******************************************************  PRINTTING DATA IN HTML *************************************************************************-->
		
					<h2 style = "font-family: monospace"> Time left: <%=currentDate%> Days and <%= currentTime%></h2>
					<h2 style = "font-family: monospace"> Starting bid: $<%= rows.getFloat("Increment_Amount") %></h2>
						    
					<form action = "Bidding_Buying" method  = "Post">	    
					<input type = "number"  min= <%= rows.getFloat("Increment_Amount")%> placeholder = "Bid Amount" name = "BidAmount" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">
					<input type = "submit" value = "Bid" name = "Bid" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">
					</form>
					
					<h2 style = "font-family: monospace"> Initial Price: $<%= rows.getFloat(12) %></h2> 
					
					
					<form action = "Bidding_Buying" method  = "Post">
					 <input type = "submit" value = "Buy" name = "buy" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">		
					</form>	
					<h2 style = "font-family: monospace"> Shipping: <%=rows.getString("Shipping")%></h2>


     <!--*********************************************************************************************************************************************************  -->

						
				<%}	
			}%>
      <!--******************************************************  PRINTTING DATA IN HTML *************************************************************************-->
			
			
				<form action = "Home.jsp">
				<input type = "submit" value = "Home Page" name = "Home Page" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">
				</form>
				
     <!--*********************************************************************************************************************************************************  -->
       
			<% 
			stmt1.close();
			stmt2.close();
			
			r.close();
			s.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
</body>
</html>