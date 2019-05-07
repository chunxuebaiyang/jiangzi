<template>
  <div class="jifen">
    <!-- 轮播图 -->
    <mt-swipe :auto="4000">
      <mt-swipe-item>
        <img src="http://127.0.0.1:6060/img/jifen.jpg">
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="http://127.0.0.1:6060/img/jifen.jpg">
      </mt-swipe-item>
    </mt-swipe>
    <b class="ip">
      <a>积分:{{ip}}</a>
    </b>
    <!-- 积分列表 -->
    <div class="mui-card-content">
				<div class="mui-card-content-inner">
					<ul class="mui-table-view">
						<li v-for="(item,i) of list"  class="mui-table-view-cell mui-media" :key="i">
							<a href="javascript:;">
                <div class="fright">
                  <p>价值{{item.price}}元</p>
                  <button style="color:#D3B668;font-size:1.1em" @click="exchange" :data-i=i>立即兑换</button>
                </div>                
								<img class="mui-media-object mui-pull-left" src="http://127.0.0.1:6060/img/1111.jpg">
								<div class="mui-media-body">
									<p class='mui-ellipsis' style="color:#D3B668;font-size:1.2em">{{item.name}}一份</p>
                  <p>{{item.ip}}积分</p>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
      <div style="height:50px"></div>
    <footers :active="active"></footers>
  </div>
</template>
<script>
import footers from "@/components/footer/footer.vue"

export default {
    data(){
        return {
            list:[],
            ip:0,
            active:4
        }
    },
    created() {
      this.tojifen()
    },
    methods: {
      exchange(e){
        this.$messagebox.confirm(`确认兑换一份${this.list[e.target.dataset.i].name}吗?`).then(action=>{
          this.$toast("兑换成功")
          this.ip -= this.list[e.target.dataset.i].ip
        }).catch(result=>{})
      },
      tojifen(){//请求积分表和用户积分
        this.axios.get("http://127.0.0.1:6060/jifenlist")
          .then(result=>{
            this.list=result.data.data
            console.log(this.list)
          })
        this.axios.get("http://127.0.0.1:6060/logindel")
          .then(result=>{
            this.ip=result.data.data[0].integral
          })
      },

    },
    components:{
      footers:footers
    }
}
</script>
<style scoped>
  .mint-swipe{
    height: 240px;
  }
  .mint-swipe img{
    width:100%;
    height:240px
  }
  .mui-table-view-cell{
    background-color:#FEFBF2;
    border-radius: 0.5em
  }
  .mui-card-content img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      height:3.5em;
      border-radius: 5%;
      max-width: 50px;
  }
  .fright{
    float: right;
    text-align:center
  }
  .jifen .ip{
    float: right;
    width: 100px;
    border-radius: 5em 0 0 5em;
    line-height: 30px;
    text-align: center;
    position: absolute;
    top: 5%;
    right: 0px;
    background-color: #D9B96C;
    color: #fff;
    display: block;
    font-size: 0.9em;
  }
  .jifen .ip a{
    color: #fff;
    font-size: 0.9em
  }
</style>