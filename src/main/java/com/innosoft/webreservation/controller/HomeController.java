package com.innosoft.webreservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("home");
		return model;
	}
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView model = new ModelAndView("login");
		return model;
	}	
	@RequestMapping("/logout") 
	public String logout() {
		return "redirect:/j_spring_security_logout";		
	}
	@RequestMapping("/about")
	public ModelAndView about() {
		ModelAndView model = new ModelAndView("home_about");
		return model;
	}	
	@RequestMapping("/register")
	public ModelAndView registration() {
		ModelAndView model = new ModelAndView("register");
		return model;
	}	
	@RequestMapping("/member")
	public ModelAndView member() {
		ModelAndView model = new ModelAndView("member");
		return model;
	}	
}
