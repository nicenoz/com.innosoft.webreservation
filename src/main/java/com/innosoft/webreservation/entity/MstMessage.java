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
	public String getMESG_NOTE() {
		return MESG_NOTE;
	}
	public void setMESG_NOTE(String mESG_NOTE) {
		MESG_NOTE = mESG_NOTE;
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
	
	@Column(name="MESG_NOTE")
	public String MESG_NOTE;	
	
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
}
