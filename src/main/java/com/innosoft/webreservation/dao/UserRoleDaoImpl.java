package com.innosoft.webreservation.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstSecurityUserRole;

@Repository
@Transactional
public class UserRoleDaoImpl implements UserRoleDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
    public MstSecurityUserRole getUserRole(int id) {
    	MstSecurityUserRole role = (MstSecurityUserRole)getSessionFactory().getCurrentSession().load(MstSecurityUserRole.class, id);
        return role;
    }	
}
