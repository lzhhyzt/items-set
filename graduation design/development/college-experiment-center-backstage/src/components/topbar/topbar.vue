<template>
  <div class="topbar" :style="topbarNewStyle">
    <div class="topbar__content">
      <div class="topbar__content-collapse">
        <img :src="menuImg"  @click="imgClickEvent"/>
      </div>
      <div class="topbar__content-right">
        <div class="topbar__content-time">
          {{ nowtime() }} {{ time }}
        </div>
        <!--
        <div class="topbar__content-bell">
          <el-badge :value="infoNums" class="item">
            <icon name="bell-o"></icon>
          </el-badge>
        </div>
        -->
        <div class="topbar__content-icon">
            <el-dropdown> <!--trigger="click"点击弹出-->
              <span class="el-dropdown-link">
                <icon name="user-circle-o"></icon>
                &nbsp;{{user}}
                <i class="el-icon-arrow-down el-icon--right"></i>
              </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item>
                  <span @click="selfCenter">个人中心</span>
                </el-dropdown-item>
                <el-dropdown-item divided >
                  <span class="exit-login" @click="exitLogin">
                  <icon name="exchange"></icon>
                  &nbsp;退出登录
                  </span>
                </el-dropdown-item>
              </el-dropdown-menu>
              </el-dropdown>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import FormaterTime from '../../module/time.js'
import Cookies from '../../module/cookie.js'
import { apis } from '../../config/url.js'
import $http from '../../module/axios.js'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'topbar',
  data () {
    return {
      user: '',   // 用户
      userType: '',   // 用户类型(备用)
      time: '',
      infoNums: '99+',
      menuImg: 'http://p4t7xi97p.bkt.clouddn.com/collapse.png',
      topbarNewStyle: {},  // topbar类元素新增样式
    }
  },
  mounted () {
    // 获取登录设置的cookie
    var currentUser = Cookies.get('CURRENTUSER')
    var type = Cookies.get("USERTYPE")
    this.user = currentUser
    this.userType = type
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
     * 图片点击事件
     */
    imgClickEvent () {
      if (this.getIsCollapse == false) {
        this.menuImg = 'http://p4t7xi97p.bkt.clouddn.com/expand.png'
      } else {
        this.menuImg = 'http://p4t7xi97p.bkt.clouddn.com/collapse.png'
      }
      this.setIsCollapse(this.getIsCollapse)
    },

    /**
     * 时间格式化处理事件
     */
    nowtime () {
      // 格式化时间对象
      FormaterTime();

      setInterval(() => {
        var now = new Date().format('yyyy年MM月dd日  hh:mm:ss', false)
        this.time = now
      },1000)
    },
    /**
     * 跳转个人中心
     */
    selfCenter () {
      this.$router.push('/personal/baseInfo')
    },
    /**
     * 退出登录
     */
    exitLogin () {
      // 向服务器发出请求
      $http.post(apis.logout,{})
      .then(res => {
        var code = res.code
        if (code == 1) {
          // 清除cookie
          Cookies.delete('CURRENTUSER')
          Cookies.delete('USERTYPE')
          this.$message({
            type: 'success',
            message: '退出登录成功!'
          })
          setTimeout(function(){
            // 跳转网页
            window.location.href = "/cecb/login/login.html"
          },2000)
        } else {
          this.$message({
            type: 'error',
            message: '退出登录操作响应异常!'
          })
        }
      })
    }
  },
  watch: {
    getIsCollapse: {
      handler (val, oldVal) {
        let sh = document.documentElement.clientHeight
        if (val == true) {
          this.topbarNewStyle = {

            width: 'calc(100% - 64px)',
            transition: 'width 0.35s',
            MozTransition: 'width 0.35s',
            WebkitTransition: 'width 0.35s',
            OTransition: 'width 0.35s'
          }
        } else {
          this.topbarNewStyle = {

            width: 'calc(100% - 200px)',
            transition: 'width 0.6s',
            MozTransition: 'width 0.6s',
            WebkitTransition: 'width 0.6s',
            OTransition: 'width 0.6s'
          }
        }
      }
    }
  }
}
</script>

<style scoped>
  .topbar {
    position: absolute;
    top: 0;
    right: 0;
    width: calc(100% - 200px);
    height: 62px;
    min-width: 560px;
  }

  .topbar__content {
    position: relative;
    height: 60px;
    border-bottom: 1px solid #cccccc;
  }
  .topbar__content-collapse {
    position: absolute;
    top: 50%;
    width: 30px;
    height: 30px;
    margin-left: 20px;
    transform: translateY(-50%);
  }
  .topbar__content-collapse:hover {
    cursor: pointer;
  }
  .topbar__content-collapse > img{
    position: absolute;
    top: 50%;
    left: 50%;
    display: block;
    width: 20px;
    height: 16px;
    transform: translateX(-50%) translateY(-50%);
  }

  .topbar__content-right {
    position: absolute;
    top: 50%;
    right: 20px;
    width: auto;
    height: auto;
    transform: translateY(-50%);
  }
  .topbar__content-time {
    position: relative;
    display: inline-block;
    right: 0;
    width: auto;
    margin-right: 0px;
  }
  .topbar__content-bell {
    position: relative;
    display: inline-block;
  }
  .topbar__content-bell .fa-icon {
    width: 1.4em;
    height: 1.4em;
    color: #999999;
    max-width: 100%;
    max-height: 100%;
    vertical-align: middle;
  }
  .topbar__content-icon {
    display: inline-block;
    margin-left: 40px;
    margin-right: 30px;
  }
  .topbar__content-icon .fa-icon {
    width: 1.6em;
    height: 1.6em;
    color: #999999;
    max-width: 100%;
    max-height: 100%;
    vertical-align: middle;
  }
  .exit-login .fa-icon {
    vertical-align: middle;
  }
  /*---element-ui---*/
  .el-dropdown-menu__item {
    padding: 0 30px;
  }
  .el-dropdown-menu {
    margin-left: 10px;
  }
  /*---element-ui---*/
</style>
