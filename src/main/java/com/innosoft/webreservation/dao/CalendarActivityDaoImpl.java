package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstCalendarActivity;

@Repository
@Transactional
public class CalendarActivityDaoImpl implements CalendarActivityDao{
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}	
	@SuppressWarnings("unchecked")
	public List<MstCalendarActivity> listCalendarActivity() {
		Session session = this.sessionFactory.getCurrentSession();
		List<MstCalendarActivity> list = session.createQuery("from MstCalendarActivity").list();	
		return list;		
	}
	public MstCalendarActivity addCalendarActivity(MstCalendarActivity calendarActivity){
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;

			tx = session.beginTransaction();
			MstCalendarActivity newCalendarActivity = new MstCalendarActivity();

			newCalendarActivity.setCACT_CLDR_ID(calendarActivity.CACT_CLDR_ID);
			newCalendarActivity.setCACT_CUST_ID(calendarActivity.CACT_CUST_ID);  
			newCalendarActivity.setCACT_DATE(calendarActivity.CACT_DATE);  
			newCalendarActivity.setCACT_DETAILS_NO(calendarActivity.CACT_DETAILS_NO);  
			newCalendarActivity.setCACT_ACTIVITY_CLASSIFICATION(calendarActivity.CACT_ACTIVITY_CLASSIFICATION); 
			newCalendarActivity.setCACT_ACTIVITY_CONTENTS(calendarActivity.CACT_ACTIVITY_CONTENTS);
			newCalendarActivity.setCACT_START_TIME_ID(calendarActivity.CACT_START_TIME_ID);
			newCalendarActivity.setCACT_END_TIME_ID(calendarActivity.CACT_END_TIME_ID);
			newCalendarActivity.setCACT_OPERATION_FLAG(calendarActivity.CACT_OPERATION_FLAG);
			
			newCalendarActivity.setCREATED_DATE(calendarActivity.CREATED_DATE);
			newCalendarActivity.setCREATED_BY_USER_ID(calendarActivity.CREATED_BY_USER_ID);
			newCalendarActivity.setUPDATED_DATE(calendarActivity.UPDATED_DATE);
			newCalendarActivity.setUPDATED_BY_USER_ID(calendarActivity.UPDATED_BY_USER_ID); 
			newCalendarActivity.setISDELETED(0);
			
			session.save(newCalendarActivity);
			tx.commit();
			session.close();
			
			return newCalendarActivity;			
			
		} catch(HibernateException e) {
			
			return calendarActivity;	
		}		
	}
	public MstCalendarActivity editCalendarActivity(MstCalendarActivity calendarActivity){
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCalendarActivity updateCalendarActivity = (MstCalendarActivity)session.get(MstCalendarActivity.class, calendarActivity.CACT_ID); 
			
			updateCalendarActivity.setCACT_CLDR_ID(calendarActivity.CACT_CLDR_ID);
			updateCalendarActivity.setCACT_CUST_ID(calendarActivity.CACT_CUST_ID);  
			updateCalendarActivity.setCACT_DATE(calendarActivity.CACT_DATE);  
			updateCalendarActivity.setCACT_DETAILS_NO(calendarActivity.CACT_DETAILS_NO);  
			updateCalendarActivity.setCACT_ACTIVITY_CLASSIFICATION(calendarActivity.CACT_ACTIVITY_CLASSIFICATION); 
			updateCalendarActivity.setCACT_ACTIVITY_CONTENTS(calendarActivity.CACT_ACTIVITY_CONTENTS);
			updateCalendarActivity.setCACT_START_TIME_ID(calendarActivity.CACT_START_TIME_ID);
			updateCalendarActivity.setCACT_END_TIME_ID(calendarActivity.CACT_END_TIME_ID);
			updateCalendarActivity.setCACT_OPERATION_FLAG(calendarActivity.CACT_OPERATION_FLAG);
			
			updateCalendarActivity.setUPDATED_DATE(calendarActivity.UPDATED_DATE);
			updateCalendarActivity.setUPDATED_BY_USER_ID(calendarActivity.UPDATED_BY_USER_ID); 
			updateCalendarActivity.setISDELETED(0);
			
			session.update(updateCalendarActivity); 
			tx.commit();
			session.close();
			
			return updateCalendarActivity;
		} catch (Exception e) 
		{
			return new MstCalendarActivity();
		}		
	}
	public boolean deleteCalendarActivity(int id){
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	MstCalendarActivity deleteCalendarActivity = (MstCalendarActivity)session.get(MstCalendarActivity.class, id); 
	    	
	    	session.delete(deleteCalendarActivity); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }			
	}
}
