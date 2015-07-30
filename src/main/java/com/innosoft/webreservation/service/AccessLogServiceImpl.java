package com.innosoft.webreservation.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.innosoft.webreservation.dao.AccessLogDao;
import com.innosoft.webreservation.entity.TrnAccessLog;

@Service
@Transactional
public class AccessLogServiceImpl implements AccessLogService {
	@Autowired
    private AccessLogDao accessLogDao;	
	public List<TrnAccessLog> listAccessLog(){
		return accessLogDao.listAccessLog();
	}
	public TrnAccessLog addAccessLog(TrnAccessLog accessLog){
		return accessLogDao.addAccessLog(accessLog);
	}
	public TrnAccessLog editAccessLog(TrnAccessLog accessLog){
		return accessLogDao.editAccessLog(accessLog);
	}
	public boolean deleteAccessLog(int id){
		return accessLogDao.deleteAccessLog(id);
	}
}
