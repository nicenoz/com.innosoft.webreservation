package com.innosoft.webreservation.service;

import java.util.List;
import com.innosoft.webreservation.entity.MstCalendar;

/**
 * CRUD service interface for calendar
 */
public interface CalendarService {
	/**
	 * List calendar method
	 * @return
	 */
	public List<MstCalendar> listCalendar();
	/**
	 * Add calendar method
	 * @param calendar
	 * @return
	 */
	public MstCalendar addCalendar(MstCalendar calendar);
	/**
	 * Edit calendar method
	 * @param calendar
	 * @return
	 */
	public MstCalendar editCalendar(MstCalendar calendar);
	/**
	 * Delete calendar method
	 * @param id
	 * @return
	 */
	public boolean deleteCalendar(int id);
}
