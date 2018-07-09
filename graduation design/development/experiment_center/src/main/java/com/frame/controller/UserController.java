package com.frame.controller;    
    
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.frame.bean.User;
import com.frame.bean.UserDetail;
import com.frame.service.BackUserService;
import net.sf.json.JSONObject;    
    
@Controller    
@RequestMapping("/user")    
public class UserController {
	
	@Autowired
    private BackUserService userService;	
    
    // 根据用户名查找用户信息
    @RequestMapping("/getUserInfoByName")
    @ResponseBody
    public User getUserInfoByName(@RequestBody Map<String,String> map) {
    	
    	String username = map.get("username");
    	
    	// service实例化对象方法调用
    	User user = userService.getUserInfoByName(username);
    	
    	return user;
    }
    
    // 查询所有用户
    @RequestMapping("/getAllUsers")
	@ResponseBody
	public JSONObject getAllUsers() throws Exception{
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper(); 		
		List<User> list = (List<User>) userService.getAllUsers();
		
		if (list != null){
			for(User user: list) {
				user.setPassword("");
			}
			String listJosn = mapper.writeValueAsString(list);
			String jsonStr2 = "{\"list\":"+listJosn+"}";  // json字符串组装
			
			json.put("code", "1");
			json.put("msg", "成功");
			json.put("data", mapper.readValue(jsonStr2, JSONObject.class));
			
		} else {
			json.put("code", "2");
			json.put("msg", "失败");
		}
		return json;
	}
    
    // 查询所有用户总数量
    @RequestMapping("/getAllUserSum")
	@ResponseBody
	public JSONObject getAllUserSum() throws Exception {
		JSONObject json = new JSONObject();   
		int sum = userService.getUserSum();
		json.put("code", 1);
		json.put("msg", "成功");
		json.put("number", sum);
		return json;
	}
    
    
    // 查询用户的详细信息
    @RequestMapping("/getUserDetail")
	@ResponseBody
	public JSONObject getUserDetail(@RequestBody Map<String,String> map) throws Exception{
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper();
		if (map.containsKey("username")) {
			UserDetail detail = (UserDetail) userService.getUserDetailByName((String)map.get("username"));
			
			if (detail != null){
				String detailJosn = mapper.writeValueAsString(detail);
				String jsonStr = "{\"detail\":"+detailJosn+"}"; 
				
				json.put("code", "1");
				json.put("msg", "成功");
				json.put("data", mapper.readValue(jsonStr, JSONObject.class));
				
			} else {	
				json.put("code", "2");
				json.put("msg", "失败");
			}
		}
		return json;
	}
    
    // 添加用户信息
    @RequestMapping("/addUser")
    @ResponseBody
    public JSONObject addUser(@RequestBody User user) {
    	
    	if (user != null) {
        	// service实例化对象方法调用
        	@SuppressWarnings("unused")
			int row = userService.addUser(user);
    	}
    	
    	JSONObject json = new JSONObject();
    	if (userService.getUserInfoByName(user.getUsername()) != null) {
        	json.put("code", "1");
        	json.put("msg", "添加成功");
    	} else {
    		json.put("code", "2");
        	json.put("msg", "添加失败");
    	}
    	return json;
    }
    
    // 添加用户详细信息
    @RequestMapping("/addUserDetail")
    @ResponseBody
    public JSONObject addUserDetail(@RequestBody UserDetail detail) {
    	JSONObject json = new JSONObject();
    	
    	if (detail != null) {
        	// 添加用户基本信息
    		User user = new User();
    		user.setUsername(detail.getUsername());
    		user.setPassword("123456");   // 普通管理员的密码一致
    		user.setType(2); // 普通管理员的类型为2
    		
    		@SuppressWarnings("unused")
			int row = userService.addUser(user);
    		// 查询新添加的用户的ID
    		User user2 = userService.getUserInfoByName(detail.getUsername());
    		// 添加用户详细信息
    		detail.setUserId(user2.getId());
        	int row2 = userService.addUserDetail(detail);
        	
        	if (row2 >= 1) {
            	json.put("code", "1");
            	json.put("msg", "添加成功");
        	} else {
        		json.put("code", "2");
            	json.put("msg", "添加失败");
        	}
    	}
    	
    	return json;
    }
    
//    // 更新用户信息
//    @RequestMapping("/updateUser")
//    @ResponseBody
//    public JSONObject updateUser(@RequestBody User user){
//    	
//    	JSONObject json = new JSONObject();
//    	if (user != null) {
//    		// service实例化对象方法调用
//        	userService.updateUserById(user);
//        	// 判断是否成功更新
//        	json.put("code", "1");
//        	json.put("msg", "更新成功");
//        	
//    	}
//    	return json;
//    }
    
    // 更新用户详细信息
    @RequestMapping("/updateUserDetail")
    @ResponseBody
    public JSONObject updateUserDetail(@RequestBody UserDetail detail){
    	JSONObject json = new JSONObject();
    	
    	if (detail != null) {
    		// service实例化对象方法调用
        	int row = userService.updateUserDetail(detail);
        	// 判断是否成功更新
        	if (row >= 1) {
            	json.put("code", "1");
            	json.put("msg", "更新成功");
        	} else {
        		json.put("code", "2");
            	json.put("msg", "更新失败");
        	}
    	}
    	return json;
    }
    
    // 根据用户名删除用户
    @RequestMapping("/deleteUserByName")
    @ResponseBody
    public JSONObject deleteUserByName(@RequestBody Map<String,String> map) {
    	String username = map.get("username");
    	
    	JSONObject json = new JSONObject();
    	
    	// 判断要删除的用户存不存在
    	if (userService.getUserInfoByName(username) != null) {
    		if (username != "") {
        		// service实例化对象方法调用
            	@SuppressWarnings("unused")
				int row = userService.deleteUserByName(username);
        	}
        
        	// 判断是否成功删除
        	if (userService.getUserInfoByName(username) == null) {
            	json.put("code", "1");
            	json.put("msg", "删除成功");
        	} else {
        		json.put("code", "2");
            	json.put("msg", "删除失败");
        	}
    	} else {
    		json.put("code", "2");
        	json.put("msg", "删除失败，用户不存在");
    	}
    	
    	return json;
    }
    
 // 根据id删除用户详细信息
    @RequestMapping("/deleteUserDetail")
    @ResponseBody
    public JSONObject deleteUserDetail(@RequestBody Map<String,Object> map) {
    	JSONObject json = new JSONObject();
    	
    	// 判断要删除的用户存不存在
    	if (map.containsKey("userId")&&map.containsKey("username")) {
    		// service实例化对象方法调用
        	int row = userService.removeUserDetailById((Integer)map.get("userId"));
        	userService.deleteUserByName(map.get("username").toString());
        	// 判断是否成功删除
        	if (row >= 1) {
            	json.put("code", "1");
            	json.put("msg", "删除成功");
        	} else {
        		json.put("code", "2");
            	json.put("msg", "删除失败");
        	}
    	} else {
    		json.put("code", "2");
        	json.put("msg", "删除失败，用户不存在");
    	}
    	return json;
    }
}    