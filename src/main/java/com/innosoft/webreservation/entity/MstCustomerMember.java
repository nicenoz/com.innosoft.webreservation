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

import org.hibernate.annotations.Formula;
/**
 * ORM class for customer member (user)
 */
@Entity
@Table(name="WR_CUSTOMER_MEMBER")
public class MstCustomerMember {
	/**
	 * MEBR_ID property
	 */
	@Id
    @Column(name="MEBR_ID")		
	public Integer MEBR_ID; 
	/**
	 * MEBR_CUST_ID property
	 */
	@Column(name="MEBR_CUST_ID")	
	public Integer MEBR_CUST_ID;
	/**
	 * MEBR_CUSTOMER_MEMBER_NO property
	 */
	@Column(name="MEBR_CUSTOMER_MEMBER_NO")	
	public String MEBR_CUSTOMER_MEMBER_NO;
	/**
	 * MEBR_CUSTOMER_MEMBER_NO_INT property
	 */
	@Formula(value="to_number(MEBR_CUSTOMER_MEMBER_NO)")
	private int MEBR_CUSTOMER_MEMBER_NO_INT;
	/**
	 * MEBR_USER_ID property
	 */
	@Column(name="MEBR_USER_ID")	
	public Integer MEBR_USER_ID;
	/**
	 * MEBR_TEL_NO property
	 */
	@Column(name="MEBR_TEL_NO")	
	public String MEBR_TEL_NO;
	/**
	 * MEBR_EMAIL_ADDRESS property
	 */
	@Column(name="MEBR_EMAIL_ADDRESS")	
	public String MEBR_EMAIL_ADDRESS;
	/**
	 * MEBR_FIRST_NAME property
	 */
	@Column(name="MEBR_FIRST_NAME")	
	public String MEBR_FIRST_NAME;
	/**
	 * MEBR_LAST_NAME property
	 */
	@Column(name="MEBR_LAST_NAME")	
	public String MEBR_LAST_NAME;
	/**
	 * MEBR_DATE_OF_BIRTH property
	 */
	@Column(name="MEBR_DATE_OF_BIRTH")	
	public Date MEBR_DATE_OF_BIRTH;
	/**
	 * MEBR_ZIP_CODE property
	 */
	@Column(name="MEBR_ZIP_CODE")	
	public String MEBR_ZIP_CODE;
	/**
	 * MEBR_ADDRESS1 property
	 */
	@Column(name="MEBR_ADDRESS1")	
	public String MEBR_ADDRESS1;
	/**
	 * MEBR_ADDRESS2 property
	 */
	@Column(name="MEBR_ADDRESS2")	
	public String MEBR_ADDRESS2;
	/**
	 * MEBR_ADDRESS3 property
	 */
	@Column(name="MEBR_ADDRESS3")	
	public String MEBR_ADDRESS3;
	/**
	 * MEBR_POINT property
	 */
	@Column(name="MEBR_POINT")	
	public Integer MEBR_POINT;
	/**
	 * MEBR_FIELD1 property
	 */
	@Column(name="MEBR_FIELD1")	
	public String MEBR_FIELD1;
	/**
	 * MEBR_FIELD2 property
	 */
	@Column(name="MEBR_FIELD2")	
	public String MEBR_FIELD2;
	/**
	 * MEBR_FIELD3 property
	 */
	@Column(name="MEBR_FIELD3")	
	public String MEBR_FIELD3;
	/**
	 * MEBR_FIELD4 property
	 */
	@Column(name="MEBR_FIELD4")	
	public String MEBR_FIELD4;
	/**
	 * MEBR_FIELD5 property
	 */
	@Column(name="MEBR_FIELD5")	
	public String MEBR_FIELD5;
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
	@JoinColumn(name="MEBR_CUST_ID", insertable=false, updatable=false)
	public MstCustomer MEBR_CUST_FK;
	
	/**
	 * Foreign key MstSecurityUser User
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="MEBR_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser MEBR_USER_FK;
	
	/**
	 * Foreign key MstSecurityUser Create
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser MEBR_CREATED_BY_USER_FK;
	
	/**
	 * Foreign key MstSecurityUser Update
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser MEBR_UPDATED_BY_USER_FK;
	/**
	 * Get MEBR_ID property
	 * @return
	 */
	public Integer getMEBR_ID() {
		return MEBR_ID;
	}
	/**
	 * Set MEBR_ID property
	 * @param mEBR_ID
	 */
	public void setMEBR_ID(Integer mEBR_ID) {
		MEBR_ID = mEBR_ID;
	}
	/**
	 * Get MEBR_CUST_ID property
	 * @return
	 */
	public Integer getMEBR_CUST_ID() {
		return MEBR_CUST_ID;
	}
	/**
	 * Set MEBR_CUST_ID property
	 * @param mEBR_CUST_ID
	 */
	public void setMEBR_CUST_ID(Integer mEBR_CUST_ID) {
		MEBR_CUST_ID = mEBR_CUST_ID;
	}
	/**
	 * Get MEBR_CUSTOMER_MEMBER_NO property
	 * @return
	 */
	public String getMEBR_CUSTOMER_MEMBER_NO() {
		return MEBR_CUSTOMER_MEMBER_NO;
	}
	/**
	 * Set MEBR_CUSTOMER_MEMBER_NO property
	 * @param mEBR_CUSTOMER_MEMBER_NO
	 */
	public void setMEBR_CUSTOMER_MEMBER_NO(String mEBR_CUSTOMER_MEMBER_NO) {
		MEBR_CUSTOMER_MEMBER_NO = mEBR_CUSTOMER_MEMBER_NO;
	}
	/**
	 * Get MEBR_USER_ID property
	 * @return
	 */
	public Integer getMEBR_USER_ID() {
		return MEBR_USER_ID;
	}
	/**
	 * Set MEBR_USER_ID property
	 * @param mEBR_USER_ID
	 */
	public void setMEBR_USER_ID(Integer mEBR_USER_ID) {
		MEBR_USER_ID = mEBR_USER_ID;
	}
	/**
	 * Get MEBR_TEL_NO property
	 * @return
	 */
	public String getMEBR_TEL_NO() {
		return MEBR_TEL_NO;
	}
	/**
	 * Set MEBR_TEL_NO property
	 * @param mEBR_TEL_NO
	 */
	public void setMEBR_TEL_NO(String mEBR_TEL_NO) {
		MEBR_TEL_NO = mEBR_TEL_NO;
	}
	/**
	 * Get MEBR_EMAIL_ADDRESS property
	 * @return
	 */
	public String getMEBR_EMAIL_ADDRESS() {
		return MEBR_EMAIL_ADDRESS;
	}
	/**
	 * Set MEBR_EMAIL_ADDRESS property
	 * @param mEBR_EMAIL_ADDRESS
	 */
	public void setMEBR_EMAIL_ADDRESS(String mEBR_EMAIL_ADDRESS) {
		MEBR_EMAIL_ADDRESS = mEBR_EMAIL_ADDRESS;
	}
	/**
	 * Get MEBR_FIRST_NAME property
	 * @return
	 */
	public String getMEBR_FIRST_NAME() {
		return MEBR_FIRST_NAME;
	}
	/**Set MEBR_FIRST_NAME property
	 * 
	 * @param mEBR_FIRST_NAME
	 */
	public void setMEBR_FIRST_NAME(String mEBR_FIRST_NAME) {
		MEBR_FIRST_NAME = mEBR_FIRST_NAME;
	}
	/**
	 * Get MEBR_LAST_NAME property
	 * @return
	 */
	public String getMEBR_LAST_NAME() {
		return MEBR_LAST_NAME;
	}
	/**
	 * Set MEBR_LAST_NAME property
	 * @param mEBR_LAST_NAME
	 */
	public void setMEBR_LAST_NAME(String mEBR_LAST_NAME) {
		MEBR_LAST_NAME = mEBR_LAST_NAME;
	}
	/**
	 * Get MEBR_DATE_OF_BIRTH property
	 * @return
	 */
	public String getMEBR_DATE_OF_BIRTH() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		return sf.format(MEBR_DATE_OF_BIRTH);
	}
	/**
	 * Set MEBR_DATE_OF_BIRTH property
	 * @param mEBR_DATE_OF_BIRTH
	 */
	public void setMEBR_DATE_OF_BIRTH(Date mEBR_DATE_OF_BIRTH) {
		MEBR_DATE_OF_BIRTH = mEBR_DATE_OF_BIRTH;
	}
	/**
	 * 
	 * Get MEBR_ZIP_CODE property
	 * @return
	 */
	public String getMEBR_ZIP_CODE() {
		return MEBR_ZIP_CODE;
	}
	/**
	 * Set MEBR_ZIP_CODE property
	 * @param mEBR_ZIP_CODE
	 */
	public void setMEBR_ZIP_CODE(String mEBR_ZIP_CODE) {
		MEBR_ZIP_CODE = mEBR_ZIP_CODE;
	}
	/**
	 * Get MEBR_ADDRESS1 property
	 * @return
	 */
	public String getMEBR_ADDRESS1() {
		return MEBR_ADDRESS1;
	}
	/**
	 * Set MEBR_ADDRESS1 property
	 * @param mEBR_ADDRESS1
	 */
	public void setMEBR_ADDRESS1(String mEBR_ADDRESS1) {
		MEBR_ADDRESS1 = mEBR_ADDRESS1;
	}
	/**
	 * Get MEBR_ADDRESS2 property
	 * @return
	 */
	public String getMEBR_ADDRESS2() {
		return MEBR_ADDRESS2;
	}
	/**
	 * Set MEBR_ADDRESS2 property
	 * @param mEBR_ADDRESS2
	 */
	public void setMEBR_ADDRESS2(String mEBR_ADDRESS2) {
		MEBR_ADDRESS2 = mEBR_ADDRESS2;
	}
	/**
	 * Get MEBR_ADDRESS3 property
	 * @return
	 */
	public String getMEBR_ADDRESS3() {
		return MEBR_ADDRESS3;
	}
	/**
	 * Set MEBR_ADDRESS3 property
	 * @param mEBR_ADDRESS3
	 */
	public void setMEBR_ADDRESS3(String mEBR_ADDRESS3) {
		MEBR_ADDRESS3 = mEBR_ADDRESS3;
	}
	/**
	 * Get MEBR_POINT property
	 * @return
	 */
	public Integer getMEBR_POINT() {
		return MEBR_POINT;
	}
	/**
	 * Set MEBR_POINT property
	 * @param mEBR_POINT
	 */
	public void setMEBR_POINT(Integer mEBR_POINT) {
		MEBR_POINT = mEBR_POINT;
	}
	/**
	 * Get MEBR_FIELD1 property
	 * @return
	 */
	public String getMEBR_FIELD1() {
		return MEBR_FIELD1;
	}
	/**
	 * Set MEBR_FIELD1 property
	 * @param mEBR_FIELD1
	 */
	public void setMEBR_FIELD1(String mEBR_FIELD1) {
		MEBR_FIELD1 = mEBR_FIELD1;
	}
	/**
	 * Get MEBR_FIELD2 property
	 * @return
	 */
	public String getMEBR_FIELD2() {
		return MEBR_FIELD2;
	}
	/**
	 * Set MEBR_FIELD2 property
	 * @param mEBR_FIELD2
	 */
	public void setMEBR_FIELD2(String mEBR_FIELD2) {
		MEBR_FIELD2 = mEBR_FIELD2;
	}
	/**
	 * Get MEBR_FIELD3 property
	 * @return
	 */
	public String getMEBR_FIELD3() {
		return MEBR_FIELD3;
	}
	/**Set MEBR_FIELD3 property
	 * 
	 * @param mEBR_FIELD3
	 */
	public void setMEBR_FIELD3(String mEBR_FIELD3) {
		MEBR_FIELD3 = mEBR_FIELD3;
	}
	/**Get MEBR_FIELD4 property
	 * 
	 * @return
	 */
	public String getMEBR_FIELD4() {
		return MEBR_FIELD4;
	}
	/**
	 * Set MEBR_FIELD4 property
	 * @param mEBR_FIELD4
	 */
	public void setMEBR_FIELD4(String mEBR_FIELD4) {
		MEBR_FIELD4 = mEBR_FIELD4;
	}
	/**
	 * Get MEBR_FIELD5 property
	 * @return
	 */
	public String getMEBR_FIELD5() {
		return MEBR_FIELD5;
	}
	/**
	 * Set MEBR_FIELD5 property
	 * 
	 * @param mEBR_FIELD5
	 */
	public void setMEBR_FIELD5(String mEBR_FIELD5) {
		MEBR_FIELD5 = mEBR_FIELD5;
	}
	/**
	 * Get CREATED_DATE property
	 * @return
	 */
	public String getCREATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");
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
	 * 	Get UPDATED_DATE property
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
	 *  Set ISDELETED_DATE property
	 * 
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
	/** Set ISDELETED_BY_USER_ID property
	 * 
	 * @param iSDELETED_BY_USER_ID
	 */
	public void setISDELETED_BY_USER_ID(Integer iSDELETED_BY_USER_ID) {
		ISDELETED_BY_USER_ID = iSDELETED_BY_USER_ID;
	}
	
	/**
	 * Get MEBR_CUSTOMER_MEMBER_NO_INT property
	 * @return
	 */
	public int getMEBR_CUSTOMER_MEMBER_NO_INT() {
		return MEBR_CUSTOMER_MEMBER_NO_INT;
	}
	/**
	 * Set MEBR_CUSTOMER_MEMBER_NO_INT property
	 * @param mEBR_CUSTOMER_MEMBER_NO_INT
	 */
	public void setMEBR_CUSTOMER_MEMBER_NO_INT(int mEBR_CUSTOMER_MEMBER_NO_INT) {
		MEBR_CUSTOMER_MEMBER_NO_INT = mEBR_CUSTOMER_MEMBER_NO_INT;
	}
}
