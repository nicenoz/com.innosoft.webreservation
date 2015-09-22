package com.innosoft.webreservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 *System page controller includes customer, calendar, etc. 
 */
@Controller
@RequestMapping("system")
public class SystemController {
	/**
	 * System controller
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("system");
		return model;
	}
	/**
	 * System calendar controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/calendar")
	public String calendar(Model model) {
		return "system_calendar";
	}	
	/**
	 * System charge controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/charge")
	public String charge(Model model) {
		return "system_charge";
	}	
	/**
	 * System code controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/code")
	public String code(Model model) {
		return "system_code";
	}	
	/**
	 * User activity controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/activity")
	public String activity(Model model) {
		return "user_activity";
	}
	/**
	 * System customer controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/customer")
	public String customer(Model model) {
		return "system_customer";
	}	
	/**
	 * System time controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/time")
	public String time(Model model) {
		return "system_time";
	}	
	/**
	 * System message controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/message")
	public String message(Model model) {
		return "system_message";
	}
	/**
	 * System user password controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/userPassword")
	public String userPassword(Model model) {
		return "system_userPassword";
	}		
}
