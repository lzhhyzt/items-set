<template>
  <div class="navigation" :style="navigationNewStyle">
    <div class="navigation__header" :class="headerCollapseStyle">
      <div class="navigation__header-title">
        实验中心
      </div>
    </div>
    <div class="navigation__body">
      <el-menu class="el-menu-vertical" :style="" default-active="1-1-1" @open="handleOpen"
      @close="handleClose" @select="handleSelect" :collapse="getIsCollapse"
      background-color="#545c64" text-color="#fff" active-text-color="#ffd04b"
      :unique-opened="uniqueOpened" router>
        <el-menu-item index="/">
          <i class="el-icon-menu"></i>
          <span slot="title">首页</span>
        </el-menu-item>

        <el-menu-item index="/news">
          <i class="el-icon-tickets"></i>
          <span slot="title">新闻管理</span>
        </el-menu-item>

        <el-menu-item index="/announcement">
          <i class="el-icon-edit-outline"></i>
          <span slot="title">公告管理</span>
        </el-menu-item>

        <el-submenu index="/resource">
          <template slot="title">
            <i class="el-icon-document"></i>
            <span slot="title">资源管理</span>
          </template>
          <el-menu-item-group>
            <el-menu-item index="/resource">文档管理</el-menu-item>
          </el-menu-item-group>
        </el-submenu>

        <el-submenu index="/personal">
          <template slot="title">
            <i class="el-icon-view"></i>
            <span slot="title">个人中心</span>
          </template>
          <el-menu-item-group>
            <el-menu-item index="/personal/baseInfo">个人信息</el-menu-item>
            <el-menu-item index="/personal/adminList" v-show="superRoot">管理员列表</el-menu-item>
          </el-menu-item-group>
        </el-submenu>

        <el-menu-item index="/user" v-show="superRoot">
          <i class="el-icon-setting"></i>
          <span slot="title">用户管理</span>
        </el-menu-item>

       <el-submenu index="/laboratory" v-show="superRoot">
          <template slot="title">
            <i class="el-icon-view"></i>
            <span slot="title">实验室管理</span>
          </template>
          <el-menu-item-group>
            <el-menu-item index="/laboratory/labList">实验室列表</el-menu-item>
            <el-menu-item index="/laboratory/userList">用户预订列表</el-menu-item>
          </el-menu-item-group>
        </el-submenu>

        <el-menu-item index="/setting" v-show="superRoot">
          <i class="el-icon-setting"></i>
          <span slot="title">系统设置</span>
        </el-menu-item>
      </el-menu>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Cookie from '../../module/cookie.js'

export default {
  name: 'navigation',
  data () {
    return {
      uniqueOpened: true, // 是否只保持一个子菜单的展开
      headerCollapseStyle: '', // 菜单收起时菜单头部的样式
      navigationNewStyle: {}, // 导航菜单根元素新增的新样式
      superRoot: false
    }
  },
  created () {
    // 判断用户权限
    if (Cookie.get('CURRENTUSER') && Cookie.get('USERTYPE') == '1') {
      this.superRoot = true
    }
  },
  computed: {
    ...mapGetters ([
      'getIsCollapse'
    ])
  },
  mounted () {
    // 获得窗口的滚动高度
    let sh = document.documentElement.clientHeight

    if (this.getIsCollapse === true) {
      this.headerCollapseStyle = 'navigation__header-collapse'
      this.navigationNewStyle = {
        height: sh + 'px'
      }
    } else {
      this.headerCollapseStyle = ''
      this.navigationNewStyle = {
        height: sh + 'px'
      }
    }
  },
  methods: {
     /**
     * 菜单项选择事件
     * @param {string} key 菜单项index
     * @param {string} keyPath 菜单项的index path
     */
    handleSelect (key, keyPath) {
    },
    /**
     * 导航菜单项展开事件
     * @param {string} key 菜单项index
     * @param {string} keyPath 菜单项的index path
     */
    handleOpen(key, keyPath) {
    },
    /**
     * 导航菜单项收起事件
     * @param {string} key 菜单项index
     * @param {string} keyPath 菜单项的index path
     */
    handleClose(key, keyPath) {
    }
  }
}
</script>

<style scoped>
  html {
    position: relative;
    height: 100%;
  }
  .navigation {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    float: left;
    z-index: 10;
    width: auto;
    background: #545c64;
  }
  .navigation__body {
    position: relative;
    width: 100%;
    padding-top: 15px;
    border-top: 1px solid #ffffff;
  }
  .el-menu-vertical:not(.el-menu--collapse) {
    width: 200px;
  }
  .navigation__header {
    position: relative;
    width: auto;
    height: 60px;
    text-align: center;
    background: #f44336;
  }
  .navigation__header-collapse {
    width: 64px;
  }
  .navigation__header-title {
    position: absolute;
    top: 50%;
    left: 50%;
    width: auto;
    height: auto;
    color: #ffffff;
    font-size: 16px;
    font-weight: bold;
    transform: translateX(-50%) translateY(-50%);
  }
</style>
<style>
  .el-menu {
    border-right: none;
  }
</style>

