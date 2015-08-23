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
	@RequestMapping("/loginFree")
	public ModelAndView loginFree() {
		ModelAndView model = new ModelAndView("login_free");
		return model;
	}
	@RequestMapping("/loginMember")
	public ModelAndView loginMember() {
		ModelAndView model = new ModelAndView("login_member");
		return model;
	}
	@RequestMapping("/loginSecure")
	public ModelAndView loginSecure() {
		ModelAndView model = new ModelAndView("login_secure");
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
	@RequestMapping("/registerSecure")
	public ModelAndView registerSecure() {
		ModelAndView model = new ModelAndView("register_secure");
		return model;
	}
	@RequestMapping(value = "/member/{userId}", method=RequestMethod.GET)
	public ModelAndView member(@PathVariable("userId") int userId) {
		MstSecurityUser user = userService.getUser(userId); 
		ModelAndView model = new ModelAndView("member");
		model.addObject("Email", user.USER_LOGIN);
		return model;
	}	
	@RequestMapping(value = "/loginFreePassword/email={userEmailAdd}", method=RequestMethod.GET)
	public ModelAndView free(@PathVariable("userEmailAdd") String userEmailAdd) {
		MstSecurityUser userEmail = userService.getUserEmail(userEmailAdd); 
		ModelAndView model = new ModelAndView("login_free_password");
		model.addObject("UserEmail", userEmail.USER_LOGIN);
		return model;
	}
	@RequestMapping("/register")
	public ModelAndView register() {
		ModelAndView model = new ModelAndView("register_secure");
		return model;
	}
}
