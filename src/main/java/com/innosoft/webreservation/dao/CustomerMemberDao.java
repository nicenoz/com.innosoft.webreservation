package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomerMember;
/**
 *CRUD interface for customer member (user) data object.
 */
public interface CustomerMemberDao {
	/**
	 * List customer member method
	 * @return
	 */
	public List<MstCustomerMember> listCustomerMember();
	/**
	 * Free customer user method
	 * @param freeCustomerId
	 * @param email
	 * @return
	 */
	public boolean isAlreadyFreeUser(int freeCustomerId, String email);
	/**
	 * Report customer member method
	 * @param customerId
	 * @return
	 */
	public List<MstCustomerMember> reportCustomerMember(int customerId);
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
	public List<MstCustomerMember> getMemberByEmail(String email);
	/**
	 * add customer member method
	 * @param member
	 * @return
	 */
	public MstCustomerMember addCustomerMember(MstCustomerMember member);
	/**
	 * Edit customer member method
	 * @param member
	 * @return
	 */
	public MstCustomerMember editCustomerMember(MstCustomerMember member);
	/**
	 * Delete customer member method
	 * @param id
	 * @return
	 */
	public boolean deleteCustomerMember(int id);
}
