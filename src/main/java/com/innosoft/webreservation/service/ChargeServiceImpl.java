package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.ChargeDao;
import com.innosoft.webreservation.entity.MstCharge;

/**
 * CRUD service implementation
 */
@Service
@Transactional
public class ChargeServiceImpl implements ChargeService{
	/**
	 * Charge method
	 */
	@Autowired
    private ChargeDao chargeDao;
	/**
	 * List charge method
	 */
	public List<MstCharge> listCharge(){
		return chargeDao.listCharge();
	}
	/**
	 * Add charge method
	 */
	public MstCharge addCharge(MstCharge charge){
		return chargeDao.addCharge(charge);
	}	
	/**
	 * Edit charge method
	 */
	public MstCharge editCharge(MstCharge charge){
		return chargeDao.editCharge(charge);
	}
	/**
	 * Delete charge method
	 */
	public boolean deleteCharge(int id){
		return chargeDao.deleteCharge(id);
	}
}
