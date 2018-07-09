package com.frame.service;

import java.util.List;
import java.util.Map;

import com.frame.bean.LabBooking;
import com.frame.bean.Laboratory;
import com.frame.bean.Pagination;
import com.frame.bean.PerBooking;

public interface LaboratoryService {
	
	// 查询所有实验室信息
	public List<Laboratory> getLaboratorys();
	
	// 根据id查询实验室信息
	public Laboratory getLaboratoryById(int id);
	
	// 根据实验室名查询id
	public int getLaboratoryIdByName(String name);
	
	// 根据实验室名模糊查询
	public List<Laboratory> getLaboratoryByCondition(Map<String, Integer> map);
	
	// 获取实验室的总数目
	public int getLaboratoryNumber();
	
	// 分页查询实验室资源
	public List<Laboratory> getListByPaging(Pagination pagination);
	
	// 添加实验室
	public int addLaboratory(Laboratory lab);
	
	// 添加总预订详情
	public int addLabbooking(Map<String, Integer> map);
	
	// 更新实验室
	public int updateLaboratory(Laboratory lab);
		
	// 删除实验室
	public int deleteLaboratoryById(int id);
	
	// 批量删除实验室
	public int deleteLaboratoryByArray(List<Integer> list);
	
	// 查询实验室的预订情况
	public List<LabBooking> getLabBooking(int id);
	
	// 根据星期查询实验室的预订情况
	public List<LabBooking> getLabBookingByWeek(Map<String,Integer> map);
	
	// 更新实验室的预订记录
	public int updateLabBookingInfo(LabBooking lb);
	
	// 插入个人预订的记录
	public int addPerBooking(PerBooking perBooking);
	
	// 查询所有有预订实验室的用户
	public List<PerBooking> getAllBookingUsers();
		
	// 查询个人的预订记录
	public List<PerBooking> getPerBooking(String name);
	
	// 删除个人的预订记录
	public int removePerBooking(PerBooking perBooking);
	
	public int updateFromLabBooking(PerBooking perBooking);
}
