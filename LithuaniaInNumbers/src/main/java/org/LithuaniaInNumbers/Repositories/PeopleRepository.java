package org.LithuaniaInNumbers.Repositories;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.LithuaniaInNumbers.Database;
import org.LithuaniaInNumbers.Models.People.Population;

public class PeopleRepository {
	
	public List<Population> getTotalPop(int municipalityID) throws SQLException {
		List<Population> population = new ArrayList<Population>();
		PreparedStatement statement = Database.getConnection().prepareStatement("SELECT p.men, p.women, y.year " + 
				"FROM people.\"Population\" AS p " + 
				"INNER JOIN people.\"AgePeriods\" AS ap " + 
				"ON p.age_period_id = ap.id " + 
				"INNER JOIN general.\"Years\" AS y " + 
				"ON ap.year_id = y.id " + 
				"WHERE p.municipality_id = " + municipalityID);
		ResultSet query = statement.executeQuery();
		while(query.next()) {
			population.add(new Population(query.getInt(3), query.getInt(1), query.getInt(2)));
		}
		return population;
	}

}