package com.innosoft.webreservation.service;

import com.innosoft.webreservation.entity.SysEmail;

public interface EmailService {
	public boolean sendMail(SysEmail email);
}
