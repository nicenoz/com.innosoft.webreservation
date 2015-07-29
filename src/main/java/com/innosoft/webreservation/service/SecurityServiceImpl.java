package com.innosoft.webreservation.service;

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
import com.innosoft.webreservation.entity.MstCustomerTime;
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
    		MstCalendar calendar = (MstCalendar)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			calendar.setCREATED_DATE(new Date());
			calendar.setCREATED_BY_USER_ID(currentUser.getUSER_ID());
			calendar.setUPDATED_DATE(new Date());    
			calendar.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			calendar.setISDELETED(0);
    	} else if(objectType=="CalendarActivity") {
    		
    	} else if(objectType=="Charge") {
    		MstCharge charge = (MstCharge)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			charge.setCREATED_DATE(new Date());
			charge.setCREATED_BY_USER_ID(currentUser.getUSER_ID());
			charge.setUPDATED_DATE(new Date());    
			charge.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			charge.setISDELETED(0);
    	} else if(objectType=="Code") {
    		MstCode code = (MstCode)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			code.setCREATED_DATE(new Date());
			code.setCREATED_BY_USER_ID(currentUser.getUSER_ID());
			code.setUPDATED_DATE(new Date());    
			code.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			code.setISDELETED(0);
    	} else if(objectType=="Customer") {
    		MstCustomer customer = (MstCustomer)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			customer.setCREATED_DATE(new Date());
			customer.setCREATED_BY_USER_ID(currentUser.getUSER_ID());
			customer.setUPDATED_DATE(new Date());    
			customer.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			customer.setISDELETED(0);
    	} else if(objectType=="CustomerMember") {
    		
    	} else if(objectType=="CustomerTime") {
    		MstCustomerTime time = (MstCustomerTime)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			time.setCREATED_DATE(new Date());
			time.setCREATED_BY_USER_ID(currentUser.getUSER_ID());
			time.setUPDATED_DATE(new Date());    
			time.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			time.setISDELETED(0);
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
    		MstCalendar calendar = (MstCalendar)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			calendar.setUPDATED_DATE(new Date());    
			calendar.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			calendar.setISDELETED(0);
    	} else if(objectType=="CalendarActivity") {
    		
    	} else if(objectType=="Charge") {
    		MstCharge charge = (MstCharge)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			charge.setUPDATED_DATE(new Date());    
			charge.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			charge.setISDELETED(0);
    	} else if(objectType=="Code") {
    		MstCode code = (MstCode)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			code.setUPDATED_DATE(new Date());    
			code.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			code.setISDELETED(0);
    	} else if(objectType=="Customer") {
    		MstCustomer customer = (MstCustomer)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			customer.setUPDATED_DATE(new Date());    
			customer.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			customer.setISDELETED(0);
    	} else if(objectType=="CustomerMember") {
    		
    	} else if(objectType=="CustomerTime") {
    		MstCustomerTime time = (MstCustomerTime)object;
			MstSecurityUser currentUser = this.getCurrentUser();
			time.setUPDATED_DATE(new Date());    
			time.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
			time.setISDELETED(0);
    	} else if(objectType=="Reservation") {
    		
    	}    	
    	return object;
    }
}
