package com.innosoft.webreservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("software")
public class SoftwareController {
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("software");
		return model;
	}
	
	@RequestMapping("/alpha")
	public ModelAndView alpha() {
		ModelAndView model = new ModelAndView("alpha");
		return model;
	}
	
	@RequestMapping("/charging")
	public String charging(Model model) {
		return "software_charging";
	}	
	
	@RequestMapping("/email")
	public String email(Model model) {
		return "software_email";
	}	
	
	@RequestMapping("/userPassword")
	public String userPassword(Model model) {
		return "software_userPassword";
	}		
}
