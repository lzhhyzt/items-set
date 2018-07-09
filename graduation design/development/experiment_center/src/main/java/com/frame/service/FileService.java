package com.frame.service;

import java.util.List;

import com.frame.bean.File;
import com.frame.bean.Pagination;

public interface FileService {
	
	// 添加上传文件信息
	public int addFile(File file);
	
	// 查询所有文件信息
	public List<File> getAllFiles();
	
	// 根据id查询文件信息
	public File getFileById(int id);
	
	// 更新文件的下载次数
	public int updateFileDownload(int id);
	
	// 根据文件名模糊查询
	public List<File> getResourceInfoByName(String filename);
	
	// 获取文件的总数目
	public int getResourceNumber();
	
	// 分页查询文件资源
	public List<File> getResourceByPaging(Pagination pagination);
	
	// 删除文件
	public int removeResourceById(int id);
	
	// 批量删除文件
	public int removeResourceByArray(List<Integer> list);
}
