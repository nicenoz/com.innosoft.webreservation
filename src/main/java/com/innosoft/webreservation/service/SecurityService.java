package com.innosoft.webreservation.service;

import com.innosoft.webreservation.entity.MstSecurityUser;
/**
 * CRUD service interface for security
 */
public interface SecurityService {
	/**
	 * Get current user method
	 * @return
	 */
	public MstSecurityUser getCurrentUser();
	/**
	 * Stamp date and time created method
	 * @param object
	 * @return
	 */
	public Object stampCreated(Object object);
	/**
	 * Stamp date and time updated method
	 * @param object
	 * @return
	 */
	public Object stampUpdated(Object object);
	/**
	 * Stamp date and time deleted method
	 * @param object
	 * @return
	 */
	public Object stampDeleted(Object object);
}
