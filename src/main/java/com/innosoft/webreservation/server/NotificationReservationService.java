package com.innosoft.webreservation.server;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.innosoft.webreservation.entity.SysEmail;
import com.innosoft.webreservation.entity.SysSetting;
import com.innosoft.webreservation.entity.TrnReservation;
import com.innosoft.webreservation.service.CustomerMemberService;
import com.innosoft.webreservation.service.EmailService;
import com.innosoft.webreservation.service.ReservationService;
import com.innosoft.webreservation.service.SysSettingService;
import com.innosoft.webreservation.service.UserService;

@Component("notificationReservationService")
public class NotificationReservationService {
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private SysSettingService sysSettingService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private CustomerMemberService customerMemberService;

	public void process() {
		try {
			SimpleDateFormat timeFormat = new SimpleDateFormat("HH");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			Calendar systemDate = Calendar.getInstance();

		    String currentTime = timeFormat.format(systemDate.getTime());
		    String currentDate = dateFormat.format(systemDate);

		    SysSetting setting = sysSettingService.getSetting(sysSettingService.getMaxId());
		    
		    String setTime = setting.getSSET_NOTIFICATION_TIME();
		    String setDate = dateFormat.format(setting.getSSET_NOTIFICATION_DATE());	
		    
		    if(setTime.equals(currentTime) && !setDate.equals(currentDate))
		    {
		    	List<TrnReservation> list = reservationService.notificationReservation(currentDate);
		    	for (int i = 0; i < list.size(); i++) {
					SysEmail email = new SysEmail();
					
					/*String email = customerMemberService.
					
					email.setEMAIL_EMAIL("hgminerva@gmail.com,oliverrigonan@gmail.com,nathan.3rds@gmail.com");
					email.setEMAIL_MESSAGE("Notification Email");
					email.setEMAIL_SUBJECT("You reservation is near.");

					emailService.sendMail(email);	*/	    	
		    	}
				SysSetting updateSetting = new SysSetting();
				updateSetting.setSSET_ID(sysSettingService.getMaxId());
				updateSetting.setSSET_NOTIFICATION_DATE(systemDate.getTime());
				updateSetting.setSSET_NOTIFICATION_TIME(null);
				
				sysSettingService.addSetting(updateSetting);
		    }
		    
		} catch (Exception e) {
			
		}		
	}
}


