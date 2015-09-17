package com.innosoft.webreservation.service;

import com.innosoft.webreservation.entity.SysSetting;

public interface SysSettingService {
	public SysSetting addSetting(SysSetting time);
	public SysSetting getSetting(SysSetting time);
	public int getMaxId();
}
