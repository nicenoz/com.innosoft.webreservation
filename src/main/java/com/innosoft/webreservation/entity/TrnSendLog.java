package com.innosoft.webreservation.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="WR_SEND_LOG")
public class TrnSendLog {
	
	@Id
    @GeneratedValue
    @Column(name="SLOG_ID")	
	public Integer SLOG_ID;
	
	@Column(name="SLOG_TIME_STAMP")	
	public Date SLOG_TIME_STAMP;
	
	@Column(name="SLOG_MEBR_ID")	
	public Integer SLOG_MEBR_ID;
	
	@Column(name="SLOG_EMAIL_ADDRESS")	
	public String SLOG_EMAIL_ADDRESS;
	
	@Column(name="SLOG_PURPOSE_DIVISION")	
	public String SLOG_PURPOSE_DIVISION;
		
	
	public Integer getSLOG_ID() {
		return SLOG_ID;
	}

	public void setSLOG_ID(Integer sLOG_ID) {
		SLOG_ID = sLOG_ID;
	}

	public Date getSLOG_TIME_STAMP() {
		return SLOG_TIME_STAMP;
	}

	public void setSLOG_TIME_STAMP(Date sLOG_TIME_STAMP) {
		SLOG_TIME_STAMP = sLOG_TIME_STAMP;
	}

	public Integer getSLOG_MEBR_ID() {
		return SLOG_MEBR_ID;
	}

	public void setSLOG_MEBR_ID(Integer sLOG_MEBR_ID) {
		SLOG_MEBR_ID = sLOG_MEBR_ID;
	}

	public String getSLOG_EMAIL_ADDRESS() {
		return SLOG_EMAIL_ADDRESS;
	}

	public void setSLOG_EMAIL_ADDRESS(String sLOG_EMAIL_ADDRESS) {
		SLOG_EMAIL_ADDRESS = sLOG_EMAIL_ADDRESS;
	}

	public String getSLOG_PURPOSE_DIVISION() {
		return SLOG_PURPOSE_DIVISION;
	}

	public void setSLOG_PURPOSE_DIVISION(String sLOG_PURPOSE_DIVISION) {
		SLOG_PURPOSE_DIVISION = sLOG_PURPOSE_DIVISION;
	}
	
/*	@ManyToOne
	@JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser SLOG_CREATED_BY_USER;

	public MstSecurityUser getSLOG_CREATED_BY_USER() {
		return SLOG_CREATED_BY_USER;
	}

	public void setSLOG_CREATED_BY_USER(MstSecurityUser sLOG_CREATED_BY_USER) {
		SLOG_CREATED_BY_USER = sLOG_CREATED_BY_USER;
	}*/

}
