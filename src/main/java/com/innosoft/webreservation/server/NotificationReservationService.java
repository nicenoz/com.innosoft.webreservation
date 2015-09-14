package com.innosoft.webreservation.server;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.innosoft.webreservation.entity.SysEmail;
import com.innosoft.webreservation.service.EmailService;

@Component("notificationReservationService")
public class NotificationReservationService {
	
	@Autowired
	private EmailService emailService;
	
	public void process() {
		try {
			/*SysEmail email = new SysEmail();
			email.setEMAIL_EMAIL("hgminerva@gmail.com");
			email.setEMAIL_MESSAGE("Shitness Overload");
			email.setEMAIL_SUBJECT("Success Test");

			boolean send = emailService.sendMail(email);

			if (send == true) {
				System.out.println("Success");
			} else {
				System.out.println("Failed");
			}*/
		} catch (Exception e) {
			//System.out.println(e);
		}		
	}
}


