package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.UserDao;
import com.innosoft.webreservation.entity.MstSecurityUser;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	public MstSecurityUser getUser(String login) {
		return userDao.getUser(login);
	}

	public MstSecurityUser getUser(int id) {
		return userDao.getUser(id);
	}
	
	public MstSecurityUser addUser(MstSecurityUser user) {
		return userDao.addUser(user);
	}

	public MstSecurityUser editUser(MstSecurityUser user) {
		return userDao.editUser(user);
	}

	public List<MstSecurityUser> listUser() {
		return userDao.listUser();
	}
}
