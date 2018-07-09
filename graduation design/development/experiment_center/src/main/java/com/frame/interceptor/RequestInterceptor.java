package com.frame.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class RequestInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		// 设置返回头部
		res.setHeader("Content-Type", "application/json;charset=utf-8");
        res.setHeader("Access-Control-Allow-Origin", req.getHeader("Origin"));
        res.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        res.setHeader("Access-Control-Allow-Headers", "Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With,userId,token");
        res.setHeader("Access-Control-Allow-Credentials", "true");
        res.setHeader("Access-Control-Max-Age", "25000");
        res.setHeader("XDomainRequestAllowed","1");
        
        Cookie cookie = new Cookie("JSESSIONID",req.getSession().getId());
        cookie.setMaxAge(1200); // 过期时间为20分钟
        cookie.setPath("/");
        res.addCookie(cookie);
		
        // 判断是否已经登录
        Cookie[] reqCookie = req.getCookies();
        if (cookieLoop(reqCookie, "BACKSTAGE")) {   // 用于是不是管理台
        	if(!cookieLoop(reqCookie, "CURRENTUSER")) {
            	return false;
            }
        }
        
        return true;   
	}
	
	public static boolean cookieLoop(Cookie[] arr, String targetValue) {
		for(Cookie c:arr){
            if(c.getName().equals(targetValue))
            return true;
        }
		return false;
    }
	

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

}
