package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstSecurityUser;

public interface UserService {
	public List<MstSecurityUser> listUser();
	public MstSecurityUser getUser(String login);
	public MstSecurityUser addUser(MstSecurityUser user);
	public MstSecurityUser editUser(MstSecurityUser user);
}
