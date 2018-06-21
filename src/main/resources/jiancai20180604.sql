/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/6/4 10:49:32                            */
/*==============================================================*/

drop table if exists login_info;

drop table if exists bank_card;

drop table if exists bid;

drop table if exists case_info;

drop table if exists demand;

drop table if exists demand_type;

drop table if exists evaluate;

drop table if exists charge_rule;

drop table if exists good;

drop table if exists message;

drop table if exists order_detail;

drop table if exists order_master;

drop table if exists project;

drop table if exists project_phase;

drop table if exists shop_register_info;

drop table if exists settled_second;

drop table if exists settled_first;

drop table if exists user_info;

drop table if exists sys_role_permission;

drop table if exists sys_role;

drop table if exists sys_permission;

drop table if exists role_info;

drop table if exists indentify;

drop table if exists consult;

drop table if exists consult_order;

drop table if exists favorite_goods;
/*==============================================================*/
/* Table: bank_card                                             */
/*==============================================================*/
CREATE TABLE `bank_card` (
  `bank_card_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid_shop` bigint(20) NOT NULL COMMENT '服务商/店铺uid',
  `name` varchar(20) NOT NULL COMMENT '持卡人姓名',
  `card_number` varchar(50) NOT NULL COMMENT '银行卡卡号',
  `tel` varchar(20)  NOT NULL COMMENT '电话号码',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '默认银行卡:1',
  PRIMARY KEY (`bank_card_id`), 
  KEY `uqe_uid_shop` (`uid_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `bank_card` comment '服务商/店铺银行卡表';


/*==============================================================*/
/* Table: bid                                                   */
/*==============================================================*/
CREATE TABLE `bid` (
  `bid_id` bigint(20) NOT NULL AUTO_INCREMENT,  
  `uid_shop` bigint(20) NOT NULL COMMENT '服务商/店铺id',
  `demand_type_id` int(11) NOT NULL COMMENT '需求类型',
  `offer` int(11) NOT NULL COMMENT '报价',
  `content` varchar(255) NOT NULL COMMENT '商家的话',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bid_status` int(11) NOT NULL DEFAULT '0' COMMENT '投标状态, 等待：0  成功：1 失败：2',
  PRIMARY KEY (`bid_id`), 
  KEY `uqe_uid_shop` (`uid_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `bid` comment '投标表';

/*==============================================================*/
/* Table: case_info       案例表                                     */
/*==============================================================*/
CREATE TABLE `case_info` (
  `case_id` bigint(20) NOT NULL AUTO_INCREMENT,  
  `uid_shop` bigint(20) NOT NULL COMMENT '服务商/店铺id',
  `community_name` varchar(255) NOT NULL COMMENT '小区名字',
  `area` int(11) NOT NULL COMMENT '面积',
  `style` int(11) NOT NULL COMMENT '案例风格',
  `content`  varchar(255) NOT NULL COMMENT '案例内容描述',
  `photo_list` varchar(255) NOT NULL COMMENT '图片url数组',
  PRIMARY KEY (`case_id`), 
  KEY `uqe_uid_shop` (`uid_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `case_info` comment '案例表';

/*==============================================================*/
/* Table: charge_rule       资费规则表                                                      */
/*==============================================================*/
CREATE TABLE `charge_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,  
  `despoit_cash` bigint(20) NOT NULL COMMENT '保证金最低应缴纳额度',
  `ratio` int(11) NOT NULL COMMENT '抽成费用（抽佣比例）',
  `settled_type` int(11) NOT NULL COMMENT '服务商入驻类型（个人/团队/公司+服务商/店铺）',
  `settled_fee` int(11) NOT NULL COMMENT '入驻费用缴纳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `charge_rule` comment '资费规则表';

/*==============================================================*/
/* Table: demand                                                */
/*==============================================================*/
CREATE TABLE `demand` (
  `demand_id` bigint(20) NOT NULL AUTO_INCREMENT,  
  `uid_user` bigint(20) NOT NULL COMMENT '用户id，在此指的是用户id',
  `demand_type_id` int(11) NOT NULL COMMENT '需求类型id',
  `title` varchar(255) NOT NULL COMMENT '需求标题',
  `photo_list` varchar(255) NOT NULL COMMENT '图片url数组',
  `content` varchar(255) NOT NULL COMMENT '需求内容描述',
  `bid_count` int(11) NOT NULL COMMENT '投标计数',
  `bid_id` bigint(20) NOT NULL COMMENT '中标id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  PRIMARY KEY (`demand_id`), 
  KEY `uqe_uid_userd` (`uid_user`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `demand` comment '需求表';

/*==============================================================*/
/* Table: demand_type                                           */
/*==============================================================*/
CREATE TABLE `demand_type` (
  `demand_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '需求类型id',
  `demand_type_description` varchar(255) NOT NULL COMMENT '需求类型描述',
  PRIMARY KEY (`demand_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `demand_type` comment '需求类型';

/*==============================================================*/
/* Table: evaluate                                              */
/*==============================================================*/
CREATE TABLE `evaluate` (
  `evaluate_id` bigint(20) NOT NULL AUTO_INCREMENT,  
  `uid_user` bigint(20) NOT NULL COMMENT '用户id，在此指的是服务商/店铺id',
  `uid_shop` bigint(20) NOT NULL COMMENT '用户id，在此指的是服务商/店铺id',
  `good_id` bigint(20) NOT NULL COMMENT '需求类型id',
  `content` varchar(255) NOT NULL COMMENT '需求标题',
  `score` int(11) NOT NULL COMMENT '投标计数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`evaluate_id`), 
  KEY `uqe_uid_user` (`uid_user`),
  KEY `uqe_uid_shop` (`uid_shop`),
  KEY `uqe_good_id` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `evaluate` comment '评价表';

/*==============================================================*/
/* Table: good                                                  */
/*==============================================================*/
create table `good`
(
   `good_id`              bigint(20) NOT NULL AUTO_INCREMENT,
   `uid_shop`              bigint(20) NOT NULL COMMENT '服务商/店铺uid',
   `good_name`            varchar(255) NOT NULL COMMENT '商品名称',
   `outside_price`        int(11) NOT NULL COMMENT '外部价格',
   `inside_price`         int(11) NOT NULL COMMENT '内部价格',
   `redline_price`        int(11) NOT NULL COMMENT '红线价格',
   `stock`                int(11) NOT NULL COMMENT '库存',
   `category`             int(11) NOT NULL COMMENT '分类',
   `argument`             varchar(255) NOT NULL COMMENT '商品参数',
   `description`          varchar(255) NOT NULL COMMENT '商品描述',
   `photo_list`           varchar(255) NOT NULL COMMENT '图片url数组',
   `up_down`              bit(1) NOT NULL COMMENT '上架/下架',
   `promotion_flag`       bit(1) NOT NULL COMMENT '促销标志',
   `orginal_price`        int(11) NOT NULL COMMENT '原价',
   `promotion_price`      int(11) NOT NULL COMMENT '促销价格',
   `group_flag`           bit(1) NOT NULL COMMENT '团购标志',
   `group_end_time`       timestamp NOT NULL COMMENT '团购结束时间',
   `group_target`         int(11) NOT NULL COMMENT '团购目标',
   `group_price`          int(11) NOT NULL COMMENT '团购价格',
   `status`               int(11) NOT NULL COMMENT '商品状态',
  PRIMARY KEY (`good_id`), 
  KEY `uqe_shop_id` (`uid_shop`),
  KEY `uqe_promotion_flag` (`promotion_flag`),
  KEY `uqe_group_flag` (`group_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `good` comment '商品表';

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table `message`
(
   `message_id`           bigint(20) NOT NULL AUTO_INCREMENT,
   `uid_user`             bigint(20) NOT NULL COMMENT 'uid_user',
   `title`                varchar(255) NOT NULL COMMENT '消息标题',
   `content`              varchar(255) NOT NULL COMMENT '消息内容',
   `create_time`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息创建时间',
   `status`               int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`message_id`), 
  KEY `uqe_uid_user` (`uid_user`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `message` comment '消息表';

/*==============================================================*/
/* Table: order_detail                                          */
/*==============================================================*/
create table `order_detail`
(
   `order_detail_id`      bigint(20) NOT NULL AUTO_INCREMENT,
   `order_id`             bigint(20) NOT NULL COMMENT '订单主表id',
   `good_id`              bigint(20) NOT NULL COMMENT '商品id',
   `uid_shop`             bigint(20) NOT NULL COMMENT '店铺id',
   `group_flag`           bit(1) NOT NULL COMMENT '团购、促销标志，有效为1，则需要判断过期时间',
   `good_num`             int(11) NOT NULL COMMENT '商品数量',
   `good_price`           int(11) NOT NULL COMMENT '商品价格',
   `good_name`            varchar(255) NOT NULL COMMENT '商品名字',
   `good_title`           varchar(255) NOT NULL COMMENT '商品标题',
   `create_time`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `overdue_time`         timestamp NOT NULL COMMENT '过期时间，主要针对团购、促销活动',
   `status`               tinyint(3) NOT NULL COMMENT '该订单详情状态',
  PRIMARY KEY (`order_detail_id`), 
  KEY `uqe_order_id` (`order_id`),
  KEY `uqe_good_id` (`good_id`),
  KEY `uqe_uid_shop` (`uid_shop`),
  KEY `uqe_overdue_time` (`overdue_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `order_detail` comment '订单详情表';


/*==============================================================*/
/* Table: order_master                                          */
/*==============================================================*/
create table `order_master`
(
   `order_id`             bigint(20) NOT NULL AUTO_INCREMENT,
   `uid_user`             bigint(20) NOT NULL COMMENT '购买用户id',
   `buyer_name`           varchar(255) NOT NULL COMMENT '下单名字',
   `buyer_address`        varchar(255) NOT NULL COMMENT '下单地址',
   `order_amount`         int(11) NOT NULL COMMENT '订单总额',
   `order_status_id`      tinyint(3) NOT NULL COMMENT '订单状态，已下单等待付款：1  成功付款：2 部分需要退款（团购过期等）：3  全部退款：4',
   `pay_status`           tinyint(3) NOT NULL COMMENT '支付状态',
   `create_time`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `update_time`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间时间',
  PRIMARY KEY (`order_id`), 
  KEY `uqe_uid_user` (`uid_user`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `order_master` comment '订单主表';

/*==============================================================*/
/* Table: project     需求对应一个项目                          */
/*==============================================================*/
create table `project`
(
   `project_id`           bigint(20) NOT NULL AUTO_INCREMENT,
   `project_phase_id`     int(11) NOT NULL COMMENT '项目阶段id',
   `content`              varchar(255) NOT NULL COMMENT '项目阶段内容',
   `photo_list`           varchar(255) NOT NULL COMMENT '图片url数组',
   `create_time`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `uid_shop`             bigint(20) NOT NULL COMMENT '服务商/店铺的uid',
   `uid_user`             bigint(20) NOT NULL COMMENT '用户id',
   `demand_id`       	  bigint(20) NOT NULL COMMENT '需求id',
  PRIMARY KEY (`project_id`), 
  KEY `uqe_uid_shop` (`uid_shop`),
  KEY `uqe_uid_user` (`uid_user`),
  KEY `uqe_demand_id` (`demand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `project` comment '项目表';

/*==============================================================*/
/* Table: project_phase                                         */
/*==============================================================*/
create table `project_phase`
(
   `project_phase_id`     int(11) NOT NULL AUTO_INCREMENT,
   `content`              varchar(255) NOT NULL COMMENT '项目阶段内容',
  PRIMARY KEY (`project_phase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `project_phase` comment '项目阶段表';

/*==============================================================*/
/* Table: shop_register_info                                    */
/*==============================================================*/
create table `shop_register_info`
(
   `shop_id`              bigint(20) NOT NULL AUTO_INCREMENT,
   `uid_shop`             bigint(20) NOT NULL COMMENT '服务商/店铺id',
   `settled_id`           int(11) NOT NULL COMMENT '入住类别二级分类id',
   `type`                 int(11) NOT NULL COMMENT '企业类型（个体、个人、公司）',
   `shop_name`            varchar(50) NOT NULL COMMENT '店铺名称',
   `style`                varchar(50) NOT NULL COMMENT '擅长风格',
   `create_time`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '成立/入行时间',
   `name1`                varchar(50) NOT NULL COMMENT '负责人1姓名（个人、团队、公司法人）',
   `id_card1`             varchar(50) NOT NULL COMMENT '负责人1身份证号',
   `name2`                varchar(50) NOT NULL COMMENT '负责人2姓名（团队、公司）',
   `id_card2`             varchar(50) NOT NULL COMMENT '负责人2身份证号',
   `register_office`      varchar(50) NOT NULL COMMENT '登记机关（公司）',
   `linkman`              varchar(50) NOT NULL COMMENT '联系人',
   `phone`                varchar(50) NOT NULL COMMENT '联系电话',
   `emergency_linkman`    varchar(50) NOT NULL COMMENT '紧急联系人',
   `emergency_phone`      varchar(50) NOT NULL COMMENT '紧急联系电话',
   `shop_address`         varchar(255) NOT NULL COMMENT '店铺地址',
   `id_card_url1`         varchar(255) NOT NULL COMMENT '负责人1身份证url',
   `id_card_url2`         varchar(255) NOT NULL COMMENT '负责人2身份证url（团队、法人）',
   `business_license_url` varchar(255) NOT NULL COMMENT '营业执照（公司）',
   `fix_phone`            varchar(50) NOT NULL COMMENT '座机电话（公司）',
   `shop_logo_url`        varchar(255) NOT NULL COMMENT '店铺logo',
   `volume`               int(11) NOT NULL COMMENT '月成交量',
   `total_score`          int(11) NOT NULL COMMENT '总和评分',
   `evaluate_nums`        int(11) NOT NULL COMMENT '评分数',
   `collect_nums`         int(11) NOT NULL COMMENT '店铺收藏数',
   `expiration_time`      timestamp  COMMENT '平台费到期时间',
   `deposit`              int(11) NOT NULL COMMENT '保证金缴纳金额',
   `main_categories`      int(11) NOT NULL COMMENT '主营类目',
   `settlement_amount`    int(11) NOT NULL COMMENT '结算金额',
   `register_amount`    int(11) NOT NULL COMMENT '注册资金',
   `shop_intro`        varchar(255) NOT NULL COMMENT '店铺简介',
  PRIMARY KEY (`shop_id`), 
  KEY `uqe_uid_shop` (`uid_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `shop_register_info` comment '服务商/店铺注册信息表';

/*==============================================================*/
/* Table: 入驻类别一级分类                                              */
/*==============================================================*/
create table `settled_first`
(
   `settled_first_id`     int(11) NOT NULL AUTO_INCREMENT,
   `content`          	  varchar(50) NOT NULL COMMENT '入驻类别一级分类描述',
  PRIMARY KEY (`settled_first_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `settled_first` comment '入驻类别一级分类';

/*==============================================================*/
/* Table: 入驻类别二级分类                                              */
/*==============================================================*/
create table `settled_second`
(
   `settled_second_id`    int(11) NOT NULL AUTO_INCREMENT,
   `content`              varchar(50) NOT NULL COMMENT '入驻类别二级分类描述',
   `settled_first_id`     int(11) NOT NULL COMMENT '所属的一级分类id',
  PRIMARY KEY (`settled_second_id`),
  KEY `uqe_settled_first_id` (`settled_first_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table `settled_second` comment '入驻类别二级分类';

/*==============================================================*/
/* Table: 客户基本信息表                                               */
/*==============================================================*/
create table `user_info`
(
   `id`		bigint(20) NOT NULL AUTO_INCREMENT,
   `uid`	bigint(20) NOT NULL COMMENT '用户id',
   `photo`  varchar(255) NOT NULL COMMENT '用户头像url',
   `identify` int(11)  NOT NULL  COMMENT '0表示没有实名认证 1 表示实名认证',
   `tel`    varchar(20) NOT NULL COMMENT '绑定电话',
   `name`   varchar(127) NOT NULL COMMENT '昵称 ',
   PRIMARY KEY (`id`), 
   UNIQUE KEY `uqe_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table user_info comment '客户基本信息表';

/*==============================================================*/
/* Table: login_info  用户登陆表                                */
/*==============================================================*/
CREATE TABLE `login_info` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) NOT NULL COMMENT '电话号码，不唯一，但是与role_id的组合唯一',
  `password` varchar(255) NOT NULL COMMENT '加密后的密码',
  `salt` varchar(255) NOT NULL COMMENT '密码盐',
  `role_id` int(11) NOT NULL COMMENT '角色id，主要包括 0:权限管理人员 1：用户 2：服务商/店铺',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '账号状态,正常：0  异常：1',
  PRIMARY KEY (`uid`), 
  UNIQUE KEY `uqe_tel_roleId` (`tel`, `role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table login_info comment '用户登陆表';

INSERT INTO `login_info` VALUES ('1', '17361016911', 'd3c59d25033dbf980d29554025c23a75', '8d78869f470951332959580424d4bf4f', '1', '2018-05-13 00:18:34', '0');
INSERT INTO `login_info` VALUES ('4', '17361016912', 'ca2294495e943d20a254ab4767f80f76', 'd53fd88649b9520587222e5f65183825', '1', '2018-05-13 00:19:21', '0');


-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id，主要包括 0:权限管理人员 1：用户 2：服务商/店铺',
  `permission_id` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`),
  KEY `key_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色-权限对应关系表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1', '1');
INSERT INTO `sys_role_permission` VALUES ('2', '2', '2');
INSERT INTO `sys_role_permission` VALUES ('3', '3', '1');
INSERT INTO `sys_role_permission` VALUES ('4', '3', '2');
INSERT INTO `sys_role_permission` VALUES ('5', '3', '3');


/*==============================================================*/
/* Table: sys_role  角色表                                      */
/*==============================================================*/
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL COMMENT '可用',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `role` varchar(255) DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='角色表：管理员权限、用户权限（买家权限、卖家权限）';

alter table `sys_role` comment '角色表：管理员权限、用户权限（买家权限、卖家权限）';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '', '用户', 'user');
INSERT INTO `sys_role` VALUES ('2', '', '服务商/店铺', 'shop');
INSERT INTO `sys_role` VALUES ('3', '', '管理员', 'admin');

/*==============================================================*/
/* Table: sys_permission   权限表                               */
/*==============================================================*/
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '', '用户权限', 'user');
INSERT INTO `sys_permission` VALUES ('2', '', '服务商/店铺权限', 'shop');
INSERT INTO `sys_permission` VALUES ('3', '', '管理员权限', 'admin');


/*==============================================================*/
/* Table: main_categories   主营类目表                               */
/*==============================================================*/
CREATE TABLE `main_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: 客户基本信息表                                               */
/*==============================================================*/
create table `user_info`
(
   `id`		bigint(20) NOT NULL AUTO_INCREMENT,
   `uid`	bigint(20) NOT NULL COMMENT '用户id',
   `photo`  varchar(255) NOT NULL COMMENT '用户头像url',
   `identify` int(11)  NOT NULL  COMMENT '0表示没有实名认证 1 表示实名认证',
   `tel`    varchar(20) NOT NULL COMMENT '绑定电话',
   `name`   varchar(127) NOT NULL COMMENT '昵称 ',
   PRIMARY KEY (`id`), 
   UNIQUE KEY `uqe_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table user_info comment '客户基本信息表';

/*==============================================================*/
/* Table: indentify     实名认证表                                        */
/*==============================================================*/
create table `indentify`
(
   `id`                int(11) NOT NULL AUTO_INCREMENT,
   `uid`               bigint(20) NOT NULL COMMENT '用户id',
   `id_num`               varchar(18) NOT NULL COMMENT '身份证号',
   `id_front`             varchar(255) NOT NULL COMMENT'身份证正面',
   `id_reverse`           varchar(255)NOT NULL COMMENT'身份证反面',
   `real_name`            varchar(128)NOT NULL COMMENT'真实姓名',
   primary key (id),
   UNIQUE KEY `uqe_uid` (`uid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table indentify comment '实名认证表';

/*==============================================================*/
/* Table: question  问题列表                                            */
/*==============================================================*/
create table `question`
(
   `question_id`          bigint(20) NOT NULL AUTO_INCREMENT,
   `uid`                  bigint(20) NOT NULL COMMENT '用户id',
   `question_title`       varchar(255)NOT NULL COMMENT '问题名',
   `question_content`     varchar(255)NOT NULL COMMENT '问题内容',
   `create_time`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `photo_list`           varchar(255) DEFAULT NULL COMMENT '图片url数组',
   primary key (question_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
alter table question comment '问题列表';

/*==============================================================*/
/* Table: answer   问题回答列表                                             */
/*==============================================================*/
create table `answer`
(
   `answer_id`            bigint(20) NOT NULL AUTO_INCREMENT,
   `question_id`          bigint(20) NOT NULL COMMENT'问题ID',
   `uid`                  bigint(20) NOT NULL COMMENT '用户id',
   `answer_content`       varchar(255) NOT NULL COMMENT '回答内容',
   `create_time`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `answer_num`           bigint(20) DEFAULT NULL COMMENT '回答数量',
   primary key (answer_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table answer comment '问题回答列表';

/*==============================================================*/
/* Table: consult  咨询表                                             */
/*==============================================================*/
create table `consult`
(
   `consult_id`           bigint(20) NOT NULL AUTO_INCREMENT,
   `tel`                  varchar(20) NOT NULL COMMENT'预留电话号码',
   `linkman`              varchar(20) NOT NULL COMMENT'联系人姓名',
   `uid`                  bigint(20) NOT NULL COMMENT'用户id',
   `consult_type_id`      int(11) NOT NULL COMMENT'咨询类型 0 免费 1 付费',
   `content`			  varchar(256) NOT NULL COMMENT'咨询内容',
   `create_time`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `amount`               int(11) COMMENT'付费金额',
   `is_finished`          int(11) DEFAULT NULL COMMENT'0表示没有处理 1表示处理',
   primary key (consult_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
alter table consult comment '咨询表';
/*==============================================================*/
/* Table: consult  咨询订单表                                           */
/*==============================================================*/
create table `consult_order`
(
   `order_id`             bigint(20) NOT NULL ,
   `create_time`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `uid`                  bigint(20) NOT NULL COMMENT'用户id',
   `order_type`           int(11) NOT NULL COMMENT'1 代7天，2代表1一个月',
   `pay_type`             int(11) DEFAULT NULL COMMENT'支付类型 1代表支付宝 2代表微信',
   `pay_money`             int(11) DEFAULT NULL COMMENT'支付金额单位为分',
   `end_time`             timestamp NOT NULL COMMENT '支付时间',
   primary key (order_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table consult_order comment '咨询订单表';
/*==============================================================*/
/* Table: favorite_goods   收藏商品                                */
/*==============================================================*/
create table `favorite_goods`
(
   `id`                   bigint(20) NOT NULL AUTO_INCREMENT,
   `uid`                  bigint(20) not null,
   `good_id`              bigint(20) not null,
   primary key (id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;;
alter table favorite_goods comment '收藏商品';