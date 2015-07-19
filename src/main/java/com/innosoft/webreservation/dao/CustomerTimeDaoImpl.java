package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
}
