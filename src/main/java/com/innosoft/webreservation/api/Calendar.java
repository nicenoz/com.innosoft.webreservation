package com.innosoft.webreservation.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innosoft.webreservation.entity.MstCalendar;
import com.innosoft.webreservation.service.CalendarService;


@Controller
@RequestMapping("api/calendar")
public class Calendar {
	
	@Autowired
	private CalendarService calendarService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCalendar> listCalendar() {
		List<MstCalendar> list = calendarService.listCalendar();
		return list;
	}
}
