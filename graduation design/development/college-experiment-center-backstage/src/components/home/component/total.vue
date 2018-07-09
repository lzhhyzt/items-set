<template>
  <div>
    <div class="total">
      <!-- item选项 -->
      <div class="total__item" v-for="(item, index) in list" :key="index">
        <!-- 头部 -->
        <div class="total__item-top">
          <span class="total__item-top-text">{{ item.topText }}</span>
          <span class="total__item-top-num">{{ item.sum }}</span>
        </div>
        <!-- 尾部 -->
        <div class="total__item-bottom">
           {{ item.bottomText }}
          <span class="total__item-bottom-num">
            {{ item.number }}
          </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { apis } from '../../../config/url.js'
import $http from '../../../module/axios.js'
import formatTime from '../../../module/time.js'
import { createNamespacedHelpers } from 'vuex'
const { mapActions } = createNamespacedHelpers('control/home')

export default {
  name: 'total',
  created () {

  },
  data () {
    return {
      list: [
        { topText: '新闻总数', sum: 0, bottomText: '今日新增', number:-1},
        { topText: '公告总数', sum: 0, bottomText: '今日新增', number:-1},
        { topText: '文件资源总数', sum: 0, bottomText: '暂无'},
        { topText: '前台页面平均停留时间', sum: 0, bottomText: '暂无'},
        { topText: '管理员总数', sum: 0, bottomText: '暂无'}
      ],
    }
  },
  created () {
    formatTime()
    this.arragementAll()
  },
  methods: {
    /**
     * 获取新闻总数
     */
    countNewsSum () {
      var _that = this
      // 总数
      $http.post(apis.getNewsNumber,{})
      .then(res => {
        // 获取返回的新闻总数量
        _that.list[0].sum = res.number
      })

      // 日增数量
      var zero = new Date(new Date().toLocaleDateString()).getTime()
      var night = new Date(new Date().toLocaleDateString()).getTime()+24*60*60*1000-1
      var begin = new Date(zero).format('yyyy-MM-dd hh:mm:ss', false)
      var end = new Date(night).format('yyyy-MM-dd hh:mm:ss', false)

      $http.post(apis.getNewsCountInTime,{
        beginTime: begin,
        endTime: end
      })
      .then(res => {
        _that.list[0].number = res.number
      })
    },

    /**
     * 获取公告总数
     */
    countAnnouncementSum () {
      var _that = this
      // 总量
      $http.post(apis.getAnnouncementNumber,{})
      .then(res => {
        _that.list[1].sum = res.number
      })

      // 日增量
      var zero = new Date(new Date().toLocaleDateString()).getTime()
      var night = new Date(new Date().toLocaleDateString()).getTime()+24*60*60*1000-1
      var begin = new Date(zero).format('yyyy-MM-dd hh:mm:ss', false)
      var end = new Date(night).format('yyyy-MM-dd hh:mm:ss', false)
      $http.post(apis.getAnnouncementsCountInTime,{
        aBeginTime: begin,
        aEndTime: end
      })
      .then(res => {
        _that.list[1].number = res.number
      })
    },

    /**
     * 获取文件资源总数
     */
    countResourceSum () {
      var _that = this
      $http.post(apis.getFilesNumber,{})
      .then(res => {
        // 获取返回的文件总数量
        _that.list[2].sum = res.number
      })
    },

    /**
     * 获取平均时间
     */
    averageStopTime () {
      var _that = this
      var zero = new Date(new Date().toLocaleDateString()).getTime()
      var night = new Date(new Date().toLocaleDateString()).getTime()+24*60*60*1000-1
      var begin = new Date(zero).format('yyyy-MM-dd hh:mm:ss', false)
      var end = new Date(night).format('yyyy-MM-dd hh:mm:ss', false)
      $http.post(apis.getAnnouncementsCountInTime,{
        aBeginTime: begin,
        aEndTime: end
      })
      .then(res => {

      })
    },

    /**
     * 获取管理员总数
     */
    countAdminSum () {
      var _that = this
      $http.post(apis.getAllUserSum,{})
      .then(res => {
        // 获取返回的新闻总数量
        _that.list[4].sum = res.number
      })
    },

    /**
     * 整理
     */
     arragementAll () {
        this.countNewsSum()
        this.countAnnouncementSum()
        this.countResourceSum()
        this.averageStopTime()
        this.countAdminSum()
     }
  }
}
</script>

<style scoped>
  .total {
    padding: 0 15px;
    display: flex;
    justify-content: space-around;
  }
  /*item选项*/
  .total__item {
    width: 180px;
    height: 160px;
    border: 1px solid #D8D8D8;
    display: flex;
    flex-direction: column;
  }
  /*选项头部*/
  .total__item-top {
    height: 120px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }
  .total__item-top-text {
    font-size: 14px;
    color: #707079;
    margin-bottom: 5px;
  }
  .total__item-top-num {
    font-size: 36px;
    color: #3DA5FE;
  }
  /*选项尾部*/
  .total__item-bottom {
    height: 60px;
    line-height: 40px;
    text-align: center;
    font-size: 14px;
    color: #3A3A53;
    background-color: #F2F2F2;
  }
  .total__item-bottom-num {
    color: #fe5723;
  }
</style>
