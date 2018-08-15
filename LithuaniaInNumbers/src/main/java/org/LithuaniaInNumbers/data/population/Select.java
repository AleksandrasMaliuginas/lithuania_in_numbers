package org.LithuaniaInNumbers.data.population;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.LithuaniaInNumbers.data.main.Main;

public final class Select {
	
	private final static String[] schemas = {"\"people\"", "\"general\""};
	private final static String[] tables = {"\"Population\"", "\"AgePeriods\"", "\"Years\"", "\"Municipalities\""};
	
	public static void years(Connection connection) throws SQLException {
		ResultSet query = connection.prepareStatement("SELECT * FROM " + schemas[1] + "." + tables[2]).executeQuery();
		while(query.next()) {
			int ID = query.getInt("id");
			int year = query.getInt("year");
			Main.years.add(new Year(ID, year));
		}
	}
	
	public static void ages(Connection connection) throws SQLException {
		ResultSet query = connection.prepareStatement("SELECT * FROM " + schemas[0] + "." + tables[1]).executeQuery();
		while(query.next()) {
			int ID = query.getInt("id");
			int yearID = query.getInt("year_id");
			Year year = null;
			for(int i = 0; i < Main.years.size(); i++) { // can be done with Main.years.get(yearID - 1);
				if(Main.years.get(i).getID() == yearID) year = Main.years.get(i);
			}
			if(year == null) {
				System.err.println("year == null");
				System.exit(0);
			}
			int age = query.getInt("age");
			Main.ages.add(new Age(ID, year, age));
		}
	}
	
	public static void municipalities(Connection connection) throws SQLException {
		ResultSet query = connection.prepareStatement("SELECT * FROM " + schemas[1] + "." + tables[3]).executeQuery();
		while(query.next()) {
			int ID = query.getInt("id");
			String title = query.getString("title");
			int municID = query.getInt("county_id");
			Main.municipalities.add(new Municipality(ID, title, municID));
		}
	}
	
	
	
	public static void population(Connection connection) throws SQLException {
		ResultSet main_query = connection.prepareStatement("SELECT * FROM " + schemas[0] + "." + tables[0]).executeQuery();
		while(main_query.next()) {
			int ID = main_query.getInt("id");
			int ageID = main_query.getInt("age_period_id");
			Age age = null;
			if(Main.ages.get(ageID - 1).getID() == ageID) age = Main.ages.get(ageID - 1);
			else {
				System.err.println("Problem (age) at nearby line.");
				System.exit(0);
			}
			int municID = main_query.getInt("municipality_id");
			Municipality munic = null;
			if(Main.municipalities.get(municID - 1).getID() == municID) munic = Main.municipalities.get(municID - 1);
			else {
				System.err.println("Problem (municipality) at nearby line.");
				System.exit(0);
			}
			int menCount = main_query.getInt("men");
			int womenCount = main_query.getInt("women");
			Main.population.add(new Population(ID, age, munic, menCount, womenCount));
		}
		//for(int i = 0; i < Main.population.size(); i++) System.out.println(Main.population.get(i).getMenCount());
	}
}
