package com.innosoft.webreservation.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * ORM class for setting
 */
@Entity
@Table(name="WR_SYSTEM_SETTINGS")
public class SysSetting {
	/**
	 * SSET_ID property
	 */
	@Id
    @Column(name="SSET_ID")
	public int SSET_ID;
	/**
	 * SSET_NOTIFICATION_TIME property
	 */
    @Column(name="SSET_NOTIFICATION_TIME")
	public String SSET_NOTIFICATION_TIME;
    /**
     * SSET_NOTIFICATION_DATE property
     */
    @Column(name="SSET_NOTIFICATION_DATE")
    public Date SSET_NOTIFICATION_DATE;

    @Column(name="SSET_NOTIFICATION_NO_OF_DAYS")
    public int SSET_NOTIFICATION_NO_OF_DAYS;

    /**
     * Get SSET_NOTIFICATION_DATE property
     * @return
     */

	public Date getSSET_NOTIFICATION_DATE() {
		return SSET_NOTIFICATION_DATE;
	}
	/**
	 * Set SSET_NOTIFICATION_DATE property
	 * @param sSET_NOTIFICATION_DATE
	 */
	public void setSSET_NOTIFICATION_DATE(Date sSET_NOTIFICATION_DATE) {
		SSET_NOTIFICATION_DATE = sSET_NOTIFICATION_DATE;
	}
	/**
	 * Get SSET_ID property
	 * @return
	 */

	public int getSSET_ID() {
		return SSET_ID;
	}
	/**
	 * Set SSET_ID property
	 * @param sSET_ID
	 */
	public void setSSET_ID(int sSET_ID) {
		SSET_ID = sSET_ID;
	}
	/**
	 * Get SSET_NOTIFICATION_TIME property
	 * @return
	 */
	public String getSSET_NOTIFICATION_TIME() {
		return SSET_NOTIFICATION_TIME;
	}
	/**
	 * Set SSET_NOTIFICATION_TIME property
	 * @param sSET_NOTIFICATION_TIME
	 */
	public void setSSET_NOTIFICATION_TIME(String sSET_NOTIFICATION_TIME) {
		SSET_NOTIFICATION_TIME = sSET_NOTIFICATION_TIME;
	}
	
	public int getSSET_NOTIFICATION_NO_OF_DAYS() {
		return SSET_NOTIFICATION_NO_OF_DAYS;
	}

	public void setSSET_NOTIFICATION_NO_OF_DAYS(int sSET_NOTIFICATION_NO_OF_DAYS) {
		SSET_NOTIFICATION_NO_OF_DAYS = sSET_NOTIFICATION_NO_OF_DAYS;
	}

	/**
	 * 
	 */
}
