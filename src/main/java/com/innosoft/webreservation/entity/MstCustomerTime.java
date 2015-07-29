package com.innosoft.webreservation.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WR_CUSTOMER_TIME")
public class MstCustomerTime {

	@Id
    @GeneratedValue
    @Column(name="CTIM_ID")	
	public int CTIM_ID;
	
	@Column(name="CTIM_CUST_ID")	
	public int	  CTIM_CUST_ID;
	
	@Column(name="CTIM_DETAILS_NO")	
	public int	  CTIM_DETAILS_NO; 
	
	@Column(name="CTIM_INTERVAL_OF_TIMES")	
	public int	  CTIM_INTERVAL_OF_TIMES;
	
	@Column(name="CTIM_MAX_UNIT_NO")	
	public int	  CTIM_MAX_UNIT_NO;
	
	@Column(name="CTIM_MAX_PARTS_NO")	
	public int	  CTIM_MAX_PARTS_NO;
				
	@Column(name="CREATED_DATE")
	public Date CREATED_DATE;
	
	@Column(name="CREATED_BY_USER_ID")
	public int CREATED_BY_USER_ID;
	
	@Column(name="UPDATED_DATE")
	public Date UPDATED_DATE;
	
	@Column(name="UPDATED_BY_USER_ID")
	public int UPDATED_BY_USER_ID;
	
	@Column(name="ISDELETED")
	public int ISDELETED;
	
	@Column(name="ISDELETED_DATE",nullable = true)
	public Date ISDELETED_DATE;
	
	@Column(name="ISDELETED_BY_USER_ID",nullable = true)
	public Integer ISDELETED_BY_USER_ID;
	
	
	public int getCTIM_ID() {
		return CTIM_ID;
	}

	public void setCTIM_ID(int cTIM_ID) {
		CTIM_ID = cTIM_ID;
	}

	public int getCTIM_CUST_ID() {
		return CTIM_CUST_ID;
	}

	public void setCTIM_CUST_ID(int cTIM_CUST_ID) {
		CTIM_CUST_ID = cTIM_CUST_ID;
	}

	public int getCTIM_DETAILS_NO() {
		return CTIM_DETAILS_NO;
	}

	public void setCTIM_DETAILS_NO(int cTIM_DETAILS_NO) {
		CTIM_DETAILS_NO = cTIM_DETAILS_NO;
	}

	public int getCTIM_INTERVAL_OF_TIMES() {
		return CTIM_INTERVAL_OF_TIMES;
	}

	public void setCTIM_INTERVAL_OF_TIMES(int cTIM_INTERVAL_OF_TIMES) {
		CTIM_INTERVAL_OF_TIMES = cTIM_INTERVAL_OF_TIMES;
	}

	public int getCTIM_MAX_UNIT_NO() {
		return CTIM_MAX_UNIT_NO;
	}

	public void setCTIM_MAX_UNIT_NO(int cTIM_MAX_UNIT_NO) {
		CTIM_MAX_UNIT_NO = cTIM_MAX_UNIT_NO;
	}

	public int getCTIM_MAX_PARTS_NO() {
		return CTIM_MAX_PARTS_NO;
	}

	public void setCTIM_MAX_PARTS_NO(int cTIM_MAX_PARTS_NO) {
		CTIM_MAX_PARTS_NO = cTIM_MAX_PARTS_NO;
	}

	public Date getCREATED_DATE() {
		return CREATED_DATE;
	}

	public void setCREATED_DATE(Date cREATED_DATE) {
		CREATED_DATE = cREATED_DATE;
	}

	public int getCREATED_BY_USER_ID() {
		return CREATED_BY_USER_ID;
	}

	public void setCREATED_BY_USER_ID(int cREATED_BY_USER_ID) {
		CREATED_BY_USER_ID = cREATED_BY_USER_ID;
	}

	public Date getUPDATED_DATE() {
		return UPDATED_DATE;
	}

	public void setUPDATED_DATE(Date uPDATED_DATE) {
		UPDATED_DATE = uPDATED_DATE;
	}

	public int getUPDATED_BY_USER_ID() {
		return UPDATED_BY_USER_ID;
	}

	public void setUPDATED_BY_USER_ID(int uPDATED_BY_USER_ID) {
		UPDATED_BY_USER_ID = uPDATED_BY_USER_ID;
	}

	public int getISDELETED() {
		return ISDELETED;
	}

	public void setISDELETED(int iSDELETED) {
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
