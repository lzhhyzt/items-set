import Vue from 'vue'
import router from './router'
import Coursemanager from './coursemanager.vue'
import Record from '../../modules/record.js'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<Coursemanager/>',
  components: { Coursemanager }
})

Record.record();
