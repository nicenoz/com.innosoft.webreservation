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
 * ORM class for customer
 */
@Entity
@Table(name="WR_CUSTOMER")
public class MstCustomer {
	/**
	 * CUST_ID property
	 */
	@Id
    @Column(name="CUST_ID")	
	public Integer CUST_ID;
	/**
	 * CUST_CUSTOMER_NO property
	 */
	@Column(name="CUST_CUSTOMER_NO")	
	public String CUST_CUSTOMER_NO;
	/**
	 * CUST_NAME property
	 */
	@Column(name="CUST_NAME")	
	public String CUST_NAME;
	/**
	 * CUST_PHONENO property
	 */
	@Column(name="CUST_PHONENO")	
	public String CUST_PHONENO;
	/**
	 * CUST_EMAIL property
	 */
	@Column(name="CUST_EMAIL")	
	public String CUST_EMAIL;
	/**
	 * CUST_ZIPCODE property
	 */
	@Column(name="CUST_ZIPCODE")	
	public String CUST_ZIPCODE;
	/**
	 * CUST_ADDRESS1 property
	 */
	@Column(name="CUST_ADDRESS1")	
	public String CUST_ADDRESS1;
	/**
	 * CUST_ADDRESS2 property
	 */
	@Column(name="CUST_ADDRESS2")	
	public String CUST_ADDRESS2;
	/**
	 *  CUST_ADDRESS3 property
	 */
	@Column(name="CUST_ADDRESS3")	
	public String CUST_ADDRESS3;
	/**
	 *  CUST_ISDELETED property
	 */
	@Column(name="CUST_ISDELETED")		
	public Integer CUST_ISDELETED;
	/**
	 *  CREATED_DATE property
	 */
	@Column(name="CREATED_DATE")
	public Date CREATED_DATE;
	/**
	 *  CREATED_BY_USER_ID property
	 */
	@Column(name="CREATED_BY_USER_ID")
	public Integer CREATED_BY_USER_ID;
	/**
	 *  UPDATED_DATE property
	 */
	@Column(name="UPDATED_DATE")
	public Date UPDATED_DATE;
	/**
	 *  UPDATED_BY_USER_ID property
	 */
	@Column(name="UPDATED_BY_USER_ID")
	public Integer UPDATED_BY_USER_ID;
	/**
	 *  ISDELETED property
	 */
	@Column(name="ISDELETED")
	public Integer ISDELETED;
	/**
	 *  ISDELETED_DATE property
	 */
	@Column(name="ISDELETED_DATE",nullable = true)
	public Date ISDELETED_DATE;
	/**
	 *  ISDELETED_BY_USER_ID property
	 */
	@Column(name="ISDELETED_BY_USER_ID",nullable = true)
	public Integer ISDELETED_BY_USER_ID;
	/**
	 * Foreign key MstSecurityUser Create
	 */

	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUST_CREATED_BY_USER_FK;	
	/**
	 * Foreign key MstSecurityUser Update
	 */

	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUST_UPDATED_BY_USER_FK;		

	/**
	 * Get CUST_ID property
	 * @return
	 */
	public Integer getCUST_ID() {
		return CUST_ID;
	}
	/**
	 * Set CUST_ID property
	 * @param cUST_ID
	 */
	public void setCUST_ID(Integer cUST_ID) {
		CUST_ID = cUST_ID;
	}
	/**
	 * Get CUST_CUSTOMER_NO property
	 * @return
	 */
	public String getCUST_CUSTOMER_NO() {
		return CUST_CUSTOMER_NO;
	}
	/**
	 * Set CUST_CUSTOMER_NO property
	 * @param cUST_CUSTOMER_NO
	 */
	public void setCUST_CUSTOMER_NO(String cUST_CUSTOMER_NO) {
		CUST_CUSTOMER_NO = cUST_CUSTOMER_NO;
	}
	/**
	 *  Get CUST_NAME property
	 * @return
	 */
	public String getCUST_NAME() {
		return CUST_NAME;
	}
	/**
	 * Set CUST_NAME property
	 * @param cUST_NAME
	 */
	public void setCUST_NAME(String cUST_NAME) {
		CUST_NAME = cUST_NAME;
	}
	/**
	 * Get CUST_PHONENO property
	 * @return
	 */
	public String getCUST_PHONENO() {
		return CUST_PHONENO;
	}
	/**
	 * Set CUST_PHONENO property
	 * @param cUST_PHONENO
	 */
	public void setCUST_PHONENO(String cUST_PHONENO) {
		CUST_PHONENO = cUST_PHONENO;
	}
	/**
	 * Get CUST_EMAIL property
	 * @return
	 */
	public String getCUST_EMAIL() {
		return CUST_EMAIL;
	}
	/**
	 * Set CUST_EMAIL property
	 * @param cUST_EMAIL
	 */
	public void setCUST_EMAIL(String cUST_EMAIL) {
		CUST_EMAIL = cUST_EMAIL;
	}
	/**
	 * Get CUST_ZIPCODE property
	 * @return
	 */
	public String getCUST_ZIPCODE() {
		return CUST_ZIPCODE;
	}
	/**
	 * Set CUST_ZIPCODE property
	 * @param cUST_ZIPCODE
	 */
	public void setCUST_ZIPCODE(String cUST_ZIPCODE) {
		CUST_ZIPCODE = cUST_ZIPCODE;
	}
	/**
	 * Get CUST_ADDRESS1 property
	 * @return
	 */
	public String getCUST_ADDRESS1() {
		return CUST_ADDRESS1;
	}
	/**
	 * Set CUST_ADDRESS1 property
	 * @param cUST_ADDRESS1
	 */

	public void setCUST_ADDRESS1(String cUST_ADDRESS1) {
		CUST_ADDRESS1 = cUST_ADDRESS1;
	}
	/**
	 * Get CUST_ADDRESS2 property
	 * @return
	 */
	public String getCUST_ADDRESS2() {
		return CUST_ADDRESS2;
	}
	/**
	 * Set CUST_ADDRESS2 property
	 * @param cUST_ADDRESS2
	 */
	public void setCUST_ADDRESS2(String cUST_ADDRESS2) {
		CUST_ADDRESS2 = cUST_ADDRESS2;
	}
	/**
	 * Get CUST_ADDRESS3 property
	 * @return
	 */
	public String getCUST_ADDRESS3() {
		return CUST_ADDRESS3;
	}
	/**
	 * Set CUST_ADDRESS3 property
	 * @param cUST_ADDRESS3
	 */
	public void setCUST_ADDRESS3(String cUST_ADDRESS3) {
		CUST_ADDRESS3 = cUST_ADDRESS3;
	}
	/**
	 * Get CUST_ISDELETED property
	 * @return
	 */
	public Integer getCUST_ISDELETED() {
		return CUST_ISDELETED;
	}
	/**
	 * Set CUST_ISDELETED property
	 * @param cUST_ISDELETED
	 */
	public void setCUST_ISDELETED(Integer cUST_ISDELETED) {
		CUST_ISDELETED = cUST_ISDELETED;
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
	 *  Set UPDATED_DATE property
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
	/**
	 * MstSecurityUser property
	 */
	@ManyToOne
	@JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUST_CREATED_BY_USER;
	/**
	 * Get CUST_CREATED_BY_USER property
	 * @return
	 */
	public MstSecurityUser getCUST_CREATED_BY_USER() {
		return CUST_CREATED_BY_USER;
	}
	/**
	 * Set CUST_CREATED_BY_USER property
	 * @param cUST_CREATED_BY_USER
	 */
	public void setCUST_CREATED_BY_USER(MstSecurityUser cUST_CREATED_BY_USER) {
		CUST_CREATED_BY_USER = cUST_CREATED_BY_USER;
	}
	/**
	 * MstSecurityUser property
	 */
	@ManyToOne
	@JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUST_UPDATED_BY_USER;
	/**
	 * Get CUST_CREATED_BY_USER property
	 * @return
	 */
	public MstSecurityUser getCUST_UPDATED_BY_USER() {
		return CUST_UPDATED_BY_USER;
	}
	/**
	 * Set CUST_CREATED_BY_USER property
	 * @param cUST_UPDATED_BY_USER
	 */
	public void setCUST_UPDATED_BY_USER(MstSecurityUser cUST_UPDATED_BY_USER) {
		CUST_UPDATED_BY_USER = cUST_UPDATED_BY_USER;
	}	
}
