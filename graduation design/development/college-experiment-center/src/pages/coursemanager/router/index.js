import Vue from 'vue'
import Router from 'vue-router'
import More from '../components/more'


Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',     // 初始化
      name: 'init',
      component: More
    },
    {
      path: '/more',  // 质量方针
      name: 'more',
      component: More
    },
  ]
})
