package com.innosoft.webreservation.dao;

import com.innosoft.webreservation.entity.MstSecurityUserPassword;

public interface UserPasswordDao {
	public MstSecurityUserPassword insertPassword(String password, int id);
}
