package com.innosoft.webreservation.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderColumn;
import javax.persistence.Table;
/**
 * ORM class for calendar activity
 */
@Entity
@Table(name="WR_CALENDAR_ACTIVITY")
public class MstCalendarActivity {
	/**
	 * CACT_ID property 
	 */
	@Id
    @OrderColumn
    @Column(name="CACT_ID")			
	public Integer CACT_ID;  
	/**
	 * CACT_CLDR_ID property
	 */
	@Column(name="CACT_CLDR_ID")	
	public Integer CACT_CLDR_ID;
	/**
	 * CACT_CUST_ID property
	 */
	@Column(name="CACT_CUST_ID")	
	public Integer CACT_CUST_ID;
	/**
	 * CACT_DETAILS_NO property
	 */
	@Column(name="CACT_DETAILS_NO")	
	public Integer CACT_DETAILS_NO;
	/**
	 * CACT_ACTIVITY_CLASSIFICATION property
	 */
	@Column(name="CACT_ACTIVITY_CLASSIFICATION")	
	public String CACT_ACTIVITY_CLASSIFICATION;
	/**
	 * CACT_ACTIVITY_CONTENTS property
	 */
	@Column(name="CACT_ACTIVITY_CONTENTS")	
	public String CACT_ACTIVITY_CONTENTS;
	/**
	 * CACT_START_TIME_ID property
	 */
	@Column(name="CACT_START_TIME_ID")	
	public Integer CACT_START_TIME_ID;
	/**
	 * CACT_END_TIME_ID property
	 */
	@Column(name="CACT_END_TIME_ID")	
	public Integer CACT_END_TIME_ID;
	/**
	 * CACT_OPERATION_FLAG property
	 */
	@Column(name="CACT_OPERATION_FLAG")	
	public Integer CACT_OPERATION_FLAG;
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
	 * Foreign key MstCalendar
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CACT_CLDR_ID", insertable=false, updatable=false)
	public MstCalendar CACT_CLDR_FK;
	
	/**
	 * Foreign key MstCustomer
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CACT_CUST_ID", insertable=false, updatable=false)
	public MstCustomer CACT_CUST_FK;
	
	/**
	 * Foreign key MstCustomerTime start
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CACT_START_TIME_ID", insertable=false, updatable=false)
	public MstCustomerTime CACT_START_TIME_FK;
	
	/**
	 * Foreign key MstCustomerTime end
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CACT_END_TIME_ID", insertable=false, updatable=false)
	public MstCustomerTime CACT_END_TIME_FK;
	
	/**
	 * Foreign key MstSecurityUser Created
	 */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CACT_CREATED_BY_USER_FK;	
	
	/**
	 * Foreign key MstSecurityUser Updated
	 */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CACT_UPDATED_BY_USER_FK;		
	/**
	 * Foreign key TrnReservation
	 */
	@OneToMany(mappedBy="RESV_CACT_FK", fetch=FetchType.EAGER)
	public Set<TrnReservation> RESV_CACT;	

	/**
	 * Get CACT_ID property
	 * @return
	 */
	public Integer getCACT_ID() {
		return CACT_ID;
	}
	/**
	 * Set CACT_ID property
	 * @param cACT_ID 
	 */
	public void setCACT_ID(Integer cACT_ID) {
		CACT_ID = cACT_ID;
	}
	/**
	 * Get CACT_ID property
	 * @return
	 */
	public Integer getCACT_CLDR_ID() {
		return CACT_CLDR_ID;
	}
	/**
	 * Set CACT_ID property
	 * @param cACT_CLDR_ID
	 */
	public void setCACT_CLDR_ID(Integer cACT_CLDR_ID) {
		CACT_CLDR_ID = cACT_CLDR_ID;
	}
	/**
	 * Get CACT_CUST_ID property
	 * @return
	 */
	public Integer getCACT_CUST_ID() {
		return CACT_CUST_ID;
	}
	/**
	 * Set CACT_CUST_ID property
	 * @param cACT_CUST_ID
	 */
	public void setCACT_CUST_ID(Integer cACT_CUST_ID) {
		CACT_CUST_ID = cACT_CUST_ID;
	}
	/**
	 * Get CACT_DETAILS_NO property
	 * @return
	 */
	public Integer getCACT_DETAILS_NO() {
		return CACT_DETAILS_NO;
	}
	/**
	 * Set CACT_DETAILS_NO property
	 * @param cACT_DETAILS_NO
	 */
	public void setCACT_DETAILS_NO(Integer cACT_DETAILS_NO) {
		CACT_DETAILS_NO = cACT_DETAILS_NO;
	}
	/**
	 * Get CACT_ACTIVITY_CLASSIFICATION property
	 * @return
	 */
	public String getCACT_ACTIVITY_CLASSIFICATION() {
		return CACT_ACTIVITY_CLASSIFICATION;
	}
	/**
	 * Set CACT_ACTIVITY_CLASSIFICATION property
	 * @param cACT_ACTIVITY_CLASSIFICATION
	 */
	public void setCACT_ACTIVITY_CLASSIFICATION(String cACT_ACTIVITY_CLASSIFICATION) {
		CACT_ACTIVITY_CLASSIFICATION = cACT_ACTIVITY_CLASSIFICATION;
	}
	/**
	 * Get CACT_ACTIVITY_CONTENTS property
	 * @return
	 */
	public String getCACT_ACTIVITY_CONTENTS() {
		return CACT_ACTIVITY_CONTENTS;
	}
	/**
	 * Set CACT_ACTIVITY_CONTENTS property
	 * @param cACT_ACTIVITY_CONTENTS
	 */
	public void setCACT_ACTIVITY_CONTENTS(String cACT_ACTIVITY_CONTENTS) {
		CACT_ACTIVITY_CONTENTS = cACT_ACTIVITY_CONTENTS;
	}
	/**
	 * Get CACT_START_TIME_ID property
	 * @return
	 */
	public Integer getCACT_START_TIME_ID() {
		return CACT_START_TIME_ID;
	}
	/**
	 * Set CACT_START_TIME_ID property
	 * @param cACT_START_TIME_ID
	 */
	public void setCACT_START_TIME_ID(Integer cACT_START_TIME_ID) {
		CACT_START_TIME_ID = cACT_START_TIME_ID;
	}
	/**
	 * Get CACT_START_TIME_ID property
	 * @return
	 */
	public Integer getCACT_END_TIME_ID() {
		return CACT_END_TIME_ID;
	}
	/**
	 * Set CACT_START_TIME_ID property
	 * @param cACT_END_TIME_ID
	 */
	public void setCACT_END_TIME_ID(Integer cACT_END_TIME_ID) {
		CACT_END_TIME_ID = cACT_END_TIME_ID;
	}
	/**
	 * Get CACT_OPERATION_FLAG property
	 * @return
	 */
	public Integer getCACT_OPERATION_FLAG() {
		return CACT_OPERATION_FLAG;
	}
	/**
	 * Set CACT_OPERATION_FLAG property
	 * @param cACT_OPERATION_FLAG
	 */

	public void setCACT_OPERATION_FLAG(Integer cACT_OPERATION_FLAG) {
		CACT_OPERATION_FLAG = cACT_OPERATION_FLAG;
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
	 *  Set UPDATED_BY_USER_ID property
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
