/*
Navicat MySQL Data Transfer

Source Server         : CourseOnline
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : estoresystem

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2018-07-03 19:55:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `order_id` varchar(100) NOT NULL DEFAULT '',
  `product_id` varchar(100) NOT NULL DEFAULT '',
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('5dc927e2-9c4f-4817-bca6-a11d796db8c7', '482b5255-741d-4466-8596-26b68db91dbb', '4');
INSERT INTO `orderitem` VALUES ('86ee3a0b-b502-497d-92bf-7265328224b5', 'fca76bb3-73f3-456b-8a9d-6607cd4a09a1', '3');
INSERT INTO `orderitem` VALUES ('87735ecf-05ae-463c-84d5-d85825b3a69a', 'bfa6d99f-ad8e-4304-acde-7eed55520b5f', '1');
INSERT INTO `orderitem` VALUES ('c6905f96-366d-473f-b531-b31a6a347712', '482b5255-741d-4466-8596-26b68db91dbb', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `money` double DEFAULT NULL,
  `receiverinfo` varchar(255) DEFAULT NULL,
  `paystate` int(11) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('5dc927e2-9c4f-4817-bca6-a11d796db8c7', '7200', 'sadf', '1', '2014-10-06 15:22:32', '4');
INSERT INTO `orders` VALUES ('86ee3a0b-b502-497d-92bf-7265328224b5', '570', 'sdaf', '1', '2014-10-06 15:22:33', '5');
INSERT INTO `orders` VALUES ('87735ecf-05ae-463c-84d5-d85825b3a69a', '99', '北京', '0', '2014-10-06 16:06:30', '4');
INSERT INTO `orders` VALUES ('c6905f96-366d-473f-b531-b31a6a347712', '1800', 'aasdf', '1', '2014-10-06 15:22:35', '1');

-- ----------------------------
-- Table structure for privileges
-- ----------------------------
DROP TABLE IF EXISTS `privileges`;
CREATE TABLE `privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privileges
-- ----------------------------
INSERT INTO `privileges` VALUES ('1', '添加商品');
INSERT INTO `privileges` VALUES ('2', '查看订单');
INSERT INTO `privileges` VALUES ('3', '生成订单');
INSERT INTO `privileges` VALUES ('4', '下载榜单');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` varchar(100) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('05cbb6e2-7840-49a9-b1cc-bcf5256490dd', '你坏', '30', '文学类', '20', '/upload/15/14/add05165-8f70-496f-905c-cb68cc59dfbd.jpg', '如果你和众人不一样，那就不一样！百万级畅销书作者大冰2018作品，淬火重生的大女儿。用《你坏》向你说声：你好。');
INSERT INTO `products` VALUES ('482b5255-741d-4466-8596-26b68db91dbb', 'spring攻略', '1800', '技术类', '95', '/upload/1/1/b06c62ec-d995-4440-bee4-46cd10aab132.jpg', '中国名牌');
INSERT INTO `products` VALUES ('bfa6d99f-ad8e-4304-acde-7eed55520b5f', 'java网络编程', '99', '技术类', '199', '/upload/13/2/99bf3e43-7717-4cbc-8c57-69a4e78a272d.jpg', 'java神书');
INSERT INTO `products` VALUES ('fbdb8f38-c2f1-4025-a562-544cc83ad1be', '手镯', '1200', '服装衣帽', '100', '/upload/5/1/aa4c1502-4488-46a2-9864-33253f7c16d4.jpg', 'lkadjsflkajklsadkfjlkdslfjlkksfj');
INSERT INTO `products` VALUES ('fca76bb3-73f3-456b-8a9d-6607cd4a09a1', '包包', '190', '服装衣帽', '2', '/upload/6/10/86e89ca5-6470-4318-b305-aa62eeb977a9.jpg', '生活必备');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('admin');
INSERT INTO `role` VALUES ('user');

-- ----------------------------
-- Table structure for userprivilege
-- ----------------------------
DROP TABLE IF EXISTS `userprivilege`;
CREATE TABLE `userprivilege` (
  `privilege_id` int(11) NOT NULL DEFAULT '0',
  `role` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`privilege_id`,`role`),
  KEY `userprivilege` (`role`),
  CONSTRAINT `userprivilege_ibfk_1` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`id`),
  CONSTRAINT `userprivilege_ibfk_2` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userprivilege
-- ----------------------------
INSERT INTO `userprivilege` VALUES ('1', 'admin');
INSERT INTO `userprivilege` VALUES ('2', 'admin');
INSERT INTO `userprivilege` VALUES ('3', 'admin');
INSERT INTO `userprivilege` VALUES ('4', 'admin');
INSERT INTO `userprivilege` VALUES ('2', 'user');
INSERT INTO `userprivilege` VALUES ('3', 'user');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nickname` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `activecode` varchar(100) DEFAULT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'duhong', '202cb962ac59075b964b07152d234b70', 'fox', '22597927@qq.com', 'admin', '1', '12481b35-5f08-42c5-8e68-bcf66f02f64d', '2014-09-29 21:39:28');
INSERT INTO `users` VALUES ('2', 'tom', '202cb962ac59075b964b07152d234b70', '小汤哥', '22597927@qq.com', 'user', '1', 'c6d9850f-3c53-43c4-b389-2da93307a14f', '2014-09-28 14:16:46');
INSERT INTO `users` VALUES ('4', '李四', '81dc9bdb52d04dc20036dbd8313ed055', '小李', '22597927@qq.com', 'user', '1', 'b3ccad7d-ac17-4a05-be2d-0a5bd026c6ff', '2014-09-28 18:54:57');
INSERT INTO `users` VALUES ('5', '王五', '81dc9bdb52d04dc20036dbd8313ed055', '小五', '22597927@qq.com', 'user', '1', 'c4328ef9-bd51-45a0-863a-9301fc4e2b8b', '2014-09-28 20:03:32');
INSERT INTO `users` VALUES ('6', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '????', '1418497714@qq.com', 'user', '0', '1c8bf361-e7db-41f2-8c16-546e5702953a', '2018-07-03 17:22:27');
