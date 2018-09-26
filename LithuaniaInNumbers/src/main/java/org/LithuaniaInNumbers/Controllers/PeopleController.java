package org.LithuaniaInNumbers.Controllers;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

import org.LithuaniaInNumbers.Models.People.Population;
import org.LithuaniaInNumbers.Models.People.AverageAge;
import org.LithuaniaInNumbers.Repositories.PeopleRepository;

@RestController
@RequestMapping(value = "/people")
public class PeopleController {
	
	@RequestMapping(value = "/population", method = RequestMethod.GET)
	public List<Population> population(@RequestParam(name="territoryId", required=false, defaultValue="1") int territoryId) {
		
		return new PeopleRepository().getPopulation(territoryId);
	}
	
	@RequestMapping(value = "/averageAge", method = RequestMethod.GET)
	public List<AverageAge> averageAge(@RequestParam(name="territoryId", required=false, defaultValue="1") int territoryId) {
		
		return new PeopleRepository().getAverageAge(territoryId);
	}
}