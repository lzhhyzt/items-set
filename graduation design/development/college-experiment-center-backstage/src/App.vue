<template>
  <div id="app">
    <navigation/>
    <top-bar/>
    <router-view/>
  </div>
</template>

<script>
import Navigation from '@/components/navigation/navigation.vue'
import TopBar from '@/components/topbar/topbar.vue'
import Cookie from './module/cookie.js'

export default {
  name: 'App',
  components: {
    Navigation,
    TopBar
  },
  created () {
    if (Cookie.get('CURRENTUSER') == null) {
        if (process.env.NODE_ENV == "development") { // 开发环境
          window.location.href = "http://127.0.0.1:8070/login/login.html";
        } else {  // 生产环境
          window.location.href = "/cecb/login/login.html";
        }
        return false;
    }
  }
}
</script>

<style>
  html,
  body {
    margin: 0;
    padding: 0;
    overflow-y: hidden;
  }
  #app {
    position: relative;
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    width: 100%;
    min-width: 900px;
    color: #000000;
  }
  #app::after {
    display: block;
    content: '';
    clear: both;
  }
  /*全局样式设置 */
  blockquote {
    display: block;
    border-left: 8px solid #d0e5f2;
    padding: 2px 10px;
    margin: 10px 0;
    line-height: 1.4;
    font-size: 100%;
    background-color: #f1f1f1;
  }
  pre {
    border: 1px solid #ccc;
    background-color: #f8f8f8;
    padding: 10px;
    margin: 5px 0px;
    font-size: 0.8em;
    border-radius: 3px;
  }
</style>
