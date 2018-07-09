<template>
  <div class="topBar" v-bind:style="backgrounds">
    <div class="topBar-banner">
      <div class="topBar-hide" >{{nowtime()}}</div>
      <div class="topBar-time">{{time}}</div>
      <div class="topBar-other" >
        <div class="topBar-login">
          <span v-html="weather"></span>
          &nbsp;&nbsp;
          <a href="login.html" v-if="isLogin == false">登录</a>
          <span v-else>
            <a href="pcenter.html">个人中心</a>
            &nbsp;
            <a href="javascript:void(0)" @click="logout">注销</a>
          </span>

        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Vue from 'vue'
import $ from 'jquery'
import { apis } from '../config/url.js'
import Config from '../config/common.js'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import FormaterTime from '../modules/time.js'
import $http from '../modules/axios.js'
import Cookie from '../modules/cookie.js'

Vue.use(ElementUI)

export default {
  name: 'topBar',
  data() {
    return {
      backgrounds:{
        background: ''
      },
      time: '',
      themeColor: '#F28C10',
      weather: '',
      isLogin: false
    }
  },
  created () {
    this.isLogined()      // 是否登录
    this.selectTheme()  // 主题色
    this.getWeather()   // 天气
  },
  methods: {
    /**
     * 已登录或未登录
     */
    isLogined () {
      // 从cookie中判断是否已经登录
      if (Cookie.get('FUSER') == null) {
        this.isLogin = false
      } else {
        this.isLogin = true
      }
    },

    /**
     * 退出登录
     */
    logout () {
       $http.get(apis.logout)
      .then(res => {
        console.log(res)
        // 清除cookie
        Cookie.delete('FUSER')
        Cookie.delete('FUSERTYPE')

        window.location.href = "index.html"
      })
    },
    /**
     * 显示时间
     */
    nowtime () {
      // 调用的时间格式化插件
      FormaterTime()

      setInterval(() => {
        var now = new Date().format('yyyy年MM月dd日  hh:mm:ss', true)
        this.time = now
      },1000)
    },
    /**
     * 获取天气
     */
    getWeather () {
      var _that = this
      var url = "http://api.map.baidu.com/telematics/v3/weather?output=json&ak=aqkG4U51pOzRLMj3pV4fmvPsq5vnn0ST&callback=?&location=广州"
      $.getJSON(url, function(data){
        //处理天气数据
        var wea = data.results[0].weather_data[0]
        var city = data.results[0].currentCity
        var img = "<img src='"+wea.dayPictureUrl+"' width='26' height='16'/>"
        _that.weather = `${city}&nbsp;&nbsp;${wea.weather}&nbsp;&nbsp;${img}&nbsp;&nbsp;${wea.temperature}`

      });
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

<style>
  .topBar {
    position: relative;
    top: 0;
    width: 100%;
    height: 30px;
    min-width: 430px;
    font-size: 14px;
    color: #ffffff;
  }
  .topBar a,
  .topBar a:link {
    color: #ffffff;
    text-decoration: none;
  }
  .topBar a:hover {
    color: orange;
  }
  .topBar-banner {
    position: absolute;
    display: table;
    left: 50%;
    width: 72.5%;
    height: 100%;
    transform: translateX(-50%);
  }
  .topBar-hide {
    display: hidden;
  }
  .topBar-time,
  .topBar-other {
    position: relative;
    display: inline-block;
    width: 50%;
  }
  .topBar-time {
    top: 30%;
    text-align: left;
    transform: translateY(-20%);
  }
  .topBar-other {
    top: 50%;
    text-align: right;
    transform: translateY(20%);
  }
  .topBar-other::after {
    display: block;
    content: '';
    clear: both;
  }
  .topBar-other>div:first-child {
    float: right;
    top: 2px;
    display: inline-block;
    margin-bottom: 5px;
  }
  .topBar-other>div:last-child {
    float: right;
    display: inline-block;
  }
  .topBar-login {
    margin-right: 20px;
  }
  .topBar-login > a{
    text-decoration: none;
    color: #ffffff;
  }
  .topBar-login > a:hover{
    color: #FF8C00;
  }
  .topBar-select {
    border-radius: 2px;
  }

  /*颜色选择器*/
  .el-color-picker--mini {
    height: 22px;
  }
  .el-color-picker--mini .el-color-picker__trigger {
    height: 22px;
  }
  .el-color-picker__color {
    border-radius: 2px;
  }
  /*颜色选择器*/

  @media screen and (max-width: 580px) {
    .topBar-banner {
      width: 100%;
      height: 100%;
    }
  }
</style>
