package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstCharge;

@Repository
@Transactional
public class ChargeDaoImpl implements ChargeDao {

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<MstCharge> listCharge() {
		Session session = this.sessionFactory.getCurrentSession();
		List<MstCharge> list = session.createQuery("from MstCharge").list();	
		return list;
	}
}
