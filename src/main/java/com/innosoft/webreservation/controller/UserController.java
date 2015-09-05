package com.innosoft.webreservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("user")
public class UserController {
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("user");
		return model;
	}
		
	@RequestMapping("/chargingReport")
	public String chargingReport(Model model) {
		return "user_chargingReport";
	}	
	
	@RequestMapping("/userPassword")
	public String userPassword(Model model) {
		return "user_userPassword";
	}
	
	@RequestMapping("/reservationReport")
	public String reservationReport(Model model) {
		return "user_reservationReport";
	}	
	
	@RequestMapping("/user")
	public String user(Model model) {
		return "user_user";
	}	
	
	@RequestMapping("/userReport")
	public String userReport(Model model) {
		return "user_userReport";
	}	
}
