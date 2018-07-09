package com.frame.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.bean.LabBooking;
import com.frame.bean.Laboratory;
import com.frame.bean.Pagination;
import com.frame.bean.PerBooking;
import com.frame.dao.LaboratoryDao;
import com.frame.service.LaboratoryService;

@Service("laboratoryService")
public class LaboratoryServiceImpl implements LaboratoryService {
	
	@Resource
	private LaboratoryDao laboratoryDao;
	
	// 查询所有实验室信息
	@Override
	public List<Laboratory> getLaboratorys() {
		return laboratoryDao.queryLaboratorys();
	}
	
	// 根据id查询实验室信息
	@Override
	public Laboratory getLaboratoryById(int id) {
		return laboratoryDao.queryLaboratoryById(id);
	}
	
	// 根据实验室名查询id
	public int getLaboratoryIdByName(String name) {
		return laboratoryDao.queryLaboratoryIdByName(name);
	}
	
	// 根据实验室名模糊查询
	@Override
	public List<Laboratory> getLaboratoryByCondition(Map<String, Integer> map) {
		return laboratoryDao.queryLaboratoryByCondition(map);
	}
	
	// 获取实验室的总数目
	@Override
	public int getLaboratoryNumber() {
		return laboratoryDao.queryLaboratoryNumber();
	}
	
	// 分页查询实验室资源
	@Override
	public List<Laboratory> getListByPaging(Pagination pagination) {
		return laboratoryDao.queryListByPaging(pagination);
	}
	
	// 添加实验室
	public int addLaboratory(Laboratory lab) {
		return laboratoryDao.insertLaboratory(lab);
	}
	
	// 添加总预订详情
	public int addLabbooking(Map<String, Integer> map) {
		return laboratoryDao.insertLabbooking(map);
	}
	
	// 更新实验室
	public int updateLaboratory(Laboratory lab) {
		return laboratoryDao.updateLaboratory(lab);
	}
	
	// 删除实验室
	@Override
	public int deleteLaboratoryById(int id) {
		return laboratoryDao.deleteLaboratoryById(id);
	}
	
	// 批量删除实验室
	@Override
	public int deleteLaboratoryByArray(List<Integer> list) {
		return laboratoryDao.deleteLaboratoryByArray(list);
	}
	
	// 查询实验室的预订情况
	public List<LabBooking> getLabBooking(int id) {
		return laboratoryDao.queryLabBooking(id);
	}
	
	// 根据星期查询实验室的预订情况
	public List<LabBooking> getLabBookingByWeek(Map<String,Integer> map) {
		return laboratoryDao.queryLabBookingByWeek(map);
	}
	
	// 更新实验室的预订记录
	public int updateLabBookingInfo(LabBooking lb) {
		return laboratoryDao.updateLabBookingInfo(lb);
	}
	
	
	// 插入个人预订的记录
	public int addPerBooking(PerBooking perBooking) {
		return laboratoryDao.insertPerBooking(perBooking);
	}
	
	// 查询所有有预订实验室的用户
	public List<PerBooking> getAllBookingUsers() {
		return laboratoryDao.queryAllBookingUsers();
	}
	
	// 查询个人的预订记录
	public List<PerBooking> getPerBooking(String name) {
		return laboratoryDao.queryPerBooking(name);
	}
	
	// 删除个人的预订记录
	public int removePerBooking(PerBooking perBooking) {
		return laboratoryDao.deletePerBooking(perBooking);
	}
	
	public int updateFromLabBooking(PerBooking perBooking) {
		return laboratoryDao.updateFromLabBooking(perBooking);
	}

}
