package com.frame.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.frame.bean.LabBooking;
import com.frame.bean.Laboratory;
import com.frame.bean.Pagination;
import com.frame.bean.PerBooking;
import com.frame.service.LaboratoryService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/laboratory")
public class LaboratoryController {
	
	@Resource
	private LaboratoryService service;
	
	// 获取全部实验室信息
	@RequestMapping("/getAllLaboratorys")
	@ResponseBody
	public JSONObject getAllLaboratorys()throws Exception {
		JSONObject json = new JSONObject();
		ObjectMapper mapper = new ObjectMapper(); // jackson
		List<Laboratory> list = null;
		
		try{
			list = service.getLaboratorys();
			
			// 循环遍历description属性并赋值，否则会出错
			for(Laboratory lab : list) {
				if(lab.getDescription() == null) {
					lab.setDescription("");
				}
			}
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
	
	// 根据id获取实验室信息
	@SuppressWarnings("unused")
	@RequestMapping("/getLaboratoryById")
	@ResponseBody
	public JSONObject getLaboratoryById(@RequestBody Map<String,Integer> map)throws Exception {
		JSONObject json = new JSONObject();
		ObjectMapper mapper = new ObjectMapper(); // 定义一个Jacjson对象
		
		if(map.containsKey("id")) {
			int id = map.get("id");  // 获取前端提交上来的id值
			
			Laboratory laboratory = (Laboratory) service.getLaboratoryById(id);  // 调用server服务层的方法
			
			if(laboratory.getDescription() == null) {
				laboratory.setDescription("");
			}
			
			if(laboratory != null) {
				String newsJosn = mapper.writeValueAsString(laboratory); // Jackson解析库解析User对象为JSON字符串
				String jsonStr1 = "{\"laboratory\":"+newsJosn+"}";       // json字符串组装
				
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
	
	// 根据实验室名模糊查询
	@RequestMapping("/getLaboratoryByCondition")
	@ResponseBody
	public JSONObject getLaboratoryByCondition(@RequestBody Map<String, Integer> map) throws Exception{
		JSONObject json = new JSONObject();       
		ObjectMapper mapper = new ObjectMapper(); 
		
		if(!map.isEmpty()) {
			List<Laboratory> list = (List<Laboratory>) service.getLaboratoryByCondition(map);
			
			if (list != null) {
				// 循环遍历description属性并赋值，否则会出错
				for(Laboratory lab : list) {
					if(lab.getDescription() == null) {
						lab.setDescription("");
					}
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
	
	// 获取实验室的总数目
	@RequestMapping("/getLaboratorysNumber")
	@ResponseBody
	public JSONObject getLaboratorysNumber(){
		JSONObject json = new JSONObject();
		int count = service.getLaboratoryNumber();
		
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
	
	// 分页查询实验室资源
	@SuppressWarnings("unused")
	@RequestMapping("/getLaboratorysByPaging")
	@ResponseBody
	public JSONObject getLaboratorysByPaging(@RequestBody Map<String, Integer> map, 
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
				List<Laboratory> list = service.getListByPaging(page);
				
				for(Laboratory lab : list) {
					if(lab.getDescription() == null) {
						lab.setDescription("");
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
	
  // 添加实验室
  @RequestMapping("/addLaboratory")
  @ResponseBody
  public JSONObject addLaboratory(@RequestBody Laboratory lab) {
	JSONObject json = new JSONObject();
	  	
  	if (lab != null) {
      	// service实例化对象方法调用
  		int row = service.addLaboratory(lab);
  		
  		for(int i =1;i<=5;i++) {
  			int id = service.getLaboratoryIdByName(lab.getName());
  			Map<String, Integer> map = new HashMap<String, Integer>();
  			
  			map.put("lId", id);
  	  		map.put("wId", i);
  	  		map.put("status", 1);
  	  		
  	  		int row2 = service.addLabbooking(map);
  		}
  
	  	if (row >= 1) {
	      	json.put("code", "1");
	      	json.put("msg", "添加成功");
	  	} else {
	  		json.put("code", "2");
	      	json.put("msg", "添加失败");
	  	}
  	}
  	return json;
  }
  
  // 添加预订详情
  @RequestMapping("/addLabbooking")
  @ResponseBody
  public JSONObject addLabbooking(@RequestBody Laboratory lab) {
	JSONObject json = new JSONObject();
	  	
  	if (lab != null) {
  		int row = 0;
  		for(int i =1;i<=5;i++) {
  			Map<String, Integer> map = new HashMap<String, Integer>();
  			map.put("lId", 8);
  	  		map.put("wId", i);
  	  		map.put("status", 1);
  	  		
  	  		row = service.addLabbooking(map);
  		}
  		
	  	if (row >= 1) {
	      	json.put("code", "1");
	      	json.put("msg", "添加成功");
	  	} else {
	  		json.put("code", "2");
	      	json.put("msg", "添加失败");
	  	}
  	}
  	return json;
  }
  
  
  	// 更新实验室
  	@RequestMapping("/updateLaboratoryById")
	@ResponseBody
	public JSONObject updateLaboratoryById(@RequestBody Laboratory lab){
		JSONObject json = new JSONObject();
		if (lab != null) {
				
			int count = service.updateLaboratory(lab); //调用server业务层的方法
			
			// 判断受影响行数
			if(count == 1) {
				json.put("code", 1);
				json.put("msg", "更新成功");
			} else {
				json.put("code", 2);
				json.put("msg", "更新失败");
			}
			
		} else {
			json.put("code", 2);
			json.put("msg", "传值不能为空");
		}
		
		return json;
	}
	
	// 删除实验室
	@RequestMapping("/removeLaboratoryById")
	@ResponseBody
	public JSONObject removeLaboratoryById(@RequestBody Map<String, Integer> map){
		JSONObject json = new JSONObject();
		if (map.containsKey("id")) {
			int id = (Integer)map.get("id");
			int count = service.deleteLaboratoryById(id); //调用server业务层的方法
			
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
	
	// 批量删除实验室
	@RequestMapping("/removeMultiLaboratorys")
	@ResponseBody
	public JSONObject removeMultiLaboratorys(@RequestBody Map<String, List<Integer>> map){
		JSONObject json = new JSONObject();
		
		if (map.containsKey("idList")) {
			
			int count = service.deleteLaboratoryByArray(map.get("idList")); //调用server业务层的方法
			
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
	
	// 根据实验室ID获取某实验室的空置情况
	@RequestMapping("/getLabBookingInfo")
	@ResponseBody
	public JSONObject getLabBookingInfo(@RequestBody Map<String, Integer> map) throws Exception {
		JSONObject json = new JSONObject();
		ObjectMapper mapper = new ObjectMapper(); // jackson
		List<LabBooking> list = null;
		
		if (map.containsKey("id")) {
			int id = map.get("id");
			try{
				list = service.getLabBooking(id);
				
				for(LabBooking lab : list) {
					if(lab.getSection1() == null) {
						lab.setSection1("");
					}
					if(lab.getSection2() == null) {
						lab.setSection2("");
					}
					if(lab.getSection3() == null) {
						lab.setSection3("");
					}
					if(lab.getSection4() == null) {
						lab.setSection4("");
					}
					if(lab.getSection5() == null) {
						lab.setSection5("");
					}
					if(lab.getSection6() == null) {
						lab.setSection6("");
					}
					if(lab.getSection7() == null) {
						lab.setSection7("");
					}
				}
				String newsJosn = mapper.writeValueAsString(list); // Jackson解析库解析User对象为JSON字符串
				
				String jsonStr1 = "{\"list\":"+newsJosn+"}";       // json字符串组装
				json.put("code", 1);
				json.put("msg", "成功");
				json.put("data", mapper.readValue(jsonStr1, JSONObject.class)); // Jackson解析库解析字符串为json对象	
			}catch(Exception e) {
				json.put("code", 2);
				json.put("msg", "失败");
			}
		}
		
		return json;
	}
	
	// 根据星期查询预订记录
	@RequestMapping("/getLabBookingInfoByWeek")
	@ResponseBody
	public JSONObject getLabBookingInfoByWeek(@RequestBody Map<String, Integer> map) throws Exception {
		JSONObject json = new JSONObject();
		ObjectMapper mapper = new ObjectMapper(); // jackson
		List<LabBooking> list =	 null;
		
		if (!map.isEmpty()) {
//			int wId = map.get("wId");
//			int lId = map.get("lId");
		
			try{
				list = service.getLabBookingByWeek(map);
				
				for(LabBooking lab : list) {
					if(lab.getSection1() == null) {
						lab.setSection1("");
					}
					if(lab.getSection2() == null) {
						lab.setSection2("");
					}
					if(lab.getSection3() == null) {
						lab.setSection3("");
					}
					if(lab.getSection4() == null) {
						lab.setSection4("");
					}
					if(lab.getSection5() == null) {
						lab.setSection5("");
					}
					if(lab.getSection6() == null) {
						lab.setSection6("");
					}
					if(lab.getSection7() == null) {
						lab.setSection7("");
					}
				}
				String newsJosn = mapper.writeValueAsString(list); // Jackson解析库解析User对象为JSON字符串
				
				String jsonStr1 = "{\"list\":"+newsJosn+"}";       // json字符串组装
				json.put("code", 1);
				json.put("msg", "成功");
				json.put("data", mapper.readValue(jsonStr1, JSONObject.class)); // Jackson解析库解析字符串为json对象	
			}catch(Exception e) {
				json.put("code", 2);
				json.put("msg", "失败");
			}
		}
		return json;
	}
	
	// 更新实验室的预订记录
	@RequestMapping("/updateLabBookingInfo")
	@ResponseBody
	public JSONObject updateLabBookingInfo(@RequestBody LabBooking lb){
		JSONObject json = new JSONObject();
		
		if (lb != null) {
			int count = service.updateLabBookingInfo(lb); //调用server业务层的方法
			
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
	
	// 添加个人实验室的预订记录
	@RequestMapping("/addPerBooking")
	@ResponseBody
	public JSONObject addPerBooking(@RequestBody PerBooking perBooking){
		JSONObject json = new JSONObject();
		
		if (perBooking != null) {
			int count = service.addPerBooking(perBooking); //调用server业务层的方法
			
			// 判断受影响行数
			if(count >= 1) {
				json.put("code", 1);
				json.put("msg", "插入成功");
			} else {
				json.put("code", 2);
				json.put("msg", "插入失败");
			}
			
		} else {
			json.put("code", 2);
			json.put("msg", "数据不能为空");
		}
		return json;
	}
	
	// 查询所有有预订实验室的用户
	@SuppressWarnings("unused")
	@RequestMapping("/getAllBookingUsers")
	@ResponseBody
	public JSONObject getAllBookingUsers()throws Exception {
		JSONObject json = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
			
		List<PerBooking> list= service.getAllBookingUsers();
		List<String> mList = new ArrayList<String>();
		
		if(mList != null) {
			for(PerBooking lab : list) {
				mList.add(lab.getName().toString());
			}
		
			String newsJosn = mapper.writeValueAsString(mList); // Jackson解析库解析User对象为JSON字符串
			String jsonStr1 = "{\"list\":"+newsJosn+"}";       // json字符串组装
			
			json.put("code", 1);
			json.put("msg", "成功");
			json.put("data", mapper.readValue(jsonStr1, JSONObject.class)); // Jackson解析库解析字符串为json对象	
		
		} else {
			json.put("code", 2);
			json.put("msg", "获取数据失败");
		}
			
		return json;
	}
	
	// 查询个人的预订记录
	@RequestMapping("/getPerBooking")
	@ResponseBody
	public JSONObject getPerBooking(@RequestBody Map<String,String> map)throws Exception {
		JSONObject json = new JSONObject();
		ObjectMapper mapper = new ObjectMapper(); // 定义一个Jacjson对象
		
		if(map.containsKey("name")) {
			String name = map.get("name");  // 获取前端提交上来的id值
			
			List<PerBooking> list = service.getPerBooking(name);
			
			if(list != null) {
				String newsJosn = mapper.writeValueAsString(list); // Jackson解析库解析User对象为JSON字符串
				String jsonStr1 = "{\"list\":"+newsJosn+"}";       // json字符串组装
				
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
	
	// 删除个人预订记录
	@RequestMapping("/removePerBooking")
	@ResponseBody
	public JSONObject removePerBooking(@RequestBody PerBooking perBooking){
		JSONObject json = new JSONObject();
		
		if (perBooking != null) {
			int id = service.getLaboratoryIdByName(perBooking.getLabName());
			perBooking.setLabId(id);
			
			int count = service.removePerBooking(perBooking); //调用server业务层的方法
			int row = service.updateFromLabBooking(perBooking);
			
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
	
}
