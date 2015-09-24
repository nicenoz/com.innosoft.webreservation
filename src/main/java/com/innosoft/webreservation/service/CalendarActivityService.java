package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCalendarActivity;
/**
 * CRUD service interface for calendar activity
 */
public interface CalendarActivityService {
	/**
	 * List calendar activity method 
	 * @return
	 */
	public List<MstCalendarActivity> listCalendarActivity();
	/**
	 * List calendar activity by customer method
	 * @param customerId
	 * @return
	 */
	public List<MstCalendarActivity> listCalendarActivityByCustomer(int customerId);
	/**
	 * List calendar activity by calendar date method 
	 * @param calendarAct
	 * @return
	 */
	public List<MstCalendarActivity> listCalendarActivityByCalendarDate(MstCalendarActivity calendarAct);
	/**
	 * List calendar activity by calendar date method 
	 * @param calendarAct
	 * @return
	 */
	public MstCalendarActivity getCalendarActivityById(int cactId);
	/**
	 * Add calendar activity method 
	 * @param calendarActivity
	 * @return
	 */
	public MstCalendarActivity addCalendarActivity(MstCalendarActivity calendarActivity);
	/**
	 * Edit calendar activity method 
	 * @param calendarActivity
	 * @return
	 */
	public MstCalendarActivity editCalendarActivity(MstCalendarActivity calendarActivity);
	/**
	 * Delete calendar activity method 
	 * @param id
	 * @return
	 */
	public boolean deleteCalendarActivity(int id);
}
