package com.innosoft.webreservation.service;
import java.util.List;

import com.innosoft.webreservation.entity.MstCharge;
import com.innosoft.webreservation.entity.MstCustomer;

public interface ChargeService {
	public List<MstCharge> listCharge();
}
