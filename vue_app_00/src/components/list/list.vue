<template>
    <div class="app-list">
        <header id="header" class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">惠灵顿牛排</h1>
		</header>
        <mt-swipe :auto="4000">
            <mt-swipe-item>
                <img src="http://127.0.0.1:6060/img/shangnaolun.jpg">
            </mt-swipe-item>
            <mt-swipe-item>
                <img src="http://127.0.0.1:6060/img/shangnaolun.jpg">
            </mt-swipe-item>
        </mt-swipe>
        <div class="mui-card">
            <div class="mui-card-header">{{list.lname}}<i style="font-size:10px">销量：{{list.lnum}}</i></div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    价格￥：{{lprice.toFixed(2)}}
                </div>
            </div>
            <div class="mui-card-footer">购买数量:
                <div class="fleft">
                    <button  type="button" @click="sub">-</button>
                    <input type="button" :value="count" />
                    <button  type="button" @click="add">+</button>
                </div>
            </div>
        </div>
        <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    {{list.point}}
                </div>
            </div>
        </div>
        <nav class="mui-bar mui-bar-tab" style="background-color:#fff">
			<a @click="list_home" class="mui-tab-item mui-active" >
				<img  class="mui-icon" src="http://127.0.0.1:6060/img/gouwuche2.png">
			</a>
			<a @click="list_like"  class="mui-tab-item" >
				<img  class="mui-icon" src="http://127.0.0.1:6060/img/wode2.png">
			</a>            
			<a class="mui-tab-item" href="#tabbar-with-chat">
				<button type="button" class="mui-btn" @click="addcart">
					加购物车
				</button>
			</a>

			<a class="mui-tab-item" href="#tabbar-with-map">
				<button type="button" class="mui-btn mui-btn-danger">
					立即购买
				</button>
			</a>
		</nav> 
    </div>
</template>
<script>
export default {
    // props:["id"],
    data(){
        return{
            list:[],
            lprice:0,
            count:1
        }
    },
    created(){
        console.log(this.$route.params.id)
        var aid=this.$route.params.id
        let url=`http://127.0.0.1:6060/getlistid?id=${aid}`;
        this.axios.get(url).then(result=>{
            this.list=result.data.data[0]
            this.lprice=this.list.lprice
            console.log(this.list)
        })  
    },
    methods: {
        list_home(){
            this.$router.push("/home")
        },
        list_like(){},
        addcart(){
            var uid = 666666
            var lname=this.list.lname;
            var price =this.list.lprice;
            var count=this.count;
            var lid = this.$route.params.id
            let url=`http://127.0.0.1:6060/addcart?uid=${uid}&lname=${lname}&price=${price}&count=${count}&lid=${lid}`;
                this.axios.get(url).then(result=>{
                console.log(result)
                this.$toast(result.data.msg)
            })
        },
        sub(){
            if(this.count>1){
                this.count--
            }
        },
        add(){
            this.count++
        }
    },
}
</script>
<style scoped>
    .app-list .mint-swipe{
        height:180px;
    }
    .app-list .mint-swipe img{
        width:100%;
        height:100%
    }
    .col_f1 p{
        font-size: 1em;
        padding: 1% 0;
        color: #575757;
        line-height: 30px;
        border-bottom: 1px solid #ededed;
        min-height: 30px;
        margin-bottom: 1em;
    }
    p{
        margin:0
    }
    .center {
        width: 100%;
        padding: 0 2%;
        font-size: 14px;
        line-height: 35px;
        background-color: #fff
    }
    .center h2{
        font-size:20px;
        border-bottom: 1px solid #ededed;
    }
    .mui-btn .mui-btn-danger{
        font-weight: 400;
        position: relative;
        z-index: 20;
        top: 0px;
        margin-top: 0;
        padding: 6px 10px 7px;
    }
    .mui-tab-item .mui-btn {
        top: 0px;
        padding: 6px 10px 7px;
    }
    .app-list .mint-swipe{
        margin-top:44px;
    }
    .fleft{
        float:right
    }
    
</style>
