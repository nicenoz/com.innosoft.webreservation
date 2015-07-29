package com.innosoft.webreservation.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="WR_CALENDAR")
public class MstCalendar {

	@Id   
    @GeneratedValue
    @Column(name="CLDR_ID")	
	public int CLDR_ID;
	
	@Column(name="CLDR_DATE")	
	public Date CLDR_DATE; 
	
	@Column(name="CLDR_DAYCODE")	
	public String CLDR_DAYCODE;

	@Column(name="CLDR_NOTE")	
	public String CLDR_NOTE;
	
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
	
	
	
	public int getCLDR_ID() {
		return CLDR_ID;
	}

	public void setCLDR_ID(int cLDR_ID) {
		CLDR_ID = cLDR_ID;
	}

	public Date getCLDR_DATE() {
		return CLDR_DATE;
	}

	public void setCLDR_DATE(Date cLDR_DATE) {
		CLDR_DATE = cLDR_DATE;
	}

	public String getCLDR_DAYCODE() {
		return CLDR_DAYCODE;
	}

	public void setCLDR_DAYCODE(String cLDR_DAYCODE) {
		CLDR_DAYCODE = cLDR_DAYCODE;
	}

	public String getCLDR_NOTE() {
		return CLDR_NOTE;
	}

	public void setCLDR_NOTE(String cLDR_NOTE) {
		CLDR_NOTE = cLDR_NOTE;
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
