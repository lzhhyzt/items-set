/**
 * 提供子组件使用的各种dispatch（针对actions或页面内）函数，并且使用commit(针对mutations)方法
 * 此文件执行各种api的接口请求
 */
import Vue from 'vue'
import axios from 'axios'
import Lockr from 'lockr'
import { requestConfig, apis } from '../config/url.js'

// 全局默认请求配置项
// axios.defaults.timeout = requestConfig.timeout;  // 超时设置
// axios.defaults.responseType = requestConfig.responseType  // 返回数据类型
// axios.defaults.headers.post['Content-Type'] = requestConfig.headers.contentType  // 请求体类型

const actions = {
  getNewsList: function ({commit, dispatch}) {
    // axios.post('/apis/' + apis.getNewsByPaging,{
    //   currentPage: 1,
    //   pageSize: 8
    // })
    // .then(res => {
    //   console.log('action', res.data.list)
    //   Lockr.set('newList', res.data.list)
    //   commit('setNewsList', res.data.list)
    // })
    // .catch(err => {
    //   console.log(err)
    // })
  }
}

export default actions
