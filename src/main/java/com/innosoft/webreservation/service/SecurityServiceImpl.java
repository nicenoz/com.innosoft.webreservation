package com.innosoft.webreservation.service;

import java.lang.reflect.Field;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.UserDao;
import com.innosoft.webreservation.entity.MstSecurityUser;
/**
 * CRUD service implementation for security
 */
@Service
@Transactional
public class SecurityServiceImpl implements SecurityService{
	/**
	 * User Dao property
	 */
	@Autowired
	private UserDao userDao;
	/**
	 * Set stamp method
	 * @param object
	 * @param fieldName
	 * @param fieldValue
	 * @return
	 */
	private boolean set(Object object, String fieldName, Object fieldValue) {
	    Class<?> clazz = object.getClass();
	    while (clazz != null) {
	        try {
	            Field field = clazz.getDeclaredField(fieldName);
	            field.setAccessible(true);
	            field.set(object, fieldValue);
	            return true;
	        } catch (Exception e) {
	            throw new IllegalStateException(e);
	        }
	    }
	    return false;
	}
	/**
	 * Get current user method
	 */
    public MstSecurityUser getCurrentUser() {
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername(); 
        return userDao.getUser(login);
    }
    /**
     * Stamp date and time for created method
     */
    public Object stampCreated(Object object) {
    	try {
    		this.set(object, "CREATED_DATE", new Date());
    		this.set(object, "CREATED_BY_USER_ID", this.getCurrentUser().getUSER_ID());
    		this.set(object, "UPDATED_DATE", new Date());
    		this.set(object, "UPDATED_BY_USER_ID", this.getCurrentUser().getUSER_ID());
    		this.set(object, "ISDELETED", 0);
    	} catch(Exception e) {
    	}
    	
    	return object;
    }
    /**
     * Stamp date and time for updated method
     */
    public Object stampUpdated(Object object) {
    	try {
    		this.set(object, "UPDATED_DATE", new Date());
    		this.set(object, "UPDATED_BY_USER_ID", this.getCurrentUser().getUSER_ID());
    		this.set(object, "ISDELETED", 0);
    	} catch(Exception e) {
    	}
    	return object;
    }
    /**
     * Stamp date and time for deleted method
     */

	public Object stampDeleted(Object object){
		try {
    		this.set(object, "UPDATED_DATE", new Date());
    		this.set(object, "UPDATED_BY_USER_ID", this.getCurrentUser().getUSER_ID());
    		this.set(object, "ISDELETED", 1);
    		this.set(object, "ISDELETED_DATE", new Date());
    		this.set(object, "ISDELETED_BY_USER_ID", this.getCurrentUser().getUSER_ID());
    	} catch(Exception e) {
    	}
    	return object;
	}
}
