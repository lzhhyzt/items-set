package com.frame.bean;

public class Theme {
	
	private int id;
	private String currentColor;
	private String previousColor;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCurrentColor() {
		return currentColor;
	}
	public void setCurrentColor(String currentColor) {
		this.currentColor = currentColor;
	}
	
	public String getPreviousColor() {
		return previousColor;
	}
	public void setPreviousColor(String previousColor) {
		this.previousColor = previousColor;
	}
}
