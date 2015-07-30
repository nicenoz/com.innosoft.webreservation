package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
	
	public TrnReservation addReservation(TrnReservation reservation) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			TrnReservation newReservation = new TrnReservation();

			newReservation.setRESV_CUST_ID(reservation.RESV_CUST_ID);
			newReservation.setRESV_MEBR_ID(reservation.RESV_MEBR_ID);
			newReservation.setRESV_UNIT_NO(reservation.RESV_UNIT_NO);
			newReservation.setRESV_PARTS_NAME(reservation.RESV_PARTS_NAME);
			newReservation.setRESV_START_TIME_ID(reservation.RESV_START_TIME_ID);
			newReservation.setRESV_END_TIME_ID(reservation.RESV_END_TIME_ID);
			
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
			updateReservation.setRESV_PARTS_NAME(reservation.RESV_PARTS_NAME);
			updateReservation.setRESV_START_TIME_ID(reservation.RESV_START_TIME_ID);
			updateReservation.setRESV_END_TIME_ID(reservation.RESV_END_TIME_ID);
			
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
