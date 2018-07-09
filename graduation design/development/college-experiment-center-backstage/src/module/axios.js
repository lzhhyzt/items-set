/*
 * @Description: axios异步请求方法封装
 * @Author: lizh
 * @Date: 2018-02-06 02:04:52
 * @Last Modified by: lizh
 * @Last Modified time: 2018-03-07 17:04:54
 */
//import axios from 'axios'
import $ from 'jquery'
import Lockr from 'lockr'
import { requestConfig, apis } from '../config/url.js'

// // 全局默认请求配置项
// axios.defaults.timeout = requestConfig.timeout;  // 超时设置
// axios.defaults.responseType = requestConfig.responseType  // 返回数据类型
// axios.defaults.headers.post['Content-Type'] = requestConfig.headers.contentType  // 请求体类型
// var $http = {
//   /**
//    * post请求
//    */
//   post: function (url, data) {
//     var returnData = null
//     var pre = '/apis/'
//     // 判断是不是生产环境
//     if (process.env.NODE_ENV == "production") {
//       pre = '/experiment_center/'
//     }
//     if (url != null) {
//       return axios.post(pre + url, data)
//     }
//   },
//   /**
//    * get请求
//    */
//   get: function(url) {
//     var pre = '/apis/'
//     // 判断是不是生产环境
//     if (process.env.NODE_ENV == "production") {
//       pre = '/experiment_center/'
//     }
//     if (url != null) {
//       return axios.get(pre + url)
//     }
//   },
//   /**
//    * 文件下载
//    */
//   download: function(url, data) {
//     return axios.get(url)
//   }
// }

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
  }
}


export default $http
