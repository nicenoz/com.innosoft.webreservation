package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.TrnAccessLog;
/**
 *CRUD interface for access log data object
 */
public interface AccessLogDao {
	/**
	 * List access log method
	 * @return
	 */
	public List<TrnAccessLog> listAccessLog();
	/**
	 * Add access log method
	 * @param accessLog
	 * @return
	 */
	public TrnAccessLog addAccessLog(TrnAccessLog accessLog);
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

