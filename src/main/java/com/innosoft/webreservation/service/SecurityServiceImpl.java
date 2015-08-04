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

@Service
@Transactional
public class SecurityServiceImpl implements SecurityService{
	@Autowired
	private UserDao userDao;

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
	
    public MstSecurityUser getCurrentUser() {
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername(); 
        return userDao.getUser(login);
    }
    
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
    
    public Object stampUpdated(Object object) {
    	try {
    		this.set(object, "UPDATED_DATE", new Date());
    		this.set(object, "UPDATED_BY_USER_ID", this.getCurrentUser().getUSER_ID());
    		this.set(object, "ISDELETED", 0);
    	} catch(Exception e) {
    	}
    	return object;
    }
}
