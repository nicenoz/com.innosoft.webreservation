package com.innosoft.webreservation.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.TrnReservation;


@Repository
@Transactional
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<TrnReservation> listReservation() {
		Session session = this.sessionFactory.getCurrentSession();
		List<TrnReservation> list = session.createQuery("from TrnReservation").list();	
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<TrnReservation> listByCustomer(int customerId) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnReservation.class);
		criteria.add(Restrictions.eq("RESV_CUST_ID", customerId));
		List<TrnReservation> list = criteria.list();	
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<TrnReservation> scheduleReservation(int customerId, int calendarActivityId) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnReservation.class);
		criteria.add(Restrictions.eq("RESV_CUST_ID", customerId));
		criteria.add(Restrictions.eq("RESV_CACT_ID", calendarActivityId));
		List<TrnReservation> list = criteria.list();	
		return list;		
	}

	@SuppressWarnings("unchecked")
	public List<TrnReservation> reportReservation(String from, String to) {
		DateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss", Locale.ENGLISH);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnReservation.class);

		try {
			criteria.add(Restrictions.between("CREATED_DATE", format.parse(from + " 00:00:00"), 
					format.parse(to + " 23:59:59")));
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		List<TrnReservation> list = criteria.list();	
		return list;
	}
	
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnReservation.class).setProjection(Projections.max("RESV_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}
	
	public TrnReservation addReservation(TrnReservation reservation) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			TrnReservation newReservation = new TrnReservation();
			newReservation.setRESV_ID(getMaxId() + 1);
			newReservation.setRESV_CUST_ID(reservation.RESV_CUST_ID);
			newReservation.setRESV_MEBR_ID(reservation.RESV_MEBR_ID);
			newReservation.setRESV_UNIT_NO(reservation.RESV_UNIT_NO);
			newReservation.setRESV_PARTS_NO(reservation.RESV_PARTS_NO);
			newReservation.setRESV_START_TIME_ID(reservation.RESV_START_TIME_ID);
			newReservation.setRESV_END_TIME_ID(reservation.RESV_END_TIME_ID);
			newReservation.setRESV_CACT_ID(reservation.RESV_CACT_ID);
			newReservation.setRESV_NOTE(reservation.RESV_NOTE);
			
			newReservation.setCREATED_BY_USER_ID(reservation.CREATED_BY_USER_ID);
			newReservation.setCREATED_DATE(reservation.CREATED_DATE);
			newReservation.setUPDATED_BY_USER_ID(reservation.UPDATED_BY_USER_ID);
			newReservation.setUPDATED_DATE(reservation.UPDATED_DATE);
			newReservation.setISDELETED(reservation.ISDELETED);
			
			session.save(newReservation);
			tx.commit();
			session.close();
			
			return newReservation;			
		} catch(Exception e) {
			return reservation;	
		}
	}	
	
	public TrnReservation editReservation(TrnReservation reservation) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			TrnReservation updateReservation = (TrnReservation)session.get(TrnReservation.class, reservation.RESV_ID); 
			
			updateReservation.setRESV_CUST_ID(reservation.RESV_CUST_ID);
			updateReservation.setRESV_MEBR_ID(reservation.RESV_MEBR_ID);
			updateReservation.setRESV_UNIT_NO(reservation.RESV_UNIT_NO);
			updateReservation.setRESV_PARTS_NO(reservation.RESV_PARTS_NO);
			updateReservation.setRESV_START_TIME_ID(reservation.RESV_START_TIME_ID);
			updateReservation.setRESV_END_TIME_ID(reservation.RESV_END_TIME_ID);
			updateReservation.setRESV_NOTE(reservation.RESV_NOTE);
			
			updateReservation.setUPDATED_BY_USER_ID(reservation.UPDATED_BY_USER_ID);
			updateReservation.setUPDATED_DATE(reservation.UPDATED_DATE);
			
			session.update(updateReservation); 
			tx.commit();
			session.close();
			
			return updateReservation;
		} catch (Exception e) 
		{
			return new TrnReservation();
		}		
	}
	
	public boolean deleteReservation(int id) {
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	TrnReservation deleteReservation = (TrnReservation)session.get(TrnReservation.class, id); 
	    	
	    	session.delete(deleteReservation); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }	
	}
	
}
