package org.LithuaniaInNumbers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
	
	private static Connection connection;
	
	public Database() {}
	
	public void connect() {
		try {
			connection = DriverManager
					.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "postgres");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  
		System.out.println("Connection to database successful");
	}
	
	public static Connection getConnection() {
		return connection;
	}
	
}
