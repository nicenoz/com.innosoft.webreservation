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
 * ORM class for reservation transaction
 */
@Entity
@Table(name="WR_RESERVATION")
public class TrnReservation {
	/**
	 * RESV_ID property
	 */
	@Id
    @Column(name="RESV_ID")	
	public Integer RESV_ID;
	/**
	 * RESV_CUST_ID property
	 */
	@Column(name="RESV_CUST_ID")
	public Integer RESV_CUST_ID;  
	/**
	 * RESV_MEBR_ID property
	 */
	@Column(name="RESV_MEBR_ID")
	public Integer RESV_MEBR_ID;
	/**
	 * RESV_CACT_ID property
	 */
	@Column(name="RESV_CACT_ID")
	public Integer RESV_CACT_ID;
	/**
	 * RESV_UNIT_NO property
	 */
	@Column(name="RESV_UNIT_NO")
	public Integer RESV_UNIT_NO;
	/**
	 * RESV_PARTS_NO property
	 */
	@Column(name="RESV_PARTS_NO")
	public Integer RESV_PARTS_NO;
	/**
	 * RESV_START_TIME_ID property
	 */
	@Column(name="RESV_START_TIME_ID")
	public Integer RESV_START_TIME_ID;
	/**
	 * RESV_END_TIME_ID property
	 */
	@Column(name="RESV_END_TIME_ID")
	public Integer RESV_END_TIME_ID;
	/**
	 * RESV_NOTE property
	 */
	@Column(name="RESV_NOTE")
	public String RESV_NOTE;
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
	@Column(name="ISDELETED_DATE")	
	public Date ISDELETED_DATE;
	/**
	 * ISDELETED_BY_USER_ID property
	 */
	@Column(name="ISDELETED_BY_USER_ID")	
	public Integer ISDELETED_BY_USER_ID;
	/**
	 * Foreign key MstCustomer
	 */

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="RESV_CUST_ID", insertable=false, updatable=false)
	public MstCustomer RESV_CUST_FK;	
	/**
	 * Foreign key MstCustomerMember
	 */

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="RESV_MEBR_ID", insertable=false, updatable=false)
	public MstCustomerMember RESV_MEBR_FK;	
	/**
	 * Foreign key MstCalendarActivity
	 */

	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="RESV_CACT_ID", insertable=false, updatable=false)
	private MstCalendarActivity RESV_CACT_FK;
	/**
	 * Foreign key MstCustomerTime TimeStart
	 */

	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="RESV_START_TIME_ID", insertable=false, updatable=false)
	public MstCustomerTime RESV_START_TIME_FK;
	/**
	 * Foreign key MstCustomerTime TimeEnd
	 */

	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="RESV_END_TIME_ID", insertable=false, updatable=false)
	public MstCustomerTime RESV_END_TIME_FK;	
	/**
	 * Foreign key MstSecurityUser Create
	 */

	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser RESV_CREATED_BY_USER_FK;	
	/**
	 * Foreign key MstSecurityUser Update
	 */

	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser RESV_UPDATED_BY_USER_FK;		

	/**
	 * Get RESV_ID property
	 * @return
	 */
	public Integer getRESV_ID() {
		return RESV_ID;
	}
	/**
	 * Set rESV_ID  property
	 * @param rESV_ID
	 */
	public void setRESV_ID(Integer rESV_ID) {
		RESV_ID = rESV_ID;
	}
	/**
	 * Get RESV_CUST_ID property
	 * @return
	 */
	public Integer getRESV_CUST_ID() {
		return RESV_CUST_ID;
	}
	/**Set RESV_CUST_ID  property
	 * 
	 * @param rESV_CUST_ID
	 */
	public void setRESV_CUST_ID(Integer rESV_CUST_ID) {
		RESV_CUST_ID = rESV_CUST_ID;
	}
	/**
	 * Get RESV_MEBR_ID property
	 * @return
	 */

	public Integer getRESV_MEBR_ID() {
		return RESV_MEBR_ID;
	}
	/**
	 * Set RESV_MEBR_ID property
	 * @param rESV_MEBR_ID
	 */
	public void setRESV_MEBR_ID(Integer rESV_MEBR_ID) {
		RESV_MEBR_ID = rESV_MEBR_ID;
	}
	/**
	 * Get RESV_CACT_ID property
	 * @return
	 */

	public Integer getRESV_CACT_ID() {
		return RESV_CACT_ID;
	}
	/**
	 * Set RESV_CACT_ID property
	 * @param rESV_CACT_ID
	 */

	public void setRESV_CACT_ID(Integer rESV_CACT_ID) {
		RESV_CACT_ID = rESV_CACT_ID;
	}
	/**
	 * Get RESV_UNIT_NO property
	 * @return
	 */
	public Integer getRESV_UNIT_NO() {
		return RESV_UNIT_NO;
	}
	/**Set RESV_UNIT_NO property
	 * 
	 * @param rESV_UNIT_NO
	 */
	public void setRESV_UNIT_NO(Integer rESV_UNIT_NO) {
		RESV_UNIT_NO = rESV_UNIT_NO;
	}
	/**
	 * Get RESV_PARTS_NO property
	 * @return
	 */
	public Integer getRESV_PARTS_NO() {
		return RESV_PARTS_NO;
	}
	/**Set RESV_PARTS_NO property
	 * 
	 * @param rESV_PARTS_NO
	 */
	public void setRESV_PARTS_NO(Integer rESV_PARTS_NO) {
		RESV_PARTS_NO = rESV_PARTS_NO;
	}
	/**Get RESV_START_TIME_ID property
	 * 
	 * @return
	 */
	public Integer getRESV_START_TIME_ID() {
		return RESV_START_TIME_ID;
	}
	/**Set RESV_START_TIME_ID property
	 * 
	 * @param rESV_START_TIME_ID
	 */
	public void setRESV_START_TIME_ID(Integer rESV_START_TIME_ID) {
		RESV_START_TIME_ID = rESV_START_TIME_ID;
	}
	/**
	 * Get RESV_END_TIME_ID property 
	 * @return
	 */
	public Integer getRESV_END_TIME_ID() {
		return RESV_END_TIME_ID;
	}
	/**Set RESV_END_TIME_ID property
	 * 
	 * @param rESV_END_TIME_ID
	 */
	public void setRESV_END_TIME_ID(Integer rESV_END_TIME_ID) {
		RESV_END_TIME_ID = rESV_END_TIME_ID;
	}
	/**Get RESV_NOTE property
	 * 
	 * @return
	 */
	public String getRESV_NOTE() {
		return RESV_NOTE;
	}
	/**Set RESV_NOTE property
	 * 
	 * @param rESV_NOTE
	 */
	public void setRESV_NOTE(String rESV_NOTE) {
		RESV_NOTE = rESV_NOTE;
	}
	/**
	 * Get CREATED_DATE property
	 * @return
	 */
	public String getCREATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");		
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
		SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");		
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
	/**Get ISDELETED property
	 * 
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
	 * @return
	 */
	public String getISDELETED_DATE() {
		String result = "";
		if(ISDELETED_DATE != null){
			SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");	
			result = sf.format(ISDELETED_DATE);
		}
		return result;
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
