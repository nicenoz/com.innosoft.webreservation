package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstCalendar;
import com.innosoft.webreservation.entity.MstMessage;

@Repository
@Transactional
public class CalendarDaoImpl implements CalendarDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<MstCalendar> listCalendar() {
		Session session = this.sessionFactory.getCurrentSession();
		List<MstCalendar> list = session.createQuery("from MstCalendar").list();	
		return list;
	}
	
	public MstCalendar addCalendar(MstCalendar calendar) {
		try {
			
			System.out.println("i");
			
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;
			
			System.out.println("2");
			
			tx = session.beginTransaction();
			MstCalendar newCalendar = new MstCalendar();

			newCalendar.setCLDR_DATE(calendar.CLDR_DATE);
			newCalendar.setCLDR_DAYCODE(calendar.CLDR_DAYCODE);
			newCalendar.setCLDR_NOTE(calendar.CLDR_NOTE);
			
			System.out.println("3");
			
			session.save(newCalendar);
			tx.commit();
			session.close();
			
			System.out.println("4");
			
			return newCalendar;			
			
		} catch(HibernateException e) {
			
			System.out.print(e);
			
			return calendar;	
		}
	}	
}
