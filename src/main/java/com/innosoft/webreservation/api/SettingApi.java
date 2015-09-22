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
/**
 * Settings CRUD API (Use to define server jobs, e.g., email notification)
 */
@Controller
@RequestMapping("api/settings")
public class SettingApi {
	/**
	 * System setting service property
	 */
	@Autowired
	private SysSettingService sysSettingService;
	/**
	 * Update setting
	 * @param setting
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<String> updateSetting(@RequestBody SysSetting setting) {
		try {	
			String valTime = null;
			
			if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("1 AM"))
			{
				valTime = "01";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("2 AM"))
			{
				valTime = "02";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("3 AM"))
			{
				valTime = "03";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("4 AM"))
			{
				valTime = "04";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("5 AM"))
			{
				valTime = "05";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("6 AM"))
			{
				valTime = "06";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("7 AM"))
			{
				valTime = "07";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("8 AM"))
			{
				valTime = "08";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("9 AM"))
			{
				valTime = "09";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("10 AM"))
			{
				valTime = "10";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("11 AM"))
			{
				valTime = "11";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("12 PM"))
			{
				valTime = "12";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("1 PM"))
			{
				valTime = "13";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("2 PM"))
			{
				valTime = "14";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("3 PM"))
			{
				valTime = "15";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("4 PM"))
			{
				valTime = "16";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("5 PM"))
			{
				valTime = "17";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("6 PM"))
			{
				valTime = "18";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("7 PM"))
			{
				valTime = "19";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("8 PM"))
			{
				valTime = "20";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("9 PM"))
			{
				valTime = "21";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("10 PM"))
			{
				valTime = "22";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("11 PM"))
			{
				valTime = "23";
			}
			else if(setting.SSET_NOTIFICATION_TIME.equalsIgnoreCase("12 AM"))
			{
				valTime = "00";
			}
			
			setting.setSSET_ID(sysSettingService.getMaxId());
			setting.setSSET_NOTIFICATION_TIME(valTime);
			setting.setSSET_NOTIFICATION_DATE(null);
			
			sysSettingService.editSetting(setting);
			
			return new ResponseEntity<String>(HttpStatus.OK);
			
		} catch(Exception e) {
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
}
