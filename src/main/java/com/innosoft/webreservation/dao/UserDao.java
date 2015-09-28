package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstSecurityUser;
/**
 * CRUD interface for user data object
 */
public interface UserDao {
	/**
	 * List user method
	 * @return
	 */
	public List<MstSecurityUser> listUser();
	/**
	 * Get user method
	 * @param login
	 * @return
	 */
	public MstSecurityUser getUser(String login);
	/**
	 * Get user method
	 * @param id
	 * @return
	 */
	public MstSecurityUser getUser(int id);
	/**
	 * Get user id (mail exits) method
	 * @param userEmail
	 * @return
	 */
	public int getUserIdIfEmailExist(String userEmail);
	/**
	 * Get user email method
	 * @param userEmail
	 * @return
	 */
	public MstSecurityUser getUserEmail(String userEmail);
	/**
	 * Add user method
	 * @param user
	 * @return
	 */
	public MstSecurityUser addUser(MstSecurityUser user); 
	/**Edit user method
	 * 
	 * @param user
	 * @return
	 */
	public MstSecurityUser editUser(MstSecurityUser user);
}
