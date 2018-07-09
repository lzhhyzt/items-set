/**
 * 我们组装模块并导出 store 的地方
 */
import Vue from 'vue'
import Vuex from 'vuex'
import VuexPersistence from 'vuex-persist'
import state from './state'
import mutations from './mutations'
import actions from './actions'
import getters from './getters'

Vue.use(Vuex)

// vuex持久化实例对象
const vuexLocal = new VuexPersistence({
  storage: window.localStorage
})

const shareStore = {
  state: state,
  mutations: mutations,
  actions: actions,
  getters: getters,
  plugins: [vuexLocal.plugin]
}

const appStore = new Vuex.Store({
  strict: process.env.NODE_ENV !== 'production',
  modules: {
    shareStore
  }
})

export default appStore
