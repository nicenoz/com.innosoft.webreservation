package com.innosoft.webreservation.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.innosoft.webreservation.dao.AccessLogDao;
import com.innosoft.webreservation.entity.TrnAccessLog;
/**
 * CRUD service implementation for access log
 */
@Service
@Transactional
public class AccessLogServiceImpl implements AccessLogService {
	/**
	 * Access log property
	 */
	@Autowired
    private AccessLogDao accessLogDao;
	/**
	 * List access log method
	 */
	public List<TrnAccessLog> listAccessLog(){
		return accessLogDao.listAccessLog();
	}
	/**
	 * Add access log method
	 */
	public TrnAccessLog addAccessLog(TrnAccessLog accessLog){
		return accessLogDao.addAccessLog(accessLog);
	}
	/**
	 * Edit access log method
	 */
	public TrnAccessLog editAccessLog(TrnAccessLog accessLog){
		return accessLogDao.editAccessLog(accessLog);
	}
	/**
	 * Delete access log method
	 */
	public boolean deleteAccessLog(int id){
		return accessLogDao.deleteAccessLog(id);
	}
}
