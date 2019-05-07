<!--src/componets/exam01.vue-->
<!--创建模板-->
<template>
    <div class="app-home">
        <!--顶部-->
        <div class="huiyuan" style=" background: -prefix-linear-zgradient(to bottom, #000000, #736a6a, #525252); background: linear-gradient(to bottom, #000000, #736a6a, #525252); ">
            <div class="huiyuan_tou fl"><img :src="list.uimg"></div>
            <span class="huiyuan_top">
                <i>{{associator}}</i>
                <b>NO：{{list.uid}}</b>
                <span>
                <div class="waic progress">
                    <div class="yixif" style="padding-left: 36px; padding-right: 36px;">
                        <span class="yixiaof" :style="{left: uip+'%'}">{{unum}}</span>
                        <br>
                        <img src="http://127.0.0.1:6060/img/position.png" class="dingwei" :style="{left: uip+'%'}">
                    </div>
                    <div class="xianpa" style="padding-left: 36px; padding-right: 36px;">
                        <div class="hengxian">
                            <div class="hongxian" :style="{width: uip+'%'}"></div>
                        </div>
                    </div>
                    <div class="flexbox djwai">
                        <div class="yifen dengji">
                            <img src="http://127.0.0.1:6060/img/juyuandian.png">
                            <div class="jucol">活力会员</div>
                        </div>
                        <div class="yifen dengji">
                            <img src="http://127.0.0.1:6060/img/juyuandian.png">
                            <div class="jucol">黄金会员</div>
                        </div>
                        <div class="yifen dengji gray">
                            <img src="http://127.0.0.1:6060/img/juyuandian.png">
                            <div class="jucol">铂金会员</div>
                        </div>
                        <div class="yifen dengji gray">
                            <img src="http://127.0.0.1:6060/img/juyuandian.png">
                            <div class="jucol">钻石会员</div>
                        </div>
                        <div class="yifen dengji gray">
                            <img src="http://127.0.0.1:6060/img/juyuandian.png">
                            <div class="jucol">至尊会员</div>
                        </div>
                    </div>
                </div>
            </span>
            <p> 
                <i class="fl">
                    <span class="huiyuan_shengji">升级</span>
                    <a href="chongzhi.html">{{up}}</a>
                </i> 
            </p>
        </span> 
    </div>
        <div class="fenge"></div>
        <div class="menus">
            <ul>
                <li>
                    <a>
                        <img src="http://127.0.0.1:6060/img/ico10.png"/>
                        <span>等级权益</span>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="http://127.0.0.1:6060/img/ico11.png"/>
                        <span>积分余额</span>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="http://127.0.0.1:6060/img/ico12.png"/>
                        <span>关于我们</span>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="http://127.0.0.1:6060/img/ico12.2.png"/>
                        <span>会员礼卷包</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="fenge"></div>
        <ul class="mui-table-view mui-grid-view mui-grid-9">
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img  src= "http://127.0.0.1:6060/img/ico1.png">
                    <div class="mui-media-body">签到有礼</div></a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="GoodList">
                    <img  src= "http://127.0.0.1:6060/img/ico2.png">
                    <div class="mui-media-body">积分商城</div></router-link></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img  src= "http://127.0.0.1:6060/img/ico3.png">
                    <div class="mui-media-body">热门精选</div></a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img  src= "http://127.0.0.1:6060/img/ico4.png">
                    <div class="mui-media-body">今日推荐</div></a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img  src= "http://127.0.0.1:6060/img/ico5.png">
                    <div class="mui-media-body">我的收藏</div></a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img  src= "http://127.0.0.1:6060/img/ico6.png">
                    <div class="mui-media-body">在线充值</div></a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img  src= "http://127.0.0.1:6060/img/ico7.png">
                    <div class="mui-media-body">我的订单</div></a></li>
        </ul>
        <div class="fenge"></div>
        <mt-swipe :auto="4000">
            <mt-swipe-item>
                <img src="http://127.0.0.1:6060/img/lunbo1.jpg">
            </mt-swipe-item>
            <mt-swipe-item>
                <img src="http://127.0.0.1:6060/img/lunbo1.jpg">
            </mt-swipe-item>
        </mt-swipe>
        <footers :active="active"></footers>
    </div>
    
</template>
<!--添加script-->
<script>
import footers from "@/components/footer/footer.vue"

export default {
    data(){
        return {
            list:[{uip:0}],
            associator:"会员",
            unum:0,
            nnum:0,
            uip:0,
            left:0,
            associators:"",
            up:"",
            active:1
        }
    },
    created() {
        this.loadMore()
    },
    methods: {
        loadMore(){        
            // console.log(1)
            this.axios.get("http://127.0.0.1:6060/logindel")
            .then(result=>{
                // console.log(result)
                this.list=result.data.data[0];
                this.list.uip
                this.associator=this.list.uip<1000?"活力会员":this.list.uip<2000?"黄金会员":this.list.uip<3000?"铂金会员":this.list.uip<4000?"钻石会员":"至尊会员";
                var uipup=this.list.uip+1000;
                this.associators=uipup<1000?"活力会员":uipup<2000?"黄金会员":uipup<3000?"铂金会员":uipup<4000?"钻石会员":"至尊会员";
                if(this.list.uip>=4000){
                    this.up="你已经达到最高会员!"
                }else{
                    var a=this.list.uip
                    while(a>1000){
                        a=a-1000
                    }
                    this.up=`再获取${a}成长值达到${this.associators}`
                }
                var atime= setInterval(() => {
                    var anum=this.list.uip/60
                    // console.log(anum)
                    this.unum=parseInt(this.unum+anum)
                    if(this.unum>this.list.uip){
                        this.unum=this.list.uip
                        clearInterval(atime)
                    }
                }, 50);

                this.uip=this.list.uip/40>100?100:this.list.uip/40
                this.uip
                this.list.uimg="http://127.0.0.1:6060/"+this.list.uimg


            })
        }
    },
    components:{
      footers:footers
    }
}
</script>
<!--添加样式-->
<style scoped>
    .app-home{
        padding-bottom:50px;
        overflow-x:hidden;
    }
    .app-home .mint-swipe{
        height:150px;
    }
    .app-home .mint-swipe img{
        width:100%;
        height:100%
    }
    .mui-table-view-cell img{
        width:60px;
        height:60px;   
    }
    .app-home ul.mui-grid-9{
        background-color:#fff;
    }
    .app-home .mui-table-view{
        clear:both
    }
    .fenge{
        width: 100%;
        height: 8px;
        background: #ededed;
        clear:both
    }
    .menus{
        display:flex;
        width: 100%;
        margin: 0 auto;
        padding-top: 5%;
        background: #fff;
    }
    .menus ul{
        width:100%
    }
    .menus ul li {
        width: 25%;
        float: left;
        text-align: center;
    }
    .menus ul li a {
        display: block;
    }
    .menus ul li img {
        width: 35%;
        display: block;
        margin: 0 auto;
    }
    .menus ul li a span {
        color: #000000;
        font-size: 0.95rem;
        line-height: 2rem;
    }
    .mui-table-view li img{
        width:27px;
        height:27px;
    }

    .huiyuan {
        width: 100%;
        margin-left: 0%;
        float: left;
        border-radius: .5em;
        padding: 2% 2%;
        background-position: center center;
        background-repeat: no-repeat;
        background-size: 110%;
    }
    .huiyuan_tou {
        width: 17%;
        margin-left: 42%;
        border-radius: 50%;
        margin-top: 0%;
        height: 0px;
        padding-bottom: 17%;
        position: relative;
        overflow: hidden;
    }
    .huiyuan_tou img {
        width: 100%;
        height: 100%;
        position: absolute;
    }
    .huiyuan .huiyuan_top {
        float: left;
        margin-top: -8%;
        width: 100%;
        display: block;
        background-color: #000;
        border-radius: .5em;
        background-position: center center;
        background-repeat: no-repeat;
        background-size: 100%;
        background-image: url(http://127.0.0.1:6060/img/1111.jpg);
        padding-top: 10%;
        text-shadow: 0px 0px 1px #9B7A45;
    }
    .huiyuan i {
        float: left;
        width: 100%;
        color: #FFF;
        line-height: 2em;
        text-align: center;
        font-weight: 600;
    }
    .huiyuan b {
        float: left;
        width: 100%;
        text-align: left;
        color: #FFF;
        line-height: 2em;
        font-size: 0.9em;
        text-align: center;
    }
    .yixiaof {
        color: #fff;
        display: inline-block;
        line-height: 18px;
        font-size: 12px;
        position: relative;
        -webkit-transform: translateX(-50%);
        -moz-transform: translateX(-50%);
        -ms-transform: translateX(-50%);
        transform: translateX(-50%);
        top: 12.5px;
        left:0;
        transition: all 3s;
    }
    .dingwei {
        width: 45px;
        position: relative;
        top: -5px;
        left:0;
        -webkit-transform: translateX(-50%);
        -moz-transform: translateX(-50%);
        -ms-transform: translateX(-50%);
        transform: translateX(-50%);
        transition: all 3s;
    }
    .hengxian {
        width: 100%;
        height: 1.5px;
        background-color: #a0a0a0;
        transition: all 3s;
        left:0;

    }
    .hongxian {
        width: 0;
        height: 1.5px;
        background-color: #684713;
        transition: all 3s;
    }
    .djwai {
        position: relative;
        top: -8px;
    }
    .flexbox {
        display: flex;
    }
    .dengji {
        text-align: center;
        font-size: 13px;
        line-height: 20px;
        float: left;
    }
    .yifen {
        -webkit-box-flex: 1;
        -moz-box-flex: 1;
        width: 20%;
        -webkit-flex: 1;
        -ms-flex: 1;
        flex: 1;
    }
    .dengji img {
        width: 16px;
    }
    .jucol {
        color: #fff;
    }
    .huiyuan p {
        color: #FFF;
        line-height: 2em;
        float: left;
        width: 100%;
        padding-bottom: 2%;
    }
    .huiyuan p i {
        width: 94%;
        text-align: left;
        color: #9B7B48;
        border-radius: 5em;
        margin-left: 3%;
    }
    .huiyuan .huiyuan_shengji {
        width: 40px;
        margin-right: 1%;
        background: -prefix-linear-zgradient(top, #FC544B, #ff655b, #fb8a7c);
        background: linear-gradient(to right, #e3b652, #F0D069, #F7DC8B);
        display: block;
        float: left;
        margin-left: 5%;
        border-radius: 0.5em;
        line-height: 1.8em;
        text-align: center;
        margin-top: 0%;
    }
    .huiyuan i a {
        color: #4b3b21;
    }
</style>