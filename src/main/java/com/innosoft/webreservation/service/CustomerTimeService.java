package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomerTime;

public interface CustomerTimeService {
	public List<MstCustomerTime> listCustomerTime();
	public MstCustomerTime addCustomerTime(MstCustomerTime message);
	public MstCustomerTime editCustomerTime(MstCustomerTime message);
	public boolean deleteCustomerTime(int id);
}
