 package com.frame.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.frame.bean.ImageNews;
import com.frame.bean.News;
import com.frame.bean.Pagination;
import com.frame.bean.Time;
import com.frame.service.NewsService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@Resource
	private NewsService newsService;
	
	// 根据ID查询新闻
	@SuppressWarnings("unused")
	@RequestMapping("/getNewsById")
	@ResponseBody
	public JSONObject getNewsById(@RequestBody Map<String,Integer> map) throws Exception{
		JSONObject json = new JSONObject();       // 定义一个json对象
		ObjectMapper mapper = new ObjectMapper(); // 定义一个Jacjson对象
		
		if(map.containsKey("id")) {
			int id = map.get("id");  // 获取前端提交上来的id值
			
			// 在执行查询之前把点击链接访问次数 +1
			int effectRow = newsService.updateNewsVisits(id);
			News news = (News) newsService.getNewsInfoById(id);  // 调用server服务层的方法
			
			// 检查查询出来的副标题是不是为null类型，是的话赋予一个空字符串，否则下面json组装出错
			if (news.getSubtitle() == null) {
				news.setSubtitle("");
			}
			
			if(news != null) {
				String newsJosn = mapper.writeValueAsString(news); // Jackson解析库解析User对象为JSON字符串
				String jsonStr1 = "{\"news\":"+newsJosn+"}";       // json字符串组装
				
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
	
	// 根据title模糊查询新闻
	@RequestMapping("/getNewsByTitle")
	@ResponseBody
	public JSONObject getNewsByTitle(@RequestBody Map<String, String> map) throws Exception{
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper(); 
		
		if(map.containsKey("title")) {
			String title = map.get("title").toString();
			
			List<News> list = (List<News>) newsService.getNewsInfoByTitle(title);
			
			// 检查查询出来的副标题是不是为null类型，是的话赋予一个空字符串，否则下面json组装出错
			for(News news: list) {
				if (news.getSubtitle() == null) {
					news.setSubtitle("");
				}
			}
			
			String newsJosn = mapper.writeValueAsString(list);
			String jsonStr1 = "{\"list\":"+newsJosn+",\"number\":"+list.size()+"}";  // json字符串组装
			
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
	@RequestMapping("/getNewsByAuthor")
	@ResponseBody
	public JSONObject getNewsByAuthor(@RequestBody Map<String, String> map) throws Exception{
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper(); 
		
		if(map.containsKey("author")) {
			String author = map.get("author").toString();
			
			List<News> list = (List<News>) newsService.getNewsInfoByAuthor(author);
			
			// 检查查询出来的副标题是不是为null类型，是的话赋予一个空字符串，否则下面json组装出错
			for(News news: list) {
				if (news.getSubtitle() == null) {
					news.setSubtitle("");
				}
			}
			
			String newsJosn = mapper.writeValueAsString(list);
			String jsonStr1 = "{\"list\":"+newsJosn+",\"number\":"+list.size()+"}";  // json字符串组装
			
			json.put("code", 1);
			json.put("msg", "成功");
			json.put("data", mapper.readValue(jsonStr1, JSONObject.class)); 
			
		} else {
			json.put("code", 2);
			json.put("msg", "失败");
		}
		
		return json;
	}
	
	// 查询所有新闻
	@RequestMapping("/getAllNews")
	@ResponseBody
	public JSONObject getAllNews(HttpServletRequest res) throws Exception{
		System.out.println(res);
		
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper(); 
					
		List<News> list = (List<News>) newsService.getAllNewsInfo();
		
		if (list != null){
			// 循环遍历list，并判断副标题是否为null，是的话，赋予空字符串
			for(News news : list) {
				if(news.getSubtitle() == null) {
					news.setSubtitle("");
				}
			}
			
			String newsJosn = mapper.writeValueAsString(list);
			String jsonStr2 = "{\"news\":"+newsJosn+"}";  // json字符串组装
			
			json.put("code", "1");
			json.put("msg", "成功");
			json.put("data", mapper.readValue(jsonStr2, JSONObject.class));
			
		} else {
			json.put("code", "2");
			json.put("msg", "失败");
		}
		
		return json;
	}
	
	// 查询新闻总数目
	@RequestMapping("/newsCount")
	@ResponseBody
	public JSONObject getNewsCount() throws Exception {
		JSONObject json = new JSONObject();
		
		int count = newsService.getNewsNumber();
		
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
	
	// 查询指定时间范围内的新闻数目
	@RequestMapping("/getNewsCountInTime")
	@ResponseBody
	public JSONObject getNewsCountInTime(@RequestBody Map<String,String> map) throws Exception {
		JSONObject json = new JSONObject();
		Time time = new Time();
		
		// 对时间进行转化，String -> Timestamp
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date date1 = null;
		java.util.Date date2 = null;
		try {
			date1 = sf.parse(map.get("beginTime").toString());
			date2 = sf.parse(map.get("endTime").toString());
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	    java.sql.Timestamp dateSQL1 = new java.sql.Timestamp(date1.getTime());
	    java.sql.Timestamp dateSQL2 = new java.sql.Timestamp(date2.getTime());
	    time.setBeginTime(dateSQL1);
	    time.setEndTime(dateSQL2);
	
		int count = newsService.getNewsNumberInTime(time);
		
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
	@RequestMapping("/newsPagination")
	@ResponseBody
	public JSONObject getNewsPagination(@RequestBody Map<String, Integer> map, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
				List<News> list = newsService.getNewsByPaging(page);
				
				// 循环遍历list，并判断副标题是否为null，是的话，赋予空字符串
				for(News news : list) {
					if(news.getSubtitle() == null) {
						news.setSubtitle("");
					}
				}
				
				String newsJosn = mapper.writeValueAsString(list);
				String jsonStr2 = "{\"list\":"+newsJosn+",\"currentPage\":"+currentPage+",\"number\":"+list.size()+"}";  // json字符串组装
				
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
	@RequestMapping("/getPreviousOrNextNews")
	@ResponseBody
	public JSONObject getPreviousOrNextNews(@RequestBody Map<String, Integer> map) throws Exception {
		JSONObject json = new JSONObject();       // 定义一个json对象
		ObjectMapper mapper = new ObjectMapper(); // 定义一个Jacjson对象
		
		if(map.containsKey("id")) {
			int id = map.get("id");
			
			News news = null;
			if ((Integer)map.get("direction") == 0) {  // 少于0时查询上一条
				try{
					news = (News) newsService.getPreviousNewsById(id);
					if (news.getSubtitle() == null) {
						news.setSubtitle("");
					}
				}catch(Exception e) {
					System.out.println("没有匹配数据");
				}
				
			} else if((Integer)map.get("direction") == 1){  // 否则就查询下一条
				try{
					news = (News) newsService.getNextNewsById(id);
					if (news.getSubtitle() == null) {
						news.setSubtitle("");
					}
				}catch(Exception e) {
					System.out.println("没有匹配数据");
				}
			}
			
			if(news != null) {
				String newsJosn = mapper.writeValueAsString(news); // Jackson解析库解析User对象为JSON字符串
				String jsonStr1 = "{\"news\":"+newsJosn+"}";       // json字符串组装
				
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
	@RequestMapping("/addNews")
	@ResponseBody
	public JSONObject addNews(@RequestBody Map<String, Object> map) throws Exception{
		JSONObject json = new JSONObject();
		
		if (map != null) {
			// 创建News对象
			News news = new News();
			news.setTitle(map.get("title").toString());
			news.setSubtitle(map.get("subtitle").toString());
			news.setAuthor(map.get("author").toString());
			news.setContents(map.get("contents").toString());
			news.setState((Integer)map.get("state"));
			news.setVisits((Integer)map.get("visits"));
			
			// 对时间进行转化，String -> Timestamp
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			java.util.Date date = null;
			try {
				date = sf.parse(map.get("date").toString());
		    } catch (ParseException e) {
		        e.printStackTrace();
		    }
		    java.sql.Timestamp dateSQL = new java.sql.Timestamp(date.getTime());
			news.setDate(dateSQL);
			
			// 调用server的方法
			int count = newsService.addNews(news);
			
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
	@RequestMapping("/removeNews")
	@ResponseBody
	public JSONObject removeNews(@RequestBody Map<String, Integer> map) throws Exception {
		JSONObject json = new JSONObject();
		
		if (map.containsKey("id")) {
			
			int id = (Integer)map.get("id");
			
			int count = newsService.removeNewsById(id); //调用server业务层的方法
			
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
	
	// 删除多条新闻(根据ID数组)
	@RequestMapping("/removeMultiNews")
	@ResponseBody
	public JSONObject removeMultiNews(@RequestBody Map<String, List<Integer>> map) throws Exception {
		JSONObject json = new JSONObject();
		
		if (map.containsKey("idList")) {
			
			int count = newsService.removeNewsByArray(map.get("idList")); //调用server业务层的方法
			
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
	
	// 更新新闻信息(根据ID)
	@RequestMapping("/updateNews")
	@ResponseBody
	public JSONObject updateNews(@RequestBody Map<String,Object> map) throws Exception{
		JSONObject json = new JSONObject();
		
		if (map != null) {
			// 创建News对象
			News news = new News();
			news.setId((Integer)map.get("id"));
			news.setTitle(map.get("title").toString());
			news.setSubtitle(map.get("subtitle").toString());
			news.setAuthor(map.get("author").toString());
			news.setContents(map.get("contents").toString());
			news.setState((Integer)map.get("state"));
			news.setVisits((Integer)map.get("visits"));
			
			// 对时间进行转化，String -> Timestamp
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			java.util.Date date = null;
			try {
				date = sf.parse(map.get("date").toString());
		    } catch (ParseException e) {
		        e.printStackTrace();
		    }
		    java.sql.Timestamp dateSQL = new java.sql.Timestamp(date.getTime());
			news.setDate(dateSQL);
			
			// 更新新闻的一般信息
			int count = newsService.updateNewsById(news);
			
			int rows = 0;
			
			if (map.containsKey("isShow")) {
				if (map.containsKey("url") && map.containsKey("description")) {
					// 更新轮播新闻信息
					ImageNews imageNews = new ImageNews();
					imageNews.setNId((Integer)map.get("id"));
					imageNews.setUrl(map.get("url").toString());
					imageNews.setDescription(map.get("description").toString());
					imageNews.setIsShow((Integer)map.get("isShow"));
					
					rows = newsService.updateImageNews(imageNews);
				}
			}
			// 判断受影响行数
			if(count >= 0 || rows >= 0) {
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
	
	// 查询图片新闻对应的图片信息
	@RequestMapping("/getImageNews")
	@ResponseBody
	public JSONObject getImageNews() throws Exception{
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper(); 
					
		// 调用查询
		List<ImageNews> list = (List<ImageNews>) newsService.getImageNews();
		
		if (list != null){
			String newsJosn = mapper.writeValueAsString(list);
			String jsonStr2 = "{\"list\":"+newsJosn+"}";  // json字符串组装
			json.put("code", "1");
			json.put("msg", "成功");
			json.put("data", mapper.readValue(jsonStr2, JSONObject.class));
			
		} else {
			json.put("code", "2");
			json.put("msg", "失败");
		}
		return json;
	}
	
	// 查询图片新闻对应的图片信息
	@RequestMapping("/getImageNewsById")
	@ResponseBody
	public JSONObject getImageNewsById(@RequestBody Map<String,Object> map) throws Exception{
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper(); 
		
		if (map.containsKey("nId")) {
			// 根据新闻id从数据库中取数据
			ImageNews imageNews = (ImageNews) newsService.getImageNewsById((Integer)map.get("nId"));
			
			if (imageNews != null){
				String newsJosn = mapper.writeValueAsString(imageNews);
				String jsonStr2 = "{\"imageNews\":"+newsJosn+"}";  // json字符串组装
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
	
	// 新增图片新闻对应的图片信息
	@RequestMapping("/addImageNews")
	@ResponseBody
	public JSONObject addImageNews(@RequestBody Map<String, Object> map) throws Exception{
		JSONObject json = new JSONObject();
		
		if (map != null) {
			// 创建News对象
			ImageNews imageNews = new ImageNews();
			imageNews.setUrl(map.get("url").toString());
			imageNews.setDescription(map.get("description").toString());
			imageNews.setIsShow((Integer)map.get("isShow"));
			
			// 查询最新添加的新闻详情
			int id = newsService.getLastNews().getId();
			imageNews.setNId(id);
			// 把需要轮播的信息添加进数据库添加进数据库
			int count = newsService.addImageNews(imageNews);
			
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
}
