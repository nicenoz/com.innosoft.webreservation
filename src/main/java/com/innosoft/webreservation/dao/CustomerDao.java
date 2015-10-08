package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomer;
/**
 * CRUD interface for customer data object.
 */
public interface CustomerDao {
	/**
	 * List customer  method
	 * @return
	 */
	public List<MstCustomer> listCustomer();
	//USED TO SEARCH FOR FREE CUSTOMER
	/**List customer with no method
	 * 
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
	 * Delete customer method
	 * @param id
	 * @return
	 */
	public boolean deleteCustomer(int id);
	
	public List<MstCustomer> listCustomerByName(int id);	
}
