package com.innosoft.webreservation.service;

import java.util.List;

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
	 * User password property
	 */
	@Autowired
	private UserPasswordDao UserPasswordDao;
	
	/**
	 * insert password method
	 */
	public MstSecurityUserPassword insertPassword( int id,String password) {
		return UserPasswordDao.insertPassword(id,password);
	}
	public List<MstSecurityUserPassword> getExistingPassword(int userId){
		return UserPasswordDao.getExistingPassword(userId);
	}
}
