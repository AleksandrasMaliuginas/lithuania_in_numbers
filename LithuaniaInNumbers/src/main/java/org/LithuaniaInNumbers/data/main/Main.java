package org.LithuaniaInNumbers.data.main;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.LithuaniaInNumbers.data.population.Age;
import org.LithuaniaInNumbers.data.population.Municipality;
import org.LithuaniaInNumbers.data.population.Population;
import org.LithuaniaInNumbers.data.population.Select;
import org.LithuaniaInNumbers.data.population.Year;

public class Main {
	
	public static List<Age> ages = new ArrayList<Age>();
	public static List<Population> population = new ArrayList<Population>();
	public static List<Year> years = new ArrayList<Year>();
	public static List<Municipality> municipalities = new ArrayList<Municipality>();
	
	//public static void main(String[] args) throws SQLException {
	public static void connection() throws SQLException{
		Connection connection = DriverManager.getConnection(
				   "jdbc:postgresql://localhost:5432/postgres","postgres", "postgres");
		if(connection != null) { // order.
			Select.years(connection);
			Select.ages(connection);
			Select.municipalities(connection);
			Select.population(connection);
			//System.out.println(Mail.getMunicipalityPopulation(11)[0][15]);
			//System.exit(0);
		}
		connection.close();
	//}
	}
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	
	public static Connection getConnection() throws SQLException {
		Connection connection = DriverManager.getConnection(
				   "jdbc:postgresql://localhost:5432/postgres","postgres", "postgres");
		/*for(int i = 1; i < 19; i++) {
		for(int r = 0; r < 85; r++) {
		PreparedStatement stat = connection.prepareStatement("INSERT INTO \"population-ages\".\"Ages\" (\"YearID\", \"Age\") VALUES (" + i + ", " + r + ")");
		stat.executeUpdate();
		}
		}*/
		/*for(int i = 0; i < 10; i++) {
			String name = counties[i];
			PreparedStatement stat = connection.prepareStatement("INSERT INTO \"population-ages\".\"Counties\" (\"Title\")"
					+ "VALUES ('"  + name + " apskritis')");
			stat.executeUpdate();
		}*/
		//	return null;
	//}
	
	
	
	
	/*BufferedReader in = new BufferedReader(new FileReader("D:\\Desktop\\duomenys\\population-ages.csv"));
	in.readLine(); // first line is skipped because it is full of instructions.
	String line = in.readLine();
	while(line != null) {
		String words[] = line.split(";");
		for(int i = 0; i < words.length; i++) System.out.println(words[i]);
		line = in.readLine();
	}*/
	
	
	
	
	
	
	
		/*try {
			final ServerSocket server = new ServerSocket(8080);
			while(true) {
				final Socket client = server.accept();
				InputStreamReader ISreader = new InputStreamReader(client.getInputStream());
				BufferedReader reader = new BufferedReader(ISreader);
				String line = reader.readLine();
				while(!line.isEmpty()) {
					System.out.println(line);
					line = reader.readLine();
				}
				Date date = new Date();
				String response = "HTTP/1.1 200 OK\r\n\r\n" + date;
				client.getOutputStream().write(response.getBytes("UTF-8"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}*/
	
	/*public static Connection getConnection() throws SQLException {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = DriverManager.getConnection(
				   "jdbc:postgresql://localhost:5432/postgres","postgres", "postgres");
	//	update(connection);
	    System.out.println("Connected to database");
	    try {
			BufferedReader in = new BufferedReader(new FileReader("D:\\Desktop\\duomenys\\population-ages.csv"));
			String line = null;
			try {
				line = in.readLine();
			} catch (IOException e) {
				e.printStackTrace();
			}
			while(line != null) {
				try {
					String words[] = line.split(";");
					for(int i = 0; i < words.length; i++) System.out.println(words[i]);
					line = in.readLine();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	    ResultSet query = connection.prepareStatement("SELECT * FROM \"people\".\"MonthlyData\"").executeQuery();
	   /* while(query.next()) {
	    	int ID = query.getInt("EntryId");
	    	//System.out.println(ID);
	    	int agePeriodID = query.getInt("AgePeriodId");
	    	AgePeriod ap = createAgePeriod(agePeriodID, connection);
	    	int menCount = query.getInt("MenCount");
	    	int womenCount = query.getInt("WomenCount");
	    	monthlyData.add(new MonthlyData(ID, ap, menCount, womenCount));
	    }
	    for(int i = 0; i < monthlyData.size(); i++) System.out.println(monthlyData.get(i).getAgePeriod().getPeriod().getDate());*/
	   // return connection;
	//}
	
	
	
	/*public static AgePeriod createAgePeriod(int agePeriodID, Connection connection) throws SQLException {
		ResultSet query = connection.createStatement().executeQuery("SELECT * FROM \"people\".\"AgePeriods\" "
				+ "WHERE \"people\".\"AgePeriods\".\"AgePeriodId\" = " + agePeriodID);
		query.next();
		int periodID = query.getInt("PeriodId");
		Period period = createPeriod(periodID, connection);
		int age = query.getInt("Age");
		AgePeriod ap = new AgePeriod(agePeriodID, period, age);
		return ap;
		
	}
	
	public static Period createPeriod(int periodID, Connection connection) throws SQLException {
		ResultSet query = connection.createStatement().executeQuery("SELECT * FROM \"people\".\"Periods\" "
				+ "WHERE \"people\".\"Periods\".\"PeriodId\" = " + periodID);
		query.next();
		Date date = query.getDate("PeriodDate");
		//System.out.println(date);
		Period period = new Period(periodID, date);
		return period;
		
	}
	
	
	
	public static void update(Connection connection) throws SQLException {
		for(int i = 1; i <= 11450; i++) {
			if(i == 10 ||  i == 500|| i == 1500 || i == 3000 || i == 4500 || i == 5000 || i == 6000|| i == 7000|| i == 9000) System.out.println(i);
		PreparedStatement stat = connection.prepareStatement("SELECT * FROM \"people\".\"MonthlyData\" "
				+ "WHERE \"people\".\"MonthlyData\".\"AgePeriodId\" = " + i, ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_UPDATABLE);
		ResultSet query = stat.executeQuery();
		int menCount = 0;
		int womenCount = 0;
		while(query.next()) {
			menCount += query.getInt("MenCount");
			womenCount += query.getInt("WomenCount");
			query.deleteRow();
		}
		PreparedStatement st = connection.prepareStatement("INSERT INTO \"people\".\"MonthlyData\" "
				+ "(\"AgePeriodId\", \"MenCount\", \"WomenCount\") "
				+ "VALUES (" + i + ", " + menCount + ", "+ womenCount + ")");
		st.executeUpdate();
		}
		connection.close();
	}*/

//}
