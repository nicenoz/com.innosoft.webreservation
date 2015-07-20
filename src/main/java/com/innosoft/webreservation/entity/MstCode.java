package com.innosoft.webreservation.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WR_CODE")
public class MstCode {
	public int getCODE_ID() {
		return CODE_ID;
	}
	public void setCODE_ID(int cODE_ID) {
		CODE_ID = cODE_ID;
	}
	public String getCODE_KIND_CODE() {
		return CODE_KIND_CODE;
	}
	public void setCODE_KIND_CODE(String cODE_KIND_CODE) {
		CODE_KIND_CODE = cODE_KIND_CODE;
	}
	public String getCODE_CODE_VALUE() {
		return CODE_CODE_VALUE;
	}
	public void setCODE_CODE_VALUE(String cODE_CODE_VALUE) {
		CODE_CODE_VALUE = cODE_CODE_VALUE;
	}
	public String getCODE_TEXT() {
		return CODE_TEXT;
	}
	public void setCODE_TEXT(String cODE_TEXT) {
		CODE_TEXT = cODE_TEXT;
	}
	public int getCODE_ISDISPLAY() {
		return CODE_ISDISPLAY;
	}
	public void setCODE_ISDISPLAY(int cODE_ISDISPLAY) {
		CODE_ISDISPLAY = cODE_ISDISPLAY;
	}
	public String getCODE_NOTE() {
		return CODE_NOTE;
	}
	public void setCODE_NOTE(String cODE_NOTE) {
		CODE_NOTE = cODE_NOTE;
	}
	@Id
    @GeneratedValue
    @Column(name="CODE_ID")		
	public int CODE_ID;  
	
	@Column(name="CODE_KIND_CODE")	
	public String CODE_KIND_CODE;
	
	@Column(name="CODE_CODE_VALUE")	
	public String CODE_CODE_VALUE;
	
	@Column(name="CODE_TEXT")	
	public String CODE_TEXT;
	
	@Column(name="CODE_ISDISPLAY")	
	public int CODE_ISDISPLAY;
	
	@Column(name="CODE_NOTE")	
	public String CODE_NOTE; 
}
