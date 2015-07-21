package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCharge;

public interface ChargeDao {
	public List<MstCharge> listCharge();
	public MstCharge addCharge(MstCharge charge);
	public MstCharge editCharge(MstCharge charge);
	public boolean deleteCharge(int id);
}
