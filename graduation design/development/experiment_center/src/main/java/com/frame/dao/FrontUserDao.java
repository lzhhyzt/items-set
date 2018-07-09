package com.frame.dao;

import java.util.List;

import com.frame.bean.FUser;
import com.frame.bean.FUserDetail;

public interface FrontUserDao {

	// 前台用户登录
    public FUser login(FUser user); 
    
    // 根据用户名获取用户信息
    public FUser getFUserInfoByName(String username);
    
    // 注册用户信息
    public int insertFUser(FUser user);
//    
//    
//    // 更新用户(根据id)
//    public int updateFUserById(User user);
//    
    // 查询所有用户
    public List<FUser> queryAllFUsers();
    
    // 查询用户总数
    public int queryFUserSum();
    
    // 查询用户的详细信息
    public FUserDetail queryFUserDetailByName(String username);
    
    // 添加新用户(用户)
    public int insertFUserDetail(FUserDetail detail);
 
    // 删除用户(根据用户名)
    public int deleteFUserByName(String username);
    
    // 删除指定的用户(用户)
    public int deleteFUserDetailById(int id);
    
    // 更新用户的真实姓名
    public int updateFUserRealname(FUser user);
    
    // 更新用户详细信息
    public int updateFUserDetailById(FUserDetail detail);
}
