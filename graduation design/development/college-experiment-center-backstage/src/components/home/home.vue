<template>
  <div class="home" :style="homeNewStyle">
    <div class="home__body">

      <!-- 数据总览 -->
      <div class="common">
        <h3 class="common__header">数据总览<i class="common__header-icon"></i></h3>
        <total></total>
      </div>
      <!-- 服务趋势 -->
      <div class="common">
        <!--<h3 class="common__header">访问趋势统计<i class="common__header-icon"></i></h3>-->
        <h3 class="common__header"></h3>
        <nothing></nothing>
      </div>
      </div>
  </div>
</template>

<script>
import Total from './component/total'
import Nothing from './component/nothing'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'home',
  components: {
    Total, Nothing
  },
  data () {
    return {
      homeNewStyle: {}  // 类元素新增样式
    }
  },
  created () {
    let sh = document.documentElement.scrollHeight
    this.homeNewStyle = {
      height: sh + 'px'
    }
    this.changePageStyle(this.getIsCollapse) // 改变当前页的宽度样式
  },
  computed: {
    ...mapGetters ([
      'getIsCollapse'
    ])
  },
  methods: {
    /**
     * vuex之mutation修改值
     */
    ...mapMutations([
      'setIsCollapse'
    ]),
    /**
     * 改变当前页的宽度等样式
     */
    changePageStyle (val) {
      let sh = document.documentElement.scrollHeight
      if (val == true) {
        this.homeNewStyle = {
          left: '64px',
          width: 'calc(100% - 64px)',
          height: sh  + 'px',
          transition: 'width 0.35s, left 0.35s',
          MozTransition: 'width 0.35s, left 0.35s',
          WebkitTransition: 'width 0.35s, left 0.35s',
          OTransition: 'width 0.35s, left 0.35s'
        }
      } else {
        this.homeNewStyle = {
          left: '200px',
          width: 'calc(100% - 200px)',
          height: sh + 'px',
          transition: 'width 0.6s, left 0.6s',
          MozTransition: 'width 0.6s, left 0.6s',
          WebkitTransition: 'width 0.6s, left 0.6s',
          OTransition: 'width 0.6s, left 0.6s'
        }
      }
    }
  },

  watch: {
    getIsCollapse: {
      handler (val, oldVal) {
        this.changePageStyle(val)
      }
    }
  }
}
</script>

<style scoped>
  /*首页*/
  .home {
    position: relative;
    top: 62px;
    left: 200px;
    width: calc(100% - 200px);
    min-width: 560px;
    overflow: hidden;
    overflow-y: scroll;
    font-size: 14px;
  }
  /*首页头部*/
  .home__head {
    position: relative;
    width: 100%;
    height: 24px;
    color: #999999;
    padding: 3px 0 0 10px;
  }
  /*首页内容*/
  .home__body {
    position: relative;
    width: 100%;
    height: auto;
  }

  /* 区块*/
  .common {
    width: 100%;
    background-color: #ffffff;
  }
  .common:nth-last-child(1) {
    margin-bottom: 0px;
  }
  /*区块头部*/
  .common__header {
    width: 100%;
    height: 24px;
    line-height: 24px;
    font-size: 14px;
    color: #3A3A53;
    padding: 6px 0 6px 10px;
    font-weight: normal;
    border: 1px solid #E8E8E8;
    background-color: #fafafa;
  }
  /*头部icon*/
  .common__header-icon {
    width: 16px;
    height: 16px;
    display: inline-block;
    background-image: url(./assets/header.png);
    background-size: 100%;
    margin-left: 5px;
  }
</style>
