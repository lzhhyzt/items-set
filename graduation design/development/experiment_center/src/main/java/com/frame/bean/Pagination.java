package com.frame.bean;

public class Pagination {
	
	private int start;       // 开始
	private int currentPage; // 当前页码
	private int pageSize;    // 每页显示页数
	
	public int getStart(){
		return start;
	}
	public void setStart(int start){
		this.start = start;
	}
	
	public int getCurrentPage(){
		return currentPage;
	}
	public void setCurrentPage(int currentPage){
		this.currentPage = currentPage;
	}
	
	public int getPageSize(){
		return pageSize;
	}
	
	public void setPageSize(int pageSize){
		this.pageSize = pageSize;
	}
}
