package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.ReservationDao;
import com.innosoft.webreservation.entity.TrnReservation;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService{
	@Autowired
    private ReservationDao reservationDao;
	
	public List<TrnReservation> listReservation(){
		return reservationDao.listReservation();
	}
	public List<TrnReservation> listByCustomer(int customerId){
		return reservationDao.listByCustomer(customerId);
	}
	public List<TrnReservation> scheduleReservation(int customerId, int calendarActivityId) {
		return reservationDao.scheduleReservation(customerId, calendarActivityId);
	}
	public List<TrnReservation> reportReservation(String from, String to) {
		return reservationDao.reportReservation(from, to);
	}
	
	public TrnReservation addReservation(TrnReservation reservation){
		return reservationDao.addReservation(reservation);
	}	
	
	public TrnReservation editReservation(TrnReservation reservation){
		return reservationDao.editReservation(reservation);
	}
	
	public boolean deleteReservation(int id){
		return reservationDao.deleteReservation(id);
	}

	public List<TrnReservation> notificationReservation(String systemDate) {
		return reservationDao.notificationReservation(systemDate);
	}

}
