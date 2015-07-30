package com.innosoft.webreservation.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="WR_SECURITY_USER_ROLE")
public class MstSecurityUserRole {	
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

	@Id
    @GeneratedValue
    @Column(name="USER_ROLE_ID")	
	private int USER_ROLE_ID;	
	
	@Column(name="USER_ID")
	private Integer USER_ID;
	
	@Column(name="ROLE_ID")
	private Integer ROLE_ID;	
	
	public MstSecurityUser getUSER() {
		return USER;
	}
	public void setUSER(MstSecurityUser uSER) {
		USER = uSER;
	}
	public MstSecurityUser getROLE() {
		return ROLE;
	}
	public void setROLE(MstSecurityUser rOLE) {
		ROLE = rOLE;
	}

	@ManyToOne
	@JoinColumn(name="USER_ID", insertable = false, updatable = false)
	private MstSecurityUser USER;
	
	@ManyToOne
	@JoinColumn(name="ROLE_ID", insertable = false, updatable = false)
	private MstSecurityUser ROLE;	
}
