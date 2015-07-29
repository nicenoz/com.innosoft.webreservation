package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.CustomerMemberDao;
import com.innosoft.webreservation.entity.MstCustomerMember;

@Service
@Transactional
public class CustomerMemberServiceImpl implements CustomerMemberService {
	@Autowired
    private CustomerMemberDao customerMemberDao;	
	public List<MstCustomerMember> listCustomerMember(){
		return customerMemberDao.listCustomerMember();
	}
	public MstCustomerMember addCustomerMember(MstCustomerMember member){
		return customerMemberDao.addCustomerMember(member);
	}
	public MstCustomerMember editCustomerMember(MstCustomerMember member){
		return customerMemberDao.editCustomerMember(member);
	}
	public boolean deleteCustomerMember(int id){
		return customerMemberDao.deleteCustomerMember(id);
	}
}
