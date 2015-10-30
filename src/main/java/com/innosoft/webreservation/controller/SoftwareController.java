package com.innosoft.webreservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.innosoft.webreservation.service.SecurityService;
/**
 * Software page controller includes schedule, notification settings and email magazine
 */
@Controller
@RequestMapping("software")
public class SoftwareController {
	
	@Autowired
	private SecurityService securityService;
	
	/**
	 * Software controller
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView index() {
		int userRole = securityService.getCurrentUser().getUSER_ROLES();
		ModelAndView model;
		
		if(userRole == 1){
			model = new ModelAndView("system");
		} else if(userRole == 2){
			model = new ModelAndView("system");
		} else if(userRole == 3){
			model = new ModelAndView("software");
		} else{ //3
			model = new ModelAndView("home");
		}
		
		return model;
	}
	/**
	 * Software charging contoller
	 * @param model
	 * @return
	 */
	@RequestMapping("/charging")
	public String charging(Model model) {
		return "software_charging";
	}	
	/**
	 * Software email controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/email")
	public String email(Model model) {
		return "software_email";
	}	
	/**
	 * software notification email controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/notificationEmail")
	public String userPassword(Model model) {
		return "software_notificationEmail";
	}		
}
