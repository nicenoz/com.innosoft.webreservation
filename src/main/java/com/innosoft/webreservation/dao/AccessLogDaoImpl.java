package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.TrnAccessLog;

@Repository
@Transactional
public class AccessLogDaoImpl implements AccessLogDao {
	@Autowired
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}	
	@SuppressWarnings("unchecked")
	public List<TrnAccessLog> listAccessLog(){
		Session session = this.sessionFactory.getCurrentSession();
		List<TrnAccessLog> list = session.createQuery("from TrnAccessLog").list();	
		return list;		
	}
	
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnAccessLog.class).setProjection(Projections.max("ALOG_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}
	
	public TrnAccessLog addAccessLog(TrnAccessLog accessLog){
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			TrnAccessLog newAccessLog = new TrnAccessLog();
			newAccessLog.setALOG_ID(getMaxId() + 1);
			newAccessLog.setALOG_TIME_STAMP(accessLog.ALOG_TIME_STAMP);
			newAccessLog.setALOG_CUST_ID(accessLog.ALOG_CUST_ID);
			newAccessLog.setALOG_MEBR_ID(accessLog.ALOG_MEBR_ID);
			newAccessLog.setALOG_EMAIL_ADDRESS(accessLog.ALOG_EMAIL_ADDRESS);
			newAccessLog.setALOG_ACCESS_DATE(accessLog.ALOG_ACCESS_DATE);
			  
			session.save(newAccessLog);
			tx.commit();
			session.close();
			
			return newAccessLog;			
		} catch(Exception e) {
			return accessLog;	
		}		
	}
	public TrnAccessLog editAccessLog(TrnAccessLog accessLog){
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			TrnAccessLog updateAccessLog = (TrnAccessLog)session.get(TrnAccessLog.class, accessLog.ALOG_ID); 

			updateAccessLog.setALOG_TIME_STAMP(accessLog.ALOG_TIME_STAMP);
			updateAccessLog.setALOG_CUST_ID(accessLog.ALOG_CUST_ID);
			updateAccessLog.setALOG_MEBR_ID(accessLog.ALOG_MEBR_ID);
			updateAccessLog.setALOG_EMAIL_ADDRESS(accessLog.ALOG_EMAIL_ADDRESS);
			updateAccessLog.setALOG_ACCESS_DATE(accessLog.ALOG_ACCESS_DATE);

			session.update(updateAccessLog); 
			tx.commit();
			session.close();
			
			return updateAccessLog;
		} catch (Exception e) 
		{
			return new TrnAccessLog();
		}		
	}
	public boolean deleteAccessLog(int id){
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	TrnAccessLog deleteAccessLog = (TrnAccessLog)session.get(TrnAccessLog.class, id); 
	    	
	    	session.delete(deleteAccessLog); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }		
	}
}
