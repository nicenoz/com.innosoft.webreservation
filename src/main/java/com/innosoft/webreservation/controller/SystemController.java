package com.innosoft.webreservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("system")
public class SystemController {
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("system");
		return model;
	}
	
	@RequestMapping("/calendar")
	public String calendar(Model model) {
		return "system_calendar";
	}	
	
	@RequestMapping("/charge")
	public String charge(Model model) {
		return "system_charge";
	}	
	
	@RequestMapping("/code")
	public String code(Model model) {
		return "system_code";
	}	
	
	@RequestMapping("/customer")
	public String customer(Model model) {
		return "system_customer";
	}	
	
	@RequestMapping("/time")
	public String time(Model model) {
		return "system_time";
	}	
	
	
	@RequestMapping("/userPassword")
	public String userPassword(Model model) {
		return "system_userPassword";
	}	
	
	@RequestMapping("/message")
	public String message(Model model) {
		return "system_message";
	}
	
}
