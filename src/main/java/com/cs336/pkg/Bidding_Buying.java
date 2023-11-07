package com.cs336.pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Bidding_Buying")
public class Bidding_Buying extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/?user=root";
	private static final String PASS = "root";
	private static final String USER = "root";
	private static int bidId;
	HttpSession sess;
	
       

    public Bidding_Buying()
    {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if(request.getParameter("buy") != null)
		{
			buyProduct(request, response);
		}
		else if(request.getParameter("Bid") != null)
		{
			biddingForProduct(request, response);
		}
		else if(request.getParameter("AutoSet") != null)
		{
			storeAutoBid(request, response);
		}
		
	}
	
	protected void buyProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmt = con.createStatement();
			sess = request.getSession(false);
			ResultSet rs;
			
			String winner = (String)sess.getAttribute("user");
			int auction_num = (int)sess.getAttribute("auctionID");
			float winning_Price;
			

			String query1 = "SELECT Initial_Price FROM clone.auctions WHERE Auction_Num = '"+auction_num+"'"; 
			rs = stmt.executeQuery(query1);
			rs.next();
			
			winning_Price = rs.getFloat(1);
			
			
			String query2 = "UPDATE clone.auctions SET Winner = '"+winner+"', Winning_Price = '"+winning_Price+"', Active = '0' WHERE Auction_Num = '"+auction_num+"'";
			stmt.executeUpdate(query2);
			
			response.sendRedirect("Congratulations.jsp");
			
			
			stmt.close();
			con.close();
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	protected void biddingForProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmt = con.createStatement();
			Statement stmt1 = con.createStatement();
			Random ran = new Random();
			ResultSet rs;
			sess = request.getSession(false);
			
			String user_name = (String)sess.getAttribute("user");
			String currentDateTime = (LocalDate.now()).toString() + ";"+(LocalTime.now()).toString();
			String bid = request.getParameter("BidAmount");
			String checkBidNum  = "", Query1 = "", Query2 = "";
			int aId = (int)sess.getAttribute("auctionID");
			float bidAmount = Float.parseFloat(bid);

			
			
			do
			{
				bidId = ran.nextInt((99999 - 100) + 1) + 10;
				checkBidNum = "SELECT Bid_Num FROM clone.buyer_bids WHERE Bid_Num = '"+bidId+"'";
				rs = stmt.executeQuery(checkBidNum);
				
			}while(rs.next());
			
			sess.setAttribute("BidId", bidId);
			
// ------------------------------------------CHECKING IF BID AMOUNT IS GREATER THAN INCREMENT-----------------------------------------------------------------------
			

			
				Query1 = "INSERT INTO clone.buyer_bids (User_Name, Auction_Num, Bid_Num, Bid_Price, Date_Time, Upper_Limit, Increment_Price)VALUES('"+user_name+"', '"+aId+"', '"+bidId+"', '"+bidAmount+"', '"+currentDateTime+"', '0', '0')";
				stmt1.executeUpdate(Query1);

				Query2 = "UPDATE clone.auctions SET Increment_Amount = '"+bidAmount+"' WHERE Auction_Num = '"+aId+"'";
				stmt1.executeUpdate(Query2);
				
				response.sendRedirect("BidSucess.jsp");
			
					
			
			
			
		}catch(Exception e)
		{
			
		}
	}
	
	protected void storeAutoBid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmt = con.createStatement();
			HttpSession sess = request.getSession();
			
			String inc = request.getParameter("Increment");
			String limit = request.getParameter("UpperLimit");
			String query1 = "";
			
			float incPrice =  Float.parseFloat(inc);
			float upperLimit = Float.parseFloat(limit);
			
			String user_Name = (String)sess.getAttribute("user");
			int aId = (int)sess.getAttribute("auctionID");
			
			query1 = "UPDATE clone.buyer_bids SET Upper_Limit = '"+upperLimit+"', Increment_Price = '"+incPrice+"' WHERE User_Name = '"+user_Name+"' AND Auction_Num = '"+aId+"'";
		
			stmt.executeUpdate(query1);
			response.sendRedirect("Home.jsp");
			
		}catch(Exception e) 
		{
			e.printStackTrace();
		}
	}

}
