package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.CodeDao;
import com.innosoft.webreservation.entity.MstCode;

/**
 * CRUD service implementation for code
 */
@Service
@Transactional
public class CodeServiceImpl implements CodeService {
	/**
	 * Code method
	 */
	@Autowired
    private CodeDao codeDao;
	/**
	 * List code method
	 */
	public List<MstCode> listCode(){
		return codeDao.listCode();
	}
	/**
	 * List code by kind method
	 */
	public List<MstCode> listCodeByKind(String kind) {
		return codeDao.listCodeByKind(kind);
	}
	/**
	 * Add code method
	 */
	public MstCode addCode(MstCode code){
		return codeDao.addCode(code);
	}
	/**
	 * Edit code method
	 */
	public MstCode editCode(MstCode code){
		return codeDao.editCode(code);
	}
	/**
	 * Delete code method
	 */
	public boolean deleteCode(int id){
		return codeDao.deleteCode(id);
	}	
}
