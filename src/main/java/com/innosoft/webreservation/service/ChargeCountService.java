package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.TrnChargeCount;
/**
 * CRUD service interface for charge count
 */
public interface ChargeCountService {
	/**
	 * List charge count method
	 * @return
	 */
	public List<TrnChargeCount> listChargeCount();
	/**
	 * Get report method
	 * @param from
	 * @param to
	 * @return
	 */
	public List<TrnChargeCount> getReport(String from, String to);
	/**
	 * Get reservation by id method
	 * @param resvId
	 * @return
	 */
	public TrnChargeCount getReservationById(int resvId);
	/**
	 * Add charge count method
	 * @param chargeCount
	 * @return
	 */
	public TrnChargeCount addChargeCount(TrnChargeCount chargeCount);
	/**
	 * Edit charge count method
	 * @param chargeCount
	 * @return
	 */
	public TrnChargeCount editChargeCount(TrnChargeCount chargeCount);
	/**
	 * Delete charge count method
	 * @param id
	 * @return
	 */
	public boolean deleteChargeCount(int id);
}
