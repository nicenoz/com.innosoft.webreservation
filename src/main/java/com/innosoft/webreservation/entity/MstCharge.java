package com.innosoft.webreservation.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "WR_CHARGE")
public class MstCharge {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="CHRG_ID_SEQ")
    @SequenceGenerator(name="CHRG_ID_SEQ", sequenceName="CHRG_ID_SEQ", allocationSize=1)
	@Column(name = "CHRG_ID")
	public Integer CHRG_ID;
	
	@Column(name = "CHRG_CHARGE_NO")
	public String CHRG_CHARGE_NO;
	
	@Column(name = "CHRG_CUST_ID")
	public Integer CHRG_CUST_ID;
	
	@Column(name = "CHRG_PRICE")
	public Integer CHRG_PRICE;
	
	@Column(name = "CHRG_APP_DIVISION")
	public String CHRG_APP_DIVISION;
	
	@Column(name = "CHRG_APP_START_DATE")
	public Date CHRG_APP_START_DATE;
	
	@Column(name = "CHRG_APP_END_DATE")
	public Date CHRG_APP_END_DATE;
	
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
    @JoinColumn(name="CHRG_CUST_ID", insertable=false, updatable=false)
	public MstCustomer CHRG_CUST_FK;	
	
	/* FK -> MstSecurityUser Created */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CHRG_CREATED_BY_USER_FK;	
	
	/* FK -> MstSecurityUser Updated */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CHRG_UPDATED_BY_USER_FK;		

	/* ************* */
	/* Setter/Getter */
	/* ************* */	
	
	public Integer getCHRG_ID() {
		return CHRG_ID;
	}

	public void setCHRG_ID(Integer cHRG_ID) {
		CHRG_ID = cHRG_ID;
	}

	public String getCHRG_CHARGE_NO() {
		return CHRG_CHARGE_NO;
	}

	public void setCHRG_CHARGE_NO(String cHRG_CHARGE_NO) {
		CHRG_CHARGE_NO = cHRG_CHARGE_NO;
	}

	public Integer getCHRG_CUST_ID() {
		return CHRG_CUST_ID;
	}

	public void setCHRG_CUST_ID(Integer cHRG_CUST_ID) {
		CHRG_CUST_ID = cHRG_CUST_ID;
	}

	public Integer getCHRG_PRICE() {
		return CHRG_PRICE;
	}

	public void setCHRG_PRICE(Integer cHRG_PRICE) {
		CHRG_PRICE = cHRG_PRICE;
	}

	public String getCHRG_APP_DIVISION() {
		return CHRG_APP_DIVISION;
	}

	public void setCHRG_APP_DIVISION(String cHRG_APP_DIVISION) {
		CHRG_APP_DIVISION = cHRG_APP_DIVISION;
	}

	public String getCHRG_APP_START_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(CHRG_APP_START_DATE);
	}

	public void setCHRG_APP_START_DATE(Date cHRG_APP_START_DATE) {
		CHRG_APP_START_DATE = cHRG_APP_START_DATE;
	}

	public String getCHRG_APP_END_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(CHRG_APP_END_DATE);
	}

	public void setCHRG_APP_END_DATE(Date cHRG_APP_END_DATE) {
		CHRG_APP_END_DATE = cHRG_APP_END_DATE;
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
}
