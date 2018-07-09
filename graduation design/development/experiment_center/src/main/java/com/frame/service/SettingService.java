package com.frame.service;

import com.frame.bean.Theme;

public interface SettingService {
	
	public Theme getTheme(int id);  //获取主题色
	
	public int updateTheme(Theme theme);   //更改主题色
}
