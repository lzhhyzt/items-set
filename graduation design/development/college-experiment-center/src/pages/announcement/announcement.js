import Vue from 'vue'
import router from './router'
import Announcement from './announcement.vue'
import Record from '../../modules/record.js'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<Announcement/>',
  components: { Announcement }
})

// 调用浏览记录函数
Record.record();
