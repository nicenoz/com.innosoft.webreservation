package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.innosoft.webreservation.dao.SendLogDao;
import com.innosoft.webreservation.entity.TrnSendLog;

@Service
@Transactional
public class SendLogServiceImpl implements SendLogService {
	@Autowired
    private SendLogDao sendLogDao;	
	public List<TrnSendLog> listSendLog(){
		return sendLogDao.listSendLog();
	}
	public TrnSendLog addSendLog(TrnSendLog sendLog){
		return sendLogDao.addSendLog(sendLog);
	}
	public TrnSendLog editSendLog(TrnSendLog sendLog){
		return sendLogDao.editSendLog(sendLog);
	}
	public boolean deleteSendLog(int id){
		return sendLogDao.deleteSendLog(id);
	}
}
