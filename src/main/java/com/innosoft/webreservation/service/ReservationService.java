package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.TrnReservation;

public interface ReservationService {
	public List<TrnReservation> listReservation();
	public TrnReservation addReservation(TrnReservation reservation);
	public TrnReservation editReservation(TrnReservation reservation);
	public boolean deleteReservation(int id);
}
