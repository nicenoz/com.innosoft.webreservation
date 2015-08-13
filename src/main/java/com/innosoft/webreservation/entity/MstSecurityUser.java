package com.innosoft.webreservation.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WR_SECURITY_USER")
public class MstSecurityUser {
	@Id
    @GeneratedValue
    @Column(name="USER_ID")	
	public Integer USER_ID; 
	
	@Column(name="USER_LOGIN")
	public String USER_LOGIN;  
	
	@Column(name="USER_PASSWORD")
	public String USER_PASSWORD;
	
	/* ************* */
	/* Setter/Getter */
	/* ************* */	
	
	public Integer getUSER_ID() {
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
}
