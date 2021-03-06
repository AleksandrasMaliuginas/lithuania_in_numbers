package org.LithuaniaInNumbers.Repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.LithuaniaInNumbers.Database;
import org.LithuaniaInNumbers.Models.Territory;

public class MainRepository {
	
	private Connection db = Database.connection;
	
	public List<Territory> getTerritories() {
		
		List<Territory> territories = new ArrayList<>();
		
		try {
			ResultSet query;
			query = db.prepareStatement("SELECT * FROM general.\"Territories\";").executeQuery();
			
			while(query.next()) {
				territories.add(
					new Territory(
						query.getInt(1),
						query.getString(2),
						query.getInt(3),
						query.getInt(4)
					)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return territories;
	}
}