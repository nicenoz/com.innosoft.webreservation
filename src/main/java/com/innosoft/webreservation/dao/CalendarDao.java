package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCalendar;
import com.innosoft.webreservation.entity.MstMessage;

public interface CalendarDao {
	public List<MstCalendar> listCalendar();
	public MstCalendar addCalendar(MstCalendar calendar);
	public MstCalendar editCalendar(MstCalendar calendar);
	public boolean deleteCalendar(int id);
}
