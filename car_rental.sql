/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.28 : Database - car_rental
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`car_rental` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `car_rental`;

/*Table structure for table `biaozhi` */

DROP TABLE IF EXISTS `biaozhi`;

CREATE TABLE `biaozhi` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(20) DEFAULT NULL,
  `b_introduce` varchar(50) DEFAULT NULL,
  `b_img` varchar(1000) DEFAULT NULL,
  `b_date` date DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `biaozhi` */

insert  into `biaozhi`(`b_id`,`b_name`,`b_introduce`,`b_img`,`b_date`) values (3,'大众','国产','201703161603145963.jpg','2017-03-16'),(4,'宝马','发动机很好','201703161719064749.jpg','2017-03-16'),(5,'奔驰','英国产，发动机好','201703161725115747.jpg','2017-03-16'),(6,'奥迪','美国产','201703161731068490.jpg','2017-03-15'),(7,'保时捷','德国产，好动力','201703161831177851.jpg','2017-03-14'),(8,'兰博基尼','美国产，高端大气上档次','201703161841311030.jpg','2017-03-15'),(9,'法拉利','跑车，发动机很强大','201703161846357818.jpg','2017-03-15');

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  `b_code` varchar(10) DEFAULT NULL,
  `b_kuanshi` varchar(10) DEFAULT NULL,
  `b_buydate` date DEFAULT NULL,
  `b_zuowei` int(11) DEFAULT NULL,
  `b_chemen` int(11) DEFAULT NULL,
  `b_ranliao` varchar(10) DEFAULT NULL,
  `b_biansu` varchar(10) DEFAULT NULL,
  `b_zuoyi` varchar(10) DEFAULT NULL,
  `b_isdao` varchar(10) DEFAULT NULL,
  `b_iswindow` varchar(10) DEFAULT NULL,
  `b_introduce` varchar(255) DEFAULT NULL,
  `b_price` double(5,2) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `car` */

insert  into `car`(`c_id`,`t_id`,`b_id`,`b_code`,`b_kuanshi`,`b_buydate`,`b_zuowei`,`b_chemen`,`b_ranliao`,`b_biansu`,`b_zuoyi`,`b_isdao`,`b_iswindow`,`b_introduce`,`b_price`,`state`) values (6,1,3,'甘A-123','高配','2017-03-20',2,2,'汽油','手动','皮质','有','有','好车',124.00,'Y'),(8,7,3,'甘A-003','高配','2017-03-20',8,4,'汽油','手动','皮质','有','有','载客量大，适合旅游',180.00,'Z'),(10,5,4,'甘A-1110','高配','2017-03-21',2,2,'电力','手动','皮质','无','无','可以的，好车，适合自驾游',82.00,'N'),(11,2,6,'甘A-221','典雅款','2017-03-23',2,2,'汽油','手自一体','皮质','有','有','好车，适合自驾游',145.00,'Y'),(14,1,9,'甘A-888','高配','2017-03-24',2,2,'汽油','手动','皮质','有','有','适合赛车、越野',210.00,'Y'),(15,2,3,'甘A-201','高配','2017-03-29',4,4,'汽油','手动','皮质','有','有','适合旅游啊',139.00,'Y'),(16,7,9,'甘A-202','运动款','2017-03-29',2,2,'汽油','手动','皮质','有','有','适合赛车',201.00,'Y'),(17,5,6,'甘A-203','高配','2017-03-29',2,2,'汽油','手动','皮布结合','无','无','还好，一人可独行',78.00,'Y'),(18,7,8,'甘A-009','高配','2017-03-29',2,2,'汽油','手动','皮质','有','有','尊贵版，好车，很优惠啊',166.00,'Z'),(19,2,7,'甘A-209','典雅款','2017-03-29',4,4,'CNG','其他','皮质','有','有','这款车很优惠啊',114.00,'Y'),(20,7,6,'甘A-886','运动款','2017-03-29',2,2,'汽油','手动','皮质','有','有','推荐一下，真的好啊',138.00,'Y'),(21,2,5,'甘A-520','高配','2017-03-29',2,2,'汽油','手动','皮质','有','有','好车啊，高配',198.00,'Y'),(22,5,6,'甘A-2226','高配','2017-04-17',2,2,'汽油','手动','皮质','有','有','好车',112.00,'Y'),(23,1,3,'甘A-2221','高配','2017-04-17',6,6,'汽油','手动','皮质','有','有','挺好的车，做的人多啊',109.00,'Y');

/*Table structure for table `car_img` */

DROP TABLE IF EXISTS `car_img`;

CREATE TABLE `car_img` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_code` varchar(20) DEFAULT NULL,
  `img1` varchar(30) DEFAULT NULL,
  `img2` varchar(30) DEFAULT NULL,
  `img3` varchar(30) DEFAULT NULL,
  `img4` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `car_img` */

insert  into `car_img`(`i_id`,`b_code`,`img1`,`img2`,`img3`,`img4`) values (6,'甘A-123','201703241202308392.jpg','201703241202308019.jpg','20170324120230897.jpg','20170324120230301.jpg'),(8,'甘A-003','201703241211596107.jpg','201703241211591693.jpg','20170324121159186.jpg','201703241211598894.jpg'),(10,'甘A-1110','20170324160406236.jpg','20170324160406776.jpg','201703241604066366.jpg','20170324160406102.jpg'),(11,'甘A-221','201703241957371749.jpg','201703241957378047.jpg','201703241957375567.jpg','201703241957374468.jpg'),(14,'甘A-888','201703242006261314.jpg','20170324200626406.jpg','201703242006267838.jpg','201703242006261841.jpg'),(15,'甘A-201','201703291244002628.jpg','201703291244003648.jpg','201703291244006855.jpg','201703291244003413.jpg'),(16,'甘A-202','201703291245245696.jpg','201703291245245533.jpg','201703291245243938.jpg','201703291245249368.jpg'),(17,'甘A-203','201703291252148559.jpg','201703291252149249.jpg','201703291252147412.jpg','201703291252142810.jpg'),(18,'甘A-009','20170329125811235.jpg','201703291258112096.jpg','201703291258118659.jpg','201703291258113195.jpg'),(19,'甘A-209','201703291300186281.jpg','201703291300188527.jpg','201703291300187611.jpg','201703291300187652.jpg'),(20,'甘A-886','201703291306283816.jpg','201703291306287882.jpg','201703291306289014.jpg','201703291306287885.jpg'),(21,'甘A-520','201703291308247063.jpg','201703291308241372.jpg','201703291308244074.jpg','201703291308242268.jpg'),(23,'甘A-2226','201704171326099548.jpg','201704171326098857.jpg','201704171326092590.jpg','201704171326096407.jpg'),(24,'甘A-2221','201704171327234546.jpg','201704171327233877.jpg','201704171327232951.jpg','201704171327237015.jpg');

/*Table structure for table `diqu` */

DROP TABLE IF EXISTS `diqu`;

CREATE TABLE `diqu` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `d_name` varchar(20) DEFAULT NULL,
  `d_pname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `diqu` */

insert  into `diqu`(`d_id`,`p_id`,`d_name`,`d_pname`) values (1,1,'兰州市','兰州租赁中心'),(2,1,'定西市','定西租赁中心'),(3,2,'西安市','西安租赁中心'),(4,2,'安康市','安康租赁中心'),(5,3,'郑州市','郑州租赁中心'),(6,3,'开封市','开封租赁中心');

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(10) NOT NULL,
  `m_psw` varchar(10) NOT NULL,
  `m_sex` char(1) DEFAULT NULL,
  `m_age` int(2) DEFAULT NULL,
  `m_card` varchar(20) NOT NULL,
  `m_address` varchar(20) DEFAULT NULL,
  `m_phone` varchar(15) DEFAULT NULL,
  `m_img` varchar(1000) DEFAULT NULL,
  `m_date` date DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `manager` */

insert  into `manager`(`m_id`,`m_name`,`m_psw`,`m_sex`,`m_age`,`m_card`,`m_address`,`m_phone`,`m_img`,`m_date`,`openid`) values (1,'曹黎明','123456','男',25,'622427199407150923','甘肃兰州','18215142113','201310538.jpg','2017-02-15',NULL);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_card` varchar(20) NOT NULL,
  `m_info` varchar(200) DEFAULT NULL,
  `m_return` varchar(200) DEFAULT NULL,
  `m_date` date DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`m_id`,`u_card`,`m_info`,`m_return`,`m_date`) values (22,'622427199407150965','优惠多多，挺好的啊','恩恩','2017-03-28'),(24,'622427199401258245','挺好的啊，优惠多多，希望把好车多加点，这样就有更好的效益啊，是吧？哈哈',NULL,'2017-03-28'),(25,'622427199407150965','挺好的啊，希望继续努力','你说的对','2017-03-31'),(26,'622427199407150965','真的挺好的啊！哈哈',NULL,'2017-04-22'),(27,'622427199407150965','我感觉确实挺好的，希望继续啊',NULL,'2017-04-24');

/*Table structure for table `orderlist` */

DROP TABLE IF EXISTS `orderlist`;

CREATE TABLE `orderlist` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_code` varchar(50) NOT NULL,
  `u_card` varchar(20) NOT NULL,
  `u_jscard` varchar(20) NOT NULL,
  `b_code` varchar(20) NOT NULL,
  `b_price` double(5,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `days` int(11) DEFAULT NULL,
  `allMoney` int(11) DEFAULT NULL,
  `o_bx` varchar(20) DEFAULT NULL,
  `d_id` int(11) NOT NULL,
  `o_state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `orderlist` */

insert  into `orderlist`(`o_id`,`o_code`,`u_card`,`u_jscard`,`b_code`,`b_price`,`start_date`,`end_date`,`days`,`allMoney`,`o_bx`,`d_id`,`o_state`) values (5,'81nh9t4jh0014001113314','622427199407150965','201310538123','甘A-123',124.00,'2017-03-19','2017-03-20',1,112,'未购买',4,'已还车'),(6,'wmcwc5yup001491445619365','622427199407150965','201310538123','甘A-886',138.00,'2017-04-26','2017-04-28',2,283,'已购买',2,'已取消'),(8,'$sdypwtmml01491446038982','622427199407150965','201310538123','甘A-209',114.00,'2017-06-28','2017-06-29',1,138,'已购买',4,'已取消'),(10,'g9dcs$t8qp0149543254885','622427199407150965','201310538123','甘A-009',166.00,'2017-06-19','2017-06-23',4,633,'已购买',3,'未支付'),(11,'542354325432','622427199407150965','201310538123','甘A-123',124.00,'2017-04-13','2017-04-18',5,558,'未购买',4,'已还车'),(14,'khq237i06z01492881025554','622427199407150965','201310538123','甘A-2221',109.00,'2017-04-28','2017-04-29',1,98,'未购买',4,'已支付'),(15,'w3gdyxjec801493030725081','622427199407550933','20130415','甘A-003',180.00,'2017-04-28','2017-04-29',1,197,'已购买',3,'未支付');

/*Table structure for table `province` */

DROP TABLE IF EXISTS `province`;

CREATE TABLE `province` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `province` */

insert  into `province`(`p_id`,`p_name`) values (1,'甘肃省'),(2,'陕西省'),(3,'河南省');

/*Table structure for table `systemset` */

DROP TABLE IF EXISTS `systemset`;

CREATE TABLE `systemset` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(50) DEFAULT NULL,
  `s_logo` varchar(255) DEFAULT NULL,
  `s_video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `systemset` */

insert  into `systemset`(`s_id`,`s_name`,`s_logo`,`s_video`) values (1,'风行天下汽车租赁系统','201704211502329339.jpg','logo.mp4');

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_type` varchar(20) DEFAULT NULL,
  `t_introduce` varchar(100) DEFAULT NULL,
  `t_img` varchar(500) DEFAULT NULL,
  `t_date` date DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `type` */

insert  into `type`(`t_id`,`t_type`,`t_introduce`,`t_img`,`t_date`) values (1,'跑车','发动机发达，速度超快','201703181424405067.jpg','2017-03-14'),(2,'SUV','舒适，宽敞，易于自驾游','20170318143939569.jpg','2017-03-15'),(5,'皮卡','人货两载型，马力大','201703181446278170.jpg','2017-03-14'),(7,'MVP','车大，载客数多','201703181448284841.jpg','2017-03-15');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(10) NOT NULL,
  `u_psw` varchar(10) NOT NULL,
  `u_sex` char(1) DEFAULT NULL,
  `u_age` int(2) DEFAULT NULL,
  `u_card` varchar(20) NOT NULL,
  `u_address` varchar(20) DEFAULT NULL,
  `u_phone` varchar(15) DEFAULT NULL,
  `u_img` varchar(1000) DEFAULT NULL,
  `u_jscard` varchar(20) NOT NULL,
  `u_date` date DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`u_id`,`u_name`,`u_psw`,`u_sex`,`u_age`,`u_card`,`u_address`,`u_phone`,`u_img`,`u_jscard`,`u_date`,`openid`) values (1,'zhangsan','123456','男',24,'622427199407150965','甘肃兰州','18215142114','147118442222184737.jpg','201310538123','2015-03-15',NULL),(2,'李斯管','123456','男',24,'622427199407150845','甘肃临洮','18512457892','147112542222184737.jpg','201410569874','2016-03-15',NULL),(3,'王五','654321','女',22,'622427199401258245','甘肃临洮','18809407154','201310538.jpg','201410569821','2017-02-14',NULL),(4,'caoliming','123456','男',23,'622427199407550933','甘肃兰州','18215142113','201704202209521615.jpg','20130415','2017-04-20',NULL),(5,'laoluo','123654','男',23,'622427199407150941','甘肃兰州','18809465059','201704202209521615.jpg','20140521','2017-04-21',NULL);

/*Table structure for table `user_pb` */

DROP TABLE IF EXISTS `user_pb`;

CREATE TABLE `user_pb` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_card` varchar(20) NOT NULL COMMENT '用户身份证',
  `p_pd` int(5) DEFAULT NULL COMMENT '用户积分',
  `p_money` int(5) DEFAULT NULL COMMENT '用户余额',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user_pb` */

insert  into `user_pb`(`p_id`,`u_card`,`p_pd`,`p_money`) values (1,'622427199407150845',6,101),(2,'622427199407150965',55,1148),(3,'622427199401258245',50,1005),(4,'622427199407550933',11,200),(5,'622427199407150941',0,0);

/*Table structure for table `user_recode` */

DROP TABLE IF EXISTS `user_recode`;

CREATE TABLE `user_recode` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_card` varchar(20) NOT NULL COMMENT '用户身份证',
  `r_money` int(5) DEFAULT NULL COMMENT '充钱金额',
  `r_date` date DEFAULT NULL COMMENT '充钱日期',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `user_recode` */

insert  into `user_recode`(`r_id`,`u_card`,`r_money`,`r_date`) values (3,'622427199407150965',200,'2017-04-24'),(4,'622427199407150965',200,'2017-04-24'),(5,'622427199407150965',200,'2017-04-24'),(6,'622427199407150965',100,'2017-04-24'),(7,'622427199407550933',100,'2017-04-24'),(8,'622427199407550933',100,'2017-04-24');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
