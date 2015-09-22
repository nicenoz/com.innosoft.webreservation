package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstCode;

public interface CodeService {
	public List<MstCode> listCode();
	public List<MstCode> listCodeByKind(String kind);
	public MstCode addCode(MstCode code);
	public MstCode editCode(MstCode code);
	public boolean deleteCode(int id);
}
