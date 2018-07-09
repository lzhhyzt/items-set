<template>
  <div class="apple">
    <div class="apple__title">
      <span>{{ title }}</span>
    </div>
    <div class="apple__body">
      <el-row>
        <el-col :span="8" v-for="(item, index) in appleList" :key="index" :offset="2">
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
  name: 'apple',
  data () {
    return {
      title: '',
      domain: '',
      appleList: [
        {name: '苹果显示屏', img: 'apple_122345.jpg', style: '型号：GTX1100-KYGPS'},
        {name: '旧苹果电脑', img: 'apple_000128186.jpg', style: '型号：ZX0012-52PLS'},
        {name: '苹果4显示屏', img: 'apple_52131321.jpg', style: '型号：GTX3100-LPSXD'},
        {name: '苹果主机1', img: 'apple_58542233.jpg', style: '型号：AZJ450-KYGPS'},
        {name: '苹果主机2', img: 'apple_58546552.jpg', style: '型号：AZJ502-KKSOP'},
        {name: '苹果主机3', img: 'apple_2343522.jpg', style: '型号：AZJ680-PWSTSX'}
      ]
    }
  },
  created () {
    // 获取内容
    this.updateContent()
    this.domain = config.qiniuDomain  // 获取域名
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
  .apple__title {
    padding: 6px 0;
    background: #F4FCFF;
    text-align: center;
    border: 1px solid #B4D8F0;
  }
  .apple__title span{
    font-size: 18px;
    font-family: "宋体";
    font-weight: bold;
  }
  .apple__body {
    padding: 20px 0;
  }
</style>
<style>
  .apple__body .time {
    font-size: 10px;
    color: #999999;
  }
  .apple__body .bottom {
    margin-top: 13px;
    line-height: 12px;
  }
  .apple__body .image {
    width: 160px;
    height: 140px;
    display: block;
  }
  .apple__body .clearfix:before,
  .apple__body .clearfix:after {
      display: table;
      content: "";
  }
  .apple__body .clearfix:after {
      clear: both
  }
  .apple__body .el-col-8 {
    width: 160px;
  }
  .apple__body .el-card {
    width: 160px;
    margin-bottom: 30px;
    font-size: 10px;
    text-align: center;
  }
</style>

