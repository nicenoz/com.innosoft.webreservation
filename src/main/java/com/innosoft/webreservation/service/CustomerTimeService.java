package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomerTime;
/**
 *CRUD service interface for customer time
 */
public interface CustomerTimeService {
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
	 * Add customer time method
	 * @param message
	 * @return
	 */
	public MstCustomerTime addCustomerTime(MstCustomerTime message);
	/**
	 * Edit customer time method
	 * @param message
	 * @return
	 */
	public MstCustomerTime editCustomerTime(MstCustomerTime message);
	/**
	 * Delete customer time
	 * @param id
	 * @return
	 */
	public boolean deleteCustomerTime(int id);
}
