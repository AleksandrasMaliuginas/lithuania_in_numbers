package org.LithuaniaInNumbers.Repositories;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.LithuaniaInNumbers.Database;
import org.LithuaniaInNumbers.Models.People.population.AveragePopYear;
import org.LithuaniaInNumbers.Models.People.population.TotalPopulation;

public class PopulationRepository {
	
	public List<TotalPopulation> getTotalPop(int municipalityID) throws SQLException {
		List<TotalPopulation> population = new ArrayList<TotalPopulation>();
		PreparedStatement statement = Database.getConnection().prepareStatement("SELECT SUM(p.men), SUM(p.women), y.year " + 
				"FROM people.\"Population\" AS p " + 
				"INNER JOIN people.\"AgePeriods\" AS ap " + 
				"ON p.age_period_id = ap.id " + 
				"INNER JOIN general.\"Years\" AS y " + 
				"ON ap.year_id = y.id " + 
				"WHERE p.municipality_id = " + municipalityID + " GROUP BY y.year");
		ResultSet query = statement.executeQuery();
		while(query.next()) {
			population.add(new TotalPopulation(query.getInt(3), query.getInt(1), query.getInt(2)));
		}
		return population;
	}
	
	public List<AveragePopYear> getAveragePopYear(int municipalityID) throws SQLException {
		List<AveragePopYear> average = new ArrayList<AveragePopYear>();
		PreparedStatement statement = Database.getConnection().prepareStatement("SELECT p.men, p.women, ap.age, y.year "
				+ "FROM people.\"Population\" AS p INNER JOIN people.\"AgePeriods\" AS ap ON p.age_period_id = ap.id "
				+ "INNER JOIN general.\"Years\" AS y ON ap.year_id = y.id  WHERE p.municipality_id = " + municipalityID + ""
						+ "ORDER BY y.year");
		ResultSet query = statement.executeQuery();
		boolean next = query.next();
		while(next) {
			int year = query.getInt(4);
			int menSum = 0;
			int womenSum = 0;
			int totalMen = 0;
			int totalWomen = 0;
			while(query.getInt(4) == year) {
				int age = query.getInt(3);
				int men = query.getInt(1);
				int women = query.getInt(2);
				menSum += (men * age);
				womenSum += (women * age);
				totalMen += men;
				totalWomen += women;
				next = query.next();
				if(!next) break;
			}
			int menResult = menSum / totalMen;
			int womenResult = womenSum / totalWomen;
			int totalResult = (menSum + womenSum) / (totalMen + totalWomen);
			average.add(new AveragePopYear(year, menResult, womenResult, totalResult));
		}
		return average;
	}

}