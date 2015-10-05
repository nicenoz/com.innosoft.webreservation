package com.innosoft.webreservation.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstCalendarActivity;
import com.innosoft.webreservation.entity.TrnReservation;
/**
 * CRUD implementation for reservation data object.
 */
@Repository
@Transactional
public class ReservationDaoImpl implements ReservationDao {
	/**
	 * Session factory method
	 */
	@Autowired
	private SessionFactory sessionFactory;
	/**
	 * Get session factory method
	 * @return
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	/**
	 * Set session factory method
	 * @param sessionFactory
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/**
	 * List reservation method
	 */
	@SuppressWarnings("unchecked")
	public List<TrnReservation> listReservation() {
		Session session = this.sessionFactory.getCurrentSession();
		List<TrnReservation> list = session.createQuery("from TrnReservation")
				.list();
		return list;
	}
	/**
	 * List by customer method
	 */
	@SuppressWarnings("unchecked")
	public List<TrnReservation> listByCustomer(int customerId) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnReservation.class);
		criteria.add(Restrictions.eq("RESV_CUST_ID", customerId));
		criteria.addOrder(Order.asc("RESV_ID"));
		List<TrnReservation> list = criteria.list();
		return list;
	}
	/**
	 * Scheduled reservation method
	 */
	@SuppressWarnings("unchecked")
	public List<TrnReservation> scheduleReservation(int customerId,
			int calendarActivityId) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnReservation.class);
		criteria.add(Restrictions.eq("RESV_CUST_ID", customerId));
		criteria.add(Restrictions.eq("RESV_CACT_ID", calendarActivityId));
		List<TrnReservation> list = criteria.list();
		return list;
	}
	/**
	 * Report reservation method
	 */
	@SuppressWarnings("unchecked")
	public List<TrnReservation> reportReservation(String from, String to) {
		DateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss",
				Locale.ENGLISH);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnReservation.class);

		try {
			criteria.add(Restrictions.between("UPDATED_DATE",
					format.parse(from + " 00:00:00"),
					format.parse(to + " 23:59:59")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		List<TrnReservation> list = criteria.list();
		return list;
	}
	/**
	 * Get max id method
	 * @return
	 */
	public int getMaxId() {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnReservation.class)
				.setProjection(Projections.max("RESV_ID"));
		Integer maxId = (Integer) criteria.uniqueResult();
		if (maxId == null) {
			maxId = 0;
		}
		return maxId;
	}


	/**
	 * Add reservation method
	 */
	public TrnReservation addReservation(TrnReservation reservation) {
		try {
			Session session = this.sessionFactory.openSession();
			TrnReservation newReservation = reservation;

			Transaction tx = null;
			tx = session.beginTransaction();

			newReservation.setRESV_ID(getMaxId() + 1);
			newReservation.setRESV_CUST_ID(reservation.RESV_CUST_ID);
			newReservation.setRESV_MEBR_ID(reservation.RESV_MEBR_ID);
			newReservation.setRESV_UNIT_NO(reservation.RESV_UNIT_NO);
			newReservation.setRESV_PARTS_NO(reservation.RESV_PARTS_NO);
			newReservation
					.setRESV_START_TIME_ID(reservation.RESV_START_TIME_ID);
			newReservation
					.setRESV_END_TIME_ID(reservation.RESV_END_TIME_ID);
			newReservation.setRESV_CACT_ID(reservation.RESV_CACT_ID);
			newReservation.setRESV_NOTE(reservation.RESV_NOTE);

			newReservation
					.setCREATED_BY_USER_ID(reservation.CREATED_BY_USER_ID);
			newReservation.setCREATED_DATE(reservation.CREATED_DATE);
			newReservation
					.setUPDATED_BY_USER_ID(reservation.UPDATED_BY_USER_ID);
			newReservation.setUPDATED_DATE(reservation.UPDATED_DATE);
			newReservation.setISDELETED(reservation.ISDELETED);

			session.save(newReservation);
			tx.commit();
			session.close();

			return newReservation;
		} catch (Exception e) {
			return reservation;
		}
	}
	/**
	 * Edit reservation
	 */
	public TrnReservation editReservation(TrnReservation reservation) {
		try {
			Session session = this.sessionFactory.openSession();

			TrnReservation updateReservation = (TrnReservation) session.get(TrnReservation.class,
					reservation.RESV_ID);
			
			Transaction tx = null;
			tx = session.beginTransaction();
				
			if(reservation.ISDELETED != 1){
				updateReservation.setRESV_CUST_ID(reservation.RESV_CUST_ID);
				updateReservation.setRESV_MEBR_ID(reservation.RESV_MEBR_ID);
				updateReservation.setRESV_UNIT_NO(reservation.RESV_UNIT_NO);
				updateReservation.setRESV_PARTS_NO(reservation.RESV_PARTS_NO);
				updateReservation.setRESV_START_TIME_ID(reservation.RESV_START_TIME_ID);
				updateReservation.setRESV_END_TIME_ID(reservation.RESV_END_TIME_ID);
				updateReservation.setRESV_NOTE(reservation.RESV_NOTE);
			}else{
				updateReservation.setISDELETED(reservation.ISDELETED);
				updateReservation.setISDELETED_BY_USER_ID(reservation.ISDELETED_BY_USER_ID);
				updateReservation.setISDELETED_DATE(reservation.ISDELETED_DATE);
			}
			
			updateReservation.setUPDATED_BY_USER_ID(reservation.UPDATED_BY_USER_ID);
			updateReservation.setUPDATED_DATE(reservation.UPDATED_DATE);

			session.update(updateReservation);
			tx.commit();
			session.close();

			return updateReservation;
		} catch (Exception e) {
			return new TrnReservation();
		}
	}
	
	/**
	 * Delete reservation method
	 */
	public boolean deleteReservation(int id) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;

			tx = session.beginTransaction();
			TrnReservation deleteReservation = (TrnReservation) session.get(
					TrnReservation.class, id);

			session.delete(deleteReservation);

			tx.commit();
			session.close();

			return true;
		} catch (Exception e) {
			return false;
		}
	}
	/**
	 * Notification reservation method
	 */
	@SuppressWarnings("unchecked")
	public List<TrnReservation> notificationReservation(String parameterDate, int noOfDays) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd",Locale.ENGLISH);
		
		Session session = this.sessionFactory.getCurrentSession();
		
		List<TrnReservation> list = session.createQuery("from TrnReservation").list();
		List<TrnReservation> returnList = new ArrayList<TrnReservation>();
		
		try {
			for (int i = 0; i < list.size(); i++) {
				long calendarId = list.get(i).RESV_CACT_ID;
				
				List<MstCalendarActivity> query = session.createQuery("from MstCalendarActivity where CACT_ID =" + calendarId)
				.list();
				
				MstCalendarActivity calendarActivity = query.get(0);
				
				Date reservationDate = calendarActivity.CACT_CLDR_FK.CLDR_DATE;
				Date systemDate = dateFormat.parse(parameterDate);
				long diff = reservationDate.getTime() - systemDate.getTime();
			    long days = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
			    
				if (days >= 0 && days <= noOfDays) {
			    	returnList.add(list.get(i));
			    }
			}			
		} catch(Exception e) {
			System.out.print(e);
		}
	
		return returnList;
	}

}
