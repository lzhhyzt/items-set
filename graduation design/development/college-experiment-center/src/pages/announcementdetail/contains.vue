<template>
  <div class="announcementdetail">
      <div class="announcementdetail-main">
        <div class="announcementdetail-main-nav">
          <span style="color: #004893;">当前位置：</span>
          <a :href="urls.index">首页</a> >> <a :href="urls.announcement">公告中心</a> >> 详情
        </div>
        <div class="announcementdetail-main-content">
          <!--公告详情标题-->
          <div class="announcement-title">
            <h4>{{ announcement.title }}</h4>
            <h5 style="color: #c0c0c0;">{{ announcement.subtitle }}</h5>
          </div>
          <!--公告详情时间作者登-->
          <div class="announcement-addition">
            <span>作者：{{ announcement.author }}</span>&nbsp;&nbsp;
            <span>发表时间：{{ new Date(announcement.date).format('yyyy-MM-dd hh:mm') }}</span>&nbsp;&nbsp;
            <span>点击数：{{ announcement.visits }}</span>
          </div>
          <!--公告详情内容-->
          <div class="announcement-content" v-html="announcement.contents"></div>
          <!--上篇下篇导航-->
          <div class="announcement-navigation">
            <p>上一篇：<a :href="'announcementdetail.html?index=' + (parseInt(previous.id)).toString()" @click="increaseVisits(previous.id)"> {{ previous.title }} </a></p>
            <p>下一篇：<a :href="'announcementdetail.html?index=' + (parseInt(next.id)).toString()" @click="increaseVisits(next.id)"> {{ next.title }} </a></p>
          </div>
        </div>
      </div>
      <div class="announcementdetail-tags">
        <!--标签导航-->
        <div class="announcementdetail-tag1">
          <div class="announcementdetail-tag1-title">
            <div class="tag1-title-before"></div>
            <div class="tag1-title-left">
              <span>通告中心</span>
            </div>
          </div>
          <div class="announcementdetail-tag1-content">
            <ul>
              <li v-for="item in guideList" :key="item.url">
                <i class="el-icon-caret-right"></i>
                <a :href="item.url">{{ item.title }}</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
  </div>
</template>

<script>
import { apis } from '../../config/url.js'
import $http from '../../modules/axios.js'
import formaterTime from '../../modules/time.js'

export default {
  name: 'announcementdetail',
  data () {
    return {
      urls: {
        index: 'index.html',
        announcement: 'announcement.html'
      },
      announcement: {
        id: '',         // 索引值
        title: '',      // 标题
        contents: '',   // 主要内容
        author: '',     // 作者
        date: '',       // 日期
        state: -1,      // 发表状态
        visits: 0       // 访问次数
      },
      previous: {},      // 上一篇
      next: {},          // 下一篇
      guideList: [
        {url: '/announcement.html', title: '通告列表'},
      ]
    }
  },
  created () {
    if (process.env.NODE_ENV == "production") {
      this.urls.index = '/cec/index.html'
      this.urls.announcement = '/cec/announcement.html'
      this.guideList[0].url = '/cec/announcement.html'
    }
  },
  mounted () {
    // 时间初始格式化
    formaterTime()

    // 获得地址的公告的id
    var currentUrl = window.location.href
    var index = currentUrl.indexOf('index')
    var id = parseInt(currentUrl.substr(index+6))

    // 根据id获取公告
    this.getAnnouncement(id)    // 当前篇
    this.getPrevious(id)  // 上一篇
    this.getNext(id)      // 下一篇
  },
  methods: {
    /**
     * 根据索引向服务器发起请求
     * 获取指定id的公告
     */
    getAnnouncement (id) {
      var _that = this

      if (id != null) {
        $http.post(apis.getAnnouncementById, {
          id: id,  // 公告id
        })
        .then(res => {
          var datas = res.data.announcement
          _that.announcement = datas
        })
      } else {
        this.$message({
          type: 'error',
          message: '获取内容失败'
        })
      }
    },
    /**
     * 获得上一篇公告
     */
    getPrevious (id) {
      $http.post(apis.getPreviousOrNextAnnouncement, {
        id: id,       // 公告id
        direction: 0  // 查询上一条
      })
      .then(res => {
        if (res.code == 1) {
          var datas = res.data.announcement
          this.previous = datas
        } else {
          this.previous.title = ''
          this.previous.id = ''
        }
      })
    },
    /**
     * 获得下一篇公告
     */
    getNext (id) {
      $http.post(apis.getPreviousOrNextAnnouncement, {
        id: id,       // 公告id
        direction: 1  // 查询下一条
      })
      .then(res => {
        if (res.code == 1) {
          var datas = res.data.announcement
          this.next = datas
        } else {
          this.next.title = ''
          this.next.id = ''
        }
      })
    },
    /**
     * 访问次数+1
     */
    increaseVisits (id) {

    }
  }
}

</script>

<style scoped>
  .announcementdetail {
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
  .announcementdetail a {
    color: #07519A;
    font-size: 14px;
  }
  .announcementdetail a:link {
    color: #07519A;
    text-decoration: none;
  }
  .announcementdetail a:active {
    color: #FF0000;
    text-decoration: none;
  }
  .announcementdetail a:visited {
    color: #07519A ;
    text-decoration: none;
  }
  .announcementdetail a:hover {
    color: #1E90FF;
    text-decoration: underline;
  }
  .announcementdetail::after {
    display: block;
    content: '';
    clear: both;
  }
  .announcementdetail-tags,
  .announcementdetail-main {
    position: relative;
    float: left;
    text-align: left;
  }
  .announcementdetail-tags {
    display: inline-block;
    width: 28%;
    margin-left: 10px;
  }
  .announcementdetail-main {
    width: 70%;
    margin-left: 5px;
    background: #ffffff;
    border-radius: 4px;
    border: 1px solid #999999;
  }
  .announcementdetail-main-nav {
    padding: 3px 8px;
    background: -webkit-linear-gradient(#ededed , #ffffff, #ededed);
    background: -o-linear-gradient(#ededed , #ffffff, #ededed);
    background: -moz-linear-gradient(#ededed , #ffffff, #ededed);
    background: linear-gradient(#ededed , #ffffff, #ededed);
  }
  .announcementdetail-main-content {
    padding: 10px 8px;
    border-top: 1px solid #999999;
    border-left: 1px solid #999999;
  }

  /*------公告详情------*/
  .announcement-title,
  .announcement-addition,
  .announcement-content {
    margin-top: 10px;
  }

  .announcement-title {
    line-height: 1.1;
    text-align: center;
    font-size: 20px;
    font-family: "Microsoft Yahei";

  }
  .announcement-addition {
    padding: 5px 0;
    color: #A9A9A9;
    text-align: center;
    font-family: "Microsoft Yahei";
    border: 1px solid #D8D8D8;
  }
  .announcement-content {
    padding: 10px 0 0 0;
    color: inherit;
    text-align: left;
    font-size: 16px;
    font-weight: 500;
    font-family: 宋体;
    line-height: 1.5;
    letter-spacing: 1px;
  }
  /*------公告详情------*/
  .announcement-navigation {

  }

  /*------标签导航------*/
  .announcementdetail-tag1 {
    margin-bottom: 5px;
    border: 1px solid #999999;
  }
  .announcementdetail-tag1 ul {
    list-style: none;
    padding: 0 5px;
  }
  .announcementdetail-tag1 ul li {
    padding: 5px 0;
    border-bottom: 1px dotted #000000;
  }
  .el-icon-caret-right {
    color: #106f00;
  }
  .announcementdetail-tag1-title {
    border-bottom: 1px solid #999999;
  }
  .announcementdetail-tag1-title::after {
    content: '';
    display: block;
    clear: both;
  }
  .tag1-title-before {
    float: left;
    width: 8px;
    height: 19px;
    margin-right: 7px;
    background-color: #409eff;
  }
  .tag1-title-left {
    float: left;
    width: 88%;
    height: inherit;
    padding-left: 10px;
    background: -webkit-linear-gradient(left, #409eff , #ffffff);
    background: -moz-linear-gradient(right, #409eff, #ffffff);
    background: linear-gradient(to right, #409eff , #ffffff);
    opacity: 1;
    color: orange;
  }
  .tag1-title-left>span:first-child  {
    display: inline-block;
    width: 100%;
    color: #ffffff;
  }
  /*------标签导航------*/
</style>
