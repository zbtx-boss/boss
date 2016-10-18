/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : boss

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-10-16 11:59:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for boss_class
-- ----------------------------
DROP TABLE IF EXISTS `boss_class`;
CREATE TABLE `boss_class` (
  `class_id` int(6) NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `class_paper` int(6) NOT NULL COMMENT '外键约束（纸张ID）',
  `class_ink` int(6) NOT NULL COMMENT '外键约束（油墨id）',
  `class_size` int(6) NOT NULL COMMENT '产品类的大小（多少K）',
  `class_photo` int(11) NOT NULL COMMENT '版图ID（图案id）',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for boss_customer
-- ----------------------------
DROP TABLE IF EXISTS `boss_customer`;
CREATE TABLE `boss_customer` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `cus_name` varchar(12) NOT NULL COMMENT '客户姓名',
  `cus_phone` int(11) NOT NULL COMMENT '客户电话',
  `cus_addr` text NOT NULL COMMENT '客户地址',
  `cus_cashCard` int(20) DEFAULT NULL COMMENT '客户默认银行卡',
  `cus_over` float NOT NULL DEFAULT '0' COMMENT '客户余额（元）',
  PRIMARY KEY (`cus_id`),
  UNIQUE KEY `cus_cashCard` (`cus_cashCard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Table structure for boss_factory
-- ----------------------------
DROP TABLE IF EXISTS `boss_factory`;
CREATE TABLE `boss_factory` (
  `fac_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '纸厂ID',
  `fac_name` int(30) NOT NULL COMMENT '纸厂名字',
  `fac_owner` varchar(20) NOT NULL COMMENT '纸厂主人',
  `fac_addr` varchar(50) NOT NULL COMMENT '纸厂地址',
  `fac_over` int(11) NOT NULL COMMENT '纸厂余额(+为多余-为欠的)',
  PRIMARY KEY (`fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='纸厂';

-- ----------------------------
-- Table structure for boss_inks
-- ----------------------------
DROP TABLE IF EXISTS `boss_inks`;
CREATE TABLE `boss_inks` (
  `lnk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '油墨ID',
  `lnk_factory` varchar(40) NOT NULL COMMENT '油墨厂家',
  `lnk_price` float NOT NULL COMMENT '油墨单价（元/桶）',
  `lnk_color` varchar(10) NOT NULL COMMENT '油墨颜色',
  PRIMARY KEY (`lnk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='油墨表';

-- ----------------------------
-- Table structure for boss_paper
-- ----------------------------
DROP TABLE IF EXISTS `boss_paper`;
CREATE TABLE `boss_paper` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '纸id（外键约束)',
  `paper_size` int(8) NOT NULL COMMENT '纸大小（****x****)',
  `paper_thickness` int(11) NOT NULL COMMENT '纸厚度（g）',
  `paper_factory` int(11) NOT NULL COMMENT '纸厂ID（外键约束）',
  `paper_price` int(5) NOT NULL COMMENT '价格（元/吨）',
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='原料（纸）';

-- ----------------------------
-- Table structure for boss_product
-- ----------------------------
DROP TABLE IF EXISTS `boss_product`;
CREATE TABLE `boss_product` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `pro_location` varchar(8) NOT NULL COMMENT '产品存放位置',
  `pro_pages` int(11) NOT NULL COMMENT '页数',
  `pro_repertory` int(11) DEFAULT NULL COMMENT '库存',
  `pro_class` int(11) NOT NULL COMMENT '外键约束（属于哪个类别）',
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表(非多少K)';

-- ----------------------------
-- Table structure for boss_user
-- ----------------------------
DROP TABLE IF EXISTS `boss_user`;
CREATE TABLE `boss_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(10) NOT NULL COMMENT '姓名',
  `user_role` int(3) NOT NULL COMMENT '用户角色（0/1/2/3/4.）',
  `user_pass` varchar(20) NOT NULL COMMENT '用户密码',
  `user_wageBase` float DEFAULT NULL COMMENT '工资基数',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(300) NOT NULL,
  `password_reset_token` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `auth_key` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
