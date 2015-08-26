package com.innosoft.webreservation.entity;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashSet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="WR_CALENDAR")
public class MstCalendar {
	@Id   
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="CLDR_ID_SEQ")
    @SequenceGenerator(name="CLDR_ID_SEQ", sequenceName="CLDR_ID_SEQ", allocationSize=1)
    @Column(name="CLDR_ID")
	public Integer CLDR_ID;
	
	@Column(name="CLDR_DATE")
	public Date CLDR_DATE; 
	
	@Column(name="CLDR_DAYCODE")	
	public String CLDR_DAYCODE;

	@Column(name="CLDR_NOTE")	
	public String CLDR_NOTE;
	
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
	
	@Column(name="ISDELETED_DATE",nullable = true)
	public Date ISDELETED_DATE;
	
	@Column(name="ISDELETED_BY_USER_ID",nullable = true)
	public Integer ISDELETED_BY_USER_ID;

	/* FK -> MstSecurityUser Created */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="CREATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CLDR_CREATED_BY_USER_FK;	
	
	/* FK -> MstSecurityUser Updated */
	@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UPDATED_BY_USER_ID", insertable=false, updatable=false)
	public MstSecurityUser CLDR_UPDATED_BY_USER_FK;	
	
	/* ************* */
	/* Setter/Getter */
	/* ************* */
	
	public Integer getCLDR_ID() {
		return CLDR_ID;
	}

	public void setCLDR_ID(Integer cLDR_ID) {
		CLDR_ID = cLDR_ID;
	}

	public String getCLDR_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(CLDR_DATE);
	}

	public void setCLDR_DATE(Date cLDR_DATE) {
		CLDR_DATE = cLDR_DATE;
	}

	public String getCLDR_DAYCODE() {
		return CLDR_DAYCODE;
	}

	public void setCLDR_DAYCODE(String cLDR_DAYCODE) {
		CLDR_DAYCODE = cLDR_DAYCODE;
	}

	public String getCLDR_NOTE() {
		return CLDR_NOTE;
	}

	public void setCLDR_NOTE(String cLDR_NOTE) {
		CLDR_NOTE = cLDR_NOTE;
	}

	public String getCREATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(CREATED_DATE);
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

	public String getUPDATED_DATE() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");		
		return sf.format(UPDATED_DATE);
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
