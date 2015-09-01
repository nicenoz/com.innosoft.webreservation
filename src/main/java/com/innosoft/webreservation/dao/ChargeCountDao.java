package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.TrnChargeCount;


public interface ChargeCountDao {
	public List<TrnChargeCount> listChargeCount();
	public List<TrnChargeCount> getReport(String from, String to);
	public TrnChargeCount addChargeCount(TrnChargeCount chargeCount);
	public TrnChargeCount editChargeCount(TrnChargeCount chargeCount);
	public boolean deleteChargeCount(int id);
}
