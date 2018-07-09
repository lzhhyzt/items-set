<template>
  <div class="colony">
    <div class="colony__title">
      <span>{{ title }}</span>
    </div>
    <div class="colony__body">
      <el-row>
        <el-col :span="8" v-for="(item, index) in colonyList" :key="index" :offset="2">
          <el-card :body-style="{ padding: '0px' }">
            <img :src="domain + item.img" class="image">
            <div style="padding: 14px;">
              <span>{{ item.name }}</span>
              <div class="bottom clearfix">
                <time class="time">{{ item.style }}</time>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import config from '../../../config/common.js'

export default {
  name: 'colony',
  data () {
    return {
      title: '',
      domain: '',
      colonyList: [
        {name: '', img: 'colony_12420.jpg', style: '型号：GTX1100-KYGPS'},
        {name: '', img: 'colony_10202.jpg', style: '型号：ZX0012-52PLS'},
        {name: '', img: 'colony_14526.jpg', style: '型号：GTX3100-LPSXD'},
        {name: '', img: 'colony_202031.jpg', style: '型号：AZJ450-KYGPS'},
        {name: '', img: 'colony_21453.jpg', style: '型号：AZJ502-KKSOP'},
        {name: '', img: 'colony_21523.jpg', style: '型号：AZJ680-PWSTSX'},
        {name: '', img: 'colony_25125.jpg', style: '型号：AZJ680-PWSTSX'},
        {name: '', img: 'colony_256122.jpg', style: '型号：AZJ680-PWSTSX'},
        {name: '', img: 'colony_63251.jpg', style: '型号：AZJ680-PWSTSX'}
      ]
    }
  },
  created () {
    // 获取内容
    this.updateContent()
    // 获取域名
    this.domain = config.qiniuDomain
  },
  methods: {
    // 更新页面的内容
    updateContent: function () {
      var path = this.$route.path

      var param = 0
      if (/\/$/.test(path)) {
        param = 1
        this.title = '苹果电脑仪器设备'
      } else if(/\/apple$/.test(path)) {
        param = 1
        this.title = '苹果电脑仪器设备'
      } else if(/\/colony$/.test(path)) {
        param = 2
        this.title = '集群仪器设备'
      } else if(/\/other$/.test(path)) {
        param = 3
        this.title = '其他仪器设备'
      }
    }
  },
  watch: {
    // 监听路由的变化
    $route(to, from) {
      this.updateContent()
    }

  }
}

</script>

<style scoped>
  .colony__title {
    padding: 6px 0;
    background: #F4FCFF;
    text-align: center;
    border: 1px solid #B4D8F0;
  }
  .colony__title span{
    font-size: 18px;
    font-family: "宋体";
    font-weight: bold;
  }
  .colony__body {
    padding: 20px 0;
  }
</style>
<style>
  .colony__body .time {
    font-size: 10px;
    color: #999999;
  }
  .colony__body .bottom {
    margin-top: 13px;
    line-height: 12px;
  }
  .colony__body .image {
    width: 160px;
    height: 140px;
    display: block;
  }
  .colony__body .clearfix:before,
  .colony__body .clearfix:after {
      display: table;
      content: "";
  }
  .colony__body .clearfix:after {
      clear: both
  }
  .colony__body .el-col-8 {
    width: 160px;
  }
  .colony__body .el-card {
    width: 160px;
    margin-bottom: 30px;
    font-size: 10px;
    text-align: center;
  }
</style>

