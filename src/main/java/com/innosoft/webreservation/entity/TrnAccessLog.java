package com.innosoft.webreservation.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="WR_ACCESS_LOG")
public class TrnAccessLog {
	@Id
    @Column(name="ALOG_ID")	
	public Integer ALOG_ID;
	
	@Column(name="ALOG_TIME_STAMP")	
	public Date ALOG_TIME_STAMP;
	
	@Column(name="ALOG_CUST_ID")	
	public Integer ALOG_CUST_ID;
	
	@Column(name="ALOG_MEBR_ID")	
	public Integer ALOG_MEBR_ID;
	
	@Column(name="ALOG_EMAIL_ADDRESS")	
	public String ALOG_EMAIL_ADDRESS;
	
	@Column(name="ALOG_ACCESS_DATE")	
	public Date ALOG_ACCESS_DATE;
	
	/* FK -> MstSecurityUser Created */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="ALOG_CUST_ID", insertable=false, updatable=false)
	public MstCustomer ALOG_CUST_FK;	
	
	/* FK -> MstSecurityUser Updated */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="ALOG_MEBR_ID", insertable=false, updatable=false)
	public MstCustomerMember ALOG_MEBR_FK;	
	
	/* ************* */
	/* Setter/Getter */
	/* ************* */		
	
	public Integer getALOG_ID() {
		return ALOG_ID;
	}

	public void setALOG_ID(Integer aLOG_ID) {
		ALOG_ID = aLOG_ID;
	}

	public Date getALOG_TIME_STAMP() {
		return ALOG_TIME_STAMP;
	}

	public void setALOG_TIME_STAMP(Date aLOG_TIME_STAMP) {
		ALOG_TIME_STAMP = aLOG_TIME_STAMP;
	}

	public Integer getALOG_CUST_ID() {
		return ALOG_CUST_ID;
	}

	public void setALOG_CUST_ID(Integer aLOG_CUST_ID) {
		ALOG_CUST_ID = aLOG_CUST_ID;
	}

	public Integer getALOG_MEBR_ID() {
		return ALOG_MEBR_ID;
	}

	public void setALOG_MEBR_ID(Integer aLOG_MEBR_ID) {
		ALOG_MEBR_ID = aLOG_MEBR_ID;
	}

	public String getALOG_EMAIL_ADDRESS() {
		return ALOG_EMAIL_ADDRESS;
	}

	public void setALOG_EMAIL_ADDRESS(String aLOG_EMAIL_ADDRESS) {
		ALOG_EMAIL_ADDRESS = aLOG_EMAIL_ADDRESS;
	}

	public Date getALOG_ACCESS_DATE() {
		return ALOG_ACCESS_DATE;
	}

	public void setALOG_ACCESS_DATE(Date aLOG_ACCESS_DATE) {
		ALOG_ACCESS_DATE = aLOG_ACCESS_DATE;
	}	
}
