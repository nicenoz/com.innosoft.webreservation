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

import com.innosoft.webreservation.entity.TrnChargeCount;

@Repository
@Transactional
public class ChargeCountDaoImpl implements ChargeCountDao {

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<TrnChargeCount> listChargeCount() {
		Session session = this.sessionFactory.getCurrentSession();
		List<TrnChargeCount> list = session.createQuery("from TrnChargeCount").list();	
		return list;
	}
	
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

	public TrnChargeCount editChargeCount(TrnChargeCount chargeCount) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			TrnChargeCount updateChargeCount = (TrnChargeCount)session.get(TrnChargeCount.class, chargeCount.CUNT_ID); 
			
			updateChargeCount.setCUNT_TIME_STAMP(chargeCount.CUNT_TIME_STAMP);
			updateChargeCount.setCUNT_CUST_ID(chargeCount.CUNT_CUST_ID);
			updateChargeCount.setCUNT_MEBR_ID(chargeCount.CUNT_MEBR_ID);
			updateChargeCount.setCUNT_EMAIL_ADDRESS(chargeCount.CUNT_EMAIL_ADDRESS);
			
			
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
