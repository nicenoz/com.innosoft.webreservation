package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomer;

public interface CustomerDao {
	public List<MstCustomer> listCustomer();
	//USED TO SEARCH FOR FREE CUSTOMER
	public List<MstCustomer> listCustomerWithNo(String custNo);
	public MstCustomer addCustomer(MstCustomer customer);
	public MstCustomer editCustomer(MstCustomer customer);
	public boolean deleteCustomer(int id);	
}
