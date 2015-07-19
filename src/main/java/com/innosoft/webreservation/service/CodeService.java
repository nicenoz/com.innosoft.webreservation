package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCode;


public interface CodeService {
	public List<MstCode> listCode();
	public MstCode addCode(MstCode code);
}
