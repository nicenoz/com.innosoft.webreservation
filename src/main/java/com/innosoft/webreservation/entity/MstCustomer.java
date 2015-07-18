package com.innosoft.webreservation.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WR_CUSTOMER")
public class MstCustomer {
	public int getCUST_ID() {
		return CUST_ID;
	}
	public void setCUST_ID(int cUST_ID) {
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
	public int getCUST_ISDELETED() {
		return CUST_ISDELETED;
	}
	public void setCUST_ISDELETED(int cUST_ISDELETED) {
		CUST_ISDELETED = cUST_ISDELETED;
	}
	@Id
    @GeneratedValue
    @Column(name="CUST_ID")	
	private int CUST_ID;
	@Column(name="CUST_CUSTOMER_NO")	
	private String CUST_CUSTOMER_NO;
	@Column(name="CUST_NAME")	
	private String CUST_NAME;
	@Column(name="CUST_PHONENO")	
	private String CUST_PHONENO;
	@Column(name="CUST_EMAIL")	
	private String CUST_EMAIL;
	@Column(name="CUST_ZIPCODE")	
	private String CUST_ZIPCODE;
	@Column(name="CUST_ADDRESS1")	
	private String CUST_ADDRESS1;
	@Column(name="CUST_ADDRESS2")	
	private String CUST_ADDRESS2;
	@Column(name="CUST_ADDRESS3")	
	private String CUST_ADDRESS3;
	@Column(name="CUST_ISDELETED")		
	private int CUST_ISDELETED;
}
