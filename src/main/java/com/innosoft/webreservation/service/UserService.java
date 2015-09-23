package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstSecurityUser;
/**
 * CRUD service interface for user
 */
public interface UserService {
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
	 * Get user email  if existmethod
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
	/**
	 * Edit user method
	 * @param user
	 * @return
	 */
	public MstSecurityUser editUser(MstSecurityUser user);
}
