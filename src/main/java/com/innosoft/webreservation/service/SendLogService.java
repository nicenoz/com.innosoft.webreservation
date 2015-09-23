package com.innosoft.webreservation.service;

import java.util.List;
import com.innosoft.webreservation.entity.TrnSendLog;

/**
 * CRUD service interface for send log
 */
public interface SendLogService {
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
	 * Delete send log method
	 * @param id
	 * @return
	 */
	public boolean deleteSendLog(int id);
}
