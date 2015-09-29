package com.innosoft.webreservation.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * ORM class for security user
 */
@Entity
@Table(name="WR_SECURITY_USER")
public class MstSecurityUser {
	/**
	 * USER_ID property
	 */
	@Id
    @Column(name="USER_ID")	
	public Integer USER_ID; 
	/**
	 *USER_LOGIN property
	 */
	@Column(name="USER_LOGIN")
	public String USER_LOGIN;  
	/**
	 *USER_PASSWORD property
	 */
	@Column(name="USER_PASSWORD")
	public String USER_PASSWORD;

	/**
	 * Get USER_ID property
	 * @return
	 */
	public Integer getUSER_ID() {
		return USER_ID;
	}
	/**
	 * Set USER_ID property
	 * @param uSER_ID
	 */
	public void setUSER_ID(int uSER_ID) {
		USER_ID = uSER_ID;
	}
	/**
	 * Get USER_LOGIN property
	 * @return
	 */
	public String getUSER_LOGIN() {
		return USER_LOGIN;
	}
	/**
	 * Set USER_LOGIN property
	 * @param uSER_LOGIN
	 */
	public void setUSER_LOGIN(String uSER_LOGIN) {
		USER_LOGIN = uSER_LOGIN;
	}
	/**
	 * Get USER_PASSWORD property
	 * @return
	 */
	public String getUSER_PASSWORD() {
		return USER_PASSWORD;
	}
	/**
	 * Set USER_PASSWORD property
	 * @param uSER_PASSWORD
	 */
	public void setUSER_PASSWORD(String uSER_PASSWORD) {
		USER_PASSWORD = uSER_PASSWORD;
	}	
	
	@Column(name="USER_ROLES")
	public Integer USER_ROLES;

	public Integer getUSER_ROLES() {
		return USER_ROLES;
	}
	public void setUSER_ROLES(Integer uSER_ROLES) {
		USER_ROLES = uSER_ROLES;
	}
}
