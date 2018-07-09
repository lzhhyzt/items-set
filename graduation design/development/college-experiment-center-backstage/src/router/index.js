/*
 * @Description: 网站的路由配置文件
 * @Author: lizh
 * @Date: 2018-01-25 22:07:01
 * @Last Modified by: lizh
 * @Last Modified time: 2018-04-07 21:35:33
 */

import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/home/home.vue'
import News from '@/components/news/news.vue'
import Announcement from '@/components/announcement/announcement.vue'
import Personal from '@/components/personal/personal.vue'
import BaseInfo from '@/components/personal/baseInfo/baseInfo.vue'
import AdminList from '@/components/personal/adminList/adminList.vue'
import Setting from '@/components/setting/setting.vue'
import Resource from '@/components/resource/resource.vue'
import NewsDetail from '@/components/news/detail/detail.vue'
import NewsPreview from '@/components/news/preview/preview.vue'
import AnnouncementDetail from '@/components/announcement/detail/detail.vue'
import AnnouncementsPreview from '@/components/announcement/preview/preview.vue'
import Upload from '@/components/resource/component/upload.vue'
import Theme from '@/components/setting/component/theme.vue'
import Font from '@/components/setting/component/font.vue'
import Nothing from '@/components/setting/component/nothing.vue'
import User from '@/components/user/user.vue'
import LabList from '@/components/laboratory/labList/labList.vue'
import UserList from '@/components/laboratory/userList/userList.vue'
import LabDetail from '@/components/laboratory/labList/detail.vue'
import AddLab from '@/components/laboratory/labList/addLab.vue'
import EditorLab from '@/components/laboratory/labList/editorLab.vue'
import BookingDetail from '@/components/laboratory/userList/detail.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',  // 首页
      name: 'Init',
      component: Home
    },
    {
      path: '/home',  // 首页
      name: 'Home',
      component: Home
    },
    {
      path: '/news',  // 新闻管理
      name: 'News',
      component: News
    },
    {
      path: '/news/add', // 新闻添加
      name: 'addNews',
      component: NewsDetail
    },
    {
      path: '/news/edit', // 新闻修改
      name: 'editNews',
      component: NewsDetail
    },
    {
      path: '/news/preview', // 新闻预览
      name: 'newsPreview',
      component: NewsPreview
    },
    {
      path: '/announcement', // 公告管理
      name: 'Announcement',
      component: Announcement
    },
    {
      path: '/announcement/add', // 公告添加
      name: 'addAnnouncement',
      component: AnnouncementDetail
    },
    {
      path: '/announcement/edit', // 公告修改
      name: 'editNnnouncement',
      component: AnnouncementDetail
    },
    {
      path: '/announcement/preview', // 公告预览
      name: 'announcementsPreview',
      component: AnnouncementsPreview
    },
    {
      path: '/resource',  // 资源管理
      name: 'Resource',
      component: Resource,
      children: [
        {
          path: 'upload',
          name: 'upload',
          component: Upload
        }
      ]
    },
    {
      path: '/personal',  // 个人中心
      name: 'Personal',
      component: BaseInfo,
    },
    {
      path: '/personal/baseInfo',
      name: 'baseInfo',
      component: BaseInfo
    },
    {
      path: '/personal/adminList',
      name: 'adminList',
      component: AdminList
    },
    {
      path: '/user',
      name: 'user',
      component: User
    },
    {
      path: '/laboratory',            // 实验室
      name: 'laboratory',
      component: LabList
    },
    {
      path: '/laboratory/labList',    // 实验室列表
      name: 'labList',
      component: LabList,
      children: [
        {
          path: 'labDetail',
          name: 'labDetail',
          component: LabDetail
        },
        {
          path: 'addLab',
          name: 'addLab',
          component: AddLab
        },
        {
          path: 'editorLab',
          name: 'editorLab',
          component: EditorLab
        }
      ]
    },
    {
      path: '/laboratory/userList',    // 用户预订列表
      name: 'userList',
      component: UserList,
      children: [
        {
          path: 'bookingDetail',
          name: 'bookingDetail',
          component: BookingDetail
        }
      ]
    },
    {
      path: '/setting', // 系统设置
      name: 'Setting',
      component: Setting,
      children: [
        {
          path: '/setting',
          name: 'nothing',
          component: Nothing
        },
        {
          path: '/setting/theme',
          name: 'theme',
          component: Theme
        },
        {
          path: '/setting/font',
          name: 'font',
          component: Font
        },
      ]
    }
  ]
})
