package com.innosoft.webreservation.dao;

import com.innosoft.webreservation.entity.MstSecurityUserPassword;

public interface UserPasswordDao {
	public MstSecurityUserPassword getUserPass(String pass,int id);
	public MstSecurityUserPassword insertUserPass(String user, int id); 
}
