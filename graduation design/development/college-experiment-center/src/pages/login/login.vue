<template>
  <div class="login">
   	<div class="login-title">
   		<img src="./image/icon.png" width="20" height="20"/>
   		实验中心用户登录
   	</div>
    <!--登录框-->
    <div class="login-box">
      <div class="login-box-title">
      	<div class="login-box-error" v-show="showState">{{ showTip }}</div>
      	<p>欢迎您，用户</p>
      </div>
      <form class="login-box-form" method="post" action="#" onsubmit="return false">
        <div clas="box-form-account">
          <div class="account-icon fl"></div>
          <input type="text" name="username" class="form-account fl" placeholder="用户编号" value="" v-model="sid">
        </div>
        <div class="box-form-password">
          <div class="password-icon fl"></div>
          <input type="password" name="password" class="form-password fl" placeholder="密码" v-model="password">
        </div>
        <input class="form-submit" type="button" value="登录" @click="login()">
      </form>
    </div>
  </div>
</template>

<script>
import { apis } from '../../config/url.js'
import $http from '../../modules/axios.js'
import $cookies from '../../modules/cookie.js'

export default {
  name: 'login',
  data () {
    return {
      sid: '',           // 学号
      password: '',      // 密码
      captchaUrl: '',    // 验证码url
      showState: false,  // 错误提示显示状态
      showTip: '',       // 显示的验证提示消息
    }
  },
  created () {

  },
  methods: {
    // 信息验证
    validated () {
      var state = true
      var pattern = /^\w{4,16}$/
      var sid = this.sid.trim()
      var pwd = this.password.trim()

      if (sid == "" || pwd == "" || sid == null || pwd == null) {
        this.showState = true
        this.showTip = '账号密码不能为空'
        state = false
      } else {
        if (!pattern.test(sid) || !pattern.test(pwd)) {
          this.showState = true
          this.showTip = '账号密码格式错误'
          state = false
        }
      }
      return state;
    },

    // 登录
    login () {
      var param = {
        username: this.sid,
        password: this.password,
      }

      //表单提交前验证
      if (this.validated() == false) {
        return false
      }

      $http.post(apis.login, param)
      .then(res => {
        console.log(res)
        this.redirectPage(res)
      })

    },

    // 表单提交成功后重定向
    redirectPage (data) {

      console.log('data', data)

      if (data.code == 2) {
        this.showState = true
        this.showTip = data.msg
        return false
      } else if (data.code == 1 && data.msg == "成功") {

        if (data.data.currentUser != null) {

          // 设置cookie
          $cookies.set('FUSER', data.data.currentUser.username)
          $cookies.set('FUSERTYPE', data.data.currentUser.type)
          // 页面跳转
          if (process.env.NODE_ENV == 'development') {
            window.location.href = "http://127.0.0.1:8080/"
          } else {
            window.location.href = "http://127.0.0.1:8090/cec/index.html"
          }
        }
      }
    }
  }

}

</script>

<style>
  html {
    width: 100%;
    height: 100%;
  }
  body {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    background-image: url('http://p4rchro8u.bkt.clouddn.com/mbg.jpg');
    background-repeat: no-repeat;
    background-size: 100% 100%;
    background-position: 0 0;
  }
  input {
    padding-left: 10px;
  }
  .login {
    position: relative;
    width: 100%;
    height: 100%;
  }
  .login-title {
    position: absolute;
    top: 22%;
    left: 50%;
    width: 340px;
    height: 40px;
    color: #ffffff;
    font-weight: bold;
    font-size: 20px;
    font-family: SimSun;
    text-align: center;
    box-sizing: border-box;
    transform: translateX(-50%) translateY(-50%);
    -webkit-transform: translateX(-50%) translateY(-50%);
    -moz-transform: translateX(-50%) translateY(-50%) ;
  }
  .login-box {
    position: absolute;
    top: 50%;
    left: 50%;
    padding: 30px 45px 40px 45px;
    width: 340px;
    height: 300px;
    box-sizing: border-box;
    border-radius: 4px;
    transform: translateX(-50%) translateY(-50%);
    -webkit-transform: translateX(-50%) translateY(-50%);
    -moz-transform: translateX(-50%) translateY(-50%) ;
  }
  .login-box::before {
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;
    width: 340px;
    height: 300px;
    content: "";
    background-color: #fff;
    box-sizing: border-box;
    border-radius: 4px;
    opacity: 0.7;
  }


  .login-box-title {
    margin-bottom: 20px;
  }

  .login-box-title p {
    font-size: 18px;
    font-weight: bold;
    line-height: 25px;
    color: #3DA5FE;
  }

  .login-box-error {
    color: red;
    font-size: 14px;
    text-align: center;
  }

  .login-box-form {
    position: relative;
  }

  ::-webkit-input-placeholder {
    color: #B0B0B0;
    padding-left: 6.4px;
  }

  :-moz-placeholder {/* Firefox 18- */
    color: #B0B0B0;
    padding-left: 6.4px;
  }

  ::-moz-placeholder{/* Firefox 19+ */
    color: #B0B0B0;
    padding-left: 6.4px;
  }

  :-ms-input-placeholder {
    color: #B0B0B0;
    padding-left: 6.4px;
  }

  .form-account {
    margin-bottom: 15px;
    width: 214px;
    height: 32px;
    border: .5px solid #D1D1D1;
    border-top-right-radius: 2px;
    border-bottom-right-radius: 2px;
    box-sizing: border-box;
    outline:none;
  }

  .account-icon {
    width: 32px;
    height: 32px;
    border: .5px solid #D1D1D1;
    border-right-width: 0;
    border-top-left-radius: 2px;
    border-bottom-left-radius: 2px;
    background-color: #FAFAFA;
    background-image: url('image/user.png');
    background-size: 17.7px 17.7px;
    background-position: 6.9px 7px;
    background-repeat: no-repeat;
    box-sizing: border-box;
  }

  .form-password {
    width: 214px;
    height: 32px;
    border: .5px solid #D1D1D1;
    border-top-right-radius: 2px;
    border-bottom-right-radius: 2px;
    box-sizing: border-box;
    outline:none;
  }
  .form-captcha{
    margin-top: 15px;
    width: 120px;
    height: 32px;
    border: .5px solid #D1D1D1;
    border-top-right-radius: 2px;
    border-bottom-right-radius: 2px;
    box-sizing: border-box;
    outline:none;
  }
  .password-icon {
    width: 32px;
    height: 32px;
    border: .5px solid #D1D1D1;
    border-right-width: 0;
    border-top-left-radius: 2px;
    border-bottom-left-radius: 2px;
    background-color: #FAFAFA;
    background-image: url('image/pwd.png');
    background-size: 17.7px 17.7px;
    background-position: 6.9px 7px;
    background-repeat: no-repeat;
    box-sizing: border-box;
  }

  .form-forgotPassword {
    position: absolute;
    right: -6px;
    top: 95px;
    font-size: 12px;
    line-height: 12px;
    color: #1D2E4D;
  }

  .form-forgotPassword, .form-submit:hover {
    cursor: pointer;
    background: #1E90FF;
  }

  .form-submit {
    margin-top: 26px;
    width: 250px;
    font-size: 14px;
    line-height: 36px;
    border: 0;
    border-radius: 2px;
    background-color: #4F9AF5;
    color: #fff;
    outline:none;
  }
  #captcha_img{
    height: 32px;
    width: 110px;
    margin-top: 15px;
    margin-left: 15px;
  }
  .fl { /*左浮动*/
    float: left;
  }
  .fr { /*右浮动*/
    float: right;
  }
  .clear { /*清除浮动*/
    clear: both;
  }
</style>


