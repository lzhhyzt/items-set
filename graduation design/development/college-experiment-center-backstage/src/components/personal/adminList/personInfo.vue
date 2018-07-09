<template>
  <div class="personInfo">
    <!--显示管理员的基本信息-->
    <div class="personInfo__head">
      <!--头像-->
      <div class="personInfo__head-purikura">
        <img src="../assets/user.png" width="60" height="60"/>
      </div>
      <!--标签名-->
      <div class="personInfo__head-label">
        <div class="label-username">{{ base.username }}</div>
        <div class="label-sign">{{ base.autograph }}</div>
      </div>
    </div>
    <div class="personInfo__devided"></div>
    <div class="personInfo__body">
      <div class="personInfo__body-list">
        <ul class="list-ul">
          <li>性别：<span>{{ base.sex }}</span></li>
          <li>年龄：<span>{{ base.age }}</span></li>
          <li>电话：<span>{{ base.phone }}</span></li>
          <li>邮箱：<span>{{ base.email }}</span></li>
          <li>地址：<span>{{ base.address }}</span></li>
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
  name: 'personInfo',
  props: ['base'],
  data () {
    return {
      username: '',     // 当前用户
      baseInfo: {}      // 个人的基本信息
    }
  }
}
</script>

<style scoped>
  .personInfo {
    position: relative;
    display: flex;
    flex-direction: column;
    display: -webkit-flex;
    width: 100%;
  }
  .personInfo__head {
    display: block;
    width: inherit;
    padding: 10px 0;
  }
  .personInfo__head-purikura {
    float:left;
    margin-left: 30px;
  }
  .personInfo__head-purikura::after {
    display:block;
    content: '';
    clear: both;
  }
  .personInfo__head-label {
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
  .personInfo__devided {
    display: block;
    width: inherit;
    height: auto;
    border-bottom: 1px solid #D8D8D8;
  }
  .personInfo__body {
    display: block;
    width: inherit;
    padding: 10px 0;
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
