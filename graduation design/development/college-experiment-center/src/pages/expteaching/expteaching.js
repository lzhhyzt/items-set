import Vue from 'vue'
import router from './router'
import Expteaching from './expteaching.vue'
import Record from '../../modules/record.js'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<Expteaching/>',
  components: { Expteaching }
})

Record.record();
