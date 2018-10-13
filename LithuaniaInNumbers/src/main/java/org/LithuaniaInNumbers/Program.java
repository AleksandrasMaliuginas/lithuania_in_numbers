package org.LithuaniaInNumbers;

import java.sql.SQLException;

import org.LithuaniaInNumbers.Repositories.PopulationRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Program {
	public static void main(String[] args) {
		
        SpringApplication.run(Program.class, args);
        
        new Database().connect();
        try {
        	new PopulationRepository().getAveragePopAge(11);
        } catch(SQLException e) {
        	
        }
      /*  try {
			new PopulationRepository().getTotalPop(11);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
    }
}