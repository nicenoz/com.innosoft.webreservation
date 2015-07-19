package com.innosoft.webreservation.entity;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WR_CHARGE")
public class MstCharge {
	 public int getCHRG_ID() {
		return CHRG_ID;
	}
	public void setCHRG_ID(int cHRG_ID) {
		CHRG_ID = cHRG_ID;
	}
	public String getCHRG_CHARGE_NO() {
		return CHRG_CHARGE_NO;
	}
	public void setCHRG_CHARGE_NO(String cHRG_CHARGE_NO) {
		CHRG_CHARGE_NO = cHRG_CHARGE_NO;
	}
	public int getCHRG_CUST_ID() {
		return CHRG_CUST_ID;
	}
	public void setCHRG_CUST_ID(int cHRG_CUST_ID) {
		CHRG_CUST_ID = cHRG_CUST_ID;
	}
	public int getCHRG_PRICE() {
		return CHRG_PRICE;
	}
	public void setCHRG_PRICE(int cHRG_PRICE) {
		CHRG_PRICE = cHRG_PRICE;
	}
	public String getCHRG_APP_DIVISION() {
		return CHRG_APP_DIVISION;
	}
	public void setCHRG_APP_DIVISION(String cHRG_APP_DIVISION) {
		CHRG_APP_DIVISION = cHRG_APP_DIVISION;
	}
	public Date getCHRG_APP_START_DATE() {
		return CHRG_APP_START_DATE;
	}
	public void setCHRG_APP_START_DATE(Date cHRG_APP_START_DATE) {
		CHRG_APP_START_DATE = cHRG_APP_START_DATE;
	}
	public Date getCHRG_APP_END_DATE() {
		return CHRG_APP_END_DATE;
	}
	public void setCHRG_APP_END_DATE(Date cHRG_APP_END_DATE) {
		CHRG_APP_END_DATE = cHRG_APP_END_DATE;
	}
	@Id
     @GeneratedValue
     @Column(name="CHRG_ID")	
	  private int CHRG_ID;
	  @Column(name="CHRG_CHARGE_NO")
	  private String CHRG_CHARGE_NO; 
	  @Column(name="CHRG_CUST_ID")
	  private int CHRG_CUST_ID;
	  @Column(name="CHRG_PRICE")
	  private int CHRG_PRICE; 
	  @Column(name="CHRG_APP_DIVISION")
	  private String CHRG_APP_DIVISION;
	  @Column(name="CHRG_APP_START_DATE")
	  private Date CHRG_APP_START_DATE;
	  @Column(name="CHRG_APP_END_DATE")
	  private Date CHRG_APP_END_DATE;
	

}
