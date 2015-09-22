package com.innosoft.webreservation.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WR_SYSTEM_SETTINGS")
public class SysSetting {
	
	@Id
    @Column(name="SSET_ID")
	public int SSET_ID;
	
    @Column(name="SSET_NOTIFICATION_TIME")
	public String SSET_NOTIFICATION_TIME;
    
    @Column(name="SSET_NOTIFICATION_DATE")
    public Date SSET_NOTIFICATION_DATE;

	public Date getSSET_NOTIFICATION_DATE() {
		return SSET_NOTIFICATION_DATE;
	}

	public void setSSET_NOTIFICATION_DATE(Date sSET_NOTIFICATION_DATE) {
		SSET_NOTIFICATION_DATE = sSET_NOTIFICATION_DATE;
	}

	public int getSSET_ID() {
		return SSET_ID;
	}

	public void setSSET_ID(int sSET_ID) {
		SSET_ID = sSET_ID;
	}

	public String getSSET_NOTIFICATION_TIME() {
		return SSET_NOTIFICATION_TIME;
	}

	public void setSSET_NOTIFICATION_TIME(String sSET_NOTIFICATION_TIME) {
		SSET_NOTIFICATION_TIME = sSET_NOTIFICATION_TIME;
	}

}
