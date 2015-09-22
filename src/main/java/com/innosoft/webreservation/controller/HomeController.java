package com.innosoft.webreservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.innosoft.webreservation.entity.MstSecurityUser;
import com.innosoft.webreservation.service.UserService;
/**
 * Home page controller
 */
@Controller
public class HomeController {	
	/**
	 * User service property
	 */
	@Autowired
	private UserService userService;	
	/**
	 * Home controller
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("home");
		return model;
	}
	/**
	 * Login controller
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView model = new ModelAndView("login");
		return model;
	}
	/**
	 * Login Free contoller
	 * @return
	 */
	@RequestMapping("/loginFree")
	public ModelAndView loginFree() {
		ModelAndView model = new ModelAndView("login_free");
		return model;
	}
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/loginMember")
	public ModelAndView loginMember() {
		ModelAndView model = new ModelAndView("login_member");
		return model;
	}
	/**
	 * Login secure controller
	 * @return
	 */
	@RequestMapping("/loginSecure")
	public ModelAndView loginSecure() {
		ModelAndView model = new ModelAndView("login_secure");
		return model;
	}
	/**
	 * Logout controller
	 * @return
	 */
	@RequestMapping("/logout") 
	public String logout() {
		return "redirect:/j_spring_security_logout";		
	}
	/**
	 * Home about controller
	 * @return
	 */
	@RequestMapping("/about")
	public ModelAndView about() {
		ModelAndView model = new ModelAndView("home_about");
		return model;
	}
	/**
	 * Register secure controller
	 * @return
	 */
	@RequestMapping("/registerSecure")
	public ModelAndView registerSecure() {
		ModelAndView model = new ModelAndView("register_secure");
		return model;
	}
	/**
	 * UserId controller
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/member/{userId}", method=RequestMethod.GET)
	public ModelAndView member(@PathVariable("userId") int userId) {
		MstSecurityUser user = userService.getUser(userId); 
		ModelAndView model = new ModelAndView("member");
		model.addObject("Email", user.USER_LOGIN);
		return model;
	}	
	/**
	 * User email add controller
	 * @param userEmailAdd
	 * @return
	 */
	@RequestMapping(value = "/loginFreePassword/email={userEmailAdd}", method=RequestMethod.GET)
	public ModelAndView free(@PathVariable("userEmailAdd") String userEmailAdd) {
		MstSecurityUser userEmail = userService.getUserEmail(userEmailAdd); 
		ModelAndView model = new ModelAndView("login_free_password");
		model.addObject("UserEmail", userEmail.USER_LOGIN);
		return model;
	}
	/**
	 * Register secure controller
	 * @return
	 */
	@RequestMapping("/register")
	public ModelAndView register() {
		ModelAndView model = new ModelAndView("register_secure");
		return model;
	}
}
