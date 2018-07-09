import Vue from 'vue'
import Router from 'vue-router'
import SLB from '../components/slb'
import Detail from '../components/detail'
import ULB from '../components/ulb'
import Other from '../components/other'


Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',     // 初始化
      name: 'init',
      component: SLB
    },
    {
      path: '/slb',  // s栋实验楼
      name: 'slb',
      component: SLB
    },
    {
      path: '/detail',  // t栋实验楼
      name: 'detail',
      component: Detail
    },
    {
      path: '/ulb',  // u栋实验楼
      name: 'ulb',
      component: ULB
    },
    {
      path: '/other',  // 其他实验室
      name: 'other',
      component: Other
    },
  ]
})
