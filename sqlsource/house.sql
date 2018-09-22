/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.17 : Database - db_house_project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_house_project` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_house_project`;

/*Table structure for table `tb_adminator` */

DROP TABLE IF EXISTS `tb_adminator`;

CREATE TABLE `tb_adminator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `role` varchar(10) NOT NULL,
  `creat_time` date NOT NULL,
  `change_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_comment` */

DROP TABLE IF EXISTS `tb_comment`;

CREATE TABLE `tb_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `house_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `content` varchar(500) NOT NULL,
  `creat_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_comment_house_id` (`house_id`),
  KEY `tb_comment_user_id` (`user_id`),
  CONSTRAINT `tb_comment_house_id` FOREIGN KEY (`house_id`) REFERENCES `tb_house` (`id`),
  CONSTRAINT `tb_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_house` */

DROP TABLE IF EXISTS `tb_house`;

CREATE TABLE `tb_house` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_id` int(10) unsigned NOT NULL,
  `house_state` varchar(1) NOT NULL,
  `house_type` varchar(1) NOT NULL,
  `price` double unsigned NOT NULL,
  `position_province` varchar(30) NOT NULL,
  `position_city` varchar(30) NOT NULL,
  `position_district` varchar(30) NOT NULL,
  `position_street` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `house_description` varchar(500) NOT NULL,
  `description_img` varchar(200) NOT NULL,
  `creat_time` date NOT NULL,
  `change_time` date DEFAULT NULL,
  `area` double unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_house_master_id` (`master_id`),
  CONSTRAINT `tb_house_master_id` FOREIGN KEY (`master_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `master_id` int(10) unsigned NOT NULL,
  `house_id` int(10) unsigned NOT NULL,
  `order_state` varchar(1) NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `identity_num` varchar(18) DEFAULT NULL,
  `telephone_num` varchar(11) DEFAULT NULL,
  `creat_time` date NOT NULL,
  `solve_time` date DEFAULT NULL,
  `in_time` date NOT NULL,
  `out_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_order_master_id` (`master_id`),
  KEY `tb_order_user_id` (`user_id`),
  KEY `tb_order_house_id` (`house_id`),
  CONSTRAINT `tb_order_house_id` FOREIGN KEY (`house_id`) REFERENCES `tb_house` (`id`),
  CONSTRAINT `tb_order_master_id` FOREIGN KEY (`master_id`) REFERENCES `tb_user` (`id`),
  CONSTRAINT `tb_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(30) NOT NULL COMMENT 'username',
  `password` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL COMMENT '角色：customer普通用户；master房主,默认为普通用户',
  `telephone_num` varchar(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `identity_num` varchar(18) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) DEFAULT NULL,
  `creat_time` date NOT NULL,
  `change_time` date DEFAULT NULL,
  `avatar` varchar(50) NOT NULL COMMENT '用户头像',
  `sex` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
