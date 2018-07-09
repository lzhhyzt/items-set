<template>
  <div class="detail">
    <div>
      <img src="./image/center.png" width="970" height="120">
    </div>
    <div class="detail-main-nav">
        当前位置：<a :href="urls.index">首页</a> >> <a :href="urls.pcenter">个人中心</a>
    </div>
    <div class="detail-main">
      <div class="main__content">
        <div class="main__content-top">
          <div class="top-sculpture">
            <img src="./image/dog.jpg" width="100" height="120"/>
          </div>
          <div class="top-other">
            <div><span>昵称：</span>{{ baseInfo.nickname }}</div>
            <div><span>签名：</span>{{ baseInfo.autograph }}</div>
          </div>
        </div>
        <div class="main__content-bottom">
          <el-tabs type="border-card">
            <el-tab-pane label="个人信息"><base-info/></el-tab-pane>
            <el-tab-pane label="实验室预订"><booking/></el-tab-pane>
            <el-tab-pane label="操作记录">操作记录</el-tab-pane>
            <el-tab-pane label="我的留言">我的留言</el-tab-pane>
            <el-tab-pane label="更多操作">更多操作</el-tab-pane>
          </el-tabs>
        </div>
      </div>
      </div>
    </div>
  </div>
</template>

<script>
import $http from '../../modules/axios.js'
import { apis } from '../../config/url.js'
import Cookie from '../../modules/cookie.js'
import BaseInfo from './component/baseinfo'
import Booking from './component/booking'

export default {
  name: 'pcenter',
  components: {
    BaseInfo,
    Booking
  },
  data () {
    return {
      urls: {
        index: 'index.html',
        pcenter: 'pcenter.html'
      },
      currentUser: '',    // 当前用户
      baseInfo: {},       // 个人的基本信息
    }
  },
  created () {
    this.currentUser = Cookie.get('FUSER')
    this.getBaseInfo(this.currentUser)
  },
  methods: {
    /**
     * 获取个人的基本信息
     */
    getBaseInfo (name) {
      var _that = this
      $http.post(apis.getFUserDetail, {
        username: name
      })
      .then(res => {
        _that.baseInfo = res.data.detail
      })
    },
  }
}

</script>

<style scoped>
  .detail {
    position: relative;
    top: 6px;
    left: 50%;
    width: 72.5%;
    height: auto;
    min-width: 970px;
    margin-top: 10px;
    margin-bottom: 20px;
    font-size: 14px;
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    transform: translateX(-50%);
    overflow:hidden;
  }
  .detail a {
    color: #1E90FF;
    font-size: 14px;
  }
  .detail a:link {
    color: #1E90FF;
    text-decoration: none;
  }
  .detail a:active {
    color: red;
    text-decoration: none;
  }
  .detail a:visited {
    color: #1E90FF;
    text-decoration: none;
  }
  .detail a:hover {
    color: red;
    text-decoration: none;
  }
  .detail::after {
    display: block;
    content: '';
    clear: both;
  }
  .detail-main-nav {
    text-align: left;
  }
  .detail-main {
    position: relative;
    float: left;
    overflow: hidden;
    text-align: left;
  }

  .detail-main {
    width: 99%;
    margin-left: 5px;
    background: #ffffff;
    border-radius: 4px;
    border: 1px solid #999999;
  }

  .main__content {
    margin: 15px;
    border: 1px solid #d8d8d8;
  }
  .main__content-top {
    margin: 10px 10px 30px 10px;
  }
  .top-sculpture,
  .top-other {
    display: inline-block;
  }
  .top-sculpture {
    box-shadow: 2px 2px 2px #d8d8d8;
  }
  .top-other {
    margin-left: 20px;
    text-align: left;
  }
  .top-other > div:first-child {
    margin-bottom: 20px;
  }
  .top-other > div span {
    color: #67c23a;
  }


</style>
