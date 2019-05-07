import Vue from 'vue'
import Router from 'vue-router'
import Home from "./components/tabber/home.vue"
import goodlist from "./components/list/goodlist.vue"
import list from "./components/list/list.vue"
import listcar from "./components/list/listcar.vue"
import jifen from "./components/list/jifen.vue"

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/',component:Home},
    {path:'/home',component:Home},
    {path:'/goodlist',component:goodlist},
    {path:'/listcar',component:listcar},
    {path:'/jifen',component:jifen},
    {path:'/list/:id',component:list ,props:true},
    
  ]
})
