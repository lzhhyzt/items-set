<template>
  <div class="setting" :style="settingNewStyle">
    <div class="setting__head">
      您当前所在的位置：系统设置
    </div>
    <div class="setting__body">
      <div class="settiong__body-left">
        <!--基本配置-->
        <el-collapse  accordion>
          <el-collapse-item name="1">
            <template slot="title">
              <span>基本设置 Basic</span>
            </template>
            <div>
              <ul class="basicList">
                <router-link :to="{path: '/setting/theme'}">
                  <li class="basicList__item">
                    <div>前台主题色</div>
                  </li>
                </router-link>
                <!--
                <router-link :to="{path: '/setting/font'}">
                  <li class="basicList__item">
                      <div>前台字体</div>
                  </li>
                </router-link>
                -->
              </ul>
            </div>
          </el-collapse-item>
          <!--
          <el-collapse-item name="2">
            <template slot="title">
              <span class="">高级设置 Advanced</span>
            </template>
            <div>暂无高级设置</div>
          </el-collapse-item>
          -->
          <el-collapse-item name="2">
            <template slot="title">
              <span>其他设置 Others</span>
            </template>
            <div>暂无其他设置</div>
          </el-collapse-item>
        </el-collapse>
      </div>
      <div class="settiong__body-right">
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<script>
import { apis } from '../../config/url.js'
import $http from '../../module/axios.js'
import Theme from './component/theme.vue'
import Nothing from './component/nothing.vue'
import Cookie from '../../module/cookie.js'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'setting',
  components: {
    Theme,
    Nothing
  },
  data () {
    return {
      settingNewStyle: {}, // 类元素新增样式
      activeNames: ['1'],
    }
  },
  created () {
    let sh = document.documentElement.scrollHeight
    this.settingNewStyle = {
      height: sh + 'px'
    }
    this.changePageStyle(this.getIsCollapse) // 改变当前页的宽度等样式

    // 判断用户权限,权限不够跳转首页不能访问
    if (!Cookie.get('CURRENTUSER') || Cookie.get('USERTYPE') != '1') {
      this.$router.push('/home')
      return false
    }
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
        this.settingNewStyle = {
          left: '64px',
          width: 'calc(100% - 64px)',
          height: sh  + 'px',
          transition: 'width 0.35s, left 0.35s',
          MozTransition: 'width 0.35s, left 0.35s',
          WebkitTransition: 'width 0.35s, left 0.35s',
          OTransition: 'width 0.35s, left 0.35s'
        }
      } else {
        this.settingNewStyle = {
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
  .setting {
    position: relative;
    top: 62px;
    left: 200px;
    width: calc(100% - 200px);
    min-width: 560px;
    overflow: hidden;
    overflow-y: scroll;
    font-size: 14px;
  }
  .setting a {
    text-decoration: none;
    color: #000000;
  }
  .setting a:hover {
    text-decoration: none;
    color: orange;
  }
  .setting__head {
    position: relative;
    width: 100%;
    height: 30px;
    color: #999999;
    padding: 3px 0 3px 10px;
  }
  .setting__body {
    position: relative;
    width: 100%;
    height: auto;
    padding: 5px 0 5px 10px;
  }
  .setting__body::after {
    display: block;
    content: '';
    clear: both;
  }
  .settiong__body-left,
  .settiong__body-right {
    float: left;
  }
  .settiong__body-left {
    width: 38%;
    height: auto;
  }
  .settiong__body-right {
    width: 61%;
    height: 550px;
    border-left: 1px solid #D8D8D8 ;
  }
  /*基本设置*/
  .basicList {
    padding-left: 0;
  }
  /*基本设置选项*/
  .basicList__item {
    position: relative;
    display: flex;
    width: 100%;
    height: 48px;
    line-height: 48px;
    padding-left: 10px;
    cursor: pointer;
  }
  /*鼠标悬浮在上面的样式*/
  .basicList__item:hover {
    background-color: #ecebec;
  }
  /*鼠标点击时的样式*/
  .basicList__item.active {
    background-color: #ecebec;
  }
</style>
<style>
  /*拖动条的样式*/
  ::-webkit-scrollbar {
    color: #ecebec;
    background-color: #ecebec 100%;
  }
  /*折叠面板项标题*/
  .el-collapse-item__header {
    height: 48px !important;
    font-size: 15px !important;
    color: #3a3a53 !important;
    font-weight: 500 !important;
    border-bottom: 1px solid #ecebec;
  }
  /*折叠面板内容包裹区*/
  .el-collapse-item__wrap {
    background-color: #ffffff !important;
    border-bottom: 1px solid #ecebec;
  }
  /*折叠面板选项*/
  .el-collapse-item__content {
    padding: 0 !important;
  }
</style>
