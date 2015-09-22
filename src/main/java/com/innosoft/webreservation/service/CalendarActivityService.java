package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCalendarActivity;

public interface CalendarActivityService {
	public List<MstCalendarActivity> listCalendarActivity();
	public List<MstCalendarActivity> listCalendarActivityByCustomer(int customerId);
	public List<MstCalendarActivity> listCalendarActivityByCalendarDate(MstCalendarActivity calendarAct);
	public MstCalendarActivity addCalendarActivity(MstCalendarActivity calendarActivity);
	public MstCalendarActivity editCalendarActivity(MstCalendarActivity calendarActivity);
	public boolean deleteCalendarActivity(int id);
}
