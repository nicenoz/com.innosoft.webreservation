package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomer;
/**
 * CRUD service interface for customer
 */
public interface CustomerService {
	/**
	 * List customer method 
	 * @return
	 */
	public List<MstCustomer> listCustomer();
	/**
	 * List customer with no method
	 * @param custNo
	 * @return
	 */
	public List<MstCustomer> listCustomerWithNo(String custNo);
	/**
	 * Add customer method
	 * @param customer
	 * @return
	 */
	public MstCustomer addCustomer(MstCustomer customer);
	/**
	 * Edit customer method
	 * @param customer
	 * @return
	 */
	public MstCustomer editCustomer(MstCustomer customer);
	/**
	 * Delete customer member
	 * @param id
	 * @return
	 */
	public boolean deleteCustomer(int id);	
}
