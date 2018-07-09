package com.frame.util;

import com.qiniu.util.Auth;

/**
 * 上传到七牛返回 hash 和 key
 */
public class UploadToken {
    //设置好账号的ACCESS_KEY和SECRET_KEY
    private static final String ACCESS_KEY = "yhHMTpIdymD_TPgMqLJMW1q4lMl1GqhJB-n_PpD0";
    private static final String SECRET_KEY = "q-BAYA7OPqLhquxdIq5YzjI41gdDMZrabwcWq8wi";
    //要上传的空间名
    private static final String BUCKET_NAME = "hyztfscp";

    //简单上传，使用默认策略
    public static String getUpToken() {
        //密钥配置
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        return auth.uploadToken(BUCKET_NAME);
    }
}