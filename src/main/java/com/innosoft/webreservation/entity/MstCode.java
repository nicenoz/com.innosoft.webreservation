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
 * ORM class for code
 */
@Entity
@Table(name="WR_CODE")
public class MstCode {
	/**
	 *  CODE_ID property
	 */
	@Id
    @Column(name="CODE_ID")		
	public Integer CODE_ID;  
	/**
	 * CODE_KIND_CODE property
	 */
	@Column(name="CODE_KIND_CODE")	
	public String CODE_KIND_CODE;
	/**
	 * CODE_CODE_VALUE property
	 */
	@Column(name="CODE_CODE_VALUE")	
	public String CODE_CODE_VALUE;
	/**
	 * CODE_TEXT property
	 */
	@Column(name="CODE_TEXT")	
	public String CODE_TEXT;
	/**
	 * CODE_ISDISPLAY property
	 */
	@Column(name="CODE_ISDISPLAY")	
	public Integer CODE_ISDISPLAY;
	/**
	 * CODE_NOTE property
	 */
	@Column(name="CODE_NOTE")	
	public String CODE_NOTE; 
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
	/**ISDELETED_DATE property
	 * 
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
	public MstSecurityUser CODE_CREATED_BY_USER_FK;	
	
	/**
	 * Foreign key MstSecurityUser Update
	 */

	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CODE_UPDATED_BY_USER_FK;		
	
	
	/**
	 * Get CODE_ID property
	 * @return
	 */
	public Integer getCODE_ID() {
		return CODE_ID;
	}
	/**
	 * Set CODE_ID property
	 * @param cODE_ID
	 */
	public void setCODE_ID(Integer cODE_ID) {
		CODE_ID = cODE_ID;
	}

	/**
	 * Get CODE_KIND_CODE property
	 * 
	 * @return
	 */
	public String getCODE_KIND_CODE() {
		return CODE_KIND_CODE;
	}
	
	/**
	 * Set CODE_KIND_CODE property
	 * @param cODE_KIND_CODE
	 */

	public void setCODE_KIND_CODE(String cODE_KIND_CODE) {
		CODE_KIND_CODE = cODE_KIND_CODE;
	}

	/**
	 * Get CODE_CODE_VALUE property
	 * @return
	 */
	public String getCODE_CODE_VALUE() {
		return CODE_CODE_VALUE;
	}

	/**
	 *  Set CODE_CODE_VALUE property
	 * @param cODE_CODE_VALUE
	 */
	public void setCODE_CODE_VALUE(String cODE_CODE_VALUE) {
		CODE_CODE_VALUE = cODE_CODE_VALUE;
	}

	/**
	 * Get CODE_TEXT property
	 * @return
	 */
	public String getCODE_TEXT() {
		return CODE_TEXT;
	}

	/**
	 * Set CODE_TEXT property
	 * @param cODE_TEXT
	 */
	public void setCODE_TEXT(String cODE_TEXT) {
		CODE_TEXT = cODE_TEXT;
	}

	/**
	 * Get CODE_ISDISPLAY property
	 * @return
	 */
	public Integer getCODE_ISDISPLAY() {
		return CODE_ISDISPLAY;
	}

	/**
	 * Set CODE_ISDISPLAY property
	 * @param cODE_ISDISPLAY
	 */
	public void setCODE_ISDISPLAY(Integer cODE_ISDISPLAY) {
		CODE_ISDISPLAY = cODE_ISDISPLAY;
	}
	
	/**
	 * Get CODE_NOTE property
	 * @return
	 */
	public String getCODE_NOTE() {
		return CODE_NOTE;
	}
	/**
	 * Set CODE_NOTE property
	 * @param cODE_NOTE
	 */
	public void setCODE_NOTE(String cODE_NOTE) {
		CODE_NOTE = cODE_NOTE;
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
	/**
	 * Get ISDELETED_DATE property
	 * 
	 * @return
	 */
	public Date getISDELETED_DATE() {
		return ISDELETED_DATE;
	}
	/**
	 * Set ISDELETED_DATE property
	 * @param iSDELETED_DATE
	 */
	public void setISDELETED_DATE(Date iSDELETED_DATE) {
		ISDELETED_DATE = iSDELETED_DATE;
	}
	/**
	 * Get ISDELETED_BY_USER_ID property
	 * @return
	 */
	public Integer getISDELETED_BY_USER_ID() {
		return ISDELETED_BY_USER_ID;
	}
	/**
	 * Set iSDELETED_BY_USER_ID property
	 * @param iSDELETED_BY_USER_ID
	 */
	public void setISDELETED_BY_USER_ID(Integer iSDELETED_BY_USER_ID) {
		ISDELETED_BY_USER_ID = iSDELETED_BY_USER_ID;
	}
}
