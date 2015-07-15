package com.innosoft.webreservation.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.UserRoleDao;
import com.innosoft.webreservation.entity.MstSecurityUserRole;

@Service
@Transactional
public class UserRoleServiceImpl implements UserRoleService{
	@Autowired
    private UserRoleDao userRoleDao;
	
    public MstSecurityUserRole getRole(int id) {
        return userRoleDao.getUserRole(id);
    }	
}
