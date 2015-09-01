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

@Entity
@Table(name="WR_CUSTOMER_MEMBER")
public class MstCustomerMember {
	
	@Id
    @Column(name="MEBR_ID")		
	public Integer MEBR_ID; 
	
	@Column(name="MEBR_CUST_ID")	
	public Integer MEBR_CUST_ID;
	
	@Column(name="MEBR_CUSTOMER_MEMBER_NO")	
	public String MEBR_CUSTOMER_MEMBER_NO;
	
	@Column(name="MEBR_USER_ID")	
	public Integer MEBR_USER_ID;
	
	@Column(name="MEBR_TEL_NO")	
	public String MEBR_TEL_NO;
	
	@Column(name="MEBR_EMAIL_ADDRESS")	
	public String MEBR_EMAIL_ADDRESS;
	
	@Column(name="MEBR_FIRST_NAME")	
	public String MEBR_FIRST_NAME;
	
	@Column(name="MEBR_LAST_NAME")	
	public String MEBR_LAST_NAME;
	
	@Column(name="MEBR_DATE_OF_BIRTH")	
	public Date MEBR_DATE_OF_BIRTH;
	
	@Column(name="MEBR_ZIP_CODE")	
	public String MEBR_ZIP_CODE;
	
	@Column(name="MEBR_ADDRESS1")	
	public String MEBR_ADDRESS1;
	
	@Column(name="MEBR_ADDRESS2")	
	public String MEBR_ADDRESS2;
	
	@Column(name="MEBR_ADDRESS3")	
	public String MEBR_ADDRESS3;
	
	@Column(name="MEBR_POINT")	
	public Integer MEBR_POINT;
	
	@Column(name="MEBR_FIELD1")	
	public String MEBR_FIELD1;
	
	@Column(name="MEBR_FIELD2")	
	public String MEBR_FIELD2;
	
	@Column(name="MEBR_FIELD3")	
	public String MEBR_FIELD3;
	
	@Column(name="MEBR_FIELD4")	
	public String MEBR_FIELD4;
	
	@Column(name="MEBR_FIELD5")	
	public String MEBR_FIELD5;
	
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
	@JoinColumn(name="MEBR_CUST_ID", insertable=false, updatable=false)
	public MstCustomer MEBR_CUST_FK;	
	
	/* FK -> MstSecurityUser User */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="MEBR_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser MEBR_USER_FK;	
	
	/* FK -> MstSecurityUser Created */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser MEBR_CREATED_BY_USER_FK;	
	
	/* FK -> MstSecurityUser Updated */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser MEBR_UPDATED_BY_USER_FK;
	
	/* ************* */
	/* Setter/Getter */
	/* ************* */	
	
	public Integer getMEBR_ID() {
		return MEBR_ID;
	}
	public void setMEBR_ID(Integer mEBR_ID) {
		MEBR_ID = mEBR_ID;
	}
	public Integer getMEBR_CUST_ID() {
		return MEBR_CUST_ID;
	}
	public void setMEBR_CUST_ID(Integer mEBR_CUST_ID) {
		MEBR_CUST_ID = mEBR_CUST_ID;
	}
	public String getMEBR_CUSTOMER_MEMBER_NO() {
		return MEBR_CUSTOMER_MEMBER_NO;
	}
	public void setMEBR_CUSTOMER_MEMBER_NO(String mEBR_CUSTOMER_MEMBER_NO) {
		MEBR_CUSTOMER_MEMBER_NO = mEBR_CUSTOMER_MEMBER_NO;
	}
	public Integer getMEBR_USER_ID() {
		return MEBR_USER_ID;
	}
	public void setMEBR_USER_ID(Integer mEBR_USER_ID) {
		MEBR_USER_ID = mEBR_USER_ID;
	}
	public String getMEBR_TEL_NO() {
		return MEBR_TEL_NO;
	}
	public void setMEBR_TEL_NO(String mEBR_TEL_NO) {
		MEBR_TEL_NO = mEBR_TEL_NO;
	}
	public String getMEBR_EMAIL_ADDRESS() {
		return MEBR_EMAIL_ADDRESS;
	}
	public void setMEBR_EMAIL_ADDRESS(String mEBR_EMAIL_ADDRESS) {
		MEBR_EMAIL_ADDRESS = mEBR_EMAIL_ADDRESS;
	}
	public String getMEBR_FIRST_NAME() {
		return MEBR_FIRST_NAME;
	}
	public void setMEBR_FIRST_NAME(String mEBR_FIRST_NAME) {
		MEBR_FIRST_NAME = mEBR_FIRST_NAME;
	}
	public String getMEBR_LAST_NAME() {
		return MEBR_LAST_NAME;
	}
	public void setMEBR_LAST_NAME(String mEBR_LAST_NAME) {
		MEBR_LAST_NAME = mEBR_LAST_NAME;
	}
	public String getMEBR_DATE_OF_BIRTH() {
		SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");
		return sf.format(MEBR_DATE_OF_BIRTH);
	}
	public void setMEBR_DATE_OF_BIRTH(Date mEBR_DATE_OF_BIRTH) {
		MEBR_DATE_OF_BIRTH = mEBR_DATE_OF_BIRTH;
	}
	public String getMEBR_ZIP_CODE() {
		return MEBR_ZIP_CODE;
	}
	public void setMEBR_ZIP_CODE(String mEBR_ZIP_CODE) {
		MEBR_ZIP_CODE = mEBR_ZIP_CODE;
	}
	public String getMEBR_ADDRESS1() {
		return MEBR_ADDRESS1;
	}
	public void setMEBR_ADDRESS1(String mEBR_ADDRESS1) {
		MEBR_ADDRESS1 = mEBR_ADDRESS1;
	}
	public String getMEBR_ADDRESS2() {
		return MEBR_ADDRESS2;
	}
	public void setMEBR_ADDRESS2(String mEBR_ADDRESS2) {
		MEBR_ADDRESS2 = mEBR_ADDRESS2;
	}
	public String getMEBR_ADDRESS3() {
		return MEBR_ADDRESS3;
	}
	public void setMEBR_ADDRESS3(String mEBR_ADDRESS3) {
		MEBR_ADDRESS3 = mEBR_ADDRESS3;
	}
	public Integer getMEBR_POINT() {
		return MEBR_POINT;
	}
	public void setMEBR_POINT(Integer mEBR_POINT) {
		MEBR_POINT = mEBR_POINT;
	}
	public String getMEBR_FIELD1() {
		return MEBR_FIELD1;
	}
	public void setMEBR_FIELD1(String mEBR_FIELD1) {
		MEBR_FIELD1 = mEBR_FIELD1;
	}
	public String getMEBR_FIELD2() {
		return MEBR_FIELD2;
	}
	public void setMEBR_FIELD2(String mEBR_FIELD2) {
		MEBR_FIELD2 = mEBR_FIELD2;
	}
	public String getMEBR_FIELD3() {
		return MEBR_FIELD3;
	}
	public void setMEBR_FIELD3(String mEBR_FIELD3) {
		MEBR_FIELD3 = mEBR_FIELD3;
	}
	public String getMEBR_FIELD4() {
		return MEBR_FIELD4;
	}
	public void setMEBR_FIELD4(String mEBR_FIELD4) {
		MEBR_FIELD4 = mEBR_FIELD4;
	}
	public String getMEBR_FIELD5() {
		return MEBR_FIELD5;
	}
	public void setMEBR_FIELD5(String mEBR_FIELD5) {
		MEBR_FIELD5 = mEBR_FIELD5;
	}
	public String getCREATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");
		return sf.format(CREATED_DATE);
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
	public String getUPDATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");
		return sf.format(UPDATED_DATE);
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
	public String getISDELETED_DATE() {
		String result = "";
		if(ISDELETED_DATE != null){
			SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");	
			result = sf.format(ISDELETED_DATE);
		}
		return result;
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
