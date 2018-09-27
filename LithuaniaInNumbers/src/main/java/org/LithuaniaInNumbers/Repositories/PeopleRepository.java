package org.LithuaniaInNumbers.Repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.LithuaniaInNumbers.Database;
import org.LithuaniaInNumbers.Models.People.Population;
import org.LithuaniaInNumbers.Models.People.AverageAge;
import org.LithuaniaInNumbers.Models.People.Density;

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
						query.getFloat(1) / population.get(i).total,
						query.getFloat(2) / population.get(i).men,
						query.getFloat(3) / population.get(i).women,
						query.getInt(4)
					)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return averageAge;
	}
	
public List<Density> getDensity(int territoryId) {
		
		List<Density> density = new ArrayList<>();
		
		try {
			ResultSet query;
			query = db.prepareStatement(
				"SELECT d.total, y.year\n" + 
				"FROM people.\"Density\" AS d, general.\"Years\" AS y\n" + 
				"WHERE\n" + 
				"d.year_id = y.id AND\n" + 
				"d.territory_id = " + territoryId + " AND\n" + 
				"d.total IS NOT NULL\n" + 
				"ORDER BY y.year;"
			).executeQuery();
			
			while(query.next()) {
				density.add(
					new Density(
						query.getFloat(1),
						query.getInt(2)
					)
				);
				// System.out.println(query.getFloat(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return density;
	}
}