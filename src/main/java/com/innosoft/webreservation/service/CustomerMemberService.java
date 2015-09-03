package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomerMember;

public interface CustomerMemberService {
	public List<MstCustomerMember> listCustomerMember();
	public List<MstCustomerMember> reportCustomerMember(int customerId);
	public boolean isAlreadyFreeUser(int freeCustomerId, String email);
	public List<MstCustomerMember> getMemberByUserId(int id); 
	public List<MstCustomerMember> getMemberByEmail(String email) ;
	public MstCustomerMember addCustomerMember(MstCustomerMember message);
	public MstCustomerMember editCustomerMember(MstCustomerMember message);
	public boolean deleteCustomerMember(int id);
}
