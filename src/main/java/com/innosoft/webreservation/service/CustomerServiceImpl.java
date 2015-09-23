package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.CustomerDao;
import com.innosoft.webreservation.entity.MstCustomer;
/**
 * CRUD service implementation for customer
 */
@Service
@Transactional
public class CustomerServiceImpl implements CustomerService{
	/**
	 * Customer method
	 */
	@Autowired
    private CustomerDao customerDao;
	/**
	 * List customer method
	 */
	public List<MstCustomer> listCustomer(){
		return customerDao.listCustomer();
	}
	/**
	 * List customer with no method
	 */
	public List<MstCustomer> listCustomerWithNo(String custNo){
		return customerDao.listCustomerWithNo(custNo);
	}
	/**
	 * Add customer method
	 */
	public MstCustomer addCustomer(MstCustomer customer){
		return customerDao.addCustomer(customer);
	}	
	/**
	 * Edit customer method
	 */
	public MstCustomer editCustomer(MstCustomer customer){
		return customerDao.editCustomer(customer);
	}
	/**
	 * Delete customer method
	 */
	public boolean deleteCustomer(int id){
		return customerDao.deleteCustomer(id);
	}	
}
