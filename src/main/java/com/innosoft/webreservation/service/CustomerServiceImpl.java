package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.CustomerDao;
import com.innosoft.webreservation.entity.MstCustomer;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
    private CustomerDao customerDao;
	
	public List<MstCustomer> listCustomer(){
		return customerDao.listCustomer();
	}
}
