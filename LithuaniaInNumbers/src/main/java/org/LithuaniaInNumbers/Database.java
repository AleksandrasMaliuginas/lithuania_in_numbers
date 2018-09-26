package org.LithuaniaInNumbers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Database {
	
	public static Connection connection;
	
	public Database() {}
	
	public void connect() {
		try {
			connection = DriverManager
					.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "postgres");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void test() throws SQLException {
		ResultSet query = connection.prepareStatement("SELECT COUNT(*) FROM general.\"Municipalities\";").executeQuery();
		while(query.next()) {
			int count = query.getInt(1);
			
			System.out.println("Success: general.Municipalities has " + count + " rows.");
		}
	}
}
