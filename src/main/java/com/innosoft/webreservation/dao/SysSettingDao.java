package com.innosoft.webreservation.dao;

import com.innosoft.webreservation.entity.SysSetting;
/**
 *CRUD interface for setting data object
 */
public interface SysSettingDao {
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
