package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstSecurityUserPassword;
/**
 * CRUD interface for password data object
 */
public interface UserPasswordDao {
	/**
	 * Insert password method
	 * @param id
	 * @return 
	 */
	public MstSecurityUserPassword insertPassword( int userId ,String password);
	
	/**
	 * Get the password record 
	 * @param userId
	 * @param password
	 * @return
	 */
	public List<MstSecurityUserPassword> getExistingPassword(int userId);
}
