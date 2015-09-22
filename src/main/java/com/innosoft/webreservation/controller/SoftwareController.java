package com.innosoft.webreservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 * Software page controller includes schedule, notification settings and email magazine
 */
@Controller
@RequestMapping("software")
public class SoftwareController {
	/**
	 * Software controller
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("software");
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
