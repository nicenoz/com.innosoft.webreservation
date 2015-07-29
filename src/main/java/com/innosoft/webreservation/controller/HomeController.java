package com.innosoft.webreservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.innosoft.webreservation.entity.MstSecurityUser;
import com.innosoft.webreservation.service.UserService;

@Controller
public class HomeController {	
	@Autowired
	private UserService userService;	
	
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
	@RequestMapping(value = "/member/{userId}", method=RequestMethod.GET)
	public ModelAndView member(@PathVariable("userId") int userId) {
		MstSecurityUser user = userService.getUser(userId); 
		ModelAndView model = new ModelAndView("member");
		model.addObject("Email", user.USER_LOGIN);
		return model;
	}			
}
