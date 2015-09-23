package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.innosoft.webreservation.dao.CalendarDao;
import com.innosoft.webreservation.entity.MstCalendar;

/**
 * CRUD service implementation for calendar
 */
@Service
@Transactional
public class CalendarServiceImpl implements CalendarService {
	/**
	 * Calendar  method
	 */
	@Autowired
    private CalendarDao calendarDao;
	/**
	 * List calendar  method
	 */
	public List<MstCalendar> listCalendar(){
		return calendarDao.listCalendar();
	}
	/**
	 * Add calendar method
	 */
	public MstCalendar addCalendar(MstCalendar calendar){
		return calendarDao.addCalendar(calendar);
	}	
	/**
	 * Edit calendar method
	 */
	public MstCalendar editCalendar(MstCalendar calendar){
		return calendarDao.editCalendar(calendar);
	}
	/**
	 * Delete calendar method
	 */
	public boolean deleteCalendar(int id){
		return calendarDao.deleteCalendar(id);
	}
	
}
