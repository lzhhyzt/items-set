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
import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

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
  ul {
    list-style: none;
    padding: 0 8px;
  }
  ul li {
    padding: 5px 0;
  }
  #app {
    height: auto;
    text-align: center;
    color: #000000;
  }
</style>
