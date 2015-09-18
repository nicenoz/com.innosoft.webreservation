package com.innosoft.webreservation.service;

import com.innosoft.webreservation.entity.SysSetting;

public interface SysSettingService {
	public SysSetting addSetting(SysSetting setting);
	public SysSetting editSetting(SysSetting setting);
	public SysSetting getSetting(int id);
	public int getMaxId();
}
