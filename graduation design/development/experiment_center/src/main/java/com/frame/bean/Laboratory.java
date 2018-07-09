package com.frame.bean;

public class Laboratory {
	
	private int id;					// 索引
	private String name;			// 实验实名
	private int floor;				// 楼层
	private int usages;				// 用途
	private int vacant;				// 空闲情况
	private String building;		// 位于哪栋楼
	private String description;		// 描述
	
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id = id;
	}
	
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name = name;
	}
	
	public int getFloor(){
		return floor;
	}
	public void setFloor(int floor){
		this.floor = floor;
	}
	
	public int getUsages(){
		return usages;
	}
	public void setUsages(int usages){
		this.usages = usages;
	}
	
	public int getVacant(){
		return vacant;
	}
	public void setVacant(int vacant){
		this.vacant = vacant;
	}
	
	public String getBuilding(){
		return building;
	}
	public void setBuilding(String building){
		this.building = building;
	}
	
	public String getDescription(){
		return description;
	}
	public void setDescription(String description){
		this.description = description;
	}
}
