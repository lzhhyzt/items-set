import Vue from 'vue'
import router from './router'
import News from './news.vue'
import Record from '../../modules/record.js'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<News/>',
  components: { News }
})

Record.record();
