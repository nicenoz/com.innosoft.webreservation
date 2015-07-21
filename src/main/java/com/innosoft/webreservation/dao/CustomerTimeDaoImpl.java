package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstCharge;
import com.innosoft.webreservation.entity.MstCustomerTime;

@Repository
@Transactional
public class CustomerTimeDaoImpl implements CustomerTimeDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<MstCustomerTime> listCustomerTime() {
		Session session = this.sessionFactory.getCurrentSession();
		List<MstCustomerTime> list = session.createQuery("from MstCustomerTime").list();	
		return list;
	}

	public MstCustomerTime addCustomerTime(MstCustomerTime time) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCustomerTime newCustomerTime = new MstCustomerTime();

			newCustomerTime.setCTIM_CUST_ID(time.CTIM_CUST_ID);
			newCustomerTime.setCTIM_DETAILS_NO(time.CTIM_DETAILS_NO);
			newCustomerTime.setCTIM_INTERVAL_OF_TIMES(time.CTIM_INTERVAL_OF_TIMES);
			newCustomerTime.setCTIM_MAX_PARTS_NO(time.CTIM_MAX_PARTS_NO);
			newCustomerTime.setCTIM_MAX_UNIT_NO(time.CTIM_MAX_UNIT_NO);
						
			session.save(newCustomerTime);
			tx.commit();
			session.close();
			
			return newCustomerTime;			
		} catch(Exception e) {
			return time;	
		}
	}

	public MstCustomerTime editCustomerTime(MstCustomerTime time) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCustomerTime updateCustomerTime = (MstCustomerTime)session.get(MstCustomerTime.class, time.CTIM_ID); 
			
			updateCustomerTime.setCTIM_CUST_ID(time.CTIM_CUST_ID);
			updateCustomerTime.setCTIM_DETAILS_NO(time.CTIM_DETAILS_NO);
			updateCustomerTime.setCTIM_INTERVAL_OF_TIMES(time.CTIM_INTERVAL_OF_TIMES);
			updateCustomerTime.setCTIM_MAX_PARTS_NO(time.CTIM_MAX_PARTS_NO);
			updateCustomerTime.setCTIM_MAX_UNIT_NO(time.CTIM_MAX_UNIT_NO);
			
			session.update(updateCustomerTime); 
			tx.commit();
			session.close();
			
			return updateCustomerTime;
		} catch (Exception e) 
		{
			return new MstCustomerTime();
		}	
	}

	public boolean deleteCustomerTime(int id) {
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	MstCustomerTime deleteCustomerTime = (MstCustomerTime)session.get(MstCustomerTime.class, id); 
	    	
	    	session.delete(deleteCustomerTime); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }	
	}
}
