package com.frame.dao;

import java.util.List;
import java.util.Map;

import com.frame.bean.LabBooking;
import com.frame.bean.Laboratory;
import com.frame.bean.Pagination;
import com.frame.bean.PerBooking;

public interface LaboratoryDao {
	
	// 查询所有实验室信息
	public List<Laboratory> queryLaboratorys();
	
	// 根据id查询实验室信息
	public Laboratory queryLaboratoryById(int id);
	
	// 根据实验室名查询id
	public int queryLaboratoryIdByName(String name);
	
	// 根据实验室名模糊查询
	public List<Laboratory> queryLaboratoryByCondition(Map<String, Integer> map);
	
	// 获取实验室的总数目
	public int queryLaboratoryNumber();
	
	// 分页查询实验室资源
	public List<Laboratory> queryListByPaging(Pagination pagination);
	
	// 添加实验室
	public int insertLaboratory(Laboratory lab);
	
	// 添加总预订详情
	public int insertLabbooking(Map<String, Integer> map);
	
	// 更新实验室
	public int updateLaboratory(Laboratory lab);
	
	// 删除实验室
	public int deleteLaboratoryById(int id);
	
	// 批量删除实验室
	public int deleteLaboratoryByArray(List<Integer> list);
	
	// 查询实验室的预订情况
	public List<LabBooking> queryLabBooking(int id);
	
	// 根据星期查询实验室的预订情况
	public List<LabBooking> queryLabBookingByWeek(Map<String,Integer> map);
	
	// 更新实验室的预订记录
	public int updateLabBookingInfo(LabBooking lb);
	
	// 插入个人预订的记录
	public int insertPerBooking(PerBooking perBooking);
	
	// 查询所有有预订实验室的用户
	public List<PerBooking> queryAllBookingUsers();
	
	// 查询个人的预订记录
	public List<PerBooking> queryPerBooking(String name);
	
	// 删除个人的预订记录
	public int deletePerBooking(PerBooking perBooking);
	
	public int updateFromLabBooking(PerBooking perBooking);
	
}
