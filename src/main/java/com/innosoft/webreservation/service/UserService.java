package com.innosoft.webreservation.service;

import com.innosoft.webreservation.entity.MstSecurityUser;

public interface UserService {
	public MstSecurityUser getUser(String login);
}
