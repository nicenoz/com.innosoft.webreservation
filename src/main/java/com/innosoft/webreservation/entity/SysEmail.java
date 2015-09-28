package com.innosoft.webreservation.entity;

import javax.persistence.Entity;
/**
 * ORM class for temporary email data
 */
@Entity
public class SysEmail {
	/**
	 * EMAIL_EMAIL property
	 */
	public String EMAIL_EMAIL;
	/**
	 * EMAIL_SUBJECT property
	 */
	public String EMAIL_SUBJECT;
	/**
	 * EMAIL_MESSAGE property
	 */
	public String EMAIL_MESSAGE;
	/**
	 * EMAIL_PURPOSE property
	 */
	public String EMAIL_PURPOSE;
	/**
	 * EMAIL_RECEIVER_ID property
	 */
	public int EMAIL_RECEIVER_ID;
	/**
	 * Get EMAIL_RECEIVER_ID property
	 * @return
	 */
	public int getEMAIL_RECEIVER_ID() {
		return EMAIL_RECEIVER_ID;
	}
	/**
	 * Set EMAIL_RECEIVER_ID property
	 * @param eMAIL_RECEIVER_ID
	 */
	public void setEMAIL_RECEIVER_ID(int eMAIL_RECEIVER_ID) {
		EMAIL_RECEIVER_ID = eMAIL_RECEIVER_ID;
	}
	/**
	 * Get EMAIL_PURPOSE property
	 * @return
	 */
	public String getEMAIL_PURPOSE() {
		return EMAIL_PURPOSE;
	}
	/**
	 * Set EMAIL_PURPOSE property
	 * @param eMAIL_PURPOSE
	 */
	public void setEMAIL_PURPOSE(String eMAIL_PURPOSE) {
		EMAIL_PURPOSE = eMAIL_PURPOSE;
	}
	/**
	 * Get EMAIL_EMAIL property
	 * @return
	 */
	public String getEMAIL_EMAIL() {
		return EMAIL_EMAIL;
	}
	/**
	 * Set EMAIL_EMAIL property
	 * @param eMAIL_EMAIL
	 */
	public void setEMAIL_EMAIL(String eMAIL_EMAIL) {
		EMAIL_EMAIL = eMAIL_EMAIL;
	}
	/**
	 * Get EMAIL_SUBJECT property
	 * @return
	 */
	public String getEMAIL_SUBJECT() {
		return EMAIL_SUBJECT;
	}
	/**
	 * Set EMAIL_SUBJECT property
	 * @param eMAIL_SUBJECT
	 */
	public void setEMAIL_SUBJECT(String eMAIL_SUBJECT) {
		EMAIL_SUBJECT = eMAIL_SUBJECT;
	}
	/**
	 * Get EMAIL_EMAIL property
	 * @return
	 */
	public String getEMAIL_MESSAGE() {
		return EMAIL_MESSAGE;
	}
	/**
	 * Set EMAIL_EMAIL property
	 * @param eMAIL_MESSAGE
	 */
	public void setEMAIL_MESSAGE(String eMAIL_MESSAGE) {
		EMAIL_MESSAGE = eMAIL_MESSAGE;
	}
}
