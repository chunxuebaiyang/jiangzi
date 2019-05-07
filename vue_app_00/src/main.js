import Vue from 'vue'
import App from './App.vue'
import router from './router'

import'mint-ui/lib/style.css'

Vue.config.productionTip = false
//5: 设置请求的根路径 
//Vue.http.options.root = "http://127.0.0.1/vue_ser/";
//6:全局设置post 时候表音的数据组织格式为 application/x-www-form-urlencoded
//Vue.http.options.emulateJSON = true;
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'
//引入axios库
import axios from "axios"
//配置跨域选项
axios.defaults.withCredentials=true
//配置进vue
Vue.prototype.axios=axios
//引入vuex
import vuex from "vuex";
//注册
Vue.use(vuex);
//创建
var store = new vuex.Store({
  state:{list:sessionStorage.getItem("cartcount")||0},
  mutations:{increment(state){
    state.cartcount++;
    sessionStorage.setItem("cartcount",state.cartcount)
  }},
  getters:{
    optCartCount:function(state){
      return state.cartcount
    }
  }
})
// import {Header,Button,Swipe,SwipeItem,Lazyload} from "mint-ui"
// //注册
// Vue.use(Lazyload)
// Vue.component(Swipe.name,Swipe)
// Vue.component(SwipeItem.name,SwipeItem)
// Vue.component(Header.name,Header)
// Vue.component("mt-button",Button)
import MintUI from "mint-ui"
Vue.use(MintUI)
new Vue({
  router,
  render: h => h(App),
  store  //将vuex的store绑定到vue实例中
}).$mount('#app')
