package com.frame.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
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
import com.frame.bean.FUser;
import com.frame.bean.Login;
import com.frame.service.FrontUserService;
import com.frame.util.ImageCode;

import net.sf.json.JSONObject;

@Controller    
@RequestMapping("/user") 
public class FrontLoginController {

	@Autowired
    private FrontUserService userService;
	
	// @Value注解获取验证码配置文件中的sessionKey的值
	@Value("${ImageCode.sessionKey}")
	private String sessionKey;
	
	// 生成验证码
    @Autowired  
    private ImageCode imageCode;
    
    @RequestMapping("/fGetIdentifyCode")  
    public void fGetIdentifyCode(HttpServletRequest request,HttpServletResponse response) throws IOException { 
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
    @RequestMapping("/flogin")
    @ResponseBody
    public JSONObject flogin(@RequestBody Login login, HttpServletRequest request, HttpServletResponse response) throws Exception {    
    	
    	int validated = 0;  // 0 代表成功,1是验证码错误，2是账号密码错误
    	JSONObject json = new JSONObject(); // 定义一个json对象
    	ObjectMapper mapper = new ObjectMapper(); // 定义一个Jacjson对象
    	
    	String name = login.getUsername().toString().trim();   // 用户名
    	String pwd = login.getPassword().toString().trim();	   // 密码
    	
    	// 设置该cookie是为了辨别前后台的标志
    	Cookie co = new Cookie("FOREGROUND", "1");
    	co.setPath("/");
    	response.addCookie(co);
    	
    	// 创建一个User对象并赋值，后面需要用到
    	FUser user = new FUser();
    	user.setUsername(name);
    	user.setPassword(pwd);
    	
    	// 账号密码以及验证码验证
    	String pattern ="^\\w{4,16}$";
    	
    	if (name == "" || pwd == "") { // 账号不为空且匹配正则
    		validated = 2;
    	} else {
    		if (!Pattern.matches(pattern, name) || !Pattern.matches(pattern, pwd)) { // 密码不为空且匹配正则
    			validated = 3;
    		}
    	}
    	
    	// 验证成功则向数据库请求，反之错误
    	FUser uu = null;
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
        	session.setAttribute("fUser", uu.getUsername());
        	
        	// 组装消息
        	JSONObject returnUser = new JSONObject();
        	returnUser.put("username", uu.getUsername());
        	returnUser.put("type", uu.getType());
        	String userJosn = mapper.writeValueAsString(returnUser); // Jackson解析库解析User对象为JSON字符串
        	
        	json.put("code", 1);
    		json.put("msg", "成功");
    		
        	// 判断是否是教师登录
        	if (uu.getType() == 1) {
        		String json1 = "{\"currentUser\":"+userJosn+"}";
        		json.put("data", mapper.readValue(json1, JSONObject.class));
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
    @RequestMapping("/flogout")
    @ResponseBody
    public JSONObject flogout(HttpServletRequest request) throws Exception {
    	JSONObject json = new JSONObject();
    	HttpSession session = request.getSession();

    	session.removeAttribute("fUser");
    	
    	if ((String) session.getAttribute("fUser") == null) {
    		json.put("code", 1);
    		json.put("msg", "成功");
    	} else {
    		json.put("code", 2);
    		json.put("msg", "失败");
    	}
    	return json;
    }
}
