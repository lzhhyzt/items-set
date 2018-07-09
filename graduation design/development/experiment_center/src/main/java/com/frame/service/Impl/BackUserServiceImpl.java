package com.frame.service.Impl;    
    
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;    
    
import com.frame.bean.User;
import com.frame.bean.UserDetail;
import com.frame.dao.BackUserDao; 
import com.frame.service.BackUserService;    
    
@Service("backUserService")   
public class BackUserServiceImpl implements BackUserService {
	
	@Resource
	private BackUserDao userDao;
    
	// 后台用户登录
	@Override
    public User login(User user) {    
        return userDao.login(user);
    }
	
	// 根据用户名获取用户信息
	@Override
	public User getUserInfoByName(String username) {
		return userDao.getUserInfoByName(username);
	}

	@Override
	public int deleteUserByName(String username) {
		return userDao.deleteUserByName(username);
	}

	@Override
	public int updateUserById(User user) {
		return userDao.updateUserById(user);
	}
	
	// 添加用户信息
	public int addUser(User user) {
		return userDao.addUser(user);
	}
	
	// 查询所有用户
    public List<User> getAllUsers() {
    	return userDao.queryAllUsers();
    }
    
    // 查询用户总数
    public int getUserSum() {
    	return userDao.queryUserSum();
    }
    
    // 查询指定用户的详细信息
    public UserDetail getUserDetailByName(String username) {
    	return userDao.queryUserDetailByName(username);
    }
    
    // 添加新用户(管理员)
    public int addUserDetail(UserDetail detail) {
    	return userDao.addUserDetail(detail);
    }
    
    // 更新用户详细信息
    public int updateUserDetail(UserDetail detail) {
    	return userDao.updateUserDetailById(detail);
    }
    
    // 删除指定的用户(管理员)
    public int removeUserDetailById(int id) {
    	return userDao.deleteUserDetailById(id);
    }
    
}    