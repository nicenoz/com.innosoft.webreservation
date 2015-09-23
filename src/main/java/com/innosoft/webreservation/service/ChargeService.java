package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCharge;
/**
 * CRUD service interface for charge
 */
public interface ChargeService {
	/**
	 * List charge method
	 * @return
	 */
	public List<MstCharge> listCharge();
	/**
	 * Add charge method
	 * @param charge
	 * @return
	 */
	public MstCharge addCharge(MstCharge charge);
	/**
	 * Edit charge method
	 * @param charge
	 * @return
	 */
	public MstCharge editCharge(MstCharge charge);
	/**
	 * Delete charge method
	 * @param id
	 * @return
	 */
	public boolean deleteCharge(int id);
}
