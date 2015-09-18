package com.innosoft.webreservation.dao;

import com.innosoft.webreservation.entity.SysSetting;

public interface SysSettingDao {
	public SysSetting addSetting(SysSetting setting);
	public SysSetting editSetting(SysSetting setting);
	public SysSetting getSetting(int id);
	public int getMaxId();
}
