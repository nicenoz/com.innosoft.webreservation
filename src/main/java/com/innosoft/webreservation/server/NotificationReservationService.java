package com.innosoft.webreservation.server;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.innosoft.webreservation.entity.SysEmail;
import com.innosoft.webreservation.entity.SysSetting;
import com.innosoft.webreservation.service.EmailService;
import com.innosoft.webreservation.service.SysSettingService;

@Component("notificationReservationService")
public class NotificationReservationService {
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private SysSettingService sysSettingService;
	
	public void process() {
		try {
		    Calendar cal = Calendar.getInstance();
		    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		    System.out.println( sdf.format(cal.getTime()) );
		    int currentIdentifier = sysSettingService.getMaxId();
		    SysSetting set = new SysSetting();
		    set.setSSET_ID(currentIdentifier);
		    SysSetting CurrentTimeSet = sysSettingService.getSetting(set);
		    String time = CurrentTimeSet.getSSET_NOTIFICATION_TIME().toString();
		    System.out.println("Succes");
		    if(time.equalsIgnoreCase(sdf.format(cal.getTime().toString())))
		    {
				SysEmail email = new SysEmail();
				email.setEMAIL_EMAIL("hgminerva@gmail.com,oliverrigonan@gmail.com,nathan.3rds@gmail.com");
				email.setEMAIL_MESSAGE("Shitness Overload");
				email.setEMAIL_SUBJECT("Success Test");

				boolean send = emailService.sendMail(email);

				if (send == true) {
					System.out.println("Success");
				} else {
					System.out.println("Failed");
				}
		    }
		    
		} catch (Exception e) {
			//System.out.println(e);
		}		
	}
}


