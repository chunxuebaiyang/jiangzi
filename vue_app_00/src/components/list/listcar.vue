<template>
	<div class="app">
		<div class="mui-card">
			<div class="mui-card-header">全选
				<input @change="selectAll" type="checkbox" v-model="allcb"/>
			</div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					<ul class="mui-table-view">
                        <p v-if="kkong==0">您的购物车什么都没有</p>
						<li  v-for="(item,i) of list" class="mui-table-view-cell mui-media" :key="i">
							<a href="javascript:;">
								<img class="mui-media-object mui-pull-left" src="http://127.0.0.1:6060/img/niupai.jpg">
								<div class="mui-media-body">
									<p class='mui-ellipsis'>
										<input @click="removeItem"   :data-id="item.id" class="debutton" type="button" value="删除"/>
                                        <button class="debutton" @click="add" :data-add="i">+</button>
                                        <button class="debutton" >{{item.count}}</button>
                                        <button class="debutton" @click="sub" :data-sub="i">-</button>
										<input @click="changeitem" type="checkbox" v-model="item.cb" :data-i="i" />
										{{item.lname}}<br/>
										￥：{{item.price}}
									</p>
								</div>
							</a>
						</li>
					</ul>
                    
				</div>
			</div>
			<div class="mui-card-footer"><input type="button" @click="removeSelect" value="删除选中商品">￥：{{totals.toFixed(2)}}<input  class="debutton" type="button" value="立即购买"/></div>
		</div>
		<div style="height:70px"></div>
		<footers :active="active"></footers>
	</div>
</template>
<script>
import footers from "@/components/footer/footer.vue"
export default {
    components:{
        footers:footers
    },
    data(){
        return {
            list:[],  //保存购物列表
            allcb:false,//全选状态默认选中
            totals:0,
            active:3,
            kkong:0
        }
    },
    created(){
        this.loadMore()
    },
    methods: {
        selectAll(e){
            var cb=e.target.checked;
            for(var item of this.list){
                item.cb=cb
            }
            this.allcb = cb
            this.total()
        },
        changeitem(e){
            var cb=e.target.checked;
            this.list[e.target.dataset.i].cb=cb
            var count=0;
            for(var item of this.list){
                if(item.cb){
                    count++;
                }
            }
            if(count==this.list.length){
                this.allcb = true
            }else{
                this.allcb = false;
            }
            this.total()//调用总价函数
        },
        total(){
            this.totals=0;
            for(var i=0;i<this.list.length;i++){
                if(this.list[i].cb){
                    this.totals+=this.list[i].price
                }
            }
        },
        removeSelect(e){
            this.$messagebox.confirm("确认全部删除吗?").then(action=>{
                let ids="";
                for (var item of this.list){
                    if(item.cb){
                        ids +=item.id+","
                    }
                }
                if(ids.length==0){
                    this.$toast("请选择要删除的商品")
                    return;
                }
                ids=ids.substring(0,ids.length-1);
                this.axios.get(`http://127.0.0.1:6060/removeMItem?ids=${ids}`)
                .then(result=>{
                    if(result.data.code==1){
                        this.$toast("删除成功")
                        this.loadMore()
                    }else{
                        this.$toast("删除失败")
                    }
                })                
            }).catch(result=>{
            })
        },
        removeItem(e){
            this.$messagebox.confirm("确认删除吗?").then(action=>{
                var id=e.target.dataset.id
                this.axios.get(`http://127.0.0.1:6060/removeCartItem?id=${id}`)
                .then(result=>{
                    if(result.data.code==1){
                        this.$toast("删除成功")
                        this.loadMore()
                    }else{
                        this.$toast("删除失败")
                    }
                })                
            }).catch(result=>{
            })
        },
        loadMore(){        
            this.axios.get("http://127.0.0.1:6060/getcart?uid=666666")
            .then(result=>{              
                var rows=result.data.data; 
                if(rows){
                    this.kkong=1
                }
                for(var item of rows){
                    item.cb=false;
                }
                this.list=rows
                console.log(rows)
            })
        },
        sub(e){
            var i = e.target.dataset.sub
            if(this.list[i].count>1){
                this.list[i].count--
            }
        },
        add(e){
            var i = e.target.dataset.sub
            this.list[i].count++
        }
    }
}
</script>

<style scoped>
    .debutton{
        float:right
    }
</style>