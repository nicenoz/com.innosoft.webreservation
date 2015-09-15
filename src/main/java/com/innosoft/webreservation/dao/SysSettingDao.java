package com.innosoft.webreservation.dao;

import com.innosoft.webreservation.entity.SysSetting;

public interface SysSettingDao {
	public SysSetting addSetting(SysSetting time);
	public SysSetting getSetting(SysSetting time);
	public int getMaxId();
}
