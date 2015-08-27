package com.innosoft.webreservation.dao;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.innosoft.webreservation.entity.MstSecurityUserPassword;

@Repository
@Transactional
public class UserPasswordDaoImpl implements UserPasswordDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstSecurityUserPassword.class).setProjection(Projections.max("CHRG_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}
	
	public MstSecurityUserPassword insertPassword(String password, int id) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;

			tx = session.beginTransaction();
			MstSecurityUserPassword newOldPassword = new MstSecurityUserPassword();
            newOldPassword.setUPWD_ID(getMaxId()+1); 
			newOldPassword.setUPWD_USER_ID(id);
			newOldPassword.setUPWD_PASSWORD(password);

			session.save(newOldPassword);
			tx.commit();
			session.close();

			return newOldPassword;
		} catch (Exception e) {
			MstSecurityUserPassword use = new MstSecurityUserPassword();
			return use;
		}
	}

}
