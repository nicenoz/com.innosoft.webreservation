package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
}
