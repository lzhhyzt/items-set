import Vue from 'vue'
import router from './router'
import Guide from './guide.vue'
import Record from '../../modules/record.js'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<Guide/>',
  components: { Guide }
})

Record.record();
