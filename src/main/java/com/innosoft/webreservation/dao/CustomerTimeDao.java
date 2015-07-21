package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomerTime;

public interface CustomerTimeDao {
	public List<MstCustomerTime> listCustomerTime();
	public MstCustomerTime addCustomerTime(MstCustomerTime time);
	public MstCustomerTime editCustomerTime(MstCustomerTime time);
	public boolean deleteCustomerTime(int id);
}
