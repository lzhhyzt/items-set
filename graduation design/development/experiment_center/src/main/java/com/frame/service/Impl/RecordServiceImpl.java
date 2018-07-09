package com.frame.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.bean.Record;
import com.frame.dao.RecordDao;
import com.frame.service.RecordService;

@Service("recordService")
public class RecordServiceImpl implements RecordService {
	
	@Resource
	private RecordDao recordDao; 
	
	// 查询记录
	@Override
	public List<Record> getAllRecord() {
		return recordDao.queryAllRecord();
	}
	
	// 添加记录
	@Override
	public int addRecord(Record record) {
		return recordDao.insertRecord(record);
	}

}
