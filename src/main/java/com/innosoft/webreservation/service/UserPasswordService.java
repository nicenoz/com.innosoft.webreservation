package com.innosoft.webreservation.service;

import java.util.List;

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
	public MstSecurityUserPassword insertPassword(int id,String password);
	public List<MstSecurityUserPassword> getExistingPassword(int userId);
}
