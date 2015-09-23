package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.UserDao;
import com.innosoft.webreservation.entity.MstSecurityUser;
/**
 * CRUD service implementation for user
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
	/**
	 * User service method
	 */
	@Autowired
	private UserDao userDao;
	/**
	 * Get user method
	 */
	public MstSecurityUser getUser(String login) {
		return userDao.getUser(login);
	}
	/**
	 * Get user method
	 */
	public MstSecurityUser getUser(int id) {
		return userDao.getUser(id);
	}
	/**
	 * Get user email method
	 */
	public MstSecurityUser getUserEmail(String userEmail) {
		return userDao.getUserEmail(userEmail);
	}
	/**
	 * Get user email method
	 */
	public int getUserIdIfEmailExist(String userEmail){
		return userDao.getUserIdIfEmailExist(userEmail);
	}
	/**
	 * Add user method
	 */
	public MstSecurityUser addUser(MstSecurityUser user) {
		return userDao.addUser(user);
	}
	/**Edit user method
	 * 
	 */
	public MstSecurityUser editUser(MstSecurityUser user) {
		return userDao.editUser(user);
	}
	/**
	 * List user method
	 */
	public List<MstSecurityUser> listUser() {
		return userDao.listUser();
	}
}
