package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.ReservationDao;
import com.innosoft.webreservation.entity.TrnReservation;
/**
 * CRUD service implementation for reservation
 */
@Service
@Transactional
public class ReservationServiceImpl implements ReservationService{
	/**
	 * Reservation method
	 */
	@Autowired
    private ReservationDao reservationDao;
	/**
	 * List reservation method
	 */
	public List<TrnReservation> listReservation(){
		return reservationDao.listReservation();
	}
	/**
	 * List by customer method
	 */
	public List<TrnReservation> listByCustomer(int customerId){
		return reservationDao.listByCustomer(customerId);
	}
	/**
	 * Schedule reservation method
	 */
	public List<TrnReservation> scheduleReservation(int customerId, int calendarActivityId) {
		return reservationDao.scheduleReservation(customerId, calendarActivityId);
	}
	/**
	 * report reservation method
	 */
	public List<TrnReservation> reportReservation(String from, String to) {
		return reservationDao.reportReservation(from, to);
	}
	/**
	 * Add reservation method
	 */
	public TrnReservation addReservation(TrnReservation reservation){
		return reservationDao.addReservation(reservation);
	}	
	/**
	 * Edit reservation method
	 */
	public TrnReservation editReservation(TrnReservation reservation){
		return reservationDao.editReservation(reservation);
	}
	/**
	 * Delete reservation method
	 */
	public boolean deleteReservation(int id){
		return reservationDao.deleteReservation(id);
	}
	/**
	 * Notification method
	 */
	public List<TrnReservation> notificationReservation(String systemDate) {
		return reservationDao.notificationReservation(systemDate);
	}
 
}
