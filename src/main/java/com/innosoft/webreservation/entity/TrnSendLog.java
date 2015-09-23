package com.innosoft.webreservation.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * ORM class for send log transaction
 */
@Entity
@Table(name="WR_SEND_LOG")
public class TrnSendLog {
	/**
	 *SLOG_ID property
	 */
	@Id
    @Column(name="SLOG_ID")	
	public Integer SLOG_ID;
	/**
	 *SLOG_TIME_STAMP property
	 */
	@Column(name="SLOG_TIME_STAMP")	
	public Date SLOG_TIME_STAMP;
	/**
	 *SLOG_MEBR_ID property
	 */
	@Column(name="SLOG_MEBR_ID")	
	public Integer SLOG_MEBR_ID;
	/**
	 *SLOG_EMAIL_ADDRESS property
	 */
	@Column(name="SLOG_EMAIL_ADDRESS")	
	public String SLOG_EMAIL_ADDRESS;
	/**
	 *SLOG_PURPOSE_DIVISION property
	 */
	@Column(name="SLOG_PURPOSE_DIVISION")	
	public String SLOG_PURPOSE_DIVISION;
	/**
	 * Foreign key MstCustomerMember
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="SLOG_MEBR_ID", insertable=false, updatable=false)
	public MstCustomerMember SLOG_MEBR_FK;	

	/**
	 * Get SLOG_ID property
	 * @return
	 */
	public Integer getSLOG_ID() {
		return SLOG_ID;
	}
	/**
	 * Set SLOG_ID property
	 * @param sLOG_ID
	 */
	public void setSLOG_ID(Integer sLOG_ID) {
		SLOG_ID = sLOG_ID;
	}
	/**
	 * Get SLOG_TIME_STAMP property
	 * @return
	 */
	public Date getSLOG_TIME_STAMP() {
		return SLOG_TIME_STAMP;
	}
	/**
	 * Set SLOG_TIME_STAMP property
	 * @param sLOG_TIME_STAMP
	 */
	public void setSLOG_TIME_STAMP(Date sLOG_TIME_STAMP) {
		SLOG_TIME_STAMP = sLOG_TIME_STAMP;
	}
	/**
	 * Get SLOG_MEBR_ID property
	 * @return
	 */
	public Integer getSLOG_MEBR_ID() {
		return SLOG_MEBR_ID;
	}
	/**
	 * Set SLOG_MEBR_ID property
	 * @param sLOG_MEBR_ID
	 */
	public void setSLOG_MEBR_ID(Integer sLOG_MEBR_ID) {
		SLOG_MEBR_ID = sLOG_MEBR_ID;
	}
	/**
	 * Get SLOG_EMAIL_ADDRESS property
	 * @return
	 */
	public String getSLOG_EMAIL_ADDRESS() {
		return SLOG_EMAIL_ADDRESS;
	}
	/**
	 * Set SLOG_EMAIL_ADDRESS property
	 * @param sLOG_EMAIL_ADDRESS
	 */
	public void setSLOG_EMAIL_ADDRESS(String sLOG_EMAIL_ADDRESS) {
		SLOG_EMAIL_ADDRESS = sLOG_EMAIL_ADDRESS;
	}
	/**
	 * Get SLOG_PURPOSE_DIVISION property
	 * @return
	 */
	public String getSLOG_PURPOSE_DIVISION() {
		return SLOG_PURPOSE_DIVISION;
	}
	/**
	 * Set SLOG_PURPOSE_DIVISION property
	 * @param sLOG_PURPOSE_DIVISION
	 */
	public void setSLOG_PURPOSE_DIVISION(String sLOG_PURPOSE_DIVISION) {
		SLOG_PURPOSE_DIVISION = sLOG_PURPOSE_DIVISION;
	}
}
