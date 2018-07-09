<template>
  <div class="announcement">
      <div class="announcement-tags">
         <!--标签导航-->
        <div class="announcement-tag1">
          <div class="announcement-tag1-title">
            <div class="tag1-title-before"></div>
            <div class="tag1-title-left">
              <span>通告中心</span>
            </div>
          </div>
          <div class="announcement-tag1-content">
            <ul>
              <li v-for="item in guideList" :key="item.url">
                <i class="el-icon-caret-right"></i>
                <router-link :to="item.url">{{ item.title }}</router-link>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="announcement-main">
        <div class="announcement-main-nav">
          当前位置：<a :href="urls.index">首页</a> >> <a :href="urls.announcement">通告中心</a>
        </div>
        <div class="announcement-main-content">
          <!-- 公告列表 -->
          <router-view></router-view>
        </div>
      </div>
  </div>
</template>

<script>
export default {
  name: 'announcement',
  data () {
    return {
      urls: {
        index: 'index.html',
        announcement: 'announcement.html'
      },
      guideList: [
        {url: '/announcementList', title: '通告列表'},
      ],
    }
  },
  created () {
    if (process.env.NODE_ENV == "production") {
      this.urls.index = '/cec/index.html'
      this.urls.announcement = '/cec/announcement.html'
    }
  }
}
</script>

<style scoped>
  .announcement {
    position: relative;
    top: 6px;
    left: 50%;
    width: 70%;
    height: auto;
    min-width: 1000px;
    margin-top: 10px;
    margin-bottom: 20px;
    padding-left: 24px;
    font-size: 14px;
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    transform: translateX(-50%);
    overflow:hidden;
  }
  .announcement a {
    color: #07519A;
    font-size: 14px;
  }
  .announcement a:link {
    color: #07519A;
    text-decoration: none;
  }
  .announcement a:active {
    color: red;
    text-decoration: none;
  }
  .announcement a:visited {
    color: #07519A;
    text-decoration: none;
  }
  .announcement a:hover {
    color: red;
    text-decoration: none;
  }
  .announcement::after {
    display: block;
    content: '';
    clear: both;
  }
  .announcement-tags,
  .announcement-main {
    position: relative;
    float: left;
    overflow: hidden;
    text-align: left;
  }
  .announcement-tags {
    width: 24%;
    margin-right: 5px;
  }

  .announcement-main {
    width: 72%;
    margin-left: 5px;
    background: #ffffff;
    border-radius: 4px;
    border: 1px solid #999999;
  }
  .announcement-main-content {
    font-family: "宋体";
  }

  /*----标签导航----*/
  .announcement-tag1 {
    margin: 0 5px 5px 0;
    border: 1px solid #999999;
  }
  .announcement-tag1 ul {
    list-style: none;
    padding: 0 5px;
  }
  .announcement-tag1 ul li {
    padding: 5px 0;
    border-bottom: 1px dotted #000000;
  }
  .el-icon-caret-right {
    color: #106f00;
  }
  .announcement-tag1-title {
    border-bottom: 1px solid #999999;
  }
  .announcement-tag1-title::after {
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
  /*----标签导航----*/

  .announcement-main-nav {
    padding: 3px 8px;
    background: -webkit-linear-gradient(#ededed , #ffffff, #ededed);
    background: -o-linear-gradient(#ededed , #ffffff, #ededed);
    background: -moz-linear-gradient(#ededed , #ffffff, #ededed);
    background: linear-gradient(#ededed , #ffffff, #ededed);
  }
  .announcement-main-intro {
    padding: 10px 8px;
    border-top: 1px solid #999999;
    border-left: 1px solid #999999;
  }
</style>
