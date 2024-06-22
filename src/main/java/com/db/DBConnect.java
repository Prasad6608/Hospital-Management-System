package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	private static Connection  conn;
	
	public static Connection getConn() throws SQLException  
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital4","root","root123");
		}catch(Exception e) {
			e.printStackTrace();
		}
		conn.close();
		return conn;
		
	}

}