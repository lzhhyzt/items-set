package com.frame.bean;

import java.sql.Timestamp;

public class Record {
	private int id;
	private String url;
	private String refer;
	private int time;
	private Timestamp timeIn;
	private Timestamp timeOut;
	private int uid;
	
	public int getId() {
		return id;
	}	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUrl() {
		return url;
	}	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getRefer() {
		return refer;
	}	
	public void setRefer(String refer) {
		this.refer = refer;
	}
	
	public int getTime() {
		return time;
	}	
	public void setTime(int time) {
		this.time = time;
	}
	
	public Timestamp getTimeIn() {
		return timeIn;
	}	
	public void setTimeIn(Timestamp dateSQL) {
		this.timeIn = dateSQL;
	}
	
	public Timestamp getTimeOut() {
		return timeOut;
	}	
	public void setTimeOut(Timestamp timeOut) {
		this.timeOut = timeOut;
	}
	
	public int getUid() {
		return uid;
	}	
	public void setUid(int uid) {
		this.uid = uid;
	}
}
