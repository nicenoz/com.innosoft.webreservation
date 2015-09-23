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

import org.hibernate.annotations.Formula;
/**
 * ORM class for customer time
 */
@Entity
@Table(name="WR_CUSTOMER_TIME")
public class MstCustomerTime {
	/**
	 * CTIM_ID property
	 */
	@Id
    @Column(name="CTIM_ID")	
	public Integer CTIM_ID;
	/**
	 * CTIM_CUST_ID property
	 */
	@Column(name="CTIM_CUST_ID")	
	public Integer CTIM_CUST_ID;
	/**
	 * CTIM_DETAILS_NO property
	 */
	@Column(name="CTIM_DETAILS_NO")	
	public Integer CTIM_DETAILS_NO; 
	/**
	 * CTIM_DETAILS_NO_INT property
	 */
	//FOR SORTING
	@Formula(value="to_number(CTIM_DETAILS_NO)")
	private int CTIM_DETAILS_NO_INT;
	/**
	 * CTIM_INTERVAL_OF_TIMES property
	 */
	@Column(name="CTIM_INTERVAL_OF_TIMES")	
	public Integer CTIM_INTERVAL_OF_TIMES;
	/**
	 * CTIM_MAX_UNIT_NO property
	 */
	@Column(name="CTIM_MAX_UNIT_NO")	
	public Integer CTIM_MAX_UNIT_NO;
	/**
	 * CTIM_MAX_PARTS_NO property
	 */
	@Column(name="CTIM_MAX_PARTS_NO")	
	public Integer CTIM_MAX_PARTS_NO;
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
	 * CTIM_CUST_FK property
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CTIM_CUST_ID", insertable=false, updatable=false)
	public MstCustomer CTIM_CUST_FK;	
	
	/**
	 * Foreign Key MstSecurityUser Create
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CTIM_CREATED_BY_USER_FK;	
	
	/**
	 * Foreign Key MstSecurityUser Update
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CTIM_UPDATED_BY_USER_FK;

	/**
	 * Get CTIM_ID property
	 * @return
	 */
	public Integer getCTIM_ID() {
		return CTIM_ID;
	}
	/**
	 * Set CTIM_ID property
	 * @param cTIM_ID
	 */
	public void setCTIM_ID(Integer cTIM_ID) {
		CTIM_ID = cTIM_ID;
	}
	/**
	 * Get CTIM_CUST_ID property
	 * @return
	 */
	public Integer getCTIM_CUST_ID() {
		return CTIM_CUST_ID;
	}
	/**
	 * Set CTIM_CUST_ID property
	 * @param cTIM_CUST_ID
	 */

	public void setCTIM_CUST_ID(Integer cTIM_CUST_ID) {
		CTIM_CUST_ID = cTIM_CUST_ID;
	}
	/**
	 * Get CTIM_DETAILS_NO property
	 * @return
	 */
	public Integer getCTIM_DETAILS_NO() {
		return CTIM_DETAILS_NO;
	}
	/**
	 * Set CTIM_DETAILS_NO property
	 * @param cTIM_DETAILS_NO
	 */
	public void setCTIM_DETAILS_NO(Integer cTIM_DETAILS_NO) {
		CTIM_DETAILS_NO = cTIM_DETAILS_NO;
	}
	/**
	 * Get CTIM_INTERVAL_OF_TIMES property
	 * @return
	 */
	public Integer getCTIM_INTERVAL_OF_TIMES() {
		return CTIM_INTERVAL_OF_TIMES;
	}
	/**
	 * Set CTIM_INTERVAL_OF_TIMES property
	 * @param cTIM_INTERVAL_OF_TIMES
	 */

	public void setCTIM_INTERVAL_OF_TIMES(Integer cTIM_INTERVAL_OF_TIMES) {
		CTIM_INTERVAL_OF_TIMES = cTIM_INTERVAL_OF_TIMES;
	}
	/**
	 * Get CTIM_MAX_UNIT_NO property
	 * @return
	 */
	public Integer getCTIM_MAX_UNIT_NO() {
		return CTIM_MAX_UNIT_NO;
	}
	/**
	 * Set CTIM_MAX_UNIT_NO property
	 * @param cTIM_MAX_UNIT_NO
	 */
	public void setCTIM_MAX_UNIT_NO(Integer cTIM_MAX_UNIT_NO) {
		CTIM_MAX_UNIT_NO = cTIM_MAX_UNIT_NO;
	}
	/**
	 * Get CTIM_MAX_PARTS_NO property
	 * @return
	 */
	public Integer getCTIM_MAX_PARTS_NO() {
		return CTIM_MAX_PARTS_NO;
	}
	/**
	 * Set CTIM_MAX_PARTS_NO property
	 * @param cTIM_MAX_PARTS_NO
	 */
	public void setCTIM_MAX_PARTS_NO(Integer cTIM_MAX_PARTS_NO) {
		CTIM_MAX_PARTS_NO = cTIM_MAX_PARTS_NO;
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
	 *  Get UPDATED_BY_USER_ID property
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
	 *  Get ISDELETED property
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
	/**
	 * Get CTIM_DETAILS_NO_INT property
	 * @return
	 */
	public int getCTIM_DETAILS_NO_INT() {
		return CTIM_DETAILS_NO_INT;
	}
	/**
	 * Set CTIM_DETAILS_NO_INT property
	 * @param cTIM_DETAILS_NO_INT
	 */
	public void setCTIM_DETAILS_NO_INT(int cTIM_DETAILS_NO_INT) {
		CTIM_DETAILS_NO_INT = cTIM_DETAILS_NO_INT;
	}
}
