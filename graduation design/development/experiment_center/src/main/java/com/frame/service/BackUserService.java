package com.frame.service;    
    
import java.util.List;

import com.frame.bean.User;
import com.frame.bean.UserDetail;    
    
public interface BackUserService {    
    
	// 后台用户登录
    public User login(User user);  
    
    // 根据用户名获取用户信息
    public User getUserInfoByName(String username);
    
    // 注册用户信息
    public int addUser(User user);
    
    // 删除用户(根据用户名)
    public int deleteUserByName(String username);
    
    // 更新用户(根据id)
    public int updateUserById(User user);
    
    // 查询所有用户
    public List<User> getAllUsers();
    
    // 查询用户总数
    public int getUserSum();
    
    // 查询用户的详细信息
    public UserDetail getUserDetailByName(String username);
    
    // 添加新用户(管理员)
    public int addUserDetail(UserDetail detail);
    
    // 更新用户详细信息
    public int updateUserDetail(UserDetail detail);
    
    // 删除指定的用户(管理员)
    public int removeUserDetailById(int id);
     
}    