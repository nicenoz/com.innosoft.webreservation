package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.ChargeDao;
import com.innosoft.webreservation.entity.MstCharge;


@Service
@Transactional
public class ChargeServiceImpl implements ChargeService{
	@Autowired
    private ChargeDao chargeDao;

	public List<MstCharge> listCharge(){
		return chargeDao.listCharge();
	}
	
	public MstCharge addCharge(MstCharge charge){
		return chargeDao.addCharge(charge);
	}	
	
	public MstCharge editCharge(MstCharge charge){
		return chargeDao.editCharge(charge);
	}
	
	public boolean deleteCharge(int id){
		return chargeDao.deleteCharge(id);
	}
}
