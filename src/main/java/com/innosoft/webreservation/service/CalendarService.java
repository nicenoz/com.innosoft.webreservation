package com.innosoft.webreservation.service;

import java.util.List;
import com.innosoft.webreservation.entity.MstCalendar;


public interface CalendarService {
	public List<MstCalendar> listCalendar();
	public MstCalendar addCalendar(MstCalendar calendar);
}
