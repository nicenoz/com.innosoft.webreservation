package com.innosoft.webreservation.service;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.UserDao;
import com.innosoft.webreservation.entity.MstMessage;
import com.innosoft.webreservation.entity.MstSecurityUser;

@Service
@Transactional
public class SecurityServiceImpl implements SecurityService{
	@Autowired
	private UserDao userDao;

    public MstSecurityUser getCurrentUser() {
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername(); 
        return userDao.getUser(login);
    }
    
    public Object stampCreated(Object object, String objectType) {
    	if(objectType=="Message") {
			MstMessage message = (MstMessage)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			message.setCREATED_DATE(new Date());
			message.setCREATED_BY_USER_ID(currentUser.getUSER_ID());
			message.setUPDATED_DATE(new Date());    
			message.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			message.setISDELETED(0);
    	} else if(objectType=="Calendar") {
    		
    	} else if(objectType=="CalendarActivity") {
    		
    	} else if(objectType=="Charge") {
    		
    	} else if(objectType=="Code") {
    		
    	} else if(objectType=="Customer") {
    		
    	} else if(objectType=="CustomerMember") {
    		
    	} else if(objectType=="CustomerTime") {
    		
    	} else if(objectType=="Reservation") {
    		
    	}
    	return object;
    }
    
    public Object stampUpdated(Object object, String objectType) {
    	if(objectType=="Message") {
			MstMessage message = (MstMessage)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			message.setUPDATED_DATE(new Date());    
			message.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			message.setISDELETED(0);
    	} else if(objectType=="Calendar") {
    		
    	} else if(objectType=="CalendarActivity") {
    		
    	} else if(objectType=="Charge") {
    		
    	} else if(objectType=="Code") {
    		
    	} else if(objectType=="Customer") {
    		
    	} else if(objectType=="CustomerMember") {
    		
    	} else if(objectType=="CustomerTime") {
    		
    	} else if(objectType=="Reservation") {
    		
    	}    	
    	return object;
    }
}
