import Vue from 'vue'
import router from './router'
import Introduce from './introduce.vue'
import Record from '../../modules/record.js'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<Introduce/>',
  components: { Introduce }
})

Record.record();
