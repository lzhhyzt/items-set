<template>
  <div class="baseInfo" :style="baseInfoNewStyle">
    <div class="baseInfo__head">
      您当前所在的位置：<a href="javascript: return false;">个人中心</a> >> 基本信息
    </div>
    <div class="baseInfo__body">
      <div class="baseInfo__info">
        <!--显示管理员的基本信息-->
        <per-info/>
      </div>
      <div class="baseInfo__operation">
        <!--个人中心的一些基本操作-->
        <operation/>
      </div>
    </div>
  </div>
</template>

<script>
import PerInfo from './perInfo'
import Operation from './operation'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'baseInfo',
  components: {
    PerInfo, Operation
  },
  data () {
    return {
      baseInfoNewStyle: {}  // 类元素新增样式
    }
  },
  computed: {
    ...mapGetters ([
      'getIsCollapse'
    ])
  },
  created () {
    let sh = document.documentElement.scrollHeight
    this.baseInfoNewStyle = {
      height: sh + 'px'
    }
    this.changePageStyle(this.getIsCollapse) // 改变当前页的宽度等样式
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
        this.baseInfoNewStyle = {
          left: '64px',
          width: 'calc(100% - 64px)',
          height: sh  + 'px',
          transition: 'width 0.35s, left 0.35s',
          MozTransition: 'width 0.35s, left 0.35s',
          WebkitTransition: 'width 0.35s, left 0.35s',
          OTransition: 'width 0.35s, left 0.35s'
        }
      } else {
        this.baseInfoNewStyle = {
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
  .baseInfo {
    position: relative;
    top: 62px;
    left: 200px;
    width: calc(100% - 200px);
    min-width: 560px;
    overflow: hidden;
    overflow-y: scroll;
    font-size: 14px;
  }
  .baseInfo__head {
    position: relative;
    width: 100%;
    height: 30px;
    color: #999999;
    padding: 3px 0 3px 10px;
  }
  .baseInfo__head a {
    color: #409eff;
    text-decoration: none;
  }
  .baseInfo__body {
    position: relative;
    display: flex;
    width: 100%;
    height: auto;
    margin-top: 20px;
  }
  .baseInfo__info {
    position: relative;
    display: inline-block;
    width: 38%;
    height: inherit;
    border: 1px solid #D8D8D8;
    border-top: 3px solid #409eff;
    margin-left: 10px;
    margin-right: 20px;
  }
  .baseInfo__operation {
    position: relative;
    display: inline-block;
    width: 58%;
    height: inherit;
    border: 1px solid #D8D8D8;
    margin-right: 10px;
  }
</style>
