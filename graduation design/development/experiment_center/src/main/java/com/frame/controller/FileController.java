package com.frame.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.frame.bean.File;
import com.frame.bean.Pagination;
import com.frame.service.FileService;
import com.frame.util.UploadToken;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/file")
public class FileController {
	
	@Resource
	private FileService fileService;
	
	// 获取七牛存储对象生成的个人token
	@RequestMapping("/authToken")
	@ResponseBody
	public JSONObject authToken() {
		JSONObject json = new JSONObject();
		String token = UploadToken.getUpToken();
		json.put("code", 1);
		json.put("msg","成功");
		json.put("data",token);
		return json;
	}

	// 存储上传文件的信息
	@SuppressWarnings("unused")
	@RequestMapping("/addFileInfo")
	@ResponseBody
	public JSONObject addFileInfo(@RequestBody Map<String, Object> map)throws Exception {
		JSONObject json = new JSONObject();
		File file = new File();
		
		if(map != null) {
			file.setFilename(map.get("filename").toString());
			file.setUrl(map.get("url").toString());
			file.setSize((Integer)map.get("size"));
			file.setType(map.get("type").toString());
		}
		try{
			// 向数据库请求
			int row = fileService.addFile(file);
			json.put("code", 1);
			json.put("msg", "成功");
		}catch(Exception e) {
			json.put("code", 2);
			json.put("msg", "失败");
			e.printStackTrace();
		}
		return json;
	}
	
	// 获取全部文件信息
	@RequestMapping("/getAllFiles")
	@ResponseBody
	public JSONObject getAllFiles()throws Exception {
		JSONObject json = new JSONObject();
		ObjectMapper mapper = new ObjectMapper(); // jackson
		List<File> list = null;
		
		try{
			list = fileService.getAllFiles();
			
			String newsJosn = mapper.writeValueAsString(list); // Jackson解析库解析User对象为JSON字符串
			String jsonStr1 = "{\"list\":"+newsJosn+"}";       // json字符串组装
			json.put("code", 1);
			json.put("msg", "成功");
			json.put("data", mapper.readValue(jsonStr1, JSONObject.class)); // Jackson解析库解析字符串为json对象	
		}catch(Exception e) {
			json.put("code", 2);
			json.put("msg", "失败");
		}
		return json;
	}
	
	// 根据id获取文件信息
	@RequestMapping("/getFileById")
	@ResponseBody
	public JSONObject getFileById(@RequestBody Map<String,Integer> map)throws Exception {
		JSONObject json = new JSONObject();
		ObjectMapper mapper = new ObjectMapper(); // 定义一个Jacjson对象
		
		if(map.containsKey("id")) {
			int id = map.get("id");  // 获取前端提交上来的id值
			
			// 在执行查询之前把点击链接访问次数 +1
			@SuppressWarnings("unused")
			int effectRow = fileService.updateFileDownload(id);
			File file = (File) fileService.getFileById(id);  // 调用server服务层的方法
			
			if(file != null) {
				String newsJosn = mapper.writeValueAsString(file); // Jackson解析库解析User对象为JSON字符串
				String jsonStr1 = "{\"file\":"+newsJosn+"}";       // json字符串组装
				
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
	
	// 根据文件名模糊查询
	@RequestMapping("/getFileByName")
	@ResponseBody
	public JSONObject getFileByName(@RequestBody Map<String, String> map) throws Exception{
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper(); 
		
		if(map.containsKey("filename")) {
			String filename = map.get("filename").toString();
			List<File> list = (List<File>) fileService.getResourceInfoByName(filename);
			
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
	
	// 获取文件的总数目
	@RequestMapping("/getFilesNumber")
	@ResponseBody
	public JSONObject getFilesNumber(){
		JSONObject json = new JSONObject();
		int count = fileService.getResourceNumber();
		
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
	
	// 分页查询文件资源
	@SuppressWarnings("unused")
	@RequestMapping("/getFilesByPaging")
	@ResponseBody
	public JSONObject getFilesByPaging(@RequestBody Map<String, Integer> map, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setHeader("Access-Control-Allow-Origin", "*"); // 设置跨域
    	response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS"); // 设置请求方式
		
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
				List<File> list = fileService.getResourceByPaging(page);
				
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
	
	// 删除文件
	@RequestMapping("/removeFileById")
	@ResponseBody
	public JSONObject removeFileById(@RequestBody Map<String, Integer> map){
		JSONObject json = new JSONObject();
		if (map.containsKey("id")) {
			int id = (Integer)map.get("id");
			int count = fileService.removeResourceById(id); //调用server业务层的方法
			
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
	
	// 批量删除文件
	@RequestMapping("/removeMultiFiles")
	@ResponseBody
	public JSONObject removeMultiFiles(@RequestBody Map<String, List<Integer>> map){
		JSONObject json = new JSONObject();
		
		if (map.containsKey("idList")) {
			
			int count = fileService.removeResourceByArray(map.get("idList")); //调用server业务层的方法
			
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
	
	// 更新文件的下载次数
	@RequestMapping("/updateFileDownload")
	@ResponseBody
	public JSONObject updateFileDownload(@RequestBody Map<String, Integer> map){
		JSONObject json = new JSONObject();
		
		if (map.containsKey("id")) {
			int count = fileService.updateFileDownload((Integer)map.get("id")); //调用server业务层的方法
			
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
			json.put("msg", "id不能为空");
		}
		
		return json;
	}
	
}
