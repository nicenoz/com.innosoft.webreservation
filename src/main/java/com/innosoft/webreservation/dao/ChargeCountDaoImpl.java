package com.innosoft.webreservation.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.TrnChargeCount;
/**
 * CRUD implementation for charge count data object.
 */
@Repository
@Transactional
public class ChargeCountDaoImpl implements ChargeCountDao {
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
	 * List charge count method
	 */
	@SuppressWarnings("unchecked")
	public List<TrnChargeCount> listChargeCount() {
		Session session = this.sessionFactory.getCurrentSession();
		List<TrnChargeCount> list = session.createQuery("from TrnChargeCount").list();	
		return list;
	}
	/**
	 * Get reservation by id  method
	 */
	public TrnChargeCount getReservationById(int resvId){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(TrnChargeCount.class);
		criteria.add(Restrictions.eq("CUNT_RESV_ID", resvId));
		
		return (TrnChargeCount) criteria.list().get(0);
	}
	/**
	 * get report method
	 */
	@SuppressWarnings("unchecked")
	public List<TrnChargeCount> getReport(String from, String to) {
		
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss a", Locale.ENGLISH);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnChargeCount.class);

		try {
			criteria.add(Restrictions.between("CUNT_TIME_STAMP", format.parse(from + " 12:00:00 am"), 
					format.parse(to + " 11:59:59 pm")));
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		List<TrnChargeCount> list = criteria.list();	
		
		return list;
	}
	/**
	 * get current session method
	 * @return
	 */
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnChargeCount.class).setProjection(Projections.max("CUNT_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}
	/**
	 * add  charge count method
	 */
	public TrnChargeCount addChargeCount(TrnChargeCount chargeCount) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			TrnChargeCount newChargeCount = new TrnChargeCount();
			newChargeCount.setCUNT_ID(getMaxId() + 1);
			newChargeCount.setCUNT_TIME_STAMP(chargeCount.CUNT_TIME_STAMP);
			newChargeCount.setCUNT_CUST_ID(chargeCount.CUNT_CUST_ID);
			newChargeCount.setCUNT_MEBR_ID(chargeCount.CUNT_MEBR_ID);
			newChargeCount.setCUNT_EMAIL_ADDRESS(chargeCount.CUNT_EMAIL_ADDRESS);
			newChargeCount.setCUNT_RESV_ID(chargeCount.CUNT_RESV_ID);
			
			newChargeCount.setCREATED_BY_USER_ID(chargeCount.CREATED_BY_USER_ID);
			newChargeCount.setCREATED_DATE(chargeCount.CREATED_DATE);
			newChargeCount.setUPDATED_BY_USER_ID(chargeCount.UPDATED_BY_USER_ID);
			newChargeCount.setUPDATED_DATE(chargeCount.UPDATED_DATE);
			newChargeCount.setISDELETED(chargeCount.ISDELETED);
			
			session.save(newChargeCount);
			tx.commit();
			session.close();
			
			return newChargeCount;			
		} catch(Exception e) {
			return chargeCount;	
		}
	}
	/**
	 *Edit charge count method
	 */
	public TrnChargeCount editChargeCount(TrnChargeCount chargeCount) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			TrnChargeCount updateChargeCount = (TrnChargeCount)session.get(TrnChargeCount.class, chargeCount.CUNT_ID); 
			
			if(chargeCount.ISDELETED != 1){
				updateChargeCount.setCUNT_TIME_STAMP(chargeCount.CUNT_TIME_STAMP);
				updateChargeCount.setCUNT_CUST_ID(chargeCount.CUNT_CUST_ID);
				updateChargeCount.setCUNT_MEBR_ID(chargeCount.CUNT_MEBR_ID);
				updateChargeCount.setCUNT_EMAIL_ADDRESS(chargeCount.CUNT_EMAIL_ADDRESS);
			}else{
				updateChargeCount.setISDELETED(chargeCount.ISDELETED);
				updateChargeCount.setISDELETED_BY_USER_ID(chargeCount.ISDELETED_BY_USER_ID);
				updateChargeCount.setISDELETED_DATE(chargeCount.ISDELETED_DATE);
			}
			
			updateChargeCount.setUPDATED_BY_USER_ID(chargeCount.UPDATED_BY_USER_ID);
			updateChargeCount.setUPDATED_DATE(chargeCount.UPDATED_DATE);
			
			session.update(updateChargeCount); 
			tx.commit();
			session.close();
			
			return updateChargeCount;
		} catch (Exception e) 
		{
			return new TrnChargeCount();
		}	
	}
	/**
	 * Delete  charge count method
	 */
	public boolean deleteChargeCount(int id) {
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	TrnChargeCount deleteChargeCount = (TrnChargeCount)session.get(TrnChargeCount.class, id); 
	    	
	    	session.delete(deleteChargeCount); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }	
	}	
}
