package com.innosoft.webreservation.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * ORM class for charge count transaction
 */
@Entity
@Table(name = "WR_CHARGE_COUNT")
public class TrnChargeCount {
	/**
	 * CUNT_ID property
	 */
	@Id
	@Column(name = "CUNT_ID")
	public Integer CUNT_ID;
	/**
	 * CUNT_TIME_STAMP property
	 */
	@Column(name = "CUNT_TIME_STAMP")
	public Date CUNT_TIME_STAMP;
	/**
	 * CUNT_CUST_ID property
	 */
	@Column(name = "CUNT_CUST_ID")
	public Integer CUNT_CUST_ID;
	/**
	 * CUNT_MEBR_ID property
	 */
	@Column(name = "CUNT_MEBR_ID")
	public Integer CUNT_MEBR_ID;
	/**
	 * CUNT_RESV_ID property
	 */
	@Column(name = "CUNT_RESV_ID")
	public Integer CUNT_RESV_ID;
	/**
	 * CUNT_EMAIL_ADDRESS property
	 */
	@Column(name = "CUNT_EMAIL_ADDRESS")
	public String CUNT_EMAIL_ADDRESS;
	/**
	 * CREATED_DATE property
	 */
	@Column(name="CREATED_DATE")
	public Date CREATED_DATE;
	/**
	 * CREATED_BY_USER_ID property
	 */
	@Column(name="CREATED_BY_USER_ID")
	public Integer CREATED_BY_USER_ID;
	/**
	 * UPDATED_DATE property
	 */
	@Column(name="UPDATED_DATE")
	public Date UPDATED_DATE;
	/**
	 * CUNUPDATED_BY_USER_IDT_ID property
	 */
	@Column(name="UPDATED_BY_USER_ID")
	public Integer UPDATED_BY_USER_ID;
	/**
	 * ISDELETED property
	 */
	@Column(name="ISDELETED")
	public Integer ISDELETED;
	/**
	 * ISDELETED_DATE property
	 */
	@Column(name="ISDELETED_DATE",nullable = true)
	public Date ISDELETED_DATE;
	/**
	 * ISDELETED_BY_USER_ID property
	 */
	@Column(name="ISDELETED_BY_USER_ID",nullable = true)
	public Integer ISDELETED_BY_USER_ID;
	/**
	 * Foreign key MstCustomer
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CUNT_CUST_ID", insertable=false, updatable=false)
	public MstCustomer CUNT_CUST_FK;	
	/**
	 * Foreign key MstCustomerMember
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CUNT_MEBR_ID", insertable=false, updatable=false)
	public MstCustomerMember CUNT_MEBR_FK;	
	/**
	 * Foreign key MstSecurityUser Create
	 */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUNT_CREATED_BY_USER_FK;	
	/**
	 * Foreign key MstSecurityUser Update
	 */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUNT_UPDATED_BY_USER_FK;	
	
	/**
	 * Get CUNT_ID property
	 * @return
	 */
	public Integer getCUNT_ID() {
		return CUNT_ID;
	}
	/**
	 * Set CUNT_ID property
	 * @param cUNT_ID
	 */
	public void setCUNT_ID(Integer cUNT_ID) {
		CUNT_ID = cUNT_ID;
	}
	/**
	 * Get CUNT_TIME_STAMP property
	 * @return
	 */
	public String getCUNT_TIME_STAMP() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");	
		return sf.format(CUNT_TIME_STAMP);
	}
	/**
	 * Set CUNT_TIME_STAMP property
	 * @param cUNT_TIME_STAMP
	 */
	public void setCUNT_TIME_STAMP(Date cUNT_TIME_STAMP) {
		CUNT_TIME_STAMP = cUNT_TIME_STAMP;
	}
	/**
	 * Get CUNT_CUST_ID property
	 * @return
	 */
	public Integer getCUNT_CUST_ID() {
		return CUNT_CUST_ID;
	}
	/**
	 * Set CUNT_CUST_ID property
	 * @param cUNT_CUST_ID
	 */
	public void setCUNT_CUST_ID(Integer cUNT_CUST_ID) {
		CUNT_CUST_ID = cUNT_CUST_ID;
	}
	/**
	 * Get CUNT_MEBR_ID property
	 * @return
	 */
	public Integer getCUNT_MEBR_ID() {
		return CUNT_MEBR_ID;
	}
	/**
	 * Set CUNT_MEBR_ID property
	 * @param cUNT_MEBR_ID
	 */
	public void setCUNT_MEBR_ID(Integer cUNT_MEBR_ID) {
		CUNT_MEBR_ID = cUNT_MEBR_ID;
	}
	/**
	 * Get CUNT_EMAIL_ADDRESS property
	 * @return
	 */
	public String getCUNT_EMAIL_ADDRESS() {
		return CUNT_EMAIL_ADDRESS;
	}
	/**
	 * Set CUNT_EMAIL_ADDRESS property
	 * @param cUNT_EMAIL_ADDRESS
	 */
	public void setCUNT_EMAIL_ADDRESS(String cUNT_EMAIL_ADDRESS) {
		CUNT_EMAIL_ADDRESS = cUNT_EMAIL_ADDRESS;
	}	
	/**
	 * Get CREATED_DATE property
	 * @return
	 */
	public String getCREATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");		
		return sf.format(CREATED_DATE);
	}
	/**Set CREATED_DATE property
	 * 
	 * @param cREATED_DATE
	 */
	public void setCREATED_DATE(Date cREATED_DATE) {
		CREATED_DATE = cREATED_DATE;
	}
	/**
	 * Get CREATED_BY_USER_ID property
	 * @return
	 */
	public Integer getCREATED_BY_USER_ID() {
		return CREATED_BY_USER_ID;
	}
	/**Set CREATED_BY_USER_ID property
	 * 
	 * @param cREATED_BY_USER_ID
	 */
	public void setCREATED_BY_USER_ID(Integer cREATED_BY_USER_ID) {
		CREATED_BY_USER_ID = cREATED_BY_USER_ID;
	}
	/**
	 * Get UPDATED_DATE property
	 * @return
	 */
	public String getUPDATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");		
		return sf.format(UPDATED_DATE);
	}
	/**
	 * Set UPDATED_DATE property
	 * @param uPDATED_DATE
	 */
	public void setUPDATED_DATE(Date uPDATED_DATE) {
		UPDATED_DATE = uPDATED_DATE;
	}
	/**
	 * Get UPDATED_BY_USER_ID property
	 * @return
	 */
	public Integer getUPDATED_BY_USER_ID() {
		return UPDATED_BY_USER_ID;
	}
	/**
	 * Set UPDATED_BY_USER_ID property
	 * @param uPDATED_BY_USER_ID
	 */
	public void setUPDATED_BY_USER_ID(Integer uPDATED_BY_USER_ID) {
		UPDATED_BY_USER_ID = uPDATED_BY_USER_ID;
	}
	/**
	 * Get ISDELETED property
	 * @return
	 */
	public Integer getISDELETED() {
		return ISDELETED;
	}
	/**
	 * Set ISDELETED property
	 * @param iSDELETED
	 */
	public void setISDELETED(Integer iSDELETED) {
		ISDELETED = iSDELETED;
	}
	/**
	 * Get ISDELETED_DATE property
	 * @return
	 */
	public String getISDELETED_DATE() {
		String result = "";
		if(ISDELETED_DATE != null){
			SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");	
			result = sf.format(ISDELETED_DATE);
		}
		return result;
	}
	/**
	 * Set ISDELETED_DATE property
	 * @param iSDELETED_DATE
	 */
	public void setISDELETED_DATE(Date iSDELETED_DATE) {
		ISDELETED_DATE = iSDELETED_DATE;
	}
	/**
	 * Get ISDELETED_BY_USER_ID property
	 * @return
	 */
	public Integer getISDELETED_BY_USER_ID() {
		return ISDELETED_BY_USER_ID;
	}
	/**
	 * Set ISDELETED_BY_USER_ID property
	 * @param iSDELETED_BY_USER_ID
	 */
	public void setISDELETED_BY_USER_ID(Integer iSDELETED_BY_USER_ID) {
		ISDELETED_BY_USER_ID = iSDELETED_BY_USER_ID;
	}
	/**
	 * Get CUNT_RESV_ID property
	 * 
	 * @return
	 */
	public Integer getCUNT_RESV_ID() {
		return CUNT_RESV_ID;
	}
	/**
	 * Set CUNT_RESV_ID property
	 * 
	 * @param cUNT_RESV_ID
	 */
	public void setCUNT_RESV_ID(Integer cUNT_RESV_ID) {
		CUNT_RESV_ID = cUNT_RESV_ID;
	}
}
