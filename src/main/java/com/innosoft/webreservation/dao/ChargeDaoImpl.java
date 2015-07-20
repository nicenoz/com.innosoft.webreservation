package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstCharge;
import com.innosoft.webreservation.entity.MstMessage;

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
	
	public MstCharge addCharge(MstCharge charge) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCharge newCharge = new MstCharge();

			newCharge.setCHRG_CHARGE_NO(charge.CHRG_CHARGE_NO);
			newCharge.setCHRG_CUST_ID(charge.CHRG_CUST_ID);
			newCharge.setCHRG_PRICE(charge.CHRG_PRICE);
			newCharge.setCHRG_APP_DIVISION(charge.CHRG_APP_DIVISION);
			newCharge.setCHRG_APP_START_DATE(charge.CHRG_APP_START_DATE);
			newCharge.setCHRG_APP_END_DATE(charge.CHRG_APP_END_DATE);
			
			session.save(newCharge);
			tx.commit();
			session.close();
			
			return newCharge;			
		} catch(Exception e) {
			return charge;	
		}
	}	
}
