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
	
	public SysSetting addSetting(SysSetting time) {
		return sysSettingDao.addSetting(time);
	}

	public SysSetting getSetting(SysSetting time) {
		// TODO Auto-generated method stub
		return sysSettingDao.getSetting(time);
	}

	public int getMaxId() {
		// TODO Auto-generated method stub
		return sysSettingDao.getMaxId();
	}

}
