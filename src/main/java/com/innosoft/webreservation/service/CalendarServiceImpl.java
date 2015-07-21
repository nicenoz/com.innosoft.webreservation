package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.CalendarDao;
import com.innosoft.webreservation.entity.MstCalendar;
import com.innosoft.webreservation.entity.MstMessage;

@Service
@Transactional
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
    private CalendarDao calendarDao;
	
	public List<MstCalendar> listCalendar(){
		return calendarDao.listCalendar();
	}
	
	public MstCalendar addCalendar(MstCalendar calendar){
		return calendarDao.addCalendar(calendar);
	}	

	public MstCalendar editCalendar(MstCalendar calendar){
		return calendarDao.editCalendar(calendar);
	}
	
	public boolean deleteCalendar(int id){
		return calendarDao.deleteCalendar(id);
	}
	
}
