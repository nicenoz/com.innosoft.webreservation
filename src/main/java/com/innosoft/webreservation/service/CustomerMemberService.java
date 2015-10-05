package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomerMember;
/**
 * CRUD service interface for customer member
 */
public interface CustomerMemberService {
	/**
	 * List customer member method
	 * @return
	 */
	public List<MstCustomerMember> listCustomerMember();
	/**
	 * Report customer member method
	 * @param customerId
	 * @return
	 */
	public List<MstCustomerMember> reportCustomerMember(int customerId, String from, String to);
	/**
	 * Free user method
	 * @param freeCustomerId
	 * @param email
	 * @return
	 */
	public boolean isAlreadyFreeUser(int freeCustomerId, String email);
	/**
	 * Get member by user id method
	 * @param id
	 * @return
	 */
	public List<MstCustomerMember> getMemberByUserId(int id); 
	/**
	 * Get member by email method
	 * @param email
	 * @return
	 */
	public List<MstCustomerMember> getMemberByEmail(String email) ;
	/**
	 * Add customer member method
	 * @param message
	 * @return
	 */
	public MstCustomerMember addCustomerMember(MstCustomerMember message);
	/**
	 * Edit customer member method
	 * @param message
	 * @return
	 */
	public MstCustomerMember editCustomerMember(MstCustomerMember message);
	/**
	 * Delete customer member method
	 * @param id
	 * @return
	 */
	public boolean deleteCustomerMember(int id);
}
