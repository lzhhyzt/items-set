<template>
  <div class="bottomBar" :class="class2" v-bind:style="backgrounds">
    <div class="bottomBar-banner">
        <div>Copyright@ 广州大学华软软件学院 版权所有 </div>
        <div>地址：广东省广州市从化区经济开发区高技术产业园广从南路548号 &nbsp;&nbsp; 邮编：510900</div>
    </div>
  </div>
</template>

<script>
import Vue from 'vue'
import Config from '../config/common.js'
import { apis } from '../config/url.js'
import $http from '../modules/axios.js'

export default {
  name: 'topBar',
  data() {
    return {
      backgrounds:{
        background: ''
      },
      class2: ''
    }
  },
  created () {
    this.initStyle()    // 样式
    this.selectTheme()  // 主题色
  },
  methods: {
    /**
     * 设置初始样式
     */
    initStyle () {
      var sh = document.documentElement.scrollHeight
      var ch = document.documentElement.clientHeight
      // 如果滚动的高度和窗口的高度是相同时，采用第二种样式
      if (sh == ch) {
        this.class2 = 'bottomBar2'
      }
    },

    /**
     * 从数据库获取主题色
     */
    selectTheme () {
      var _that = this
      $http.post(apis.getThemeById, {
        id: 0
      })
      .then(res => {
        var color = res.data.theme
        _that.backgrounds.background = color.currentColor
      })
      .catch(err => {
        _that.backgrounds.background = Config.color
      })
    }
  }
}
</script>

<style scoped>
  .bottomBar {
    position: relative;
    bottom: 0;
    width: 100%;
    height: 80px;
    min-width: 430px;
    font-size: 14px;
    color: #ffffff;
  }
  .bottomBar2 {
    position: relative; /*absolute*/
    bottom: 0;
  }
  .bottomBar-banner {
    position: absolute;
    display: table;
    left: 50%;
    top: 50%;
    width: 72.5%;
    transform: translateX(-50%) translateY(-50%);
  }
  .bottomBar-banner > div{
    margin-bottom: 5px;
  }
  @media screen and (max-width: 580px) {
    .bottomBar-banner {
      width: 100%;
      height: 100%;
    }
  }
</style>
