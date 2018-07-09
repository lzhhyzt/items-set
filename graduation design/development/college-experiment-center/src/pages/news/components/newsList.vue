<template>
  <div class="newsList">
    <!--查询-->
    <div class="newsList__search">
      <div>
        <el-input placeholder="请输入查找内容" v-model="searchInfo" class="input-with-select"
        suffix-icon="el-icon-edit" size="mini">
          <el-select v-model="searchType" slot="prepend" placeholder="请选择">
            <el-option label="标题" value="1"></el-option>
            <el-option label="作者" value="2"></el-option>
          </el-select>
          <el-button slot="append" icon="el-icon-search" @click="searchNews">搜索</el-button>
        </el-input>
      </div>
    </div>
    <div class="newsList__body">
      <!--新闻列表-->
      <div class="newsList__list">
        <ul>
          <li v-for="(item, index) in newsLists" :key="index">
            <div class="newsList__list-title">
              <a :href="'newsdetail.html?index=' + item.id">{{item.title}}</a>
            </div>
            <div class="newsList__list-time">{{new Date(item.date).format('yyyy-MM-dd')}}</div>
            <div class="newsList__list-count">{{item.visits}}</div>
          </li>
        </ul>
      </div>
      <!--分页-->
      <div class="newsList-pagination">
        <div class="newsList-pagination-block">
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :page-sizes="[8, 10, 12, 14]"
            :page-size="pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="newsNumber">
          </el-pagination>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { apis } from '../../../config/url.js'
import $http from '../../../modules/axios.js'
import formaterTime from '../../../modules/time.js'

export default {
  name: 'newsList',
  data () {
    return {
      currentPage: 1,         // 默认的当前页码
      pageSize: 12,           // 每页显示的记录数，默认为8个
      newsLists: [],          // 新闻列表
      newsNumber: 0,          // 新闻列表总数
      searchType: '',         // 查询的类型
      searchInfo: ''          // 需要查询的内容
    }
  },
  created () {
    // 时间初始化
    formaterTime()

    // 更新新闻列表和数量
    this.updateNewsList()
    this.countNewsNumber()
  },
  methods: {
    /**
     * 查询匹配新闻
     */
    searchNews () {
      var value = this.searchInfo // 获取输入的内容
      var type = this.searchType  // 得到需要查询的类型：1-标题和副标题/2-作者

      if (value == null || value == '') {
        this.$message({
          type: 'warning',
          message: '请输入查询内容',
          center: true
        })
        return;
      } else {
        var _that = this
        if (type == 1) {        // 搜索类型为标题匹配字
          // 发送搜索请求
          $http.post(apis.getNewsByTitle, {
            title: value
          })
          .then(res => {
            if (res.code == 1) {
              var datas = res.data.list
              // 调用mutation的方法存进store仓库中
              _that.newsLists = datas
              // 分页设置
              _that.newsNumber = datas.length
            }
          })

        } else if (type == 2) {  // 搜索类型为作者匹配字
          $http.post(apis.getNewsByAuthor, {
            author: value
          })
          .then(res => {
            if (res.code == 1) {
              var datas = res.data.list
              // 调用mutation的方法存进store仓库中
              _that.newsLists = datas
              // 分页设置
              _that.newsNumber = datas.length
            }
          })

        } else {
          this.$message({
            type: 'warning',
            message: '请选择查询的类型',
            center: true
          })
          return;
        }
      }
    },

    /**
     * 分页事件:处理当数值改变事件
     */
    handleSizeChange(size) {
      if (size != null && size > 0) {
        this.pageSize = size
        // 重新获取新闻列表数据
        this.updateNewsList(1, size)
      }
    },
    /**
     * 分页事件:当前页改变事件
     */
    handleCurrentChange(currentPage) {
      if (currentPage != null && currentPage > 0) {
        // 重新获取新闻列表数据
        this.updateNewsList(currentPage)
      }
    },

    /**
     * 更新和显示列表
     */
    updateNewsList (current = this.currentPage, size = this.pageSize) {
      var _that = this
      /**
      * 向服务器请求新闻列表
      */
      $http.post(apis.getNewsByPaging, {
        currentPage: current,  // 当前页码
        pageSize: size         // 每页显示的数量
      })
      .then(res => {
        var datas = res.data.list
        // 调用mutation的方法存进store仓库中
        //_that.setNewsList(datas)
        _that.newsLists = datas
      })
    },
    /**
     * 获取当前的新闻总数量
     */
    countNewsNumber () {
      var _that = this
      //向服务器请求新闻总数
      $http.post(apis.getNewsNumber,{})
      .then(res => {
        // 获取返回的新闻总数量
        _that.newsNumber = res.number
      })
    },

    /**
     * 重新刷新数据列表
     */
    refleshList () {
      this.updateList()
      this.countNewsNumber()
    },
  }
}

</script>

<style scoped>
  .newsList a {
    color: #07519A;
    font-size: 14px;
  }
  .newsList a:link {
    color: #07519A;
    text-decoration: none;
  }
  .newsList a:active {
    color: red;
    text-decoration: none;
  }
  .newsList a:visited {
    color: #07519A;
    text-decoration: none;
  }
  .newsList a:hover {
    color: red;
    text-decoration: none;
  }
  .newsList__list {
    display: block;
    width: 100%;
    height: 100%;
    text-align: left;
    font-family: "宋体";
  }
  .newsList__list a {
    font-size: 12px;
  }
  .newsList__list > ul {
    padding: 0;
    list-style: none;
  }
  .newsList__list > ul li {
    display: block;
    padding: 5px 8px;
    list-style-type: none;
  }
  .newsList__list > ul li:last-child {
    border-bottom: 1px dotted #cccccc;
  }
  .newsList__list-title,
  .newsList__list-time,
  .newsList__list-count {
    display: inline-block;
    overflow: hidden;
  }
  .newsList__list-title {
    width: 76%;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .newsList__list-title a {
    cursor: pointer;
  }
  .newsList__list-time {
    width: 14%;
    text-align: center;
  }
  .newsList__list-count {
    width: 8%;
    text-align: center;
  }

   /*分页*/
  .newsList-pagination {
    position: relative;
    width: 100%;
    height: 100%;
  }
  .newsList-pagination-block {
    position: relative;
    width: auto;
    padding: 5px 8px;
    text-align: center;
  }

  /*----搜索----*/
  .newsList__search {
    display: inline-block;
    margin: 5px 5px 25px 5px;
    float: right;
  }
  .newsList__search::after {
    display: block;
    content: '';
    clear: both;
  }
  .newsList__search > div {
    margin: 0;
  }
  .newsList__search .el-button--mini {
    border-radius: 0 3px 3px 0;
  }
  .newsList__search::after {
    display: block;
    content: '';
    clear: both;
  }
  .search__input {
    width: 250px;
    border-radius: 3px 0 0 3px;
  }
  .search__input > input {
    border-radius: 3px 0 0 3px;
  }
  /*----搜索----*/
</style>
<style>
  .el-select .el-input {
    width: 100px;
  }
  .input-with-select .el-input-group__prepend {
    background-color: #ffffff;
  }
  .el-input-group__append,
  .el-input-group__prepend {
    padding: 0 15px;
  }
  .el-input-group__append button.el-button {
    color: #409eff;
  }
  .el-input-group__append button.el-button:hover {
    color: 	#ffa500;
  }
  .news__body-options-search .el-select
  .el-input.is-focus .el-input__inner {
    width: 160px;
  }
  .el-input-group>.el-input__inner {
    width: 210px;
  }
</style>
