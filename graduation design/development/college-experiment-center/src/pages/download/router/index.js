import Vue from 'vue'
import Router from 'vue-router'
import  Classify from '../components/classify'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',     // 初始化
      name: 'init',
      component: Classify
    },
    {
      path: '/classify',  // 质量方针
      name: 'Classify',
      component: Classify
    }
  ]
})
