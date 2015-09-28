package com.innosoft.webreservation.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.SysSettingDao;
import com.innosoft.webreservation.entity.SysSetting;
/**
 * CRUD service implementation for setting
 */
@Service
@Transactional
public class SysSettingServiceImpl implements SysSettingService {
	/**
	 * System setting property
	 */
	@Autowired
    private SysSettingDao sysSettingDao;
	/**
	 * Add setting method
	 */
	public SysSetting addSetting(SysSetting setting) {
		return sysSettingDao.addSetting(setting);
	}
	/**
	 * Edit setting method
	 */
	public SysSetting editSetting(SysSetting setting) {
		return sysSettingDao.editSetting(setting);
	}
	/**
	 * Get setting method
	 */
	public SysSetting getSetting(int id) {
		return sysSettingDao.getSetting(id);
	}
	/**
	 * Get max id method
	 */
	public int getMaxId() {
		return sysSettingDao.getMaxId();
	}

}
