import Vue from 'vue'
import router from './router'
import Laboratory from './laboratory.vue'
import Record from '../../modules/record.js'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<Laboratory/>',
  components: { Laboratory }
})

Record.record();
