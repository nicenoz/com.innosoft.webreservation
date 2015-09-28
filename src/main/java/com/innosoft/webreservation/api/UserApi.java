package com.innosoft.webreservation.api;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innosoft.webreservation.entity.MstSecurityUser;
import com.innosoft.webreservation.entity.SysEmail;
import com.innosoft.webreservation.service.CustomerMemberService;
import com.innosoft.webreservation.service.CustomerService;
import com.innosoft.webreservation.service.EmailService;
import com.innosoft.webreservation.service.UserPasswordService;
import com.innosoft.webreservation.service.UserService;
/**
 * User CRUD API
 */
@Controller
@RequestMapping("api/user")
public class UserApi {
	/**
	 * User  service property
	 */
	@Autowired
	private UserService userService;
	/**
	 * Email service property
	 */
	@Autowired
	private EmailService emailService;
	/**
	 * Customer service property
	 */
	@Autowired
	private CustomerService customerService;
	/**
	 * User password service property
	 */
	@Autowired
	private UserPasswordService userPasswordService;
	/**
	 * Customer member service property
	 */
	@Autowired
	private CustomerMemberService customerMemberService;

	private String generatePassword() {
		String password = "";
		Random rand = new Random();
		char val[] = {'a','b','c','d','e','f','A','B','C','D','E','F'};
		for(int i = 0; i < 5; i++)
		{
			Integer randomNumber =  rand.nextInt(9);
			password = password + randomNumber.toString() + val[i+3];
		}		
		return password;
	}
	/**
	 * Return list of send log
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstSecurityUser> listSendLog() {
		List<MstSecurityUser> list = userService.listUser();
		return list;
	}
	/**
	 * Update user
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<String> updateUser(@RequestBody MstSecurityUser user) {
		try {
			MstSecurityUser searchUser = userService.getUser(user.getUSER_LOGIN());

			if (searchUser.getUSER_ID() != 0) 
			{
				user.setUSER_ID(searchUser.getUSER_ID());
				userService.editUser(user);
				userPasswordService.insertPassword(searchUser.getUSER_PASSWORD(), searchUser.getUSER_ID());
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
	
	/**
	 * Return list of customer with customer no
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/loginFreeUser", method = RequestMethod.POST)
	public ResponseEntity<String> loginFreeUser(@RequestBody MstSecurityUser user) {
		int freeCustomerId = customerService.listCustomerWithNo("0").get(0).getCUST_ID();
		int memberId = 0;
		try {
			String password = this.generatePassword();

			int userId = userService.getUserIdIfEmailExist(user.USER_LOGIN);
			System.out.println("" + userId);
			if (userId == 0) {
				user.setUSER_PASSWORD(password);
				userId = userService.addUser(user).getUSER_ID();
			} 
			else {
				if(customerMemberService.isAlreadyFreeUser(freeCustomerId, user.USER_LOGIN)){
					user.setUSER_ID(userId);
					user.setUSER_PASSWORD(password);
					userService.editUser(user);	
					memberId = customerMemberService.getMemberByEmail(user.USER_LOGIN).get(0).getMEBR_ID();
				}
				else{
					return new ResponseEntity<String>(HttpStatus.CONFLICT);
				}
			}
			
			// Email
			SysEmail mail = new SysEmail();
			mail.setEMAIL_EMAIL(user.USER_LOGIN);
			
			mail.setEMAIL_MESSAGE("LINK: http://magentatest.cloudapp.net/webreservation/loginFreePassword/email=" + user.USER_LOGIN + " \n PASSWORD:" + password);
			mail.setEMAIL_SUBJECT("Free User Login Password");

			boolean sendMail = emailService.sendMail(mail);	
			if (sendMail == true) {
				//RETURN CUSTOMER ID WITH 000000 and User ID
				return new ResponseEntity<String>(String.valueOf(userId + "-" + freeCustomerId + "-" + user.USER_LOGIN + "-" + memberId), HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
}
