<template>
    <div class="footer">
        <nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item" :class="active==1?`mui-active`:''" @click="tolink1">
				<img  class="mui-icon" src="http://127.0.0.1:6060/img/sc_index_bottom_r1_c15.jpg">
				<span class="mui-tab-label">会员中心</span>
			</a>
			<a class="mui-tab-item" :class="active==2?`mui-active`:''"  @click="tolink2" >
				<img  class="mui-icon" src="http://127.0.0.1:6060/img/sc_index_bottom_r1_c1.jpg">
				<span class="mui-tab-label">购物商城</span>
			</a>            
			<a class="mui-tab-item" :class="active==3?`mui-active`:''"  @click="tolink3" >
				<img  class="mui-icon" src="http://127.0.0.1:6060/img/sc_index_bottom_r1_c6.jpg">
				<span class="mui-tab-label">购物车</span>
			</a>

			<a class="mui-tab-item" :class="active==4?`mui-active`:''"  @click="tolink4" >
				<img  class="mui-icon" src="http://127.0.0.1:6060/img/sc_index_bottom_r1_c16.jpg">
				<span class="mui-tab-label">积分商城</span>
			</a>
		</nav> 
    </div>
</template>
<script>
export default {
    props:["active"],
    data(){
        return {
            
        }
    },
    created() {
        
    },
    methods: {
        tolink1(){
            this.$router.push("/home");
        },
        tolink2(){
            this.$router.push("/goodlist")
        },
        tolink3(){
            this.$router.push("/listcar")
        },
        tolink4(){
            this.$router.push("/jifen")
        }
    },
}
</script>
<style scoped>
    .mui-bar>a>img{
        width:40%
    }
    .mui-bar.mui-bar-tab{
        background-color:#fff
    }
    .mui-bar-tab .mui-tab-item .mui-icon {
        width:44px;
        height:30px;
    }
</style>
