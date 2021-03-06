import Vue from 'vue'
import Router from 'vue-router'
import AnnouncementList from '../components/announcementList'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',     // 初始化
      name: 'init',
      component: AnnouncementList
    },
    {
      path: '/announcementList',  // 质量方针
      name: 'announcementList',
      component: AnnouncementList
    }
  ]
})
