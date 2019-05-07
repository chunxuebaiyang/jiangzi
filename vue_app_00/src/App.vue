<template>
 <div class="app-container">
    <router-view></router-view> 
 </div>
</template>
<script>
export default {
   data(){
      return {}
   },

}
</script>
<style>
*{
   touch-action: pan-y;
}
 .mui-bar-tab .mui-tab-item-tao.mui-active {
    color: #007aff;
 }
.mui-bar-tab .mui-tab-item-tao {
    display: table-cell;
    overflow: hidden;
    width: 1%;
    height: 50px;
    text-align: center;
    vertical-align: middle;
    white-space: nowrap;
    text-overflow: ellipsis;
    color: #929292;
}
.mui-bar-tab .mui-tab-item-tao .mui-icon {
    top: 3px;
    width: 24px;
    height: 24px;
    padding-top: 0;
    padding-bottom: 0;
}

.mui-bar-tab .mui-tab-item-tao .mui-icon~.mui-tab-label {
   font-size:11px;
   display:block;
   overflow:hidden;
   text-overflow:ellipsis;

}
.fl{
   float:left
}
ol, ul, li, dl, dt, dd { list-style: none; }
ul,li{
   margin:0;
   padding:0
}
i { font-style: normal; }
b { font-weight: normal; }

</style>
