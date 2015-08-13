package com.innosoft.webreservation.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "WR_CHARGE_COUNT")
public class TrnChargeCount {
	
	@Id
	@GeneratedValue
	@Column(name = "CUNT_ID")
	public Integer CUNT_ID;
	
	@Column(name = "CUNT_TIME_STAMP")
	public Date CUNT_TIME_STAMP;
	
	@Column(name = "CUNT_CUST_ID")
	public Integer CUNT_CUST_ID;
	
	@Column(name = "CUNT_MEBR_ID")
	public Integer CUNT_MEBR_ID;
	
	@Column(name = "CUNT_EMAIL_ADDRESS")
	public String CUNT_EMAIL_ADDRESS;
	
	@Column(name="CREATED_DATE")
	public Date CREATED_DATE;
	
	@Column(name="CREATED_BY_USER_ID")
	public Integer CREATED_BY_USER_ID;
	
	@Column(name="UPDATED_DATE")
	public Date UPDATED_DATE;
	
	@Column(name="UPDATED_BY_USER_ID")
	public Integer UPDATED_BY_USER_ID;
	
	@Column(name="ISDELETED")
	public Integer ISDELETED;
	
	@Column(name="ISDELETED_DATE",nullable = true)
	public Date ISDELETED_DATE;
	
	@Column(name="ISDELETED_BY_USER_ID",nullable = true)
	public Integer ISDELETED_BY_USER_ID;
	
	/* FK -> MstCustomer */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CUNT_CUST_ID", insertable=false, updatable=false)
	public MstCustomer CUNT_CUST_FK;	
	
	/* FK -> MstCustomerMember */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CUNT_MEBR_ID", insertable=false, updatable=false)
	public MstCustomerMember CUNT_MEBR_FK;	
	
	/* FK -> MstSecurityUser Created */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUNT_CREATED_BY_USER_FK;	
	
	/* FK -> MstSecurityUser Updated */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUNT_UPDATED_BY_USER_FK;	
	
	/* ************* */
	/* Setter/Getter */
	/* ************* */		
	
	public Integer getCUNT_ID() {
		return CUNT_ID;
	}

	public void setCUNT_ID(Integer cUNT_ID) {
		CUNT_ID = cUNT_ID;
	}

	public Date getCUNT_TIME_STAMP() {
		return CUNT_TIME_STAMP;
	}

	public void setCUNT_TIME_STAMP(Date cUNT_TIME_STAMP) {
		CUNT_TIME_STAMP = cUNT_TIME_STAMP;
	}

	public Integer getCUNT_CUST_ID() {
		return CUNT_CUST_ID;
	}

	public void setCUNT_CUST_ID(Integer cUNT_CUST_ID) {
		CUNT_CUST_ID = cUNT_CUST_ID;
	}

	public Integer getCUNT_MEBR_ID() {
		return CUNT_MEBR_ID;
	}

	public void setCUNT_MEBR_ID(Integer cUNT_MEBR_ID) {
		CUNT_MEBR_ID = cUNT_MEBR_ID;
	}

	public String getCUNT_EMAIL_ADDRESS() {
		return CUNT_EMAIL_ADDRESS;
	}

	public void setCUNT_EMAIL_ADDRESS(String cUNT_EMAIL_ADDRESS) {
		CUNT_EMAIL_ADDRESS = cUNT_EMAIL_ADDRESS;
	}	
	
	public Date getCREATED_DATE() {
		return CREATED_DATE;
	}

	public void setCREATED_DATE(Date cREATED_DATE) {
		CREATED_DATE = cREATED_DATE;
	}

	public Integer getCREATED_BY_USER_ID() {
		return CREATED_BY_USER_ID;
	}

	public void setCREATED_BY_USER_ID(Integer cREATED_BY_USER_ID) {
		CREATED_BY_USER_ID = cREATED_BY_USER_ID;
	}

	public Date getUPDATED_DATE() {
		return UPDATED_DATE;
	}

	public void setUPDATED_DATE(Date uPDATED_DATE) {
		UPDATED_DATE = uPDATED_DATE;
	}

	public Integer getUPDATED_BY_USER_ID() {
		return UPDATED_BY_USER_ID;
	}

	public void setUPDATED_BY_USER_ID(Integer uPDATED_BY_USER_ID) {
		UPDATED_BY_USER_ID = uPDATED_BY_USER_ID;
	}

	public Integer getISDELETED() {
		return ISDELETED;
	}

	public void setISDELETED(Integer iSDELETED) {
		ISDELETED = iSDELETED;
	}

	public Date getISDELETED_DATE() {
		return ISDELETED_DATE;
	}

	public void setISDELETED_DATE(Date iSDELETED_DATE) {
		ISDELETED_DATE = iSDELETED_DATE;
	}

	public Integer getISDELETED_BY_USER_ID() {
		return ISDELETED_BY_USER_ID;
	}

	public void setISDELETED_BY_USER_ID(Integer iSDELETED_BY_USER_ID) {
		ISDELETED_BY_USER_ID = iSDELETED_BY_USER_ID;
	}	
}
