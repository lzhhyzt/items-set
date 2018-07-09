import Vue from 'vue'
import Router from 'vue-router'
import Apple from '../components/apple'
import Colony from '../components/colony'
import Other from '../components/other'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',     // 初始化
      name: 'init',
      component: Apple
    },
    {
      path: '/apple',  // 苹果设备
      name: 'apple',
      component: Apple
    },
    {
      path: '/colony',  // 集群服务器设备
      name: 'colony',
      component: Colony
    },
    {
      path: '/other',  // 其他普通设备
      name: 'other',
      component: Other
    }

  ]
})
