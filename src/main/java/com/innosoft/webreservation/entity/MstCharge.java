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
 * ORM class for charge
 */
@Entity
@Table(name = "WR_CHARGE")
public class MstCharge {
	/**
	 * CHRG_ID property
	 */
	@Id
	@Column(name = "CHRG_ID")
	public Integer CHRG_ID;
	/**
	 * CHRG_CHARGE_NO property
	 */
	@Column(name = "CHRG_CHARGE_NO")
	public String CHRG_CHARGE_NO;
	/**
	 * CHRG_CUST_ID property
	 */
	@Column(name = "CHRG_CUST_ID")
	public Integer CHRG_CUST_ID;
	/**
	 * CHRG_PRICE property
	 */
	@Column(name = "CHRG_PRICE")
	public Integer CHRG_PRICE;
	/**
	 * CHRG_APP_DIVISION property
	 */
	@Column(name = "CHRG_APP_DIVISION")
	public String CHRG_APP_DIVISION;
	
	/**
	 * CHRG_APP_START_DATE property
	 */
	@Column(name = "CHRG_APP_START_DATE")
	public Date CHRG_APP_START_DATE;
	/**
	 * CHRG_APP_END_DATE property
	 */
	@Column(name = "CHRG_APP_END_DATE")
	public Date CHRG_APP_END_DATE;
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
	 * UPDATED_BY_USER_ID property
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
    @JoinColumn(name="CHRG_CUST_ID", insertable=false, updatable=false)
	public MstCustomer CHRG_CUST_FK;	
	
	/**
	/* Foreign key MstSecurityUser Create
	 * FK -> MstSecurityUser Created */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CHRG_CREATED_BY_USER_FK;	
	
	/**
	 * Foreign key MstSecurityUser Update
	 */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CHRG_UPDATED_BY_USER_FK;		

	/**
	 * Get CHRG_ID property
	 * @return
	 */
	public Integer getCHRG_ID() {
		return CHRG_ID;
	}
	/**
	 * Set CHRG_ID property
	 * @param cHRG_ID
	 */
	public void setCHRG_ID(Integer cHRG_ID) {
		CHRG_ID = cHRG_ID;
	}
	/**
	 * Get CHRG_CHARGE_NO property
	 * @return
	 */

	public String getCHRG_CHARGE_NO() {
		return CHRG_CHARGE_NO;
	}
	/**
	 * Set CHRG_CHARGE_NO property
	 * @param cHRG_CHARGE_NO
	 */
	public void setCHRG_CHARGE_NO(String cHRG_CHARGE_NO) {
		CHRG_CHARGE_NO = cHRG_CHARGE_NO;
	}
	/**
	 * Get CHRG_CUST_ID property
	 * @return
	 */
	public Integer getCHRG_CUST_ID() {
		return CHRG_CUST_ID;
	}
	/**
	 * Set CHRG_CUST_ID property
	 * @param cHRG_CUST_ID
	 */
	public void setCHRG_CUST_ID(Integer cHRG_CUST_ID) {
		CHRG_CUST_ID = cHRG_CUST_ID;
	}
	/**
	 * Get CHRG_PRICE property
	 * @return
	 */
	public Integer getCHRG_PRICE() {
		return CHRG_PRICE;
	}
	/**
	 * Set CHRG_PRICE property
	 * @param cHRG_PRICE
	 */
	public void setCHRG_PRICE(Integer cHRG_PRICE) {
		CHRG_PRICE = cHRG_PRICE;
	}
	/**
	 * Get CHRG_APP_DIVISION property
	 * @return
	 */
	public String getCHRG_APP_DIVISION() {
		return CHRG_APP_DIVISION;
	}
	/**
	 * Set CHRG_APP_DIVISION property
	 * @param cHRG_APP_DIVISION
	 */
	public void setCHRG_APP_DIVISION(String cHRG_APP_DIVISION) {
		CHRG_APP_DIVISION = cHRG_APP_DIVISION;
	}
	/**
	 * Get CHRG_APP_START_DATE property
	 * @return
	 */
	public String getCHRG_APP_START_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(CHRG_APP_START_DATE);
	}
	/**
	 * 
	 * Set CHRG_APP_START_DATE property
	 * @param cHRG_APP_START_DATE
	 */
	public void setCHRG_APP_START_DATE(Date cHRG_APP_START_DATE) {
		CHRG_APP_START_DATE = cHRG_APP_START_DATE;
	}
	/**
	 * Get CHRG_APP_START_DATE property
	 * @return
	 */
	public String getCHRG_APP_END_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(CHRG_APP_END_DATE);
	}
	/**
	 * Set CHRG_APP_START_DATE property
	 * @param cHRG_APP_END_DATE
	 */
	public void setCHRG_APP_END_DATE(Date cHRG_APP_END_DATE) {
		CHRG_APP_END_DATE = cHRG_APP_END_DATE;
	}
	/**
	 * Get CREATED_DATE property
	 * @return
	 */
	public String getCREATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(CREATED_DATE);
	}
	/**
	 * Set CREATED_DATE property
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
	/**
	 * Set CREATED_BY_USER_ID property
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
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
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
	public Date getISDELETED_DATE() {
		return ISDELETED_DATE;
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
}
