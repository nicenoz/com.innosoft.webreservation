package com.innosoft.webreservation.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WR_SECURITY_USER_ROLE")
public class MstSecurityUserRole {	
	@Id
    @GeneratedValue
    @Column(name="USER_ROLE_ID")	
	private int USER_ROLE_ID;	
	
	@Column(name="USER_ID")
	private Integer USER_ID;
	
	@Column(name="ROLE_ID")
	private Integer ROLE_ID;
	
	/* ************* */
	/* Setter/Getter */
	/* ************* */	
	
	public Integer getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(int uSER_ID) {
		USER_ID = uSER_ID;
	}
	public Integer getROLE_ID() {
		return ROLE_ID;
	}
	public void setROLE_ID(int rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}
	
	public Integer getUSER_ROLE_ID() {
		return USER_ROLE_ID;
	}
	public void setUSER_ROLE_ID(int uSER_ROLE_ID) {
		USER_ROLE_ID = uSER_ROLE_ID;
	}
}
