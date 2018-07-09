package com.frame.dao;

import com.frame.bean.Theme;

public interface SettingDao {

	public Theme queryTheme(int id);  // 获取主题色
	
	public int updateTheme(Theme theme);   // 更改主题色
}
