package com.innosoft.webreservation.service;
import java.util.List;

import com.innosoft.webreservation.entity.MstCharge;


public interface ChargeService {
	public List<MstCharge> listCharge();
	public MstCharge addCharge(MstCharge charge);
}
