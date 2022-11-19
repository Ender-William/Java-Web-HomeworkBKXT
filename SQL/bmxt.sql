/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : bmxt

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 19/11/2022 23:24:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '//管理员id',
  `username` varchar(40) NOT NULL COMMENT '//管理员用户名',
  `password` varchar(40) NOT NULL COMMENT '//密码',
  `usergroup` varchar(40) NOT NULL COMMENT '//所在组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='//管理员信息表';

-- ----------------------------
-- Records of adminuser
-- ----------------------------
BEGIN;
INSERT INTO `adminuser` (`id`, `username`, `password`, `usergroup`) VALUES (2, 'sadmin', 'c984aed014aec7623a54f0591da07a85fd4b762d', '系统管理员');
INSERT INTO `adminuser` (`id`, `username`, `password`, `usergroup`) VALUES (13, 'jiaowu', 'c984aed014aec7623a54f0591da07a85fd4b762d', '教务管理员');
INSERT INTO `adminuser` (`id`, `username`, `password`, `usergroup`) VALUES (15, 'zhaoban', 'c984aed014aec7623a54f0591da07a85fd4b762d', '招生管理员');
INSERT INTO `adminuser` (`id`, `username`, `password`, `usergroup`) VALUES (16, 'jiaowu1', 'c984aed014aec7623a54f0591da07a85fd4b762d', '教务管理员');
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `ccode` varchar(10) NOT NULL COMMENT '//课程编号',
  `cname` varchar(40) NOT NULL COMMENT '//考试科目名称',
  `cmname` varchar(40) NOT NULL COMMENT '//所属专业代码',
  `cstarttime` datetime NOT NULL COMMENT '//考试开始时间',
  `cendtime` datetime NOT NULL COMMENT '//考试结束时间',
  PRIMARY KEY (`ccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='//考试科目信息表';

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` (`ccode`, `cname`, `cmname`, `cstarttime`, `cendtime`) VALUES ('101', '计算机文化基础', '计算机科学与技术', '2022-12-11 08:00:00', '2022-12-11 10:00:00');
INSERT INTO `course` (`ccode`, `cname`, `cmname`, `cstarttime`, `cendtime`) VALUES ('102', '计算机组成原理', '计算机科学与技术', '2022-12-11 14:00:00', '2022-12-11 16:00:00');
INSERT INTO `course` (`ccode`, `cname`, `cmname`, `cstarttime`, `cendtime`) VALUES ('103', '计算机平面设计', '计算机科学与技术（动漫设计方向）', '2022-12-11 08:00:00', '2022-12-11 10:00:00');
INSERT INTO `course` (`ccode`, `cname`, `cmname`, `cstarttime`, `cendtime`) VALUES ('104', '艺术概论', '计算机科学与技术（动漫设计方向）', '2022-12-11 14:00:00', '2022-12-11 16:00:00');
INSERT INTO `course` (`ccode`, `cname`, `cmname`, `cstarttime`, `cendtime`) VALUES ('105', '软件工程', '软件工程', '2022-12-11 08:00:00', '2022-12-11 10:00:00');
INSERT INTO `course` (`ccode`, `cname`, `cmname`, `cstarttime`, `cendtime`) VALUES ('106', 'Java语言程序设计', '软件工程', '2022-12-11 14:00:00', '2022-12-11 16:00:00');
INSERT INTO `course` (`ccode`, `cname`, `cmname`, `cstarttime`, `cendtime`) VALUES ('201', '管理学', '物流管理', '2022-12-11 08:00:00', '2022-12-11 10:00:00');
INSERT INTO `course` (`ccode`, `cname`, `cmname`, `cstarttime`, `cendtime`) VALUES ('202', '物流管理', '物流管理', '2022-12-11 14:00:00', '2022-12-11 16:00:00');
INSERT INTO `course` (`ccode`, `cname`, `cmname`, `cstarttime`, `cendtime`) VALUES ('203', '财务管理', '财务管理（信用管理方向）', '2022-12-11 08:00:00', '2022-12-11 10:00:00');
INSERT INTO `course` (`ccode`, `cname`, `cmname`, `cstarttime`, `cendtime`) VALUES ('204', '会计学原理', '财务管理（信用管理方向）', '2022-12-11 14:00:00', '2022-12-11 16:00:00');
COMMIT;

-- ----------------------------
-- Table structure for currstage
-- ----------------------------
DROP TABLE IF EXISTS `currstage`;
CREATE TABLE `currstage` (
  `configid` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '//配置信息id',
  `adminname` varchar(40) NOT NULL COMMENT '//更改配置管理员用户名',
  `settime` datetime NOT NULL COMMENT '//更改配置时间',
  `stagename` varchar(40) NOT NULL COMMENT '//更改状态',
  PRIMARY KEY (`configid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='//配置信息表';

-- ----------------------------
-- Records of currstage
-- ----------------------------
BEGIN;
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (1, 'zhaoban', '2022-10-19 13:47:12', '招考信息发布');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (2, 'zhaoban', '2022-10-19 13:48:19', '招考信息发布');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (3, 'zhaoban', '2022-10-19 13:48:47', '招考信息发布');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (4, 'zhaoban', '2022-10-19 13:56:59', '在线报名');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (5, 'zhaoban', '2022-10-19 14:10:27', '现场确认');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (6, 'zhaoban', '2022-10-19 14:10:38', '考号与考场分配');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (7, 'zhaoban', '2022-10-19 14:10:52', '准考证打印与考试');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (8, 'zhaoban', '2022-10-19 14:10:56', '成绩录入');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (9, 'zhaoban', '2022-10-19 14:10:58', '在线报名');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (10, 'zhaoban', '2022-10-19 16:34:49', '现场确认');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (11, 'zhaoban', '2022-10-19 16:34:58', '在线报名');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (12, 'zhaoban', '2022-10-20 09:56:15', '现场确认');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (13, 'zhaoban', '2022-10-20 13:53:00', '招考信息发布');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (14, 'zhaoban', '2022-12-02 11:50:51', '在线报名');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (15, 'zhaoban', '2022-12-02 11:50:58', '现场确认');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (16, 'zhaoban', '2022-12-02 11:51:07', '考号与考场分配');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (17, 'zhaoban', '2022-12-02 11:51:11', '准考证打印与考试');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (18, 'zhaoban', '2022-12-02 11:51:14', '招考信息发布');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (19, 'zhaoban', '2016-01-06 10:09:42', '在线报名');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (20, 'zhaoban', '2022-11-19 00:21:13', '现场确认');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (21, 'zhaoban', '2022-11-19 00:21:16', '考号与考场分配');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (22, 'zhaoban', '2022-11-19 00:21:19', '成绩录入');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (23, 'zhaoban', '2022-11-19 00:21:21', '成绩与录取查询');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (24, 'zhaoban', '2022-11-19 00:21:24', '招考信息发布');
INSERT INTO `currstage` (`configid`, `adminname`, `settime`, `stagename`) VALUES (25, 'zhaoban', '2022-11-19 23:22:00', '考号与考场分配');
COMMIT;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `gradeid` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '//成绩编号id',
  `testcardnum` varchar(12) NOT NULL COMMENT '//准考证号',
  `ccode` varchar(10) DEFAULT NULL COMMENT '//考试科目',
  `score` tinyint DEFAULT NULL COMMENT '//该科目成绩',
  `note` enum('正常','缺考','作弊') DEFAULT NULL COMMENT '//备注',
  `status` enum('0','1') DEFAULT NULL COMMENT '//成绩是否可修改 0 不可修改 1 可修改',
  PRIMARY KEY (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='//成绩信息表';

-- ----------------------------
-- Records of grade
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `mcode` varchar(10) NOT NULL COMMENT '//专业代码',
  `mname` varchar(40) NOT NULL COMMENT '//报考专业名称',
  `plannum` smallint DEFAULT NULL COMMENT '//计划招生数',
  `applynum` smallint DEFAULT NULL COMMENT '//实际报考人数',
  `passcore` tinyint DEFAULT NULL COMMENT '//录取分数线',
  `admitnum` smallint DEFAULT NULL COMMENT '//录取人数',
  PRIMARY KEY (`mcode`),
  UNIQUE KEY `mname` (`mname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='//报考专业信息表';

-- ----------------------------
-- Records of major
-- ----------------------------
BEGIN;
INSERT INTO `major` (`mcode`, `mname`, `plannum`, `applynum`, `passcore`, `admitnum`) VALUES ('11', '计算机科学与技术', 80, NULL, NULL, NULL);
INSERT INTO `major` (`mcode`, `mname`, `plannum`, `applynum`, `passcore`, `admitnum`) VALUES ('12', '计算机科学与技术（动漫设计方向）', 100, NULL, NULL, NULL);
INSERT INTO `major` (`mcode`, `mname`, `plannum`, `applynum`, `passcore`, `admitnum`) VALUES ('13', '软件工程', 100, NULL, NULL, NULL);
INSERT INTO `major` (`mcode`, `mname`, `plannum`, `applynum`, `passcore`, `admitnum`) VALUES ('21', '物流管理', 100, NULL, NULL, NULL);
INSERT INTO `major` (`mcode`, `mname`, `plannum`, `applynum`, `passcore`, `admitnum`) VALUES ('22', '财务管理（信用管理方向）', 50, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `rid` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '//日志id',
  `logname` varchar(40) NOT NULL COMMENT '//登录人姓名',
  `usergroup` varchar(40) NOT NULL COMMENT '//所在组',
  `logtime` datetime NOT NULL COMMENT '//登录时间',
  `logip` varchar(128) NOT NULL COMMENT '//登录ip',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8 COMMENT='//日志信息表';

-- ----------------------------
-- Records of record
-- ----------------------------
BEGIN;
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (1, 'admin', '系统管理员', '2022-10-15 10:43:56', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (2, 'admin', '系统管理员', '2022-10-15 10:44:57', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (3, 'admin', '系统管理员', '2022-10-15 10:46:58', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (4, 'admin', '系统管理员', '2022-10-15 10:56:00', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (5, 'admin', '系统管理员', '2022-10-15 10:56:14', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (6, 'admin', '系统管理员', '2022-10-15 10:56:51', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (7, 'zjfhit', '学生', '2022-10-15 10:57:50', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (8, 'zjfhit', '学生', '2022-10-15 10:58:12', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (9, 'admin', '系统管理员', '2022-10-15 10:58:59', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (10, 'zhaoban', '招生管理员', '2022-10-15 11:00:32', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (11, 'admin', '系统管理员', '2022-10-15 11:24:21', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (12, 'admin', '系统管理员', '2022-10-15 15:20:12', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (13, 'admin', '系统管理员', '2022-10-15 15:28:50', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (14, 'admin', '系统管理员', '2022-10-15 15:35:36', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (15, 'admin', '系统管理员', '2022-10-15 15:42:34', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (16, 'admin', '系统管理员', '2022-10-15 15:48:14', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (17, 'admin', '系统管理员', '2022-10-15 15:49:07', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (18, 'admin', '系统管理员', '2022-10-15 16:27:52', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (19, 'admin', '系统管理员', '2022-10-15 16:35:03', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (20, 'admin', '系统管理员', '2022-10-15 16:37:12', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (21, 'admin', '系统管理员', '2022-10-15 16:38:55', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (22, 'admin', '系统管理员', '2022-10-15 16:42:01', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (23, 'admin', '系统管理员', '2022-10-15 16:43:44', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (24, 'admin', '系统管理员', '2022-10-16 08:01:04', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (25, 'admin', '系统管理员', '2022-10-16 08:12:10', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (26, 'admin', '系统管理员', '2022-10-16 08:15:01', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (27, 'admin', '系统管理员', '2022-10-16 08:18:42', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (28, 'admin', '系统管理员', '2022-10-16 08:20:48', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (29, 'admin', '系统管理员', '2022-10-16 08:22:42', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (30, 'admin', '系统管理员', '2022-10-16 08:29:53', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (31, 'admin', '系统管理员', '2022-10-16 08:36:36', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (32, 'admin', '系统管理员', '2022-10-16 08:39:08', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (33, 'admin', '系统管理员', '2022-10-16 08:43:22', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (34, 'admin', '系统管理员', '2022-10-16 08:45:19', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (35, 'admin', '系统管理员', '2022-10-16 09:16:30', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (36, 'admin', '系统管理员', '2022-10-16 09:19:30', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (37, 'admin', '系统管理员', '2022-10-16 09:20:34', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (38, 'admin', '系统管理员', '2022-10-16 09:20:50', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (39, 'zjfhit', '学生', '2022-10-16 09:41:09', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (40, 'zjfhit', '学生', '2022-10-16 09:44:25', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (41, 'zjfhit', '学生', '2022-10-16 10:00:11', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (42, 'admin', '系统管理员', '2022-10-16 10:01:25', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (43, 'zjfhit', '学生', '2022-10-16 10:04:33', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (44, 'zjfhit', '学生', '2022-10-16 10:15:43', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (45, 'zjfhit', '学生', '2022-10-16 10:16:18', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (46, 'admin', '系统管理员', '2022-10-16 10:45:24', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (47, 'admin', '系统管理员', '2022-10-16 10:45:53', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (48, 'jiaowu', '教务管理员', '2022-10-16 10:46:09', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (49, 'jiaowu', '教务管理员', '2022-10-16 10:46:40', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (50, 'admin', '系统管理员', '2022-10-16 10:47:14', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (51, 'jiaowu', '教务管理员', '2022-10-16 10:47:45', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (52, 'admin', '系统管理员', '2022-10-16 10:52:44', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (53, 'jiaowu', '教务管理员', '2022-10-16 10:52:55', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (54, 'jiaowu', '教务管理员', '2022-10-16 10:54:43', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (55, 'jiaowu', '教务管理员', '2022-10-16 10:57:54', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (56, 'admin', '系统管理员', '2022-10-16 10:58:36', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (57, 'jiaowu', '教务管理员', '2022-10-16 11:01:03', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (58, 'jiaowu', '教务管理员', '2022-10-16 11:01:45', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (59, 'admin', '系统管理员', '2022-10-16 12:49:55', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (60, 'zhaoban', '招生管理员', '2022-10-16 15:33:39', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (61, 'jiaowu', '教务管理员', '2022-10-16 15:37:11', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (62, 'admin', '系统管理员', '2022-10-16 15:37:28', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (63, 'zhaoban', '招生管理员', '2022-10-16 15:52:41', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (64, 'zhaoban', '招生管理员', '2022-10-16 15:55:29', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (65, 'zhaoban', '招生管理员', '2022-10-16 15:56:10', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (66, 'admin', '系统管理员', '2022-10-19 08:47:23', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (67, 'zhaoban', '招生管理员', '2022-10-19 08:48:29', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (68, 'zhaoban', '招生管理员', '2022-10-19 13:22:22', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (69, 'zhaoban', '招生管理员', '2022-10-19 13:35:02', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (70, 'zhaoban', '招生管理员', '2022-10-19 13:48:43', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (71, 'admin', '系统管理员', '2022-10-19 14:56:43', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (72, 'jiaowu', '教务管理员', '2022-10-19 14:57:32', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (73, 'zhaoban', '招生管理员', '2022-10-19 14:59:21', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (74, 'admin', '系统管理员', '2022-10-19 15:00:42', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (75, 'zhaoban', '招生管理员', '2022-10-19 15:01:26', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (76, 'zjfhit', '学生', '2022-10-19 15:02:06', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (77, 'zhaoban', '招生管理员', '2022-10-19 15:26:06', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (78, 'admin', '系统管理员', '2022-10-19 16:06:53', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (79, 'zhaoban', '招生管理员', '2022-10-19 16:26:17', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (80, 'admin', '系统管理员', '2022-10-20 09:54:10', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (81, 'zhaoban', '招生管理员', '2022-10-20 09:55:26', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (82, 'zhaoban', '招生管理员', '2022-10-20 10:08:56', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (83, 'zhaoban', '招生管理员', '2022-10-20 10:32:12', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (84, 'admin', '系统管理员', '2022-10-20 10:49:31', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (85, 'zhaoban', '招生管理员', '2022-10-20 10:54:04', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (86, 'zhaoban', '招生管理员', '2022-10-20 11:23:06', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (87, 'zhaoban', '招生管理员', '2022-10-20 11:39:38', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (88, 'zhaoban', '招生管理员', '2022-10-20 11:42:29', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (89, 'zhaoban', '招生管理员', '2022-10-20 11:43:28', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (90, 'zhaoban', '招生管理员', '2022-10-20 11:44:18', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (91, 'zhaoban', '招生管理员', '2022-10-20 11:45:33', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (92, 'zhaoban', '招生管理员', '2022-10-20 11:47:52', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (93, 'zhaoban', '招生管理员', '2022-10-20 13:48:40', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (94, 'zhaoban', '招生管理员', '2022-10-20 13:49:51', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (95, 'zhaoban', '招生管理员', '2022-10-20 13:50:31', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (96, 'zhaoban', '招生管理员', '2022-10-20 16:16:57', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (97, 'zjfhit', '学生', '2022-10-20 16:18:39', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (98, 'admin', '系统管理员', '2022-10-21 09:15:19', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (99, 'zhaoban', '招生管理员', '2022-10-21 09:17:55', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (100, 'admin', '系统管理员', '2022-10-21 09:18:24', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (101, 'zhaoban', '招生管理员', '2022-10-21 09:20:08', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (102, 'jiaowu', '教务管理员', '2022-10-21 09:22:24', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (103, 'zjfhit', '学生', '2022-10-21 09:24:22', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (104, 'zjfhit', '学生', '2022-10-21 13:55:05', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (105, 'zhaoban', '招生管理员', '2022-10-21 15:29:25', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (106, 'admin', '系统管理员', '2022-10-28 14:10:35', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (107, 'zhaoban', '招生管理员', '2022-10-28 14:12:43', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (108, 'admin', '系统管理员', '2022-10-28 14:13:29', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (109, 'zjfhit', '学生', '2022-10-28 14:51:26', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (110, 'admin', '系统管理员', '2022-10-30 09:02:46', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (111, 'admin', '系统管理员', '2022-10-30 09:48:41', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (112, 'zhaoban', '招生管理员', '2022-10-30 11:38:14', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (113, 'admin', '系统管理员', '2022-11-04 11:05:39', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (114, 'zjfhit', '学生', '2022-11-04 11:11:32', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (115, 'admin', '系统管理员', '2022-11-04 11:20:04', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (116, 'admin', '系统管理员', '2022-11-04 14:27:32', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (117, 'zjfhit', '学生', '2022-11-05 08:19:29', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (118, 'zjfhit', '学生', '2022-11-05 08:26:03', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (119, 'zjfhit', '学生', '2022-11-05 09:49:17', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (120, 'zjfhit', '学生', '2022-11-05 09:52:46', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (121, 'zjfhit', '学生', '2022-11-05 10:00:47', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (122, 'zjfhit', '学生', '2022-11-05 10:54:34', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (123, 'admin', '系统管理员', '2022-11-05 11:32:49', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (124, 'zjfhit', '学生', '2022-11-05 11:33:36', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (125, 'zjfhit', '学生', '2022-11-05 11:38:04', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (126, 'zjfhit', '学生', '2022-11-05 14:48:02', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (127, 'admin', '系统管理员', '2022-11-05 15:12:31', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (128, 'testWYW', '学生', '2022-11-16 14:19:24', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (129, 'testWYW', '学生', '2022-11-16 14:43:30', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (130, 'testWYW', '学生', '2022-11-16 14:45:56', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (131, 'testWYW', '学生', '2022-11-16 14:49:24', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (132, 'testWYW', '学生', '2022-11-16 14:53:00', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (133, 'testWYW', '学生', '2022-11-16 14:57:50', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (134, 'testWYW', '学生', '2022-11-16 15:03:24', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (135, 'testWYW', '学生', '2022-11-16 15:06:26', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (136, 'zjfhit', '学生', '2022-11-16 16:29:04', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (137, 'testWYW', '学生', '2022-11-17 10:21:16', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (138, 'testWYW', '学生', '2022-11-17 10:22:53', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (139, 'weiyinwei', '学生', '2022-11-17 10:24:02', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (140, 'testWYW', '学生', '2022-11-17 10:37:13', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (141, 'testWYW', '学生', '2022-11-17 10:37:59', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (142, 'testWYW', '学生', '2022-11-17 10:39:38', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (143, 'testWYW', '学生', '2022-11-17 10:41:46', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (144, 'testWYW', '学生', '2022-11-17 10:44:30', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (145, 'zjfhit', '学生', '2022-11-17 11:19:30', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (146, 'zjfhit', '学生', '2022-11-17 11:52:12', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (147, 'zjfhit', '学生', '2022-11-17 13:32:55', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (148, 'zjfhit', '学生', '2022-11-17 13:36:24', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (149, 'zjfhit', '学生', '2022-11-17 13:41:31', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (150, 'zjfhit', '学生', '2022-11-17 13:42:17', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (151, 'zhaoban', '招生管理员', '2022-11-17 14:12:20', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (152, 'sadmin', '系统管理员', '2022-11-17 14:23:46', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (153, 'sadmin', '系统管理员', '2022-11-17 14:25:53', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (154, 'sadmin', '系统管理员', '2022-11-17 14:50:33', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (155, 'testWYW', '学生', '2022-11-17 15:18:16', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (156, 'sadmin', '系统管理员', '2022-11-17 15:19:00', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (157, 'sadmin', '系统管理员', '2022-11-17 15:21:27', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (158, 'testWYW', '学生', '2022-11-17 15:22:31', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (159, 'zhaoban', '招生管理员', '2022-11-17 15:23:25', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (160, 'testWYW', '学生', '2022-11-17 15:25:47', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (161, 'zhaoban', '招生管理员', '2022-11-17 15:28:58', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (162, 'zhaoban', '招生管理员', '2022-11-17 15:31:48', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (163, 'testWYW', '学生', '2022-11-17 16:26:23', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (164, 'testWYW', '学生', '2022-11-17 16:53:16', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (165, 'zhaoban', '招生管理员', '2022-11-18 09:02:00', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (166, 'zhaoban', '招生管理员', '2022-11-18 09:19:15', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (167, 'zhaoban', '招生管理员', '2022-11-18 09:51:52', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (168, 'sadmin', '系统管理员', '2022-11-18 09:58:16', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (169, 'jiaowu', '教务管理员', '2022-11-18 09:59:06', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (170, 'zjfhit', '学生', '2022-11-18 10:17:40', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (171, 'zjfhit', '学生', '2022-11-18 10:19:03', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (172, 'zjfhit', '学生', '2022-11-18 10:28:08', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (173, 'zjfhit', '学生', '2022-11-18 10:29:46', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (174, 'zjfhit', '学生', '2022-11-18 10:39:11', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (175, 'zjfhit', '学生', '2022-11-18 10:40:55', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (176, 'zjfhit', '学生', '2022-11-18 10:46:52', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (177, 'zjfhit', '学生', '2022-11-18 10:50:07', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (178, 'testWYW', '学生', '2022-11-18 14:29:25', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (179, 'testWYW', '学生', '2022-11-18 14:35:13', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (180, 'testWYW', '学生', '2022-11-18 14:40:14', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (181, 'testWYW', '学生', '2022-11-18 14:42:01', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (182, 'testWYW', '学生', '2022-11-18 14:47:51', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (183, 'testWYW', '学生', '2022-11-18 14:49:51', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (184, 'testWYW', '学生', '2022-11-18 14:51:01', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (185, 'zjfhit', '学生', '2022-11-18 15:39:30', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (186, 'testWYW', '学生', '2022-11-18 15:42:00', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (187, 'testWYW', '学生', '2022-11-18 15:47:20', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (188, 'testWYW', '学生', '2022-11-18 15:50:23', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (189, 'testWYW', '学生', '2022-11-18 16:51:52', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (190, 'testWYW', '学生', '2022-11-18 16:54:55', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (191, 'testWYW', '学生', '2022-11-18 17:07:12', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (192, 'testWYW', '学生', '2022-11-19 10:58:30', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (193, 'testWYW', '学生', '2022-11-19 15:12:43', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (194, 'testWYW', '学生', '2022-11-19 15:12:45', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (195, 'testWYW', '学生', '2022-11-19 15:45:54', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (196, 'testWYW', '学生', '2022-11-19 16:01:20', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (197, 'testWYW', '学生', '2022-11-19 16:10:08', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (198, 'testWYW', '学生', '2022-11-19 16:11:19', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (199, 'testWYW', '学生', '2022-11-19 16:22:24', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (200, 'testWYW', '学生', '2022-11-19 16:25:08', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (201, 'testWYW', '学生', '2022-11-19 16:35:26', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (202, 'testWYW', '学生', '2022-11-19 16:45:56', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (203, 'testWYW', '学生', '2022-11-19 16:50:31', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (204, 'testWYW', '学生', '2022-11-20 09:30:18', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (205, 'testWYW', '学生', '2022-11-20 09:33:04', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (206, 'testWYW', '学生', '2022-11-20 09:36:09', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (207, 'testWYW', '学生', '2022-11-24 14:14:27', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (208, 'testWYW', '学生', '2022-11-24 14:16:25', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (209, 'testWYW', '学生', '2022-11-24 14:52:38', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (210, 'sundaohe', '学生', '2022-11-24 15:11:52', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (211, 'testWYW', '学生', '2022-11-24 15:20:30', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (212, 'testWYW', '学生', '2022-11-24 15:36:48', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (213, 'testWYW', '学生', '2022-11-24 15:43:09', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (214, 'testWYW', '学生', '2022-11-24 15:44:55', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (215, 'testWYW', '学生', '2022-11-24 15:47:26', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (216, 'testWYW', '学生', '2022-11-24 15:53:14', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (217, 'testWYW', '学生', '2022-11-24 16:06:22', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (218, 'testWYW', '学生', '2022-11-24 16:07:22', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (219, 'testWYW', '学生', '2022-11-24 16:29:16', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (220, 'testWYW', '学生', '2022-11-24 16:33:54', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (221, 'testWYW', '学生', '2022-11-24 16:38:13', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (222, 'testWYW', '学生', '2022-11-24 16:42:07', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (223, 'testWYW', '学生', '2022-11-24 16:47:21', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (224, 'sundaohe', '学生', '2022-11-25 14:38:52', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (225, 'daohesun', '学生', '2022-12-01 15:04:45', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (226, 'zjfhit', '学生', '2022-12-01 15:06:15', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (227, 'zjfhit', '学生', '2022-12-01 15:21:05', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (228, 'weiyinwei', '学生', '2022-12-01 15:24:43', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (229, 'zjfhit', '学生', '2022-12-01 15:32:14', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (230, 'zhaoban', '招生管理员', '2022-12-01 15:32:27', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (231, 'zhaoban', '招生管理员', '2022-12-01 15:33:56', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (232, 'sadmin', '系统管理员', '2022-12-01 15:34:14', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (233, 'zhaoban', '招生管理员', '2022-12-01 15:34:34', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (234, 'sadmin', '系统管理员', '2022-12-01 15:48:52', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (235, 'sadmin', '系统管理员', '2022-12-02 08:37:04', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (236, 'zhaoban', '招生管理员', '2022-12-02 08:38:25', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (237, 'sadmin', '系统管理员', '2022-12-02 08:42:25', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (238, 'sadmin', '系统管理员', '2022-12-02 08:45:11', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (239, 'sadmin', '系统管理员', '2022-12-02 08:50:52', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (240, 'sadmin', '系统管理员', '2022-12-02 09:14:11', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (241, 'sadmin', '系统管理员', '2022-12-02 09:25:47', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (242, 'zhaoban', '招生管理员', '2022-12-02 11:50:19', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (243, 'sadmin', '系统管理员', '2022-12-02 14:33:20', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (244, 'sadmin', '系统管理员', '2022-12-02 15:13:31', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (245, 'zhaoban', '招生管理员', '2022-12-02 15:13:58', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (246, 'sadmin', '系统管理员', '2022-12-02 15:14:11', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (247, 'zjfhit', '学生', '2022-12-02 15:29:21', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (248, 'zhaoban', '招生管理员', '2022-12-02 16:26:40', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (249, 'zhaoban', '招生管理员', '2022-12-07 14:00:48', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (250, 'zhaoban', '招生管理员', '2022-12-07 14:42:21', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (251, 'zjfhit', '学生', '2022-12-07 15:38:11', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (252, 'zjfhit', '学生', '2022-12-14 15:24:15', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (253, 'zjfhit', '学生', '2022-12-15 13:57:08', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (254, 'zjfhit', '学生', '2022-12-15 15:36:57', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (255, 'zjfhit', '学生', '2022-12-17 08:40:27', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (256, 'zjfhit', '学生', '2022-12-17 09:46:01', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (257, 'zjfhit', '学生', '2022-12-17 10:40:43', '172.16.36.209');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (258, 'sadmin', '系统管理员', '2022-12-23 08:20:09', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (259, 'jiaowu', '教务管理员', '2022-12-23 08:21:38', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (260, 'zhaoban', '招生管理员', '2022-12-23 08:22:02', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (261, 'sadmin', '系统管理员', '2022-12-23 11:11:26', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (262, 'zhaoban', '招生管理员', '2022-12-23 11:11:38', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (263, 'sadmin', '系统管理员', '2022-12-28 13:43:59', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (264, 'sadmin', '系统管理员', '2022-12-28 13:44:20', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (265, 'zhaoban', '招生管理员', '2022-12-28 13:44:36', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (266, 'sadmin', '系统管理员', '2022-12-28 13:47:52', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (267, 'sadmin', '系统管理员', '2022-12-28 14:01:15', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (268, 'zhaoban', '招生管理员', '2022-12-28 14:01:36', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (269, 'sadmin', '系统管理员', '2022-12-28 14:07:13', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (270, 'sadmin', '系统管理员', '2022-12-29 13:59:02', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (271, 'zhaoban', '招生管理员', '2022-12-30 16:37:11', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (272, 'zjfhit', '学生', '2016-01-05 14:25:50', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (273, 'sadmin', '系统管理员', '2016-01-05 14:40:09', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (274, 'sadmin', '系统管理员', '2016-01-05 16:13:10', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (275, 'zhaoban', '招生管理员', '2016-01-05 16:16:02', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (276, 'sadmin', '系统管理员', '2016-01-06 09:58:05', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (277, 'zhaoban', '招生管理员', '2016-01-06 10:00:52', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (278, 'zhaoban', '招生管理员', '2016-01-06 10:16:30', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (279, 'zhaoban', '招生管理员', '2016-01-06 10:19:16', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (280, 'zhaoban', '招生管理员', '2016-01-06 13:19:18', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (281, 'sadmin', '系统管理员', '2016-01-19 10:06:10', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (282, 'jiaowu', '教务管理员', '2016-01-19 10:06:52', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (283, 'zhaoban', '招生管理员', '2016-01-19 10:07:10', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (284, 'sadmin', '系统管理员', '2016-01-19 13:51:02', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (285, 'zhaoban', '招生管理员', '2016-01-19 13:54:14', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (286, 'zhaoban', '招生管理员', '2016-01-19 14:46:53', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (287, 'sadmin', '系统管理员', '2016-01-19 15:01:17', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (288, 'student1', '学生', '2022-11-18 23:13:55', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (289, 'sadmin', '系统管理员', '2022-11-18 23:48:01', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (290, 'sadmin', '系统管理员', '2022-11-18 23:51:13', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (291, 'sadmin', '系统管理员', '2022-11-18 23:57:33', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (292, 'sadmin', '系统管理员', '2022-11-19 00:10:21', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (293, 'sadmin', '系统管理员', '2022-11-19 00:11:48', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (294, 'sadmin', '系统管理员', '2022-11-19 00:15:49', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (295, 'sadmin', '系统管理员', '2022-11-19 00:17:52', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (296, 'sadmin', '系统管理员', '2022-11-19 00:18:04', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (297, 'sadmin', '系统管理员', '2022-11-19 00:19:34', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (298, 'sadmin', '系统管理员', '2022-11-19 00:20:21', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (299, 'jiaowu', '教务管理员', '2022-11-19 00:20:47', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (300, 'zhaoban', '招生管理员', '2022-11-19 00:21:06', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (301, 'student1', '学生', '2022-11-19 00:26:20', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (302, 'student1', '学生', '2022-11-19 09:10:00', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (303, 'sadmin', '系统管理员', '2022-11-19 09:11:35', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (304, 'sadmin', '系统管理员', '2022-11-19 09:15:08', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (305, 'jiaowu', '教务管理员', '2022-11-19 09:56:08', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (306, 'sadmin', '系统管理员', '2022-11-19 10:25:06', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (307, 'sadmin', '系统管理员', '2022-11-19 10:26:47', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (308, 'sadmin', '系统管理员', '2022-11-19 10:37:15', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (309, 'sadmin', '系统管理员', '2022-11-19 10:40:39', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (310, 'sadmin', '系统管理员', '2022-11-19 10:41:55', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (311, 'sadmin', '系统管理员', '2022-11-19 10:54:17', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (312, 'sadmin', '系统管理员', '2022-11-19 10:54:44', '127.0.0.1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (313, 'sadmin', '系统管理员', '2022-11-19 10:59:49', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (314, 'sadmin', '系统管理员', '2022-11-19 11:01:46', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (315, 'sadmin', '系统管理员', '2022-11-19 11:02:38', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (316, 'sadmin', '系统管理员', '2022-11-19 11:04:07', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (317, 'student1', '学生', '2022-11-19 11:12:30', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (318, 'student1', '学生', '2022-11-19 11:13:59', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (319, 'sadmin', '系统管理员', '2022-11-19 14:53:02', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (320, 'jiaowu', '教务管理员', '2022-11-19 14:59:09', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (321, 'zhaoban', '招生管理员', '2022-11-19 15:00:01', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (322, 'student1', '学生', '2022-11-19 15:05:19', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (323, 'sadmin', '系统管理员', '2022-11-19 17:48:44', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (324, 'zhaoban', '招生管理员', '2022-11-19 17:49:10', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (325, 'jiaowu', '教务管理员', '2022-11-19 17:49:26', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (326, 'sadmin', '系统管理员', '2022-11-19 17:49:53', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (327, 'sadmin', '系统管理员', '2022-11-19 23:11:49', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (328, 'jiaowu', '教务管理员', '2022-11-19 23:21:24', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (329, 'sadmin', '系统管理员', '2022-11-19 23:21:37', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (330, 'zhaoban', '招生管理员', '2022-11-19 23:21:50', '0:0:0:0:0:0:0:1');
INSERT INTO `record` (`rid`, `logname`, `usergroup`, `logtime`, `logip`) VALUES (331, 'jiaowu', '教务管理员', '2022-11-19 23:22:12', '0:0:0:0:0:0:0:1');
COMMIT;

-- ----------------------------
-- Table structure for reginfo
-- ----------------------------
DROP TABLE IF EXISTS `reginfo`;
CREATE TABLE `reginfo` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '//信息表id',
  `username` varchar(40) NOT NULL COMMENT '//用户名',
  `sname` varchar(40) DEFAULT NULL COMMENT '//学生姓名',
  `idcode` char(18) DEFAULT '' COMMENT '//身份证号',
  `ssex` enum('男','女') DEFAULT NULL COMMENT '//性别',
  `nation` varchar(40) DEFAULT NULL COMMENT '//民族',
  `political` varchar(40) DEFAULT NULL COMMENT '//政治面貌',
  `birthday` date DEFAULT NULL COMMENT '//出生日期',
  `homeaddr` varchar(100) DEFAULT NULL COMMENT '//家庭地址',
  `source` varchar(40) DEFAULT NULL COMMENT '//生源地',
  `school` varchar(100) DEFAULT NULL COMMENT '//毕业学校',
  `gradutetime` date DEFAULT NULL COMMENT '//毕业时间',
  `isnew` enum('往届','应届') DEFAULT NULL,
  `aos` enum('理科','文科') DEFAULT NULL,
  `major` varchar(40) DEFAULT NULL COMMENT '//原专业',
  `cet` enum('cet4','cet6','无') DEFAULT NULL,
  `mname` varchar(40) DEFAULT NULL COMMENT '//报考专业',
  `piclocation` varchar(128) DEFAULT NULL COMMENT '//照片位置',
  `mobile` char(11) DEFAULT NULL COMMENT '//手机号',
  `telphone` varchar(12) DEFAULT NULL COMMENT '//联系电话',
  `zipcode` char(6) DEFAULT NULL COMMENT '//邮编',
  `conaddr` varchar(100) DEFAULT NULL COMMENT '//联系地址',
  `receiver` varchar(20) DEFAULT NULL COMMENT '//接收人',
  `isconfirm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '//是否确认 0未确认 1已确认',
  `testcardnum` varchar(12) DEFAULT NULL COMMENT '//准考证号',
  `examroom` varchar(20) DEFAULT NULL COMMENT '//考场号',
  `seatnum` int DEFAULT NULL COMMENT '//座位号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='//用户信息表';

-- ----------------------------
-- Records of reginfo
-- ----------------------------
BEGIN;
INSERT INTO `reginfo` (`id`, `username`, `sname`, `idcode`, `ssex`, `nation`, `political`, `birthday`, `homeaddr`, `source`, `school`, `gradutetime`, `isnew`, `aos`, `major`, `cet`, `mname`, `piclocation`, `mobile`, `telphone`, `zipcode`, `conaddr`, `receiver`, `isconfirm`, `testcardnum`, `examroom`, `seatnum`) VALUES (15, 'testWYW', 'wyw', '14020219880428', '男', '满', '群众', NULL, '天津', '山西', 'tju', '2022-09-01', '往届', '理科', 'cs', 'cet6', '计算机科学与技术', 'testWYW.jpg', NULL, '', '', '', 'wyw', 0, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `shid` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `shcode` varchar(10) NOT NULL,
  `shname` varchar(100) NOT NULL COMMENT '//报考学校名称',
  `shaddr` varchar(100) NOT NULL COMMENT '//学校地址',
  `shzip` char(6) NOT NULL COMMENT '//学校邮编',
  `shtel` varchar(40) NOT NULL COMMENT '//学校联系电话',
  `shtest` varchar(40) NOT NULL COMMENT '//考试名称',
  `shyear` char(4) NOT NULL COMMENT '//招生年份',
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school
-- ----------------------------
BEGIN;
INSERT INTO `school` (`shid`, `shcode`, `shname`, `shaddr`, `shzip`, `shtel`, `shtest`, `shyear`) VALUES (1, '13897', '天津理工大学中环信息学院', '天津市西青区杨柳青镇柳口路99号', '300380', '022-86437877', '高职升本', '2022');
COMMIT;

-- ----------------------------
-- Table structure for stage
-- ----------------------------
DROP TABLE IF EXISTS `stage`;
CREATE TABLE `stage` (
  `stagenum` tinyint(1) NOT NULL COMMENT '//阶段编号',
  `stagename` varchar(40) NOT NULL COMMENT '//状态名称',
  `starttime` datetime NOT NULL COMMENT '//开始时间',
  `endtime` datetime NOT NULL COMMENT '//结束时间',
  `note` text NOT NULL COMMENT '//阶段说明',
  PRIMARY KEY (`stagenum`),
  UNIQUE KEY `stagenum` (`stagenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stage
-- ----------------------------
BEGIN;
INSERT INTO `stage` (`stagenum`, `stagename`, `starttime`, `endtime`, `note`) VALUES (1, '招考信息发布', '2022-10-20 08:00:00', '2022-10-20 12:00:00', '招生管理员录入招考学校信息、招考专业信息、考试课程等相关信息');
INSERT INTO `stage` (`stagenum`, `stagename`, `starttime`, `endtime`, `note`) VALUES (2, '在线报名', '2022-10-20 12:00:00', '2022-10-30 17:00:00', '学生在线填写报名信息、上传电子照片、打印报名表等相关操作');
INSERT INTO `stage` (`stagenum`, `stagename`, `starttime`, `endtime`, `note`) VALUES (3, '现场确认', '2022-10-30 08:00:00', '2022-10-30 17:00:00', '学生到报考院校确认个人填报信息并缴纳考试报名费用');
INSERT INTO `stage` (`stagenum`, `stagename`, `starttime`, `endtime`, `note`) VALUES (4, '考号与考场分配', '2022-10-30 17:00:00', '2022-10-31 08:00:00', '教务管理员根据报考情况为考生分配准考证号并安排考场');
INSERT INTO `stage` (`stagenum`, `stagename`, `starttime`, `endtime`, `note`) VALUES (5, '准考证打印与考试', '2022-10-31 08:00:00', '2022-11-15 17:00:00', '学生在线打印准考证并参加考试');
INSERT INTO `stage` (`stagenum`, `stagename`, `starttime`, `endtime`, `note`) VALUES (6, '成绩录入', '2022-11-21 08:00:00', '2022-11-21 17:00:00', '教务管理员录入学生考试成绩');
INSERT INTO `stage` (`stagenum`, `stagename`, `starttime`, `endtime`, `note`) VALUES (7, '设置录取分数线', '2022-11-21 17:00:00', '2022-11-22 17:00:00', '招生管理员设置各专业录取分数线');
INSERT INTO `stage` (`stagenum`, `stagename`, `starttime`, `endtime`, `note`) VALUES (8, '成绩与录取查询', '2022-11-23 08:00:00', '2016-02-23 17:00:00', '学生在线查询个人成绩与录取情况');
COMMIT;

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu` (
  `userid` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '//注册用户id',
  `username` varchar(40) NOT NULL COMMENT '//用户名',
  `password` varchar(40) NOT NULL COMMENT '//密码',
  `regip` varchar(128) NOT NULL COMMENT '//注册时ip',
  `regtime` datetime NOT NULL COMMENT '//注册时间',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='//注册信息表';

-- ----------------------------
-- Records of stu
-- ----------------------------
BEGIN;
INSERT INTO `stu` (`userid`, `username`, `password`, `regip`, `regtime`) VALUES (1, 'zhangsan', 'c984aed014aec7623a54f0591da07a85fd4b762d', '172.16.36.209', '2022-10-15 08:35:21');
INSERT INTO `stu` (`userid`, `username`, `password`, `regip`, `regtime`) VALUES (2, 'lisi', 'c984aed014aec7623a54f0591da07a85fd4b762d', '127.0.0.1', '2022-11-16 14:19:16');
INSERT INTO `stu` (`userid`, `username`, `password`, `regip`, `regtime`) VALUES (3, 'wangwu', 'c984aed014aec7623a54f0591da07a85fd4b762d', '127.0.0.1', '2022-11-17 10:22:32');
INSERT INTO `stu` (`userid`, `username`, `password`, `regip`, `regtime`) VALUES (4, 'zhaoqian', 'c984aed014aec7623a54f0591da07a85fd4b762d', '127.0.0.1', '2022-11-24 15:11:37');
INSERT INTO `stu` (`userid`, `username`, `password`, `regip`, `regtime`) VALUES (5, 'Steve', 'c984aed014aec7623a54f0591da07a85fd4b762d', '127.0.0.1', '2022-12-01 15:04:33');
INSERT INTO `stu` (`userid`, `username`, `password`, `regip`, `regtime`) VALUES (6, 'student1', 'a59ef2320cea11da8000309e6fd745032ccdc4e0', '0:0:0:0:0:0:0:1', '2022-11-18 23:13:44');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
