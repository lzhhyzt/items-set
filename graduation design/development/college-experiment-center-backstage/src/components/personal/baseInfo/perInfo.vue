<template>
  <div class="perInfo">
    <!--显示管理员的基本信息-->
    <div class="perInfo__head">
      <!--头像-->
      <div class="perInfo__head-purikura">
        <img src="../assets/user.png" width="60" height="60"/>
      </div>
      <!--标签名-->
      <div class="perInfo__head-label">
        <div class="label-username">{{ currentUser }}</div>
        <div class="label-sign">{{ baseInfo.autograph }}</div>
      </div>
    </div>
    <div class="perInfo__devided"></div>
    <div class="perInfo__body">
      <div class="perInfo__body-list">
        <div class="perInfo__body-editor">
          <i class="el-icon-refresh" @click="getBaseInfo(currentUser)"></i>
          &nbsp;
          <i class="el-icon-edit-outline" @click="setBaseInfoEditor(true)"></i>
        </div>
        <ul class="list-ul">
          <li>性别：<span>{{ baseInfo.sex }}</span></li>
          <li>年龄：<span>{{ baseInfo.age }}</span></li>
          <li>电话：<span>{{ baseInfo.phone }}</span></li>
          <li>邮箱：<span>{{ baseInfo.email }}</span></li>
          <li>地址：<span>{{ baseInfo.address }}</span></li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import $http from '../../../module/axios.js'
import { apis } from '../../../config/url.js'
import Cookie from '../../../module/cookie.js'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'perInfo',
  data () {
    return {
      currentUser: '',    // 当前用户
      baseInfo: {}        // 个人的基本信息
    }
  },
  created () {
    this.currentUser = Cookie.get('CURRENTUSER')
    this.getBaseInfo(this.currentUser)
  },
  methods: {
    /**
     * vuex之mutation修改值
     */
    ...mapMutations([
      'setBaseInfoEditor'
    ]),
    /**
     * 获取个人的基本信息
     */
    getBaseInfo (name) {
      var _that = this
      $http.post(apis.getUserDetail, {
        username: name
      })
      .then(res => {
        _that.baseInfo = res.data.detail
      })
    },
  }
}
</script>

<style scoped>
  .perInfo {
    position: relative;
    display: flex;
    flex-direction: column;
    display: -webkit-flex;
    width: 100%;
  }
  .perInfo__head {
    display: block;
    width: inherit;
    padding: 10px 0;
  }
  .perInfo__head-purikura {
    float:left;
    margin-left: 30px;
  }
  .perInfo__head-purikura::after {
    display:block;
    content: '';
    clear: both;
  }
  .perInfo__head-label {
    float: left;
    margin-left: 20px;
  }
  .label-username {
    line-height: 30px;
  }
  .label-sign {
    line-height: 30px;
  }
  /*分割线*/
  .perInfo__devided {
    display: block;
    width: inherit;
    height: auto;
    border-bottom: 1px solid #D8D8D8;
  }
  .perInfo__body {
    display: block;
    width: inherit;
    padding: 10px 0;
  }
  .perInfo__body-editor {
    text-align: right;
    padding-right: 10px;
  }
  .el-icon-refresh,
  .el-icon-edit-outline {
    font-size: 18px;
    color: #409eff;
    cursor: pointer;
  }
  .el-icon-refresh:hover,
  .el-icon-edit-outline:hover {
    color: orange;
  }
  .list-ul {
    list-style: none;
    padding-left: 10px;
  }
  .list-ul > li {
    line-height: 40px;
    font-weight: bold;
  }
  .list-ul > li > span {
    font-weight: normal;
  }
</style>
