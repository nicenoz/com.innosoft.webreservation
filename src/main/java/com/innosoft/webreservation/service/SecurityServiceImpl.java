package com.innosoft.webreservation.service;

import java.lang.reflect.Method;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.UserDao;
import com.innosoft.webreservation.entity.MstCalendar;
import com.innosoft.webreservation.entity.MstCharge;
import com.innosoft.webreservation.entity.MstCode;
import com.innosoft.webreservation.entity.MstCustomer;
import com.innosoft.webreservation.entity.MstCustomerMember;
import com.innosoft.webreservation.entity.MstCustomerTime;
import com.innosoft.webreservation.entity.MstMessage;
import com.innosoft.webreservation.entity.MstSecurityUser;
import com.innosoft.webreservation.entity.SysAudit;
import com.innosoft.webreservation.entity.TrnChargeCount;
import com.innosoft.webreservation.entity.TrnReservation;

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
    
    public Object stampCreated(Object object,String objectType) {
    	Object returnObject = new Object();
    	returnObject = object;
    	try {
    		Class<?> cls = Class.forName(objectType);
    		
    		Method setCREATED_DATE = cls.getMethod("setCREATED_DATE");
    		Method setCREATED_BY_USER_ID = cls.getMethod("setCREATED_BY_USER_ID");
    		Method setUPDATED_DATE = cls.getMethod("setUPDATED_DATE");
    		Method setUPDATED_BY_USER_ID = cls.getMethod("setUPDATED_BY_USER_ID");
    		Method setISDELETED = cls.getMethod("setISDELETED");
    		
    		setCREATED_DATE.invoke(new Date());
    		setCREATED_BY_USER_ID.invoke(this.getCurrentUser().getUSER_ID());
    		setUPDATED_DATE.invoke(new Date());
    		setUPDATED_BY_USER_ID.invoke(this.getCurrentUser().getUSER_ID());
    		setISDELETED.invoke(0);
    		
    		returnObject = (Object)cls;
    		
    	} catch(Exception e) {
    		
    	}
    	
    	return returnObject;
    }
    
    public Object stampUpdated(Object object, String objectType) {
    	try {
    		Class<?> cls = Class.forName(objectType);

    		Method setUPDATED_DATE = cls.getMethod("setUPDATED_DATE");
    		Method setUPDATED_BY_USER_ID = cls.getMethod("setUPDATED_BY_USER_ID");
    		Method setISDELETED = cls.getMethod("setISDELETED");
    		
    		setUPDATED_DATE.invoke(new Date());
    		setUPDATED_BY_USER_ID.invoke(this.getCurrentUser().getUSER_ID());
    		setISDELETED.invoke(0);
    		
    	} catch(Exception e) {
    		
    	}
    	return object;
    }
}
