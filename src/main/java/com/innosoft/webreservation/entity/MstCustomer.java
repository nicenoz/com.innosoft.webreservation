package com.innosoft.webreservation.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="WR_CUSTOMER")
public class MstCustomer {
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="CUST_ID_SEQ")
    @SequenceGenerator(name="CUST_ID_SEQ", sequenceName="CUST_ID_SEQ", allocationSize=1)
    @Column(name="CUST_ID")	
	public Integer CUST_ID;
	
	@Column(name="CUST_CUSTOMER_NO")	
	public String CUST_CUSTOMER_NO;
	
	@Column(name="CUST_NAME")	
	public String CUST_NAME;
	
	@Column(name="CUST_PHONENO")	
	public String CUST_PHONENO;
	
	@Column(name="CUST_EMAIL")	
	public String CUST_EMAIL;
	
	@Column(name="CUST_ZIPCODE")	
	public String CUST_ZIPCODE;
	
	@Column(name="CUST_ADDRESS1")	
	public String CUST_ADDRESS1;
	
	@Column(name="CUST_ADDRESS2")	
	public String CUST_ADDRESS2;
	
	@Column(name="CUST_ADDRESS3")	
	public String CUST_ADDRESS3;
	
	@Column(name="CUST_ISDELETED")		
	public Integer CUST_ISDELETED;
	
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
	
	/* FK -> MstSecurityUser Created */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUST_CREATED_BY_USER_FK;	
	
	/* FK -> MstSecurityUser Updated */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUST_UPDATED_BY_USER_FK;		

	/* ************* */
	/* Setter/Getter */
	/* ************* */	
	
	public Integer getCUST_ID() {
		return CUST_ID;
	}

	public void setCUST_ID(Integer cUST_ID) {
		CUST_ID = cUST_ID;
	}

	public String getCUST_CUSTOMER_NO() {
		return CUST_CUSTOMER_NO;
	}

	public void setCUST_CUSTOMER_NO(String cUST_CUSTOMER_NO) {
		CUST_CUSTOMER_NO = cUST_CUSTOMER_NO;
	}

	public String getCUST_NAME() {
		return CUST_NAME;
	}

	public void setCUST_NAME(String cUST_NAME) {
		CUST_NAME = cUST_NAME;
	}

	public String getCUST_PHONENO() {
		return CUST_PHONENO;
	}

	public void setCUST_PHONENO(String cUST_PHONENO) {
		CUST_PHONENO = cUST_PHONENO;
	}

	public String getCUST_EMAIL() {
		return CUST_EMAIL;
	}

	public void setCUST_EMAIL(String cUST_EMAIL) {
		CUST_EMAIL = cUST_EMAIL;
	}

	public String getCUST_ZIPCODE() {
		return CUST_ZIPCODE;
	}

	public void setCUST_ZIPCODE(String cUST_ZIPCODE) {
		CUST_ZIPCODE = cUST_ZIPCODE;
	}

	public String getCUST_ADDRESS1() {
		return CUST_ADDRESS1;
	}

	public void setCUST_ADDRESS1(String cUST_ADDRESS1) {
		CUST_ADDRESS1 = cUST_ADDRESS1;
	}

	public String getCUST_ADDRESS2() {
		return CUST_ADDRESS2;
	}

	public void setCUST_ADDRESS2(String cUST_ADDRESS2) {
		CUST_ADDRESS2 = cUST_ADDRESS2;
	}

	public String getCUST_ADDRESS3() {
		return CUST_ADDRESS3;
	}

	public void setCUST_ADDRESS3(String cUST_ADDRESS3) {
		CUST_ADDRESS3 = cUST_ADDRESS3;
	}

	public Integer getCUST_ISDELETED() {
		return CUST_ISDELETED;
	}

	public void setCUST_ISDELETED(Integer cUST_ISDELETED) {
		CUST_ISDELETED = cUST_ISDELETED;
	}

	public String getCREATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
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
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
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

	@ManyToOne
	@JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUST_CREATED_BY_USER;

	public MstSecurityUser getCUST_CREATED_BY_USER() {
		return CUST_CREATED_BY_USER;
	}

	public void setCUST_CREATED_BY_USER(MstSecurityUser cUST_CREATED_BY_USER) {
		CUST_CREATED_BY_USER = cUST_CREATED_BY_USER;
	}
	
	@ManyToOne
	@JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CUST_UPDATED_BY_USER;

	public MstSecurityUser getCUST_UPDATED_BY_USER() {
		return CUST_UPDATED_BY_USER;
	}

	public void setCUST_UPDATED_BY_USER(MstSecurityUser cUST_UPDATED_BY_USER) {
		CUST_UPDATED_BY_USER = cUST_UPDATED_BY_USER;
	}	
}
