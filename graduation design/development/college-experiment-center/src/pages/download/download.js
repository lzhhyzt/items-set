import Vue from 'vue'
import router from './router'
import Download from './download.vue'
import Record from '../../modules/record.js'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<Download/>',
  components: { Download }
})

Record.record();
