package com.frame.controller;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;

import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.frame.bean.Announcement;
import com.frame.bean.Pagination;
import com.frame.bean.Time;
import com.frame.service.AnnouncementService;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/announcement")
public class AnnouncementController {
	
	@Resource
	private AnnouncementService announcementService;
	
	// 根据id查询公告
	@RequestMapping("/getAnnouncementById")
	@ResponseBody
	public JSONObject getAnnouncementById(@RequestBody Map<String,Integer> map) throws Exception{
		
		JSONObject json = new JSONObject();       // 定义一个json对象
		ObjectMapper mapper = new ObjectMapper(); // 定义一个Jacjson对象
		
		if(map.containsKey("id")) {
			int id = map.get("id");
			
			// 在执行查询之前把点击链接访问次数 +1
			@SuppressWarnings("unused")
			int effectRow = announcementService.updateAnnouncementVisits(id);
			
			Announcement announcement = (Announcement) announcementService.getAnnouncementInfoById(id);  // 调用server服务层的方法
			
			if(announcement != null) {
				String announcementJosn = mapper.writeValueAsString(announcement); // Jackson解析库解析User对象为JSON字符串
				String jsonStr1 = "{\"announcement\":"+announcementJosn+"}";       // json字符串组装
				
				json.put("code", 1);
				json.put("msg", "成功");
				json.put("data", mapper.readValue(jsonStr1, JSONObject.class)); // Jackson解析库解析字符串为json对象
				
			}
			
		} else {
			json.put("code", 2);
			json.put("msg", "数据不能为空");
		}
		
		return json;
	}
	
		// 根据title模糊查询新闻
		@RequestMapping("/getAnnouncementByTitle")
		@ResponseBody
		public JSONObject getAnnouncementByTitle(@RequestBody Map<String, String> map) throws Exception{
			JSONObject json = new JSONObject();       
			ObjectMapper mapper = new ObjectMapper(); 
			
			if(map.containsKey("title")) {
				String title = map.get("title").toString();
				
				List<Announcement> list = (List<Announcement>) announcementService.getAnnouncementInfoByTitle(title);
				
				
				String announcementJosn = mapper.writeValueAsString(list);
				String jsonStr1 = "{\"list\":"+announcementJosn+",\"number\":"+list.size()+"}";  // json字符串组装
				
				json.put("code", 1);
				json.put("msg", "成功");
				json.put("data", mapper.readValue(jsonStr1, JSONObject.class)); 
				
			} else {
				json.put("code", 2);
				json.put("msg", "失败");
			}
			
			return json;
		}
		
		// 根据作者查询
		@RequestMapping("/getAnnouncementByAuthor")
		@ResponseBody
		public JSONObject getAnnouncementByAuthor(@RequestBody Map<String, String> map) throws Exception{
			JSONObject json = new JSONObject();       
			ObjectMapper mapper = new ObjectMapper(); 
			
			if(map.containsKey("author")) {
				String author = map.get("author").toString();
				
				List<Announcement> list = (List<Announcement>) announcementService.getAnnouncementInfoByAuthor(author);
				
				String announcementJosn = mapper.writeValueAsString(list);
				String jsonStr1 = "{\"list\":"+announcementJosn+",\"number\":"+list.size()+"}";  // json字符串组装
				
				json.put("code", 1);
				json.put("msg", "成功");
				json.put("data", mapper.readValue(jsonStr1, JSONObject.class)); 
				
			} else {
				json.put("code", 2);
				json.put("msg", "失败");
			}
			
			return json;
		}
	
	// 查询所有公告
	@RequestMapping("/getAllAnnouncement")
	@ResponseBody
	public JSONObject getAllAnnouncement() throws Exception{
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper(); 
					
		List<Announcement> list = (List<Announcement>) announcementService.getAllAnnouncementInfo();
		
		if (list != null){
			
			String announcementJosn = mapper.writeValueAsString(list);
			String jsonStr2 = "{\"list\":"+announcementJosn+"}";  // json字符串组装
			
			json.put("code", "1");
			json.put("msg", "成功");
			json.put("data", mapper.readValue(jsonStr2, JSONObject.class));
			
		} else {
			json.put("code", "2");
			json.put("msg", "失败");
		}
		
		return json;
	}
	
	// 查询公告总数目
	@RequestMapping("/announcementCount")
	@ResponseBody
	public JSONObject getAnnouncementsCount(ServletRequest request) throws Exception {
		System.out.println(request);
		JSONObject json = new JSONObject();
		
		int count = announcementService.getAnnouncementNumber();
		
		if (count >= 0) {
			json.put("code", 1);
			json.put("msg", "成功");
			json.put("number", count); // 返回新闻数据总数
			
		} else {
			json.put("code", 2);
			json.put("msg", "失败");
		}
		return json;
	}
	
	// 查询指定时间范围内的公告数目
	@RequestMapping("/getAnnouncementsCountInTime")
	@ResponseBody
	public JSONObject getAnnouncementsCountInTime(@RequestBody Map<String,String> map) throws Exception {
		JSONObject json = new JSONObject();
		Time time = new Time();
		
		// 对日期进行转化，String -> java.sql.Date
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateSQL1 = null;
        java.util.Date dateSQL2 = null;
        try {
        	// 字符串解析为日期date格式
        	dateSQL1 = (Date) sf.parse(map.get("aBeginTime").toString());
        	dateSQL2 = (Date) sf.parse(map.get("aEndTime").toString());
        } catch (ParseException e) {
        	e.printStackTrace();
        }
		time.setABeginTime(dateSQL1);
		time.setAEndTime(dateSQL2);
	
		int count = announcementService.getAnnouncementNumberInTime(time);
		
		if (count >= 0) {
			json.put("code", 1);
			json.put("msg", "成功");
			json.put("number", count); // 返回新闻数据总数
			
		} else {
			json.put("code", 2);
			json.put("msg", "失败");
		}
		
		return json;
	}
		
	
	// 分页查询
	@SuppressWarnings("unused")
	@RequestMapping("/announcementPagination")
	@ResponseBody
	public JSONObject getAnnouncementCount(@RequestBody Map<String, Integer> map) throws Exception {
		JSONObject json = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		Pagination page = new Pagination();
		
		int currentPage = map.get("currentPage");  // 当前页数
		int pageSize = map.get("pageSize");		   // 每页显示的页数
		
		int start = -1;
		
		// 数据判断
		if (currentPage <= 0 || pageSize <= 0) {  // 从前端传输过来的currentPage或者pageSize不能小于0
			json.put("code", 2);
			json.put("msg", "currentPage或者pageSize值不能小于1");
			
			// 抛出异常
			try {
				throw new Exception("currentPage或者pageSize值不能小于1");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			if (currentPage != 1){
				start = (currentPage-1) * pageSize;
			} else if (currentPage == 1){
				start = 0;
			}
			
			page.setStart(start);
			page.setCurrentPage(currentPage);
			page.setPageSize(pageSize);
			
			if (page != null) {
				List<Announcement> list = announcementService.getAnnouncementByPaging(page);
				
				String listJson = mapper.writeValueAsString(list);
				String jsonStr2 = "{\"list\":"+listJson+",\"currentPage\":"+currentPage+",\"number\":"+list.size()+"}";  // json字符串组装
				
				json.put("code", "1");
				json.put("msg", "成功");
				json.put("data", mapper.readValue(jsonStr2, JSONObject.class));
				
			} else {
				json.put("code", "2");
				json.put("msg", "失败");
			}
		}
		
		return json;
	}
	
	// 查询上一条或者下一条新闻
	@RequestMapping("/getPreviousOrNextAnnouncement")
	@ResponseBody
	public JSONObject getPreviousOrNextAnnouncement(@RequestBody Map<String, Integer> map) throws Exception {
		JSONObject json = new JSONObject();       // 定义一个json对象
		ObjectMapper mapper = new ObjectMapper(); // 定义一个Jacjson对象
		
		if(map.containsKey("id")) {
			int id = map.get("id");
			
			Announcement announcement = null;
			if ((Integer)map.get("direction") == 0) {  // 少于0时查询上一条
				try{
					announcement = (Announcement) announcementService.getPreviousAnnouncementById(id);
				}catch(Exception e) {
					System.out.println("没有匹配数据");
				}
				
			} else if((Integer)map.get("direction") == 1){  // 否则就查询下一条
				try{
					announcement = (Announcement) announcementService.getNextAnnouncementById(id);
				}catch(Exception e) {
					System.out.println("没有匹配数据");
				}
			}
			
			if(announcement != null) {
				String announcementJosn = mapper.writeValueAsString(announcement); // Jackson解析库解析User对象为JSON字符串
				String jsonStr1 = "{\"announcement\":"+announcementJosn+"}";       // json字符串组装
				
				json.put("code", 1);
				json.put("msg", "成功");
				json.put("data", mapper.readValue(jsonStr1, JSONObject.class)); // Jackson解析库解析字符串为json对象	
			
			} else {
				json.put("code", 2);
				json.put("msg", "获取数据失败");
			}
			
		} else {
			json.put("code", 2);
			json.put("msg", "数据不能为空");
		}
		
		return json;
	}
	
	// 新增新闻
	@RequestMapping("/addAnnouncement")
	@ResponseBody
	public JSONObject addAnnouncement(@RequestBody Map<String, Object> map) throws Exception{
		JSONObject json = new JSONObject();
		
		if (map != null) {
			// 创建Announcement对象
			Announcement announcement = new Announcement();
			announcement.setTitle(map.get("title").toString());
			announcement.setAuthor(map.get("author").toString());
			announcement.setContents(map.get("contents").toString());
			announcement.setState((Integer)map.get("state"));
			announcement.setVisits((Integer)map.get("visits"));
			
			// 对日期进行转化，String -> java.sql.Date
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date dateSQL = null;
	        try {
	        	// 字符串解析为日期date格式
	        	dateSQL = (Date) sf.parse(map.get("date").toString());
	        } catch (ParseException e) {
	        	e.printStackTrace();
	        }
			announcement.setDate(dateSQL);
			
			// 调用server的方法
			int count = announcementService.addAnnouncement(announcement);
			
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
	
	// 删除新闻(根据ID)
	@RequestMapping("/removeAnnouncement")
	@ResponseBody
	public JSONObject removeAnnouncement(@RequestBody Map<String, Integer> map) throws Exception {
		JSONObject json = new JSONObject();
		
		if (map.containsKey("id")) {
			
			int id = (Integer)map.get("id");
			
			int count = announcementService.removeAnnouncementById(id); //调用server业务层的方法
			
			// 判断受影响行数
			if(count == 1) {
				json.put("code", 1);
				json.put("msg", "删除成功");
			} else {
				json.put("code", 2);
				json.put("msg", "删除失败");
			}
			
		} else {
			json.put("code", 2);
			json.put("msg", "id值不能为空");
		}
		
		return json;
	}
	
	// 删除多条新闻
	@RequestMapping("/removeMultiAnnouncement")
	@ResponseBody
	public JSONObject removeMultiAnnouncement(@RequestBody Map<String, List<Integer>> map) throws Exception {
		JSONObject json = new JSONObject();
		
		if (map.containsKey("idList")) {
			
			int count = announcementService.removeAnnouncementByArray(map.get("idList")); //调用server业务层的方法
			
			// 判断受影响行数
			if(count >= 1) {
				json.put("code", 1);
				json.put("msg", "删除成功");
			} else {
				json.put("code", 2);
				json.put("msg", "删除失败");
			}
			
		} else {
			json.put("code", 2);
			json.put("msg", "id数组不能为空");
		}
		
		return json;
	}

	// 更新信息(根据ID)
	@RequestMapping("/updateAnnouncement")
	@ResponseBody
	public JSONObject updateAnnouncement(@RequestBody Map<String,Object> map) throws Exception{
		JSONObject json = new JSONObject();
		
		if (map != null) {
			// 创建Announcement对象
			Announcement announcement = new Announcement();
			announcement.setId((Integer)map.get("id"));
			announcement.setTitle(map.get("title").toString());
			announcement.setAuthor(map.get("author").toString());
			announcement.setContents(map.get("contents").toString());
			announcement.setState((Integer)map.get("state"));
			announcement.setVisits((Integer)map.get("visits"));
			
			// 对日期进行转化，String -> java.sql.Date
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date dateSQL = null;
	        try {
	        	dateSQL = sf.parse(map.get("date").toString());
	        } catch (ParseException e) {
	        	e.printStackTrace();
	        }
			announcement.setDate(dateSQL);
			
			int count = 0;
			
			// 调用server的方法
			count = announcementService.updateAnnouncementById(announcement);
			
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
			json.put("msg", "id值不能为空");
		}
		
		return json;
	}
}
