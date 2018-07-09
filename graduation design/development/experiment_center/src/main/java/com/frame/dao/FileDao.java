package com.frame.dao;

import java.util.List;

import com.frame.bean.File;
import com.frame.bean.Pagination;

public interface FileDao {
	
	// 添加上传文件信息
	public int insertFile(File file);
	
	// 查询所有文件信息
	public List<File> queryFiles();
	
	// 根据id查询文件信息
	public File queryFileById(int id);
	
	// 根据文件名模糊查询
	public List<File> queryResourceInfoByName(String filename);
	
	// 获取文件的总数目
	public int queryResourceNumber();
	
	// 分页查询文件资源
	public List<File> queryResourceByPaging(Pagination pagination);
	
	// 删除文件
	public int deleteResourceById(int id);
	
	// 批量删除文件
	public int deleteResourceByArray(List<Integer> list);
	
	// 更新文件的下载次数
	public int updateFileDownload(int id);
}
