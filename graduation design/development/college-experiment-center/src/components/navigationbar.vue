<template>
  <div class="navigationbar">
    <div class="navigationbar__block">
      <img src="../../static/image/bg.jpg" />
    </div>
    <div class="navigationbar__nav">
      <el-menu :default-active="activeIndex" class="el-menu-demo"
      mode="horizontal" @select="handleSelect" :background-color="color.bgColor"
      :text-color="color.textColor" :active-text-color="color.activeTextColor">
        <el-menu-item index="1"><a :href="linkUrl[1]" value="1"><img src="../../static/image/home.png"/>&nbsp;首页</a></el-menu-item>
        <el-menu-item index="2"><a :href="linkUrl[2]" value="2">中心简介</a></el-menu-item>
        <el-menu-item index="3"><a :href="linkUrl[3]" value="3">新闻中心</a></el-menu-item>
        <el-menu-item index="4"><a :href="linkUrl[4]" value="4">通知公告</a></el-menu-item>
        <el-menu-item index="5"><a :href="linkUrl[5]" value="5">服务指南</a></el-menu-item>
        <el-menu-item index="6"><a :href="linkUrl[6]" value="6">仪器设备</a></el-menu-item>
        <el-menu-item index="7"><a :href="linkUrl[7]" value="7">资源下载</a></el-menu-item>
        <el-menu-item index="8"><a :href="linkUrl[8]" value="8">实验室</a></el-menu-item>
        <el-menu-item index="9"><a :href="linkUrl[9]" value="9">更多</a></el-menu-item>
      </el-menu>
    </div>
  </div>
</template>

<script>
import Config from '../config/common.js'

export default {
  name: 'navigationbar',
  data () {
    return {
      activeIndex: '1', // 被选中的导航标签项索引
      color: {          // 颜色汇总
        bgColor: '#F5F5F5',          // 导航条背景颜色 #DCDCDC
        textColor: Config.navTextColor,     // 导航条文字颜色
        activeTextColor: '#ff8c00'   // 被激活的导航标签项的颜色
      },
      linkUrl: [
        'none.html',                  // 无跳转，用于占位
        'index.html',                 // 首页
        'introduce.html',             // 中心介绍页
        'news.html',                  // 新闻中心页
        'announcement.html',          // 通告中心页
        'guide.html',                 // 服务指南
        'expteaching.html',           // 仪器设备
        'download.html',              // 下载中心
        'laboratory.html',            // 实验室
        'coursemanager.html',         // 更多
      ]
    }
  },
  mounted () {
    // 在组件进行渲染显示在页面时对本地址所对应的导航标签项的选中状态进行渲染
    var origin = window.location.pathname
    var tagNames = document.querySelector('.el-menu-demo').getElementsByTagName('a')

    for (var i = tagNames.length-1;i >= 0;i--) {
      var url = tagNames[i].href
      if (url.indexOf(origin) > -1) {
        var index = tagNames[i].getAttribute('value')
        this.activeIndex = index
      }
    }
  },
  methods: {
    /**
     * 当选中导航标签项的事件处理
     */
    handleSelect(key, keyPath) {
      // 页面跳转
      window.location.href = this.linkUrl[key]
      return true;
    }
  }
}
</script>

<style scope>
  .navigationbar {
    z-index: 200;
    position: relative;
    top: 5px;
    left: 50%;
    width: 72%;
    height: auto;
    min-width: 970px;
    font-size: 14px;
    transform: translateX(-50%);
  }
  .navigationbar__nav {
    border-top: 2px solid #409eff;
  }

  /*导航栏*/
  .el-menu--horizontal .el-menu-item,
  .el-menu--horizontal .el-submenu .el-submenu__title {
    height: 40px;
    line-height: 40px;
  }
  .el-menu--horizontal .el-submenu>.el-menu {
    top: 45px;
  }
  .el-menu--horizontal .el-menu-item a,
  .el-menu--horizontal .el-menu-item a:hover {
    text-decoration: none;
  }
  .el-menu--horizontal .el-menu-item {
    padding: 0 26px;
  }
</style>
