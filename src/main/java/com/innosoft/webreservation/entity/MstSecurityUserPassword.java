package com.innosoft.webreservation.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="WR_SECURITY_USER_PASSWORD")
public class MstSecurityUserPassword {	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="UPWD_ID_SEQ")
    @SequenceGenerator(name="UPWD_ID_SEQ", sequenceName="UPWD_ID_SEQ", allocationSize=1)
    @Column(name="UPWD_ID")	
	private int UPWD_ID;	
	
	@Column(name="UPWD_USER_ID")
	private Integer UPWD_USER_ID;
	
	@Column(name="UPWD_PASSWORD")
	private String UPWD_PASSWORD;
	
	/* ************* */
	/* Setter/Getter */
	/* ************* */	
	public int getUPWD_ID() {
		return UPWD_ID;
	}

	public void setUPWD_ID(int uPWD_ID) {
		UPWD_ID = uPWD_ID;
	}

	public Integer getUPWD_USER_ID() {
		return UPWD_USER_ID;
	}

	public void setUPWD_USER_ID(Integer uPWD_USER_ID) {
		UPWD_USER_ID = uPWD_USER_ID;
	}

	public String getUPWD_PASSWORD() {
		return UPWD_PASSWORD;
	}

	public void setUPWD_PASSWORD(String uPWD_PASSWORD) {
		UPWD_PASSWORD = uPWD_PASSWORD;
	}	
}
