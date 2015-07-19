package com.innosoft.webreservation.entity;

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
	private int CTIM_ID;
	
	@Column(name="CTIM_CUST_ID")	
	private int	  CTIM_CUST_ID;
	
	@Column(name="CTIM_DETAILS_NO")	
	private int	  CTIM_DETAILS_NO; 
	
	@Column(name="CTIM_INTERVAL_OF_TIMES")	
	private int	  CTIM_INTERVAL_OF_TIMES;
	
	@Column(name="CTIM_MAX_UNIT_NO")	
	private int	  CTIM_MAX_UNIT_NO;
	
	@Column(name="CTIM_MAX_PARTS_NO")	
	private int	  CTIM_MAX_PARTS_NO;
				
	
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
	
}
