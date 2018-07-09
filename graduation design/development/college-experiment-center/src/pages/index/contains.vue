<template>
  <div class="contains">
    <!--左边位置便签栏-->
    <div class="contains-tags">
      <!--服务指南-->
      <div class="contains-tag1">
        <div class="contains-tag1-title">
          <div class="tag1-title-before"></div>
          <div class="tag1-title-left">
            <span>服务指南</span>
          </div>
        </div>
        <div class="contains-tag1-content">
          <ul>
            <li v-for="item in guideList" :key="item.url">
              <i class="el-icon-caret-right"></i>
              <a :href="item.url">{{ item.title }}</a>
            </li>
          </ul>
        </div>
      </div>

      <!--学校校历-->
      <!--
      <div class="contains-tag2">
        <div class="contains-tag2-title">
          <div class="tag2-title-before"></div>
          <div class="tag2-title-left">
            <span>学校校历</span>
          </div>
        </div>
        <div class="contains-tag2-content">
            欢迎来到学校校历
        </div>
      </div>
      -->
    </div>
    <!--中间轮播图和公告-->
    <div class="contains-news">
      <!--轮播图-->
      <slider/>

      <!--通知公告-->
      <div class="contains-new2">
        <div class="contains-new2-title">
          <div class="new2-title-before"></div>
          <div class="new2-title-left">
            <span>新闻动态</span>
            <span><a href="news.html">更多...</a></span>
          </div>
        </div>
        <div class="contains-new2-content">
            <ul class="content-ul">
              <li v-for="(item, index) in newsLists">
              <span>
              &nbsp;▣&nbsp;
              <a :href="'newsdetail.html?index=' + item.id">
                {{item.title}}
              </a>
              </span>
              <span>{{new Date(item.date).format('yyyy-MM-dd')}}</span>
              </li>
            </ul>
        </div>
      </div>
    </div>
    <!--右边位置新闻动态-->
    <div class="contains-ways">
      <!--新闻动态-->
      <div class="contains-way1">
        <div class="contains-way1-title">
          <div class="way1-title-before"></div>
          <div class="way1-title-left">
            <span>通知公告</span>
            <span><a href="announcement.html">更多...</a></span>
          </div>
        </div>
        <div class="contains-way1-content">
          <ul class="content-ul">
            <li v-for="(item, index) in announcementList">
            <span>
            &nbsp;▣&nbsp;
            <a :href="'announcementdetail.html?index=' + item.id">
              {{item.title}}
            </a>
            </span>
            <span>{{new Date(item.date).format('yyyy-MM-dd')}}</span>
            </li>
          </ul>
        </div>
      </div>

      <!--友情链接-->
      <div class="contains-way2">
        <div class="contains-way2-title">
          <div class="way2-title-before"></div>
          <div class="way2-title-left">
            <span>友情链接</span>
          </div>
        </div>
        <div class="contains-way2-content">
          <el-tabs v-model="activeName" type="border-card">
            <el-tab-pane label="校外链接" name="first">
              <div class="linker">
                <select id="outside-linker" v-on:change="skipWebPage">
                  <option value="option1">——&nbsp;——&nbsp;校外链接&nbsp;——&nbsp;——</option>
                  <option value="http://www.sise.com.cn/" ><a href="http://www.sise.com.cn/">学院官网</a></option>
                  <option value="http://www.sise.com.cn/"><a href="http://www.sise.com.cn//">图书馆</a></option>
                  <option value="http://cie.scse.com.cn/"><a href="http://cie.scse.com.cn/">创新创业学院</a></option>
                </select>
              </div>
            </el-tab-pane>
            <el-tab-pane label="校内链接" name="second">
              <div class="linker">
                <select id="inside-linker" v-on:change="skipWebPage">
                  <option value="option1">——&nbsp;——&nbsp;校内链接&nbsp;——&nbsp;——</option>
                  <option value="http://www.sise.com.cn/"><a href="http://www.sise.com.cn/">学院官网</a></option>
                </select>
              </div>
            </el-tab-pane>
            <el-tab-pane label="其他链接" name="third">
              <div class="linker">
                <select id="others-linker" v-on:change="skipWebPage">
                  <option value="option1">——&nbsp;——&nbsp;其他链接&nbsp;——&nbsp;——</option>
                  <option value="http://www.jyb.cn/"><a href="http://www.jyb.cn/">中国教育新闻网</a></option>
                  <option value="http://www.chsi.com.cn/"><a href="http://www.chsi.com.cn/">中国学信网</a></option>
                  <option value="http://www.univs.cn/"><a href="http://www.univs.cn/">中国大学生在线</a></option>
                  <option value="http://www.gzhu.edu.cn/"><a href="http://www.gzhu.edu.cn/">广州大学</a></option>
                </select>
              </div>
            </el-tab-pane>
          </el-tabs>
        </div>
      </div>

      <!--联系电话-->
      <div class="contains-way3">
        <div class="contains-way3-title">
          <div class="way3-title-before"></div>
          <div class="way3-title-left">
            <span>联系电话</span>
          </div>
        </div>
        <div class="contains-way3-content">
          <div class="contains-way3-content">
            <ul class="content-call">
              <li v-for="(item, index) in connections">
              <span>&nbsp;&nbsp;● &nbsp;&nbsp;{{item.name}}：</span>
              <span>{{item.call}}</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Vue from 'vue'
import { apis } from '../../config/url.js'
import $http from '../../modules/axios.js'
import formaterTime from '../../modules/time.js'
import Slider from '../../components/slider'

export default {
  name: 'contains',
  components: {
    Slider　// 轮播图组件
  },
  data () {
    return {
      count: 1,
      activeName: 'first',
      connections: [
        {name: '学院咨询', call: '020-87818918'},
        {name: '教务处', call: '020-8781 8125'}
      ],
      currentPage: 1,         // 当前页码
      pageSize: 10,           // 每页显示的记录数，默认为8个
      newsLists: [],          // 新闻列表
      announcementList: [],   // 公告列表
      guideList: [],          // 服务导航列表
    }
  },
  created () {
    // 事件初始化
    formaterTime()

    // 服务指南导航
    this.getGuideList()
    // 更新新闻列表和数量
    this.updateNewsList()
    // 更新公告列表和数量
    this.updateAnnouncementList()
  },
  methods: {
    /**
     * 链接跳转
     */
    skipWebPage (event) {
      var url = event.target.value
      var reg = /^((ht|f)tps?):\/\/[\w\-]+(\.[\w\-]+)+([\w\-\.,@?^=%&:\/~\+#]*[\w\-\@?^=%&\/~\+#])?$/;
      if (reg.test(url)) {
        window.open(url)
      } else {
        return;
      }
    },
    /**
     * 获取服务导航数据
     */
    getGuideList () {
      if (process.env.NODE_ENV == "development") {  // 开发环境
        this.guideList = [
          {url: '/guide.html#/quality', title: '质量方针'},
          {url: '/guide.html#/server', title: '服务内容'},
          {url: '/guide.html#/businessType', title: '业务种类'},
          {url: '/guide.html#/workflow', title: '工作流程'},
          {url: '/guide.html#/rules', title: '规章制度'},
        ]
      } else {
        this.guideList = [
          {url: '/cec/guide.html#/quality', title: '质量方针'},
          {url: '/cec/guide.html#/server', title: '服务内容'},
          {url: '/cec/guide.html#/businessType', title: '业务种类'},
          {url: '/cec/guide.html#/workflow', title: '工作流程'},
          {url: '/cec/guide.html#/rules', title: '规章制度'},
        ]
      }
    },

    /**
     * 更新和显示公告列表
     */
    updateAnnouncementList (current = this.currentPage, size = this.pageSize) {
      var _that = this

      // 向服务器请求公告列表
      $http.post(apis.getAnnouncementByPaging, {
        currentPage: current,  // 当前页码
        pageSize: size         // 每页显示的数量
      })
      .then(res => {
        var datas = res.data.list
        // 调用mutation的方法存进store仓库中
        _that.announcementList = datas
      })
    },
    /**
     * 更新和显示新闻列表
     */
    updateNewsList (current = this.currentPage, size = this.pageSize) {
      var _that = this

      // 向服务器请求新闻列表
      $http.post(apis.getNewsByPaging, {
        currentPage: current,  // 当前页码
        pageSize: size         // 每页显示的数量
      })
      .then(res => {
        var datas = res.data.list
        // 调用mutation的方法存进store仓库中
        _that.newsLists = datas
      })
    },
  }
}
</script>

<style scope>
  .contains {
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
  .contains a {
    color: #07519A;
    font-size: 14px;
    text-decoration:none;
  }
  .contains a:link {
    color: #07519A;
    text-decoration: none;
  }
  .contains a:active {
    color: red;
  }
  .contains a:visited {
    color: #07519A;
    text-decoration: none;
  }
  .contains a:hover {
    color: red;
    text-decoration: none;
  }

  .contains-tags,
  .contains-news,
  .contains-ways {
    position: relative;
    top: 50%;
  }
  .contains-tags {
    float: left;
    width: 20%;
    margin-right: 5px;
    text-align: left;
  }
  .contains-news {
    float: left;
    width: 42%;
    text-align: center;
    overflow-x: hidden;
  }
  .contains-ways {
    float: left;
    width: 36%;
    margin-left: 6px;
    text-align: left;
    overflow: hidden;
  }

  /*----服务指南----*/
  .contains-tag1 {
    margin: 0 5px 5px 0;
    border: 1px solid #999999;
  }
  .contains-tag1 ul {
    list-style: none;
    padding: 0 5px;
  }
  .contains-tag1 ul li {
    padding: 5px 0;
    border-bottom: 1px dotted #D8D8D8;
  }
  .el-icon-caret-right {
    color: #106f00;
  }
  .contains-tag1-title {
    border-bottom: 1px solid #999999;
  }
  .contains-tag1-title::after {
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
    width: 86%;
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
  /*----服务指南----*/


  /*----学校校历----*/
  .contains-tag2 {
    margin: 15px 5px 5px 0;
    border: 1px solid #999999;
  }
  .contains-tag2-title {
    border-bottom: 1px solid #999999;
  }
  .contains-tag2-title::after {
    content: '';
    display: block;
    clear: both;
  }
  .tag2-title-before {
    float: left;
    width: 8px;
    height: 19px;
    margin-right: 7px;
    background-color: #409eff;
  }
  .tag2-title-left {
    float: left;
    width: 86%;
    height: inherit;
    padding-left: 10px;
    background: -webkit-linear-gradient(left, #409eff , #ffffff);
    background: -moz-linear-gradient(right, #409eff, #ffffff);
    background: linear-gradient(to right, #409eff , #ffffff);
    opacity: 1;
    color: orange;
  }
  .tag2-title-left>span:first-child  {
    display: inline-block;
    width: 100%;
    color: #ffffff;
  }
  /*----学校校历----*/

  /*----轮播图----*/
  .el-carousel__arrow {
    color: #409eff;
    background-color: #f5f7fae3;
  }
  .el-carousel__arrow:hover {
    color: #409eff;
    background-color: #f5f7fae3;
  }
  .is-active .el-carousel__button {
    background-color: #409eff;
  }
  .el-carousel__indicators {
    bottom: 20px;
  }
  /*----轮播图----*/

  /*----新闻动态----*/
  .contains-new2 {
    margin: 15px 0 5px 0;
    border: 1px solid #999999;
  }
  .contains-new2-title {
    border-bottom: 1px solid #999999;
  }
  .contains-new2-title::after {
    content: '';
    display: block;
    clear: both;
  }
  .new2-title-before {
    float: left;
    width: 8px;
    height: 19px;
    margin-right: 7px;
    background-color: #409eff;
  }
  .new2-title-left {
    float: left;
    width: 90%;
    height: inherit;
    padding-left: 10px;
    background: -webkit-linear-gradient(left, #409eff , #ffffff);
    background: -moz-linear-gradient(right, #409eff, #ffffff);
    background: linear-gradient(to right, #409eff , #ffffff);
    opacity: 1;
    color: orange;
  }
  .new2-title-left>span:first-child  {
    display: inline-block;
    width: 83%;
    color: #ffffff;
    text-align: left;
  }
  .new2-title-left>span:last-child  {
    display: inline-block;
    width: 15%;
  }
  .new2-title-left>span:last-child a {
    color: #778899;
    font-size: 10pt;
  }
  .contains-new2-content {
    font-family: "宋体";
  }
  .contains-new2-content .content-ul {
    list-style: none;
    padding-left: 0;
  }
  .contains-new2-content .content-ul li {
    display: block;
    margin-bottom: 2px;
    list-style-type: none;
  }
  .contains-new2-content .content-ul li a{
    font-size: 10px;
  }
  .contains-new2-content .content-ul li span:first-child {
    display: inline-block;
    width: 75%;
    font-size: 10pt;
    text-align: left;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .contains-new2-content .content-ul li span:last-child {
    display: inline-block;
    width: 20%;
    text-align: right;
    overflow: hidden;
  }
  .contains-new2-content .content-ul li::before {
    height: auto;
    content: '';
    color: #000000;
  }
  /*----新闻动态----*/


  /*----通知公告----*/
  .contains-way1 {
    margin: 0 0 5px 5px;
    border: 1px solid #999999;
  }
  .contains-way1-title {
    border-bottom: 1px solid #999999;
  }
  .contains-way1-title::after {
    content: '';
    display: block;
    clear: both;
  }
  .way1-title-before {
    float: left;
    width: 8px;
    height: 19px;
    margin-right: 7px;
    background-color: #409eff;
  }
  .way1-title-left {
    float: left;
    width: 90%;
    height: inherit;
    padding-left: 10px;
    background: -webkit-linear-gradient(left, #409eff , #ffffff);
    background: -moz-linear-gradient(right, #409eff, #ffffff);
    background: linear-gradient(to right, #409eff , #ffffff);
    opacity: 1;
    color: orange;
  }
  .way1-title-left>span:first-child  {
    display: inline-block;
    width: 83%;
    color: #ffffff;
  }
  .way1-title-left>span:last-child  {
    display: inline-block;
    width: 15%;
  }
  .way1-title-left>span:last-child a {
    color: #778899;
    font-size: 10pt;
  }
  .contains-way1-content {
    font-family: "宋体";
  }
  .contains-way1-content .content-ul {
    list-style: none;
    padding-left: 5px;
  }
  .contains-way1-content .content-ul li {
    display: block;
    margin-bottom: 2px;
    list-style-type: none;
  }
  .contains-way1-content .content-ul li a{
    font-size: 10px;
  }
  .contains-way1-content .content-ul li span:first-child {
    display: inline-block;
    width: 73%;
    font-size: 10pt;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .contains-way1-content .content-ul li span:last-child {
    display: inline-block;
    width: 23%;
    text-align: right;
    overflow: hidden;
  }
  .contains-way1-content .content-ul li::before {
    height: auto;
    content: '';
    color: #000000;
  }
  /*----通知公告----*/


  /*----友情链接----*/
  .contains-way2 {
    margin: 15px 0 5px 5px;
    border: 1px solid #999999;
  }
  .contains-way2-title {
    border-bottom: 1px solid #999999;
  }
  .contains-way2-title::after {
    content: '';
    display: block;
    clear: both;
  }
  .way2-title-before {
    float: left;
    width: 8px;
    height: 19px;
    margin-right: 7px;
    background-color: #409eff;
  }
  .way2-title-left {
    float: left;
    width: 90%;
    height: inherit;
    padding-left: 10px;
    background: -webkit-linear-gradient(left, #409eff , #ffffff);
    background: -moz-linear-gradient(right, #409eff, #ffffff);
    background: linear-gradient(to right, #409eff , #ffffff);
    opacity: 1;
    color: orange;
  }
  .way2-title-left>span:first-child  {
    display: inline-block;
    width: 100%;
    color: #ffffff;
  }
  /*标签页*/
  .el-tabs__item {
    padding: 0 32px;
  }
  .linker {
    text-align: center;
  }
  .linker select {
    width: 200px;
    height: 30px;
    padding: 0;
    color: #000000;/*#409eff*/
  }
  .linker option {
    text-align: center;
  }
  /*----友情链接----*/


  /*----联系电话----*/
  .contains-way3 {
    margin: 15px 0 5px 5px;
    border: 1px solid #999999;
  }
  .contains-way3-title {
    border-bottom: 1px solid #999999;
  }
  .contains-way3-title::after {
    content: '';
    display: block;
    clear: both;
  }
  .way3-title-before {
    float: left;
    width: 8px;
    height: 19px;
    margin-right: 7px;
    background-color: #409eff;
  }
  .way3-title-left {
    float: left;
    width: 90%;
    height: inherit;
    padding-left: 10px;
    background: -webkit-linear-gradient(left, #409eff , #ffffff);
    background: -moz-linear-gradient(right, #409eff, #ffffff);
    background: linear-gradient(to right, #409eff , #ffffff);
    opacity: 1;
    color: orange;
  }
  .way3-title-left>span:first-child  {
    display: inline-block;
    width: 100%;
    color: #ffffff;
  }
  .content-call {
    list-style: none;
    padding-left: 5px;
  }
  .content-call li {
    display: block;
    margin-bottom: 2px;
    list-style-type: none;
  }
  .content-call li span:first-child {
    display: inline-block;
    width: 30%;
    font-size: 10pt;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .content-call li span:last-child {
    display: inline-block;
    width: 66%;
    text-align: left;
    overflow: hidden;
  }
  .content-call li::before {
    height: auto;
    content: '';
    color: #000000;
  }
  /*----联系电话----*/
</style>
