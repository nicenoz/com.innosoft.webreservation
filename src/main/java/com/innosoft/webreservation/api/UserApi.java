package com.innosoft.webreservation.api;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.innosoft.webreservation.entity.MstSecurityUser;
import com.innosoft.webreservation.entity.SysEmail;
import com.innosoft.webreservation.service.EmailService;
import com.innosoft.webreservation.service.UserService;

@Controller
@RequestMapping("api/user")
public class UserApi {

	@Autowired
	private UserService userService;

	@Autowired
	private EmailService emailService;
	
	private String generatePassword() {
		String password = "";
		Random rand = new Random();
		for(int i = 0; i < 5; i++)
		{
			Integer randomNumber =  rand.nextInt(9);
			password = password + randomNumber.toString();
		}		
		return password;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<String> updateUser(@RequestBody MstSecurityUser user) {
		try {
			MstSecurityUser searchUser = userService.getUser(user.getUSER_LOGIN());
			if (searchUser.getUSER_ID() == 0) 
			{
				MstSecurityUser newUser = userService.addUser(user);
				
				SysEmail se = new SysEmail();
				se.setEMAIL_EMAIL(user.USER_LOGIN);
				se.setEMAIL_MESSAGE("http://localhost:8082/webreservation/login/"+newUser.getUSER_ID());
				se.setEMAIL_SUBJECT("Web Reservation Membership");

				boolean sendMail = emailService.sendMail(se);
				if (sendMail == true) {
					return new ResponseEntity<String>(HttpStatus.OK);
				} else {
					return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
				}
			} 
			else
			{
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
			
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/loginFreeUser", method = RequestMethod.POST)
	public ResponseEntity<String> loginFreeUser(@RequestBody MstSecurityUser user) {
		try {
			String password = this.generatePassword();
			MstSecurityUser searchUser = userService.getUser(user.getUSER_LOGIN());
			if (searchUser.getUSER_ID() == 0) {
				user.setUSER_PASSWORD(password);
				userService.addUser(user);
			} 
			else {
				user.setUSER_PASSWORD(password);
				userService.editUser(user);				
			}
			
			// Email
			SysEmail mail = new SysEmail();
			mail.setEMAIL_EMAIL(user.USER_LOGIN);
			mail.setEMAIL_MESSAGE("LINK: http://magentatest.cloudapp.net/webreservation/loginFreePassword/?email=" + user.USER_LOGIN + " \n PASSWORD:" + password);
			mail.setEMAIL_SUBJECT("Free User Login Password");
			boolean sendMail = emailService.sendMail(mail);			
			if (sendMail == true) {
				return new ResponseEntity<String>(HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}	
}
