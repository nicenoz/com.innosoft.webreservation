package com.innosoft.webreservation.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="WR_CODE")
public class MstCode {
	
	@Id
    @GeneratedValue
    @Column(name="CODE_ID")		
	public Integer CODE_ID;  
	
	@Column(name="CODE_KIND_CODE")	
	public String CODE_KIND_CODE;
	
	@Column(name="CODE_CODE_VALUE")	
	public String CODE_CODE_VALUE;
	
	@Column(name="CODE_TEXT")	
	public String CODE_TEXT;
	
	@Column(name="CODE_ISDISPLAY")	
	public Integer CODE_ISDISPLAY;
	
	@Column(name="CODE_NOTE")	
	public String CODE_NOTE; 
	
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
	
	
	public Integer getCODE_ID() {
		return CODE_ID;
	}

	public void setCODE_ID(Integer cODE_ID) {
		CODE_ID = cODE_ID;
	}

	public String getCODE_KIND_CODE() {
		return CODE_KIND_CODE;
	}

	public void setCODE_KIND_CODE(String cODE_KIND_CODE) {
		CODE_KIND_CODE = cODE_KIND_CODE;
	}

	public String getCODE_CODE_VALUE() {
		return CODE_CODE_VALUE;
	}

	public void setCODE_CODE_VALUE(String cODE_CODE_VALUE) {
		CODE_CODE_VALUE = cODE_CODE_VALUE;
	}

	public String getCODE_TEXT() {
		return CODE_TEXT;
	}

	public void setCODE_TEXT(String cODE_TEXT) {
		CODE_TEXT = cODE_TEXT;
	}

	public Integer getCODE_ISDISPLAY() {
		return CODE_ISDISPLAY;
	}

	public void setCODE_ISDISPLAY(Integer cODE_ISDISPLAY) {
		CODE_ISDISPLAY = cODE_ISDISPLAY;
	}

	public String getCODE_NOTE() {
		return CODE_NOTE;
	}

	public void setCODE_NOTE(String cODE_NOTE) {
		CODE_NOTE = cODE_NOTE;
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
	
	@ManyToOne
	@JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CODE_CREATED_BY_USER;


	public MstSecurityUser getCODE_CREATED_BY_USER() {
		return CODE_CREATED_BY_USER;
	}

	public void setCODE_CREATED_BY_USER(MstSecurityUser cODE_CREATED_BY_USER) {
		CODE_CREATED_BY_USER = cODE_CREATED_BY_USER;
	}
	
	@ManyToOne
	@JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CODE_UPDATED_BY_USER;


	public MstSecurityUser getCODE_UPDATED_BY_USER() {
		return CODE_UPDATED_BY_USER;
	}

	public void setCODE_UPDATED_BY_USER(MstSecurityUser cODE_UPDATED_BY_USER) {
		CODE_UPDATED_BY_USER = cODE_UPDATED_BY_USER;
	}	
	
}
