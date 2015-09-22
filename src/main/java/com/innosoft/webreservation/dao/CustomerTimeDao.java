package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomerTime;
/**
 * CRUD interface for customer time data object.
 */
public interface CustomerTimeDao {
	/**
	 * List customer time method
	 * @return
	 */
	public List<MstCustomerTime> listCustomerTime();
	/**
	 * List customer time by customer method
	 * @param customerId
	 * @return
	 */
	public List<MstCustomerTime> listCustomerTimeByCustomer(int customerId);
	/**
	 * Add customer time
	 * @param time
	 * @return
	 */
	public MstCustomerTime addCustomerTime(MstCustomerTime time);
	/**
	 * Edit customer time
	 * @param time
	 * @return
	 */
	public MstCustomerTime editCustomerTime(MstCustomerTime time);
	/**
	 * Delete customer time
	 * @param id
	 * @return
	 */
	public boolean deleteCustomerTime(int id);
}
