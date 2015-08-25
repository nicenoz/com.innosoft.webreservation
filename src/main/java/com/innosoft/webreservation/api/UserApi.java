package com.innosoft.webreservation.api;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.innosoft.webreservation.entity.MstCustomer;
import com.innosoft.webreservation.entity.MstSecurityUser;
import com.innosoft.webreservation.entity.SysEmail;
import com.innosoft.webreservation.service.CustomerService;
import com.innosoft.webreservation.service.EmailService;
import com.innosoft.webreservation.service.UserService;

@Controller
@RequestMapping("api/user")
public class UserApi {

	@Autowired
	private UserService userService;

	@Autowired
	private EmailService emailService;
	
	@Autowired
	private CustomerService customerService;

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
			if (searchUser == null || searchUser.getUSER_ID() == 0) 
			{
				user.setUSER_ID(searchUser.getUSER_ID());
				MstSecurityUser newUser = userService.editUser(user);
				return new ResponseEntity<String>(HttpStatus.OK);
			} 
			else
			{
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
			
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	

	@RequestMapping(value = "/free", method = RequestMethod.POST)
	public ResponseEntity<String> freeUser(@RequestBody MstSecurityUser user) {
		try {
			System.out.println("Getting User name.");
			MstSecurityUser searchUser = userService.getUser(user.getUSER_LOGIN());
			MstCustomer customer = new MstCustomer();
			int[] combo = new int[5];
			String passwordCombo = new String();
			Random rand = new Random();
			
			System.out.println("Generating Password.");
			for(int i = 0; i < 5; i++)
			{
				combo[i] = rand.nextInt();
				passwordCombo = passwordCombo+combo[i];
			}
			System.out.println("Generating Password Success.");
			
			if (searchUser.getUSER_ID() == 0) 
			{
				System.out.println("Adding Password for Existing Email.");
				user.setUSER_PASSWORD(passwordCombo);
				userService.editUser(user);
			} 
			else
			{
				System.out.println("Adding Password for non Existing Email.");
				user.setUSER_LOGIN(user.USER_LOGIN);
				user.setUSER_PASSWORD(passwordCombo);
				userService.addUser(user);
				customer.setCUST_ID(1);
			}
			System.out.println("Successfully Add! \n A new Free user Has been added!.");
			System.out.println("Adding Customer . . .");
			customer.setCUST_CUSTOMER_NO("00000000");
			customer.setCUST_NAME("Free Customer");
			customerService.addCustomer(customer);
			System.out.println("Adding Customer Successfull. \n A new Customer has been added!.");
			
			System.out.println("Trying to send the email . . .");
			SysEmail se = new SysEmail();
			se.setEMAIL_EMAIL(user.USER_LOGIN);
			se.setEMAIL_MESSAGE("http://localhost:8082/webreservation/login/ \n password:"+passwordCombo);
			se.setEMAIL_SUBJECT("Web Reservation Free User");
			boolean sendMail = emailService.sendMail(se);
			if (sendMail == true) {
				System.out.println("Mail Already Send.. \n Thank you for Using this application.. Please enjoy!. and have fun");
				return new ResponseEntity<String>(HttpStatus.OK);
			} else {
				System.out.println("Failed to Send The Email because of the");
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
/*	@RequestMapping(value = "/member", method = RequestMethod.POST)
	public ResponseEntity<String> memberUser(@RequestBody MstSecurityUser user) {
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
	}*/

	@RequestMapping(value = "/loginFreeUser", method = RequestMethod.POST)
	public ResponseEntity<String> loginFreeUser(@RequestBody MstSecurityUser user) {
		try {
			String password = this.generatePassword();
			MstSecurityUser searchUser = userService.getUser(user.getUSER_LOGIN());
			if (searchUser.getUSER_ID() == null) {
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
