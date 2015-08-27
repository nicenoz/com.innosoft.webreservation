package com.innosoft.webreservation.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstSecurityUserPassword;

@Repository
@Transactional
public class UserPasswordImpl implements UserPasswordDao{

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public MstSecurityUserPassword getUserPass(String pass, int id) {
		List<MstSecurityUserPassword> userPass = new ArrayList<MstSecurityUserPassword>();
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from MstSecurityUserPassword u where u.UPWD_PASSWORD = :pass and u.UPWD_USER_ID = :id");
		query.setParameter("pass", pass);
		query.setParameter("id", id);
		userPass = query.list();
		if (userPass.size() > 0)
			return userPass.get(0);
		else
			return new MstSecurityUserPassword();
	}

	public MstSecurityUserPassword insertUserPass(String user, int id) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;

			tx = session.beginTransaction();
			MstSecurityUserPassword newOldPassword = new MstSecurityUserPassword();

			newOldPassword.setUPWD_USER_ID(id);
			newOldPassword.setUPWD_PASSWORD(user);

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
