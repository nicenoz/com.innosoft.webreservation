package com.innosoft.webreservation.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * ORM class for access log transaction
 */
@Entity
@Table(name="WR_ACCESS_LOG")
public class TrnAccessLog {
	/**
	 *ALOG_ID property
	 */
	@Id
    @Column(name="ALOG_ID")	
	public Integer ALOG_ID;
	/**
	 *ALOG_TIME_STAMP property
	 */
	@Column(name="ALOG_TIME_STAMP")	
	public Date ALOG_TIME_STAMP;
	/**
	 *ALOG_CUST_ID property
	 */
	@Column(name="ALOG_CUST_ID")	
	public Integer ALOG_CUST_ID;
	/**
	 *ALOG_MEBR_ID property
	 */
	@Column(name="ALOG_MEBR_ID")	
	public Integer ALOG_MEBR_ID;
	/**
	 *ALOG_EMAIL_ADDRESS property
	 */
	@Column(name="ALOG_EMAIL_ADDRESS")	
	public String ALOG_EMAIL_ADDRESS;
	/**
	 *ALOG_ACCESS_DATE property
	 */
	@Column(name="ALOG_ACCESS_DATE")	
	public Date ALOG_ACCESS_DATE;
	
	/**
	 * Foreign key MstCustomer
	 */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="ALOG_CUST_ID", insertable=false, updatable=false)
	public MstCustomer ALOG_CUST_FK;	
	/**
	 * Foreign key MstCustomerMember
	 */
	/* FK -> MstSecurityUser Updated */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="ALOG_MEBR_ID", insertable=false, updatable=false)
	public MstCustomerMember ALOG_MEBR_FK;	
	
	
	/**
	 * Get ALOG_ID property
	 * @return
	 */
	public Integer getALOG_ID() {
		return ALOG_ID;
	}
	/**
	 * Set ALOG_ID property
	 * @param aLOG_ID
	 */
	public void setALOG_ID(Integer aLOG_ID) {
		ALOG_ID = aLOG_ID;
	}
	/**
	 * Get ALOG_TIME_STAMP property
	 * @return
	 */
	public Date getALOG_TIME_STAMP() {
		return ALOG_TIME_STAMP;
	}
	/**
	 * Set ALOG_TIME_STAMP property
	 * @param aLOG_TIME_STAMP
	 */
	public void setALOG_TIME_STAMP(Date aLOG_TIME_STAMP) {
		ALOG_TIME_STAMP = aLOG_TIME_STAMP;
	}
	/**
	 * Get ALOG_CUST_ID property
	 * @return
	 */
	public Integer getALOG_CUST_ID() {
		return ALOG_CUST_ID;
	}
	/**Set ALOG_CUST_ID property
	 * 
	 * @param aLOG_CUST_ID
	 */
	public void setALOG_CUST_ID(Integer aLOG_CUST_ID) {
		ALOG_CUST_ID = aLOG_CUST_ID;
	}
	/**
	 * Get ALOG_MEBR_ID property
	 * @return
	 */
	public Integer getALOG_MEBR_ID() {
		return ALOG_MEBR_ID;
	}
	/**
	 * Set ALOG_MEBR_ID property
	 * @param aLOG_MEBR_ID
	 */
	public void setALOG_MEBR_ID(Integer aLOG_MEBR_ID) {
		ALOG_MEBR_ID = aLOG_MEBR_ID;
	}
	/**
	 * Get ALOG_EMAIL_ADDRESS property
	 * @return
	 */
	public String getALOG_EMAIL_ADDRESS() {
		return ALOG_EMAIL_ADDRESS;
	}
	/**
	 * Set ALOG_EMAIL_ADDRESS property
	 * @param aLOG_EMAIL_ADDRESS
	 */
	public void setALOG_EMAIL_ADDRESS(String aLOG_EMAIL_ADDRESS) {
		ALOG_EMAIL_ADDRESS = aLOG_EMAIL_ADDRESS;
	}
	/**
	 * Get ALOG_ACCESS_DATE property
	 * @return
	 */
	public Date getALOG_ACCESS_DATE() {
		return ALOG_ACCESS_DATE;
	}
	/**
	 * Set ALOG_ACCESS_DATE property
	 * @param aLOG_ACCESS_DATE
	 */
	public void setALOG_ACCESS_DATE(Date aLOG_ACCESS_DATE) {
		ALOG_ACCESS_DATE = aLOG_ACCESS_DATE;
	}	
}
