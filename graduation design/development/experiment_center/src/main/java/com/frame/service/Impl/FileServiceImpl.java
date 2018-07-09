package com.frame.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.bean.File;
import com.frame.bean.Pagination;
import com.frame.dao.FileDao;
import com.frame.service.FileService;

@Service("fileService")
public class FileServiceImpl implements FileService {

	@Resource
	private FileDao fileDao;
	
	@Override
	public int addFile(File file) {
		return fileDao.insertFile(file);
	}

	@Override
	public List<File> getAllFiles() {
		return fileDao.queryFiles();
	}

	@Override
	public File getFileById(int id) {
		return fileDao.queryFileById(id);
	}
	
	@Override
	public int updateFileDownload(int id) {
		return fileDao.updateFileDownload(id);
	}

	@Override
	public List<File> getResourceInfoByName(String filename) {
		return fileDao.queryResourceInfoByName(filename);
	}

	@Override
	public int getResourceNumber() {
		return fileDao.queryResourceNumber();
	}

	@Override
	public List<File> getResourceByPaging(Pagination pagination) {
		return fileDao.queryResourceByPaging(pagination);
	}

	@Override
	public int removeResourceById(int id) {
		return fileDao.deleteResourceById(id);
	}

	@Override
	public int removeResourceByArray(List<Integer> list) {
		return fileDao.deleteResourceByArray(list);
	}

}
