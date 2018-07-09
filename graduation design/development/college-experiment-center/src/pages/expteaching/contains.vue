<template>
  <div class="expteaching">
      <div class="expteaching-tags">
        <div class="expteaching-tag1">
          <div class="expteaching-tag1-title">
            <div class="tag1-title-before"></div>
            <div class="tag1-title-left">
              <span>仪器实验室</span>
            </div>
          </div>
          <div class="expteaching-tag1-content">
            <ul>
              <li v-for="item in list" :key="item.url">
                <i class="el-icon-caret-right"></i>
                <router-link :to="item.url">{{ item.title }}</router-link>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="expteaching-main">
        <div class="expteaching-main-nav">
          当前位置：<a :href="urls.index">首页</a> >> <a :href="urls.expteaching">仪器设备</a>
        </div>
        <div class="expteaching-main-content">
          <router-view></router-view>
        </div>
      </div>
  </div>
</template>

<script>

export default {
  name: 'expteaching',
  data () {
    return {
      urls: {
        index: 'index.html',
        expteaching: 'expteaching.html'
      },
      list: [
        {url: '/apple', title: '苹果实验室'},
        {url: '/colony', title: '集群实验室'},
        {url: '/other', title: '其他实验室'}
      ]
    }
  },
  created () {
    if (process.env.NODE_ENV == "production") {
      this.urls.index = '/cec/index.html'
      this.urls.expteaching = '/cec/expteaching.html'
    }
  }
}

</script>

<style scoped>
  .expteaching {
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
  .expteaching a {
    color: #07519A ;
    font-size: 14px;
  }
  .expteaching a:link {
    color: #07519A ;
    text-decoration: none;
  }
  .expteaching a:active {
    color: red;
    text-decoration: none;
  }
  .expteaching a:visited {
    color: #07519A ;
    text-decoration: none;
  }
  .expteaching a:hover {
    color: red;
    text-decoration: none;
  }
  .expteaching::after {
    display: block;
    content: '';
    clear: both;
  }
  .expteaching-tags,
  .expteaching-main {
    position: relative;
    float: left;
    overflow: hidden;
    text-align: left;
  }
  .expteaching-tags {
    display: block;
    width: 24%;
    margin-right: 5px;
  }

  .expteaching-main {
    width: 74%;
    background: #ffffff;
    border-radius: 4px;
    border: 1px solid #999999;
  }

  /*----标签导航----*/
  .expteaching-tag1 {
    margin: 0 5px 5px 0;
    border: 1px solid #999999;
  }
  .expteaching-tag1-title {
    border-bottom: 1px solid #999999;
  }
  .expteaching-tag1-title::after {
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
    background: linear-gradient(to right, #409eff, #ffffff);
    opacity: 1;
    color: orange;
  }
  .tag1-title-left > span:first-child  {
    display: inline-block;
    width: 100%;
    color: #ffffff;
  }
  .expteaching-tag1-content ul li {
    color: #07519A;
    border-bottom: 1px dotted #999999;
  }
  .el-icon-caret-right {
    color: #008000;
  }
  /*----标签导航----*/

  .expteaching-main-nav {
    padding: 3px 8px;
    background: -webkit-linear-gradient(#ededed , #ffffff, #ededed);
    background: -o-linear-gradient(#ededed , #ffffff, #ededed);
    background: -moz-linear-gradient(#ededed , #ffffff, #ededed);
    background: linear-gradient(#ededed , #ffffff, #ededed);
  }
  .expteaching-main-content {
    padding: 10px 8px;
    border-top: 1px solid #999999;
    border-left: 1px solid #999999;
  }
  .expteaching-main-content .title {
    padding: 8px 0;
    background: #F4FCFF;
    text-align: center;
    border: 1px solid #B4D8F0;
  }
  .expteaching-main-content .title span{
    font-size: 18px;
    font-family: "宋体";
    font-weight: bold;
  }
  .expteaching-main-content .body {

  }
</style>
