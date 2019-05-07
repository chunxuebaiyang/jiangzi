SET NAMES UTF8;
DROP DATABASE IF EXISTS jz;
CREATE DATABASE jz CHARSET=UTF8;
USE jz;
-- 创建用户信息列表
CREATE TABLE jz_login(
  id   INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25),  -- 名字
  uid   VARCHAR(25),  -- 会员编号
  upwd  VARCHAR(32), -- 密码
  uimg  VARCHAR(32), -- 头像
  uip   INT,  -- 会员值
  umuch DECIMAL(10,2), -- 余额
  uphone varchar(20), -- 号码
  integral INT -- 积分
);
-- 创建购物车列表
CREATE TABLE jz_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  lname VARCHAR(25),
  price DECIMAL(10,2),
  count INT,
  uid   INT,
  lid int 
);
-- 添加购物
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排1',99,1,666666,1);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排2',120,1,666666,2);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排3',120,1,666666,3);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排4',120,1,666666,4);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排5',120,1,666666,5);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排6',120,1,666666,6);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排7',120,1,666666,7);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排8',120,1,666666,8);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排9',120,1,666666,9);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排10',88,1,555555,10);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排11',88,1,555555,11);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排12',88,1,555555,12);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排13',88,1,555555,13);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排14',88,1,555555,14);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排15',88,1,555555,15);
INSERT INTO jz_cart VALUES(null,'惠灵顿牛排16',88,1,555555,16);
-- 添加用户
INSERT INTO jz_login
 VALUES(null,'tom',666666,'123',"img/sc_index_case_r11_c2.jpg",500,300.22,12388888888,99999);
INSERT INTO jz_login
 VALUES(null,'juery',555555,'123',"img/sc_index_case_r11_c2.jpg",3000,300.22,12388888888,99999);
-- 创建商品列表
 CREATE TABLE jz_list(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255), -- 图片
  lname   VARCHAR(255), -- 名字
  lprice DECIMAL(10,2), -- 价格
  lnum  VARCHAR(255), -- 销量
  point   VARCHAR(2000), -- 商品介绍
  leo VARCHAR(25)  -- 商品类别
);

-- 创建收藏列表
 CREATE TABLE jz_like(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  ctime   DATETIME, -- 收藏时间
  id int,  -- 收藏物品
  uid VARCHAR(255) -- 收藏人会员名
);
-- 添加收藏商品
INSERT INTO jz_like
 VALUES(null,1555417646764,1,666666);
INSERT INTO jz_like
 VALUES(null,1555407646764,2,666666);
INSERT INTO jz_like
 VALUES(null,1555017646764,3,666666);
INSERT INTO jz_like
 VALUES(null,1550417646764,4,666666);
INSERT INTO jz_like
 VALUES(null,1555417046764,5,666666);
INSERT INTO jz_like
 VALUES(null,1555410646764,6,666666);
INSERT INTO jz_like
 VALUES(null,1555417646764,7,555555);
INSERT INTO jz_like
 VALUES(null,1555407646764,8,555555);
INSERT INTO jz_like
 VALUES(null,1555407646764,9,555555);
INSERT INTO jz_like
 VALUES(null,1555407646764,10,555555);
-- 添加商品
INSERT INTO jz_list
 VALUES(null,'shangnao.jpg',"惠灵顿牛排1",'132',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","1");
INSERT INTO jz_list
 VALUES(null,'shangnao.jpg',"惠灵顿牛排2",'90',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","1");
INSERT INTO jz_list
 VALUES(null,'shangnao.jpg',"惠灵顿牛排3",'90',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","1");
INSERT INTO jz_list
 VALUES(null,'shangnao.jpg',"惠灵顿牛排4",'200',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","1");
INSERT INTO jz_list
 VALUES(null,'shangnao.jpg',"惠灵顿牛排5",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","1");
INSERT INTO jz_list
 VALUES(null,'shangnao.jpg',"惠灵顿牛排6",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","1");
INSERT INTO jz_list
 VALUES(null,'shangnao.jpg',"惠灵顿牛排7",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","1");
INSERT INTO jz_list
 VALUES(null,'shangnao.jpg',"惠灵顿牛排8",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","1");
INSERT INTO jz_list
 VALUES(null,'shangnao.jpg',"惠灵顿牛排9",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","2");
INSERT INTO jz_list
 VALUES(null,'niupai.jpg',"惠灵顿牛排10",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","2");
INSERT INTO jz_list
 VALUES(null,'niupai.jpg',"惠灵顿牛排11",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","2");

INSERT INTO jz_list
 VALUES(null,'niupai.jpg',"惠灵顿牛排12",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","2");

INSERT INTO jz_list
 VALUES(null,'niupai.jpg',"惠灵顿牛排13",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","2");

INSERT INTO jz_list
 VALUES(null,'leigu.jpg',"惠灵顿牛排14",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","3");
INSERT INTO jz_list
 VALUES(null,'leigu.jpg',"惠灵顿牛排15",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","3");
INSERT INTO jz_list
 VALUES(null,'leigu.jpg',"惠灵顿牛排16",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","3");
INSERT INTO jz_list
 VALUES(null,'leigu.jpg',"惠灵顿牛排17",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","3");
INSERT INTO jz_list
 VALUES(null,'leigu.jpg',"惠灵顿牛排18",'102',2300,"1.限门店使用，不兑现，不找零，不可转赠。2.每餐限用1张，有效期30天，不与其他优惠同享3.限堂食，礼券折扣部分不积分，需与会员卡共同使用4.礼券最终解释权归本公司所有。门店地址素逸泰料理建和街店:长春市朝阳区建和街367号(吉隆坡酒店后侧与崇智胡同交汇处)电话: 0431-88965367","3");







