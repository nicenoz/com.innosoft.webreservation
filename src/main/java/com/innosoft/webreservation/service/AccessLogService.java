package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.TrnAccessLog;
/**
 * CRUD service interface for access log
 */
public interface AccessLogService {
	/**
	 * List access log method
	 * @return
	 */
	public List<TrnAccessLog> listAccessLog();
	/**
	 * Add access log method
	 * @param acessLog
	 * @return
	 */
	public TrnAccessLog addAccessLog(TrnAccessLog acessLog);
	/**
	 * Edit access log method 
	 * @param accessLog
	 * @return
	 */
	public TrnAccessLog editAccessLog(TrnAccessLog accessLog);
	/**
	 * Delete access log method 
	 * @param id
	 * @return
	 */
	public boolean deleteAccessLog(int id);
}
