import Vue from 'vue'
import App from './index.vue'
import router from './router'
import Record from '../../modules/record.js'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})

// 调用浏览记录函数
Record.record();
