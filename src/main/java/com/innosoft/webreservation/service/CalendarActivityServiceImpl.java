package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.CalendarActivityDao;
import com.innosoft.webreservation.entity.MstCalendarActivity;

@Service
@Transactional
public class CalendarActivityServiceImpl implements CalendarActivityService{
	@Autowired
    private CalendarActivityDao calendarActivityDao;
	
	public List<MstCalendarActivity> listCalendarActivity(){
		return calendarActivityDao.listCalendarActivity();
	}
	public List<MstCalendarActivity> listCalendarActivityByCustomer(int customerId){
		return calendarActivityDao.listCalendarActivityByCustomer(customerId);
	}	
	
	public List<MstCalendarActivity> listCalendarActivityByCalendarDate(MstCalendarActivity calendarAct){
		return calendarActivityDao.listCalendarActivityByCalendarDate(calendarAct);
	}
	
	public MstCalendarActivity addCalendarActivity(MstCalendarActivity calendarActivity){
		return calendarActivityDao.addCalendarActivity(calendarActivity);
	}
	public MstCalendarActivity editCalendarActivity(MstCalendarActivity calendarActivity){
		return calendarActivityDao.editCalendarActivity(calendarActivity);
	}
	public boolean deleteCalendarActivity(int id){
		return calendarActivityDao.deleteCalendarActivity(id);
	}
}
