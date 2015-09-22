package com.innosoft.webreservation.dao;

import com.innosoft.webreservation.entity.MstSecurityUserPassword;
/**
 * CRUD interface for password data object
 */
public interface UserPasswordDao {
	/**
	 * Insert password method
	 * @param password
	 * @param id
	 * @return
	 */
	public MstSecurityUserPassword insertPassword(String password, int id);
}
