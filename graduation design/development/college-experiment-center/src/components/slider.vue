<template>
  <div class="contains-new1">
    <el-carousel trigger="click" height="250px">
      <el-carousel-item v-for="(item, index) in images" :key="index">
        <a :href=" baseUrl + item.nid"><img class="carousel-img" v-bind:src="item.url" /></a>
        <div class="new1-title">{{item.description}}</div>
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script>
import { apis } from '../config/url.js'
import $http from '../modules/axios.js'
import config from '../config/common.js'

export default {
  data() {
    return {
      baseUrl: '',   // 地址前缀
      images: []     // 轮播信息
    }
  },
  created () {
    this.getImageNews()
    this.getBaseUrl()
  },
  methods: {
    /**
     * 获取图片新闻的信息
     */
    getImageNews () {
      // 向服务器请求图片新闻
      $http.post(apis.getImageNews)
      .then(res => {
        var datas = res.data.list
        this.images = datas
      })
    },

    /**
     * 跳转链接前缀（开发/生产）
     */
    getBaseUrl () {
      // 开发环境或者生产环境
      if (process.env.NODE_ENV == "development") {
        this.baseUrl = '/newsdetail.html?index='
      } else {
        this.baseUrl = '/cec/newsdetail.html?index='
      }
    }
  }
}
</script>
<style scoped>
  /*----轮播图----*/
  .contains-new1 {
    position: relative;
  }
  .el-carousel {
    overflow: hidden;
    transform: translateZ(0);
    -webkit-transform: translateZ(0);
  }
  .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
  }
  .el-carousel__item:nth-child(2n) {
     background-color: #99a9bf;
  }
  .el-carousel__item:nth-child(2n+1) {
     background-color: #d3dce6;
  }
  .el-carousel__arrow {
    color: #409eff;
    background-color: #f5f7fae3;
  }
  .el-carousel__arrow:hover {
    color: #409eff;
    background-color: #f5f7fae3;
  }
  .carousel-img {
    width: inherit;
    height: inherit;
  }
  .new1-title {
    position: absolute;
    z-index: 20;
    bottom: 0;
    width: inherit;
    padding:3px 0;
    color: #ffffff;
     background: rgba(0,0,0,0.6);
  }
  /*----轮播图-----*/
</style>
