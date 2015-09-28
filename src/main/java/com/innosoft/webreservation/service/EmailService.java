package com.innosoft.webreservation.service;

import com.innosoft.webreservation.entity.SysEmail;
/**
 * Service interface for emails
 */
public interface EmailService {
	/**
	 * Send email method
	 * @param email
	 * @return
	 */
	public boolean sendMail(SysEmail email);
}
