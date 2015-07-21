package com.innosoft.webreservation.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innosoft.webreservation.entity.MstCalendar;
import com.innosoft.webreservation.entity.MstMessage;
import com.innosoft.webreservation.service.CalendarService;


@Controller
@RequestMapping("api/calendar")
public class CalendarApi {
	
	@Autowired
	private CalendarService calendarService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCalendar> listCalendar() {
		List<MstCalendar> list = calendarService.listCalendar();
		return list;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<MstCalendar> updateMessage(@RequestBody MstCalendar calendar) {
		try {
			if(calendar.getCLDR_ID()==0) {
				MstCalendar newCalendar = calendarService.addCalendar(calendar);
				return new ResponseEntity<MstCalendar>(newCalendar, HttpStatus.OK);
			} else {
				return new ResponseEntity<MstCalendar>(calendar, HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<MstCalendar>(calendar, HttpStatus.BAD_REQUEST);
		}	
	}	
}
