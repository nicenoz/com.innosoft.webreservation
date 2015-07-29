package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomerMember;

public interface CustomerMemberService {
	public List<MstCustomerMember> listCustomerMember();
	public MstCustomerMember addCustomerMember(MstCustomerMember message);
	public MstCustomerMember editCustomerMember(MstCustomerMember message);
	public boolean deleteCustomerMember(int id);
}
