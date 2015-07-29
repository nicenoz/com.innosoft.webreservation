package com.innosoft.webreservation.api;

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
	
}
