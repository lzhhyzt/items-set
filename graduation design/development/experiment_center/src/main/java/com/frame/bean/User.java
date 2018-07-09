package com.frame.bean;    
    
public class User {    
    private int id;           // 编号
    private String username;  // 用户名  
    private String password;  // 密码
    private int type;         // 用户类型
    
    public int getId() {    
        return id;    
    }    
    
    public void setId(int id) {    
        this.id = id;    
    }    
    
    public String getUsername() {    
        return username;    
    }    
    
    public void setUsername(String username) {    
        this.username = username;    
    }    
    
    public String getPassword() {    
        return password;    
    }    
    
    public void setPassword(String password) {    
        this.password = password == null ? null : password.trim();    
    }
    
    public int getType() {
    	return type;
    }
    
    public void setType(int type) {
    	this.type = type;
    }
  
}    