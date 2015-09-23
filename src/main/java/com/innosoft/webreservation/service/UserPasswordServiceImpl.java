package com.innosoft.webreservation.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.UserPasswordDao;
import com.innosoft.webreservation.entity.MstSecurityUserPassword;
/**
 * CRUD service implementation for password
 */
@Service
@Transactional
public class UserPasswordServiceImpl implements UserPasswordService {
	/**
	 * User password method
	 */
	@Autowired
	private UserPasswordDao userPassDao;
	/**
	 * insert password method
	 */
	public MstSecurityUserPassword insertPassword(String password, int id) {
		// TODO Auto-generated method stub
		return userPassDao.insertPassword(password, id);
	}

	
}
