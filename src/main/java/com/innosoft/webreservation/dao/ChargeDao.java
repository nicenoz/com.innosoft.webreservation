package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCharge;
/**
 *CRUD interface for charge data object.
 */
public interface ChargeDao {
	/**
	 * List charge method
	 * @return
	 */
	public List<MstCharge> listCharge();
	/**
	 * add charge method
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
