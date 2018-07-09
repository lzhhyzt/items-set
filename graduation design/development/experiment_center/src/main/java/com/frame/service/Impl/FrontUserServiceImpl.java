package com.frame.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.bean.FUser;
import com.frame.bean.FUserDetail;
import com.frame.dao.FrontUserDao;
import com.frame.service.FrontUserService;

@Service("frontUserService")
public class FrontUserServiceImpl implements FrontUserService{
	
	@Resource
	private FrontUserDao userDao;
	
	// 前台用户登录
	@Override
	public FUser login(FUser user) {
		return userDao.login(user);
	}

	@Override
	public FUser getFUserInfoByName(String username) {
		return userDao.getFUserInfoByName(username);
	}
	
	// 添加新用户
	@Override
	public int addFUser(FUser user) {
		return userDao.insertFUser(user);
	}


//	@Override
//	public int updateFUserById(User user) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
	
	// 获取所有用户信息
	@Override
	public List<FUser> getAllFUsers() {
		return userDao.queryAllFUsers();
	}
	
	// 获取用户总数
	@Override
	public int getFUserSum() {
		return userDao.queryFUserSum();
	}

	// 查询用户的详细信息
	@Override
	public FUserDetail getFUserDetailByName(String username) {
		return userDao.queryFUserDetailByName(username);
	}
	
	// 添加用户详情
	@Override
	public int addFUserDetail(FUserDetail detail) {
		return userDao.insertFUserDetail(detail);
	}
	
	

	// 删除用户(根据用户名)
    public int removeFUserByName(String username) {
    	return userDao.deleteFUserByName(username);
    }
    
    // 删除指定的用户(用户)
    public int removeFUserDetailById(int id) {
    	return userDao.deleteFUserDetailById(id);
    }
    
    // 更新用户的真实姓名
    public int updateFUserRealname(FUser user) {
    	return userDao.updateFUserRealname(user);
    }
    
    // 更新用户的详细信息
	@Override
	public int updateFUserDetail(FUserDetail detail) {
		return userDao.updateFUserDetailById(detail);
	}
}
