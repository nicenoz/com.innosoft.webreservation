package com.innosoft.webreservation.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.innosoft.webreservation.entity.SysEmail;
import com.innosoft.webreservation.service.EmailService;

@Controller
@RequestMapping("api/email")
public class EmailApi {
		
		@Autowired
		private EmailService emailService;
				
		@RequestMapping(value = "/send", method = RequestMethod.POST)		
		public ResponseEntity<String> sendMail(@RequestBody SysEmail email) {
			try {
				boolean sendMail = emailService.sendMail(email);
				if (sendMail==true) {
					return new ResponseEntity<String>(HttpStatus.OK);
				} else {
					return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
				}
			}catch(Exception e) {
				return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
		}
		
}
