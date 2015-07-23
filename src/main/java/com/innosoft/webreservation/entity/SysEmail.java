package com.innosoft.webreservation.entity;

import javax.persistence.Entity;

@Entity
public class SysEmail {

	public String getEMAIL_EMAIL() {
		return EMAIL_EMAIL;
	}
	public void setEMAIL_EMAIL(String eMAIL_EMAIL) {
		EMAIL_EMAIL = eMAIL_EMAIL;
	}
	public String getEMAIL_SUBJECT() {
		return EMAIL_SUBJECT;
	}
	public void setEMAIL_SUBJECT(String eMAIL_SUBJECT) {
		EMAIL_SUBJECT = eMAIL_SUBJECT;
	}
	public String getEMAIL_MESSAGE() {
		return EMAIL_MESSAGE;
	}
	public void setEMAIL_MESSAGE(String eMAIL_MESSAGE) {
		EMAIL_MESSAGE = eMAIL_MESSAGE;
	}
	public String EMAIL_EMAIL;
	public String EMAIL_SUBJECT;
	public String EMAIL_MESSAGE;
	

}
