package org.LithuaniaInNumbers.Repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.LithuaniaInNumbers.Database;
import org.LithuaniaInNumbers.Models.People.Population;
import org.LithuaniaInNumbers.Models.People.AverageAge;

public class PeopleRepository {
	
	private Connection db = Database.connection;
	
	public List<Population> getPopulation(int territoryId) {
		
		List<Population> population = new ArrayList<>();
		
		try {
			ResultSet query;
			query = db.prepareStatement(
				"SELECT p.total, p.men, p.women, y.year\n" + 
				"FROM people.\"Population\" AS p, people.\"AgePeriods\" AS ap, general.\"Years\" AS y\n" + 
				"WHERE\n" + 
				"p.age_period_id = ap.id AND\n" + 
				"ap.year_id = y.id AND\n" + 
				"p.territory_id = " + territoryId + " AND\n" + 
				"ap.age = -1\n" + 
				"ORDER BY y.year;"
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
	
	public List<AverageAge> getAverageAge(int territoryId) {
		
		List<AverageAge> averageAge = new ArrayList<>();
		List<Population> population = this.getPopulation(territoryId);
		
		try {
			ResultSet query;
			query = db.prepareStatement(
				"SELECT SUM(ap.age * p.total), SUM(ap.age * p.men), SUM(ap.age * p.women), y.year\n" + 
				"FROM people.\"Population\" AS p, people.\"AgePeriods\" AS ap, general.\"Years\" AS y\n" + 
				"WHERE\n" + 
				"p.age_period_id = ap.id AND\n" + 
				"ap.year_id = y.id AND\n" + 
				"p.territory_id = " + territoryId + " AND\n" +
				"ap.age != -1\n" + 
				"GROUP BY y.year\n" + 
				"ORDER BY y.year;"
			).executeQuery();
			
			for(int i = 0; i < population.size() && query.next(); i++) {
				averageAge.add(
					new AverageAge(
						(float) query.getInt(1) / population.get(i).total,
						(float) query.getInt(2) / population.get(i).men,
						(float) query.getInt(3) / population.get(i).women,
						(float) query.getInt(4)
					)
				);
				System.out.println(population.get(i).total);
				System.out.println(query.getInt(1));
				System.out.println(query.getInt(1) / population.get(i).total);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return averageAge;
	}
}