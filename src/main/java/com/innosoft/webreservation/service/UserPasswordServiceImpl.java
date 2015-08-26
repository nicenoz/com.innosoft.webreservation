package com.innosoft.webreservation.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.UserPasswordDao;
import com.innosoft.webreservation.entity.MstSecurityUserPassword;

@Service
@Transactional
public class UserPasswordServiceImpl implements UserPasswordService {
	@Autowired
	private UserPasswordDao userPassDao;

	public MstSecurityUserPassword insertPassword(String password, int id) {
		// TODO Auto-generated method stub
		return userPassDao.insertPassword(password, id);
	}

	
}
