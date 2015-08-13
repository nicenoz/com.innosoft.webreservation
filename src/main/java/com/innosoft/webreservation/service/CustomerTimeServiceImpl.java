package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.CustomerTimeDao;
import com.innosoft.webreservation.entity.MstCustomerTime;

@Service
@Transactional
public class CustomerTimeServiceImpl implements CustomerTimeService {

	@Autowired
    private CustomerTimeDao customerTimeDao;
	
	public List<MstCustomerTime> listCustomerTime(){
		return customerTimeDao.listCustomerTime();
	}
	
	public List<MstCustomerTime> listCustomerTimeByCustomer(int customerId) {
		return customerTimeDao.listCustomerTimeByCustomer(customerId);
	}
	
	public MstCustomerTime addCustomerTime(MstCustomerTime time) {
		return customerTimeDao.addCustomerTime(time);
	}

	public MstCustomerTime editCustomerTime(MstCustomerTime time) {
		return customerTimeDao.editCustomerTime(time);
	}

	public boolean deleteCustomerTime(int id) {
		return customerTimeDao.deleteCustomerTime(id);
	}
	
}
