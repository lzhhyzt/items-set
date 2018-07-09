package com.frame.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.frame.bean.Login;
import com.frame.bean.User;
import com.frame.service.BackUserService;
import com.frame.util.ImageCode;

import net.sf.json.JSONObject;

@Controller    
@RequestMapping("/user") 
public class BackLoginController {
	
	@Autowired
    private BackUserService userService;
	
	// @Value注解获取验证码配置文件中的sessionKey的值
	@Value("${ImageCode.sessionKey}")
	private String sessionKey;
	
	// 生成验证码
    @Autowired  
    private ImageCode imageCode;
    
    @RequestMapping("/getIdentifyCode")  
    public void getIdentifyCode(HttpServletRequest request,HttpServletResponse response) throws IOException { 
        // 禁止图像缓存。  
        response.setHeader("Pragma", "no-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);
  
        response.setContentType("image/jpeg");  
        // 将图像输出到Servlet输出流中。  
        ServletOutputStream sos = response.getOutputStream();  
        ImageIO.write(imageCode.getImage(request), "jpeg", sos);  
        
        sos.close();  
    }
	
	// 用户登录
    @RequestMapping("/login")
    @ResponseBody
    public JSONObject login(@RequestBody Login login, HttpServletRequest request, HttpServletResponse response) throws Exception {    
        
    	response.setHeader("Access-Control-Allow-Origin", "http://127.0.0.1:8070"); // 设置跨域
    	response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS"); // 设置请求方式
    	
    	int validated = 0;  // 0 代表成功,1是验证码错误，2是账号密码错误
    	JSONObject json = new JSONObject(); // 定义一个json对象
    	ObjectMapper mapper = new ObjectMapper(); // 定义一个Jacjson对象
    	
    	String name = login.getUsername().toString().trim();   // 用户名
    	String pwd = login.getPassword().toString().trim();	   // 密码
    	String captcha = login.getCaptcha().toString().trim(); // 验证码
    	
    	// 设置该cookie是为了辨别前后台的标志
    	Cookie co = new Cookie("BACKSTAGE", "1");
    	co.setPath("/");
    	response.addCookie(co);
    	
    	// 创建一个User对象并赋值，后面需要用到
    	User user = new User();
    	user.setUsername(name);
    	user.setPassword(pwd);
    	
    	// 账号密码以及验证码验证
    	String pattern ="^\\w{4,16}$";
    	String sessionValue = (String) request.getSession().getAttribute(sessionKey);
    	if (captcha.equalsIgnoreCase(sessionValue)) {   // 验证码对比验证，是否一样
	    	if (name == "" || pwd == "") { // 账号不为空且匹配正则
	    		validated = 2;
	    	} else {
	    		if (!Pattern.matches(pattern, name) || !Pattern.matches(pattern, pwd)) { // 密码不为空且匹配正则
	    			validated = 3;
	    		}
	    	}
    	} else {
    		validated = 1;
    	}
    	
    	// 验证成功则向数据库请求，反之错误
    	User uu = null;
    	if (validated == 0) {
    		// service实例化对象方法调用
    		uu = userService.login(user); 
    	}  
    	
    	// 判断用户是否存在
        if(uu == null){
        	if (validated == 0) {
        		validated = 4;
        	}
        	
        } else {
        	HttpSession session=request.getSession();
        	session.setAttribute("currentUser", uu.getUsername());
        	
        	// 组装消息
        	JSONObject returnUser = new JSONObject();
        	returnUser.put("username", uu.getUsername());
        	returnUser.put("type", uu.getType());
        	String userJosn = mapper.writeValueAsString(returnUser); // Jackson解析库解析User对象为JSON字符串
        	
        	json.put("code", 1);
    		json.put("msg", "成功");
    		
        	// 判断是管理员登录还是一般用户登录
        	if (uu.getType() == 1) {   // 管理员
        		String json1 = "{\"currentUser\":"+userJosn+"}";
        		json.put("data", mapper.readValue(json1, JSONObject.class)); // Jackson解析库解析字符串为json对象
            	session.setAttribute("type", 1);
            	
        	} else if(uu.getType() == 2) {  // 普通用户  
        		String json2 = "{\"currentUser\":"+userJosn+"}";
        		json.put("data", mapper.readValue(json2, JSONObject.class));
            	session.setAttribute("type", 2);
            	
        	} else {  // 备用
        		String json3 = "{\"currentUser\":"+userJosn+",\"warn\":\"你的权限不足\"}";
        		json.put("data", mapper.readValue(json3, JSONObject.class));
            	session.setAttribute("type", 3);
            	session.setAttribute("tips", "你的权限不足");
        	}
        }
        
        // 验证错误分类
        if (validated == 1) {
        	json.put("code", 2);
    		json.put("msg", "验证码错误");
        	
        } else if(validated == 2) {
        	json.put("code", 2);
    		json.put("msg", "账号或者密码不能为空");
    		
        } else if(validated == 3) {
        	json.put("code", 2);
    		json.put("msg", "账号或者密码格式错误");
    		
        } else if(validated == 4) {
        	json.put("code", 2);
    		json.put("msg", "用户不存在");
        } 
        return json;
    }
    
    // 退出登录
    @RequestMapping("/logout")
    @ResponseBody
    public JSONObject logout(HttpServletRequest request) throws Exception {
    	JSONObject json = new JSONObject();
    	HttpSession session = request.getSession();
    	String sessionId = session.getId();

    	session.removeAttribute("currentUser");
    	session.removeAttribute("type");
    	
    	if ((String) session.getAttribute("currentUser") == null) {
    		json.put("code", 1);
    		json.put("msg", "成功");
    	} else {
    		json.put("code", 2);
    		json.put("msg", "失败");
    	}
    	return json;
    }
    
    
    // 获取在线用户登录数
	@SuppressWarnings("unchecked")
	@RequestMapping("/getOnlineNumber")
	@ResponseBody
    public String getOnlineNumber(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	HttpSession session=request.getSession();
    	ServletContext context = session.getServletContext(); 
    	
    	int n = 0;
    	try {
			n = (int) context.getAttribute("onlineCount");

			HashSet<HttpSession> sessionSet=(HashSet<HttpSession>) context.getAttribute("sessionSet");
    	}catch(Exception e){
    		e.printStackTrace();
    	}

    	
    	return "";
    }

}
