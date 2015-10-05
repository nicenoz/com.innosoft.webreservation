package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.CustomerMemberDao;
import com.innosoft.webreservation.entity.MstCustomerMember;
/**
 * CRUD service implementation for customer member
 */
@Service
@Transactional
public class CustomerMemberServiceImpl implements CustomerMemberService {
	/**
	 *Customer member  Doa property
	 */
	@Autowired
    private CustomerMemberDao customerMemberDao;
	/**
	 * List customer member method
	 */
	public List<MstCustomerMember> listCustomerMember(){
		return customerMemberDao.listCustomerMember();
	}
	/**
	 * Get member by user id method
	 */
	public List<MstCustomerMember> getMemberByUserId(int id){
		return customerMemberDao.getMemberByUserId(id);
	}
	/**
	 * Get member by email method
	 */
	public List<MstCustomerMember> getMemberByEmail(String email) {
		return customerMemberDao.getMemberByEmail(email);
	}
	/**
	 * Free user method
	 */
	public boolean isAlreadyFreeUser(int freeCustomerId, String email){
		return customerMemberDao.isAlreadyFreeUser(freeCustomerId, email);
	}
	/**
	 * Add customer member
	 */
	public MstCustomerMember addCustomerMember(MstCustomerMember member){
		return customerMemberDao.addCustomerMember(member);
	}
	/**
	 * Edit customer member method
	 */
	public MstCustomerMember editCustomerMember(MstCustomerMember member){
		return customerMemberDao.editCustomerMember(member);
	}
	/**
	 * Delete customer member method
	 */
	public boolean deleteCustomerMember(int id){
		return customerMemberDao.deleteCustomerMember(id);
	}
	/**
	 * Report customer member method
	 */
	public List<MstCustomerMember> reportCustomerMember(int customerId, String from, String to) {
		return customerMemberDao.reportCustomerMember(customerId, from, to);
	}
}
