package com.innosoft.webreservation.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstSecurityUser;
/**
 * CRUD implementation for user data object
 */
@Repository
@Transactional
public class UserDaoImpl implements UserDao {
	/**
	 * Session factory method
	 */
	@Autowired
	private SessionFactory sessionFactory;
	/**
	 * Get session factory method
	 * @return
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	/**
	 * Set session factory method
	 * @param sessionFactory
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/**
	 * List user method
	 */
	@SuppressWarnings("unchecked")
	public List<MstSecurityUser> listUser() {
		Session session = this.sessionFactory.openSession();
		List<MstSecurityUser> list = session.createQuery("from MstSecurityUser").list();	
		session.close();
		return list;
	}
	/**
	 * Get user method
	 */
	@SuppressWarnings("unchecked")
	public MstSecurityUser getUser(String login) {
		List<MstSecurityUser> userList = new ArrayList<MstSecurityUser>();
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from MstSecurityUser where USER_LOGIN = :login");
		query.setParameter("login", login);
		userList = query.list();
		if (userList.size() > 0){
			return userList.get(0);
		}
		else
		{
			return new MstSecurityUser();
		}
	}
	/**
	 * Get user method
	 */
	@SuppressWarnings("unchecked")
	public MstSecurityUser getUser(int id) {
		List<MstSecurityUser> userList = new ArrayList<MstSecurityUser>();
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from MstSecurityUser u where u.USER_ID = :id");
		query.setParameter("id", id);
		userList = query.list();
		if (userList.size() > 0)
			return userList.get(0);
		else
			return new MstSecurityUser();
	}	
	/**
	 * Get user email method
	 */
	@SuppressWarnings("unchecked")
	public MstSecurityUser getUserEmail(String userEmail) {
		List<MstSecurityUser> userList = new ArrayList<MstSecurityUser>();
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from MstSecurityUser where USER_LOGIN LIKE :userEmail");
		query.setParameter("userEmail", userEmail + ".%");
		userList = query.list();
		if (userList.size() > 0){
			return userList.get(0);
		}
		else
		{
			return new MstSecurityUser();
		}
	}
	/**
	 * Get user id (email esits) method
	 */
	@SuppressWarnings("unchecked")
	public int getUserIdIfEmailExist(String userEmail){
		List<MstSecurityUser> userList = new ArrayList<MstSecurityUser>();
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from MstSecurityUser where USER_LOGIN LIKE :userEmail");
		System.out.print(userEmail);
		query.setParameter("userEmail", userEmail);
		userList = query.list();
		if (userList.size() > 0){
			return userList.get(0).getUSER_ID();
		}
		else
		{
			return 0;
		}
	}
	/**
	 * Get current session method
	 * @return
	 */
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstSecurityUser.class).setProjection(Projections.max("USER_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}
	/**
	 * Add user method
	 */
	public MstSecurityUser addUser(MstSecurityUser user) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;

			tx = session.beginTransaction();
			MstSecurityUser newUser = new MstSecurityUser();
			newUser.setUSER_ID(getMaxId()+1);
			newUser.setUSER_LOGIN(user.USER_LOGIN);
			newUser.setUSER_ROLES(3); //Default role "ROLE_USER"
			
			String password = user.USER_PASSWORD;
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(password);
			
			newUser.setUSER_PASSWORD(hashedPassword);
			
			session.save(newUser);
			tx.commit();
			session.close();
	
			return newUser;
		} catch (Exception e) {
			System.out.print("FAIL");
			return user;
		}
	}
	/**
	 * Edit user method
	 */
	public MstSecurityUser editUser(MstSecurityUser user) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;

			tx = session.beginTransaction();
			MstSecurityUser updateUser = (MstSecurityUser) session.get(MstSecurityUser.class, user.USER_ID);

			updateUser.setUSER_LOGIN(user.USER_LOGIN);

			String password = user.USER_PASSWORD;
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(password);
			
			passwordEncoder.matches(password, hashedPassword);
			
			updateUser.setUSER_PASSWORD(hashedPassword);

			session.update(updateUser);
			tx.commit();
			session.close();

			return updateUser;
		} catch (Exception e) {
			return new MstSecurityUser();
		}
	}

}
