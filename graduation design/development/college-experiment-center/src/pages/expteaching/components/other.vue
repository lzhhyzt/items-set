<template>
  <div class="other">
    <div class="other__title">
      <span>{{ title }}</span>
    </div>
    <div class="other__body">
      <el-row>
        <el-col :span="8" v-for="(item, index) in otherList" :key="index" :offset="2">
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
  name: 'other',
  data () {
    return {
      title: '',
      domain: '',
      otherList: [
        {name: 'AOC显示屏', img: 'computer_02123.jpg', style: '型号：TXS92X-KSDS'},
        {name: 'DELL显示屏', img: 'computer_12324.jpg', style: '型号：ZX0012-52SL'},
        {name: '主机类型1', img: 'computer_25102.jpg', style: '型号：AZJ450-KYGPS'},
        {name: '主机类型2', img: 'computer_31201.jpg', style: '型号：AZJ502-FSDF'},
        {name: '主机类型3', img: 'computer_52545.jpg', style: '型号：AZJ502-GSDFS'},
        {name: '键盘类型1', img: 'computer_62002.jpg', style: '型号：AJP802-WERD'},
        {name: '键盘类型2', img: 'computer_75231.jpg', style: '型号：AJP002-GWEDS'}
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
  .other__title {
    padding: 6px 0;
    background: #F4FCFF;
    text-align: center;
    border: 1px solid #B4D8F0;
  }
  .other__title span{
    font-size: 18px;
    font-family: "宋体";
    font-weight: bold;
  }
  .other__body {
    padding: 20px 0;
  }
</style>
<style>
  .other__body .time {
    font-size: 10px;
    color: #999999;
  }
  .other__body .bottom {
    margin-top: 13px;
    line-height: 12px;
  }
  .other__body .image {
    width: 160px;
    height: 140px;
    display: block;
  }
  .other__body .clearfix:before,
  .other__body .clearfix:after {
      display: table;
      content: "";
  }
  .other__body .clearfix:after {
      clear: both
  }
  .other__body .el-col-8 {
    width: 160px;
  }
  .other__body .el-card {
    width: 160px;
    margin-bottom: 30px;
    font-size: 10px;
    text-align: center;
  }
</style>

