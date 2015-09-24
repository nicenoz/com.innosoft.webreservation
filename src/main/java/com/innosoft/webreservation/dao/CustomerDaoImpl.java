package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstCustomer;
import com.innosoft.webreservation.entity.TrnReservation;
/**
 * CRUD implementation for customer data object
 */
@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {
	/**
	 * Session Factory Method
	 */
	@Autowired
	private SessionFactory sessionFactory;
	/**get session factory method
	 * 
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
	 * List customer method
	 */
	@SuppressWarnings("unchecked")
	public List<MstCustomer> listCustomer() {
		Session session = this.sessionFactory.openSession();
		
		Criteria criteria = session.createCriteria(MstCustomer.class);
		criteria.add(Restrictions.ne("CUST_CUSTOMER_NO", "000000"));
		
		List<MstCustomer> list = criteria.list();	

		session.close();
		
		return list;
	}
	/**
	 * List customer with number method
	 */
	@SuppressWarnings("unchecked")
	public List<MstCustomer> listCustomerWithNo(String custNo){
		Session session = this.sessionFactory.openSession();

		List<MstCustomer> list = session.createQuery("from MstCustomer where CUST_CUSTOMER_NO = \'" + custNo + "\'").list();	
		
		session.close();
		
		return list;
	}
	/**
	 * Get max id method
	 * @return
	 */
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCustomer.class).setProjection(Projections.max("CUST_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}
	/**
	 * Get maximum customer number method
	 * @return
	 */
	public String getMaxCustNum()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCustomer.class).setProjection(Projections.max("CUST_CUSTOMER_NO"));
	    String maxNo = (String)criteria.uniqueResult();
		if(maxNo == null){
			maxNo = "0";
		}
		return 	maxNo;
	}
	/**
	 * Add customer method
	 */
	public MstCustomer addCustomer(MstCustomer customer) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			StringBuilder sb = new StringBuilder();
			int cnvrtdVl = Integer.parseInt(getMaxCustNum()) + 1;
			sb.append("");
			sb.append(cnvrtdVl);
			tx = session.beginTransaction();
			MstCustomer newCustomer = new MstCustomer();
			newCustomer.setCUST_ID(getMaxId() + 1);
			newCustomer.setCUST_CUSTOMER_NO(sb.toString());	
			newCustomer.setCUST_NAME(customer.CUST_NAME);	
			newCustomer.setCUST_PHONENO(customer.CUST_PHONENO);	
			newCustomer.setCUST_EMAIL(customer.CUST_EMAIL);	
			newCustomer.setCUST_ZIPCODE(customer.CUST_ZIPCODE);	
			newCustomer.setCUST_ADDRESS1(customer.CUST_ADDRESS1);	
			newCustomer.setCUST_ADDRESS2(customer.CUST_ADDRESS2);	
			newCustomer.setCUST_ADDRESS3(customer.CUST_ADDRESS3);	
			newCustomer.setCUST_ISDELETED(0);	
			
			newCustomer.setCREATED_BY_USER_ID(customer.CREATED_BY_USER_ID);
			newCustomer.setCREATED_DATE(customer.CREATED_DATE);
			newCustomer.setUPDATED_BY_USER_ID(customer.UPDATED_BY_USER_ID);
			newCustomer.setUPDATED_DATE(customer.UPDATED_DATE);
			newCustomer.setISDELETED(customer.ISDELETED);

			session.save(newCustomer);
			tx.commit();
			session.close();
			return newCustomer;			
		} catch(Exception e) {
			return customer;	
		}
	}	
	/**
	 *Edit customer method
	 */
	public MstCustomer editCustomer(MstCustomer customer) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCustomer updateCustomer = (MstCustomer)session.get(MstCustomer.class, customer.CUST_ID); 
			
			updateCustomer.setCUST_CUSTOMER_NO(customer.CUST_CUSTOMER_NO);	
			updateCustomer.setCUST_NAME(customer.CUST_NAME);	
			updateCustomer.setCUST_PHONENO(customer.CUST_PHONENO);	
			updateCustomer.setCUST_EMAIL(customer.CUST_EMAIL);	
			updateCustomer.setCUST_ZIPCODE(customer.CUST_ZIPCODE);	
			updateCustomer.setCUST_ADDRESS1(customer.CUST_ADDRESS1);	
			updateCustomer.setCUST_ADDRESS2(customer.CUST_ADDRESS2);	
			updateCustomer.setCUST_ADDRESS3(customer.CUST_ADDRESS3);	
			updateCustomer.setCUST_ISDELETED(0);	
			
			updateCustomer.setUPDATED_BY_USER_ID(customer.UPDATED_BY_USER_ID);
			updateCustomer.setUPDATED_DATE(customer.UPDATED_DATE);
			updateCustomer.setISDELETED(customer.ISDELETED);

			session.update(updateCustomer); 
			tx.commit();
			session.close();
			
			return updateCustomer;
		} catch (Exception e) 
		{
			return new MstCustomer();
		}		
	}
	/**
	 * Delete Customer method
	 */
	public boolean deleteCustomer(int id) {
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	MstCustomer deleteCustomer = (MstCustomer)session.get(MstCustomer.class, id); 
	    	
	    	session.delete(deleteCustomer); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }	
	}	
}
