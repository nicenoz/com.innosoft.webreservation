package com.innosoft.webreservation.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * ORM class for security user password
 */
@Entity
@Table(name="WR_SECURITY_USER_PASSWORD")
public class MstSecurityUserPassword {	
	/**
	 *  UPWD_ID property
	 */
	@Id
    @Column(name="UPWD_ID")	
	private int UPWD_ID;	
	/**
	 * UPWD_USER_ID property
	 */
	@Column(name="UPWD_USER_ID")
	private Integer UPWD_USER_ID;
	/**
	 * UPWD_PASSWORD property
	 */
	@Column(name="UPWD_PASSWORD")
	private String UPWD_PASSWORD;
	/**
	 * Get UPWD_ID property
	 * @return
	 */
	public int getUPWD_ID() {
		return UPWD_ID;
	}
	/**
	 * Set UPWD_ID property
	 * @param uPWD_ID
	 */
	public void setUPWD_ID(int uPWD_ID) {
		UPWD_ID = uPWD_ID;
	}
	/**
	 * Get UPWD_USER_ID property
	 * @return
	 */
	public Integer getUPWD_USER_ID() {
		return UPWD_USER_ID;
	}
	/**
	 * Set UPWD_USER_ID property
	 * @param uPWD_USER_ID
	 */
	public void setUPWD_USER_ID(Integer uPWD_USER_ID) {
		UPWD_USER_ID = uPWD_USER_ID;
	}
	/**
	 * Get UPWD_PASSWORD property
	 * @return
	 */
	public String getUPWD_PASSWORD() {
		return UPWD_PASSWORD;
	}
	/**
	 * Set UPWD_PASSWORD property
	 * @param uPWD_PASSWORD
	 */
	public void setUPWD_PASSWORD(String uPWD_PASSWORD) {
		UPWD_PASSWORD = uPWD_PASSWORD;
	}	
}
