package org.LithuaniaInNumbers.Controllers;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.ArrayList;
import java.util.List;

import org.LithuaniaInNumbers.Models.People.Population;

@RestController
@RequestMapping(value = "/people")
public class PeopleController {
	
	@RequestMapping(value = "/population", method = RequestMethod.POST)
	public List<Population> population(@RequestParam(name="name", required=false, defaultValue="World") String name) {
		
		List<Population> pop = new ArrayList<>();
		pop.add(new Population());
		
		return pop;
	}
}