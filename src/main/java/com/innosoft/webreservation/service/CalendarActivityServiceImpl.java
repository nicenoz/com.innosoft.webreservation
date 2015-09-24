package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.CalendarActivityDao;
import com.innosoft.webreservation.entity.MstCalendarActivity;
/**
 * CRUD service implementation for calendar activity
 */
@Service
@Transactional
public class CalendarActivityServiceImpl implements CalendarActivityService{
	/**
	 * Calendar activity property
	 */
	@Autowired
    private CalendarActivityDao calendarActivityDao;
	/**
	 * List calendar activity method 
	 */
	public List<MstCalendarActivity> listCalendarActivity(){
		return calendarActivityDao.listCalendarActivity();
	}
	/**
	 * List calendar activity by customer method
	 */
	public List<MstCalendarActivity> listCalendarActivityByCustomer(int customerId){
		return calendarActivityDao.listCalendarActivityByCustomer(customerId);
	}	
	/**
	 * List calendar activity by calendar date method 
	 */
	public List<MstCalendarActivity> listCalendarActivityByCalendarDate(MstCalendarActivity calendarAct){
		return calendarActivityDao.listCalendarActivityByCalendarDate(calendarAct);
	}
	/**
	 * Add calendar activity method 
	 */
	public MstCalendarActivity addCalendarActivity(MstCalendarActivity calendarActivity){
		return calendarActivityDao.addCalendarActivity(calendarActivity);
	}
	/**
	 * Edit calendar activity method
	 */
	public MstCalendarActivity editCalendarActivity(MstCalendarActivity calendarActivity){
		return calendarActivityDao.editCalendarActivity(calendarActivity);
	}
	/**
	 * Delete calendar activity method
	 */
	public boolean deleteCalendarActivity(int id){
		return calendarActivityDao.deleteCalendarActivity(id);
	}
}
