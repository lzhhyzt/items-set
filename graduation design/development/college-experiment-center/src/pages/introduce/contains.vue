<template>
  <div class="introduce">
      <div class="introduce-tags">
        <!--标签导航-->
        <div class="introduce-tag1">
          <div class="introduce-tag1-title">
            <div class="tag1-title-before"></div>
            <div class="tag1-title-left">
              <span>中心概况</span>
            </div>
          </div>
          <div class="introduce-tag1-content">
            <ul>
              <li v-for="item in guideList" :key="item.url">
                <i class="el-icon-caret-right"></i>
                <router-link :to="item.url">{{ item.title }}</router-link>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="introduce-main">
        <div class="introduce-main-nav">
          当前位置：<a :href="urls.index">首页</a> >> <a :href="urls.introduce">中心简介</a>
        </div>
        <div class="introduce-main-intro">
          <router-view></router-view>
        </div>
      </div>
  </div>
</template>
<script>

export default {
 name: 'introduce',
 data () {
    return {
      urls: {
        index: 'index.html',
        introduce: 'introduce.html'
      },
      guideList: [
        {url: '/description', title: '中心简介'},
      ],
    }
 },
 created () {
   if (process.env.NODE_ENV == "production") {
     this.urls.index = '/cec/index.html'
     this.urls.introduce = '/cec/introduce.html'
   }
 }
}

</script>

<style scoped>
  .introduce {
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
  .introduce a {
    color: #07519A ;
    font-size: 14px;
    text-decoration:none;
  }
  .introduce a:link {
    color: #07519A ;
    text-decoration: none;
  }
  .introduce a:active {
    color: red;
  }
  .introduce a:visited {
    color: #07519A ;
    text-decoration: none;
  }
  .introduce a:hover {
    color: red;
    text-decoration: none;
  }
  .introduce::after {
    display: block;
    content: '';
    clear: both;
  }
  .introduce-tags,
  .introduce-main {
    position: relative;
    float: left;
    overflow: hidden;
    text-align: left;
  }
  .introduce-tags {
    width: 25%;
    margin-right: 5px;
  }

  .introduce-main {
    width: 73.5%;
    margin-left: 5px;
    background: #ffffff;
    border-radius: 4px;
    border: 1px solid #999999;
  }

  /*----标签导航----*/
  .introduce-tag1 {
    margin: 0 5px 5px 0;
    border: 1px solid #999999;
  }
  .introduce-tag1 ul {
    list-style: none;
    padding: 0 5px;
  }
  .introduce-tag1 ul li {
    padding: 5px 0;
    border-bottom: 1px dotted #000000;
  }
  .el-icon-caret-right {
    color: #106f00;
  }
  .introduce-tag1-title {
    border-bottom: 1px solid #999999;
  }
  .introduce-tag1-title::after {
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

  .introduce-main-nav {
    padding: 3px 8px;
    background: -webkit-linear-gradient(#ededed , #ffffff, #ededed);
    background: -o-linear-gradient(#ededed , #ffffff, #ededed);
    background: -moz-linear-gradient(#ededed , #ffffff, #ededed);
    background: linear-gradient(#ededed , #ffffff, #ededed);
  }

</style>
