package com.innosoft.webreservation.dao;

import com.innosoft.webreservation.entity.MstSecurityUser;

public interface UserDao {
	public MstSecurityUser getUser(String login);
	public MstSecurityUser addUser(MstSecurityUser user); 
}
