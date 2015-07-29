package com.innosoft.webreservation.service;

import com.innosoft.webreservation.entity.MstSecurityUser;

public interface SecurityService {
	public MstSecurityUser getCurrentUser();
	public Object stampCreated(Object object, String objectType);
	public Object stampUpdated(Object object, String objectType);
}
