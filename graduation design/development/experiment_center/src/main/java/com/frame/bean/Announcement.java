package com.frame.bean;

import java.util.Date;

public class Announcement {
	 
	private int id;             // 公告id
	private String title;       // 公告标题
	private String author;		// 作者
	private Date date;		    // 发布日期
	private String contents;	// 公告内容
	private int state;          // 发布状态: 1-已发布  , 2-草稿
	private int visits;		    // 访问次数
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public int getState() {
		return state;
	}
	
	public void setState(int state) {
		this.state = state;
	}
	
	public int getVisits() {
		return visits;
	}
	
	public void setVisits(int visits) {
		this.visits = visits;
	}
}
