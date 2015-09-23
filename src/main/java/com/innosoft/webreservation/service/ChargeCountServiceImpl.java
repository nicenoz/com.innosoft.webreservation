package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.ChargeCountDao;
import com.innosoft.webreservation.entity.TrnChargeCount;

/**
 * CRUD service implementation for charge count
 */
@Service
@Transactional
public class ChargeCountServiceImpl implements ChargeCountService{
	/**
	 * Charge count method
	 */
	@Autowired
    private ChargeCountDao chargeCountDao;
	/**
	 * List charge count method
	 */
	public List<TrnChargeCount> listChargeCount(){
		return chargeCountDao.listChargeCount();
	}
	/**
	 * Get report method
	 */
	public List<TrnChargeCount> getReport(String from, String to){
		return chargeCountDao.getReport(from, to);
	}
	
	/**
	 * Get reservation by id method
	 */
	public TrnChargeCount getReservationById(int resvId){
		return chargeCountDao.getReservationById(resvId);
	}
	/**
	 * Add charge count method
	 */
	public TrnChargeCount addChargeCount(TrnChargeCount chargeCount){
		return chargeCountDao.addChargeCount(chargeCount);
	}	
	/**
	 * Edit charge count method
	 */
	public TrnChargeCount editChargeCount(TrnChargeCount chargeCount){
		return chargeCountDao.editChargeCount(chargeCount);
	}
	/**
	 * Delete charge count method
	 */
	public boolean deleteChargeCount(int id){
		return chargeCountDao.deleteChargeCount(id);
	}
}
