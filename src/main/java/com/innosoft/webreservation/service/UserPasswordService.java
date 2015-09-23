package com.innosoft.webreservation.service;

import com.innosoft.webreservation.entity.MstSecurityUserPassword;
/**
 * CRUD service interface for password
 */
public interface UserPasswordService {
	/**
	 * Insert password method
	 * @param password
	 * @param id
	 * @return
	 */
	public MstSecurityUserPassword insertPassword(String password,int id);
}
