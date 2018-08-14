package org.LithuaniaInNumbers.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONObject;


@Controller
public class HelloServlet {
	
	@GetMapping("/")
    public String home() {
        // model.addAttribute("name", name);
        return "index";
    }
	
	@GetMapping("/hello")
    public String hello(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        return "hello";
    }
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/abc", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public JSONObject abc() {
		JSONObject obj = new JSONObject();

		obj.put("name", "Hahahahahaha");
		
		return obj;
	}
}