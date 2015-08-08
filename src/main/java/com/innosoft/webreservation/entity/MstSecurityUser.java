package com.innosoft.webreservation.entity;

import java.util.Collection;
import java.util.LinkedHashSet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="WR_SECURITY_USER")
public class MstSecurityUser {
	public Integer getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(int uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getUSER_LOGIN() {
		return USER_LOGIN;
	}

	public void setUSER_LOGIN(String uSER_LOGIN) {
		USER_LOGIN = uSER_LOGIN;
	}

	public String getUSER_PASSWORD() {
		return USER_PASSWORD;
	}

	public void setUSER_PASSWORD(String uSER_PASSWORD) {
		USER_PASSWORD = uSER_PASSWORD;
	}

	@Id
    @GeneratedValue
    @Column(name="USER_ID")	
	public Integer USER_ID; 
	
	@Column(name="USER_LOGIN")
	public String USER_LOGIN;  
	
	@Column(name="USER_PASSWORD")
	public String USER_PASSWORD;	
	
	// Created By:
	
	@OneToMany(mappedBy="MESG_CREATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstMessage> MESG_CREATED_BY_USER = new LinkedHashSet<MstMessage>();
	
	@OneToMany(mappedBy="CLDR_CREATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCalendar> CLDR_CREATED_BY_USER = new LinkedHashSet<MstCalendar>();	
	
	@OneToMany(mappedBy="CACT_CREATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCalendarActivity> CACT_CREATED_BY_USER = new LinkedHashSet<MstCalendarActivity>();
	
	@OneToMany(mappedBy="CHRG_CREATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCharge> CHRG_CREATED_BY_USER = new LinkedHashSet<MstCharge>();
	
	@OneToMany(mappedBy="CODE_CREATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCode> CODE_CREATED_BY_USER = new LinkedHashSet<MstCode>();
	
	@OneToMany(mappedBy="CUST_CREATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCustomer> CUST_CREATED_BY_USER = new LinkedHashSet<MstCustomer>();
	
	@OneToMany(mappedBy="MEBR_CREATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCustomerMember> MEBR_CREATED_BY_USER = new LinkedHashSet<MstCustomerMember>();
	
	@OneToMany(mappedBy="CTIM_CREATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCustomerTime> CTIM_CREATED_BY_USER = new LinkedHashSet<MstCustomerTime>();
	
	@OneToMany(mappedBy="CUNT_CREATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<TrnChargeCount> CUNT_CREATED_BY_USER = new LinkedHashSet<TrnChargeCount>();
	
	@OneToMany(mappedBy="RESV_CREATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<TrnReservation> RESV_CREATED_BY_USER = new LinkedHashSet<TrnReservation>();
	
	// Updated By:
	
	@OneToMany(mappedBy="MESG_UPDATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstMessage> MESG_UPDATED_BY_USER = new LinkedHashSet<MstMessage>();
	
	@OneToMany(mappedBy="CLDR_UPDATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCalendar> CLDR_UPDATED_BY_USER = new LinkedHashSet<MstCalendar>();	
	
	@OneToMany(mappedBy="CACT_UPDATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCalendarActivity> CACT_UPDATED_BY_USER = new LinkedHashSet<MstCalendarActivity>();
	
	@OneToMany(mappedBy="CHRG_UPDATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCharge> CHRG_UPDATED_BY_USER = new LinkedHashSet<MstCharge>();
	
	@OneToMany(mappedBy="CODE_UPDATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCode> CODE_UPDATED_BY_USER = new LinkedHashSet<MstCode>();
	
	@OneToMany(mappedBy="CUST_UPDATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCustomer> CUST_UPDATED_BY_USER = new LinkedHashSet<MstCustomer>();
	
	@OneToMany(mappedBy="MEBR_UPDATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCustomerMember> MEBR_UPDATED_BY_USER = new LinkedHashSet<MstCustomerMember>();
	
	@OneToMany(mappedBy="CTIM_UPDATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<MstCustomerTime> CTIM_UPDATED_BY_USER = new LinkedHashSet<MstCustomerTime>();
	
	@OneToMany(mappedBy="CUNT_UPDATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<TrnChargeCount> CUNT_UPDATED_BY_USER = new LinkedHashSet<TrnChargeCount>();
	
	@OneToMany(mappedBy="RESV_UPDATED_BY_USER",fetch=FetchType.EAGER)
	private Collection<TrnReservation> RESV_UPDATED_BY_USER = new LinkedHashSet<TrnReservation>();
	
	
}
