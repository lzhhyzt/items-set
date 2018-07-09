//import axios from 'axios'
import $ from 'jquery'
import { requestConfig, apis } from '../config/url.js'

// 全局默认请求配置项
// axios.defaults.withCredentials = true  // 允许跨域设置cookie
// axios.defaults.timeout = requestConfig.timeout;  // 超时设置
// axios.defaults.responseType = requestConfig.responseType  // 返回数据类型
// axios.defaults.headers.post['Content-Type'] = requestConfig.headers.contentType  // 请求体类型


// 由于axios的浏览器兼容性问题，不利于性能测试，已停用
// var $http = {
  // /**
  //  * post请求
  //  */
  // post: function (url, data) {
  //   var returnData = null
  //   var pre = '/apis/'
  //   // 判断是不是生产环境
  //   if (process.env.NODE_ENV == "production") {
  //     pre = '/experiment_center/'
  //   }
  //   if (url != null) {
  //     return axios.post(pre + url, data)
  //   }
  // },
  // get: function(url) {
  //   var pre = '/apis/'
  //   // 判断是不是生产环境
  //   if (process.env.NODE_ENV == "production") {
  //     pre = '/experiment_center/'
  //   }
  //   if (url != null) {
  //     return axios.get(pre + url)
  //   }
  // }

  /**
   * post请求
   */
var $http = {

  post: function(url, data) {
    var returnData = null
    var pre = '/apis/'
    // 判断是不是生产环境
    if (process.env.NODE_ENV == "production") {
      pre = '/experiment_center/'
    }
    if (url != null) {
      var promise = new Promise(function(resolve,reject){
        $.ajax({
          type: 'POST',
          url: pre + url,
          data: JSON.stringify(data),
          cache: true,
          dataType: 'json',
          contentType: 'application/json',
          success: function (data) {
            resolve(data)
          }
        })
      })
      return promise;
    }
  },

  get: function(url) {
    var pre = '/apis/'
    // 判断是不是生产环境
    if (process.env.NODE_ENV == "production") {
      pre = '/experiment_center/'
    }
    if (url != null) {
      var promise = new Promise(function(resolve,reject){
        $.ajax({
          type: 'GET',
          url: pre + url,
          cache: true,
          dataType: 'json',
          contentType: 'application/json',
          success: function (data) {
            resolve(data)
          }
        })
      })
      return promise;
    }
  },

  getCode: function(url) {
    var pre = '/apis/'
    // 判断是不是生产环境
    if (process.env.NODE_ENV == "production") {
      pre = '/experiment_center/'
    }
    if (url != null) {
      var promise = new Promise(function(resolve,reject){
        $.ajax({
          type:'GET',
          url: pre + url,
          data: {},
          success: function (data) {
            resolve(data)
          }
        })
      })
      return promise;
    }
  }
}

export default $http
