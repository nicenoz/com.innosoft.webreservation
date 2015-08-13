package com.innosoft.webreservation.entity;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashSet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="WR_CUSTOMER_TIME")
public class MstCustomerTime {

	@Id
    @GeneratedValue
    @Column(name="CTIM_ID")	
	public Integer CTIM_ID;
	
	@Column(name="CTIM_CUST_ID")	
	public Integer CTIM_CUST_ID;
	
	@Column(name="CTIM_DETAILS_NO")	
	public Integer CTIM_DETAILS_NO; 
	
	@Column(name="CTIM_INTERVAL_OF_TIMES")	
	public Integer CTIM_INTERVAL_OF_TIMES;
	
	@Column(name="CTIM_MAX_UNIT_NO")	
	public Integer CTIM_MAX_UNIT_NO;
	
	@Column(name="CTIM_MAX_PARTS_NO")	
	public Integer CTIM_MAX_PARTS_NO;
				
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
	
	/* FK -> MstCustomer */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CTIM_CUST_ID", insertable=false, updatable=false)
	public MstCustomer CTIM_CUST_FK;	
	
	/* FK -> MstSecurityUser Created */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CTIM_CREATED_BY_USER_FK;	
	
	/* FK -> MstSecurityUser Updated */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CTIM_UPDATED_BY_USER_FK;
	
	/* ************* */
	/* Setter/Getter */
	/* ************* */	
	
	public Integer getCTIM_ID() {
		return CTIM_ID;
	}

	public void setCTIM_ID(Integer cTIM_ID) {
		CTIM_ID = cTIM_ID;
	}

	public Integer getCTIM_CUST_ID() {
		return CTIM_CUST_ID;
	}

	public void setCTIM_CUST_ID(Integer cTIM_CUST_ID) {
		CTIM_CUST_ID = cTIM_CUST_ID;
	}

	public Integer getCTIM_DETAILS_NO() {
		return CTIM_DETAILS_NO;
	}

	public void setCTIM_DETAILS_NO(Integer cTIM_DETAILS_NO) {
		CTIM_DETAILS_NO = cTIM_DETAILS_NO;
	}

	public Integer getCTIM_INTERVAL_OF_TIMES() {
		return CTIM_INTERVAL_OF_TIMES;
	}

	public void setCTIM_INTERVAL_OF_TIMES(Integer cTIM_INTERVAL_OF_TIMES) {
		CTIM_INTERVAL_OF_TIMES = cTIM_INTERVAL_OF_TIMES;
	}

	public Integer getCTIM_MAX_UNIT_NO() {
		return CTIM_MAX_UNIT_NO;
	}

	public void setCTIM_MAX_UNIT_NO(Integer cTIM_MAX_UNIT_NO) {
		CTIM_MAX_UNIT_NO = cTIM_MAX_UNIT_NO;
	}

	public Integer getCTIM_MAX_PARTS_NO() {
		return CTIM_MAX_PARTS_NO;
	}

	public void setCTIM_MAX_PARTS_NO(Integer cTIM_MAX_PARTS_NO) {
		CTIM_MAX_PARTS_NO = cTIM_MAX_PARTS_NO;
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
}
