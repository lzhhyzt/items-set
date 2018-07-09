import Vue from 'vue'
import PCenter from './pcenter.vue'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  template: '<PCenter/>',
  components: { PCenter }
})
