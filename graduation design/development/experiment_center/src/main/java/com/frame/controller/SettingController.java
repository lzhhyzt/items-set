package com.frame.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.frame.bean.Theme;
import com.frame.service.SettingService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/setting")
public class SettingController {
	
	@Resource
	private SettingService settingService;
	
	// 根据id获取主题色信息
	@RequestMapping("/getThemeById")
	@ResponseBody
	public JSONObject getThemeById(@RequestBody Map<String,Integer> map)throws Exception {
		JSONObject json = new JSONObject();
		ObjectMapper mapper = new ObjectMapper(); // 定义一个Jacjson对象
		
		if(map.containsKey("id")) {
			int id = map.get("id");  // 获取前端提交上来的id值
			
			// 在执行查询之前把点击链接访问次数 +1
			Theme theme = (Theme) settingService.getTheme(id);  // 调用server服务层的方法
			
			if(theme != null) {
				String themeJosn = mapper.writeValueAsString(theme); // Jackson解析库解析User对象为JSON字符串
				String jsonStr1 = "{\"theme\":"+themeJosn+"}";       // json字符串组装
				
				json.put("code", 1);
				json.put("msg", "成功");
				json.put("data", mapper.readValue(jsonStr1, JSONObject.class)); // Jackson解析库解析字符串为json对象	
			
			} else {
				json.put("code", 2);
				json.put("msg", "获取数据失败");
			}
			
		} else {
			json.put("code", 2);
			json.put("msg", "id不能为空");
		}
		
		return json;
	}
	
	// 更新主题色
	@RequestMapping("/updateTheme")
	@ResponseBody
	public JSONObject updateTheme(@RequestBody Theme theme){
		JSONObject json = new JSONObject();
		
		if (theme != null) {
			int count = settingService.updateTheme(theme); //调用server业务层的方法
			
			// 判断受影响行数
			if(count >= 1) {
				json.put("code", 1);
				json.put("msg", "更新成功");
			} else {
				json.put("code", 2);
				json.put("msg", "更新失败");
			}
			
		} else {
			json.put("code", 2);
			json.put("msg", "数据不能为空");
		}
		
		return json;
	}

}
