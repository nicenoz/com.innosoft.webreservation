package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	
	public MstMessage addMessage(MstMessage message) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstMessage newMessage = new MstMessage();

			newMessage.setMESG_CODE(message.MESG_CODE);
			newMessage.setMESG_LEVEL(message.MESG_LEVEL);
			newMessage.setMESG_START_DATE(message.MESG_START_DATE);
			newMessage.setMESG_END_DATE(message.MESG_END_DATE);
			
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
