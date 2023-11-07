package com.cs336.pkg;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SqlConnection2
{
	public SqlConnection2()
	{
		
	}
	public Connection getConnection()
	{
		String url = "jdbc:mysql://127.0.0.1:3306/?user = root";
		Connection con = null;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(IllegalAccessException e)
		{
			e.printStackTrace();
		}
		catch(InstantiationException e)
		{
			e.printStackTrace();
		}
		
		try
		{
			con = DriverManager.getConnection(url, "root", "root");
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
	
	public void closeConnection(Connection con)
	{
		try
		{
			con.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args)
	{
		SqlConnection2 con = new SqlConnection2();
		Connection connection = con.getConnection();
		System.out.println(connection);
		con.closeConnection(connection);
	}
}