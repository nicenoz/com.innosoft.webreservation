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

import com.innosoft.webreservation.entity.TrnSendLog;
/**
 * CRUD implementation for send log data object
 */
@Repository
@Transactional
public class SendLogDaoImpl implements SendLogDao {
	/**
	 * Session factory method
	 */
	@Autowired
	private SessionFactory sessionFactory;
	/**
	 * Get session factory method
	 * @return
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	/**
	 * Set session factory method
	 * @param sessionFactory
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}	
	/**
	 * List send log method
	 */
	@SuppressWarnings("unchecked")
	public List<TrnSendLog> listSendLog(){
		Session session = this.sessionFactory.getCurrentSession();
		List<TrnSendLog> list = session.createQuery("from TrnSendLog").list();	
		return list;		
	}
	/**
	 * Get max id method
	 * @return
	 */
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnSendLog.class).setProjection(Projections.max("SLOG_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}
	
	/**
	 * Add send log method
	 */
	public TrnSendLog addSendLog(TrnSendLog sendLog){
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			TrnSendLog newSendLog = new TrnSendLog();
			newSendLog.setSLOG_ID(getMaxId() + 1);
			newSendLog.setSLOG_TIME_STAMP(sendLog.SLOG_TIME_STAMP);
			newSendLog.setSLOG_MEBR_ID(sendLog.SLOG_MEBR_ID);
			newSendLog.setSLOG_EMAIL_ADDRESS(sendLog.SLOG_EMAIL_ADDRESS);
			newSendLog.setSLOG_PURPOSE_DIVISION(sendLog.SLOG_PURPOSE_DIVISION);
			  
			session.save(newSendLog);
			tx.commit();
			session.close();
			
			return newSendLog;			
		} catch(Exception e) {
			return sendLog;	
		}		
	}
	/**
	 * Edit send log method
	 */
	public TrnSendLog editSendLog(TrnSendLog sendLog){
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			TrnSendLog updateSendLog = (TrnSendLog)session.get(TrnSendLog.class, sendLog.SLOG_ID); 
			
			updateSendLog.setSLOG_TIME_STAMP(sendLog.SLOG_TIME_STAMP);
			updateSendLog.setSLOG_MEBR_ID(sendLog.SLOG_MEBR_ID);
			updateSendLog.setSLOG_EMAIL_ADDRESS(sendLog.SLOG_EMAIL_ADDRESS);
			updateSendLog.setSLOG_PURPOSE_DIVISION(sendLog.SLOG_PURPOSE_DIVISION);

			session.update(updateSendLog); 
			tx.commit();
			session.close();
			
			return updateSendLog;
		} catch (Exception e) 
		{
			return new TrnSendLog();
		}		
	}
	/**
	 * Delete send log method
	 */
	public boolean deleteSendLog(int id){
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	TrnSendLog deleteSendLog = (TrnSendLog)session.get(TrnSendLog.class, id); 
	    	
	    	session.delete(deleteSendLog); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }		
	}
}
