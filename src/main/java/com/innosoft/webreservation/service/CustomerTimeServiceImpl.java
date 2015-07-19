package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.CustomerDao;
import com.innosoft.webreservation.dao.CustomerTimeDao;
import com.innosoft.webreservation.entity.MstCustomer;
import com.innosoft.webreservation.entity.MstCustomerTime;

@Service
@Transactional
public class CustomerTimeServiceImpl implements CustomerTimeService {

	@Autowired
    private CustomerTimeDao customerTimeDao;
	
	public List<MstCustomerTime> listCustomerTime(){
		return customerTimeDao.listCustomerTime();
	}
	
}
