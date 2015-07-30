package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomer;

public interface CustomerDao {
	public List<MstCustomer> listCustomer();
	public MstCustomer addCustomer(MstCustomer customer);
	public MstCustomer editCustomer(MstCustomer customer);
	public boolean deleteCustomer(int id);	
}
