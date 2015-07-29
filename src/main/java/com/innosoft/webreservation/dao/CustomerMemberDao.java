package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCustomerMember;

public interface CustomerMemberDao {
	public List<MstCustomerMember> listCustomerMember();
	public MstCustomerMember addCustomerMember(MstCustomerMember member);
	public MstCustomerMember editCustomerMember(MstCustomerMember member);
	public boolean deleteCustomerMember(int id);
}
