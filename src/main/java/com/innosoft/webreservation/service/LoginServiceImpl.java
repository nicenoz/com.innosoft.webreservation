package com.innosoft.webreservation.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.dao.UserDao;
import com.innosoft.webreservation.entity.MstSecurityUser;
 
@Service("loginServiceImpl")
@Transactional(readOnly = true)
public class LoginServiceImpl implements UserDetailsService {
	
	@Autowired
	private UserDao userDao;
	
    public UserDetails loadUserByUsername(String login)
            throws UsernameNotFoundException {

    	MstSecurityUser domainUser = userDao.getUser(login);
        
        boolean accountEnabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
        
        if(domainUser.getUSER_ID()==0) {
        	throw new UsernameNotFoundException("User not found");
        } else {
	        return new User(
	                domainUser.getUSER_LOGIN(), 
	                domainUser.getUSER_PASSWORD(), 
	                accountEnabled, 
	                accountNonExpired, 
	                credentialsNonExpired, 
	                accountNonLocked,
	                getAuthorities(domainUser.getROLES().iterator().next().getROLE_ID())
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
