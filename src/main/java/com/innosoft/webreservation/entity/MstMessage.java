package com.innosoft.webreservation.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * ORM class for message
 */
@Entity
@Table(name="WR_MESSAGE")
public class MstMessage {
	/**
	 * MESG_ID property
	 */
	@Id
    @Column(name="MESG_ID")	
	public Integer MESG_ID;
	/**
	 * MESG_CODE property
	 */
	@Column(name="MESG_CODE")
	public String MESG_CODE;
	/**
	 * MESG_LEVEL property
	 */
	@Column(name="MESG_LEVEL")
	public String MESG_LEVEL;
	/**
	 * MESG_START_DATE property
	 */
	@Column(name="MESG_START_DATE")
	public Date MESG_START_DATE;
	/**
	 * MESG_END_DATE property
	 */
	@Column(name="MESG_END_DATE")
	public Date MESG_END_DATE;
	/**
	 * MESG_NOTE property
	 */
	@Column(name="MESG_NOTE")
	public String MESG_NOTE;		
	/**
	 * CREATED_DATE property
	 */
	@Column(name="CREATED_DATE")
	public Date CREATED_DATE;
	/**
	 * CREATED_BY_USER_ID property
	 */
	@Column(name="CREATED_BY_USER_ID")
	public Integer CREATED_BY_USER_ID;
	/**
	 * UPDATED_DATE property
	 */
	@Column(name="UPDATED_DATE")
	public Date UPDATED_DATE;
	/**
	 * UPDATED_BY_USER_ID property
	 */
	@Column(name="UPDATED_BY_USER_ID")
	public Integer UPDATED_BY_USER_ID;
	/**
	 * ISDELETED property
	 */
	@Column(name="ISDELETED")
	public Integer ISDELETED;
	/**
	 * ISDELETED_DATE property
	 */
	@Column(name="ISDELETED_DATE",nullable = true)
	public Date ISDELETED_DATE;
	/**
	 * ISDELETED_BY_USER_ID property
	 */
	@Column(name="ISDELETED_BY_USER_ID",nullable = true)
	public Integer ISDELETED_BY_USER_ID;
	
	/**
	 * Foreign key MstSecurityUser Create
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser MESG_CREATED_BY_USER_FK;	
	
	/**
	 * Foreign key MstSecurityUser Update
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser MESG_UPDATED_BY_USER_FK;
	
	/**
	 * Get MESG_ID property
	 * @return
	 */
	public Integer getMESG_ID() {
		return MESG_ID;
	}
	/**
	 * Set MESG_ID property
	 * @param mESG_ID
	 */
	public void setMESG_ID(Integer mESG_ID) {
		MESG_ID = mESG_ID;
	}
	/**
	 * Get MESG_CODE property
	 * @return
	 */
	public String getMESG_CODE() {
		return MESG_CODE;
	}
	/**
	 * Set MESG_CODE property
	 * @param mESG_CODE
	 */
	public void setMESG_CODE(String mESG_CODE) {
		MESG_CODE = mESG_CODE;
	}
	/**
	 * Get MESG_LEVEL property
	 * @return
	 */
	public String getMESG_LEVEL() {
		return MESG_LEVEL;
	}
	/**
	 * Set MESG_LEVEL property
	 * @param mESG_LEVEL
	 */
	public void setMESG_LEVEL(String mESG_LEVEL) {
		MESG_LEVEL = mESG_LEVEL;
	}
	/**
	 * Get MESG_START_DATE property
	 * @return
	 */

	public String getMESG_START_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(MESG_START_DATE);
	}
	/**
	 * Set MESG_START_DATE property
	 * @param mESG_START_DATE
	 */
	public void setMESG_START_DATE(Date mESG_START_DATE) {
		MESG_START_DATE = mESG_START_DATE;
	}
	/**
	 * Get MESG_END_DATE property
	 * @return
	 */
	public String getMESG_END_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");	
		return sf.format(MESG_END_DATE);
	}
	/**
	 * Set MESG_END_DATE property
	 * @param mESG_END_DATE
	 */
	public void setMESG_END_DATE(Date mESG_END_DATE) {
		MESG_END_DATE = mESG_END_DATE;
	}
	/**
	 * Get MESG_NOTE property
	 * @return
	 */

	public String getMESG_NOTE() {
		return MESG_NOTE;
	}
	/**
	 * Set MESG_NOTE property
	 * @param mESG_NOTE
	 */
	public void setMESG_NOTE(String mESG_NOTE) {
		MESG_NOTE = mESG_NOTE;
	}
	/**
	 * Get CREATED_DATE property
	 * @return
	 */
	public String getCREATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(CREATED_DATE);
	}
	/**
	 * Set CREATED_DATE property
	 * @param cREATED_DATE
	 */
	public void setCREATED_DATE(Date cREATED_DATE) {
		CREATED_DATE = cREATED_DATE;
	}
	/**
	 * Get CREATED_BY_USER_ID property
	 * @return
	 */
	public Integer getCREATED_BY_USER_ID() {
		return CREATED_BY_USER_ID;
	}
	/**
	 * Set CREATED_BY_USER_ID property
	 * @param cREATED_BY_USER_ID
	 */
	public void setCREATED_BY_USER_ID(Integer cREATED_BY_USER_ID) {
		CREATED_BY_USER_ID = cREATED_BY_USER_ID;
	}
	/**
	 * Get UPDATED_DATE property
	 * @return
	 */
	public String getUPDATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(UPDATED_DATE);
	}
	/**
	 * Set UPDATED_DATE property
	 * @param uPDATED_DATE
	 */
	public void setUPDATED_DATE(Date uPDATED_DATE) {
		UPDATED_DATE = uPDATED_DATE;
	}
	/**
	 * Get UPDATED_BY_USER_ID property
	 * @return
	 */
	public Integer getUPDATED_BY_USER_ID() {
		return UPDATED_BY_USER_ID;
	}
	/**
	 * Set UPDATED_BY_USER_ID property
	 * @param uPDATED_BY_USER_ID
	 */
	public void setUPDATED_BY_USER_ID(Integer uPDATED_BY_USER_ID) {
		UPDATED_BY_USER_ID = uPDATED_BY_USER_ID;
	}
	/**
	 * Get ISDELETED property
	 * @return
	 */
	public Integer getISDELETED() {
		return ISDELETED;
	}
	/**
	 * Set ISDELETED property
	 * @param iSDELETED
	 */
	public void setISDELETED(Integer iSDELETED) {
		ISDELETED = iSDELETED;
	}
}
