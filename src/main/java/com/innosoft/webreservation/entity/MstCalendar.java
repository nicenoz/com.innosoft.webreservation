package com.innosoft.webreservation.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WR_CALENDAR")
public class MstCalendar {

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

	public int getCLDR_DAYCODE() {
		return CLDR_DAYCODE;
	}

	public void setCLDR_DAYCODE(int cLDR_DAYCODE) {
		CLDR_DAYCODE = cLDR_DAYCODE;
	}

	public String getCLDR_NOTE() {
		return CLDR_NOTE;
	}

	public void setCLDR_NOTE(String cLDR_NOTE) {
		CLDR_NOTE = cLDR_NOTE;
	}

	@Id
    @GeneratedValue
    @Column(name="CLDR_ID")	
	private int CLDR_ID;
	
	@Column(name="CLDR_DATE")	
	private Date  CLDR_DATE; 
	
	@Column(name="CLDR_DAYCODE")	
	private int  CLDR_DAYCODE;
	
	@Column(name="CLDR_NOTE")	
	private String CLDR_NOTE;

	
}
