package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.TrnAccessLog;

public interface AccessLogService {
	public List<TrnAccessLog> listAccessLog();
	public TrnAccessLog addAccessLog(TrnAccessLog acessLog);
	public TrnAccessLog editAccessLog(TrnAccessLog accessLog);
	public boolean deleteAccessLog(int id);
}
