package com.innosoft.webreservation.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
 




import javax.persistence.Column;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.dao.CustomerMemberDao;
import com.innosoft.webreservation.dao.UserDao;
import com.innosoft.webreservation.entity.MstCustomerMember;
import com.innosoft.webreservation.entity.MstSecurityUser;
import com.innosoft.webreservation.entity.TrnAccessLog;
 
@Service("loginServiceImpl")
@Transactional(readOnly = true)
public class LoginServiceImpl implements UserDetailsService {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CustomerMemberDao customerMemberDao;
	
	@Autowired
	private AccessLogService accessLogService;
	
    public UserDetails loadUserByUsername(String login)
            throws UsernameNotFoundException {

    	MstSecurityUser domainUser = userDao.getUser(login);
    	MstCustomerMember customerMember = customerMemberDao.getMemberByUserId(domainUser.getUSER_ID()).get(0);
        
        boolean accountEnabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
        
        if(domainUser.getUSER_ID()==0) {
        	throw new UsernameNotFoundException("User not found");
        } else {
        	TrnAccessLog accessLog = new TrnAccessLog();
  
        	accessLog.ALOG_CUST_ID = customerMember.getMEBR_CUST_ID();
        	accessLog.ALOG_MEBR_ID = customerMember.getMEBR_ID();
        	accessLog.ALOG_EMAIL_ADDRESS = domainUser.getUSER_LOGIN();
        	accessLog.ALOG_ACCESS_DATE = new Date();
        	accessLog.ALOG_TIME_STAMP = new Date();
        	
        	accessLogService.addAccessLog(accessLog);
        	
	        return new User(
	                domainUser.getUSER_LOGIN(), 
	                domainUser.getUSER_PASSWORD(), 
	                accountEnabled, 
	                accountNonExpired, 
	                credentialsNonExpired, 
	                accountNonLocked,
	                getAuthorities(1)
	        );
        }
    }
     
    public Collection<? extends GrantedAuthority> getAuthorities(int role) {
        List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
        return authList;
    }
     
    public List<String> getRoles(int role) {
 
        List<String> roles = new ArrayList<String>();
 
        if (role == 1) {
            roles.add("ROLE_USER");
            roles.add("ROLE_ADMIN");
        } else if (role == 2) {
            roles.add("ROLE_USER");
        }
        return roles;
    }
     
    public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
         
        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority(role));
        }
        return authorities;
    }

}
