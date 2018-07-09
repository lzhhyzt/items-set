package com.test.unit;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.frame.bean.User;
import com.frame.dao.BackUserDao;

public class TestUnit extends BaseJunit4Test {
	
	//自动注入，需要将BookDao纳入到Spring容器的管理下，不然会报错
	@Autowired
	private BackUserDao userDao;
	
	// 测试用户数目
	@Test
	public void getUserNumerTest() {
		// 调用DAO层的方法
		int num = userDao.queryUserSum();
		// 断言
		Assert.assertTrue(num > 0);
		Assert.assertEquals(num,7);
	}
	
	// 测试用户查询(根据用户名)
	@Test
	public void getUserByNameTest() {
		User user = userDao.getUserInfoByName("lily");
		// 断言
		Assert.assertEquals(user.getUsername(), "lily");
		Assert.assertEquals(user.getType(), 2);
	}
	
	// 添加用户
	@Test
	@Transactional   //标明此方法需使用事务
	@Rollback(true) //标明使用完此方法后事务不回滚,true时为回滚
	public void addUserTest() {
		User user = new User();
		user.setUsername("test");
		user.setPassword("123456");
		user.setType(2);
		
		int n = userDao.addUser(user);
		// 断言
		Assert.assertTrue(n > 0);
		Assert.assertEquals(n, 1);
	}

}
