<template>
  <div id="app">
    <top-bar/>
    <contains/>
    <bottom-bar/>
    <back-to-top/>
  </div>
</template>

<script>
import TopBar from '../../components/header'
import BottomBar from '../../components/footer'
import BackToTop from '../../components/backToTop'
import Contains from './contains'

export default {
  name: 'app',
  components: {
    TopBar,
    BottomBar,
    BackToTop,
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
</style>
