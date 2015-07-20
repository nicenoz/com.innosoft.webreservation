package com.innosoft.webreservation.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WR_MESSAGE")
public class MstMessage {
	public int getMESG_ID() {
		return MESG_ID;
	}
	public void setMESG_ID(int mESG_ID) {
		MESG_ID = mESG_ID;
	}
	public String getMESG_CODE() {
		return MESG_CODE;
	}
	public void setMESG_CODE(String mESG_CODE) {
		MESG_CODE = mESG_CODE;
	}
	public String getMESG_LEVEL() {
		return MESG_LEVEL;
	}
	public void setMESG_LEVEL(String mESG_LEVEL) {
		MESG_LEVEL = mESG_LEVEL;
	}
	public String getMESG_START_DATE() {
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		return sd.format(MESG_START_DATE);
	}
	public void setMESG_START_DATE(Date mESG_START_DATE) {
		MESG_START_DATE = mESG_START_DATE;
	}
	public String getMESG_END_DATE() {
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");		
		return sd.format(MESG_END_DATE);
	}
	public void setMESG_END_DATE(Date mESG_END_DATE) {
		MESG_END_DATE = mESG_END_DATE;
	}
	@Id
    @GeneratedValue
    @Column(name="MESG_ID")	
	public int MESG_ID;
	
	@Column(name="MESG_CODE")
	public String MESG_CODE;
	
	@Column(name="MESG_LEVEL")
	public String MESG_LEVEL;
	
	@Column(name="MESG_START_DATE")
	public Date MESG_START_DATE;
	
	@Column(name="MESG_END_DATE")
	public Date MESG_END_DATE;
}
