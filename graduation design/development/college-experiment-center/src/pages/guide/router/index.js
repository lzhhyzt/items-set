import Vue from 'vue'
import Router from 'vue-router'
import Quality from '../components/quality'
import Service from '../components/server'
import BusinessType from '../components/businessType'
import Workflow from '../components/workflow'
import Rules from '../components/rules'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',     // 初始化
      name: 'init',
      component: Quality
    },
    {
      path: '/quality',  // 质量方针
      name: 'quality',
      component: Quality
    },
    {
      path: '/server',  // 服务内容
      name: 'server',
      component: Service
    },
    {
      path: '/businessType',  // 业务种类
      name: 'businessType',
      component: BusinessType
    },
    {
      path: '/workflow',  // 工作流程
      name: 'workflow',
      component: Workflow
    },
    {
      path: '/rules',  // 规章制度
      name: 'rules',
      component: Rules
    },

  ]
})
