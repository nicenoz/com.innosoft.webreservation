package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomer;
import com.innosoft.webreservation.entity.MstMessage;

public interface CustomerService {
	public List<MstCustomer> listCustomer();
	public MstCustomer addCustomer(MstCustomer customer);
	public MstCustomer editCustomer(MstCustomer customer);
	public boolean deleteCustomer(int id);	
}
