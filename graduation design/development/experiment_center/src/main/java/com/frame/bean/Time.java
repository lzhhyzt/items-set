package com.frame.bean;

import java.sql.Timestamp;
import java.util.Date;

public class Time {
	private Timestamp beginTime;
	private Timestamp endTime;
	private Date aBeginTime;
	private Date aEndTime;
	
	public Timestamp getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
	}
	
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	
	public Date getABeginTime() {
		return aBeginTime;
	}
	public void setABeginTime(Date aBeginTime) {
		this.aBeginTime = aBeginTime;
	}
	
	public Date getAEndTime() {
		return aEndTime;
	}
	public void setAEndTime(Date aEndTime) {
		this.aEndTime = aEndTime;
	}

}
