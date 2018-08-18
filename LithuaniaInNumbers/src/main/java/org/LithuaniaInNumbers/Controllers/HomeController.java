package org.LithuaniaInNumbers.Controllers;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.List;

import org.LithuaniaInNumbers.Models.Territory;
import org.LithuaniaInNumbers.Repositories.MainRepository;

@RestController
public class HomeController {
	
	@RequestMapping(value = "/territories", method = RequestMethod.GET)
	public List<Territory> territories() {
		
		return new MainRepository().getTerritories();
	}
}