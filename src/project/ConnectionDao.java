package project;


import java.sql.*;
public class ConnectionDao {
	public static Connection getConnection() {
		try 
		{
			String url = "jdbc:mysql://localhost:3306/online_shopping_db";
			String usernameString = "root";
			String passwordString = "";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url,usernameString,passwordString);
			return conn;
		}
		catch (Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
}
