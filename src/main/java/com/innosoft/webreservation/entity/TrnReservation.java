package com.innosoft.webreservation.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="WR_RESERVATION")
public class TrnReservation {
	@Id
    @Column(name="RESV_ID")	
	public Integer RESV_ID;
	
	@Column(name="RESV_CUST_ID")
	public Integer RESV_CUST_ID;  
	
	@Column(name="RESV_MEBR_ID")
	public Integer RESV_MEBR_ID;
	
	@Column(name="RESV_CACT_ID")
	public Integer RESV_CACT_ID;
	
	@Column(name="RESV_UNIT_NO")
	public Integer RESV_UNIT_NO;
	
	@Column(name="RESV_PARTS_NO")
	public Integer RESV_PARTS_NO;
	
	@Column(name="RESV_START_TIME_ID")
	public Integer RESV_START_TIME_ID;
	
	@Column(name="RESV_END_TIME_ID")
	public Integer RESV_END_TIME_ID;
	
	@Column(name="RESV_NOTE")
	public String RESV_NOTE;
	
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
	
	@Column(name="ISDELETED_DATE")	
	public Date ISDELETED_DATE;

	@Column(name="ISDELETED_BY_USER_ID")	
	public Integer ISDELETED_BY_USER_ID;
	
	/* FK -> MstCustomer */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="RESV_CUST_ID", insertable=false, updatable=false)
	public MstCustomer RESV_CUST_FK;	
	
	/* FK -> MstCustomerMember */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="RESV_MEBR_ID", insertable=false, updatable=false)
	public MstCustomerMember RESV_MEBR_FK;	
	
	/* FK -> MstCalendarActivity */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="RESV_CACT_ID", insertable=false, updatable=false)
	private MstCalendarActivity RESV_CACT_FK;
	
	/* FK -> MstCustomerTime TimeStart */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="RESV_START_TIME_ID", insertable=false, updatable=false)
	public MstCustomerTime RESV_START_TIME_FK;
	
	/* FK -> MstCustomerTime TimeEnd */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="RESV_END_TIME_ID", insertable=false, updatable=false)
	public MstCustomerTime RESV_END_TIME_FK;	
	
	/* FK -> MstSecurityUser Created */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser RESV_CREATED_BY_USER_FK;	
	
	/* FK -> MstSecurityUser Updated */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser RESV_UPDATED_BY_USER_FK;		
	
	/* ************* */
	/* Setter/Getter */
	/* ************* */
	
	public Integer getRESV_ID() {
		return RESV_ID;
	}

	public void setRESV_ID(Integer rESV_ID) {
		RESV_ID = rESV_ID;
	}

	public Integer getRESV_CUST_ID() {
		return RESV_CUST_ID;
	}

	public void setRESV_CUST_ID(Integer rESV_CUST_ID) {
		RESV_CUST_ID = rESV_CUST_ID;
	}

	public Integer getRESV_MEBR_ID() {
		return RESV_MEBR_ID;
	}

	public void setRESV_MEBR_ID(Integer rESV_MEBR_ID) {
		RESV_MEBR_ID = rESV_MEBR_ID;
	}

	public Integer getRESV_CACT_ID() {
		return RESV_CACT_ID;
	}

	public void setRESV_CACT_ID(Integer rESV_CACT_ID) {
		RESV_CACT_ID = rESV_CACT_ID;
	}

	public Integer getRESV_UNIT_NO() {
		return RESV_UNIT_NO;
	}

	public void setRESV_UNIT_NO(Integer rESV_UNIT_NO) {
		RESV_UNIT_NO = rESV_UNIT_NO;
	}

	public Integer getRESV_PARTS_NO() {
		return RESV_PARTS_NO;
	}

	public void setRESV_PARTS_NO(Integer rESV_PARTS_NO) {
		RESV_PARTS_NO = rESV_PARTS_NO;
	}

	public Integer getRESV_START_TIME_ID() {
		return RESV_START_TIME_ID;
	}

	public void setRESV_START_TIME_ID(Integer rESV_START_TIME_ID) {
		RESV_START_TIME_ID = rESV_START_TIME_ID;
	}

	public Integer getRESV_END_TIME_ID() {
		return RESV_END_TIME_ID;
	}

	public void setRESV_END_TIME_ID(Integer rESV_END_TIME_ID) {
		RESV_END_TIME_ID = rESV_END_TIME_ID;
	}

	public String getRESV_NOTE() {
		return RESV_NOTE;
	}

	public void setRESV_NOTE(String rESV_NOTE) {
		RESV_NOTE = rESV_NOTE;
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
}
