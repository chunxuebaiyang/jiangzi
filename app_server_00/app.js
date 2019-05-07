//app_server_00/app.js
//0:下载mysql express模块
//1:引入二个模块 mysql express
const mysql = require("mysql");
const express = require("express");
//2.1引入跨域模块
const cors = require("cors")
//2.2配置允许列表  配置在服务器后
//2:创建连接池 很大提高效率方法
var pool = mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    password:"",
    database:"jz"
});
//3:创建express对象
var server = express();
server.use(cors({
  origin:["http://127.0.0.1:6066","http://localhost:6066"],
  credentials:true
}))
//4:为express对象绑定监听端口 3000
server.listen(6060);
console.log("端口"+6060)
//所有图片放在服务器端
//http://127.0.0.1:6060/982034.jpg
server.use(express.static("public"))

//功能一:用户登录
//1:用户get 请求路径/login
server.get("/login",(req,res)=>{
  console.log(req.query.uname)
  console.log(req.query.upwd)
  //2:获取二个参数 uname upwd
  var u = req.query.uname;
  var p = req.query.upwd;
  //3:创建sql
  var sql = "SELECT id FROM jz_login";
  sql+=" WHERE uname = ? AND upwd = ?";
  //4:执行sql
  pool.query(sql,[u,p],(err,result)=>{
      if(err)throw err;
      //5:获取数据库返回结果
      //6:返回客户数据
      console.log(result)
      if(result.length==0){
        res.send({code:-1,data:result});
      }else{
        res.send({code:1,data:result});
      }
  })
});
server.get("/logindel",(req,res)=>{

  var sql = "SELECT id,uname,uid,upwd,uimg,uip,umuch,uphone,integral FROM jz_login";
  sql+=" WHERE uid = 666666";
  //4:执行sql
  pool.query(sql,(err,result)=>{
      if(err)throw err;
      //5:获取数据库返回结果
      //6:返回客户数据
      console.log(result)
      if(result.length==0){
        res.send({code:-1,data:result});
      }else{
        res.send({code:1,data:result});
      }
  })
});
//商品列表--2
server.get("/getlist",(req,res)=>{
  var a=req.query.leo
  var sql = "SELECT id,img_url,lname,lprice,lnum FROM jz_list";
  sql+=` WHERE leo = ${a}`;
  //4:执行sql
  pool.query(sql,(err,result)=>{
      if(err)throw err;
      //5:获取数据库返回结果
      //6:返回客户数据
      console.log(result)
      if(result.length==0){
        res.send({code:-1,data:result});
      }else{
        res.send({code:1,data:result});
      }
  })
});

server.get("/getGoodList",(req,res)=>{
  //1:获取二个参数,只要分页功能
  //  pno      页码
  //  pageSize 页大小
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  //1.1:为参数设置默认值
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
   pageSize = 6;
  }
  //1.1:创建变量保存发送给客户端数据
  var obj = {code:1};
  //1.2:创建变量保存进度
  var progress = 0;

  //2:创建一条sql语句
  var sql =" SELECT lid,lname,price";
      sql+=" FROM jz_list";
      sql+=" LIMIT ?,?";
  //2.1:创建一个变量offset 起始行数
  var offset = (pno-1)*pageSize; 
  //2.2:创建一个变量ps     一页数据
  var ps = parseInt(pageSize);
  //3:执行sql语句
  pool.query(sql,[offset,ps],(err,result)=>{
    if(err)throw err;
    // progress+=50;
    obj.data = result;
    //4:获取数据库返回结果
    //5:发送数据+不再发送数据
    //res.send({code:1,data:result});
    // if(progress==100){
     res.send(obj);
    // }
  })
  //6:计算总页数
  //6.1:创建sql查询总记录数
  // var sql =" SELECT count(lid) AS c FROM";
  //     sql+=" jz_list";
  // pool.query(sql,(err,result)=>{
  //   if(err)throw err;
  //   progress+=50;
  //   var pc = Math.ceil(result[0].c/pageSize);
  //   console.log(pc)
  //   obj.pageCount = pc;
  //   if(progress==100){
  //     res.send(obj)
  //   }
  // });    
  //6.2:计算总页数
});

//功能三:学子商城首页轮播图
//1:将轮播保存服务器端 
//   public/img/banner1.png
//2:接收客户端发送请求 /imglist
server.get("/imglist",(req,res)=>{
  //3:创建数据发送客户端
  var rows = [
    {id:1,img_url:"http://127.0.0.1:6066/img/banner1.png"},
    {id:2,img_url:"http://127.0.0.1:6066/img/banner2.png"},
    {id:3,img_url:"http://127.0.0.1:6066/img/banner3.png"},
    {id:4,img_url:"http://127.0.0.1:6066/img/banner4.png"},
];
     res.send({code:1,data:rows})
})


server.get("/getlistid",(req,res)=>{
  var a=req.query.id
  var sql = "SELECT id,img_url,lname,lprice,lnum,point FROM jz_list";
  sql+=` WHERE id = ${a}`;
  //4:执行sql
  pool.query(sql,(err,result)=>{
      if(err)throw err;
      //5:获取数据库返回结果
      //6:返回客户数据
      console.log(result)
      if(result.length==0){
        res.send({code:-1,data:result});
      }else{
        res.send({code:1,data:result});
      }
  })
});
// 启动 app.js
// 测试 

//查询购物车
server.get("/getcart",(req,res)=>{
  var uid = req.query.uid;
  console.log(uid)
  var sql="select id,lname,price,count from jz_cart where uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
})
//功能六:删除购物车指定商品信息 172~188

server.get("/removeCartItem",(req,res)=>{
  //1:参数
  var id = req.query.id;
  //2:sql
  var sql = "DELETE FROM jz_cart WHERE id=?";
  pool.query(sql,[id],(err,result)=>{
     if(err)throw err;
     if(result.affectedRows==0){
       res.send({code:-1,msg:"删除失败"});
     }else{
       res.send({code:1,msg:"删除成功"});
     }
  });
  //3:json
});

//功能十二:删除购物车中多个指定商品
server.get("/removeMItem",(req,res)=>{
  //1:参数 ids  3,4 9:35
  var ids = req.query.ids;
  //2:sql DELETE
  var sql =" DELETE FROM jz_cart ";
      sql+=" WHERE id IN ("+ids+")";
  //http://127.0.0.1:3000/removeMItem?ids=3,8
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.affectedRows > 0){
      res.send({code:1,msg:"删除成功"})
    }else{
      res.send({code:-1,msg:"删除失败"}) 
    }
  })
  //4:请求地址格式
});

//积分列表
server.get("/jifenlist",(req,res)=>{
  //3:创建数据发送客户端
  var rows = [
    {id:1,name:"澳洲牛肋骨1",ip:801,price:80},
    {id:2,name:"澳洲牛肋骨2",ip:802,price:81},
    {id:3,name:"澳洲牛肋骨3",ip:803,price:83},
    {id:4,name:"澳洲牛肋骨4",ip:804,price:79},
    {id:5,name:"澳洲牛肋骨5",ip:805,price:90},
  ];
  res.send({code:1,data:rows})
})

//添加到购物车
server.get("/addcart",(req,res)=>{
//0:判断用户是否登录
//1:参数 lid count uid price
  var uid = req.query.uid;
  var lid = req.query.lid
  var lname=req.query.lname;
  var price =req.query.price;
  var count=req.query.count;
  console.log(uid,lid,lname,price,count);
  var sql = ` INSERT INTO jz_cart VALUES(null,'${lname}','${price}',${count},${uid},${lid})`;
  console.log(sql),
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.affectedRows > 0){
      res.send({code:1,msg:"添加成功"});
    }else{
      res.send({code:-1,msg:"添加失败"});
    }
  })
})