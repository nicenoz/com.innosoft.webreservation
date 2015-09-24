package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.CustomerTimeDao;
import com.innosoft.webreservation.entity.MstCustomerTime;
/**
 * CRUD service implementation for customer time
 */
@Service
@Transactional
public class CustomerTimeServiceImpl implements CustomerTimeService {
	/**
	 * Customer time property
	 */
	@Autowired
    private CustomerTimeDao customerTimeDao;
	/**
	 * List customer time method
	 */
	public List<MstCustomerTime> listCustomerTime(){
		return customerTimeDao.listCustomerTime();
	}
	/**
	 * List customer time by customer method
	 */
	public List<MstCustomerTime> listCustomerTimeByCustomer(int customerId) {
		return customerTimeDao.listCustomerTimeByCustomer(customerId);
	}
	/**
	 * Add customer time method
	 */
	public MstCustomerTime addCustomerTime(MstCustomerTime time) {
		return customerTimeDao.addCustomerTime(time);
	}
	/**
	 * Edit customer time
	 */
	public MstCustomerTime editCustomerTime(MstCustomerTime time) {
		return customerTimeDao.editCustomerTime(time);
	}
	/**
	 * Delete customer time method
	 */
	public boolean deleteCustomerTime(int id) {
		return customerTimeDao.deleteCustomerTime(id);
	}
	
}
