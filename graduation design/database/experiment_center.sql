/*
SQLyog  v12.2.6 (64 bit)
MySQL - 10.1.19-MariaDB : Database - experiment_center
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`experiment_center` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `experiment_center`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`password`,`type`) values 
(1,'root','root',1),
(2,'lily','123456',2),
(3,'micky','123456',2),
(4,'opop','123456',2),
(5,'karbei','123456',2),
(6,'mmlo','123456',2);

/*Table structure for table `admindetail` */

DROP TABLE IF EXISTS `admindetail`;

CREATE TABLE `admindetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` int(11) NOT NULL COMMENT '昵称',
  `sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `autograph` varchar(200) DEFAULT NULL COMMENT '签名',
  PRIMARY KEY (`id`),
  KEY `user_detail` (`userId`),
  CONSTRAINT `user_detail` FOREIGN KEY (`userId`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `admindetail` */

insert  into `admindetail`(`id`,`userId`,`sex`,`age`,`phone`,`email`,`address`,`autograph`) values 
(1,1,'男',23,'15623548562','66615loks@163.com','广东广州市番禺区番禺大道163号','这人很懒，什么都没有留下'),
(2,2,'女',22,'18812125362','opsd52@163.com','四川成都','舞动青春，踏步向前'),
(3,3,'男',30,'15666254858','2525sd@163.com','北京朝阳区163号','这人很懒，什么都没有留下'),
(4,4,'男',25,'15625454575','123585242@qq.com','广东潮汕地区','来来去去，走走停停'),
(5,5,'女',23,'18852625254','fki1234@163.com','广东广州市天河区员村二横路12号','过了一年又大了一岁，过得真快'),
(6,6,'男',32,'13620156250','636363@qq.com','浙江杭州市','西湖的美！');

/*Table structure for table `announcement` */

DROP TABLE IF EXISTS `announcement`;

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(100) DEFAULT NULL COMMENT '公告标题',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `date` date DEFAULT NULL COMMENT '发布时间',
  `contents` text COMMENT '公告内容',
  `state` int(11) DEFAULT NULL COMMENT '发布状态',
  `visits` int(11) DEFAULT NULL COMMENT '访问次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `announcement` */

insert  into `announcement`(`id`,`title`,`author`,`date`,`contents`,`state`,`visits`) values 
(1,'T301室投影仪故障停用公告','外观','2018-02-13','<p>因使用时间过久，位于T栋实验楼的<b>T301</b>室的教学投影仪出现了故障，已停止使用，等到维修人员修理好了再通知使用，部分老师教学需要使用到投影仪的请更换实验室，谢谢合作！！！<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ac/smilea_thumb.gif\"></p><p><br></p>',1,6),
(2,'关于客服工作，客服功能的通告','欧赔','2018-02-12','<div>\n  <span>客服工作</span>\n  <p>客服人员</p>\n</div>',2,12),
(4,'实验室设备管理规范公告','河流','2018-02-04','<p>实验室使用规范更新一下，有以下几点：</p><p>1、实验室是进行测试工作的场所，必须保持清洁、整齐、安静。</p><p>2、实验室内严禁随地吐痰、吸烟和用餐。</p><p>3、禁止将与工作无关的物品带入实验室内，冰箱内不得存放非检测物品。有毒物品要有专人管理，</p><p>4、实验室内不得进行与本职工作无关的一切活动。</p><p>5、非本中心人员，未经同意，不得进入中心工作区域。</p><p>6、非开放实验室使用除了上课使用之外，其他活动使用需要向实验中心处申请，经批准才可以使用。</p><p></p><p>7、各实验室严禁私自配钥匙，确因工作需要时由中心统一配制，如有遗失应及时向中心办公室报失。</p><p>如违反上述纪律规范，会被记录在案，多次触犯，会被记过</p><p><a href=\"http://p40so5pwi.bkt.clouddn.com/实验室基本行为守则.doc\" target=\"_blank\">实验室行为规范.doc</a><br></p><p><br></p>',1,13),
(6,'关于实验室预订的基本流程','何以笙箫默','2018-02-04','<p>这是一个自学院依赖从来没过的事啊，快来看啊，小花猫打了大黄啊</p>',1,5),
(7,'S305，T504室重新开放使用通知','何以笙箫默','2018-02-04','<p>这是一个自学院依赖从来没过的事啊，快来看啊，小花猫打了大黄啊</p>',1,4),
(8,'关于XXX在实验室违反了规范的处罚通告','何以笙箫默','2018-02-04','<p>这是一个自学院依赖从来没过的事啊，快来看啊，小花猫打了大黄啊</p>',1,810),
(11,'本系统2月4号更新通告','何以笙箫默','2018-02-04','<p>今天凌晨2:30-3:10本系统进行更新，届时关闭系统的使用，请需要使用的用户提前或者延后登录系统！！！谢谢合作！<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/81/rabbit_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ac/smilea_thumb.gif\"></p><p><br></p>',1,4),
(12,'T403，T405室电脑设备维修更新通知','何以笙箫默','2018-02-04','<p>由于<u><b>T403</b></u>和<u><b>T405</b></u>室的电脑设备使用年限有很久了，里面的设备年久失修，经过上级批准，准备对这两个室的电脑设备进行维修，各位老师，如需使用或者已预订的请及时更改其他实验室，请见谅<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0b/tootha_thumb.gif\"></p><p><br></p>',1,2),
(13,'近一个月的各个实验室使用情况通知','何以笙箫默','2018-02-03','<p>这是一个自学院依赖从来没过的事啊，快来看啊，小花猫打了大黄啊</p>',1,1),
(14,'关于华软对实验室进行大范围更新公告','何以笙箫默','2018-02-03','<p>这是一个自学院依赖从来没过的事啊，快来看啊，小花猫打了大黄啊</p>',1,1615),
(15,'新公告啦，新公告啦','何以笙箫默','2018-02-04','<p>这是一个自学院依赖从来没过的事啊，快来看啊，小花猫打了大黄啊</p>',1,807),
(16,'新公告啦，新公告啦','何以笙箫默','2018-02-04','<p>这是一个自学院依赖从来没过的事啊，快来看啊，小花猫打了大黄啊</p>',1,0),
(19,'flow me','游客','2018-02-07','<p>靠水电费水电费<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0b/tootha_thumb.gif\"></p><p><img style=\"max-width:100%;\" src=\"http://img01.sogoucdn.com/app/a/100520093/ac75323d6b6de243-88c2ddd55cb8bca2-106ba127bb261380f92d5a9e97f946c5.jpg\"><br></p><table class=\"\" style=\"width: 100%;\"><tbody><tr><td>&nbsp;新闻</td><td>&nbsp;新闻</td><td>&nbsp;话题</td><td>&nbsp;圈子</td></tr><tr><td>&nbsp;1</td><td>&nbsp;2</td><td>&nbsp;5</td><td>&nbsp;8</td></tr></tbody></table><p><br></p>',1,0);

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `download` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `file` */

insert  into `file`(`id`,`filename`,`url`,`size`,`type`,`download`) values 
(1,'软件工程.doc','http://p40so5pwi.bkt.clouddn.com/软件工程.doc',44544,'application/msword',0),
(2,'实验报告模板.doc','http://p40so5pwi.bkt.clouddn.com/实验报告模板.doc',50688,'application/msword',0),
(3,'实验室基本行为守则.doc','http://p40so5pwi.bkt.clouddn.com/实验室基本行为守则.doc',37376,'application/msword',1),
(4,'用例规约.ppt','http://p40so5pwi.bkt.clouddn.com/用例规约.ppt',179712,'application/vnd.ms-powerpoint',0),
(5,'实验报告纸封面.doc','http://p40so5pwi.bkt.clouddn.com/实验报告纸封面.doc',263680,'application/msword',0),
(6,'作业纸内页.doc','http://p40so5pwi.bkt.clouddn.com/作业纸内页.doc',175104,'application/msword',0),
(7,'实验中心调查表.doc','http://p40so5pwi.bkt.clouddn.com/实验中心调查表.doc',48128,'application/msword',0),
(8,'作业纸封面.doc','http://p40so5pwi.bkt.clouddn.com/作业纸封面.doc',220160,'application/msword',0),
(9,'课程请假审批表.doc','http://p40so5pwi.bkt.clouddn.com/课程请假审批表.doc',89600,'application/msword',0),
(10,'测试报告模板.doc','http://p40so5pwi.bkt.clouddn.com/测试报告模板.doc',37968,'application/msword',0);

/*Table structure for table `imagenews` */

DROP TABLE IF EXISTS `imagenews`;

CREATE TABLE `imagenews` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数量索引值',
  `nId` int(11) DEFAULT NULL COMMENT '外键新闻id',
  `url` varchar(200) DEFAULT NULL COMMENT '轮播显示的图片地址',
  `description` varchar(50) DEFAULT NULL COMMENT '新闻简要描述',
  `isShow` int(1) DEFAULT NULL COMMENT '是否要显示',
  PRIMARY KEY (`id`),
  KEY `news_foreign` (`nId`),
  CONSTRAINT `news_foreign` FOREIGN KEY (`nId`) REFERENCES `news` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `imagenews` */

insert  into `imagenews`(`id`,`nId`,`url`,`description`,`isShow`) values 
(1,1,'http://p4t7xi97p.bkt.clouddn.com/huaruan1.jpg','冬临十二，丝木棉花开',1),
(2,26,'http://p4t7xi97p.bkt.clouddn.com/huaruan2.jpg','丝木棉花近距离模糊摄影',1),
(3,27,'http://p4t7xi97p.bkt.clouddn.com/huaruan3.jpg','黄昏下的华软格外的迷人',1),
(4,28,'http://p4t7xi97p.bkt.clouddn.com/huaruan4.jpg','宁静的华软校园一角',1);

/*Table structure for table `labbooking` */

DROP TABLE IF EXISTS `labbooking`;

CREATE TABLE `labbooking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lId` int(11) DEFAULT NULL COMMENT '绑定的实验室id',
  `wId` int(11) DEFAULT NULL COMMENT '星期几',
  `section1` varchar(50) DEFAULT NULL COMMENT '第一节课：9:00-10:20',
  `section2` varchar(50) DEFAULT NULL COMMENT '第二节课：10:40-12:00',
  `section3` varchar(50) DEFAULT NULL COMMENT '第三节课：14:00-15:20',
  `section4` varchar(50) DEFAULT NULL COMMENT '第四节课：15:30-16:50',
  `section5` varchar(50) DEFAULT NULL COMMENT '第五节课：17:00-18:20',
  `section6` varchar(50) DEFAULT NULL COMMENT '第六节课：19:00-20:20',
  `section7` varchar(50) DEFAULT NULL COMMENT '第七节课：20:40-22:00',
  `status` int(11) DEFAULT NULL COMMENT '空闲状态：1-空闲 2-未满 3-预定完',
  PRIMARY KEY (`id`),
  KEY `lab_booking` (`lId`),
  KEY `week_id` (`wId`),
  CONSTRAINT `lab_booking` FOREIGN KEY (`lId`) REFERENCES `laboratory` (`id`),
  CONSTRAINT `week_id` FOREIGN KEY (`wId`) REFERENCES `week` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Data for the table `labbooking` */

insert  into `labbooking`(`id`,`lId`,`wId`,`section1`,`section2`,`section3`,`section4`,`section5`,`section6`,`section7`,`status`) values 
(1,1,1,'','','','周华','','天美','主任',1),
(2,1,2,'','周周','李梅','','李梅','','',1),
(3,1,3,'','','','','黎明','','',1),
(4,1,4,'郑培','','','','三麦','','远峰',1),
(5,1,5,'','天美','主任','李梅','','迈亚','',1),
(9,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(10,2,2,'','','','','','','',1),
(11,2,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(12,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(13,2,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(17,20,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(18,20,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(19,20,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(20,20,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(21,20,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(22,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(23,3,2,'','','','','','','',1),
(24,3,3,'','','','','','','',1),
(25,3,4,'','','','','','','',1),
(26,3,5,'','','','','','','',1),
(27,4,1,'','','李梅','','','','',1),
(28,4,2,'','','','','','','',1),
(29,4,3,'','','','','','','',1),
(30,4,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(31,4,5,NULL,NULL,'',NULL,NULL,NULL,NULL,1),
(32,7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(33,7,2,'','','','','','','',1),
(34,7,3,'','','','','','','',1),
(35,7,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(36,7,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(37,8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(38,8,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(39,8,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(40,8,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(41,8,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(42,8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(43,8,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(44,8,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(45,8,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(46,8,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(47,8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(48,8,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(49,8,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(50,8,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(51,8,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);

/*Table structure for table `laboratory` */

DROP TABLE IF EXISTS `laboratory`;

CREATE TABLE `laboratory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引',
  `name` varchar(20) DEFAULT NULL COMMENT '实验室名',
  `floor` int(11) DEFAULT NULL COMMENT '第几层，数字代表层数',
  `usages` int(11) DEFAULT NULL COMMENT '用途，1：教学，2：实验，3：其他',
  `vacant` int(11) DEFAULT NULL COMMENT '空置情况 1：空闲，2：已预订',
  `building` varchar(20) DEFAULT NULL COMMENT '位于哪栋实验楼',
  `description` varchar(100) DEFAULT NULL COMMENT '实验室描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `laboratory` */

insert  into `laboratory`(`id`,`name`,`floor`,`usages`,`vacant`,`building`,`description`) values 
(1,'S101',1,2,1,'S栋实验楼','ert3434'),
(2,'S102',1,2,1,'S栋实验楼',NULL),
(3,'S203',2,2,1,'S栋实验楼',NULL),
(4,'S304',3,1,1,'S栋实验楼',NULL),
(7,'T108',1,1,1,'T栋实验楼',NULL),
(8,'T205',2,1,1,'T栋实验楼',NULL),
(13,'T403',4,1,1,'T栋实验楼',NULL),
(16,'U210',2,2,1,'U楼',''),
(20,'U103',1,1,1,'U栋','');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `title` varchar(100) NOT NULL COMMENT '新闻标题',
  `subtitle` varchar(100) DEFAULT NULL COMMENT '新闻副标题',
  `author` varchar(16) DEFAULT NULL COMMENT '作者',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表日期',
  `contents` text COMMENT '新闻内容',
  `state` int(11) DEFAULT NULL COMMENT '发表状态: 1-已发表 2-草稿',
  `visits` int(11) DEFAULT NULL COMMENT '访问次数',
  PRIMARY KEY (`id`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`subtitle`,`author`,`date`,`contents`,`state`,`visits`) values 
(1,'华软实验室准备对实验室的设备进行大范围更新','设备更新通告','欧泡泡','2018-03-07 23:38:58','<p>靠水电费水电费&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0b/tootha_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/70/vw_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bc/fuyun_thumb.gif\"></p><blockquote><p>水电费第三方速度</p></blockquote><p align=\"center\" style=\"text-align: center;\">&nbsp;<img style=\"max-width:100%;\" src=\"http://img01.sogoucdn.com/app/a/100520093/ac75323d6b6de243-88c2ddd55cb8bca2-106ba127bb261380f92d5a9e97f946c5.jpg\" class=\"\"><br></p><p align=\"center\" style=\"text-align: center;\"><font color=\"#0000ff\">空首的时候是不是啊啊啊啊啊啊啊啊啊啊啊啊</font></p><table class=\"\" style=\"width: 100%;\"><tbody><tr><td><b>&nbsp;新</b></td><td><b>&nbsp;新闻</b></td><td><b>&nbsp;话题</b></td><td><b>&nbsp;圈子</b></td></tr><tr><td>&nbsp;1</td><td>&nbsp;2</td><td>&nbsp;5</td><td>&nbsp;8</td></tr></tbody></table><p><br></p>',1,7),
(26,'华软学院10个项目成功立项2018年“攀登计划”（图文）','','lily','2018-03-08 23:40:52','<p><b>本网讯&nbsp;</b>2018年1月25日，广东大学生科技创新培育专项资金项目即攀登计划专项资金项目立项结果正式出炉，我院共有10个项目成功立项。其中，科技发明制作类5项，自然科学类3项，哲学社会科学类2项,立项金额共计16.5万元，立项项目数量位居独立院校前列。</p><p>&nbsp; &nbsp;广东大学生科技创新培育专项资金（攀登计划专项资金）是广东省政府每年从财政经费预算中划拨专门用于培育提升广东大学生科技创新能力的专项资金，资金额度&nbsp;2000万元/年，每年在全省遴选、培育和资助大学生科技创新团队开展具有前沿性、开创性的科技创新实践研究。申报项目类型参照“挑战杯”全国大学生课外学术科技作品竞赛的分类，分为自然科学类学术论文、哲学社会科学类调查报告和学术论文、科技发明制作三大类。项目通过培育、孵化、竞赛、提升等形式，鼓励大学生参与到科技创新中，并为广东省培养一批具有创新精神和创新能力的青年大学生。</p><p>近年来，我院大学生创业创新潜能不断被激发，各创业创新团队积极参加一系列大学生创新创业比赛，努力提高自己的能力。自2018年广东省攀登计划启动以来，经各系推荐、团队申请，共收到来自全院的88个项目团队递交的申报材料。2018年1月初，学院团委联合教务处、科研处等部门组织校内外专家对项目进行严格评审，根据团省委下发的名额分配，最终推荐14个项目参加省级立项。</p><p><img style=\"max-width:100%;\" src=\"http://news.sise.edu.cn/Uploads/2018-02-03/5a7579f9da7e7.jpg\"><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<font color=\"#0000ff\"> 我院2018年攀登计划立项项目名单</font><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我院自创建以来，一直鼓励全院学生参与创新创业竞赛，创新创业氛围浓厚，相信此次“攀登计划”之后，我院创业创新团队会完善自己的作品，争取有更多优秀的作品迎接6月的大学生“挑战杯”即全国大学生课外学术科技作品竞赛。</p><p><br></p>',1,6),
(27,'【南方卫视】华软学子造无人机无人船（2018年1月3日）','','lily','2018-03-07 23:36:55','<p style=\"text-align: center; \"><b>原标题：大学生造无人机无人船</b></p><p><b>编者按</b>&nbsp;从化区2017年高校创新创业成果展暨校企对接洽谈会在从化图书馆多功能展厅举行，我院电子系2015级通信工程陈泽锋同学团队的作品《单轨同向可互相超越的自巡航智能汽车》、计算机系2015级物联网赖俊委同学的作品《“IBoat无人船”》以及数码媒体系外观包装设计作品在此次创新创业成果展上展出，并受到南方卫视城事特搜的关注。</p><p><img style=\"max-width:100%;\" src=\"http://news.sise.edu.cn/Uploads/2018-01-05/5a4eda0fcd77b.jpg\"><br></p><p><img style=\"max-width:100%;\" src=\"http://news.sise.edu.cn/Uploads/2018-01-05/5a4eda197c0ee.jpg\"><br></p><p><img style=\"max-width:100%;\" src=\"http://news.sise.edu.cn/Uploads/2018-01-05/5a4eda2269ec6.jpg\"><br></p><p><font color=\"#0000ff\">电子系2015级通信工程陈泽锋同学团队的作品《单轨同向可互相超越的自巡航智能汽车》受关注</font></p><p><img style=\"max-width:100%;\" src=\"http://news.sise.edu.cn/Uploads/2018-01-05/5a4eda3810498.jpg\"><font color=\"#0000ff\"><br></font></p><p style=\"text-align: center;\"><font color=\"#0000ff\">特搜记者报道现场</font></p><p>（消息来源：<a href=\"http://www.iqiyi.com/v_19rresxyc0.html?vfm=2001_sgysdh&fromvsogou=1\">南方卫视城事特搜2018年1月3日</a>（视频从18:37开始）&nbsp;编发：林延军）</p><p><br></p>',1,11),
(28,'【南方卫视】华软学子造无人机无人船（2018年1月3日）','','micky','2018-03-07 23:36:57','<p style=\"text-align: center; \"><b>原标题：大学生造无人机无人船</b></p><p><b>编者按</b>&nbsp;从化区2017年高校创新创业成果展暨校企对接洽谈会在从化图书馆多功能展厅举行，我院电子系2015级通信工程陈泽锋同学团队的作品《单轨同向可互相超越的自巡航智能汽车》、计算机系2015级物联网赖俊委同学的作品《“IBoat无人船”》以及数码媒体系外观包装设计作品在此次创新创业成果展上展出，并受到南方卫视城事特搜的关注。</p><p><img style=\"max-width:100%;\" src=\"http://news.sise.edu.cn/Uploads/2018-01-05/5a4eda0fcd77b.jpg\"><br></p><p><img style=\"max-width:100%;\" src=\"http://news.sise.edu.cn/Uploads/2018-01-05/5a4eda197c0ee.jpg\"><br></p><p><img style=\"max-width:100%;\" src=\"http://news.sise.edu.cn/Uploads/2018-01-05/5a4eda2269ec6.jpg\"><br></p><p><font color=\"#0000ff\">电子系2015级通信工程陈泽锋同学团队的作品《单轨同向可互相超越的自巡航智能汽车》受关注</font></p><p><img style=\"max-width:100%;\" src=\"http://news.sise.edu.cn/Uploads/2018-01-05/5a4eda3810498.jpg\"><font color=\"#0000ff\"><br></font></p><p style=\"text-align: center;\"><font color=\"#0000ff\">特搜记者报道现场</font></p><p>（消息来源：<a href=\"http://www.iqiyi.com/v_19rresxyc0.html?vfm=2001_sgysdh&fromvsogou=1\">南方卫视城事特搜2018年1月3日</a>（视频从18:37开始）&nbsp;编发：林延军）</p><p><br></p>',1,3),
(29,'华软学院一团支部获2017年全国高校“活力团支部”荣誉称号（图文）','','lily','2018-03-07 23:37:02','<p><b>本网讯&nbsp;</b>日前，由团中央学校部主办的2017年全国高校“活力团支部”创建遴选活动结果揭晓，我院计算机系2015级物联网工程1班团支部获得全国高校“活力团支部”荣誉称号。</p><p>为贯彻落实《共青团中央改革方案》有关精神，深入实施高校基层团支部“活力提升”工程，团中央学校部于2017年秋季开展了高校“活力团支部”创建活动，经资格审核、网络投票和评审等环节，全国共有1000个团支部入选。</p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-02-03/5a7580b9bade1.jpg\" alt=\"\"></p><p style=\"text-align: center; \"><font color=\"#0000ff\">班级会议</font></p><p>该团支部自建立以来，15级物联网工程1班在思想建设、组织建设、学风建设等各方面积极开展形式多样、内涵丰富的团日活动，通过进行班级培训、积极响应参加校内校外文体和学术活动、雷锋月开展服务活动，组织参与专业竞赛，打造创新创业孵化团队等形式，激发团员的热情与活力。此外，该支部还将激发支部成员参加如学习型宿舍交流室、校园网直播C语言、JAVA交流学习课等各种学术、专业项目作为支部特色活动。</p><p>&nbsp; 经过为期一年多的团支部建设，2015级计算机系物联网工程1班共获得9项院级及以上团体奖项，38人获得各级个人奖项。</p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-02-03/5a7580e232a08.jpg\" alt=\"\"></p><p style=\"text-align: center; \"><font color=\"#0000ff\">团日活动</font></p><p><br></p><p><br></p>',1,0),
(30,'华软学院一团支部获2017年全国高校“活力团支部”荣誉称号（图文）','','opop','2018-03-07 23:37:08','<p><b>本网讯&nbsp;</b>日前，由团中央学校部主办的2017年全国高校“活力团支部”创建遴选活动结果揭晓，我院计算机系2015级物联网工程1班团支部获得全国高校“活力团支部”荣誉称号。</p><p>为贯彻落实《共青团中央改革方案》有关精神，深入实施高校基层团支部“活力提升”工程，团中央学校部于2017年秋季开展了高校“活力团支部”创建活动，经资格审核、网络投票和评审等环节，全国共有1000个团支部入选。</p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-02-03/5a7580b9bade1.jpg\" alt=\"\"></p><p style=\"text-align: center; \"><font color=\"#0000ff\">班级会议</font></p><p>该团支部自建立以来，15级物联网工程1班在思想建设、组织建设、学风建设等各方面积极开展形式多样、内涵丰富的团日活动，通过进行班级培训、积极响应参加校内校外文体和学术活动、雷锋月开展服务活动，组织参与专业竞赛，打造创新创业孵化团队等形式，激发团员的热情与活力。此外，该支部还将激发支部成员参加如学习型宿舍交流室、校园网直播C语言、JAVA交流学习课等各种学术、专业项目作为支部特色活动。</p><p>&nbsp; 经过为期一年多的团支部建设，2015级计算机系物联网工程1班共获得9项院级及以上团体奖项，38人获得各级个人奖项。</p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-02-03/5a7580e232a08.jpg\" alt=\"\"></p><p style=\"text-align: center; \"><font color=\"#0000ff\">团日活动</font></p><p><br></p><p><br></p>',1,3),
(31,'华软学院入选教育部数据中国“百校工程”建设名单（图文）','','lily','2018-03-07 23:35:11','<p><b>本网讯&nbsp;</b>日前，教育部学校规划建设发展中心发布了《关于公布数据中国“百校工程”项目院校及建设院校名单的通知》，根据《关于数据中国”百校工程”项目院校申报的通知》（教规建中心函〔2017〕66号)安排，中心于2017年12月组织专家对申报院校进行了集中审核，按照“院校申报、企业对接、方案优化”的基本原则，综合考量专家组意见，统筹考虑地域分布、学校类型及专业领域等维度，最终遴选广州大学华软软件学院等30所院校为数据中国“百校工程”建设院校。</p><p>在申报过程中，华软学院按照相关要求，积极准备，展现了教育转型改革的意愿与决心、对大数据应用中心的定位与规划、产教融合校企合作建设方案以及资源投入等方面内容，通过远程答辩的方式向教育部规建中心进行了详细的申报。</p><p>作为入选的建设院校，我院接下来会同中科曙光进一步明确项目实施步骤，推进大数据设施落地并开展专业合作，启动大数据相关重点学科建设，落实大数据应用的重点行业资源及地方资源。</p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-01-24/5a68975b3f3e8.jpg\" alt=\"\"></p><p><font color=\"#0000ff\">教育部学校规划建设发展中心官网通知</font></p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-01-24/5a68976bb153e.jpg\" alt=\"\"></p><p></p><p><font color=\"#0000ff\">数据中国“百校工程”建设院校名单截图</font></p><p><br></p>',1,13),
(32,'华软学院入选教育部数据中国“百校工程”建设名单（图文）','','lily','2018-03-07 16:55:05','<p><b>本网讯&nbsp;</b>日前，教育部学校规划建设发展中心发布了《关于公布数据中国“百校工程”项目院校及建设院校名单的通知》，根据《关于数据中国”百校工程”项目院校申报的通知》（教规建中心函〔2017〕66号)安排，中心于2017年12月组织专家对申报院校进行了集中审核，按照“院校申报、企业对接、方案优化”的基本原则，综合考量专家组意见，统筹考虑地域分布、学校类型及专业领域等维度，最终遴选广州大学华软软件学院等30所院校为数据中国“百校工程”建设院校。</p><p>在申报过程中，华软学院按照相关要求，积极准备，展现了教育转型改革的意愿与决心、对大数据应用中心的定位与规划、产教融合校企合作建设方案以及资源投入等方面内容，通过远程答辩的方式向教育部规建中心进行了详细的申报。</p><p>作为入选的建设院校，我院接下来会同中科曙光进一步明确项目实施步骤，推进大数据设施落地并开展专业合作，启动大数据相关重点学科建设，落实大数据应用的重点行业资源及地方资源。</p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-01-24/5a68975b3f3e8.jpg\" alt=\"\"></p><p><font color=\"#0000ff\">教育部学校规划建设发展中心官网通知</font></p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-01-24/5a68976bb153e.jpg\" alt=\"\"></p><p></p><p><font color=\"#0000ff\">数据中国“百校工程”建设院校名单截图</font></p><p><br></p>',1,4),
(34,'华软学子获广东省首届图书馆杯主题海报创意设计大赛二等奖（图文）','','opop','2018-02-26 12:59:38','<p>本网讯&nbsp;日前，由广东图书馆学会、深圳图书情报学会、广东省立中山图书馆、广州图书馆、广东省高校图工委高职高专分委会联合全省116所图书馆于2017年9月至11月组织举办的“创意之魅，阅读之美”广东省首届图书馆杯“4.23世界读书日”主题海报创意设计大赛赛果出炉，我院数码系陈诗莹同学的参赛作品《蒸文煮句》恰到好处、巧妙的体现“创意之魅，阅读之美”主题，设计美观，获得了二等奖的优异成绩；数码系翁育民同学凭系列作品《书中的乌托邦》荣获三等奖佳绩；电子系薛于靖同学作品《世界读书日》及数码系赵彩琪同学作品《你还在读书吗？》荣获优秀奖。</p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-01-08/5a52d82993bed.jpg\" alt=\"\"></p><p><font color=\"#0000ff\">陈诗莹作品《蒸文煮句》荣获二等奖</font></p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-01-08/5a52d835a1a3f.jpg\" alt=\"\"></p><p><font color=\"#0000ff\">翁育民作品《书中的乌托邦》荣获三等奖</font></p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-01-08/5a52d845c31d3.jpg\" alt=\"\"></p><p><font color=\"#0000ff\">赵彩琪作品《你还在读书吗？》荣获优秀奖</font></p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-01-08/5a52d851b0341.jpg\" alt=\"\"></p><p><font color=\"#0000ff\">薛于靖作品《世界读书日》荣获优秀奖</font></p><p>据悉，本届大赛旨在让更多读者参与全民阅读推广、体会阅读之美，响应国家大力支持与发展文化创意与设计的政策。比赛从作品征集、初评、总评历时40多天，共征集作品2672件。广东省科技图书馆馆长魏东原，广州图书馆馆长方家忠，深圳图书馆馆长张岩，南方医科大学图书馆馆长顾萍，广州创意产业协会会长李博陶，广州美术学院教授郭湘黔，国际商业美术设计师仝亚男担任本次大赛总评委。</p><p>我院图书馆作为本届赛事的承办方之一，多渠道大力宣传和推广参赛信息，组织学生报名。以期通过本次参赛活动，让更多同学能深刻认识阅读的重要性，对阅读的理解和对美的追求也有不同层次的提升。</p><p><img src=\"http://news.sise.edu.cn/Uploads/2018-01-08/5a52d85e5bebb.jpg\" alt=\"\"></p><p></p><p><font color=\"#0000ff\">获奖证书</font></p><p><br></p>',2,1);

/*Table structure for table `online` */

DROP TABLE IF EXISTS `online`;

CREATE TABLE `online` (
  `sessionId` varchar(100) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `page` varchar(200) DEFAULT NULL,
  `time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `online` */

/*Table structure for table `perbooking` */

DROP TABLE IF EXISTS `perbooking`;

CREATE TABLE `perbooking` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引',
  `labId` int(11) DEFAULT NULL COMMENT '实验室id',
  `name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `section` varchar(20) DEFAULT NULL COMMENT '第几节',
  `week` int(11) DEFAULT NULL COMMENT '星期几',
  `labName` varchar(20) DEFAULT NULL COMMENT '实验室名',
  PRIMARY KEY (`id`),
  KEY `lab_id` (`labId`),
  CONSTRAINT `lab_id` FOREIGN KEY (`labId`) REFERENCES `laboratory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `perbooking` */

insert  into `perbooking`(`id`,`labId`,`name`,`section`,`week`,`labName`) values 
(1,1,'1440232300','section3',2,'S101'),
(2,1,'1440232300','section5',2,'S101'),
(3,1,'1440232300','section4',5,'S101'),
(4,4,'1440232300','section3',1,'S304');

/*Table structure for table `records` */

DROP TABLE IF EXISTS `records`;

CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `url` varchar(200) DEFAULT NULL COMMENT '当前访问的url',
  `refer` varchar(200) DEFAULT NULL COMMENT '来源页面',
  `time` int(11) DEFAULT NULL COMMENT '停留时间',
  `timeIn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '进入页面的时间',
  `timeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '离开页面的时间',
  `uid` int(11) DEFAULT NULL COMMENT '用户id，游客统一为-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8;

/*Data for the table `records` */

insert  into `records`(`id`,`url`,`refer`,`time`,`timeIn`,`timeOut`,`uid`) values 
(1,'http://localhost:8071/news.html','http://localhost:8071/',2,'2018-02-26 10:34:00','2018-02-26 10:34:02',-1),
(2,'http://localhost:8071/introduce.html','http://localhost:8071/news.html',1,'2018-02-26 10:34:11','2018-02-26 10:34:12',-1),
(3,'http://localhost:8071/index.html','http://localhost:8071/introduce.html',2,'2018-02-26 10:34:18','2018-02-26 10:34:20',-1),
(4,'http://localhost:8071/announcement.html','http://localhost:8071/index.html',1,'2018-02-26 10:34:28','2018-02-26 10:34:29',-1),
(5,'http://localhost:8071/news.html','http://localhost:8071/announcement.html',6,'2018-02-26 10:34:37','2018-02-26 10:34:43',-1),
(6,'http://localhost:8071/newsdetail.html?index=26','http://localhost:8071/news.html',8,'2018-02-26 10:34:53','2018-02-26 10:35:01',-1),
(7,'http://localhost:8071/introduce.html','http://localhost:8071/newsdetail.html?index=26',18,'2018-02-26 10:35:08','2018-02-26 10:35:26',-1),
(8,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',108,'2018-02-26 10:35:33','2018-02-26 10:37:21',-1),
(9,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',40,'2018-02-26 10:37:30','2018-02-26 10:38:10',-1),
(10,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',43,'2018-02-26 10:38:16','2018-02-26 10:38:59',-1),
(11,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',12,'2018-02-26 10:39:07','2018-02-26 10:39:19',-1),
(12,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',149,'2018-02-26 10:39:28','2018-02-26 10:41:57',-1),
(13,'http://localhost:8071/news.html','http://localhost:8071/announcement.html',5,'2018-02-26 10:42:00','2018-02-26 10:42:05',-1),
(14,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',1,'2018-02-26 10:42:09','2018-02-26 10:42:10',-1),
(15,'http://localhost:8071/guide.html#/','http://localhost:8071/announcement.html',1,'2018-02-26 10:42:12','2018-02-26 10:42:13',-1),
(16,'http://localhost:8071/introduce.html','http://localhost:8071/guide.html',1,'2018-02-26 10:42:16','2018-02-26 10:42:17',-1),
(17,'http://localhost:8071/index.html','http://localhost:8071/introduce.html',49,'2018-02-26 10:42:20','2018-02-26 10:43:09',-1),
(18,'http://localhost:8071/index.html','http://localhost:8071/introduce.html',1,'2018-02-26 10:43:13','2018-02-26 10:43:14',-1),
(19,'http://localhost:8071/news.html','http://localhost:8071/',9,'2018-02-26 11:26:14','2018-02-26 11:26:23',-1),
(20,'http://localhost:8071/introduce.html','http://localhost:8071/news.html',5,'2018-02-26 11:26:27','2018-02-26 11:26:32',-1),
(21,'http://localhost:8071/guide.html#/quality','http://localhost:8071/introduce.html',4,'2018-02-26 11:26:36','2018-02-26 11:26:40',-1),
(22,'http://localhost:8071/announcement.html','http://localhost:8071/guide.html',23,'2018-02-26 11:30:18','2018-02-26 11:30:41',-1),
(23,'http://localhost:8071/news.html','http://localhost:8071/announcement.html',1,'2018-02-26 11:30:44','2018-02-26 11:30:45',-1),
(24,'http://localhost:8071/introduce.html','http://localhost:8071/news.html',16,'2018-02-26 11:30:47','2018-02-26 11:31:03',-1),
(25,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',1,'2018-02-26 11:31:07','2018-02-26 11:31:08',-1),
(26,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',1,'2018-02-26 11:31:10','2018-02-26 11:31:11',-1),
(27,'http://localhost:8071/guide.html#/','http://localhost:8071/announcement.html',4,'2018-02-26 11:31:14','2018-02-26 11:31:18',-1),
(28,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',15,'2018-02-26 11:31:21','2018-02-26 11:31:36',-1),
(29,'http://localhost:8071/index.html','http://localhost:8071/expteaching.html',5,'2018-02-26 11:31:39','2018-02-26 11:31:44',-1),
(30,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',1,'2018-02-26 11:31:46','2018-02-26 11:31:47',-1),
(31,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',2,'2018-02-26 11:31:50','2018-02-26 11:31:52',-1),
(32,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',1,'2018-02-26 11:31:54','2018-02-26 11:31:55',-1),
(33,'http://localhost:8071/guide.html#/','http://localhost:8071/announcement.html',0,'2018-02-26 11:31:58','2018-02-26 11:31:58',-1),
(34,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',1,'2018-02-26 11:32:00','2018-02-26 11:32:01',-1),
(35,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',44,'2018-02-26 11:32:04','2018-02-26 11:32:48',-1),
(36,'http://localhost:8071/news.html','http://localhost:8071/download.html',379,'2018-02-26 11:32:50','2018-02-26 11:39:09',-1),
(37,'http://localhost:8071/index.html','http://localhost:8071/news.html',1,'2018-02-26 11:39:13','2018-02-26 11:39:14',-1),
(38,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',4,'2018-02-26 11:39:17','2018-02-26 11:39:21',-1),
(39,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',4,'2018-02-26 11:39:23','2018-02-26 11:39:27',-1),
(40,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',0,'2018-02-26 11:39:31','2018-02-26 11:39:31',-1),
(41,'http://localhost:8071/guide.html#/','http://localhost:8071/announcement.html',5,'2018-02-26 11:39:34','2018-02-26 11:39:39',-1),
(42,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',2,'2018-02-26 11:39:42','2018-02-26 11:39:44',-1),
(43,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',231,'2018-02-26 11:39:49','2018-02-26 11:43:40',-1),
(44,'http://localhost:8071/news.html','http://localhost:8071/download.html',91,'2018-02-26 11:43:43','2018-02-26 11:45:14',-1),
(45,'http://localhost:8071/download.html#/','http://localhost:8071/news.html',190,'2018-02-26 11:45:30','2018-02-26 11:48:40',-1),
(46,'http://localhost:8071/guide.html#/','http://localhost:8071/download.html',1,'2018-02-26 11:48:43','2018-02-26 11:48:44',-1),
(47,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',6,'2018-02-26 11:48:47','2018-02-26 11:48:53',-1),
(48,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',13,'2018-02-26 11:48:56','2018-02-26 11:49:09',-1),
(49,'http://localhost:8071/news.html','http://localhost:8071/download.html',6,'2018-02-26 11:49:12','2018-02-26 11:49:18',-1),
(50,'http://localhost:8071/news.html','http://localhost:8071/download.html',10,'2018-02-26 11:49:43','2018-02-26 11:49:53',-1),
(51,'http://localhost:8071/index.html','http://localhost:8071/news.html',6,'2018-02-26 11:49:56','2018-02-26 11:50:02',-1),
(52,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',1,'2018-02-26 11:50:04','2018-02-26 11:50:05',-1),
(53,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',1,'2018-02-26 11:50:08','2018-02-26 11:50:09',-1),
(54,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',0,'2018-02-26 11:50:12','2018-02-26 11:50:12',-1),
(55,'http://localhost:8071/guide.html#/','http://localhost:8071/announcement.html',0,'2018-02-26 11:50:15','2018-02-26 11:50:15',-1),
(56,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',1,'2018-02-26 11:50:17','2018-02-26 11:50:18',-1),
(57,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',1,'2018-02-26 11:50:21','2018-02-26 11:50:22',-1),
(58,'http://localhost:8071/coursemanager.html#/','http://localhost:8071/download.html',5,'2018-02-26 11:50:25','2018-02-26 11:50:30',-1),
(59,'http://localhost:8071/index.html','http://localhost:8071/coursemanager.html',43,'2018-02-26 11:50:33','2018-02-26 11:51:16',-1),
(60,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',2,'2018-02-26 11:51:19','2018-02-26 11:51:21',-1),
(61,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',292,'2018-02-26 11:51:23','2018-02-26 11:56:15',-1),
(62,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',102,'2018-02-26 11:56:17','2018-02-26 11:57:59',-1),
(63,'http://localhost:8071/news.html','http://localhost:8071/announcement.html',2026,'2018-02-26 11:58:02','2018-02-26 12:31:48',-1),
(64,'http://localhost:8071/index.html','http://localhost:8071/news.html',0,'2018-02-26 12:31:52','2018-02-26 12:31:52',-1),
(65,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',8,'2018-02-26 12:31:55','2018-02-26 12:32:03',-1),
(66,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',259,'2018-02-26 12:32:05','2018-02-26 12:36:24',-1),
(67,'http://localhost:8071/introduce.html','http://localhost:8071/news.html',1,'2018-02-26 12:36:27','2018-02-26 12:36:28',-1),
(68,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',1,'2018-02-26 12:36:31','2018-02-26 12:36:32',-1),
(69,'http://localhost:8071/newsdetail.html?index=26','http://localhost:8071/news.html',4,'2018-02-26 12:36:33','2018-02-26 12:36:37',-1),
(70,'http://localhost:8071/newsdetail.html?index=27','http://localhost:8071/newsdetail.html?index=26',6,'2018-02-26 12:36:40','2018-02-26 12:36:46',-1),
(71,'http://localhost:8071/announcement.html','http://localhost:8071/newsdetail.html?index=27',358,'2018-02-26 12:36:48','2018-02-26 12:42:46',-1),
(72,'http://localhost:8071/news.html','http://localhost:8071/announcement.html',1,'2018-02-26 12:42:49','2018-02-26 12:42:50',-1),
(73,'http://localhost:8071/newsdetail.html?index=28','http://localhost:8071/news.html',26,'2018-02-26 12:42:52','2018-02-26 12:43:18',-1),
(74,'http://localhost:8071/introduce.html','http://localhost:8071/newsdetail.html?index=28',6,'2018-02-26 12:43:21','2018-02-26 12:43:27',-1),
(75,'http://localhost:8071/download.html#/','http://localhost:8071/introduce.html',4,'2018-02-26 12:43:30','2018-02-26 12:43:34',-1),
(76,'http://localhost:8071/index.html','http://localhost:8071/download.html',219,'2018-02-26 12:43:36','2018-02-26 12:47:15',-1),
(77,'http://localhost:8071/expteaching.html#/','http://localhost:8071/index.html',166,'2018-02-26 12:47:19','2018-02-26 12:50:05',-1),
(78,'http://localhost:8071/expteaching.html#/','http://localhost:8071/expteaching.html',1,'2018-02-26 12:50:07','2018-02-26 12:50:08',-1),
(79,'http://localhost:8071/index.html','http://localhost:8071/expteaching.html',1,'2018-02-26 12:50:10','2018-02-26 12:50:11',-1),
(80,'http://localhost:8071/announcement.html','http://localhost:8071/index.html',1,'2018-02-26 12:50:14','2018-02-26 12:50:15',-1),
(81,'http://localhost:8071/announcement.html','http://localhost:8071/announcement.html',1,'2018-02-26 12:50:16','2018-02-26 12:50:17',-1),
(82,'http://localhost:8071/index.html','http://localhost:8071/announcement.html',4,'2018-02-26 12:50:21','2018-02-26 12:50:25',-1),
(83,'http://localhost:8071/undefined','http://localhost:8071/index.html',0,'2018-02-26 12:50:27','2018-02-26 12:50:27',-1),
(84,'http://localhost:8071/coursemanager.html#/','http://localhost:8071/undefined',2,'2018-02-26 12:50:31','2018-02-26 12:50:33',-1),
(85,'http://localhost:8071/download.html#/','http://localhost:8071/coursemanager.html',34,'2018-02-26 12:50:35','2018-02-26 12:51:09',-1),
(86,'http://localhost:8071/index.html','http://localhost:8071/download.html',3,'2018-02-26 12:51:11','2018-02-26 12:51:14',-1),
(87,'http://localhost:8071/announcement.html','http://localhost:8071/index.html',14,'2018-02-26 12:51:16','2018-02-26 12:51:30',-1),
(88,'http://localhost:8071/news.html','http://localhost:8071/announcement.html',2,'2018-02-26 12:51:34','2018-02-26 12:51:36',-1),
(89,'http://localhost:8071/newsdetail.html?index=31','http://localhost:8071/news.html',7,'2018-02-26 12:51:38','2018-02-26 12:51:45',-1),
(90,'http://localhost:8071/introduce.html','http://localhost:8071/newsdetail.html?index=31',457,'2018-02-26 12:51:47','2018-02-26 12:59:24',-1),
(91,'http://localhost:8071/index.html','http://localhost:8071/introduce.html',0,'2018-02-26 12:59:28','2018-02-26 12:59:28',-1),
(92,'http://localhost:8071/announcement.html','http://localhost:8071/index.html',2,'2018-02-26 12:59:30','2018-02-26 12:59:32',-1),
(93,'http://localhost:8071/news.html','http://localhost:8071/announcement.html',2,'2018-02-26 12:59:34','2018-02-26 12:59:36',-1),
(94,'http://localhost:8071/newsdetail.html?index=34','http://localhost:8071/news.html',17,'2018-02-26 12:59:38','2018-02-26 12:59:55',-1),
(95,'http://localhost:8071/news.html','http://localhost:8071/newsdetail.html?index=34',1,'2018-02-26 12:59:57','2018-02-26 12:59:58',-1),
(96,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',14,'2018-02-26 13:00:00','2018-02-26 13:00:14',-1),
(97,'http://localhost:8071/index.html','http://localhost:8071/announcement.html',1,'2018-02-26 13:00:16','2018-02-26 13:00:17',-1),
(98,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',5,'2018-02-26 13:00:20','2018-02-26 13:00:25',-1),
(99,'http://localhost:8071/expteaching.html#/colony','http://localhost:8071/introduce.html',10,'2018-02-26 13:00:26','2018-02-26 13:00:36',-1),
(100,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',1,'2018-02-26 13:00:39','2018-02-26 13:00:40',-1),
(101,'http://localhost:8071/coursemanager.html#/','http://localhost:8071/download.html',5,'2018-02-26 13:00:43','2018-02-26 13:00:48',-1),
(102,'http://localhost:8071/announcement.html','http://localhost:8071/coursemanager.html',313,'2018-02-26 13:00:52','2018-02-26 13:06:05',-1),
(103,'http://localhost:8071/news.html','http://localhost:8071/announcement.html',1,'2018-02-26 13:06:07','2018-02-26 13:06:08',-1),
(104,'http://localhost:8071/expteaching.html#/','http://localhost:8071/news.html',1,'2018-02-26 13:06:10','2018-02-26 13:06:11',-1),
(105,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',4,'2018-02-26 13:06:14','2018-02-26 13:06:18',-1),
(106,'http://localhost:8071/announcement.html','http://localhost:8071/download.html',360,'2018-02-26 13:06:20','2018-02-26 13:12:20',-1),
(107,'http://localhost:8071/announcement.html','http://localhost:8071/',1,'2018-02-26 13:19:59','2018-02-26 13:20:00',-1),
(108,'http://localhost:8071/announcementdetail.html?index=2','http://localhost:8071/announcement.html',15,'2018-02-26 13:20:03','2018-02-26 13:20:18',-1),
(109,'http://localhost:8071/news.html','http://localhost:8071/announcementdetail.html?index=2',7,'2018-02-26 13:20:22','2018-02-26 13:20:29',-1),
(110,'http://localhost:8071/expteaching.html#/other','http://localhost:8071/news.html',6,'2018-02-26 13:20:32','2018-02-26 13:20:38',-1),
(111,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',12,'2018-02-26 13:20:41','2018-02-26 13:20:53',-1),
(112,'http://localhost:8071/expteaching.html#/','http://localhost:8071/download.html',0,'2018-02-26 13:20:56','2018-02-26 13:20:56',-1),
(113,'http://localhost:8071/guide.html#/workflow','http://localhost:8071/expteaching.html',15,'2018-02-26 13:20:58','2018-02-26 13:21:13',-1),
(114,'http://localhost:8071/index.html','http://localhost:8071/guide.html',4,'2018-02-26 13:21:15','2018-02-26 13:21:19',-1),
(115,'http://localhost:8071/announcement.html','http://localhost:8071/index.html',8,'2018-02-26 13:21:23','2018-02-26 13:21:31',-1),
(116,'http://localhost:8071/announcementdetail.html?index=2','http://localhost:8071/announcement.html',195,'2018-02-26 13:21:34','2018-02-26 13:24:49',-1),
(117,'http://localhost:8071/introduce.html','http://localhost:8071/announcementdetail.html?index=2',9,'2018-02-26 13:24:50','2018-02-26 13:24:59',-1),
(118,'http://localhost:8071/announcement.html','http://localhost:8071/introduce.html',127,'2018-02-26 13:25:04','2018-02-26 13:27:11',-1),
(119,'http://localhost:8071/announcementdetail.html?index=2','http://localhost:8071/announcement.html',12,'2018-02-26 13:27:14','2018-02-26 13:27:26',-1),
(120,'http://localhost:8071/news.html','http://localhost:8071/announcementdetail.html?index=2',0,'2018-02-26 13:27:29','2018-02-26 13:27:29',-1),
(121,'http://localhost:8071/newsdetail.html?index=29','http://localhost:8071/news.html',7,'2018-02-26 13:27:32','2018-02-26 13:27:39',-1),
(122,'http://localhost:8071/announcement.html','http://localhost:8071/newsdetail.html?index=29',0,'2018-02-26 13:27:43','2018-02-26 13:27:43',-1),
(123,'http://localhost:8071/announcementdetail.html?index=6','http://localhost:8071/announcement.html',4,'2018-02-26 13:27:45','2018-02-26 13:27:49',-1),
(124,'http://localhost:8071/announcement.html','http://localhost:8071/announcementdetail.html?index=6',2,'2018-02-26 13:27:51','2018-02-26 13:27:53',-1),
(125,'http://localhost:8071/announcementdetail.html?index=4','http://localhost:8071/announcement.html',2,'2018-02-26 13:27:56','2018-02-26 13:27:58',-1),
(126,'http://localhost:8071/news.html','http://localhost:8071/announcementdetail.html?index=4',0,'2018-02-26 13:28:01','2018-02-26 13:28:01',-1),
(127,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',4,'2018-02-26 13:28:03','2018-02-26 13:28:07',-1),
(128,'http://localhost:8071/announcementdetail.html?index=11','http://localhost:8071/announcementdetail.html?index=11',180,'2018-02-26 13:38:28','2018-02-26 13:41:28',-1),
(129,'http://localhost:8071/announcementdetail.html?index=8','http://localhost:8071/announcementdetail.html?index=11',2,'2018-02-26 13:41:31','2018-02-26 13:41:33',-1),
(130,'http://localhost:8071/announcementdetail.html?index=7','http://localhost:8071/announcementdetail.html?index=8',1,'2018-02-26 13:41:37','2018-02-26 13:41:38',-1),
(131,'http://localhost:8071/announcementdetail.html?index=6','http://localhost:8071/announcementdetail.html?index=7',1,'2018-02-26 13:41:42','2018-02-26 13:41:43',-1),
(132,'http://localhost:8071/announcement.html','http://localhost:8071/announcementdetail.html?index=6',2,'2018-02-26 13:41:46','2018-02-26 13:41:48',-1),
(133,'http://localhost:8071/announcementdetail.html?index=4','http://localhost:8071/announcement.html',1,'2018-02-26 13:41:52','2018-02-26 13:41:53',-1),
(134,'http://localhost:8071/announcementdetail.html?index=2','http://localhost:8071/announcementdetail.html?index=4',2,'2018-02-26 13:41:57','2018-02-26 13:41:59',-1),
(135,'http://localhost:8071/announcementdetail.html?index=1','http://localhost:8071/announcementdetail.html?index=2',2,'2018-02-26 13:42:01','2018-02-26 13:42:03',-1),
(136,'http://localhost:8071/announcementdetail.html?index=2','http://localhost:8071/announcementdetail.html?index=1',4,'2018-02-26 13:42:07','2018-02-26 13:42:11',-1),
(137,'http://localhost:8071/announcementdetail.html?index=4','http://localhost:8071/announcementdetail.html?index=2',1,'2018-02-26 13:42:14','2018-02-26 13:42:15',-1),
(138,'http://localhost:8071/announcementdetail.html?index=2','http://localhost:8071/announcementdetail.html?index=4',3,'2018-02-26 13:42:18','2018-02-26 13:42:21',-1),
(139,'http://localhost:8071/introduce.html','http://localhost:8071/announcementdetail.html?index=2',1,'2018-02-26 13:42:24','2018-02-26 13:42:25',-1),
(140,'http://localhost:8071/announcement.html','http://localhost:8071/introduce.html',72,'2018-02-26 13:42:28','2018-02-26 13:43:40',-1),
(141,'http://localhost:8071/index.html','http://localhost:8071/announcement.html',14,'2018-02-26 13:43:43','2018-02-26 13:43:57',-1),
(142,'http://localhost:8071/download.html#/','http://localhost:8071/index.html',0,'2018-02-26 13:44:00','2018-02-26 13:44:00',-1),
(143,'http://localhost:8071/index.html','http://localhost:8071/download.html',522,'2018-02-26 13:44:04','2018-02-26 13:52:46',-1),
(144,'http://localhost:8071/newsdetail.html?index=30','http://localhost:8071/index.html',2,'2018-02-26 13:52:48','2018-02-26 13:52:50',-1),
(145,'http://localhost:8071/announcement.html','http://localhost:8071/index.html',4,'2018-02-26 13:54:20','2018-02-26 13:54:24',-1),
(146,'http://localhost:8071/undefined','http://localhost:8071/announcementdetail.html?index=8',0,'2018-02-26 13:55:01','2018-02-26 13:55:01',-1),
(147,'http://localhost:8071/index.html','http://localhost:8071/undefined',209,'2018-02-26 13:55:04','2018-02-26 13:58:33',-1),
(148,'http://localhost:8071/\'announcementdetail.html?index=%27%20+%20item.id','http://localhost:8071/index.html',93,'2018-02-26 13:58:35','2018-02-26 14:00:08',-1),
(149,'http://localhost:8071/announcementdetail.html?index=6','http://localhost:8071/\'announcementdetail.html?index=%27%20+%20item.id',5,'2018-02-26 14:00:12','2018-02-26 14:00:17',-1),
(150,'http://localhost:8071/index.html','http://localhost:8071/announcementdetail.html?index=6',16,'2018-02-26 14:00:19','2018-02-26 14:00:35',-1),
(151,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',3,'2018-02-26 14:00:38','2018-02-26 14:00:41',-1),
(152,'http://localhost:8071/index.html','http://localhost:8071/introduce.html',421,'2018-02-26 14:00:45','2018-02-26 14:07:46',-1),
(153,'http://localhost:8071/announcement.html','http://localhost:8071/index.html',1,'2018-02-26 14:07:50','2018-02-26 14:07:51',-1),
(154,'http://localhost:8071/index.html','http://localhost:8071/guide.html',9,'2018-02-26 14:09:31','2018-02-26 14:09:40',-1),
(155,'http://localhost:8071/guide.html/businessType','http://localhost:8071/index.html',3,'2018-02-26 14:09:42','2018-02-26 14:09:45',-1),
(156,'http://localhost:8071/guide.html/workflow','http://localhost:8071/guide.html/businessType',229,'2018-02-26 14:09:47','2018-02-26 14:13:36',-1),
(157,'http://localhost:8071/guide.html#/quality','http://localhost:8071/guide.html/workflow',9,'2018-02-26 14:13:38','2018-02-26 14:13:47',-1),
(158,'http://localhost:8071/index.html','http://localhost:8071/guide.html',0,'2018-02-26 14:13:51','2018-02-26 14:13:51',-1),
(159,'http://localhost:8071/guide.html#/rules','http://localhost:8071/index.html',4,'2018-02-26 14:13:52','2018-02-26 14:13:56',-1),
(160,'http://localhost:8071/introduce.html','http://localhost:8071/announcement.html',0,'2018-02-26 14:15:52','2018-02-26 14:15:52',-1),
(161,'http://localhost:8071/index.html','http://localhost:8071/introduce.html',668,'2018-02-26 14:15:55','2018-02-26 14:27:03',-1),
(162,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',0,'2018-02-26 14:27:06','2018-02-26 14:27:06',-1),
(163,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',2,'2018-02-26 14:27:09','2018-02-26 14:27:11',-1),
(164,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',0,'2018-02-26 14:27:13','2018-02-26 14:27:13',-1),
(165,'http://localhost:8071/index.html','http://localhost:8071/announcement.html',437,'2018-02-26 14:27:17','2018-02-26 14:34:34',-1),
(166,'http://localhost:8071/news.html','http://localhost:8071/index.html',2,'2018-02-26 14:34:36','2018-02-26 14:34:38',-1),
(167,'http://localhost:8071/index.html','http://localhost:8071/news.html',2554,'2018-02-26 14:38:20','2018-02-26 15:20:54',-1),
(168,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',3,'2018-02-26 15:20:58','2018-02-26 15:21:01',-1),
(169,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',2,'2018-02-26 15:21:04','2018-02-26 15:21:06',-1),
(170,'http://localhost:8071/introduce.html','http://localhost:8071/news.html',1,'2018-02-26 15:21:08','2018-02-26 15:21:09',-1),
(171,'http://localhost:8071/index.html','http://localhost:8071/introduce.html',109,'2018-02-26 15:21:12','2018-02-26 15:23:01',-1),
(172,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',109,'2018-02-26 15:23:04','2018-02-26 15:24:53',-1),
(173,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',117,'2018-02-26 15:25:00','2018-02-26 15:26:57',-1),
(174,'http://localhost:8071/introduce.html','http://localhost:8071/news.html',56,'2018-02-26 15:27:01','2018-02-26 15:27:57',-1),
(175,'http://localhost:8071/announcement.html','http://localhost:8071/introduce.html',0,'2018-02-26 15:28:01','2018-02-26 15:28:01',-1),
(176,'http://localhost:8071/news.html','http://localhost:8071/announcement.html',4,'2018-02-26 15:28:04','2018-02-26 15:28:08',-1),
(177,'http://localhost:8071/guide.html#/','http://localhost:8071/news.html',0,'2018-02-26 15:28:12','2018-02-26 15:28:12',-1),
(178,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',1,'2018-02-26 15:28:15','2018-02-26 15:28:16',-1),
(179,'http://localhost:8071/download.html#/classify','http://localhost:8071/expteaching.html',54,'2018-02-26 15:28:20','2018-02-26 15:29:14',-1),
(180,'http://localhost:8071/index.html','http://localhost:8071/download.html',0,'2018-02-26 15:29:17','2018-02-26 15:29:17',-1),
(181,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',32,'2018-02-26 15:29:19','2018-02-26 15:29:51',-1),
(182,'http://localhost:8071/index.html','http://localhost:8071/introduce.html',12,'2018-02-26 15:29:54','2018-02-26 15:30:06',-1),
(183,'http://localhost:8071/introduce.html','http://localhost:8071/index.html',265,'2018-02-26 15:30:09','2018-02-26 15:34:34',-1),
(184,'http://localhost:8071/guide.html#/','http://localhost:8071/introduce.html',53,'2018-02-26 15:34:39','2018-02-26 15:35:32',-1),
(185,'http://localhost:8071/introduce.html','http://localhost:8071/guide.html',6,'2018-02-26 15:35:35','2018-02-26 15:35:41',-1),
(186,'http://localhost:8071/guide.html#/quality','http://localhost:8071/introduce.html',1,'2018-02-26 15:35:44','2018-02-26 15:35:45',-1),
(187,'http://localhost:8071/introduce.html','http://localhost:8071/guide.html',482,'2018-02-26 15:35:47','2018-02-26 15:43:49',-1),
(188,'http://localhost:8071/introduce.html#/guide.html#/quality','http://localhost:8071/introduce.html',362,'2018-02-26 15:43:54','2018-02-26 15:49:56',-1),
(189,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',222,'2018-02-26 15:51:01','2018-02-26 15:54:43',-1),
(190,'http://localhost:8071/introduce.html#/','http://localhost:8071/news.html',2,'2018-02-26 15:54:47','2018-02-26 15:54:49',-1),
(191,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',1,'2018-02-26 15:54:52','2018-02-26 15:54:53',-1),
(192,'http://localhost:8071/index.html','http://localhost:8071/news.html',2,'2018-02-26 15:54:58','2018-02-26 15:55:00',-1),
(193,'http://localhost:8071/introduce.html#/','http://localhost:8071/index.html',5,'2018-02-26 15:55:02','2018-02-26 15:55:07',-1),
(194,'http://localhost:8071/guide.html#/','http://localhost:8071/introduce.html',2,'2018-02-26 15:55:11','2018-02-26 15:55:13',-1),
(195,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',1,'2018-02-26 15:55:16','2018-02-26 15:55:17',-1),
(196,'http://localhost:8071/news.html','http://localhost:8071/expteaching.html',0,'2018-02-26 15:55:20','2018-02-26 15:55:20',-1),
(197,'http://localhost:8071/introduce.html#/','http://localhost:8071/news.html',1452,'2018-02-26 15:55:24','2018-02-26 16:19:36',-1),
(198,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',1,'2018-02-26 16:19:39','2018-02-26 16:19:40',-1),
(199,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',1,'2018-02-26 16:19:42','2018-02-26 16:19:43',-1),
(200,'http://localhost:8071/guide.html#/','http://localhost:8071/announcement.html',6,'2018-02-26 16:19:45','2018-02-26 16:19:51',-1),
(201,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',1,'2018-02-26 16:19:54','2018-02-26 16:19:55',-1),
(202,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',11,'2018-02-26 16:19:57','2018-02-26 16:20:08',-1),
(203,'http://localhost:8071/coursemanager.html#/','http://localhost:8071/download.html',38,'2018-02-26 16:20:10','2018-02-26 16:20:48',-1),
(204,'http://localhost:8071/announcement.html','http://localhost:8071/coursemanager.html',0,'2018-02-26 16:20:52','2018-02-26 16:20:52',-1),
(205,'http://localhost:8071/introduce.html#/','http://localhost:8071/',1,'2018-02-26 17:03:54','2018-02-26 17:03:55',-1),
(206,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',1,'2018-02-26 17:03:58','2018-02-26 17:03:59',-1),
(207,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',1,'2018-02-26 17:04:03','2018-02-26 17:04:04',-1),
(208,'http://localhost:8071/guide.html#/','http://localhost:8071/announcement.html',1,'2018-02-26 17:04:08','2018-02-26 17:04:09',-1),
(209,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',4,'2018-02-26 17:04:12','2018-02-26 17:04:16',-1),
(210,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',2,'2018-02-26 17:04:18','2018-02-26 17:04:20',-1),
(211,'http://localhost:8071/coursemanager.html#/','http://localhost:8071/download.html',8,'2018-02-26 17:04:23','2018-02-26 17:04:31',-1),
(212,'http://localhost:8071/undefined','http://localhost:8071/coursemanager.html',133,'2018-02-26 17:04:34','2018-02-26 17:06:47',-1),
(213,'http://localhost:8071/coursemanager.html#/','http://localhost:8071/undefined',178,'2018-02-26 17:06:50','2018-02-26 17:09:48',-1),
(214,'http://localhost:8071/index.html','http://localhost:8071/coursemanager.html',1,'2018-02-26 17:09:57','2018-02-26 17:09:58',-1),
(215,'http://localhost:8071/expteaching.html#/','http://localhost:8071/index.html',2,'2018-02-26 17:10:04','2018-02-26 17:10:06',-1),
(216,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',9,'2018-02-26 17:10:12','2018-02-26 17:10:21',-1),
(217,'http://localhost:8071/introduce.html#/','http://localhost:8071/download.html',0,'2018-02-26 17:10:28','2018-02-26 17:10:28',-1),
(218,'http://localhost:8071/news.html','http://localhost:8071/introduce.html',790,'2018-02-26 17:10:57','2018-02-26 17:24:07',-1),
(219,'http://localhost:8071/news.html#/newsList','http://localhost:8071/news.html',12,'2018-02-26 17:24:13','2018-02-26 17:24:25',-1),
(220,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',7,'2018-02-26 17:24:29','2018-02-26 17:24:36',-1),
(221,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',5,'2018-02-26 17:28:11','2018-02-26 17:28:16',-1),
(222,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',7,'2018-02-26 17:28:22','2018-02-26 17:28:29',-1),
(223,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',2,'2018-02-26 17:28:34','2018-02-26 17:28:36',-1),
(224,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',8,'2018-02-26 17:28:41','2018-02-26 17:28:49',-1),
(225,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',5,'2018-02-26 17:28:56','2018-02-26 17:29:01',-1),
(226,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',8,'2018-02-26 17:29:06','2018-02-26 17:29:14',-1),
(227,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',60,'2018-02-26 17:32:14','2018-02-26 17:33:14',-1),
(228,'http://localhost:8071/guide.html#/','http://localhost:8071/news.html',68,'2018-02-26 17:33:20','2018-02-26 17:34:28',-1),
(229,'http://localhost:8071/announcement.html','http://localhost:8071/guide.html',1,'2018-02-26 17:34:34','2018-02-26 17:34:35',-1),
(230,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',1,'2018-02-26 17:34:42','2018-02-26 17:34:43',-1),
(231,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',1,'2018-02-26 17:34:55','2018-02-26 17:34:56',-1),
(232,'http://localhost:8071/newsdetail.html?index=29','http://localhost:8071/news.html',4,'2018-02-26 17:35:02','2018-02-26 17:35:06',-1),
(233,'http://localhost:8071/news.html#/','http://localhost:8071/newsdetail.html?index=29',172,'2018-02-26 17:35:10','2018-02-26 17:38:02',-1),
(234,'http://localhost:8071/announcement.html','http://localhost:8071/news.html',7,'2018-02-26 17:38:08','2018-02-26 17:38:15',-1),
(235,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',1,'2018-02-26 17:38:19','2018-02-26 17:38:20',-1),
(236,'http://localhost:8071/announcement.html#/','http://localhost:8071/announcement.html',602,'2018-02-26 17:42:44','2018-02-26 17:52:46',-1),
(237,'http://localhost:8071/announcement.html#/','http://localhost:8071/announcement.html',251,'2018-02-26 17:52:54','2018-02-26 17:57:05',-1),
(238,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',1,'2018-02-26 17:57:09','2018-02-26 17:57:10',-1),
(239,'http://localhost:8071/announcement.html#/announcementList','http://localhost:8071/news.html',74,'2018-02-26 17:57:15','2018-02-26 17:58:29',-1),
(240,'http://localhost:8071/announcementdetail.html?index=1','http://localhost:8071/announcement.html',3,'2018-02-26 17:58:33','2018-02-26 17:58:36',-1),
(241,'http://localhost:8071/announcementdetail.html?index=2','http://localhost:8071/announcementdetail.html?index=1',1,'2018-02-26 17:58:39','2018-02-26 17:58:40',-1),
(242,'http://localhost:8071/announcementdetail.html?index=4','http://localhost:8071/announcementdetail.html?index=2',0,'2018-02-26 17:58:43','2018-02-26 17:58:43',-1),
(243,'http://localhost:8071/announcementdetail.html?index=2','http://localhost:8071/announcementdetail.html?index=4',1,'2018-02-26 17:58:47','2018-02-26 17:58:48',-1),
(244,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',1,'2018-02-26 18:00:33','2018-02-26 18:00:34',-1),
(245,'http://localhost:8071/announcement.html#/','http://localhost:8071/news.html',3,'2018-02-26 18:00:38','2018-02-26 18:00:41',-1),
(246,'http://localhost:8071/guide.html#/','http://localhost:8071/announcement.html',1,'2018-02-26 18:00:45','2018-02-26 18:00:46',-1),
(247,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',1,'2018-02-26 18:00:50','2018-02-26 18:00:51',-1),
(248,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',3,'2018-02-26 18:00:56','2018-02-26 18:00:59',-1),
(249,'http://localhost:8071/undefined','http://localhost:8071/download.html',9,'2018-02-26 18:01:03','2018-02-26 18:01:12',-1),
(250,'http://localhost:8071/introduce.html#/','http://localhost:8071/undefined',1,'2018-02-26 18:01:16','2018-02-26 18:01:17',-1),
(251,'http://localhost:8071/index.html','http://localhost:8071/introduce.html',11,'2018-02-26 18:01:21','2018-02-26 18:01:32',-1),
(252,'http://localhost:8071/introduce.html#/','http://localhost:8071/index.html',1,'2018-02-26 18:01:35','2018-02-26 18:01:36',-1),
(253,'http://localhost:8071/news.html#/','http://localhost:8071/introduce.html',0,'2018-02-26 18:01:40','2018-02-26 18:01:40',-1),
(254,'http://localhost:8071/announcement.html#/announcementList','http://localhost:8071/news.html',3,'2018-02-26 18:01:42','2018-02-26 18:01:45',-1),
(255,'http://localhost:8071/guide.html#/','http://localhost:8071/announcement.html',2,'2018-02-26 18:01:47','2018-02-26 18:01:49',-1),
(256,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',4025,'2018-02-26 18:03:40','2018-02-26 19:10:45',-1),
(257,'http://localhost:8071/announcement.html#/','http://localhost:8071/expteaching.html',2,'2018-02-26 19:10:48','2018-02-26 19:10:50',-1),
(258,'http://localhost:8071/guide.html#/','http://localhost:8071/announcement.html',1,'2018-02-26 19:10:52','2018-02-26 19:10:53',-1),
(259,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',4383,'2018-02-26 19:10:59','2018-02-26 20:24:02',-1),
(260,'http://localhost:8071/index.html','http://localhost:8071/expteaching.html',1,'2018-02-26 20:24:05','2018-02-26 20:24:06',-1),
(261,'http://localhost:8071/introduce.html#/','http://localhost:8071/index.html',2,'2018-02-26 20:24:07','2018-02-26 20:24:09',-1),
(262,'http://localhost:8071/news.html#/','http://localhost:8071/introduce.html',38,'2018-02-26 20:24:12','2018-02-26 20:24:50',-1),
(263,'http://localhost:8071/announcement.html#/','http://localhost:8071/news.html',9,'2018-02-26 20:24:52','2018-02-26 20:25:01',-1),
(264,'http://localhost:8071/guide.html#/','http://localhost:8071/announcement.html',4,'2018-02-26 20:25:03','2018-02-26 20:25:07',-1),
(265,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',1,'2018-02-26 20:25:09','2018-02-26 20:25:10',-1),
(266,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',11,'2018-02-26 20:25:12','2018-02-26 20:25:23',-1),
(267,'http://localhost:8071/expteaching.html#/apple','http://localhost:8071/download.html',858,'2018-02-26 20:25:26','2018-02-26 20:39:44',-1),
(268,'http://localhost:8071/guide.html#/','http://localhost:8071/expteaching.html',1,'2018-02-26 20:39:45','2018-02-26 20:39:46',-1),
(269,'http://localhost:8071/expteaching.html#/testing','http://localhost:8071/guide.html',999,'2018-02-26 20:39:50','2018-02-26 20:56:29',-1),
(270,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',0,'2018-02-26 20:56:32','2018-02-26 20:56:32',-1),
(271,'http://localhost:8071/expteaching.html#/','http://localhost:8071/download.html',0,'2018-02-26 20:56:34','2018-02-26 20:56:34',-1),
(272,'http://localhost:8071/guide.html#/','http://localhost:8071/expteaching.html',0,'2018-02-26 20:56:37','2018-02-26 20:56:37',-1),
(273,'http://localhost:8071/announcement.html#/','http://localhost:8071/guide.html',1,'2018-02-26 20:56:40','2018-02-26 20:56:41',-1),
(274,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',0,'2018-02-26 20:56:43','2018-02-26 20:56:43',-1),
(275,'http://localhost:8071/announcement.html#/','http://localhost:8071/news.html',1,'2018-02-26 20:56:45','2018-02-26 20:56:46',-1),
(276,'http://localhost:8071/expteaching.html#/testing','http://localhost:8071/announcement.html',159,'2018-02-26 20:56:48','2018-02-26 20:59:27',-1),
(277,'http://localhost:8071/expteaching.html#/testing','http://localhost:8071/announcement.html',159,'2018-02-26 20:56:48','2018-02-26 20:59:27',-1),
(278,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',4,'2018-02-26 20:59:31','2018-02-26 20:59:35',-1),
(279,'http://localhost:8071/undefined','http://localhost:8071/download.html',2,'2018-02-26 20:59:38','2018-02-26 20:59:40',-1),
(280,'http://localhost:8071/guide.html#/','http://localhost:8071/undefined',1669,'2018-02-26 21:18:43','2018-02-26 21:46:32',-1),
(281,'http://localhost:8071/announcement.html#/','http://localhost:8071/guide.html',1,'2018-02-26 21:46:35','2018-02-26 21:46:36',-1),
(282,'http://localhost:8071/expteaching.html#/','http://localhost:8071/announcement.html',3,'2018-02-26 21:53:27','2018-02-26 21:53:30',-1),
(283,'http://localhost:8071/undefined','http://localhost:8071/expteaching.html',5,'2018-02-26 21:53:34','2018-02-26 21:53:39',-1),
(284,'http://localhost:8071/expteaching.html#/','http://localhost:8071/undefined',26,'2018-02-26 21:53:42','2018-02-26 21:54:08',-1),
(285,'http://localhost:8071/index.html','http://localhost:8071/expteaching.html',0,'2018-02-26 21:54:11','2018-02-26 21:54:11',-1),
(286,'http://localhost:8071/announcement.html#/','http://localhost:8071/index.html',0,'2018-02-26 21:54:14','2018-02-26 21:54:14',-1),
(287,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',0,'2018-02-26 21:54:17','2018-02-26 21:54:17',-1),
(288,'http://localhost:8071/guide.html#/','http://localhost:8071/news.html',0,'2018-02-26 21:54:19','2018-02-26 21:54:19',-1),
(289,'http://localhost:8071/expteaching.html#/','http://localhost:8071/guide.html',0,'2018-02-26 21:54:21','2018-02-26 21:54:21',-1),
(290,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',5,'2018-02-26 21:54:25','2018-02-26 21:54:30',-1),
(291,'http://localhost:8071/undefined','http://localhost:8071/download.html',2,'2018-02-26 21:54:31','2018-02-26 21:54:33',-1),
(292,'http://localhost:8071/expteaching.html#/other','http://localhost:8071/undefined',132,'2018-02-26 21:54:36','2018-02-26 21:56:48',-1),
(293,'http://localhost:8071/introduce.html#/','http://localhost:8071/expteaching.html',22,'2018-02-26 21:56:51','2018-02-26 21:57:13',-1),
(294,'http://localhost:8071/download.html#/','http://localhost:8071/introduce.html',3,'2018-02-26 21:57:15','2018-02-26 21:57:18',-1),
(295,'http://localhost:8071/expteaching.html#/','http://localhost:8071/download.html',149,'2018-02-26 21:57:21','2018-02-26 21:59:50',-1),
(296,'http://localhost:8071/download.html#/classify','http://localhost:8071/expteaching.html',18,'2018-02-26 21:59:53','2018-02-26 22:00:11',-1),
(297,'http://localhost:8071/announcement.html#/','http://localhost:8071/download.html',1,'2018-02-26 22:00:13','2018-02-26 22:00:14',-1),
(298,'http://localhost:8071/download.html#/','http://localhost:8071/announcement.html',6,'2018-02-26 22:00:16','2018-02-26 22:00:22',-1),
(299,'http://localhost:8071/expteaching.html#/','http://localhost:8071/download.html',27,'2018-02-26 22:00:25','2018-02-26 22:00:52',-1),
(300,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',0,'2018-02-26 22:00:55','2018-02-26 22:00:55',-1),
(301,'http://localhost:8071/expteaching.html#/apple','http://localhost:8071/download.html',1211,'2018-02-26 22:01:02','2018-02-26 22:21:13',-1),
(302,'http://localhost:8071/expteaching.html#/colony','http://localhost:8071/expteaching.html',744,'2018-02-26 22:21:16','2018-02-26 22:33:40',-1),
(303,'http://localhost:8071/expteaching.html#/apple','http://localhost:8071/expteaching.html',1159,'2018-02-26 22:33:47','2018-02-26 22:53:06',-1),
(304,'http://localhost:8071/guide.html#/workflow','http://localhost:8071/expteaching.html',341,'2018-02-26 22:53:09','2018-02-26 22:58:50',-1),
(305,'http://localhost:8071/announcement.html#/','http://localhost:8071/guide.html',1,'2018-02-26 22:58:54','2018-02-26 22:58:55',-1),
(306,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',0,'2018-02-26 22:58:58','2018-02-26 22:58:58',-1),
(307,'http://localhost:8071/download.html#/','http://localhost:8071/news.html',1,'2018-02-26 22:59:02','2018-02-26 22:59:03',-1),
(308,'http://localhost:8071/expteaching.html#/','http://localhost:8071/download.html',1,'2018-02-26 22:59:04','2018-02-26 22:59:05',-1),
(309,'http://localhost:8071/guide.html#/','http://localhost:8071/expteaching.html',0,'2018-02-26 22:59:09','2018-02-26 22:59:09',-1),
(310,'http://localhost:8071/announcement.html#/','http://localhost:8071/guide.html',1,'2018-02-26 22:59:12','2018-02-26 22:59:13',-1),
(311,'http://localhost:8071/news.html#/','http://localhost:8071/announcement.html',111,'2018-02-26 22:59:17','2018-02-26 23:01:08',-1),
(312,'http://localhost:8071/guide.html#/quality','http://localhost:8071/news.html',46,'2018-02-26 23:01:10','2018-02-26 23:01:56',-1),
(313,'http://localhost:8071/announcement.html#/','http://localhost:8071/guide.html',4,'2018-02-26 23:01:59','2018-02-26 23:02:03',-1),
(314,'http://localhost:8071/undefined','http://localhost:8071/announcement.html',14,'2018-02-26 23:02:06','2018-02-26 23:02:20',-1),
(315,'http://localhost:8071/expteaching.html#/','http://localhost:8071/undefined',0,'2018-02-26 23:02:23','2018-02-26 23:02:23',-1),
(316,'http://localhost:8071/expteaching.html#/','http://localhost:8071/',4,'2018-02-26 23:16:29','2018-02-26 23:16:33',-1),
(317,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',171,'2018-02-26 23:16:36','2018-02-26 23:19:27',-1),
(318,'http://localhost:8071/download.html#/','http://localhost:8071/download.html',390,'2018-02-26 23:20:14','2018-02-26 23:26:44',-1),
(319,'http://localhost:8071/expteaching.html#/other','http://localhost:8071/download.html',182,'2018-02-26 23:26:50','2018-02-26 23:29:52',-1),
(320,'http://localhost:8071/guide.html#/','http://localhost:8071/expteaching.html',0,'2018-02-26 23:29:54','2018-02-26 23:29:54',-1),
(321,'http://localhost:8071/expteaching.html#/','http://localhost:8071/download.html',1,'2018-02-26 23:33:02','2018-02-26 23:33:03',-1),
(322,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',191,'2018-02-26 23:33:17','2018-02-26 23:36:28',-1),
(323,'http://localhost:8071/expteaching.html#/','http://localhost:8071/download.html',1,'2018-02-26 23:36:32','2018-02-26 23:36:33',-1),
(324,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',734,'2018-02-26 23:36:36','2018-02-26 23:48:50',-1),
(325,'http://localhost:8071/download.html#/','http://localhost:8071/expteaching.html',848,'2018-02-26 23:36:36','2018-02-26 23:50:44',-1),
(326,'http://localhost:8071/coursemanager.html#/','http://localhost:8071/download.html',852,'2018-02-26 23:51:01','2018-02-27 00:05:13',-1),
(327,'http://localhost:8071/news.html#/','http://localhost:8071/coursemanager.html',3,'2018-02-27 00:05:15','2018-02-27 00:05:18',-1),
(328,'http://localhost:8071/announcement.html#/','http://localhost:8071/news.html',32,'2018-02-27 00:05:21','2018-02-27 00:05:53',-1),
(329,'http://localhost:8080/guide.html#/server','http://localhost:8080/',7,'2018-02-27 03:33:42','2018-02-27 03:33:49',-1),
(330,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/guide.html',1,'2018-02-27 03:33:53','2018-02-27 03:33:54',-1),
(331,'http://localhost:8080/news.html#/','http://localhost:8080/coursemanager.html',1547,'2018-02-27 03:40:56','2018-02-27 04:06:43',-1),
(332,'http://localhost:8080/news.html#/','http://localhost:8080/coursemanager.html',1153,'2018-02-27 04:06:48','2018-02-27 04:26:01',-1),
(333,'http://localhost:8080/news.html#/','http://localhost:8080/coursemanager.html',2954,'2018-02-27 06:39:10','2018-02-27 07:28:24',-1),
(334,'http://localhost:8080/newsdetail.html?index=27','http://localhost:8080/news.html',42,'2018-02-27 07:28:27','2018-02-27 07:29:09',-1),
(335,'http://localhost:8080/news.html#/','http://localhost:8080/newsdetail.html?index=27',436,'2018-02-27 07:29:11','2018-02-27 07:36:27',-1),
(336,'http://localhost:8080/news.html#/','http://localhost:8080/news.html',34,'2018-02-27 07:36:31','2018-02-27 07:37:05',-1),
(337,'http://localhost:8080/newsdetail.html?index=28','http://localhost:8080/news.html',1,'2018-02-27 07:37:08','2018-02-27 07:37:09',-1),
(338,'http://localhost:8080/news.html#/newsList','http://localhost:8080/news.html',109,'2018-02-27 07:37:11','2018-02-27 07:39:00',-1),
(339,'http://localhost:8080/introduce.html#/','http://localhost:8080/news.html',3,'2018-02-27 07:39:04','2018-02-27 07:39:07',-1),
(340,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',7,'2018-02-27 07:39:09','2018-02-27 07:39:16',-1),
(341,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',1,'2018-02-27 07:39:20','2018-02-27 07:39:21',-1),
(342,'http://localhost:8080/news.html#/','http://localhost:8080/announcement.html',8,'2018-02-27 07:39:23','2018-02-27 07:39:31',-1),
(343,'http://localhost:8080/index.html','http://localhost:8080/news.html',2,'2018-02-27 07:39:34','2018-02-27 07:39:36',-1),
(344,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',4,'2018-02-27 07:39:39','2018-02-27 07:39:43',-1),
(345,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',14,'2018-02-27 07:39:45','2018-02-27 07:39:59',-1),
(346,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',4,'2018-02-27 07:40:02','2018-02-27 07:40:06',-1),
(347,'http://localhost:8080/guide.html#/','http://localhost:8080/announcement.html',10,'2018-02-27 07:40:08','2018-02-27 07:40:18',-1),
(348,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',1,'2018-02-27 07:40:21','2018-02-27 07:40:22',-1),
(349,'http://localhost:8080/download.html#/','http://localhost:8080/expteaching.html',2,'2018-02-27 07:40:25','2018-02-27 07:40:27',-1),
(350,'http://localhost:8080/guide.html#/','http://localhost:8080/download.html',0,'2018-02-27 07:40:30','2018-02-27 07:40:30',-1),
(351,'http://localhost:8080/announcement.html#/','http://localhost:8080/guide.html',1,'2018-02-27 07:40:33','2018-02-27 07:40:34',-1),
(352,'http://localhost:8080/news.html#/','http://localhost:8080/announcement.html',309,'2018-02-27 07:40:36','2018-02-27 07:45:45',-1),
(353,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',217,'2018-02-27 07:45:50','2018-02-27 07:49:27',-1),
(354,'http://localhost:8080/announcementdetail.html?index=4','http://localhost:8080/announcement.html',2,'2018-02-27 07:49:30','2018-02-27 07:49:32',-1),
(355,'http://localhost:8080/announcement.html#/','http://localhost:8080/announcementdetail.html?index=4',10,'2018-02-27 07:49:35','2018-02-27 07:49:45',-1),
(356,'http://localhost:8080/news.html#/','http://localhost:8080/announcement.html',1,'2018-02-27 07:49:48','2018-02-27 07:49:49',-1),
(357,'http://localhost:8080/newsdetail.html?index=28','http://localhost:8080/news.html',317,'2018-02-27 07:50:07','2018-02-27 07:55:24',-1),
(358,'http://localhost:8080/news.html#/','http://localhost:8080/newsdetail.html?index=28',65,'2018-02-27 07:55:27','2018-02-27 07:56:32',-1),
(359,'http://localhost:8080/newsdetail.html?index=29','http://localhost:8080/news.html',53,'2018-02-27 07:56:34','2018-02-27 07:57:27',-1),
(360,'http://localhost:8080/news.html#/','http://localhost:8080/newsdetail.html?index=29',1,'2018-02-27 07:57:30','2018-02-27 07:57:31',-1),
(361,'http://localhost:8080/newsdetail.html?index=29','http://localhost:8080/news.html',1,'2018-02-27 07:57:34','2018-02-27 07:57:35',-1),
(362,'http://localhost:8080/news.html#/','http://localhost:8080/newsdetail.html?index=29',139,'2018-02-27 07:57:37','2018-02-27 07:59:56',-1),
(363,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',59,'2018-02-27 08:00:08','2018-02-27 08:01:07',-1),
(364,'http://localhost:8080/announcementdetail.html?index=6','http://localhost:8080/announcement.html',3,'2018-02-27 08:01:11','2018-02-27 08:01:14',-1),
(365,'http://localhost:8080/introduce.html#/','http://localhost:8080/announcement.html',2,'2018-02-27 08:02:35','2018-02-27 08:02:37',-1),
(366,'http://localhost:8080/index.html','http://localhost:8080/introduce.html',11,'2018-02-27 08:02:39','2018-02-27 08:02:50',-1),
(367,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',1,'2018-02-27 08:02:52','2018-02-27 08:02:53',-1),
(368,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',1,'2018-02-27 08:02:56','2018-02-27 08:02:57',-1),
(369,'http://localhost:8080/newsdetail.html?index=27','http://localhost:8080/news.html',3,'2018-02-27 08:03:00','2018-02-27 08:03:03',-1),
(370,'http://localhost:8080/announcement.html#/','http://localhost:8080/newsdetail.html?index=27',371,'2018-02-27 08:03:04','2018-02-27 08:09:15',-1),
(371,'http://localhost:8090/cec/introduce.html#/','http://localhost:8090/cec/',1,'2018-02-27 18:01:28','2018-02-27 18:01:29',-1),
(372,'http://localhost:8090/cec/news.html#/','http://localhost:8090/cec/introduce.html',1,'2018-02-27 18:01:30','2018-02-27 18:01:31',-1),
(373,'http://localhost:8090/cec/announcement.html#/','http://localhost:8090/cec/news.html',0,'2018-02-27 18:01:32','2018-02-27 18:01:32',-1),
(374,'http://localhost:8090/cec/guide.html#/','http://localhost:8090/cec/announcement.html',0,'2018-02-27 18:01:34','2018-02-27 18:01:34',-1),
(375,'http://localhost:8090/cec/expteaching.html#/','http://localhost:8090/cec/guide.html',0,'2018-02-27 18:01:35','2018-02-27 18:01:35',-1),
(376,'http://localhost:8090/cec/download.html#/','http://localhost:8090/cec/expteaching.html',1,'2018-02-27 18:01:36','2018-02-27 18:01:37',-1),
(377,'http://localhost:8090/cec/','',0,'2018-03-04 07:19:43','2018-03-04 07:19:43',-1),
(378,'http://localhost:8090/cec/introduce.html#/','http://localhost:8090/cec/',1,'2018-03-04 07:19:45','2018-03-04 07:19:46',-1),
(379,'http://localhost:8090/cec/news.html#/','http://localhost:8090/cec/introduce.html',0,'2018-03-04 07:19:47','2018-03-04 07:19:47',-1),
(380,'http://localhost:8090/cec/announcement.html#/','http://localhost:8090/cec/news.html',0,'2018-03-04 07:19:49','2018-03-04 07:19:49',-1),
(381,'http://localhost:8090/cec/guide.html#/','http://localhost:8090/cec/announcement.html',1,'2018-03-04 07:19:50','2018-03-04 07:19:51',-1),
(382,'http://localhost:8090/cec/announcement.html#/','http://localhost:8090/cec/guide.html',1,'2018-03-04 07:19:52','2018-03-04 07:19:53',-1),
(383,'http://localhost:8090/cec/news.html#/','http://localhost:8090/cec/announcement.html',1,'2018-03-04 07:19:54','2018-03-04 07:19:55',-1),
(384,'http://localhost:8090/cec/guide.html#/server','http://localhost:8090/cec/news.html',4,'2018-03-04 07:19:56','2018-03-04 07:20:00',-1),
(385,'http://localhost:8090/cec/expteaching.html#/other','http://localhost:8090/cec/guide.html',4,'2018-03-04 07:20:01','2018-03-04 07:20:05',-1),
(386,'http://localhost:8090/cec/coursemanager.html#/','http://localhost:8090/cec/expteaching.html',1,'2018-03-04 07:20:06','2018-03-04 07:20:07',-1),
(387,'http://localhost:8090/cec/introduce.html#/','http://localhost:8090/cec/download.html',0,'2018-03-04 07:20:51','2018-03-04 07:20:51',-1),
(388,'http://localhost:8090/cec/news.html#/','http://localhost:8090/cec/introduce.html',1,'2018-03-04 07:20:53','2018-03-04 07:20:54',-1),
(389,'http://localhost:8090/cec/announcement.html#/','http://localhost:8090/cec/news.html',1,'2018-03-04 07:20:55','2018-03-04 07:20:56',-1),
(390,'http://localhost:8090/cec/guide.html#/','http://localhost:8090/cec/announcement.html',14,'2018-03-04 07:20:57','2018-03-04 07:21:11',-1),
(391,'http://localhost:8090/cec/index.html','http://localhost:8090/cec/guide.html',0,'2018-03-04 07:21:32','2018-03-04 07:21:32',-1),
(392,'http://localhost:8090/cec/index.html','http://localhost:8090/cec/guide.html',1,'2018-03-04 07:21:38','2018-03-04 07:21:39',-1),
(393,'http://localhost:8090/cec/index.html','http://localhost:8090/cec/guide.html',1,'2018-03-04 07:21:44','2018-03-04 07:21:45',-1),
(394,'http://localhost:8090/cec/index.html','http://localhost:8090/cec/guide.html',2,'2018-03-04 07:21:52','2018-03-04 07:21:54',-1),
(395,'http://localhost:8090/cec/index.html','http://localhost:8090/cec/guide.html',1,'2018-03-04 07:21:59','2018-03-04 07:22:00',-1),
(396,'http://localhost:8090/cec/index.html','http://localhost:8090/cec/guide.html',4,'2018-03-04 07:22:06','2018-03-04 07:22:10',-1),
(397,'http://localhost:8090/cec/expteaching.html#/','http://localhost:8090/cec/guide.html',0,'2018-03-04 07:24:57','2018-03-04 07:24:57',-1),
(398,'http://localhost:8090/cec/index.html','http://localhost:8090/cec/expteaching.html',0,'2018-03-04 07:24:58','2018-03-04 07:24:58',-1),
(399,'http://localhost:8090/cec/introduce.html#/','http://localhost:8090/cec/index.html',0,'2018-03-04 07:24:59','2018-03-04 07:24:59',-1),
(400,'http://localhost:8080/introduce.html#/','http://localhost:8080/',52,'2018-03-04 07:29:39','2018-03-04 07:30:31',-1),
(401,'http://localhost:8080/introduce.html#/','http://localhost:8080/introduce.html',1,'2018-03-04 07:30:34','2018-03-04 07:30:35',-1),
(402,'http://localhost:8080/index.html','http://localhost:8080/introduce.html',2,'2018-03-04 07:30:38','2018-03-04 07:30:40',-1),
(403,'http://localhost:8080/news.html#/','http://localhost:8080/index.html',8,'2018-03-04 07:30:44','2018-03-04 07:30:52',-1),
(404,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',2,'2018-03-04 07:30:55','2018-03-04 07:30:57',-1),
(405,'http://localhost:8080/guide.html#/','http://localhost:8080/announcement.html',1,'2018-03-04 07:31:00','2018-03-04 07:31:01',-1),
(406,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',3,'2018-03-04 07:31:04','2018-03-04 07:31:07',-1),
(407,'http://localhost:8080/download.html#/','http://localhost:8080/expteaching.html',6,'2018-03-04 07:31:10','2018-03-04 07:31:16',-1),
(408,'http://localhost:8080/index.html','http://localhost:8080/download.html',11,'2018-03-04 07:31:18','2018-03-04 07:31:29',-1),
(409,'http://localhost:8080/newsdetail.html?index=29','http://localhost:8080/index.html',28,'2018-03-04 07:31:32','2018-03-04 07:32:00',-1),
(410,'http://localhost:8080/index.html','http://localhost:8080/newsdetail.html?index=29',45,'2018-03-04 07:32:04','2018-03-04 07:32:49',-1),
(411,'http://localhost:8080/guide.html#/workflow','http://localhost:8080/',77,'2018-03-04 07:42:11','2018-03-04 07:43:28',-1),
(412,'http://localhost:8080/index.html','http://localhost:8080/guide.html',3,'2018-03-04 07:43:35','2018-03-04 07:43:38',-1),
(413,'http://localhost:8080/guide.html#/rules','http://localhost:8080/index.html',3,'2018-03-04 07:43:44','2018-03-04 07:43:47',-1),
(414,'http://localhost:8080/index.html','http://localhost:8080/guide.html',0,'2018-03-04 07:43:53','2018-03-04 07:43:53',-1),
(415,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',19,'2018-03-04 07:43:59','2018-03-04 07:44:18',-1),
(416,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',1,'2018-03-04 07:44:25','2018-03-04 07:44:26',-1),
(417,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',14,'2018-03-04 07:44:34','2018-03-04 07:44:48',-1),
(418,'http://localhost:8080/guide.html#/','http://localhost:8080/announcement.html',2,'2018-03-04 07:44:54','2018-03-04 07:44:56',-1),
(419,'http://localhost:8080/introduce.html#/','http://localhost:8080/guide.html',5,'2018-03-04 07:45:04','2018-03-04 07:45:09',-1),
(420,'http://localhost:8080/index.html','http://localhost:8080/introduce.html',112,'2018-03-04 07:45:15','2018-03-04 07:47:07',-1),
(421,'http://localhost:8080/news.html#/','http://localhost:8080/index.html',2,'2018-03-04 07:47:09','2018-03-04 07:47:11',-1),
(422,'http://localhost:8080/index.html','http://localhost:8080/introduce.html',744,'2018-03-04 07:47:12','2018-03-04 07:59:36',-1),
(423,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',1,'2018-03-04 07:59:40','2018-03-04 07:59:41',-1),
(424,'http://localhost:8080/index.html','http://localhost:8080/introduce.html',1000,'2018-03-04 08:00:03','2018-03-04 08:16:43',-1),
(425,'http://localhost:8080/index.html','http://localhost:8080/introduce.html',859,'2018-03-04 08:16:48','2018-03-04 08:31:07',-1),
(426,'http://localhost:8080/news.html#/','http://localhost:8080/index.html',0,'2018-03-04 08:31:11','2018-03-04 08:31:11',-1),
(427,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',1,'2018-03-04 08:31:13','2018-03-04 08:31:14',-1),
(428,'http://localhost:8080/news.html#/','http://localhost:8080/announcement.html',2,'2018-03-04 08:31:17','2018-03-04 08:31:19',-1),
(429,'http://localhost:8080/newsdetail.html?index=29','http://localhost:8080/news.html',6,'2018-03-04 08:31:22','2018-03-04 08:31:28',-1),
(430,'http://localhost:8080/news.html#/','http://localhost:8080/news.html',88,'2018-03-04 08:31:30','2018-03-04 08:32:58',-1),
(431,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',0,'2018-03-04 08:33:02','2018-03-04 08:33:02',-1),
(432,'http://localhost:8080/guide.html#/','http://localhost:8080/announcement.html',0,'2018-03-04 08:33:06','2018-03-04 08:33:06',-1),
(433,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',1,'2018-03-04 08:33:07','2018-03-04 08:33:08',-1),
(434,'http://localhost:8080/index.html','http://localhost:8080/expteaching.html',2610,'2018-03-04 08:33:23','2018-03-04 09:16:53',-1),
(435,'http://localhost:8080/index.html','http://localhost:8080/index.html',377,'2018-03-04 09:16:58','2018-03-04 09:23:15',-1),
(436,'http://localhost:8080/newsdetail.html?index=1','http://localhost:8080/index.html',161,'2018-03-04 09:23:52','2018-03-04 09:26:33',-1),
(437,'http://localhost:8080/newsdetail.html?index=undefined','http://localhost:8080/index.html',48,'2018-03-04 09:27:00','2018-03-04 09:27:48',-1),
(438,'http://localhost:8080/index.html','http://localhost:8080/newsdetail.html?index=undefined',80,'2018-03-04 09:27:54','2018-03-04 09:29:14',-1),
(439,'http://localhost:8080/index.html','http://localhost:8080/index.html',0,'2018-03-04 09:29:18','2018-03-04 09:29:18',-1),
(440,'http://localhost:8080/newsdetail.html?index=1','http://localhost:8080/index.html',2,'2018-03-04 09:29:20','2018-03-04 09:29:22',-1),
(441,'http://localhost:8080/index.html','http://localhost:8080/index.html',2,'2018-03-04 09:29:26','2018-03-04 09:29:28',-1),
(442,'http://localhost:8080/newsdetail.html?index=28','http://localhost:8080/index.html',2,'2018-03-04 09:29:32','2018-03-04 09:29:34',-1),
(443,'http://localhost:8080/index.html','http://localhost:8080/newsdetail.html?index=1',356,'2018-03-04 09:29:37','2018-03-04 09:35:33',-1),
(444,'http://localhost:8080/index.html','http://localhost:8080/newsdetail.html?index=1',3,'2018-03-04 09:35:39','2018-03-04 09:35:42',-1),
(445,'http://localhost:8080/28','http://localhost:8080/index.html',89,'2018-03-04 09:35:43','2018-03-04 09:37:12',-1),
(446,'http://localhost:8080/cec/newsdetail.html?index=28','http://localhost:8080/28',32,'2018-03-04 09:37:16','2018-03-04 09:37:48',-1),
(447,'http://localhost:8080/cec/newsdetail.html?index=28','http://localhost:8080/28',1,'2018-03-04 09:37:52','2018-03-04 09:37:53',-1),
(448,'http://localhost:8080/cec/index.html','http://localhost:8080/cec/newsdetail.html?index=28',12,'2018-03-04 09:37:56','2018-03-04 09:38:08',-1),
(449,'http://localhost:8080/cec/index.html','http://localhost:8080/cec/index.html',1,'2018-03-04 09:38:12','2018-03-04 09:38:13',-1),
(450,'http://localhost:8080/newsdetail.html?index=1','http://localhost:8080/cec/index.html',118,'2018-03-04 09:38:18','2018-03-04 09:40:16',-1),
(451,'http://localhost:8080/introduce.html#/','http://localhost:8080/',1,'2018-03-05 07:14:12','2018-03-05 07:14:13',-1),
(452,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',1,'2018-03-05 07:14:15','2018-03-05 07:14:16',-1),
(453,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',1,'2018-03-05 07:14:18','2018-03-05 07:14:19',-1),
(454,'http://localhost:8080/guide.html#/','http://localhost:8080/announcement.html',1,'2018-03-05 07:14:22','2018-03-05 07:14:23',-1),
(455,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',1,'2018-03-05 07:14:26','2018-03-05 07:14:27',-1),
(456,'http://localhost:8080/download.html#/','http://localhost:8080/expteaching.html',1,'2018-03-05 07:14:29','2018-03-05 07:14:30',-1),
(457,'http://localhost:8080/index.html','http://localhost:8080/download.html',0,'2018-03-05 07:14:32','2018-03-05 07:14:32',-1),
(458,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',0,'2018-03-05 07:14:35','2018-03-05 07:14:35',-1),
(459,'http://localhost:8080/index.html','http://localhost:8080/introduce.html',9,'2018-03-05 07:14:37','2018-03-05 07:14:46',-1),
(460,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',1,'2018-03-05 07:14:49','2018-03-05 07:14:50',-1),
(461,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',1,'2018-03-05 07:14:53','2018-03-05 07:14:54',-1),
(462,'http://localhost:8080/guide.html#/','http://localhost:8080/news.html',0,'2018-03-05 07:14:56','2018-03-05 07:14:56',-1),
(463,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',0,'2018-03-05 07:14:58','2018-03-05 07:14:58',-1),
(464,'http://localhost:8080/download.html#/','http://localhost:8080/expteaching.html',2,'2018-03-05 07:15:01','2018-03-05 07:15:03',-1),
(465,'http://localhost:8080/expteaching.html#/','http://localhost:8080/download.html',3,'2018-03-05 07:15:05','2018-03-05 07:15:08',-1),
(466,'http://localhost:8080/news.html#/','http://localhost:8080/expteaching.html',1,'2018-03-05 07:15:11','2018-03-05 07:15:12',-1),
(467,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',0,'2018-03-05 07:15:14','2018-03-05 07:15:14',-1),
(468,'http://localhost:8080/introduce.html#/','http://localhost:8080/announcement.html',0,'2018-03-05 07:15:16','2018-03-05 07:15:16',-1),
(469,'http://localhost:8080/index.html','http://localhost:8080/introduce.html',20,'2018-03-05 07:15:19','2018-03-05 07:15:39',-1),
(470,'http://localhost:8080/newsdetail.html?index=26','http://localhost:8080/index.html',7,'2018-03-05 07:15:42','2018-03-05 07:15:49',-1),
(471,'http://localhost:8080/introduce.html#/','http://localhost:8080/newsdetail.html?index=26',4,'2018-03-05 07:15:52','2018-03-05 07:15:56',-1),
(472,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',7,'2018-03-05 07:16:00','2018-03-05 07:16:07',-1),
(473,'http://localhost:8080/index.html','http://localhost:8080/news.html',603,'2018-03-05 07:16:09','2018-03-05 07:26:12',-1),
(474,'http://localhost:8080/index.html','http://localhost:8080/index.html',635,'2018-03-05 07:26:22','2018-03-05 07:36:57',-1),
(475,'http://localhost:8080/index.html','http://localhost:8080/index.html',72,'2018-03-05 07:37:00','2018-03-05 07:38:12',-1),
(476,'http://localhost:8080/index.html','http://localhost:8080/index.html',55,'2018-03-05 07:38:17','2018-03-05 07:39:12',-1),
(477,'http://localhost:8080/index.html','http://localhost:8080/index.html',219,'2018-03-05 07:39:22','2018-03-05 07:43:01',-1),
(478,'http://localhost:8080/index.html','http://localhost:8080/index.html',39,'2018-03-05 07:43:05','2018-03-05 07:43:44',-1),
(479,'http://localhost:8080/index.html','http://localhost:8080/index.html',399,'2018-03-05 07:43:46','2018-03-05 07:50:25',-1),
(480,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',0,'2018-03-05 07:50:29','2018-03-05 07:50:29',-1),
(481,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',0,'2018-03-05 07:50:32','2018-03-05 07:50:32',-1),
(482,'http://localhost:8080/guide.html#/','http://localhost:8080/news.html',1,'2018-03-05 07:50:35','2018-03-05 07:50:36',-1),
(483,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',3,'2018-03-05 07:50:40','2018-03-05 07:50:43',-1),
(484,'http://localhost:8080/download.html#/','http://localhost:8080/expteaching.html',3,'2018-03-05 07:50:45','2018-03-05 07:50:48',-1),
(485,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/download.html',1,'2018-03-05 07:50:50','2018-03-05 07:50:51',-1),
(486,'http://localhost:8080/expteaching.html#/','http://localhost:8080/coursemanager.html',1,'2018-03-05 07:50:54','2018-03-05 07:50:55',-1),
(487,'http://localhost:8080/announcement.html#/','http://localhost:8080/expteaching.html',2,'2018-03-05 07:50:59','2018-03-05 07:51:01',-1),
(488,'http://localhost:8080/guide.html#/','http://localhost:8080/announcement.html',155,'2018-03-05 07:51:03','2018-03-05 07:53:38',-1),
(489,'http://localhost:8080/introduce.html#/','http://localhost:8080/guide.html',0,'2018-03-05 07:53:41','2018-03-05 07:53:41',-1),
(490,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',1,'2018-03-05 07:53:45','2018-03-05 07:53:46',-1),
(491,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',0,'2018-03-05 07:53:49','2018-03-05 07:53:49',-1),
(492,'http://localhost:8080/guide.html#/','http://localhost:8080/announcement.html',2,'2018-03-05 07:53:51','2018-03-05 07:53:53',-1),
(493,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',56,'2018-03-05 07:53:57','2018-03-05 07:54:53',-1),
(494,'http://127.0.0.1:8090/cec/news.html#/','http://127.0.0.1:8090/cec/',0,'2018-03-05 11:14:05','2018-03-05 11:14:05',-1),
(495,'http://127.0.0.1:8090/cec/announcement.html#/','http://127.0.0.1:8090/cec/news.html',0,'2018-03-05 11:14:07','2018-03-05 11:14:07',-1),
(496,'http://127.0.0.1:8090/cec/guide.html#/','http://127.0.0.1:8090/cec/announcement.html',0,'2018-03-05 11:14:08','2018-03-05 11:14:08',-1),
(497,'http://127.0.0.1:8090/cec/download.html#/','http://127.0.0.1:8090/cec/guide.html',4,'2018-03-05 11:14:09','2018-03-05 11:14:13',-1),
(498,'http://127.0.0.1:8090/cec/introduce.html#/','http://127.0.0.1:8090/cec/download.html',7,'2018-03-05 11:14:15','2018-03-05 11:14:22',-1),
(499,'http://localhost:8080/','http://localhost:8080/',153,'2018-03-07 16:20:07','2018-03-07 16:22:40',-1),
(500,'http://localhost:8080/','http://localhost:8080/',16,'2018-03-07 16:22:44','2018-03-07 16:23:00',-1),
(501,'http://localhost:8080/','http://localhost:8080/',35,'2018-03-07 16:23:04','2018-03-07 16:23:39',-1),
(502,'http://localhost:8080/','http://localhost:8080/',38,'2018-03-07 16:23:04','2018-03-07 16:23:42',-1),
(503,'http://localhost:8080/','http://localhost:8080/',44,'2018-03-07 16:27:30','2018-03-07 16:28:14',-1),
(504,'http://localhost:8080/','http://localhost:8080/',27,'2018-03-07 16:28:18','2018-03-07 16:28:45',-1),
(505,'http://localhost:8080/','http://localhost:8080/',67,'2018-03-07 16:28:48','2018-03-07 16:29:55',-1),
(506,'http://localhost:8080/','http://localhost:8080/',56,'2018-03-07 16:30:00','2018-03-07 16:30:56',-1),
(507,'http://localhost:8080/','http://localhost:8080/',28,'2018-03-07 16:31:00','2018-03-07 16:31:28',-1),
(508,'http://localhost:8080/','http://localhost:8080/',299,'2018-03-07 16:31:33','2018-03-07 16:36:32',-1),
(509,'http://localhost:8080/','http://localhost:8080/',37,'2018-03-07 16:36:37','2018-03-07 16:37:14',-1),
(510,'http://localhost:8080/','http://localhost:8080/',45,'2018-03-07 16:36:37','2018-03-07 16:37:22',-1),
(511,'http://localhost:8080/','http://localhost:8080/',101,'2018-03-07 16:37:27','2018-03-07 16:39:08',-1),
(512,'http://localhost:8080/','http://localhost:8080/',48,'2018-03-07 16:39:13','2018-03-07 16:40:01',-1),
(513,'http://localhost:8080/','http://localhost:8080/',115,'2018-03-07 16:40:08','2018-03-07 16:42:03',-1),
(514,'http://localhost:8080/','http://localhost:8080/',153,'2018-03-07 16:42:26','2018-03-07 16:44:59',-1),
(515,'http://localhost:8080/','http://localhost:8080/',87,'2018-03-07 16:45:04','2018-03-07 16:46:31',-1),
(516,'http://localhost:8080/introduce.html#/','http://localhost:8080/',1,'2018-03-07 16:46:36','2018-03-07 16:46:37',-1),
(517,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',0,'2018-03-07 16:46:42','2018-03-07 16:46:42',-1),
(518,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',12,'2018-03-07 16:46:45','2018-03-07 16:46:57',-1),
(519,'http://localhost:8080/introduce.html#/','http://localhost:8080/announcement.html',1,'2018-03-07 16:47:01','2018-03-07 16:47:02',-1),
(520,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',104,'2018-03-07 16:47:08','2018-03-07 16:48:52',-1),
(521,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',2,'2018-03-07 16:48:56','2018-03-07 16:48:58',-1),
(522,'http://localhost:8080/expteaching.html#/','http://localhost:8080/announcement.html',0,'2018-03-07 16:49:04','2018-03-07 16:49:04',-1),
(523,'http://localhost:8080/download.html#/','http://localhost:8080/expteaching.html',7,'2018-03-07 16:49:10','2018-03-07 16:49:17',-1),
(524,'http://localhost:8080/news.html#/','http://localhost:8080/download.html',1,'2018-03-07 16:49:21','2018-03-07 16:49:22',-1),
(525,'http://localhost:8080/newsdetail.html?index=26','http://localhost:8080/news.html',10,'2018-03-07 16:49:27','2018-03-07 16:49:37',-1),
(526,'http://localhost:8080/introduce.html#/','http://localhost:8080/newsdetail.html?index=26',1,'2018-03-07 16:49:41','2018-03-07 16:49:42',-1),
(527,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',1,'2018-03-07 16:49:47','2018-03-07 16:49:48',-1),
(528,'http://localhost:8080/newsdetail.html?index=31','http://localhost:8080/news.html',115,'2018-03-07 16:49:51','2018-03-07 16:51:46',-1),
(529,'http://localhost:8080/newsdetail.html?index=32','http://localhost:8080/newsdetail.html?index=31',77,'2018-03-07 16:51:51','2018-03-07 16:53:08',-1),
(530,'http://localhost:8080/newsdetail.html?index=32','http://localhost:8080/newsdetail.html?index=32',71,'2018-03-07 16:53:19','2018-03-07 16:54:30',-1),
(531,'http://localhost:8080/newsdetail.html?index=32','http://localhost:8080/newsdetail.html?index=32',24,'2018-03-07 16:54:36','2018-03-07 16:55:00',-1),
(532,'http://localhost:8080/newsdetail.html?index=32','http://localhost:8080/newsdetail.html?index=32',3,'2018-03-07 16:55:07','2018-03-07 16:55:10',-1),
(533,'http://localhost:8080/expteaching.html#/other','http://localhost:8080/newsdetail.html?index=32',4,'2018-03-07 16:55:13','2018-03-07 16:55:17',-1),
(534,'http://localhost:8080/index.html','http://localhost:8080/expteaching.html',0,'2018-03-07 16:55:21','2018-03-07 16:55:21',-1),
(535,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',0,'2018-03-07 16:55:23','2018-03-07 16:55:23',-1),
(536,'http://localhost:8090/cec/news.html#/','http://localhost:8090/cec/',0,'2018-03-07 19:27:42','2018-03-07 19:27:42',-1),
(537,'http://localhost:8080/newsdetail.html?index=1','http://localhost:8080/',13,'2018-03-08 23:21:40','2018-03-08 23:21:53',-1),
(538,'http://localhost:8080/news.html#/','http://localhost:8080/newsdetail.html?index=1',5,'2018-03-08 23:22:03','2018-03-08 23:22:08',-1),
(539,'http://localhost:8080/newsdetail.html?index=26','http://localhost:8080/news.html',322,'2018-03-08 23:22:17','2018-03-08 23:27:39',-1),
(540,'http://localhost:8080/introduce.html#/','http://localhost:8080/newsdetail.html?index=26',1,'2018-03-08 23:27:45','2018-03-08 23:27:46',-1),
(541,'http://localhost:8080/index.html','http://localhost:8080/introduce.html',22,'2018-03-08 23:27:54','2018-03-08 23:28:16',-1),
(542,'http://localhost:8080/newsdetail.html?index=28','http://localhost:8080/index.html',185,'2018-03-08 23:29:03','2018-03-08 23:32:08',-1),
(543,'http://localhost:8080/index.html','http://localhost:8080/newsdetail.html?index=28',7,'2018-03-08 23:32:12','2018-03-08 23:32:19',-1),
(544,'http://localhost:8080/announcementdetail.html?index=7','http://localhost:8080/index.html',1,'2018-03-08 23:32:26','2018-03-08 23:32:27',-1),
(545,'http://localhost:8080/index.html','http://localhost:8080/newsdetail.html?index=28',2,'2018-03-08 23:32:39','2018-03-08 23:32:41',-1),
(546,'http://localhost:8080/newsdetail.html?index=31','http://localhost:8080/index.html',109,'2018-03-08 23:32:51','2018-03-08 23:34:40',-1),
(547,'http://localhost:8080/newsdetail.html?index=31','http://localhost:8080/index.html',757,'2018-03-08 23:35:11','2018-03-08 23:47:48',-1),
(548,'http://localhost:8080/index.html','http://localhost:8080/newsdetail.html?index=31',2,'2018-03-08 23:47:51','2018-03-08 23:47:53',-1),
(549,'http://localhost:8080/newsdetail.html?index=1','http://localhost:8080/index.html',2,'2018-03-08 23:47:57','2018-03-08 23:47:59',-1),
(550,'http://localhost:8080/news.html#/','http://localhost:8080/newsdetail.html?index=1',5,'2018-03-08 23:48:01','2018-03-08 23:48:06',-1),
(551,'http://localhost:8080/newsdetail.html?index=34','http://localhost:8080/news.html',58,'2018-03-08 23:48:10','2018-03-08 23:49:08',-1),
(552,'http://localhost:8080/index.html','http://localhost:8080/newsdetail.html?index=34',2,'2018-03-08 23:49:11','2018-03-08 23:49:13',-1),
(553,'http://localhost:8080/newsdetail.html?index=27','http://localhost:8080/index.html',3,'2018-03-08 23:49:16','2018-03-08 23:49:19',-1),
(554,'http://localhost:8080/news.html#/','http://localhost:8080/newsdetail.html?index=27',2,'2018-03-08 23:49:22','2018-03-08 23:49:24',-1),
(555,'http://localhost:8080/newsdetail.html?index=28','http://localhost:8080/news.html',75,'2018-03-08 23:49:26','2018-03-08 23:50:41',-1),
(556,'http://localhost:8080/index.html','http://localhost:8080/newsdetail.html?index=28',0,'2018-03-08 23:50:45','2018-03-08 23:50:45',-1),
(557,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',1,'2018-03-08 23:50:49','2018-03-08 23:50:50',-1),
(558,'http://localhost:8080/index.hml','http://localhost:8080/introduce.html',2,'2018-03-08 23:50:52','2018-03-08 23:50:54',-1),
(559,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',548,'2018-03-08 23:50:57','2018-03-09 00:00:05',-1),
(560,'http://localhost:8080/index.html','http://localhost:8080/introduce.html',2,'2018-03-09 00:00:08','2018-03-09 00:00:10',-1),
(561,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',1,'2018-03-09 00:00:13','2018-03-09 00:00:14',-1),
(562,'http://localhost:8080/cec/index.html','http://localhost:8080/introduce.html',6,'2018-03-09 00:00:17','2018-03-09 00:00:23',-1),
(563,'http://localhost:8080/cec/introduce.html','http://localhost:8080/cec/index.html',2,'2018-03-09 00:00:26','2018-03-09 00:00:28',-1),
(564,'http://localhost:8080/cec/introduce.html','http://localhost:8080/cec/introduce.html',57,'2018-03-09 00:00:31','2018-03-09 00:01:28',-1),
(565,'http://localhost:8080/cec/introduce.html','http://localhost:8080/cec/introduce.html',5,'2018-03-09 00:01:32','2018-03-09 00:01:37',-1),
(566,'http://localhost:8080/index.html','http://localhost:8080/introduce.html',51,'2018-03-09 00:01:44','2018-03-09 00:02:35',-1),
(567,'http://localhost:8080/news.html#/','http://localhost:8080/index.html',226,'2018-03-09 00:02:40','2018-03-09 00:06:26',-1),
(568,'http://localhost:8080/newsdetail.html?index=26','http://localhost:8080/news.html',2,'2018-03-09 00:06:30','2018-03-09 00:06:32',-1),
(569,'http://localhost:8080/news.html#/','http://localhost:8080/newsdetail.html?index=26',15,'2018-03-09 00:06:35','2018-03-09 00:06:50',-1),
(570,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',29,'2018-03-09 00:06:53','2018-03-09 00:07:22',-1),
(571,'http://localhost:8080/announcement.html#/announcementList','http://localhost:8080/announcement.html',293,'2018-03-09 00:07:25','2018-03-09 00:12:18',-1),
(572,'http://localhost:8080/news.html#/','http://localhost:8080/announcement.html',127,'2018-03-09 00:12:20','2018-03-09 00:14:27',-1),
(573,'http://localhost:8080/news.html#/','http://localhost:8080/announcement.html',61,'2018-03-09 00:14:43','2018-03-09 00:15:44',-1),
(574,'http://localhost:8080/news.html#/','http://localhost:8080/news.html',115,'2018-03-09 00:15:48','2018-03-09 00:17:43',-1),
(575,'http://localhost:8080/introduce.html#/','http://localhost:8080/news.html',9,'2018-03-09 00:17:47','2018-03-09 00:17:56',-1),
(576,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',143,'2018-03-09 00:18:12','2018-03-09 00:20:35',-1),
(577,'http://localhost:8080/news.html#/','http://localhost:8080/news.html',77,'2018-03-09 00:20:39','2018-03-09 00:21:56',-1),
(578,'http://localhost:8080/newsdetail.html?index=27','http://localhost:8080/news.html',1,'2018-03-09 00:22:01','2018-03-09 00:22:02',-1),
(579,'http://localhost:8080/news.html#/','http://localhost:8080/newsdetail.html?index=27',1,'2018-03-09 00:22:05','2018-03-09 00:22:06',-1),
(580,'http://localhost:8080/newsdetail.html?index=27','http://localhost:8080/news.html',2,'2018-03-09 00:22:10','2018-03-09 00:22:12',-1),
(581,'http://localhost:8080/newsdetail.html?index=27','http://localhost:8080/news.html',269,'2018-03-09 00:23:43','2018-03-09 00:28:12',-1),
(582,'http://localhost:8080/newsdetail.html?index=27','http://localhost:8080/news.html',3,'2018-03-09 00:28:18','2018-03-09 00:28:21',-1),
(583,'http://localhost:8080/news.html#/','http://localhost:8080/newsdetail.html?index=27',2,'2018-03-09 00:28:26','2018-03-09 00:28:28',-1),
(584,'http://localhost:8080/newsdetail.html?index=27','http://localhost:8080/news.html',2,'2018-03-09 00:28:30','2018-03-09 00:28:32',-1),
(585,'http://localhost:8080/news.html#/','http://localhost:8080/newsdetail.html?index=27',1,'2018-03-09 00:28:37','2018-03-09 00:28:38',-1),
(586,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',0,'2018-03-09 00:28:43','2018-03-09 00:28:43',-1),
(587,'http://localhost:8080/guide.html#/','http://localhost:8080/announcement.html',18,'2018-03-09 00:28:46','2018-03-09 00:29:04',-1),
(588,'http://localhost:8080/introduce.html#/','http://localhost:8080/guide.html',318,'2018-03-09 00:29:07','2018-03-09 00:34:25',-1),
(589,'http://localhost:8080/expteaching.html#/','http://localhost:8080/introduce.html',219,'2018-03-09 00:34:50','2018-03-09 00:38:29',-1),
(590,'http://localhost:8080/guide.html#/','http://localhost:8080/expteaching.html',1,'2018-03-09 00:38:49','2018-03-09 00:38:50',-1),
(591,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',204,'2018-03-09 00:38:54','2018-03-09 00:42:18',-1),
(592,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/expteaching.html',130,'2018-03-09 00:42:24','2018-03-09 00:44:34',-1),
(593,'http://localhost:8080/index.html','http://localhost:8080/coursemanager.html',0,'2018-03-09 00:44:38','2018-03-09 00:44:38',-1),
(594,'http://localhost:8080/guide.html#/','http://localhost:8080/index.html',0,'2018-03-09 00:44:43','2018-03-09 00:44:43',-1),
(595,'http://localhost:8080/guide.html#/','http://localhost:8080/guide.html',1,'2018-03-09 00:44:46','2018-03-09 00:44:47',-1),
(596,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',0,'2018-03-09 00:44:51','2018-03-09 00:44:51',-1),
(597,'http://localhost:8090/cec/introduce.html#/','http://localhost:8090/cec/',1,'2018-03-09 11:00:12','2018-03-09 11:00:13',-1),
(598,'http://localhost:8090/cec/index.html','http://localhost:8090/cec/introduce.html',1,'2018-03-09 11:00:15','2018-03-09 11:00:16',-1),
(599,'http://localhost:8090/cec/news.html#/','http://localhost:8090/cec/index.html',1,'2018-03-09 11:00:18','2018-03-09 11:00:19',-1),
(600,'http://localhost:8090/cec/newsdetail.html?index=30','http://localhost:8090/cec/news.html',4,'2018-03-09 11:00:20','2018-03-09 11:00:24',-1),
(601,'http://localhost:8090/cec/newsdetail.html?index=31','http://localhost:8090/cec/newsdetail.html?index=30',0,'2018-03-09 11:00:26','2018-03-09 11:00:26',-1),
(602,'http://localhost:8090/cec/news.html#/','http://localhost:8090/cec/newsdetail.html?index=31',1,'2018-03-09 11:00:28','2018-03-09 11:00:29',-1),
(603,'http://localhost:8090/cec/download.html#/','http://localhost:8090/cec/news.html',26,'2018-03-09 11:00:30','2018-03-09 11:00:56',-1),
(604,'http://localhost:8090/cec/guide.html#/','http://localhost:8090/cec/download.html',1,'2018-03-09 11:00:58','2018-03-09 11:00:59',-1),
(605,'http://localhost:8090/cec/download.html#/','http://localhost:8090/cec/guide.html',6,'2018-03-09 11:01:00','2018-03-09 11:01:06',-1),
(606,'http://localhost:8090/cec/expteaching.html#/other','http://localhost:8090/cec/download.html',7,'2018-03-09 11:01:07','2018-03-09 11:01:14',-1),
(607,'http://localhost:8090/cec/index.html','http://localhost:8090/cec/expteaching.html',3,'2018-03-09 11:01:15','2018-03-09 11:01:18',-1),
(608,'http://localhost:8090/cec/newsdetail.html?index=1','http://localhost:8090/cec/index.html',3,'2018-03-09 11:01:19','2018-03-09 11:01:22',-1),
(609,'http://localhost:8090/cec/introduce.html#/','http://localhost:8090/cec/newsdetail.html?index=1',0,'2018-03-09 11:01:24','2018-03-09 11:01:24',-1),
(610,'http://localhost:8090/cec/coursemanager.html#/','http://localhost:8090/cec/introduce.html',2,'2018-03-09 11:01:25','2018-03-09 11:01:27',-1),
(611,'http://localhost:8090/cec/download.html#/','http://localhost:8090/cec/coursemanager.html',0,'2018-03-09 11:01:28','2018-03-09 11:01:28',-1),
(612,'http://localhost:8090/cec/expteaching.html#/','http://localhost:8090/cec/download.html',0,'2018-03-09 11:01:29','2018-03-09 11:01:29',-1),
(613,'http://localhost:8090/cec/guide.html#/','http://localhost:8090/cec/expteaching.html',0,'2018-03-09 11:01:30','2018-03-09 11:01:30',-1),
(614,'http://localhost:8090/cec/announcement.html#/','http://localhost:8090/cec/guide.html',0,'2018-03-09 11:01:31','2018-03-09 11:01:31',-1),
(615,'http://localhost:8090/cec/news.html#/','http://localhost:8090/cec/announcement.html',12,'2018-03-09 11:01:33','2018-03-09 11:01:45',-1),
(616,'http://localhost:8090/cec/introduce.html#/','http://localhost:8090/cec/',39,'2018-03-10 02:14:33','2018-03-10 02:15:12',-1),
(617,'http://localhost:8090/cec/news.html#/','http://localhost:8090/cec/introduce.html',85,'2018-03-10 02:15:14','2018-03-10 02:16:39',-1),
(618,'http://localhost:8090/cec/announcement.html#/','http://localhost:8090/cec/news.html',1,'2018-03-10 02:16:41','2018-03-10 02:16:42',-1),
(619,'http://localhost:8090/cec/guide.html#/','http://localhost:8090/cec/announcement.html',1,'2018-03-10 02:16:43','2018-03-10 02:16:44',-1),
(620,'http://localhost:8090/cec/announcement.html#/','http://localhost:8090/cec/guide.html',0,'2018-03-10 02:16:45','2018-03-10 02:16:45',-1),
(621,'http://localhost:8090/cec/guide.html#/','http://localhost:8090/cec/introduce.html',39,'2018-03-10 02:17:59','2018-03-10 02:18:38',-1),
(622,'http://localhost:8090/cec/expteaching.html#/','http://localhost:8090/cec/guide.html',1,'2018-03-10 02:18:40','2018-03-10 02:18:41',-1),
(623,'http://localhost:8090/cec/download.html#/','http://localhost:8090/cec/expteaching.html',3,'2018-03-10 02:18:41','2018-03-10 02:18:44',-1),
(624,'http://localhost:8090/cec/download.html#/','http://localhost:8090/cec/expteaching.html',0,'2018-03-10 02:18:46','2018-03-10 02:18:46',-1),
(625,'http://localhost:8090/cec/download.html#/','http://localhost:8090/cec/expteaching.html',2858,'2018-03-10 02:43:11','2018-03-10 03:30:49',-1),
(626,'http://localhost:8090/cec/download.html#/','http://localhost:8090/cec/expteaching.html',6,'2018-03-10 03:30:50','2018-03-10 03:30:56',-1),
(627,'http://localhost:8090/cec/introduce.html#/','http://localhost:8090/cec/download.html',580,'2018-03-10 03:57:52','2018-03-10 04:07:32',-1),
(628,'http://localhost:8090/cec/introduce.html#/','http://localhost:8090/cec/',0,'2018-03-10 05:00:48','2018-03-10 05:00:48',-1),
(629,'http://localhost:8090/cec/news.html#/','http://localhost:8090/cec/introduce.html',0,'2018-03-10 05:00:49','2018-03-10 05:00:49',-1),
(630,'http://localhost:8090/cec/announcement.html#/','http://localhost:8090/cec/news.html',0,'2018-03-10 05:00:50','2018-03-10 05:00:50',-1),
(631,'http://localhost:8090/cec/guide.html#/','http://localhost:8090/cec/announcement.html',0,'2018-03-10 05:00:51','2018-03-10 05:00:51',-1),
(632,'http://localhost:8090/cec/expteaching.html#/','http://localhost:8090/cec/guide.html',0,'2018-03-10 05:00:51','2018-03-10 05:00:51',-1),
(633,'http://localhost:8090/cec/download.html#/','http://localhost:8090/cec/expteaching.html',0,'2018-03-10 05:00:53','2018-03-10 05:00:53',-1),
(634,'http://localhost:8080/newsdetail.html?index=26','http://localhost:8080/',8,'2018-03-22 12:57:55','2018-03-22 12:58:03',-1),
(635,'http://localhost:8080/introduce.html#/','http://localhost:8080/newsdetail.html?index=26',1,'2018-03-22 12:58:07','2018-03-22 12:58:08',-1),
(636,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',10,'2018-03-22 12:58:11','2018-03-22 12:58:21',-1),
(637,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',1,'2018-03-22 12:58:26','2018-03-22 12:58:27',-1),
(638,'http://localhost:8080/guide.html#/businessType','http://localhost:8080/announcement.html',7,'2018-03-22 12:58:30','2018-03-22 12:58:37',-1),
(639,'http://localhost:8080/expteaching.html#/other','http://localhost:8080/guide.html',3,'2018-03-22 12:58:40','2018-03-22 12:58:43',-1),
(640,'http://localhost:8080/download.html#/','http://localhost:8080/expteaching.html',13,'2018-03-22 12:58:46','2018-03-22 12:58:59',-1),
(641,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/download.html',702,'2018-03-22 12:59:02','2018-03-22 13:10:44',-1),
(642,'http://localhost:8080/news.html#/','http://localhost:8080/index.html',29,'2018-03-22 13:37:47','2018-03-22 13:38:16',-1),
(643,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',0,'2018-03-22 13:38:19','2018-03-22 13:38:19',-1),
(644,'http://localhost:8080/guide.html#/rules','http://localhost:8080/announcement.html',6,'2018-03-22 13:38:22','2018-03-22 13:38:28',-1),
(645,'http://localhost:8080/index.html','http://localhost:8080/guide.html',16,'2018-03-22 13:38:30','2018-03-22 13:38:46',-1),
(646,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/',245,'2018-03-22 13:45:00','2018-03-22 13:49:05',-1),
(647,'http://localhost:8080/laboratory.html#/','http://localhost:8080/coursemanager.html',8,'2018-03-22 13:49:08','2018-03-22 13:49:16',-1),
(648,'http://localhost:8080/download.html#/','http://localhost:8080/laboratory.html',63,'2018-03-22 13:49:20','2018-03-22 13:50:23',-1),
(649,'http://localhost:8080/laboratory.html#/','http://localhost:8080/download.html',1,'2018-03-22 13:50:26','2018-03-22 13:50:27',-1),
(650,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/laboratory.html',1,'2018-03-22 13:50:30','2018-03-22 13:50:31',-1),
(651,'http://localhost:8080/laboratory.html#/','http://localhost:8080/coursemanager.html',8,'2018-03-22 13:50:34','2018-03-22 13:50:42',-1),
(652,'http://localhost:8080/introduce.html#/','http://localhost:8080/',0,'2018-03-22 14:56:47','2018-03-22 14:56:47',-1),
(653,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',0,'2018-03-22 14:56:52','2018-03-22 14:56:52',-1),
(654,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',0,'2018-03-22 14:56:54','2018-03-22 14:56:54',-1),
(655,'http://localhost:8080/guide.html#/','http://localhost:8080/announcement.html',2,'2018-03-22 14:56:58','2018-03-22 14:57:00',-1),
(656,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',0,'2018-03-22 14:57:04','2018-03-22 14:57:04',-1),
(657,'http://localhost:8080/','http://localhost:8080/',14,'2018-03-22 15:23:35','2018-03-22 15:23:49',-1),
(658,'http://127.0.0.1:8080/','http://localhost:8080/login.html',47,'2018-03-22 17:20:25','2018-03-22 17:21:12',-1),
(659,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',22,'2018-03-22 17:29:26','2018-03-22 17:29:48',-1),
(660,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',64,'2018-03-22 17:32:38','2018-03-22 17:33:42',-1),
(661,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',413,'2018-03-22 17:33:54','2018-03-22 17:40:47',-1),
(662,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',14,'2018-03-22 17:40:51','2018-03-22 17:41:05',-1),
(663,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',632,'2018-03-22 17:41:15','2018-03-22 17:51:47',-1),
(664,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',3,'2018-03-22 17:51:51','2018-03-22 17:51:54',-1),
(665,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',4,'2018-03-22 17:52:10','2018-03-22 17:52:14',-1),
(666,'http://127.0.0.1:8080/introduce.html#/','http://127.0.0.1:8080/',0,'2018-03-22 17:52:18','2018-03-22 17:52:18',-1),
(667,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/introduce.html',0,'2018-03-22 17:52:20','2018-03-22 17:52:20',-1),
(668,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/news.html',0,'2018-03-22 17:52:25','2018-03-22 17:52:25',-1),
(669,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/announcement.html',0,'2018-03-22 17:52:29','2018-03-22 17:52:29',-1),
(670,'http://127.0.0.1:8080/expteaching.html#/','http://127.0.0.1:8080/guide.html',0,'2018-03-22 17:52:35','2018-03-22 17:52:35',-1),
(671,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/expteaching.html',1,'2018-03-22 17:52:36','2018-03-22 17:52:37',-1),
(672,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/download.html',68,'2018-03-22 17:52:41','2018-03-22 17:53:49',-1),
(673,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/laboratory.html',2429,'2018-03-22 17:53:53','2018-03-22 18:34:22',-1),
(674,'http://127.0.0.1:8080/newsdetail.html?index=30','http://127.0.0.1:8080/index.html',3,'2018-03-22 18:34:26','2018-03-22 18:34:29',-1),
(675,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/laboratory.html',10,'2018-03-22 18:34:32','2018-03-22 18:34:42',-1),
(676,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',2,'2018-03-22 18:34:58','2018-03-22 18:35:00',-1),
(677,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',3,'2018-03-22 18:35:06','2018-03-22 18:35:09',-1),
(678,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/',161,'2018-03-22 18:35:12','2018-03-22 18:37:53',-1),
(679,'http://127.0.0.1:8080/laboratory.html#/more','http://127.0.0.1:8080/laboratory.html',1014,'2018-03-22 18:37:58','2018-03-22 18:54:52',-1),
(680,'http://127.0.0.1:8080/expteaching.html#/','http://127.0.0.1:8080/laboratory.html',6,'2018-03-22 18:54:55','2018-03-22 18:55:01',-1),
(681,'http://127.0.0.1:8080/laboratory.html#/more','http://127.0.0.1:8080/laboratory.html',2,'2018-03-22 18:55:04','2018-03-22 18:55:06',-1),
(682,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/laboratory.html',1,'2018-03-22 18:55:08','2018-03-22 18:55:09',-1),
(683,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/guide.html',0,'2018-03-22 18:55:13','2018-03-22 18:55:13',-1),
(684,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/announcement.html',0,'2018-03-22 18:55:15','2018-03-22 18:55:15',-1),
(685,'http://127.0.0.1:8080/introduce.html#/','http://127.0.0.1:8080/news.html',4,'2018-03-22 18:55:20','2018-03-22 18:55:24',-1),
(686,'http://127.0.0.1:8080/coursemanager.html#/','http://127.0.0.1:8080/introduce.html',0,'2018-03-22 18:55:27','2018-03-22 18:55:27',-1),
(687,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/coursemanager.html',16,'2018-03-22 18:55:30','2018-03-22 18:55:46',-1),
(688,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/coursemanager.html',338,'2018-03-22 18:55:52','2018-03-22 19:01:30',-1),
(689,'http://127.0.0.1:8080/laboratory.html#/other','http://127.0.0.1:8080/laboratory.html',225,'2018-03-22 19:01:33','2018-03-22 19:05:18',-1),
(690,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/laboratory.html',1,'2018-03-22 19:05:21','2018-03-22 19:05:22',-1),
(691,'http://127.0.0.1:8080/expteaching.html#/','http://127.0.0.1:8080/download.html',1,'2018-03-22 19:05:25','2018-03-22 19:05:26',-1),
(692,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/expteaching.html',1,'2018-03-22 19:05:29','2018-03-22 19:05:30',-1),
(693,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/guide.html',1,'2018-03-22 19:05:32','2018-03-22 19:05:33',-1),
(694,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/announcement.html',0,'2018-03-22 19:05:37','2018-03-22 19:05:37',-1),
(695,'http://127.0.0.1:8080/introduce.html#/','http://127.0.0.1:8080/news.html',1,'2018-03-22 19:05:40','2018-03-22 19:05:41',-1),
(696,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/introduce.html',5,'2018-03-22 19:05:44','2018-03-22 19:05:49',-1),
(697,'http://127.0.0.1:8080/guide.html#/server','http://127.0.0.1:8080/index.html',2,'2018-03-22 19:05:51','2018-03-22 19:05:53',-1),
(698,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/guide.html',3,'2018-03-22 19:05:56','2018-03-22 19:05:59',-1),
(699,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/laboratory.html',6,'2018-03-22 19:06:05','2018-03-22 19:06:11',-1),
(700,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/laboratory.html',0,'2018-03-22 19:06:14','2018-03-22 19:06:14',-1),
(701,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/pcenter.html',235,'2018-03-22 19:06:16','2018-03-22 19:10:11',-1),
(702,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-22 19:10:15','2018-03-22 19:10:15',-1),
(703,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/news.html',3,'2018-03-22 19:10:18','2018-03-22 19:10:21',-1),
(704,'http://127.0.0.1:8080/announcementdetail.html?index=7','http://127.0.0.1:8080/announcement.html',3,'2018-03-22 19:10:24','2018-03-22 19:10:27',-1),
(705,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/announcementdetail.html?index=7',0,'2018-03-22 19:10:30','2018-03-22 19:10:30',-1),
(706,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/announcement.html',11,'2018-03-22 19:10:34','2018-03-22 19:10:45',-1),
(707,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/guide.html',0,'2018-03-22 19:10:48','2018-03-22 19:10:48',-1),
(708,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/download.html',1246,'2018-03-22 19:10:52','2018-03-22 19:31:38',-1),
(709,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',1455,'2018-03-22 19:32:45','2018-03-22 19:57:00',-1),
(710,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',1,'2018-03-22 19:57:04','2018-03-22 19:57:05',-1),
(711,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',44,'2018-03-22 19:57:31','2018-03-22 19:58:15',-1),
(712,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/laboratory.html',2,'2018-03-22 19:58:19','2018-03-22 19:58:21',-1),
(713,'http://127.0.0.1:8080/expteaching.html#/other','http://127.0.0.1:8080/download.html',3,'2018-03-22 19:58:24','2018-03-22 19:58:27',-1),
(714,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/expteaching.html',1,'2018-03-22 19:58:29','2018-03-22 19:58:30',-1),
(715,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/guide.html',0,'2018-03-22 19:58:37','2018-03-22 19:58:37',-1),
(716,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/guide.html',0,'2018-03-22 19:58:39','2018-03-22 19:58:39',-1),
(717,'http://127.0.0.1:8080/introduce.html#/','http://127.0.0.1:8080/news.html',0,'2018-03-22 19:58:43','2018-03-22 19:58:43',-1),
(718,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/introduce.html',3,'2018-03-22 19:58:46','2018-03-22 19:58:49',-1),
(719,'http://127.0.0.1:8080/coursemanager.html#/','http://127.0.0.1:8080/index.html',0,'2018-03-22 19:58:52','2018-03-22 19:58:52',-1),
(720,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/coursemanager.html',2014,'2018-03-22 19:58:56','2018-03-22 20:32:30',-1),
(721,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',8,'2018-03-22 20:32:48','2018-03-22 20:32:56',-1),
(722,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/',62,'2018-03-22 20:33:00','2018-03-22 20:34:02',-1),
(723,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/laboratory.html',4,'2018-03-22 20:34:05','2018-03-22 20:34:09',-1),
(724,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',221,'2018-03-22 20:34:12','2018-03-22 20:37:53',-1),
(725,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',435,'2018-03-22 20:38:00','2018-03-22 20:45:15',-1),
(726,'http://127.0.0.1:8080/coursemanager.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-22 20:45:18','2018-03-22 20:45:18',-1),
(727,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/coursemanager.html',384,'2018-03-22 20:45:21','2018-03-22 20:51:45',-1),
(728,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/coursemanager.html',270,'2018-03-22 20:51:48','2018-03-22 20:56:18',-1),
(729,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/coursemanager.html',79,'2018-03-22 20:56:24','2018-03-22 20:57:43',-1),
(730,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/coursemanager.html',4060,'2018-03-22 21:25:00','2018-03-22 22:32:40',-1),
(731,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/laboratory.html',3,'2018-03-22 22:32:44','2018-03-22 22:32:47',-1),
(732,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/download.html',2,'2018-03-22 22:32:50','2018-03-22 22:32:52',-1),
(733,'http://127.0.0.1:8080/coursemanager.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-22 22:32:54','2018-03-22 22:32:54',-1),
(734,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/coursemanager.html',10,'2018-03-22 22:32:57','2018-03-22 22:33:07',-1),
(735,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/coursemanager.html',1,'2018-03-22 22:33:12','2018-03-22 22:33:13',-1),
(736,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/laboratory.html',1,'2018-03-22 22:33:16','2018-03-22 22:33:17',-1),
(737,'http://127.0.0.1:8080/guide.html#/server','http://127.0.0.1:8080/announcement.html',8,'2018-03-22 22:33:20','2018-03-22 22:33:28',-1),
(738,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/guide.html',4,'2018-03-22 22:33:30','2018-03-22 22:33:34',-1),
(739,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/announcement.html',1,'2018-03-22 22:33:38','2018-03-22 22:33:39',-1),
(740,'http://127.0.0.1:8080/introduce.html#/','http://127.0.0.1:8080/news.html',4,'2018-03-22 22:33:42','2018-03-22 22:33:46',-1),
(741,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/introduce.html',49,'2018-03-22 22:33:48','2018-03-22 22:34:37',-1),
(742,'http://127.0.0.1:8080/coursemanager.html#/','http://127.0.0.1:8080/laboratory.html',2,'2018-03-22 22:34:39','2018-03-22 22:34:41',-1),
(743,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/coursemanager.html',1,'2018-03-22 22:34:44','2018-03-22 22:34:45',-1),
(744,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-22 22:34:47','2018-03-22 22:34:47',-1),
(745,'http://127.0.0.1:8080/expteaching.html#/','http://127.0.0.1:8080/download.html',1,'2018-03-22 22:34:49','2018-03-22 22:34:50',-1),
(746,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/expteaching.html',1,'2018-03-22 22:34:53','2018-03-22 22:34:54',-1),
(747,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/guide.html',0,'2018-03-22 22:34:57','2018-03-22 22:34:57',-1),
(748,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/announcement.html',2,'2018-03-22 22:34:59','2018-03-22 22:35:01',-1),
(749,'http://127.0.0.1:8080/introduce.html#/','http://127.0.0.1:8080/news.html',3,'2018-03-22 22:35:03','2018-03-22 22:35:06',-1),
(750,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/introduce.html',181,'2018-03-22 22:35:08','2018-03-22 22:38:09',-1),
(751,'http://127.0.0.1:8080/introduce.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-22 22:38:11','2018-03-22 22:38:11',-1),
(752,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',197,'2018-03-22 22:38:15','2018-03-22 22:41:32',-1),
(753,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/laboratory.html',1,'2018-03-22 22:41:36','2018-03-22 22:41:37',-1),
(754,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-22 22:41:36','2018-03-22 22:41:36',-1),
(755,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/news.html',0,'2018-03-22 22:41:40','2018-03-22 22:41:40',-1),
(756,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/announcement.html',0,'2018-03-22 22:41:42','2018-03-22 22:41:42',-1),
(757,'http://127.0.0.1:8080/expteaching.html#/','http://127.0.0.1:8080/guide.html',0,'2018-03-22 22:41:45','2018-03-22 22:41:45',-1),
(758,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/expteaching.html',0,'2018-03-22 22:41:49','2018-03-22 22:41:49',-1),
(759,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/download.html',11,'2018-03-22 22:41:51','2018-03-22 22:42:02',-1),
(760,'http://127.0.0.1:8080/coursemanager.html#/','http://127.0.0.1:8080/laboratory.html',3,'2018-03-22 22:42:05','2018-03-22 22:42:08',-1),
(761,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/coursemanager.html',65,'2018-03-22 22:42:10','2018-03-22 22:43:15',-1),
(762,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/announcement.html',3064,'2018-03-23 00:43:30','2018-03-23 01:34:34',-1),
(763,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/announcement.html',1956,'2018-03-23 01:34:36','2018-03-23 02:07:12',-1),
(764,'http://127.0.0.1:8080/coursemanager.html#/','http://127.0.0.1:8080/laboratory.html',1,'2018-03-23 02:07:15','2018-03-23 02:07:16',-1),
(765,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/coursemanager.html',11,'2018-03-23 02:07:21','2018-03-23 02:07:32',-1),
(766,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/download.html',491,'2018-03-23 02:07:34','2018-03-23 02:15:45',-1),
(767,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-23 02:15:48','2018-03-23 02:15:48',-1),
(768,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/news.html',0,'2018-03-23 02:15:52','2018-03-23 02:15:52',-1),
(769,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/announcement.html',1,'2018-03-23 02:15:54','2018-03-23 02:15:55',-1),
(770,'http://127.0.0.1:8080/expteaching.html#/other','http://127.0.0.1:8080/guide.html',4,'2018-03-23 02:15:59','2018-03-23 02:16:03',-1),
(771,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/expteaching.html',0,'2018-03-23 02:16:07','2018-03-23 02:16:07',-1),
(772,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/download.html',5414,'2018-03-23 02:19:04','2018-03-23 03:49:18',-1),
(773,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/download.html',2599,'2018-03-23 03:49:42','2018-03-23 04:33:01',-1),
(774,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',35,'2018-03-23 04:33:03','2018-03-23 04:33:38',-1),
(775,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',51,'2018-03-23 04:33:40','2018-03-23 04:34:31',-1),
(776,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',259,'2018-03-23 04:34:33','2018-03-23 04:38:52',-1),
(777,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',2468,'2018-03-23 04:39:19','2018-03-23 05:20:27',-1),
(778,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',90,'2018-03-23 05:20:30','2018-03-23 05:22:00',-1),
(779,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-23 05:22:04','2018-03-23 05:22:04',-1),
(780,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/download.html',534,'2018-03-23 05:59:55','2018-03-23 06:08:49',-1),
(781,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',9,'2018-03-23 06:09:02','2018-03-23 06:09:11',-1),
(782,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/pcenter.html',176,'2018-03-23 06:09:36','2018-03-23 06:12:32',-1),
(783,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-23 06:12:36','2018-03-23 06:12:36',-1),
(784,'http://127.0.0.1:8080/expteaching.html#/','http://127.0.0.1:8080/download.html',0,'2018-03-23 06:12:40','2018-03-23 06:12:40',-1),
(785,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/expteaching.html',13,'2018-03-23 06:12:43','2018-03-23 06:12:56',-1),
(786,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/laboratory.html',80,'2018-03-23 06:13:00','2018-03-23 06:14:20',-1),
(787,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',703,'2018-03-23 06:14:26','2018-03-23 06:26:09',-1),
(788,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/laboratory.html',1,'2018-03-23 06:26:22','2018-03-23 06:26:23',-1),
(789,'http://127.0.0.1:8080/detail','http://127.0.0.1:8080/laboratory.html',47,'2018-03-23 06:26:26','2018-03-23 06:27:13',-1),
(790,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/detail',1,'2018-03-23 06:27:17','2018-03-23 06:27:18',-1),
(791,'http://127.0.0.1:8080/laboratory.html/detail','http://127.0.0.1:8080/laboratory.html',88,'2018-03-23 06:27:21','2018-03-23 06:28:49',-1),
(792,'http://127.0.0.1:8080/laboratory.html/laboratory.html','http://127.0.0.1:8080/laboratory.html/detail',5,'2018-03-23 06:28:52','2018-03-23 06:28:57',-1),
(793,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/laboratory.html',3,'2018-03-23 11:09:06','2018-03-23 11:09:09',-1),
(794,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/news.html',1,'2018-03-23 11:09:13','2018-03-23 11:09:14',-1),
(795,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/announcement.html',1,'2018-03-23 11:09:18','2018-03-23 11:09:19',-1),
(796,'http://127.0.0.1:8080/expteaching.html#/','http://127.0.0.1:8080/guide.html',0,'2018-03-23 11:09:23','2018-03-23 11:09:23',-1),
(797,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/expteaching.html',5,'2018-03-23 11:09:24','2018-03-23 11:09:29',-1),
(798,'http://127.0.0.1:8080/laboratory.html#/detail?index=6','http://127.0.0.1:8080/download.html',52,'2018-03-23 11:09:34','2018-03-23 11:10:26',-1),
(799,'http://127.0.0.1:8080/coursemanager.html#/','http://127.0.0.1:8080/laboratory.html',1,'2018-03-23 11:10:29','2018-03-23 11:10:30',-1),
(800,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/coursemanager.html',0,'2018-03-23 11:10:32','2018-03-23 11:10:32',-1),
(801,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-23 11:10:35','2018-03-23 11:10:35',-1),
(802,'http://127.0.0.1:8080/expteaching.html#/','http://127.0.0.1:8080/download.html',2,'2018-03-23 11:10:37','2018-03-23 11:10:39',-1),
(803,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/expteaching.html',0,'2018-03-23 11:10:42','2018-03-23 11:10:42',-1),
(804,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/guide.html',1,'2018-03-23 11:10:47','2018-03-23 11:10:48',-1),
(805,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/announcement.html',0,'2018-03-23 11:10:52','2018-03-23 11:10:52',-1),
(806,'http://127.0.0.1:8080/introduce.html#/','http://127.0.0.1:8080/index.html',1,'2018-03-23 11:10:54','2018-03-23 11:10:55',-1),
(807,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/introduce.html',3,'2018-03-23 11:10:58','2018-03-23 11:11:01',-1),
(808,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/introduce.html',4,'2018-03-23 11:11:10','2018-03-23 11:11:14',-1),
(809,'http://127.0.0.1:8080/laboratory.html#/detail?index=2','http://127.0.0.1:8080/news.html',828,'2018-03-23 11:11:16','2018-03-23 11:25:04',-1),
(810,'http://127.0.0.1:8080/coursemanager.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-23 11:25:09','2018-03-23 11:25:09',-1),
(811,'http://127.0.0.1:8080/laboratory.html#/detail?index=2','http://127.0.0.1:8080/coursemanager.html',3545,'2018-03-23 11:37:06','2018-03-23 12:36:11',-1),
(812,'http://127.0.0.1:8080/laboratory.html#/detail?index=2','http://127.0.0.1:8080/coursemanager.html',71,'2018-03-23 12:36:15','2018-03-23 12:37:26',-1),
(813,'http://127.0.0.1:8080/laboratory.html#/detail?index=2','http://127.0.0.1:8080/coursemanager.html',67,'2018-03-23 12:38:17','2018-03-23 12:39:24',-1),
(814,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/coursemanager.html',245,'2018-03-23 12:39:32','2018-03-23 12:43:37',-1),
(815,'http://127.0.0.1:8080/introduce.html#/','http://127.0.0.1:8080/laboratory.html',0,'2018-03-23 12:43:40','2018-03-23 12:43:40',-1),
(816,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/introduce.html',0,'2018-03-23 12:43:43','2018-03-23 12:43:43',-1),
(817,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/news.html',1,'2018-03-23 12:43:46','2018-03-23 12:43:47',-1),
(818,'http://127.0.0.1:8080/guide.html#/server','http://127.0.0.1:8080/announcement.html',8,'2018-03-23 12:43:50','2018-03-23 12:43:58',-1),
(819,'http://127.0.0.1:8080/expteaching.html#/','http://127.0.0.1:8080/guide.html',2,'2018-03-23 12:44:02','2018-03-23 12:44:04',-1),
(820,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/expteaching.html',1,'2018-03-23 12:44:07','2018-03-23 12:44:08',-1),
(821,'http://127.0.0.1:8080/laboratory.html#/detail?index=3','http://127.0.0.1:8080/download.html',347,'2018-03-23 12:44:11','2018-03-23 12:49:58',-1),
(822,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/laboratory.html',1,'2018-03-23 12:50:00','2018-03-23 12:50:01',-1),
(823,'http://127.0.0.1:8080/laboratory.html#/detail?index=3','http://127.0.0.1:8080/download.html',2152,'2018-03-23 12:50:03','2018-03-23 13:25:55',-1),
(824,'http://127.0.0.1:8080/introduce.html#/','http://127.0.0.1:8080/laboratory.html',1,'2018-03-23 13:25:58','2018-03-23 13:25:59',-1),
(825,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/introduce.html',243,'2018-03-23 13:26:01','2018-03-23 13:30:04',-1),
(826,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/introduce.html',2322,'2018-03-23 13:30:11','2018-03-23 14:08:53',-1),
(827,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/',339,'2018-03-23 14:13:24','2018-03-23 14:19:03',-1),
(828,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/',137,'2018-03-23 16:54:07','2018-03-23 16:56:24',-1),
(829,'http://127.0.0.1:8080/','http://localhost:8080/login.html',10,'2018-03-23 16:56:45','2018-03-23 16:56:55',-1),
(830,'http://localhost:8080/index.html','http://localhost:8080/pcenter.html',4,'2018-03-26 09:20:30','2018-03-26 09:20:34',-1),
(831,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/index.html',102,'2018-03-26 09:20:38','2018-03-26 09:22:20',-1),
(832,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/laboratory.html',60,'2018-03-26 09:22:25','2018-03-26 09:23:25',-1),
(833,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/laboratory.html',655,'2018-03-26 09:25:20','2018-03-26 09:36:15',-1),
(834,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/laboratory.html',1816,'2018-03-26 09:36:43','2018-03-26 10:06:59',-1),
(835,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/laboratory.html',16,'2018-03-26 10:07:04','2018-03-26 10:07:20',-1),
(836,'http://localhost:8080/laboratory.html#/slb','http://localhost:8080/',377,'2018-03-26 10:27:02','2018-03-26 10:33:19',-1),
(837,'http://localhost:8080/laboratory.html#/slb','http://localhost:8080/laboratory.html',101,'2018-03-26 10:33:30','2018-03-26 10:35:11',-1),
(838,'http://localhost:8080/index.html','http://localhost:8080/laboratory.html',1,'2018-03-26 10:35:14','2018-03-26 10:35:15',-1),
(839,'http://127.0.0.1:8080/','http://localhost:8080/login.html',1,'2018-03-26 10:36:23','2018-03-26 10:36:24',-1),
(840,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/',2,'2018-03-26 10:36:28','2018-03-26 10:36:30',-1),
(841,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/laboratory.html',0,'2018-03-26 10:36:32','2018-03-26 10:36:32',-1),
(842,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/index.html',1,'2018-03-26 10:36:36','2018-03-26 10:36:37',-1),
(843,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/laboratory.html',16,'2018-03-26 10:36:45','2018-03-26 10:37:01',-1),
(844,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',2,'2018-03-26 10:37:10','2018-03-26 10:37:12',-1),
(845,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',7,'2018-03-26 11:24:31','2018-03-26 11:24:38',-1),
(846,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',3,'2018-03-26 11:29:21','2018-03-26 11:29:24',-1),
(847,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/index.html',1,'2018-03-26 11:29:27','2018-03-26 11:29:28',-1),
(848,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',4,'2018-03-26 12:42:41','2018-03-26 12:42:45',-1),
(849,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/index.html',3,'2018-03-26 12:42:48','2018-03-26 12:42:51',-1),
(850,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',0,'2018-03-26 13:46:02','2018-03-26 13:46:02',-1),
(851,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/index.html',271,'2018-03-26 13:46:06','2018-03-26 13:50:37',-1),
(852,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/laboratory.html',22,'2018-03-26 13:50:54','2018-03-26 13:51:16',-1),
(853,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',1,'2018-03-26 15:47:06','2018-03-26 15:47:07',-1),
(854,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',1,'2018-03-26 15:47:13','2018-03-26 15:47:14',-1),
(855,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/index.html',12,'2018-03-26 15:47:17','2018-03-26 15:47:29',-1),
(856,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',1,'2018-03-26 15:51:41','2018-03-26 15:51:42',-1),
(857,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/index.html',135,'2018-03-26 15:51:46','2018-03-26 15:54:01',-1),
(858,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',1,'2018-03-26 16:04:31','2018-03-26 16:04:32',-1),
(859,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/index.html',39,'2018-03-26 16:04:35','2018-03-26 16:05:14',-1),
(860,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',3,'2018-03-26 16:16:00','2018-03-26 16:16:03',-1),
(861,'http://127.0.0.1:8080/introduce.html#/','http://127.0.0.1:8080/index.html',1,'2018-03-26 16:16:06','2018-03-26 16:16:07',-1),
(862,'http://127.0.0.1:8080/news.html#/','http://127.0.0.1:8080/introduce.html',1,'2018-03-26 16:16:09','2018-03-26 16:16:10',-1),
(863,'http://127.0.0.1:8080/announcement.html#/','http://127.0.0.1:8080/news.html',0,'2018-03-26 16:16:14','2018-03-26 16:16:14',-1),
(864,'http://127.0.0.1:8080/guide.html#/','http://127.0.0.1:8080/announcement.html',0,'2018-03-26 16:16:17','2018-03-26 16:16:17',-1),
(865,'http://127.0.0.1:8080/expteaching.html#/','http://127.0.0.1:8080/guide.html',0,'2018-03-26 16:16:22','2018-03-26 16:16:22',-1),
(866,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/expteaching.html',0,'2018-03-26 16:16:26','2018-03-26 16:16:26',-1),
(867,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/download.html',4,'2018-03-26 16:16:30','2018-03-26 16:16:34',-1),
(868,'http://127.0.0.1:8080/coursemanager.html#/','http://127.0.0.1:8080/laboratory.html',2,'2018-03-26 16:16:37','2018-03-26 16:16:39',-1),
(869,'http://127.0.0.1:8080/laboratory.html#/detail?index=7','http://127.0.0.1:8080/coursemanager.html',11,'2018-03-26 16:16:41','2018-03-26 16:16:52',-1),
(870,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',0,'2018-03-26 16:18:57','2018-03-26 16:18:57',-1),
(871,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/index.html',22,'2018-03-26 16:18:59','2018-03-26 16:19:21',-1),
(872,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',0,'2018-03-26 17:12:30','2018-03-26 17:12:30',-1),
(873,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/index.html',10,'2018-03-26 17:12:31','2018-03-26 17:12:41',-1),
(874,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',0,'2018-03-26 17:18:53','2018-03-26 17:18:53',-1),
(875,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/index.html',9,'2018-03-26 17:18:56','2018-03-26 17:19:05',-1),
(876,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',1,'2018-03-26 18:34:12','2018-03-26 18:34:13',-1),
(877,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/index.html',184,'2018-03-26 20:32:02','2018-03-26 20:35:06',-1),
(878,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/pcenter.html',79,'2018-03-26 20:35:23','2018-03-26 20:36:42',-1),
(879,'http://127.0.0.1:8080/download.html#/','http://127.0.0.1:8080/laboratory.html',1,'2018-03-26 20:36:46','2018-03-26 20:36:47',-1),
(880,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/download.html',14,'2018-03-26 20:36:49','2018-03-26 20:37:03',-1),
(881,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/pcenter.html',30,'2018-03-26 20:40:18','2018-03-26 20:40:48',-1),
(882,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',6,'2018-03-26 21:00:07','2018-03-26 21:00:13',-1),
(883,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/pcenter.html',68,'2018-03-26 21:08:13','2018-03-26 21:09:21',-1),
(884,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',107,'2018-03-26 21:22:17','2018-03-26 21:24:04',-1),
(885,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',1,'2018-03-26 21:40:26','2018-03-26 21:40:27',-1),
(886,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',4,'2018-03-26 21:52:59','2018-03-26 21:53:03',-1),
(887,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/',3398,'2018-03-26 22:08:27','2018-03-26 23:05:05',-1),
(888,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/',113,'2018-03-26 23:05:07','2018-03-26 23:07:00',-1),
(889,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/',58,'2018-03-26 23:07:04','2018-03-26 23:08:02',-1),
(890,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/',205,'2018-03-26 23:08:06','2018-03-26 23:11:31',-1),
(891,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/',20,'2018-03-26 23:11:35','2018-03-26 23:11:55',-1),
(892,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/',170,'2018-03-26 23:12:01','2018-03-26 23:14:51',-1),
(893,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/',177,'2018-03-26 23:14:57','2018-03-26 23:17:54',-1),
(894,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/pcenter.html',17,'2018-03-26 23:18:17','2018-03-26 23:18:34',-1),
(895,'http://localhost:8080/index.html','http://localhost:8080/pcenter.html',1,'2018-03-26 23:18:55','2018-03-26 23:18:56',-1),
(896,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/index.html',102,'2018-03-26 23:18:58','2018-03-26 23:20:40',-1),
(897,'http://localhost:8080/index.html','http://localhost:8080/pcenter.html',7702,'2018-03-26 23:23:45','2018-03-27 01:32:07',-1),
(898,'http://localhost:8080/index.html','http://localhost:8080/pcenter.html',3,'2018-03-27 02:52:06','2018-03-27 02:52:09',-1),
(899,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/index.html',65,'2018-03-27 02:52:13','2018-03-27 02:53:18',-1),
(900,'http://localhost:8080/index.html','http://localhost:8080/pcenter.html',1,'2018-03-27 03:10:50','2018-03-27 03:10:51',-1),
(901,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/index.html',1,'2018-03-27 03:10:54','2018-03-27 03:10:55',-1),
(902,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/coursemanager.html',73,'2018-03-27 03:10:58','2018-03-27 03:12:11',-1),
(903,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/laboratory.html',0,'2018-03-27 03:12:14','2018-03-27 03:12:14',-1),
(904,'http://localhost:8080/laboratory.html#/','http://localhost:8080/coursemanager.html',0,'2018-03-27 03:12:17','2018-03-27 03:12:17',-1),
(905,'http://localhost:8080/download.html#/','http://localhost:8080/laboratory.html',1,'2018-03-27 03:12:21','2018-03-27 03:12:22',-1),
(906,'http://localhost:8080/laboratory.html#/','http://localhost:8080/',2,'2018-03-28 09:59:45','2018-03-28 09:59:47',-1),
(907,'http://127.0.0.1:8080/','http://localhost:8080/login.html',2,'2018-03-28 10:00:08','2018-03-28 10:00:10',-1),
(908,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',4,'2018-03-28 10:00:22','2018-03-28 10:00:26',-1),
(909,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/pcenter.html',9,'2018-03-28 10:00:58','2018-03-28 10:01:07',-1),
(910,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/pcenter.html',169,'2018-03-28 10:37:23','2018-03-28 10:40:12',-1),
(911,'http://127.0.0.1:8080/','http://localhost:8080/login.html',3,'2018-04-01 04:56:22','2018-04-01 04:56:25',-1),
(912,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',4,'2018-04-01 04:56:39','2018-04-01 04:56:43',-1),
(913,'http://127.0.0.1:8080/','http://localhost:8080/login.html',0,'2018-04-01 23:56:07','2018-04-01 23:56:07',-1),
(914,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',1,'2018-04-01 23:56:19','2018-04-01 23:56:20',-1),
(915,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/pcenter.html',0,'2018-04-01 23:57:50','2018-04-01 23:57:50',-1),
(916,'http://localhost:8080/laboratory.html#/','http://localhost:8080/',5,'2018-04-08 13:08:24','2018-04-08 13:08:29',-1),
(917,'http://127.0.0.1:8080/','http://localhost:8080/login.html',2,'2018-04-08 13:08:47','2018-04-08 13:08:49',-1),
(918,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',3,'2018-04-08 13:09:13','2018-04-08 13:09:16',-1),
(919,'http://127.0.0.1:8080/laboratory.html#/detail?index=3','http://127.0.0.1:8080/',6,'2018-04-08 13:09:19','2018-04-08 13:09:25',-1),
(920,'http://127.0.0.1:8080/laboratory.html#/slb','http://127.0.0.1:8080/laboratory.html',30,'2018-04-08 13:09:28','2018-04-08 13:09:58',-1),
(921,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',4,'2018-04-08 13:10:39','2018-04-08 13:10:43',-1),
(922,'http://localhost:8080/introduce.html#/','http://localhost:8080/',169,'2018-04-09 00:49:08','2018-04-09 00:51:57',-1),
(923,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',50,'2018-04-09 00:52:02','2018-04-09 00:52:52',-1),
(924,'http://localhost:8080/newsdetail.html?index=27','http://localhost:8080/news.html',73,'2018-04-09 00:52:56','2018-04-09 00:54:09',-1),
(925,'http://localhost:8080/announcement.html#/','http://localhost:8080/newsdetail.html?index=27',204,'2018-04-09 00:54:13','2018-04-09 00:57:37',-1),
(926,'http://localhost:8080/announcementdetail.html?index=4','http://localhost:8080/announcement.html',73,'2018-04-09 00:57:42','2018-04-09 00:58:55',-1),
(927,'http://localhost:8080/guide.html#/quality','http://localhost:8080/announcementdetail.html?index=4',147,'2018-04-09 00:58:59','2018-04-09 01:01:26',-1),
(928,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',88,'2018-04-09 01:01:29','2018-04-09 01:02:57',-1),
(929,'http://localhost:8080/download.html#/','http://localhost:8080/expteaching.html',72,'2018-04-09 01:03:01','2018-04-09 01:04:13',-1),
(930,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/download.html',174,'2018-04-09 01:04:17','2018-04-09 01:07:11',-1),
(931,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/laboratory.html',66,'2018-04-09 01:07:14','2018-04-09 01:08:20',-1),
(932,'http://localhost:8080/index.html','http://localhost:8080/pcenter.html',4970,'2018-04-09 10:56:43','2018-04-09 12:19:33',-1),
(933,'http://localhost:8080/introduce.html#/','http://localhost:8080/index.html',1,'2018-04-09 12:19:34','2018-04-09 12:19:35',-1),
(934,'http://localhost:8080/news.html#/','http://localhost:8080/introduce.html',0,'2018-04-09 12:19:39','2018-04-09 12:19:39',-1),
(935,'http://localhost:8080/announcement.html#/','http://localhost:8080/news.html',0,'2018-04-09 12:19:43','2018-04-09 12:19:43',-1),
(936,'http://localhost:8080/guide.html#/','http://localhost:8080/announcement.html',0,'2018-04-09 12:19:47','2018-04-09 12:19:47',-1),
(937,'http://localhost:8080/expteaching.html#/','http://localhost:8080/guide.html',0,'2018-04-09 12:19:50','2018-04-09 12:19:50',-1),
(938,'http://localhost:8080/download.html#/','http://localhost:8080/expteaching.html',1,'2018-04-09 12:19:51','2018-04-09 12:19:52',-1),
(939,'http://localhost:8080/laboratory.html#/','http://localhost:8080/download.html',2,'2018-04-09 12:19:54','2018-04-09 12:19:56',-1),
(940,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/laboratory.html',2,'2018-04-09 12:20:00','2018-04-09 12:20:02',-1),
(941,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/',784,'2018-04-09 15:00:27','2018-04-09 15:13:31',-1),
(942,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/',8,'2018-04-09 15:13:35','2018-04-09 15:13:43',-1),
(943,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/pcenter.html',48,'2018-04-09 15:17:08','2018-04-09 15:17:56',-1),
(944,'http://localhost:8080/introduce.html#/','http://localhost:8080/laboratory.html',1,'2018-04-09 15:17:59','2018-04-09 15:18:00',-1),
(945,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/introduce.html',7,'2018-04-09 15:18:04','2018-04-09 15:18:11',-1),
(946,'http://localhost:8080/laboratory.html#/','http://localhost:8080/coursemanager.html',32,'2018-04-09 15:18:14','2018-04-09 15:18:46',-1),
(947,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/laboratory.html',306,'2018-04-09 15:18:54','2018-04-09 15:24:00',-1),
(948,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/laboratory.html',96,'2018-04-09 15:24:05','2018-04-09 15:25:41',-1),
(949,'http://localhost:8080/index.html','http://localhost:8080/pcenter.html',1,'2018-04-09 15:38:32','2018-04-09 15:38:33',-1),
(950,'http://127.0.0.1:8080/','http://localhost:8080/login.html',14,'2018-04-09 15:38:56','2018-04-09 15:39:10',-1),
(951,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/',6,'2018-04-09 15:39:14','2018-04-09 15:39:20',-1),
(952,'http://localhost:8080/laboratory.html#/','http://localhost:8080/',1,'2018-04-12 15:09:20','2018-04-12 15:09:21',-1),
(953,'http://127.0.0.1:8080/','http://localhost:8080/login.html',1,'2018-04-12 15:10:36','2018-04-12 15:10:37',-1),
(954,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',8,'2018-04-12 15:10:48','2018-04-12 15:10:56',-1),
(955,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/',62,'2018-05-04 04:26:20','2018-05-04 04:27:22',-1),
(956,'http://localhost:8080/announcement.html#/','http://localhost:8080/coursemanager.html',32,'2018-05-04 04:27:24','2018-05-04 04:27:56',-1),
(957,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/announcement.html',1,'2018-05-04 04:27:59','2018-05-04 04:28:00',-1),
(958,'http://localhost:8080/laboratory.html#/','http://localhost:8080/coursemanager.html',1,'2018-05-04 04:28:03','2018-05-04 04:28:04',-1),
(959,'http://127.0.0.1:8080/','http://localhost:8080/login.html',7,'2018-05-04 04:28:22','2018-05-04 04:28:29',-1),
(960,'http://localhost:8080/index.html','http://localhost:8080/',1,'2018-05-04 04:33:54','2018-05-04 04:33:55',-1),
(961,'http://127.0.0.1:8080/','http://localhost:8080/login.html',1,'2018-05-04 04:36:26','2018-05-04 04:36:27',-1),
(962,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',2,'2018-05-04 04:36:36','2018-05-04 04:36:38',-1),
(963,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/',59,'2018-05-04 04:36:42','2018-05-04 04:37:41',-1),
(964,'http://127.0.0.1:8080/laboratory.html#/detail?index=1','http://127.0.0.1:8080/laboratory.html',10,'2018-05-04 04:37:44','2018-05-04 04:37:54',-1),
(965,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',40,'2018-05-04 04:39:13','2018-05-04 04:39:53',-1),
(966,'http://127.0.0.1:8080/index.html','http://127.0.0.1:8080/pcenter.html',2,'2018-05-04 04:39:55','2018-05-04 04:39:57',-1),
(967,'http://127.0.0.1:8080/laboratory.html#/','http://127.0.0.1:8080/index.html',5,'2018-05-04 04:39:59','2018-05-04 04:40:04',-1),
(968,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',35,'2018-05-04 04:40:53','2018-05-04 04:41:28',-1),
(969,'http://127.0.0.1:8080/','http://127.0.0.1:8080/login.html',1,'2018-05-04 04:42:14','2018-05-04 04:42:15',-1),
(970,'http://127.0.0.1:8080/laboratory.html#/detail?index=2','http://127.0.0.1:8080/',673,'2018-05-04 04:42:17','2018-05-04 04:53:30',-1),
(971,'http://localhost:8080/index.html','http://localhost:8080/pcenter.html',0,'2018-05-04 05:02:21','2018-05-04 05:02:21',-1),
(972,'http://localhost:8080/laboratory.html#/detail?index=2','http://localhost:8080/index.html',17,'2018-05-04 05:02:24','2018-05-04 05:02:41',-1),
(973,'http://localhost:8080/coursemanager.html#/','http://localhost:8080/laboratory.html',1,'2018-05-04 05:02:44','2018-05-04 05:02:45',-1),
(974,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/',9,'2018-05-04 06:23:30','2018-05-04 06:23:39',-1),
(975,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/pcenter.html',19,'2018-05-04 06:24:09','2018-05-04 06:24:28',-1),
(976,'http://localhost:8080/laboratory.html#/detail?index=1','http://localhost:8080/pcenter.html',8,'2018-05-04 06:24:31','2018-05-04 06:24:39',-1),
(977,'http://localhost:8080/index.html','http://localhost:8080/laboratory.html',1,'2018-05-04 06:24:42','2018-05-04 06:24:43',-1),
(978,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/pcenter.html',1992,'2018-05-04 06:25:02','2018-05-04 06:58:14',-1),
(979,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/pcenter.html',14,'2018-05-04 07:00:25','2018-05-04 07:00:39',-1),
(980,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/pcenter.html',23,'2018-05-04 07:01:39','2018-05-04 07:02:02',-1),
(981,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/pcenter.html',9,'2018-05-04 07:02:06','2018-05-04 07:02:15',-1),
(982,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/pcenter.html',10,'2018-05-04 07:18:39','2018-05-04 07:18:49',-1),
(983,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/pcenter.html',11,'2018-05-04 07:21:46','2018-05-04 07:21:57',-1),
(984,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/pcenter.html',26,'2018-05-04 07:23:45','2018-05-04 07:24:11',-1),
(985,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/pcenter.html',6,'2018-05-04 07:24:15','2018-05-04 07:24:21',-1),
(986,'http://localhost:8080/laboratory.html#/detail?index=2','http://localhost:8080/pcenter.html',7,'2018-05-04 07:26:37','2018-05-04 07:26:44',-1),
(987,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/pcenter.html',10,'2018-05-04 07:34:00','2018-05-04 07:34:10',-1),
(988,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/pcenter.html',10,'2018-05-04 15:07:16','2018-05-04 15:07:26',-1),
(989,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/pcenter.html',209,'2018-05-04 15:07:43','2018-05-04 15:11:12',-1),
(990,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/pcenter.html',22,'2018-05-04 15:11:17','2018-05-04 15:11:39',-1),
(991,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/pcenter.html',10,'2018-05-04 15:11:43','2018-05-04 15:11:53',-1),
(992,'http://localhost:8080/index.html','http://localhost:8080/pcenter.html',1,'2018-05-04 15:12:23','2018-05-04 15:12:24',-1),
(993,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/index.html',109,'2018-05-04 15:12:28','2018-05-04 15:14:17',-1),
(994,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/index.html',60,'2018-05-04 15:14:19','2018-05-04 15:15:19',-1),
(995,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/index.html',6,'2018-05-04 15:15:20','2018-05-04 15:15:26',-1),
(996,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/pcenter.html',55,'2018-05-04 15:15:49','2018-05-04 15:16:44',-1),
(997,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/pcenter.html',11,'2018-05-04 15:20:15','2018-05-04 15:20:26',-1),
(998,'http://localhost:8080/laboratory.html#/detail?index=3','http://localhost:8080/pcenter.html',20,'2018-05-04 15:27:09','2018-05-04 15:27:29',-1),
(999,'http://localhost:8080/laboratory.html#/detail?index=7','http://localhost:8080/pcenter.html',14,'2018-05-04 15:33:51','2018-05-04 15:34:05',-1),
(1000,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/pcenter.html',11,'2018-05-04 15:37:28','2018-05-04 15:37:39',-1),
(1001,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/pcenter.html',22,'2018-05-04 15:38:19','2018-05-04 15:38:41',-1),
(1002,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/pcenter.html',6,'2018-05-04 15:38:46','2018-05-04 15:38:52',-1),
(1003,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/pcenter.html',11,'2018-05-04 15:41:47','2018-05-04 15:41:58',-1),
(1004,'http://localhost:8080/laboratory.html#/detail?index=4','http://localhost:8080/pcenter.html',20,'2018-05-04 15:43:03','2018-05-04 15:43:23',-1),
(1005,'http://localhost:8090/cec/laboratory.html#/','http://localhost:8090/cec/',2,'2018-05-05 10:06:35','2018-05-05 10:06:37',-1),
(1006,'http://localhost:8090/cec/laboratory.html#/','http://localhost:8090/cec/laboratory.html',122,'2018-05-05 10:06:42','2018-05-05 10:08:44',-1),
(1007,'http://localhost:8090/cec/laboratory.html#/','http://localhost:8090/cec/login.html',3,'2018-05-05 10:08:46','2018-05-05 10:08:49',-1),
(1008,'http://127.0.0.1:8090/cec/download.html#/','http://127.0.0.1:8090/cec/',1,'2018-05-05 10:26:51','2018-05-05 10:26:52',-1),
(1009,'http://127.0.0.1:8090/cec/introduce.html#/','http://127.0.0.1:8090/cec/download.html',0,'2018-05-05 10:26:54','2018-05-05 10:26:54',-1),
(1010,'http://127.0.0.1:8090/cec/news.html#/','http://127.0.0.1:8090/cec/introduce.html',0,'2018-05-05 10:26:57','2018-05-05 10:26:57',-1),
(1011,'http://127.0.0.1:8090/cec/introduce.html#/','http://127.0.0.1:8090/cec/news.html',1,'2018-05-05 10:27:00','2018-05-05 10:27:01',-1),
(1012,'http://127.0.0.1:8090/cec/announcement.html#/','http://127.0.0.1:8090/cec/introduce.html',0,'2018-05-05 10:27:04','2018-05-05 10:27:04',-1),
(1013,'http://127.0.0.1:8090/cec/guide.html#/','http://127.0.0.1:8090/cec/announcement.html',0,'2018-05-05 10:27:06','2018-05-05 10:27:06',-1),
(1014,'http://127.0.0.1:8090/cec/expteaching.html#/','http://127.0.0.1:8090/cec/guide.html',0,'2018-05-05 10:27:08','2018-05-05 10:27:08',-1),
(1015,'http://127.0.0.1:8090/cec/download.html#/','http://127.0.0.1:8090/cec/expteaching.html',0,'2018-05-05 10:27:10','2018-05-05 10:27:10',-1),
(1016,'http://127.0.0.1:8090/cec/laboratory.html#/','http://127.0.0.1:8090/cec/download.html',5,'2018-05-05 10:27:13','2018-05-05 10:27:18',-1),
(1017,'http://127.0.0.1:8090/cec/laboratory.html#/','http://127.0.0.1:8090/cec/pcenter.html',82,'2018-05-05 10:27:39','2018-05-05 10:29:01',-1),
(1018,'http://127.0.0.1:8090/cec/index.html','http://127.0.0.1:8090/cec/laboratory.html',2,'2018-05-05 10:29:03','2018-05-05 10:29:05',-1),
(1019,'http://127.0.0.1:8090/cec/index.html','http://127.0.0.1:8090/cec/login.html',2,'2018-05-05 10:29:19','2018-05-05 10:29:21',-1),
(1020,'http://127.0.0.1:8090/cec/index.html','http://127.0.0.1:8090/cec/pcenter.html',2,'2018-05-05 10:29:28','2018-05-05 10:29:30',-1),
(1021,'http://127.0.0.1:8090/cec/laboratory.html#/','http://127.0.0.1:8090/cec/index.html',2,'2018-05-05 10:29:32','2018-05-05 10:29:34',-1),
(1022,'http://127.0.0.1:8090/cec/download.html#/','http://127.0.0.1:8090/cec/laboratory.html',0,'2018-05-05 10:29:36','2018-05-05 10:29:36',-1),
(1023,'http://127.0.0.1:8090/cec/laboratory.html#/detail?index=1','http://127.0.0.1:8090/cec/download.html',14,'2018-05-05 10:29:38','2018-05-05 10:29:52',-1),
(1024,'http://127.0.0.1:8090/cec/index.html','http://127.0.0.1:8090/cec/laboratory.html',1,'2018-05-05 10:29:53','2018-05-05 10:29:54',-1),
(1025,'http://127.0.0.1:8090/cec/laboratory.html#/detail?index=4','http://127.0.0.1:8090/cec/index.html',9,'2018-05-05 10:29:56','2018-05-05 10:30:05',-1);

/*Table structure for table `theme` */

DROP TABLE IF EXISTS `theme`;

CREATE TABLE `theme` (
  `id` int(11) NOT NULL COMMENT '索引',
  `current_color` varchar(16) DEFAULT NULL COMMENT '当前主题色',
  `previous_color` varchar(16) DEFAULT NULL COMMENT '上一次设置的主题色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `theme` */

insert  into `theme`(`id`,`current_color`,`previous_color`) values 
(0,'#409eff',''),
(1,'#106f00','#409eff');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`type`,`realname`) values 
(1,'1440232300','233666',1,'李梅'),
(2,'1440121201','888888',1,'周华康'),
(3,'1440232302','888888',1,'天美'),
(4,'1440232303','pl5245',1,'郑培员'),
(5,'1440232304','52kusd',1,'主任'),
(6,'1440232305','po5255',1,'三麦');

/*Table structure for table `userdetail` */

DROP TABLE IF EXISTS `userdetail`;

CREATE TABLE `userdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `autograph` varchar(200) DEFAULT NULL COMMENT '签名',
  PRIMARY KEY (`id`),
  KEY `user_detail` (`userId`),
  CONSTRAINT `t_detail` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `userdetail` */

insert  into `userdetail`(`id`,`userId`,`nickname`,`sex`,`age`,`phone`,`email`,`address`,`autograph`) values 
(1,1,'梅子梅子','男',23,'15623548562','66615loks@163.com','广东广州市番禺区番禺大道163号','士大夫身份'),
(2,2,'哈士奇K','女',22,'18812125362','opsd52@163.com','四川成都','舞动青春，踏步向前'),
(3,3,'道古','男',30,'15666254858','2525sd@163.com','北京朝阳区163号','这人很懒，什么都没有留下'),
(4,4,'小南国本','男',25,'15625454575','123585242@qq.com','广东潮汕地区','来来去去，走走停停'),
(5,5,'op欧克','女',23,'18852625254','fki1234@163.com','广东广州市天河区员村二横路12号','过了一年又大了一岁，过得真快'),
(6,6,'123木头人','男',32,'13620156250','636363@qq.com','浙江杭州市','西湖的美！');

/*Table structure for table `week` */

DROP TABLE IF EXISTS `week`;

CREATE TABLE `week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(20) NOT NULL COMMENT '星期几',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `week` */

insert  into `week`(`id`,`day`) values 
(1,'星期一'),
(2,'星期二'),
(3,'星期三'),
(4,'星期四'),
(5,'星期五'),
(6,'星期六');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
