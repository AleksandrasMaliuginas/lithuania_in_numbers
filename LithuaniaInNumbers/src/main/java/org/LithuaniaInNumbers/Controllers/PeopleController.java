package org.LithuaniaInNumbers.Controllers;

import java.util.Map;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.LithuaniaInNumbers.Repositories.PopulationRepository;
import org.LithuaniaInNumbers.Models.People.Population;
import org.LithuaniaInNumbers.Models.People.PopulationRatio;
import org.LithuaniaInNumbers.Models.People.AverageAge;
import org.LithuaniaInNumbers.Models.People.Density;

@RestController
@RequestMapping(value = "/people")
public class PeopleController {
	
	@RequestMapping(value = "/population", params = {"territoryId"}, method = RequestMethod.GET)
	public Map<Integer, Population> population(@RequestParam(name="territoryId", required=false, defaultValue="1") int territoryId) {
		
		return new PopulationRepository().getTerritoryPopulation(territoryId);
	}
	
	@RequestMapping(value = "/population", params = {"territoryId", "ageFrom", "ageTo"}, method = RequestMethod.GET)
	public Map<Integer, PopulationRatio> population(
		@RequestParam(name="territoryId", required=false, defaultValue="1") int territoryId,
		@RequestParam(name="ageFrom", required=false, defaultValue="0") int ageFrom,
		@RequestParam(name="ageTo", required=false, defaultValue="85") int ageTo
	) {
		
		return new PopulationRepository().getTerritoryPopulationRatio(territoryId, ageFrom, ageTo);
	}
	
	@RequestMapping(value = "/averageAge", params = {"territoryId"}, method = RequestMethod.GET)
	public Map<Integer, AverageAge> averageAge(@RequestParam(name="territoryId", required=false, defaultValue="1") int territoryId) {
		
		return new PopulationRepository().getTerritoryAverageAge(territoryId);
	}
	
	@RequestMapping(value = "/density", params = {"territoryId"}, method = RequestMethod.GET)
	public Map<Integer, Density> density(@RequestParam(name="territoryId", required=false, defaultValue="1") int territoryId) {
		
		return new PopulationRepository().getTerritoryDensity(territoryId);
	}
	
	@RequestMapping(value = "/", params = {"territoryId"}, method = RequestMethod.GET)
	public Map<Integer, Density> density(@RequestParam(name="territoryId", required=false, defaultValue="1") int territoryId) {
		
		return new PopulationRepository().getTerritoryDensity(territoryId);
	}
}