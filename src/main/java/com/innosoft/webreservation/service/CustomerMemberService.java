package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomerMember;

public interface CustomerMemberService {
	public List<MstCustomerMember> listCustomerMember();
	public List<MstCustomerMember> reportCustomerMember(String from, String to); 
	public MstCustomerMember addCustomerMember(MstCustomerMember message);
	public MstCustomerMember editCustomerMember(MstCustomerMember message);
	public boolean deleteCustomerMember(int id);
}
