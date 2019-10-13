/*
Navicat MySQL Data Transfer

Source Server         : jd-testdb
Source Server Version : 50721
Source Host           : mysql-internet-cn-north-1-ac693d00f82d4293.rds.jdcloud.com:3306
Source Database       : jd_cloud_database

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-10-13 20:52:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for shorturlbase
-- ----------------------------
DROP TABLE IF EXISTS `shorturlbase`;
CREATE TABLE `shorturlbase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_key` varchar(32) DEFAULT NULL,
  `real_url` varchar(2048) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `opaque` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
