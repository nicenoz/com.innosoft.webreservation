package com.innosoft.webreservation.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="WR_SECURITY_ROLE")
public class MstSecurityRole {
	
    public Integer getROLE_ID() {
		return ROLE_ID;
	}

	public void setROLE_ID(int rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}

	public String getROLE_ROLE() {
		return ROLE_ROLE;
	}

	public void setROLE_ROLE(String rOLE_ROLE) {
		ROLE_ROLE = rOLE_ROLE;
	}

	@Id
    @GeneratedValue
    @Column(name="ROLE_ID")
	private Integer ROLE_ID;
	
	@Column(name="ROLE_ROLE")  
	private String ROLE_ROLE;
  

	public Set<MstSecurityUserRole> getUSERS() {
		return USERS;
	}

	public void setUSERS(Set<MstSecurityUserRole> uSERS) {
		USERS = uSERS;
	}

	@OneToMany(mappedBy="ROLE")
	private Set<MstSecurityUserRole> USERS;

}
