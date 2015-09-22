package com.innosoft.webreservation.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innosoft.webreservation.entity.MstCalendarActivity;
import com.innosoft.webreservation.service.CalendarActivityService;
import com.innosoft.webreservation.service.SecurityService;

@Controller
@RequestMapping("api/calendarActivity")
public class CalendarActivityApi {
	@Autowired
	private CalendarActivityService calendarActivityService;
	@Autowired
	private SecurityService securityService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCalendarActivity> listCalendarActivity() {
		List<MstCalendarActivity> list = calendarActivityService.listCalendarActivity();
		return list;
	}	
	
	@RequestMapping(value = "/listByCustomer", method = RequestMethod.GET, produces = "application/json", params = {"customerId"})
	public @ResponseBody List<MstCalendarActivity> listCalendarActivityByCustomer(@RequestParam(value="customerId") int customerId) {
		List<MstCalendarActivity> list = calendarActivityService.listCalendarActivityByCustomer(customerId);
		return list;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<MstCalendarActivity> updateCalendarActivity(@RequestBody MstCalendarActivity calendarActivity) {
		try {
			System.out.print(calendarActivityService.listCalendarActivityByCalendarDate(calendarActivity).size());
			if(calendarActivityService.listCalendarActivityByCalendarDate(calendarActivity).size() == 0){
				if(calendarActivity.getCACT_ID()==0) {
					calendarActivity = (MstCalendarActivity)securityService.stampCreated(calendarActivity);
					MstCalendarActivity newCalendarActivity = calendarActivityService.addCalendarActivity(calendarActivity);
					return new ResponseEntity<MstCalendarActivity>(newCalendarActivity, HttpStatus.OK);
				} else {
					calendarActivity = (MstCalendarActivity)securityService.stampUpdated(calendarActivity);
					MstCalendarActivity editCalendarActivity = calendarActivityService.editCalendarActivity(calendarActivity);
					return new ResponseEntity<MstCalendarActivity>(editCalendarActivity, HttpStatus.OK);
				}
			}else{
				return new ResponseEntity<MstCalendarActivity>(HttpStatus.BAD_REQUEST);
			}
		} catch(Exception e) {
			return new ResponseEntity<MstCalendarActivity>(HttpStatus.BAD_REQUEST);
		}	
	}	
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteCalendarActivity(@PathVariable("id") int id) {
		try {
			boolean deleteCalendar = calendarActivityService.deleteCalendarActivity(id);
			if (deleteCalendar==true) {
				return new ResponseEntity<String>(HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
		}catch(Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}	
}
