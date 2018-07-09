package com.frame.service;

import java.util.List;

import com.frame.bean.Record;

public interface RecordService {
	
	// 查询浏览记录
	public List<Record> getAllRecord();
	
	// 添加浏览记录
	public int addRecord(Record record);
}
