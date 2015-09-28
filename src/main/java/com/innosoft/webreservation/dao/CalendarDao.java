package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCalendar;
/**
 * CRUD interface for calendar data object.
 */
public interface CalendarDao {
	/**
	 * List calendar method
	 * @return
	 */
	public List<MstCalendar> listCalendar();
	/**
	 * List calendar method 
	 * @param calendar
	 * @return
	 */
	public MstCalendar addCalendar(MstCalendar calendar);
	/**
	 * Add calendar method
	 * @param calendar
	 * @return
	 */
	public MstCalendar editCalendar(MstCalendar calendar);
	/**
	 * Delete calendar
	 * @param id
	 * @return
	 */
	public boolean deleteCalendar(int id);
}
