package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.innosoft.webreservation.dao.SendLogDao;
import com.innosoft.webreservation.entity.TrnSendLog;
/**
 * CRUD service implementation for send log
 */
@Service
@Transactional
public class SendLogServiceImpl implements SendLogService {
	/**
	 * Send log method
	 */
	@Autowired
    private SendLogDao sendLogDao;	
	public List<TrnSendLog> listSendLog(){
		return sendLogDao.listSendLog();
	}
	/**
	 * Add log method
	 */
	public TrnSendLog addSendLog(TrnSendLog sendLog){
		return sendLogDao.addSendLog(sendLog);
	}
	/**
	 * Edit send log method
	 */
	public TrnSendLog editSendLog(TrnSendLog sendLog){
		return sendLogDao.editSendLog(sendLog);
	}
	/**
	 * Delete send log method
	 */
	public boolean deleteSendLog(int id){
		return sendLogDao.deleteSendLog(id);
	}
}
