package com.cs336.pkg;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/StoreAuction")
public class StoreAuction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/?user=root";
	private static final String USER = "root";
	private static final String PASS = "root";
	HttpSession sess;
	private static int pId;
	private static int aId;

    public StoreAuction()
    {
    	super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if(request.getParameter("auction1") != null)
		{
			storePhone(request, response);
		}
		else if(request.getParameter("auction2")!= null)
		{
			storeLaptop(request, response);
		}
		else if(request.getParameter("auction3") != null)
		{
			storageTV(request, response);
		}
		else if(request.getParameter("Done") != null)
		{
			storeAuction(request, response);
			product_Acution(request, response);
			response.sendRedirect("CreatedAuctionInDetail.jsp");
			
			HttpSession sess = request.getSession(false);
			sess.setAttribute("aId", aId);
			sess.setAttribute("pId", pId);
			
		}
	}
	
	protected void storePhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmt = con.createStatement();
			Random ran = new Random();
			ResultSet rs;
			
			String brand = request.getParameter("Brand");
			String model = request.getParameter("Model");
			String color = request.getParameter("Color");
			String storage = request.getParameter("Storage");
			String carrier = request.getParameter("Carrier");
			String condition = request.getParameter("Condition");
			String quantity = request.getParameter("Quantity");
			String description = request.getParameter("Description");
			String checkPid = "";
			int qunatity1 = Integer.parseInt(quantity);
			
			do
			{
				pId = ran.nextInt((99999 - 100) + 1) + 10;
				checkPid = "SELECT Pid FROM clone.product WHERE Pid = '"+pId+"'";
				rs = stmt.executeQuery(checkPid);
				
			}while(rs.next());
			sess = request.getSession(false);
			sess.setAttribute("pId", pId);
			
			String query = "INSERT INTO clone.product (product_Type, Pid, Brand, Model, Color, Storage_Cap, Carrier, Conditions, Quantity, Description)"
					+ "VALUES ('Phone', '"+pId+"', '"+brand+"', '"+model+"', '"+color+"', '"+storage+"', '"+carrier+"', '"+condition+"', '"+qunatity1+"', '"+description+"')";
			
			
			stmt.executeUpdate(query);
			response.sendRedirect("EnterAuctionDetails.jsp");
			
			stmt.close();
			con.close();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	protected void storeLaptop(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmt = con.createStatement();
			Random ran = new Random();
			ResultSet rs;
			
			String brand = request.getParameter("Brand");
			String model = request.getParameter("Model");
			String color = request.getParameter("Color");
			String storage = request.getParameter("Storage");
			String ram = request.getParameter("Ram");
			String processor = request.getParameter("Processor");
			String screen_Size = request.getParameter("ScreenSize");
			String screen_Type = request.getParameter("ScreenType");
			String condition = request.getParameter("Condition");
			String quantity = request.getParameter("Quantity");
			String description = request.getParameter("Description");
			int qunatity1 = Integer.parseInt(quantity);
			String checkPid = "";
			
			do
			{
				pId = ran.nextInt((99999 - 100) + 1) + 10;
				checkPid = "SELECT Pid FROM clone.product WHERE Pid = '"+pId+"'";
				rs = stmt.executeQuery(checkPid);
				
			}while(rs.next());
			sess = request.getSession(false);
			sess.setAttribute("pId", pId);
			
			String query = "INSERT INTO clone.product (product_Type, Pid, Brand, Model, Color, Storage_Cap, Ram, Processor, Screen_Size, Screen_Type, Conditions, Quantity, Description)"
					+ "VALUES('Laptop', '"+pId+"', '"+brand+"', '"+model+"', '"+color+"', '"+storage+"', '"+ram+"', '"+processor+"', '"+screen_Size+"', '"+screen_Type+"', '"+condition+"', '"+qunatity1+"', '"+description+"')";
			
			stmt.executeUpdate(query);
			response.sendRedirect("EnterAuctionDetails.jsp");
			
			stmt.close();
			con.close();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	protected void storageTV(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmt = con.createStatement();
			Random ran = new Random();
			ResultSet rs;
			
			String brand = request.getParameter("Brand");
			String model = request.getParameter("Model");
			String color = request.getParameter("Color");
			String screen_Size = request.getParameter("ScreenSize");
			String screen_Type = request.getParameter("ScreenType");
			String resolution = request.getParameter("Resolution");
			String avinputs = request.getParameter("AVinputs");
			String condition = request.getParameter("Condition");
			String quantity = request.getParameter("Quantity");
			String description = request.getParameter("Description");
			int qunatity1 = Integer.parseInt(quantity);
			String checkPid = "";
			
			do
			{
				pId = ran.nextInt((99999 - 100) + 1) + 10;
				checkPid = "SELECT Pid FROM clone.product WHERE Pid = '"+pId+"'";
				rs = stmt.executeQuery(checkPid);
				
			}while(rs.next());
			sess = request.getSession(false);
			sess.setAttribute("pId", pId);
			
			String query = "INSERT INTO clone.product (product_Type, Pid, Brand, Model, color, Screen_Size, Screen_Type, Resolution, Audio_Video_Inputs, Conditions, Quantity, Description)"
					+ "VALUES('TV', '"+pId+"', '"+brand+"', '"+model+"', '"+color+"', '"+screen_Size+"', '"+screen_Type+"', '"+resolution+"', '"+avinputs+"', '"+condition+"', '"+qunatity1+"', '"+description+"')";
			
			stmt.executeUpdate(query);
			response.sendRedirect("EnterAuctionDetails.jsp");
			
			stmt.close();
			con.close();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	protected void storeAuction(HttpServletRequest request, HttpServletResponse response )
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmt = con.createStatement();
			HttpSession sess = request.getSession(false); 
			Random ran = new Random();
			ResultSet rs;
			 
			
			String price = request.getParameter("Price");
			String incrementAmount = request.getParameter("IncrementAmount");
			String minimumAmount = request.getParameter("MinimumAmount");
			String shipping = request.getParameter("Shipping");
			String date = request.getParameter("Date");
			String time = request.getParameter("Time");
			String dateTime = date +";" +time ;
			String checkauctionId = "";
			
			String user_Name = (String)sess.getAttribute("user");
			String currentDate = (LocalDate.now()).toString();
			String currentTime = (LocalTime.now()).toString();
			String allTogether = currentDate +";"+currentTime;
			
			double increment_Amount = Double.parseDouble(incrementAmount);
			double prices = Double.parseDouble(price);
			double min_amount = Double.parseDouble(minimumAmount);
			
			do
			{
				aId = ran.nextInt((99999 - 100) + 1) + 10;
				checkauctionId = "SELECT Auction_Num FROM clone.auctions WHERE Auction_Num = '"+aId+"'";
				rs = stmt.executeQuery(checkauctionId);						
				
			}while(rs.next());
			sess.setAttribute("aId", aId);
			
			String sql = "INSERT INTO clone.auctions (Auction_Num, User_Name, Start_Date_Time, End_Date_Time, Minimum_Amount, Increment_Amount, Initial_Price, Shipping, Active)"
					+ "VALUES('"+aId+"', '"+user_Name+"', '"+allTogether+"', '"+dateTime+"', '"+ min_amount+"', '"+increment_Amount+"', '"+prices+"', '"+shipping+"', '1')"; 
			stmt.executeUpdate(sql);
			
			String updateProduct = "UPDATE clone.product SET Price = '"+prices+"' WHERE Pid='"+pId+"'";
			stmt.executeUpdate(updateProduct);
			
			con.close();
			stmt.close();
	
		} catch (ClassNotFoundException | SQLException e) 
		{ 
			
			e.printStackTrace();
		}
	}
	
	protected void product_Acution(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmt = con.createStatement();
						
			String sql = "INSERT INTO clone.product_for_auction (Pid, Auction_Num)VALUES('"+pId+"', '"+aId+"')";
			stmt.executeUpdate(sql);
			
			
			con.close();
			stmt.close();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}