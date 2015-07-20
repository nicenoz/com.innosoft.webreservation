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
	
	
	
	public int getCLDR_ID() {
		return CLDR_ID;
	}

	public void setCLDR_ID(int cLDR_ID) {
		CLDR_ID = cLDR_ID;
	}

	public String getCLDR_DATE() {
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");		
		return sd.format(CLDR_DATE);		
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

}
