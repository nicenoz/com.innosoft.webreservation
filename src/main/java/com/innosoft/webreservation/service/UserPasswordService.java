package com.innosoft.webreservation.service;

import com.innosoft.webreservation.entity.MstSecurityUserPassword;

public interface UserPasswordService {
	public MstSecurityUserPassword insertPassword(String password,int id);
}
