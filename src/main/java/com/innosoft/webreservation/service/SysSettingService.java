package com.innosoft.webreservation.service;

import com.innosoft.webreservation.entity.SysSetting;
/**
 * CRUD service interface for setting
 */
public interface SysSettingService {
	/**
	 * Add setting method
	 * @param setting
	 * @return
	 */
	public SysSetting addSetting(SysSetting setting);
	/**
	 * Edit setting method
	 * @param setting
	 * @return
	 */
	public SysSetting editSetting(SysSetting setting);
	/**
	 * Get setting method
	 * @param id
	 * @return
	 */
	
	public SysSetting getSetting(int id);
	/**
	 * Get max id method
	 * @return
	 */
	public int getMaxId();
}
