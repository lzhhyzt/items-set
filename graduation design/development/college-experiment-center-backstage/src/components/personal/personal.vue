<template>
  <div class="personal" :style="personalNewStyle">
    <div class="personal__head">
      您当前所在的位置：<a href="javascript: void(0);">个人中心</a>
    </div>
    <div class="personal__body">
    </div>
  </div>
</template>

<script>
import { mapGetters, mapMutations, mapActions } from 'vuex'

export default {
  name: 'personal',
  data () {
    return {
      personalNewStyle: {},  // 类元素新增样式,'
    }
  },
  computed: {
    ...mapGetters ([
      'getIsCollapse'
    ])
  },
  mounted () {
    let sh = document.documentElement.scrollHeight
    this.personalNewStyle = {
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
        this.personalNewStyle = {
          left: '64px',
          width: 'calc(100% - 64px)',
          height: sh  + 'px',
          transition: 'width 0.35s, left 0.35s',
          MozTransition: 'width 0.35s, left 0.35s',
          WebkitTransition: 'width 0.35s, left 0.35s',
          OTransition: 'width 0.35s, left 0.35s'
        }
      } else {
        this.personalNewStyle = {
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
  .personal {
    position: relative;
    top: 62px;
    left: 200px;
    width: calc(100% - 200px);
    min-width: 560px;
    overflow: hidden;
    overflow-y: scroll;
    font-size: 14px;
  }
  .personal__head {
    position: relative;
    width: 100%;
    height: 30px;
    color: #999999;
    padding: 3px 0 3px 10px;
  }
  .personal__head a {
    color: #409eff;
    text-decoration: none;
  }
  .personal__body {
    position: relative;
    display: flex;
    width: 100%;
    height: auto;
    margin-top: 20px;
    border: 1px solid red;
  }
</style>
