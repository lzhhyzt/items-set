<template>
  <div class="user" :style="userNewStyle">
    <div class="user__head">
      您当前所在的位置：<a href="javascript: void(0)">用户管理</a>
    </div>
    <div class="user__body">
      <div class="user__body-list">
        <list/>
      </div>
      <div class="user__body-add">
        <add-user/>
      </div>
    </div>
  </div>
</template>

<script>
import List from './components/list'
import AddUser from './components/addUser'
import Cookie from '../../module/cookie.js'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'user',
  components: {
    List,AddUser
  },
  data () {
    return {
      userNewStyle: {},  // 类元素新增样式,'
      form: {
        name: '',
        sex: '',
        age: 0,
        phone: '',
        email: '',
        address: '',
        autograph: ''
      }
    }
  },
  computed: {
    ...mapGetters ([
      'getIsCollapse'
    ])
  },
  created () {
    let sh = document.documentElement.scrollHeight
    this.userNewStyle = {
      height: sh + 'px'
    }
    this.changePageStyle(this.getIsCollapse) // 改变当前页的宽度等样式

    // 判断用户权限,权限不够跳转首页不能访问
    if (!Cookie.get('CURRENTUSER') || Cookie.get('USERTYPE') != '1') {
      this.$router.push('/home')
      return false
    }
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
        this.userNewStyle = {
          left: '64px',
          width: 'calc(100% - 64px)',
          height: sh  + 'px',
          transition: 'width 0.35s, left 0.35s',
          MozTransition: 'width 0.35s, left 0.35s',
          WebkitTransition: 'width 0.35s, left 0.35s',
          OTransition: 'width 0.35s, left 0.35s'
        }
      } else {
        this.userNewStyle = {
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
  .user {
    position: relative;
    top: 62px;
    left: 200px;
    width: calc(100% - 200px);
    min-width: 560px;
    overflow: hidden;
    overflow-y: scroll;
    font-size: 14px;
  }
  .user__head {
    position: relative;
    width: 100%;
    height: 30px;
    color: #999999;
    padding: 3px 0 3px 10px;
  }
  .user__head a {
    color: #409eff;
    text-decoration: none;
  }
  .user__body {
    position: relative;
    display: flex;
    width: 100%;
    height: 92%;
    margin-top: 0px;
  }
  .user__body-list {
    width: 36%;
    height: auto;
    margin-right: 20px;
    border: 1px solid #D8D8D8;
  }
  .user__body-add {
    width: 62%;
    height: auto;
    border: 1px solid #D8D8D8;
  }
</style>
