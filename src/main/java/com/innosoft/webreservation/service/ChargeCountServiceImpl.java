package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.ChargeCountDao;
import com.innosoft.webreservation.entity.TrnChargeCount;


@Service
@Transactional
public class ChargeCountServiceImpl implements ChargeCountService{
	@Autowired
    private ChargeCountDao chargeCountDao;

	public List<TrnChargeCount> listChargeCount(){
		return chargeCountDao.listChargeCount();
	}

	public List<TrnChargeCount> getReport(String from, String to){
		return chargeCountDao.getReport(from, to);
	}
	

	public TrnChargeCount getReservationById(int resvId){
		return chargeCountDao.getReservationById(resvId);
	}
	
	public TrnChargeCount addChargeCount(TrnChargeCount chargeCount){
		return chargeCountDao.addChargeCount(chargeCount);
	}	
	
	public TrnChargeCount editChargeCount(TrnChargeCount chargeCount){
		return chargeCountDao.editChargeCount(chargeCount);
	}
	
	public boolean deleteChargeCount(int id){
		return chargeCountDao.deleteChargeCount(id);
	}
}
