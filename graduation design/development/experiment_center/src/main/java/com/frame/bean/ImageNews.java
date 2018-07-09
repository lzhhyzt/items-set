package com.frame.bean;

public class ImageNews {
	
	private int id;				// 数量索引
	private int nId;			// 对应的新闻ID
	private String url;			// 图片地址
	private String description;	// 图片内容描述
	private int isShow;			// 是否显示出来
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getNId() {
		return nId;
	}
	public void setNId(int nId) {
		this.nId = nId;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public int getIsShow() {
		return isShow;
	}
	public void setIsShow(int isShow) {
		this.isShow = isShow;
	}
}
