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
import com.innosoft.webreservation.entity.MstCustomerTime;
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
		List<TrnReservation> list = session.createQuery("from TrnReservation")
				.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<TrnReservation> listByCustomer(int customerId) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnReservation.class);
		criteria.add(Restrictions.eq("RESV_CUST_ID", customerId));
		criteria.addOrder(Order.asc("RESV_ID"));
		List<TrnReservation> list = criteria.list();
		return list;
	}

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

	@SuppressWarnings("unchecked")
	public List<TrnReservation> reportReservation(String from, String to) {
		DateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss",
				Locale.ENGLISH);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrnReservation.class);

		try {
			criteria.add(Restrictions.between("CREATED_DATE",
					format.parse(from + " 00:00:00"),
					format.parse(to + " 23:59:59")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		List<TrnReservation> list = criteria.list();
		return list;
	}

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

//  Fek
//	@SuppressWarnings("unchecked")
//	public TrnReservation validateReservation(TrnReservation reservation,
//			Session session) {
//
//		Criteria getAllCustomerTime = session
//				.createCriteria(MstCustomerTime.class);
//		getAllCustomerTime.add(Restrictions.eq("CTIM_CUST_ID",
//				reservation.RESV_CUST_ID));
//		getAllCustomerTime.addOrder(Order.asc("CTIM_DETAILS_NO_INT"));
//		List<MstCustomerTime> customerTimeList = getAllCustomerTime.list();
//
//		int startTime = 0;
//		for (int a = 0; a < customerTimeList.size(); a++) {
//			if (reservation.RESV_START_TIME_ID == ((MstCustomerTime) customerTimeList
//					.get(a)).getCTIM_ID()) {
//				startTime = ((MstCustomerTime) customerTimeList.get(a))
//						.getCTIM_DETAILS_NO_INT();
//				break;
//			}
//		}
//
//		int endTime = 0;
//		for (int a = 0; a < customerTimeList.size(); a++) {
//			if (reservation.RESV_END_TIME_ID == ((MstCustomerTime) customerTimeList
//					.get(a)).getCTIM_ID()) {
//				endTime = ((MstCustomerTime) customerTimeList.get(a))
//						.getCTIM_DETAILS_NO_INT();
//				break;
//			}
//		}
//
//		Criteria getReservationsByDate = session
//				.createCriteria(TrnReservation.class);
//		getReservationsByDate.add(Restrictions.eq("RESV_CUST_ID",
//				reservation.RESV_CUST_ID));
//		getReservationsByDate.add(Restrictions.eq("RESV_CACT_ID",
//				reservation.RESV_CACT_ID));
//		List<TrnReservation> reservationList = getReservationsByDate.list();
//
//		// MultipleChecker:
//		for (int x = 0; x < customerTimeList.size(); x++) {
//			if (customerTimeList.get(x).getCTIM_DETAILS_NO_INT() >= startTime
//					&& customerTimeList.get(x).getCTIM_DETAILS_NO_INT() <= endTime) {
//
//				int reservationCount = 0;
//
//				for (int a = 0; a < reservationList.size(); a++) {
//					if (reservationList.get(a).getRESV_PARTS_NO() == reservation
//							.getRESV_PARTS_NO()) {
//
//						int checkReservationStartTimeIndex = -1;
//						int checkReservationEndTimeIndex = -1;
//
//						for (int b = 0; b < customerTimeList.size(); b++) {
//							if (reservationList.get(a).getRESV_START_TIME_ID() == customerTimeList
//									.get(b).getCTIM_ID()) {
//								checkReservationStartTimeIndex = b;
//							}
//
//							if (reservationList.get(a).getRESV_END_TIME_ID() == customerTimeList
//									.get(b).getCTIM_ID()) {
//								checkReservationEndTimeIndex = b;
//							}
//
//							if (checkReservationStartTimeIndex != -1
//									&& checkReservationEndTimeIndex != -1) {
//								break;
//							}
//						}
//
//						List<MstCustomerTime> searchList = customerTimeList
//								.subList(checkReservationStartTimeIndex,
//										checkReservationEndTimeIndex + 1);
//						for (int c = 0; c < searchList.size(); c++) {
//							if (searchList.get(c).getCTIM_ID() == customerTimeList
//									.get(x).getCTIM_ID()) {
//
//								// IF: No duplicate reservations for single day
//								// if(reservationList.get(a).getRESV_MEBR_ID()
//								// == reservation.getRESV_MEBR_ID()){
//								// isValid = false;
//								// newReservation.setRESV_ID(-2);
//								// break MultipleChecker;
//								// }
//
//								// IF: Allow duplicate for day but not for same
//								// time
//								// if(reservationList.get(a).getRESV_MEBR_ID()
//								// == reservation.getRESV_MEBR_ID()){
//								// isValid = false;
//								// newReservation.setRESV_ID(-2);
//								// break MultipleChecker;
//								// }
//
//								reservationCount++;
//							}
//
//						}
//					}
//				}
//
//				if (reservationCount >= customerTimeList.get(x)
//						.getCTIM_MAX_UNIT_NO()) {
//					reservation.setRESV_ID(-1);
//					break;
//				}
//			}
//		}
//
//		return reservation;
//
//	}

	public TrnReservation addReservation(TrnReservation reservation) {
		try {
			Session session = this.sessionFactory.openSession();
//			TrnReservation newReservation = validateReservation(reservation,
//					session);
//
//			if (newReservation.getRESV_ID() != -1) {
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

	public TrnReservation editReservation(TrnReservation reservation) {
		try {
			Session session = this.sessionFactory.openSession();
//			TrnReservation updateReservation = validateReservation(
//					(TrnReservation) session.get(TrnReservation.class,
//							reservation.RESV_ID), session);

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
	
	@SuppressWarnings("unchecked")
	public List<TrnReservation> notificationReservation(String parameterDate) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd",Locale.ENGLISH);
		
		Session session = this.sessionFactory.getCurrentSession();
		
		List<TrnReservation> list = session.createQuery("from TrnReservation").list();
		List<TrnReservation> returnList = new ArrayList<TrnReservation>();
		
		try {
			for (int i = 0; i < list.size(); i++) {
				long calendarId = list.get(i).RESV_CACT_ID;
				
				Criteria criteria = session.createCriteria(MstCalendarActivity.class);
				criteria.add(Restrictions.eq("CACT_ID",calendarId));
				MstCalendarActivity calendarActivity = (MstCalendarActivity)criteria.list().get(0);
				
				Date reservationDate = calendarActivity.CACT_CLDR_FK.CLDR_DATE;
				Date systemDate = dateFormat.parse(parameterDate);
				
				long diff = reservationDate.getTime() - systemDate.getTime();
			    long days = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
			    
			    if (days >= 0 && days <= 3) {
			    	returnList.add(list.get(i));
			    }
			}			
		} catch(Exception e) {
			
		}
	
		return returnList;
	}

}
