package com.innosoft.webreservation.entity;

import java.util.Date;

public class SysAudit {

	public Date CREATED_DATE;
	public int CREATED_BY_USER_ID;
	public Date UPDATED_DATE;
	public int UPDATED_BY_USER_ID;
	public int ISDELETED;

	public SysAudit() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SysAudit(Date cREATED_DATE, int cREATED_BY_USER_ID,
			Date uPDATED_DATE, int uPDATED_BY_USER_ID, int iSDELETED) {
		super();
		CREATED_DATE = cREATED_DATE;
		CREATED_BY_USER_ID = cREATED_BY_USER_ID;
		UPDATED_DATE = uPDATED_DATE;
		UPDATED_BY_USER_ID = uPDATED_BY_USER_ID;
		ISDELETED = iSDELETED;
	}

	public Date getCREATED_DATE() {
		return CREATED_DATE;
	}

	public void setCREATED_DATE(Date cREATED_DATE) {
		CREATED_DATE = cREATED_DATE;
	}

	public int getCREATED_BY_USER_ID() {
		return CREATED_BY_USER_ID;
	}

	public void setCREATED_BY_USER_ID(int cREATED_BY_USER_ID) {
		CREATED_BY_USER_ID = cREATED_BY_USER_ID;
	}

	public Date getUPDATED_DATE() {
		return UPDATED_DATE;
	}

	public void setUPDATED_DATE(Date uPDATED_DATE) {
		UPDATED_DATE = uPDATED_DATE;
	}

	public int getUPDATED_BY_USER_ID() {
		return UPDATED_BY_USER_ID;
	}

	public void setUPDATED_BY_USER_ID(int uPDATED_BY_USER_ID) {
		UPDATED_BY_USER_ID = uPDATED_BY_USER_ID;
	}

	public int getISDELETED() {
		return ISDELETED;
	}

	public void setISDELETED(int iSDELETED) {
		ISDELETED = iSDELETED;
	}
}
