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

import com.innosoft.webreservation.entity.MstCustomerMember;
/**
 * CRUD implementation for customer member (user) data object.
 */
@Repository
@Transactional
public class CustomerMemberDaoImpl implements CustomerMemberDao {
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
	 * Get member by user id method
	 */
	@SuppressWarnings("unchecked")
	public List<MstCustomerMember> getMemberByUserId(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(MstCustomerMember.class);
		criteria.add(Restrictions.eq("MEBR_USER_ID", id));
		
		List<MstCustomerMember> list = criteria.list();	
		
		return list;
	}
	/**Get member by email method
	 * 
	 */
	@SuppressWarnings("unchecked")
	public List<MstCustomerMember> getMemberByEmail(String email) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(MstCustomerMember.class);
		criteria.add(Restrictions.eq("MEBR_EMAIL_ADDRESS", email));
		
		List<MstCustomerMember> list = criteria.list();	
		
		return list;
	}
	/**
	 * Free User method
	 */
	@SuppressWarnings("unchecked")
	public boolean isAlreadyFreeUser(int freeCustomerId, String email){
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(MstCustomerMember.class);
		criteria.add(Restrictions.eq("MEBR_CUST_ID", freeCustomerId));
		criteria.add(Restrictions.eq("MEBR_EMAIL_ADDRESS", email));
	
		List<MstCustomerMember> list = criteria.list();	
		
		return list.size() > 0;
	}
	
	/**
	 * List customer member method
	 */
	@SuppressWarnings("unchecked")
	public List<MstCustomerMember> listCustomerMember(){
		Session session = this.sessionFactory.getCurrentSession();
		List<MstCustomerMember> list = session.createQuery("from MstCustomerMember").list();	
		return list;		
	}
	/**
	 * report customer member method
	 */
	@SuppressWarnings("unchecked")
	public List<MstCustomerMember> reportCustomerMember(int customerId) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCustomerMember.class);
		criteria.add(Restrictions.eq("MEBR_CUST_ID", customerId));
		List<MstCustomerMember> list = criteria.list();	
		return list;
	}
	/**
	 * Get current session method
	 * @return
	 */
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCustomerMember.class).setProjection(Projections.max("MEBR_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}
	/**
	 * Get current session method
	 * @return
	 */
	public String getNewMemberNo()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCustomerMember.class).setProjection(Projections.max("MEBR_CUSTOMER_MEMBER_NO_INT"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return String.format("%06d", Integer.parseInt("" + (maxId + 1)));
	}
	/**
	 * Add customer member method
	 */
	public MstCustomerMember addCustomerMember(MstCustomerMember member){
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCustomerMember newCustomerMember = new MstCustomerMember();
			
			newCustomerMember.setMEBR_ID(getMaxId() + 1);
			newCustomerMember.setMEBR_CUST_ID(member.MEBR_CUST_ID); 
			newCustomerMember.setMEBR_CUSTOMER_MEMBER_NO(getNewMemberNo()); 
			newCustomerMember.setMEBR_USER_ID(member.MEBR_USER_ID); 
			newCustomerMember.setMEBR_TEL_NO(member.MEBR_TEL_NO);  
			newCustomerMember.setMEBR_EMAIL_ADDRESS(member.MEBR_EMAIL_ADDRESS); 
			newCustomerMember.setMEBR_FIRST_NAME(member.MEBR_FIRST_NAME); 
			newCustomerMember.setMEBR_LAST_NAME(member.MEBR_LAST_NAME); 
			newCustomerMember.setMEBR_DATE_OF_BIRTH(member.MEBR_DATE_OF_BIRTH); 
			newCustomerMember.setMEBR_ZIP_CODE(member.MEBR_ZIP_CODE); 
			newCustomerMember.setMEBR_ADDRESS1(member.MEBR_ADDRESS1); 
			newCustomerMember.setMEBR_ADDRESS2(member.MEBR_ADDRESS2); 
			newCustomerMember.setMEBR_ADDRESS3(member.MEBR_ADDRESS3); 
			newCustomerMember.setMEBR_POINT(member.MEBR_POINT); 
			newCustomerMember.setMEBR_FIELD1(member.MEBR_FIELD1); 
			newCustomerMember.setMEBR_FIELD2(member.MEBR_FIELD2); 
			newCustomerMember.setMEBR_FIELD3(member.MEBR_FIELD3); 
			newCustomerMember.setMEBR_FIELD4(member.MEBR_FIELD4); 
			newCustomerMember.setMEBR_FIELD5(member.MEBR_FIELD5); 
			
			newCustomerMember.setCREATED_DATE(member.CREATED_DATE); 
			newCustomerMember.setCREATED_BY_USER_ID(member.CREATED_BY_USER_ID); 
			newCustomerMember.setUPDATED_DATE(member.UPDATED_DATE); 
			newCustomerMember.setUPDATED_BY_USER_ID(member.UPDATED_BY_USER_ID); 
			newCustomerMember.setISDELETED(0); 
			  
			session.save(newCustomerMember);
			tx.commit();
			session.close();
			
			return newCustomerMember;			
		} catch(Exception e) {
			return member;	
		}		
	}
	/**
	 * Edit customer member method
	 */
	public MstCustomerMember editCustomerMember(MstCustomerMember member){
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCustomerMember updateCustomerMember = (MstCustomerMember)session.get(MstCustomerMember.class, member.MEBR_ID); 
			
			updateCustomerMember.setMEBR_CUST_ID(member.MEBR_CUST_ID); 
			updateCustomerMember.setMEBR_CUSTOMER_MEMBER_NO(member.MEBR_CUSTOMER_MEMBER_NO); 
			updateCustomerMember.setMEBR_USER_ID(member.MEBR_USER_ID); 
			updateCustomerMember.setMEBR_TEL_NO(member.MEBR_TEL_NO);  
			updateCustomerMember.setMEBR_EMAIL_ADDRESS(member.MEBR_EMAIL_ADDRESS); 
			updateCustomerMember.setMEBR_FIRST_NAME(member.MEBR_FIRST_NAME); 
			updateCustomerMember.setMEBR_LAST_NAME(member.MEBR_LAST_NAME); 
			updateCustomerMember.setMEBR_DATE_OF_BIRTH(member.MEBR_DATE_OF_BIRTH); 
			updateCustomerMember.setMEBR_ZIP_CODE(member.MEBR_ZIP_CODE); 
			updateCustomerMember.setMEBR_ADDRESS1(member.MEBR_ADDRESS1); 
			updateCustomerMember.setMEBR_ADDRESS2(member.MEBR_ADDRESS2); 
			updateCustomerMember.setMEBR_ADDRESS3(member.MEBR_ADDRESS3); 
			updateCustomerMember.setMEBR_POINT(member.MEBR_POINT); 
			updateCustomerMember.setMEBR_FIELD1(member.MEBR_FIELD1); 
			updateCustomerMember.setMEBR_FIELD2(member.MEBR_FIELD2); 
			updateCustomerMember.setMEBR_FIELD3(member.MEBR_FIELD3); 
			updateCustomerMember.setMEBR_FIELD4(member.MEBR_FIELD4); 
			updateCustomerMember.setMEBR_FIELD5(member.MEBR_FIELD5); 
			 
			updateCustomerMember.setUPDATED_DATE(member.UPDATED_DATE); 
			updateCustomerMember.setUPDATED_BY_USER_ID(member.UPDATED_BY_USER_ID); 
			updateCustomerMember.setISDELETED(0); 
			
			session.update(updateCustomerMember); 
			tx.commit();
			session.close();
			
			return updateCustomerMember;
		} catch (Exception e) 
		{
			return new MstCustomerMember();
		}		
	}
	/**
	 * De
	 */
	public boolean deleteCustomerMember(int id){
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	MstCustomerMember deleteCustomerMember = (MstCustomerMember)session.get(MstCustomerMember.class, id); 
	    	
	    	session.delete(deleteCustomerMember); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }		
	}
	
}
