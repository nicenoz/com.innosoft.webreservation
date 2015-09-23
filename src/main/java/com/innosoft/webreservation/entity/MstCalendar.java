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
 *ORM class for calendar
 */
@Entity
@Table(name="WR_CALENDAR")
public class MstCalendar {
	/**
	 * CLDR_ID property
	 */
	@Id   
    @Column(name="CLDR_ID")
	public Integer CLDR_ID;
	/**
	 * CLDR_DATE property
	 */
	@Column(name="CLDR_DATE")
	public Date CLDR_DATE; 
	/**
	 * CLDR_DAYCODE property
	 */
	@Column(name="CLDR_DAYCODE")	
	public String CLDR_DAYCODE;
	/**
	 * CLDR_NOTE property
	 */
	@Column(name="CLDR_NOTE")	
	public String CLDR_NOTE;
	/**
	 * CREATED_DATE  property
	 * 
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
	 * Foreign key MstSecurityUser created
	 */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CLDR_CREATED_BY_USER_FK;	
	/**
	 * Foreign key MstSecurityUser Updated
	 */
 
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CLDR_UPDATED_BY_USER_FK;	
 
	
	/**
	 * Get CLDR_ID property
	 * @return
	 */
	public Integer getCLDR_ID() {
		return CLDR_ID;
	}
	
	/**
	 * Set CLDR_ID property
	 * @param cLDR_ID
	 */
	public void setCLDR_ID(Integer cLDR_ID) {
		CLDR_ID = cLDR_ID;
	}
	/**
	 * Get CLDR_DATE property
	 * @return
	 */
	public String getCLDR_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(CLDR_DATE);
	}
	/**
	 * Set CLDR_DATE property
	 * @param cLDR_DATE
	 */
	public void setCLDR_DATE(Date cLDR_DATE) {
		CLDR_DATE = cLDR_DATE;
	}
	/**
	 * Get CLDR_DAYCODE property
	 * @return
	 */
	public String getCLDR_DAYCODE() {
		return CLDR_DAYCODE;
	}
	/**
	 * Set CLDR_DAYCODE property
	 * @param cLDR_DAYCODE
	 */
	public void setCLDR_DAYCODE(String cLDR_DAYCODE) {
		CLDR_DAYCODE = cLDR_DAYCODE;
	}
	/**
	 * Get CLDR_NOTE property
	 * @return
	 */
	public String getCLDR_NOTE() {
		return CLDR_NOTE;
	}
	/**
	 * Set CLDR_NOTE property
	 * @param cLDR_NOTE
	 */
	public void setCLDR_NOTE(String cLDR_NOTE) {
		CLDR_NOTE = cLDR_NOTE;
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
	 *  Set CREATED_DATE property
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
	 *  Set CREATED_BY_USER_ID property
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
	 *  Get ISDELETED_DATE property
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
	 * Set ISDELETED_BY_USER_ID property
	 * @param iSDELETED_BY_USER_ID
	 */
	public void setISDELETED_BY_USER_ID(Integer iSDELETED_BY_USER_ID) {
		ISDELETED_BY_USER_ID = iSDELETED_BY_USER_ID;
	}	

}
