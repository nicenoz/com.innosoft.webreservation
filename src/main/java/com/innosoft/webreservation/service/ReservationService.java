package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.TrnReservation;
/**
 * Spring security login service implementation
 */
public interface ReservationService {
	/**
	 * List reservation method
	 * @return
	 */
	public List<TrnReservation> listReservation();
	/**
	 * List by customer method
	 * @param customerId
	 * @return
	 */
	public List<TrnReservation> listByCustomer(int customerId);
	/**
	 * Schedule reservation method
	 * @param customerId
	 * @param calendarActivityId
	 * @return
	 */
	public List<TrnReservation> scheduleReservation(int customerId, String calendarActivityIds);
	/**
	 * Report reservation method
	 * @param from
	 * @param to
	 * @return
	 */
	public List<TrnReservation> reportReservation(String from, String to);
	/**
	 * Notification reservation method
	 * @param systemDate
	 * @return
	 */
	public List<TrnReservation> notificationReservation(String systemDate, int noOfDays);
	/**
	 * Add reservation method
	 * @param reservation
	 * @return
	 */
	public TrnReservation addReservation(TrnReservation reservation);
	/**
	 * Edit reservation method
	 * @param reservation
	 * @return
	 */
	public TrnReservation editReservation(TrnReservation reservation);
	/**
	 * Delete reservation method
	 * @param id
	 * @return
	 */
	public boolean deleteReservation(int id);
}
