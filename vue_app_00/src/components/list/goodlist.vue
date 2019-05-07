<template>
<div>
    <div class="wx_paixu">
        <span>
            <a href="javascript:;" :class="a==1?`on`:''" @click="changes" data-edo="1">上脑</a> 
            <a href="javascript:;" :class="a==2?`on`:''" @click="changes" data-edo="2">牛排</a>
            <a href="javascript:;" :class="a==3?`on`:''" @click="changes" data-edo="3">牛肋骨</a>
            <a href="javascript:;">上脑</a> 
            <a href="javascript:;">牛排</a> 
            <a href="javascript:;">牛肋骨</a>
            <a href="javascript:;">上脑</a> 
            <a href="javascript:;">牛排</a> 
            <a href="javascript:;">牛肋骨</a>
            <a href="javascript:;">上脑</a> 
            <a href="javascript:;">牛排</a> 
            <a href="javascript:;">牛肋骨</a>
        </span>
    </div>
    

        <!-- <div>
            <div class="goods-item" v-for="(zx,i) of list" :key="i">
                <img src="http://127.0.0.1:6060/982034.jpg" />
                <h4 v-text="zx.lname"></h4>
                <span v-text="zx.lprice"></span><i v-text="zx.lnum"></i>
            </div>
        </div> -->
    <ul class="cp_lb_jp fl">
        <li v-for="(lis,i) of list" :key="i">
            <router-link :to="lis.id">
                <div class="cp_lb_jp_img">
                    <img :src="lis.img_url">
                    <b>销量：{{lis.lnum}}</b>
                </div>
                <h1>{{lis.lname}}</h1>
                <h2>￥{{lis.lprice}}</h2>
                <h3>销量：{{lis.lnum}}</h3>
                <div class="clearfix"></div>
            </router-link>
        </li>
    </ul>
    <footers :active="active"></footers>
</div>
</template>
<script>
import footers from "@/components/footer/footer.vue"

export default {
    data(){
        return {
            list:[],
            img:0,
            edo:1,
            onclicks:true,
            a:1,
            active:2
        }
    },
    components:{
      footers:footers
    },
    created(){
        console.log(1)
        // 1.创建变量保存请求地址
        let url=`http://127.0.0.1:6060/getlist?leo=${this.edo}`;
        this.axios.get(url).then(result=>{
            this.list=result.data.data
            for(var i=0; i<this.list.length;i++){
                this.list[i].img_url=`http://127.0.0.1:6060/img/${this.list[i].img_url}`
                this.list[i].id=`/list/${this.list[i].id}`
            }
            // console.log(this.list)
        })  
    },
    methods: {
        changes(e){
            // console.log(e.target.dataset.edo)
            this.edo=e.target.dataset.edo
            let url=`http://127.0.0.1:6060/getlist?leo=${this.edo}`;
            this.axios.get(url).then(result=>{
                this.list=result.data.data
                for(var i=0; i<this.list.length;i++){
                    this.list[i].img_url=`http://127.0.0.1:6060/img/${this.list[i].img_url}`
                    // console.log(this.list[i].id)
                    this.list[i].id=`/list/${this.list[i].id}`
                    // console.log(this.list[i].id)
                }
                // console.log(this.list)
            })
            this.a=e.target.dataset.edo
        }
        
        // loadMore(){
        //     if(this.hasMore==false){
        //         this.$toast("没有更多数据了");
        //         return
        //     }
        //     let url=`http://127.0.0.1:6060/getGoodList?pno=${this.pno++}`;
        //     console.log(this.pno)
        //     this.axios.get(url).then(result=>{
        //         console.log(result)
        //         this.list=(this.list).concat(result.data.data)
        //         if(this.pno>result.data.pageCount){
        //             this.hasMore=false
        //         }
        //     })
        // }
    },
}
</script>
<style scoped> 
    .wx_paixu {
        width: 100%;
        overflow-x: scroll;
        overflow-y: hidden;
        padding-bottom: 1px;
        height: 35px;
        float: left;
        line-height: 35px;
        box-shadow: 0 2px 5px #6666661c;
        background-color: #fff;
        position: fixed;
    }
    .wx_paixu span {
        width: 200%;
        display: block;
    }
    .wx_paixu a {
        display: block;
        float: left;
        text-align: center;
        padding: 0% 2%;
        font-size: 0.8em;
    }
    .wx_paixu .on {
        color: #c29833;
        font-weight: bold;
    }
    .cp_lb_jp {
        width: 100%;
        margin-top: 35px;
        margin-bottom: 70px;
        font-family: "Microsoft YaHei", "微软雅黑", \5FAE\8F6F\96C5\9ED1;
    }
    .fl{
        float: left
    }
    .cp_lb_jp li {
        width: 46%;
        float: left;
        margin-top: 2%;
        border-width: 1px;
        height: 200px;
        background-color: rgb(241, 241, 241);
        border: 1px solid #eee;
        background: #fff;
        margin-left: 2.2%;
        overflow: hidden;
    }
    .cp_lb_jp li a {
        display: block;
    }
    .cp_lb_jp_img {
        width: 94%;
        height: 130px;
        overflow: hidden;
        margin: 0px auto;
        margin-top: 3%;
    }
    .cp_lb_jp_img img {
        width: 100%;
        height: 125px;
    }
    .cp_lb_jp li h1 {
        width: 94%;
        margin: 0 auto;
        font-size: 0.9em;
        text-align: justify;
        margin-top: 5px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
        line-height: 30px;
        height: 30px;
    }
    .cp_lb_jp li h2 {
        float: left;
        margin-left: 2%;
        color: #FF0000;
        font-size: 0.9em;
        line-height: 2em;
    }
    .cp_lb_jp li h3 {
        float: right;
        margin-left: 2%;
        color: #807676;
        font-size: 0.8em;
        line-height: 2em;
        margin-right: 1%;
    }

</style>