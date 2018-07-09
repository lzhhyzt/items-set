package com.frame.bean;

public class File {
	
	private int id;				// 文件ID
	private String filename;	// 文件名
	private String url;			// 文件地址
	private int size;			// 文件大小
	private String type;		// 文件类型
	private int download;		// 下载次数
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id ;
	}
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename ;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url ;
	}
	
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size ;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type ;
	}
	
	public int getDownload() {
		return download;
	}
	public void setDownLoad(int download) {
		this.download = download ;
	}
}
