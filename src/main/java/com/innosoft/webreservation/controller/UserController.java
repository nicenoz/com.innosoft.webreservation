package com.innosoft.webreservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 *User page controller includes user, reservation report, etc.
 */
@Controller
@RequestMapping("user")
public class UserController {
	/**
	 * User controller
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("user");
		return model;
	}
	/**
	 * 	User charging report controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/chargingReport")
	public String chargingReport(Model model) {
		return "user_chargingReport";
	}	
	/**
	 * User password controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/userPassword")
	public String userPassword(Model model) {
		return "user_userPassword";
	}
	/**
	 * user reservation report controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/reservationReport")
	public String reservationReport(Model model) {
		return "user_reservationReport";
	}	
	/**
	 * user user controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/user")
	public String user(Model model) {
		return "user_user";
	}	
	/**
	 * user user Report
	 * @param model
	 * @return
	 */
	@RequestMapping("/userReport")
	public String userReport(Model model) {
		return "user_userReport";
	}	
}
