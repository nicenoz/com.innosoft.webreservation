package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstCustomerMember;

@Repository
@Transactional
public class CustomerMemberDaoImpl implements CustomerMemberDao {
	@Autowired
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}	
	@SuppressWarnings("unchecked")
	public List<MstCustomerMember> listCustomerMember(){
		Session session = this.sessionFactory.getCurrentSession();
		List<MstCustomerMember> list = session.createQuery("from MstCustomerMember").list();	
		return list;		
	}
	
	@SuppressWarnings("unchecked")
	public List<MstCustomerMember> reportCustomerMember(String from, String to) {
		DateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss", Locale.ENGLISH);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCustomerMember.class);

		try {
			criteria.add(Restrictions.between("CREATED_DATE", format.parse(from + " 00:00:00"), 
					format.parse(to + " 23:59:59")));
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		List<MstCustomerMember> list = criteria.list();	
//		Session session = this.sessionFactory.getCurrentSession();
//		List<MstCustomerMember> list = session.createQuery("from MstCustomerMember where CREATED_DATE between '"+from +" 00:00:00' and '" + to + " 23:59:59'").list();
		return list;
	}
	
	public MstCustomerMember addCustomerMember(MstCustomerMember member){
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCustomerMember newCustomerMember = new MstCustomerMember();
		 
			newCustomerMember.setMEBR_CUST_ID(member.MEBR_CUST_ID); 
			newCustomerMember.setMEBR_CUSTOMER_MEMBER_NO(member.MEBR_CUSTOMER_MEMBER_NO); 
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
