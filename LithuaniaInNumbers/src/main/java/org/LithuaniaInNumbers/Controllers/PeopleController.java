package org.LithuaniaInNumbers.Controllers;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.SQLException;
import java.util.List;

import org.LithuaniaInNumbers.Models.People.population.TotalPopulation;
import org.LithuaniaInNumbers.Repositories.PopulationRepository;

@RestController
@RequestMapping(value = "/people")
public class PeopleController {
	
	@RequestMapping(value = "/population", method = RequestMethod.GET)
	public List<TotalPopulation> population(@RequestParam(name="territoryId", required=false, defaultValue="1") int municipalityID) {
		try {
			return new PopulationRepository().getTotalPop(municipalityID);
		} catch (SQLException e) {
			System.err.println("Error in PeopleControllers!");
		}
		return null;
	}
}