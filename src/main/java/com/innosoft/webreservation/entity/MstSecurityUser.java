package com.innosoft.webreservation.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="WR_SECURITY_USER")
public class MstSecurityUser {
	public int getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(int uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getUSER_LOGIN() {
		return USER_LOGIN;
	}

	public void setUSER_LOGIN(String uSER_LOGIN) {
		USER_LOGIN = uSER_LOGIN;
	}

	public String getUSER_PASSWORD() {
		return USER_PASSWORD;
	}

	public void setUSER_PASSWORD(String uSER_PASSWORD) {
		USER_PASSWORD = uSER_PASSWORD;
	}

	@Id
    @GeneratedValue
    @Column(name="USER_ID")	
	private int USER_ID; 
	
	@Column(name="USER_LOGIN")
	private String USER_LOGIN;  
	
	@Column(name="USER_PASSWORD")
	private String USER_PASSWORD;	
	
	public Set<MstSecurityUserRole> getROLES() {
		return ROLES;
	}

	public void setROLES(Set<MstSecurityUserRole> rOLES) {
		ROLES = rOLES;
	}

	@OneToMany(mappedBy="USER")
	private Set<MstSecurityUserRole> ROLES;
}
