package org.LithuaniaInNumbers.Controllers;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.SQLException;
import java.util.List;

import org.LithuaniaInNumbers.Models.People.Population;
import org.LithuaniaInNumbers.Repositories.PeopleRepository;

@RestController
@RequestMapping(value = "/people")
public class PeopleController {
	
	@RequestMapping(value = "/population", method = RequestMethod.GET)
	public List<Population> population(@RequestParam(name="territoryId", required=false, defaultValue="1") int municipalityID) {
		try {
			return new PeopleRepository().getTotalPop(municipalityID);
		} catch (SQLException e) {
			System.err.println("Error in PeopleControllers!");
		}
		return null;
	}
}