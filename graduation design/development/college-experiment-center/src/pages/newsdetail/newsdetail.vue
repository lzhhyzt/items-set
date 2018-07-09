<template>
  <div id="app">
    <top-bar/>
    <navigationbar/>
    <contains/>
    <bottom-bar/>
    <back-to-top/>
  </div>
</template>

<script>
import TopBar from '../../components/header'
import BottomBar from '../../components/footer'
import BackToTop from '../../components/backToTop'
import Navigationbar from '../../components/navigationbar'
import Contains from './contains'

export default {
  name: 'app',
  components: {
    TopBar,
    BottomBar,
    BackToTop,
    Navigationbar,
    Contains
  }
}

</script>

<style>
  html {
    margin: 0;
    padding: 0;
  }
  body {
    margin: 0;
    padding: 0;
    width: 100%;
    min-width: 1000px;
    height: 100%;
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }
  #app {
    height: auto;
    text-align: center;
    color: #000000;
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
  table {
    border-collapse: collapse;
    border: 1px solid #000000;
  }
  table td,
  table th {
    border: 1px solid #000000;
    padding: 3px 5px;
    min-width: 50px;
    height: 20px;
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
