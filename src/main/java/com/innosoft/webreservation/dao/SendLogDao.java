package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.TrnSendLog;
/**
 * CRUD interface for send log data object
 */
public interface SendLogDao {
	/**
	 * List send log method
	 * @return
	 */
	public List<TrnSendLog> listSendLog();
	/**
	 * Add send log method
	 * @param sendLog
	 * @return
	 */
	public TrnSendLog addSendLog(TrnSendLog sendLog);
	/**
	 * Edit send log method
	 * @param sendLog
	 * @return
	 */
	public TrnSendLog editSendLog(TrnSendLog sendLog);
	/**
	 * Edit send log method
	 * @param id
	 * @return
	 */
	public boolean deleteSendLog(int id);
}

