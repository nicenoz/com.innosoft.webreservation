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

import com.innosoft.webreservation.entity.MstCharge;
import com.innosoft.webreservation.entity.MstMessage;

@Repository
@Transactional
public class MessageDaoImpl implements MessageDao {

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<MstMessage> listMessage() {
		Session session = this.sessionFactory.getCurrentSession();
		List<MstMessage> list = session.createQuery("from MstMessage").list();	
		return list;
	}
	
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCharge.class).setProjection(Projections.max("MSG_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		return 	maxId;
	}
	
	public MstMessage addMessage(MstMessage message) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstMessage newMessage = new MstMessage();
			newMessage.setMESG_ID(getMaxId() + 1);
			newMessage.setMESG_CODE(message.MESG_CODE);
			newMessage.setMESG_LEVEL(message.MESG_LEVEL);
			newMessage.setMESG_START_DATE(message.MESG_START_DATE);
			newMessage.setMESG_END_DATE(message.MESG_END_DATE);
			newMessage.setMESG_NOTE(message.MESG_NOTE);
			
			newMessage.setCREATED_BY_USER_ID(message.CREATED_BY_USER_ID);
			newMessage.setCREATED_DATE(message.CREATED_DATE);
			newMessage.setUPDATED_BY_USER_ID(message.UPDATED_BY_USER_ID);
			newMessage.setUPDATED_DATE(message.UPDATED_DATE);
			newMessage.setISDELETED(message.ISDELETED);
			
			session.save(newMessage);
			tx.commit();
			session.close();
			
			return newMessage;			
		} catch(Exception e) {
			return message;	
		}
	}	
	
	public MstMessage editMessage(MstMessage message) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstMessage updateMessage = (MstMessage)session.get(MstMessage.class, message.MESG_ID); 
			
			updateMessage.setMESG_CODE(message.MESG_CODE);
			updateMessage.setMESG_LEVEL(message.MESG_LEVEL);
			updateMessage.setMESG_START_DATE(message.MESG_START_DATE);
			updateMessage.setMESG_END_DATE(message.MESG_END_DATE);
			
			updateMessage.setUPDATED_BY_USER_ID(message.UPDATED_BY_USER_ID);
			updateMessage.setUPDATED_DATE(message.UPDATED_DATE);
			
			session.update(updateMessage); 
			tx.commit();
			session.close();
			
			return updateMessage;
		} catch (Exception e) 
		{
			return new MstMessage();
		}		
	}
	
	public boolean deleteMessage(int id) {
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	MstMessage deleteMessage = (MstMessage)session.get(MstMessage.class, id); 
	    	
	    	session.delete(deleteMessage); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }	
	}
	
}
