import Vue from 'vue'
import Router from 'vue-router'
import NewsList from '../components/newsList'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',     // 初始化
      name: 'init',
      component: NewsList
    },
    {
      path: '/newsList',  // 质量方针
      name: 'newsList',
      component: NewsList
    }
  ]
})
