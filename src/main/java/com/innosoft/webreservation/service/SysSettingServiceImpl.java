package com.innosoft.webreservation.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.SysSettingDao;
import com.innosoft.webreservation.entity.SysSetting;

@Service
@Transactional
public class SysSettingServiceImpl implements SysSettingService {

	@Autowired
    private SysSettingDao sysSettingDao;
	
	public SysSetting addSetting(SysSetting setting) {
		return sysSettingDao.addSetting(setting);
	}

	public SysSetting editSetting(SysSetting setting) {
		return sysSettingDao.editSetting(setting);
	}
	
	public SysSetting getSetting(int id) {
		return sysSettingDao.getSetting(id);
	}

	public int getMaxId() {
		return sysSettingDao.getMaxId();
	}

}
