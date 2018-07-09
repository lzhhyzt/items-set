package com.frame.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.frame.bean.FUser;
import com.frame.bean.FUserDetail;
import com.frame.service.FrontUserService;

import net.sf.json.JSONObject;

@Controller    
@RequestMapping("/fuser")
public class FUserController {
	
	@Autowired
    private FrontUserService userService;
	
    
    // 根据用户名查找用户信息
    @RequestMapping("/getFUserInfoByName")
    @ResponseBody
    public FUser getFUserInfoByName(@RequestBody Map<String,String> map) throws Exception{
    	JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper();
    	String username = map.get("username");
    	
    	// service实例化对象方法调用
    	FUser user = userService.getFUserInfoByName(username);
    	
    	if (user != null) {
    		String uj = mapper.writeValueAsString(user);
        	
        	String jsonStr = "{\"user\":"+uj+"}";  // json字符串组装
    		
    		json.put("code", "1");
    		json.put("msg", "成功");
    		json.put("data", mapper.readValue(jsonStr, JSONObject.class));
    	} else {
    		json.put("code", "2");
			json.put("msg", "失败");
    	}
    	return user;
    }
    
    // 查询所有用户
    @RequestMapping("/getAllFUsers")
	@ResponseBody
	public JSONObject getAllFUsers() throws Exception{
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper(); 		
		List<FUser> list = (List<FUser>) userService.getAllFUsers();
		
		if (list != null){
			for(FUser user: list) {
				user.setPassword("");
				
				if (user.getRealname() == null) {
					user.setRealname("");
				}
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
    @RequestMapping("/getAllFUserSum")
	@ResponseBody
	public JSONObject getAllFUserSum() throws Exception {
		JSONObject json = new JSONObject();   
		int sum = userService.getFUserSum();
		json.put("code", 1);
		json.put("msg", "成功");
		json.put("number", sum);
		return json;
	}
   
    // 查询用户的详细信息
    @SuppressWarnings("unused")
	@RequestMapping("/getFUserDetail")
	@ResponseBody
	public JSONObject getUserDetail(@RequestBody Map<String,String> map) throws Exception{
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper();
		if (map.containsKey("username")) {
			FUserDetail detail = (FUserDetail) userService.getFUserDetailByName((String)map.get("username"));
			
			if (detail.getNickname() == null) {
				detail.setNickname("");
			}
			if (detail.getRealname() == null) {
				detail.setRealname("");
			}
			if (detail.getSex() == null) {
				detail.setSex("");
			}
			if (detail.getPhone() == null) {
				detail.setPhone("");
			}
			if (detail.getEmail() == null) {
				detail.setEmail("");
			}
			if (detail.getAddress() == null) {
				detail.setAddress("");
			}
			if (detail.getAutograph() == null) {
				detail.setAutograph("这个人很懒，没留下什么");
			}
			
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
//    
//    // 添加用户信息
//    @RequestMapping("/addUser")
//    @ResponseBody
//    public JSONObject addUser(@RequestBody User user) {
//    	
//    	if (user != null) {
//        	// service实例化对象方法调用
//        	@SuppressWarnings("unused")
//			int row = userService.addUser(user);
//    	}
//    	
//    	JSONObject json = new JSONObject();
//    	if (userService.getUserInfoByName(user.getUsername()) != null) {
//        	json.put("code", "1");
//        	json.put("msg", "添加成功");
//    	} else {
//    		json.put("code", "2");
//        	json.put("msg", "添加失败");
//    	}
//    	return json;
//    }
    
    // 添加用户详细信息
    @RequestMapping("/addFUserDetail")
    @ResponseBody
    public JSONObject addFUserDetail(@RequestBody FUserDetail detail) {
    	JSONObject json = new JSONObject();
    	
    	if (detail != null) {
        	// 添加用户基本信息
    		FUser user = new FUser();
    		user.setUsername(detail.getUsername());
    		user.setPassword("123456");   // 普通用户的密码一致
    		user.setType(1); // 普通用户的类型为1
    		
			int row = userService.addFUser(user);
    		// 查询新添加的用户的ID
    		FUser user2 = userService.getFUserInfoByName(detail.getUsername());
    		// 添加用户详细信息
    		detail.setUserId(user2.getId());
        	int row2 = userService.addFUserDetail(detail);
        	
        	if (row >=1 && row2 >= 1) {
            	json.put("code", "1");
            	json.put("msg", "添加成功");
        	} else {
        		json.put("code", "2");
            	json.put("msg", "添加失败");
        	}
    	}
    	
    	return json;
    }
    
   
    // 根据ID删除用户详细信息
    @RequestMapping("/deleteFUser")
    @ResponseBody
    public JSONObject deleteFUser(@RequestBody Map<String,Object> map) {
    	JSONObject json = new JSONObject();
    	
    	// 判断要删除的用户存不存在
    	if (map.containsKey("userId")&&map.containsKey("username")) {
    		// service实例化对象方法调用
        	int row = userService.removeFUserDetailById((Integer)map.get("userId"));
        	int num = userService.removeFUserByName(map.get("username").toString());
        	// 判断是否成功删除
        	if (row >= 1 && num >= 1) {
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
    
	////// 更新用户信息
	////@RequestMapping("/updateUser")
	////@ResponseBody
	////public JSONObject updateUser(@RequestBody User user){
	////	
	////	JSONObject json = new JSONObject();
	////	if (user != null) {
	////		// service实例化对象方法调用
	////    	userService.updateUserById(user);
	////    	// 判断是否成功更新
	////    	json.put("code", "1");
	////    	json.put("msg", "更新成功");
	////    	
	////	}
	////	return json;
	////}
    
    // 更新用户的真实姓名
    @RequestMapping("/updateFUserRealname")
	@ResponseBody
	public JSONObject updateFUserRealname(@RequestBody Map<String,String> map){
		JSONObject json = new JSONObject();
		
		if (!map.isEmpty()) {
			
			FUser user = new FUser();
			user.setUsername(map.get("username"));
			user.setRealname(map.get("realname"));
			
			// 更新个人详细信息
	    	int row = userService.updateFUserRealname(user);
	    	
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
	
	
	// 更新用户详细信息
	@RequestMapping("/updateFUserDetails")
	@ResponseBody
	public JSONObject updateFUserDetails(@RequestBody FUserDetail detail){
		JSONObject json = new JSONObject();
		
		if (detail != null) {
			// 更新个人详细信息
	    	int row = userService.updateFUserDetail(detail);
	    	
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
}
