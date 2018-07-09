import Vue from 'vue'
import Detail from './newsdetail.vue'
import Record from '../../modules/record.js'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  template: '<Detail/>',
  components: { Detail }
})

Record.record();
