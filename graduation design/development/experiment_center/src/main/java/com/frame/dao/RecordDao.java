package com.frame.dao;

import java.util.List;

import com.frame.bean.Record;

public interface RecordDao {
	
	public List<Record> queryAllRecord();
	
	public int insertRecord(Record record);
}
