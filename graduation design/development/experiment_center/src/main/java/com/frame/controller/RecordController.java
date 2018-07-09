package com.frame.controller;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.frame.bean.Record;
import com.frame.service.RecordService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/record")
public class RecordController {
	
	@Resource
	private RecordService recordService;
	
	// 查询浏览记录
	@RequestMapping("/getAllRecords")
	@ResponseBody
	public JSONObject getAllRecord() throws Exception {
		JSONObject json = new JSONObject();
		ObjectMapper mapper = new ObjectMapper(); 
		
		List<Record> list = (List<Record>) recordService.getAllRecord();
		
		if (list != null){
			String recordJson = mapper.writeValueAsString(list);
			String jsonStr2 = "{\"list\":"+recordJson+"}";  // json字符串组装
			
			json.put("code", "1");
			json.put("msg", "成功");
			json.put("data", mapper.readValue(jsonStr2, JSONObject.class));
			
		} else {
			json.put("code", "2");
			json.put("msg", "失败");
		}
		
		return json;
	}
	
	// 新增记录
	@RequestMapping("/addRecord")
	@ResponseBody
	public JSONObject addRecord(@RequestBody Map<String, Object> map) throws Exception{
		JSONObject json = new JSONObject();
		
		if(map != null) {
			// 创建Record对象
			Record record = new Record();
			record.setUrl(map.get("url").toString());
			record.setRefer(map.get("refer").toString());
			record.setTime((Integer)map.get("time"));
			record.setUid((Integer)map.get("uid"));
			
			// 对时间进行转化，String -> long -> Timestamp
		    java.sql.Timestamp dateSQL1 = new java.sql.Timestamp((long)map.get("timeIn"));
		    java.sql.Timestamp dateSQL2 = new java.sql.Timestamp((long)map.get("timeOut"));
		    
		    record.setTimeIn(dateSQL1);
			record.setTimeOut(dateSQL2);
			
			// 调用server的方法
			int count = recordService.addRecord(record);
			
			if(count >= 1) {
				json.put("code", 1);
				json.put("msg", "新增成功");
			} else {
				json.put("code", 2);
				json.put("msg", "新增失败");
			}
			
		} else {
			json.put("code", 2);
			json.put("msg", "数据不能为空");
		}
		
		return json;
	}
	
	// 统计历史访问人数
	@SuppressWarnings("unchecked")
	@RequestMapping("/countAllVisitor")
	@ResponseBody
	public JSONObject countAllVisitor(HttpServletRequest req, HttpSession session) throws Exception{
		JSONObject json = new JSONObject();
		
		ServletContext application = session.getServletContext();
		
		Map<String, String> map = (Map<String, String>) application.getAttribute("allVisitor");
		for (String key : map.keySet()) {
	      System.out.println(key + ":" + map.get(key));
	    }
		
//		Set<String> set = (Set<String>) application.getAttribute("tempList");
//		for (String str : set) {  
//		      System.out.println(str);  
//		}  
		
		json.put("code", 1);
		json.put("msg", "成功");
		return json;
	}
}
