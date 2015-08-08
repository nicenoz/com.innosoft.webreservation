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
@Table(name="WR_CALENDAR_ACTIVITY")
public class MstCalendarActivity {
	public Integer getCACT_ID() {
		return CACT_ID;
	}
	public void setCACT_ID(Integer cACT_ID) {
		CACT_ID = cACT_ID;
	}
	public Integer getCACT_CLDR_ID() {
		return CACT_CLDR_ID;
	}
	public void setCACT_CLDR_ID(Integer cACT_CLDR_ID) {
		CACT_CLDR_ID = cACT_CLDR_ID;
	}
	public Integer getCACT_CUST_ID() {
		return CACT_CUST_ID;
	}
	public void setCACT_CUST_ID(Integer cACT_CUST_ID) {
		CACT_CUST_ID = cACT_CUST_ID;
	}
	public Date getCACT_DATE() {
		return CACT_DATE;
	}
	public void setCACT_DATE(Date cACT_DATE) {
		CACT_DATE = cACT_DATE;
	}
	public Integer getCACT_DETAILS_NO() {
		return CACT_DETAILS_NO;
	}
	public void setCACT_DETAILS_NO(Integer cACT_DETAILS_NO) {
		CACT_DETAILS_NO = cACT_DETAILS_NO;
	}
	public String getCACT_ACTIVITY_CLASSIFICATION() {
		return CACT_ACTIVITY_CLASSIFICATION;
	}
	public void setCACT_ACTIVITY_CLASSIFICATION(String cACT_ACTIVITY_CLASSIFICATION) {
		CACT_ACTIVITY_CLASSIFICATION = cACT_ACTIVITY_CLASSIFICATION;
	}
	public String getCACT_ACTIVITY_CONTENTS() {
		return CACT_ACTIVITY_CONTENTS;
	}
	public void setCACT_ACTIVITY_CONTENTS(String cACT_ACTIVITY_CONTENTS) {
		CACT_ACTIVITY_CONTENTS = cACT_ACTIVITY_CONTENTS;
	}
	public Integer getCACT_START_TIME_ID() {
		return CACT_START_TIME_ID;
	}
	public void setCACT_START_TIME_ID(Integer cACT_START_TIME_ID) {
		CACT_START_TIME_ID = cACT_START_TIME_ID;
	}
	public Integer getCACT_END_TIME_ID() {
		return CACT_END_TIME_ID;
	}
	public void setCACT_END_TIME_ID(Integer cACT_END_TIME_ID) {
		CACT_END_TIME_ID = cACT_END_TIME_ID;
	}
	public Integer getCACT_OPERATION_FLAG() {
		return CACT_OPERATION_FLAG;
	}
	public void setCACT_OPERATION_FLAG(Integer cACT_OPERATION_FLAG) {
		CACT_OPERATION_FLAG = cACT_OPERATION_FLAG;
	}
	public Date getCREATED_DATE() {
		return CREATED_DATE;
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
	public Date getUPDATED_DATE() {
		return UPDATED_DATE;
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
	@Id   
    @GeneratedValue
    @Column(name="CACT_ID")		
	public Integer CACT_ID;  
	@Column(name="CACT_CLDR_ID")	
	public Integer CACT_CLDR_ID;
	@Column(name="CACT_CUST_ID")	
	public Integer CACT_CUST_ID;
	@Column(name="CACT_DATE")	
	public Date CACT_DATE;  
	@Column(name="CACT_DETAILS_NO")	
	public Integer CACT_DETAILS_NO;
	@Column(name="CACT_ACTIVITY_CLASSIFICATION")	
	public String CACT_ACTIVITY_CLASSIFICATION;
	@Column(name="CACT_ACTIVITY_CONTENTS")	
	public String CACT_ACTIVITY_CONTENTS;
	@Column(name="CACT_START_TIME_ID")	
	public Integer CACT_START_TIME_ID;
	@Column(name="CACT_END_TIME_ID")	
	public Integer CACT_END_TIME_ID;
	@Column(name="CACT_OPERATION_FLAG")	
	public Integer CACT_OPERATION_FLAG;
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
	
	@ManyToOne
	@JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CACT_CREATED_BY_USER;

	public MstSecurityUser getCACT_CREATED_BY_USER() {
		return CACT_CREATED_BY_USER;
	}
	public void setCACT_CREATED_BY_USER(MstSecurityUser cACT_CREATED_BY_USER) {
		CACT_CREATED_BY_USER = cACT_CREATED_BY_USER;
	}

	@ManyToOne
	@JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CACT_UPDATED_BY_USER;

	public MstSecurityUser getCACT_UPDATED_BY_USER() {
		return CACT_UPDATED_BY_USER;
	}
	public void setCACT_UPDATED_BY_USER(MstSecurityUser cACT_UPDATED_BY_USER) {
		CACT_UPDATED_BY_USER = cACT_UPDATED_BY_USER;
	}	

}
