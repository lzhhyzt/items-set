package com.frame.service;

import java.util.List;

import com.frame.bean.FUser;
import com.frame.bean.FUserDetail;

public interface FrontUserService {

	// 前台用户登录
    public FUser login(FUser user);
    
    // 根据用户名获取用户信息
    public FUser getFUserInfoByName(String username);
    
    // 注册用户信息
    public int addFUser(FUser user);
    
//    // 更新用户(根据id)
//    public int updateFUserById(User user);
//    
    // 查询所有用户
    public List<FUser> getAllFUsers();
    
    // 查询用户总数
    public int getFUserSum();
    
    // 查询用户的详细信息
    public FUserDetail getFUserDetailByName(String username);
    
    // 添加新用户详情(用户)
    public int addFUserDetail(FUserDetail detail);
      
    // 删除用户(根据用户名)
    public int removeFUserByName(String username);
    
    // 删除指定的用户(用户)
    public int removeFUserDetailById(int id);
    
    // 更新用户的真实姓名
    public int updateFUserRealname(FUser user);
    
    // 更新用户详细信息
    public int updateFUserDetail(FUserDetail detail);
}
