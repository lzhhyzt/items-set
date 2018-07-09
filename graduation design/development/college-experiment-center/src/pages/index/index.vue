<template>
  <div id="app">
    <top-bar/>
    <navigationbar/>
    <keep-alive>
      <contains/>
    </keep-alive>
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
body {
  position: relative;
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
  color: #2c3e50;
}
</style>
