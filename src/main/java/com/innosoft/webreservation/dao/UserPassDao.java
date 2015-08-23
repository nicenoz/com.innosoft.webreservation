package com.innosoft.webreservation.dao;

import com.innosoft.webreservation.entity.MstSecurityUserPassword;

public interface UserPassDao {
	public MstSecurityUserPassword getUserPass(String pass,int id);
	public MstSecurityUserPassword inserUserPass(String user, int id); 
}
