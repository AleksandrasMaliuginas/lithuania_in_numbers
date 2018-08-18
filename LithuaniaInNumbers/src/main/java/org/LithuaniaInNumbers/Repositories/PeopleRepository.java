package org.LithuaniaInNumbers.Repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.LithuaniaInNumbers.Database;
import org.LithuaniaInNumbers.Models.People.Population;

public class PeopleRepository {
	
	private Connection db = Database.connection;
	
	public List<Population> getPopulation(int territoryId) {
		
		List<Population> population = new ArrayList<>();
		
		try {
			ResultSet query;
			query = db.prepareStatement(
				"SELECT p.total, p.men, p.women, y.year\n" + 
				"FROM people.\"Population\" AS p\n" + 
				"INNER JOIN people.\"AgePeriods\" AS ap\n" + 
				"ON p.age_period_id = ap.id\n" + 
				"INNER JOIN general.\"Years\" AS y\n" + 
				"ON ap.year_id = y.id\n" + 
				"WHERE p.municipality_id = 1 AND ap.age = -1;"
			).executeQuery();
			
			while(query.next()) {
				population.add(
					new Population(
						query.getInt(1),
						query.getInt(2),
						query.getInt(3),
						query.getInt(4)
					)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return population;
	}
}