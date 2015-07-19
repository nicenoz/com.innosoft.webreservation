package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstCode;


public interface CodeDao {
	public List<MstCode> listCode();
	public MstCode addCode(MstCode code);
}
