package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomer;

public interface CustomerService {
	public List<MstCustomer> listCustomer();
	public List<MstCustomer> listCustomerWithNo(String custNo);
	public MstCustomer addCustomer(MstCustomer customer);
	public MstCustomer editCustomer(MstCustomer customer);
	public boolean deleteCustomer(int id);	
}
