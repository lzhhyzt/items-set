import Vue from 'vue'
import Router from 'vue-router'
import Description from '../components/description'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',     // 初始化
      name: 'init',
      component: Description
    },
    {
      path: '/description',  // 质量方针
      name: 'description',
      component: Description
    }
  ]
})
