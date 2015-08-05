package com.innosoft.webreservation.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.innosoft.webreservation.dao.UserDao;
import com.innosoft.webreservation.entity.SysAudit;
import com.innosoft.webreservation.entity.MstCalendar;
import com.innosoft.webreservation.entity.MstCharge;
import com.innosoft.webreservation.entity.MstCode;
import com.innosoft.webreservation.entity.MstCustomer;
import com.innosoft.webreservation.entity.MstCustomerMember;
import com.innosoft.webreservation.entity.MstCustomerTime;
import com.innosoft.webreservation.entity.MstMessage;
import com.innosoft.webreservation.entity.MstSecurityUser;
import com.innosoft.webreservation.entity.TrnChargeCount;
import com.innosoft.webreservation.entity.TrnReservation;

public class AuditService  {

	@Autowired
	private UserDao userDao;
	public SysAudit log = new SysAudit();
	
	public AuditService() {
		super();
	}

	public MstCharge charge;
	public MstCalendar calendar;
	public MstMessage message;
	public TrnChargeCount chargeCount;
	public MstCode code;
	public MstCustomer customer;
	public MstCustomerTime time;
	public TrnReservation reservation;
	public MstCustomerMember customerMember;

	public MstCustomerMember getCustomerMember() {
		return customerMember;
	}

	public void setCustomerMember(MstCustomerMember customerMember) {
		this.customerMember = customerMember;
	}

	public MstCharge getCharge() {
		return charge;
	}

	public void setCharge(MstCharge charge) {
		this.charge = charge;
	}

	public MstCalendar getCalendar() {
		return calendar;
	}

	public void setCalendar(MstCalendar calendar) {
		this.calendar = calendar;
	}

	public MstMessage getMessage() {
		return message;
	}

	public void setMessage(MstMessage message) {
		this.message = message;
	}

	public TrnChargeCount getChargeCount() {
		return chargeCount;
	}

	public void setChargeCount(TrnChargeCount chargeCount) {
		this.chargeCount = chargeCount;
	}

	public MstCode getCode() {
		return code;
	}

	public void setCode(MstCode code) {
		this.code = code;
	}

	public MstCustomer getCustomer() {
		return customer;
	}

	public void setCustomer(MstCustomer customer) {
		this.customer = customer;
	}

	public MstCustomerTime getTime() {
		return time;
	}

	public void setTime(MstCustomerTime time) {
		this.time = time;
	}

	public TrnReservation getReservation() {
		return reservation;
	}

	public void setReservation(TrnReservation reservation) {
		this.reservation = reservation;
	}



	public Object fillStamp(MstSecurityUser currentUser) {
		log.setCREATED_DATE(new Date());
		log.setCREATED_BY_USER_ID(currentUser.getUSER_ID());
		log.setUPDATED_DATE(new Date());
		log.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
		log.setISDELETED(0);
		return log;
	}

	public Object UpdateStamp(MstSecurityUser currentUser) {
		log.setUPDATED_DATE(new Date());
		log.setUPDATED_BY_USER_ID(currentUser.getUSER_ID());
		log.setISDELETED(0);
		return log;
	}

}
