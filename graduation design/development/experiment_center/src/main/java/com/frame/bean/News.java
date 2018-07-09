package com.frame.bean;

import java.sql.Timestamp;

public class News {
	
	private int id;             // 新闻id
	private String title;       // 新闻标题
	private String subtitle;	// 副标题
	private String author;		// 作者
	private Timestamp date;		// 发表日期
	private String contents;	// 新闻内容
	private int state;          // 发表状态: 1-已发表  , 2-草稿
	private int visits;			// 访问次数
	
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
	
	public String getSubtitle() {
		return subtitle;
	}
	
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public Timestamp getDate() {
		return date;
	}
	
	public void setDate(Timestamp date) {
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
