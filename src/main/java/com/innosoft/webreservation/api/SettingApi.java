package com.innosoft.webreservation.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.innosoft.webreservation.entity.SysSetting;
import com.innosoft.webreservation.service.SysSettingService;

@Controller
@RequestMapping("api/Settings")
public class SettingApi {
	
	@Autowired
	private SysSettingService sysSettingService;

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<String> updateSetting(@RequestBody SysSetting time) {
		try {	
			String valTime = null;
			if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("1 am"))
			{
				valTime = "1:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("2 am"))
			{
				valTime = "2:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("3 am"))
			{
				valTime = "3:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("4 am"))
			{
				valTime = "4:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("5 am"))
			{
				valTime = "5:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("6 am"))
			{
				valTime = "6:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("7 am"))
			{
				valTime = "7:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("8 am"))
			{
				valTime = "8:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("9 am"))
			{
				valTime = "9:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("10 am"))
			{
				valTime = "10:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("11 am"))
			{
				valTime = "11:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("12 PM"))
			{
				valTime = "12:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("1 pm"))
			{
				valTime = "13:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("2 pm"))
			{
				valTime = "14:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("3 pm"))
			{
				valTime = "15:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("4 pm"))
			{
				valTime = "16:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("5 pm"))
			{
				valTime = "17:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("6 pm"))
			{
				valTime = "18:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("7 pm"))
			{
				valTime = "19:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("8 pm"))
			{
				valTime = "20:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("9 pm"))
			{
				valTime = "21:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("10 pm"))
			{
				valTime = "22:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("11 pm"))
			{
				valTime = "23:00:00";
			}
			else if(time.SSET_NOTIFICATION_TIME.equalsIgnoreCase("12 am"))
			{
				valTime = "00:00:00";
			}
			
			time.setSSET_NOTIFICATION_TIME(valTime);
			sysSettingService.addSetting(time);
			return new ResponseEntity<String>(HttpStatus.OK);
		} catch(Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
}
