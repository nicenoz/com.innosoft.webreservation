package com.innosoft.webreservation.api;

import java.util.Date;

import javax.persistence.Column;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.innosoft.webreservation.entity.MstCharge;
import com.innosoft.webreservation.entity.SysEmail;
import com.innosoft.webreservation.entity.TrnSendLog;
import com.innosoft.webreservation.service.EmailService;
import com.innosoft.webreservation.service.SendLogService;

@Controller
@RequestMapping("api/email")
public class EmailApi {
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private SendLogService sendLogService;
			
	@RequestMapping(value = "/send", method = RequestMethod.POST)		
	public ResponseEntity<String> sendMail(@RequestBody SysEmail email) {
		try {
			TrnSendLog newSendLog = new TrnSendLog();
			
			newSendLog.SLOG_TIME_STAMP = new Date();
			newSendLog.SLOG_EMAIL_ADDRESS = email.EMAIL_EMAIL;
			newSendLog.SLOG_MEBR_ID = email.EMAIL_RECEIVER_ID;
			newSendLog.SLOG_PURPOSE_DIVISION = email.EMAIL_PURPOSE;
			
			sendLogService.addSendLog(newSendLog);
			
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
