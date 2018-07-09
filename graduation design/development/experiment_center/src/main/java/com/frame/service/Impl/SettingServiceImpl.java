package com.frame.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.bean.Theme;
import com.frame.dao.SettingDao;
import com.frame.service.SettingService;

@Service("settingService")
public class SettingServiceImpl implements SettingService {

	@Resource
	private SettingDao settingDao;
	
	@Override
	public Theme getTheme(int id) {
		return settingDao.queryTheme(id);
	}

	@Override
	public int updateTheme(Theme theme) {
		return settingDao.updateTheme(theme);
	}

}
