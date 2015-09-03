package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomerMember;

public interface CustomerMemberDao {
	public List<MstCustomerMember> listCustomerMember();
	public boolean isAlreadyFreeUser(int freeCustomerId, String email);
	public List<MstCustomerMember> reportCustomerMember(int customerId);
	public List<MstCustomerMember> getMemberByUserId(int id);
	public List<MstCustomerMember> getMemberByEmail(String email);
	public MstCustomerMember addCustomerMember(MstCustomerMember member);
	public MstCustomerMember editCustomerMember(MstCustomerMember member);
	public boolean deleteCustomerMember(int id);
}
