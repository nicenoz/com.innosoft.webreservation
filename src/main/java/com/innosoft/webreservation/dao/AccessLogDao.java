package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.TrnAccessLog;

public interface AccessLogDao {
	public List<TrnAccessLog> listAccessLog();
	public TrnAccessLog addAccessLog(TrnAccessLog accessLog);
	public TrnAccessLog editAccessLog(TrnAccessLog accessLog);
	public boolean deleteAccessLog(int id);
}

