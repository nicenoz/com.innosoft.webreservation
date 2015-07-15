package com.innosoft.webreservation.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WR_CUSTOMER")
public class MstCustomer {

	@Id
	@Column(name="CUST_ID")
	public int getCUST_ID() {
		return CUST_ID;
	}
	public void setCUST_ID(int cUST_ID) {
		CUST_ID = cUST_ID;
	}
	@Column(name="CUST_NAME")
	public String getCUST_NAME() {
		return CUST_NAME;
	}
	public void setCUST_NAME(String cUST_NAME) {
		CUST_NAME = cUST_NAME;
	}
	@Column(name="CUST_ADDRESS")
	public String getCUST_ADDRESS() {
		return CUST_ADDRESS;
	}
	public void setCUST_ADDRESS(String cUST_ADDRESS) {
		CUST_ADDRESS = cUST_ADDRESS;
	}
	@Column(name="CUST_PHONENUMBER")
	public String getCUST_PHONENUMBER() {
		return CUST_PHONENUMBER;
	}
	public void setCUST_PHONENUMBER(String cUST_PHONENUMBER) {
		CUST_PHONENUMBER = cUST_PHONENUMBER;
	}
	@Column(name="CUST_ZIPCODE")
	public String getCUST_ZIPCODE() {
		return CUST_ZIPCODE;
	}
	public void setCUST_ZIPCODE(String cUST_ZIPCODE) {
		CUST_ZIPCODE = cUST_ZIPCODE;
	}
	public MstCustomer() {
		super();
	}
	
	private int CUST_ID;
	private String CUST_NAME;
	private String CUST_ADDRESS;
	private String CUST_PHONENUMBER;
	private String CUST_ZIPCODE;
}
