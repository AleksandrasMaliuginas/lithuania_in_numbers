package org.LithuaniaInNumbers.Repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.LithuaniaInNumbers.Database;
import org.LithuaniaInNumbers.Models.People.Population;
import org.LithuaniaInNumbers.Models.People.PopulationRatio;
import org.LithuaniaInNumbers.Models.People.AverageAge;
import org.LithuaniaInNumbers.Models.People.Density;

public class PopulationRepository {
	
	private Connection db = Database.connection;
	
	public Map<Integer, Population> getTerritoryPopulation(int territoryId) {
		
		Map<Integer, Population> population = new HashMap<>();
		
		try {
			ResultSet query;
			query = db.prepareStatement(
				"SELECT y.year, p.total, p.men, p.women\n" + 
				"FROM people.\"Population\" AS p, people.\"AgePeriods\" AS ap, general.\"Years\" AS y\n" + 
				"WHERE\n" + 
					"p.age_period_id = ap.id AND\n" + 
					"ap.year_id = y.id AND\n" + 
					"p.territory_id = " + territoryId + " AND\n" + 
					"ap.age = -1\n" + 
				"ORDER BY y.year;"
			).executeQuery();
			
			while(query.next()) {
				population.put(
					query.getInt(1),
					new Population(
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
	
	/*
	 * Returns: ratio of population in certain age group to all population
	 * */
	public Map<Integer, PopulationRatio> getTerritoryPopulationRatio(int territoryId, int ageFrom, int ageTo) {
		
		Map<Integer, PopulationRatio> populationBetweenAges = new HashMap<>();
		Map<Integer, Population> population = this.getTerritoryPopulation(territoryId);
		
		try {
			ResultSet query;
			query = db.prepareStatement(
				"SELECT y.year, SUM(p.total), SUM(p.men), SUM(p.women)\n" + 
				"FROM people.\"Population\" AS p, people.\"AgePeriods\" AS ap, general.\"Years\" AS y\n" + 
				"WHERE\n" + 
					"p.age_period_id = ap.id AND\n" + 
					"ap.age >= " + ageFrom + " AND\n" + 
					"ap.age <= " + ageTo + " AND\n" + 
					"ap.year_id = y.id AND\n" + 
					"p.territory_id = " + territoryId + " \n" + 
				"GROUP BY y.year\n" + 
				"ORDER BY y.year;"
			).executeQuery();
			
			for(int i = 0; i < population.size() && query.next(); i++) {
				populationBetweenAges.put(
					query.getInt(1),
					new PopulationRatio(
						query.getFloat(2) / population.get(query.getInt(1)).total,
						query.getFloat(3) / population.get(query.getInt(1)).men,
						query.getFloat(4) / population.get(query.getInt(1)).women
					)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return populationBetweenAges;
	}
	
	public Map<Integer, AverageAge> getTerritoryAverageAge(int territoryId) {
		
		Map<Integer, AverageAge> averageAge = new HashMap<>();
		Map<Integer, Population> population = this.getTerritoryPopulation(territoryId);
		
		try {
			ResultSet query;
			query = db.prepareStatement(
				"SELECT y.year, SUM(ap.age * p.total), SUM(ap.age * p.men), SUM(ap.age * p.women)\n" + 
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
				averageAge.put(
					query.getInt(1),
					new AverageAge(
						query.getFloat(2) / population.get(query.getInt(1)).total,
						query.getFloat(3) / population.get(query.getInt(1)).men,
						query.getFloat(4) / population.get(query.getInt(1)).women
					)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return averageAge;
	}
	
	public Map<Integer, Density> getTerritoryDensity(int territoryId) {
		
		Map<Integer, Density> density = new HashMap<>();
		
		try {
			ResultSet query;
			query = db.prepareStatement(
				"SELECT y.year, d.total\n" + 
				"FROM people.\"Density\" AS d, general.\"Years\" AS y\n" + 
				"WHERE\n" + 
				"d.year_id = y.id AND\n" + 
				"d.territory_id = " + territoryId + " AND\n" + 
				"d.total IS NOT NULL\n" + 
				"ORDER BY y.year;"
			).executeQuery();
			
			while(query.next()) {
				density.put(
					query.getInt(1),
					new Density(
						query.getFloat(2)
					)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return density;
	}
}