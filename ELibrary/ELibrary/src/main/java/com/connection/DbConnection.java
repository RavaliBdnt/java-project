package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {

	private static Connection c;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/elibrary","root","meer@5590");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return c;
	}
}
