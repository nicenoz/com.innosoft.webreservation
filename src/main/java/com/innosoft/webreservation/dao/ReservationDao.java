package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.TrnReservation;

public interface ReservationDao {
	public List<TrnReservation> listReservation();
	public TrnReservation addReservation(TrnReservation reservation);
	public TrnReservation editReservation(TrnReservation reservation);
	public boolean deleteReservation(int id);
}
