package com.innosoft.webreservation.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="WR_MESSAGE")
public class MstMessage {
	@Id
    @GeneratedValue
    @Column(name="MESG_ID")	
	public Integer MESG_ID;
	
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
	
	/* FK -> MstSecurityUser Created */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser MESG_CREATED_BY_USER_FK;	
	
	/* FK -> MstSecurityUser Updated */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser MESG_UPDATED_BY_USER_FK;
	
	/* ************* */
	/* Setter/Getter */
	/* ************* */		
	
	public Integer getMESG_ID() {
		return MESG_ID;
	}

	public void setMESG_ID(Integer mESG_ID) {
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
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(MESG_START_DATE);
	}

	public void setMESG_START_DATE(Date mESG_START_DATE) {
		MESG_START_DATE = mESG_START_DATE;
	}

	public String getMESG_END_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");	
		return sf.format(MESG_END_DATE);
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
}
