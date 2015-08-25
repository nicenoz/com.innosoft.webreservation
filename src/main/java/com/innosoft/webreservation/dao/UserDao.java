package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstSecurityUser;

public interface UserDao {
	public List<MstSecurityUser> listUser();
	public MstSecurityUser getUser(String login);
	public MstSecurityUser getUser(int id);
	public int getUserIdIfEmailExist(String userEmail);
	public MstSecurityUser getUserEmail(String userEmail);
	public MstSecurityUser addUser(MstSecurityUser user); 
	public MstSecurityUser editUser(MstSecurityUser user);
}
