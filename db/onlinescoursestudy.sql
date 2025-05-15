-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: springboot70teu
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `springboot70teu`
--

/*!40000 DROP DATABASE IF EXISTS `springboot70teu`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `springboot70teu` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `springboot70teu`;

--
-- Table structure for table `aboutus`
--

DROP TABLE IF EXISTS `aboutus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aboutus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `content` longtext NOT NULL COMMENT '内容',
  `picture1` longtext COMMENT '图片1',
  `picture2` longtext COMMENT '图片2',
  `picture3` longtext COMMENT '图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='关于我们';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aboutus`
--

LOCK TABLES `aboutus` WRITE;
/*!40000 ALTER TABLE `aboutus` DISABLE KEYS */;
INSERT INTO `aboutus` VALUES (1,'2023-03-03 13:38:37','关于我们','ABOUT US','不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?\n你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。','upload/aboutus_picture1.jpg','upload/aboutus_picture2.jpg','upload/aboutus_picture3.jpg');
/*!40000 ALTER TABLE `aboutus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg'),(2,'picture2','upload/picture2.jpg'),(3,'picture3','upload/picture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exampaper`
--

DROP TABLE IF EXISTS `exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '在线测试名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '在线测试状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='在线测试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exampaper`
--

LOCK TABLES `exampaper` WRITE;
/*!40000 ALTER TABLE `exampaper` DISABLE KEYS */;
INSERT INTO `exampaper` VALUES (1,'2023-03-03 13:38:37','十万个为什么',60,1);
/*!40000 ALTER TABLE `exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属在线测试id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '在线测试名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
INSERT INTO `examquestion` VALUES (1,'2023-03-03 13:38:37',1,'十万个为什么','下面动物不属于昆虫的是（）。','[{\"text\":\"A.苍蝇\",\"code\":\"A\"},{\"text\":\"B.蜜蜂\",\"code\":\"B\"},{\"text\":\"C.蜂鸟\",\"code\":\"C\"}]',20,'C','蜂鸟',0,1),(2,'2023-03-03 13:38:37',1,'十万个为什么','油着火后可以用水扑灭。','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',20,'B','油着火后不可以用水扑灭',2,2),(3,'2023-03-03 13:38:37',1,'十万个为什么','地球是个球体，中间是（ ）。','[]',30,'赤道','赤道',3,3),(4,'2023-03-03 13:38:37',1,'十万个为什么','下面动物中会流汗的有（ ）。','[{\"text\":\"A.马\",\"code\":\"A\"},{\"text\":\"B.猫\",\"code\":\"B\"},{\"text\":\"C.狗\",\"code\":\"C\"}]',30,'A,B','狗不会流汗',1,4);
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS `examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '在线测试id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '在线测试名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examrecord`
--

LOCK TABLES `examrecord` WRITE;
/*!40000 ALTER TABLE `examrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaoshi`
--

DROP TABLE IF EXISTS `jiaoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshizhanghao` varchar(200) NOT NULL COMMENT '教师账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) NOT NULL COMMENT '教师姓名',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `touxiang` longtext COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaoshizhanghao` (`jiaoshizhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoshi`
--

LOCK TABLES `jiaoshi` WRITE;
/*!40000 ALTER TABLE `jiaoshi` DISABLE KEYS */;
INSERT INTO `jiaoshi` VALUES (21,'2023-03-03 13:38:37','教师账号1','123456','教师姓名1',1,'男','13823888881','upload/jiaoshi_touxiang1.jpg'),(22,'2023-03-03 13:38:37','教师账号2','123456','教师姓名2',2,'男','13823888882','upload/jiaoshi_touxiang2.jpg'),(23,'2023-03-03 13:38:37','教师账号3','123456','教师姓名3',3,'男','13823888883','upload/jiaoshi_touxiang3.jpg'),(24,'2023-03-03 13:38:37','教师账号4','123456','教师姓名4',4,'男','13823888884','upload/jiaoshi_touxiang4.jpg'),(25,'2023-03-03 13:38:37','教师账号5','123456','教师姓名5',5,'男','13823888885','upload/jiaoshi_touxiang5.jpg'),(26,'2023-03-03 13:38:37','教师账号6','123456','教师姓名6',6,'男','13823888886','upload/jiaoshi_touxiang6.jpg'),(27,'2023-03-03 13:38:37','教师账号7','123456','教师姓名7',7,'男','13823888887','upload/jiaoshi_touxiang7.jpg'),(28,'2023-03-03 13:38:37','教师账号8','123456','教师姓名8',8,'男','13823888888','upload/jiaoshi_touxiang8.jpg');
/*!40000 ALTER TABLE `jiaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kemuxinxi`
--

DROP TABLE IF EXISTS `kemuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kemuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kemumingcheng` varchar(200) DEFAULT NULL COMMENT '科目名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kemumingcheng` (`kemumingcheng`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='科目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kemuxinxi`
--

LOCK TABLES `kemuxinxi` WRITE;
/*!40000 ALTER TABLE `kemuxinxi` DISABLE KEYS */;
INSERT INTO `kemuxinxi` VALUES (31,'2023-03-03 13:38:37','科目名称1'),(32,'2023-03-03 13:38:37','科目名称2'),(33,'2023-03-03 13:38:37','科目名称3'),(34,'2023-03-03 13:38:37','科目名称4'),(35,'2023-03-03 13:38:37','科目名称5'),(36,'2023-03-03 13:38:37','科目名称6'),(37,'2023-03-03 13:38:37','科目名称7'),(38,'2023-03-03 13:38:37','科目名称8');
/*!40000 ALTER TABLE `kemuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2023-03-03 13:38:38','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-list\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"学生\",\"menuJump\":\"列表\",\"tableName\":\"xuesheng\"}],\"menu\":\"学生管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-explore\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"教师\",\"menuJump\":\"列表\",\"tableName\":\"jiaoshi\"}],\"menu\":\"教师管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"科目信息\",\"menuJump\":\"列表\",\"tableName\":\"kemuxinxi\"}],\"menu\":\"科目信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"在线学习\",\"menuJump\":\"列表\",\"tableName\":\"zaixianxuexi\"}],\"menu\":\"在线学习管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-rank\",\"buttons\":[\"查看\",\"删除\",\"学习进度\"],\"menu\":\"学生打卡\",\"menuJump\":\"列表\",\"tableName\":\"xueshengdaka\"}],\"menu\":\"学生打卡管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-addressbook\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"作业信息\",\"menuJump\":\"列表\",\"tableName\":\"zuoyexinxi\"}],\"menu\":\"作业信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"学生作业\",\"menuJump\":\"列表\",\"tableName\":\"xueshengzuoye\"}],\"menu\":\"学生作业管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"删除\",\"作业成绩\"],\"menu\":\"作业成绩\",\"menuJump\":\"列表\",\"tableName\":\"zuoyechengji\"}],\"menu\":\"作业成绩管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"删除\",\"查看\"],\"menu\":\"知识点\",\"menuJump\":\"列表\",\"tableName\":\"zhishidian\"}],\"menu\":\"知识点管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"删除\",\"审核\"],\"menu\":\"咨询教师\",\"menuJump\":\"列表\",\"tableName\":\"zixunjiaoshi\"}],\"menu\":\"咨询教师管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"查看\",\"删除\",\"学习结果\",\"学生成绩\"],\"menu\":\"学习结果\",\"menuJump\":\"列表\",\"tableName\":\"xuexijieguo\"}],\"menu\":\"学习结果管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"在线测试管理\",\"tableName\":\"exampaper\"}],\"menu\":\"在线测试管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-explore\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"试题管理\",\"tableName\":\"examquestion\"}],\"menu\":\"试题管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"编辑名称\",\"编辑父级\",\"删除\"],\"menu\":\"菜单列表\",\"tableName\":\"menu\"},{\"appFrontIcon\":\"cuIcon-qrcode\",\"buttons\":[\"查看\",\"修改\"],\"menu\":\"关于我们\",\"tableName\":\"aboutus\"},{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"查看\",\"修改\"],\"menu\":\"系统简介\",\"tableName\":\"systemintro\"},{\"appFrontIcon\":\"cuIcon-medal\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图管理\",\"tableName\":\"config\"},{\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"公告信息\",\"tableName\":\"news\"}],\"menu\":\"系统管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"考试记录\",\"tableName\":\"examrecord\"},{\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"错题本\",\"tableName\":\"examfailrecord\"}],\"menu\":\"考试管理\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"查看\",\"学生打卡\",\"咨询教师\"],\"menu\":\"在线学习列表\",\"menuJump\":\"列表\",\"tableName\":\"zaixianxuexi\"}],\"menu\":\"在线学习模块\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"查看\",\"作业提交\"],\"menu\":\"作业信息列表\",\"menuJump\":\"列表\",\"tableName\":\"zuoyexinxi\"}],\"menu\":\"作业信息模块\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"咨询教师\"],\"menu\":\"知识点列表\",\"menuJump\":\"列表\",\"tableName\":\"zhishidian\"}],\"menu\":\"知识点模块\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-rank\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"学生打卡\",\"menuJump\":\"列表\",\"tableName\":\"xueshengdaka\"}],\"menu\":\"学生打卡管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"学生作业\",\"menuJump\":\"列表\",\"tableName\":\"xueshengzuoye\"}],\"menu\":\"学生作业管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\"],\"menu\":\"作业成绩\",\"menuJump\":\"列表\",\"tableName\":\"zuoyechengji\"}],\"menu\":\"作业成绩管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"咨询教师\",\"menuJump\":\"列表\",\"tableName\":\"zixunjiaoshi\"}],\"menu\":\"咨询教师管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"查看\"],\"menu\":\"学习结果\",\"menuJump\":\"列表\",\"tableName\":\"xuexijieguo\"}],\"menu\":\"学习结果管理\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"查看\",\"学生打卡\",\"咨询教师\"],\"menu\":\"在线学习列表\",\"menuJump\":\"列表\",\"tableName\":\"zaixianxuexi\"}],\"menu\":\"在线学习模块\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"查看\",\"作业提交\"],\"menu\":\"作业信息列表\",\"menuJump\":\"列表\",\"tableName\":\"zuoyexinxi\"}],\"menu\":\"作业信息模块\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"咨询教师\"],\"menu\":\"知识点列表\",\"menuJump\":\"列表\",\"tableName\":\"zhishidian\"}],\"menu\":\"知识点模块\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"学生\",\"tableName\":\"xuesheng\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"在线学习\",\"menuJump\":\"列表\",\"tableName\":\"zaixianxuexi\"}],\"menu\":\"在线学习管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-rank\",\"buttons\":[\"查看\",\"删除\",\"学习进度\"],\"menu\":\"学生打卡\",\"menuJump\":\"列表\",\"tableName\":\"xueshengdaka\"}],\"menu\":\"学生打卡管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-addressbook\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"作业信息\",\"menuJump\":\"列表\",\"tableName\":\"zuoyexinxi\"}],\"menu\":\"作业信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"删除\",\"批改作业\"],\"menu\":\"学生作业\",\"menuJump\":\"列表\",\"tableName\":\"xueshengzuoye\"}],\"menu\":\"学生作业管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"作业成绩\"],\"menu\":\"作业成绩\",\"menuJump\":\"列表\",\"tableName\":\"zuoyechengji\"}],\"menu\":\"作业成绩管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"知识点\",\"menuJump\":\"列表\",\"tableName\":\"zhishidian\"}],\"menu\":\"知识点管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"删除\",\"审核\"],\"menu\":\"咨询教师\",\"menuJump\":\"列表\",\"tableName\":\"zixunjiaoshi\"}],\"menu\":\"咨询教师管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"学习结果\",\"学生成绩\"],\"menu\":\"学习结果\",\"menuJump\":\"列表\",\"tableName\":\"xuexijieguo\"}],\"menu\":\"学习结果管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"在线测试管理\",\"tableName\":\"exampaper\"}],\"menu\":\"在线测试管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-explore\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"试题管理\",\"tableName\":\"examquestion\"}],\"menu\":\"试题管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"考试记录\",\"tableName\":\"examrecord\"},{\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"错题本\",\"tableName\":\"examfailrecord\"}],\"menu\":\"考试管理\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"查看\",\"学生打卡\",\"咨询教师\"],\"menu\":\"在线学习列表\",\"menuJump\":\"列表\",\"tableName\":\"zaixianxuexi\"}],\"menu\":\"在线学习模块\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"查看\",\"作业提交\"],\"menu\":\"作业信息列表\",\"menuJump\":\"列表\",\"tableName\":\"zuoyexinxi\"}],\"menu\":\"作业信息模块\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"咨询教师\"],\"menu\":\"知识点列表\",\"menuJump\":\"列表\",\"tableName\":\"zhishidian\"}],\"menu\":\"知识点模块\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"教师\",\"tableName\":\"jiaoshi\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` longtext NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COMMENT='公告信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (161,'2023-03-03 13:38:37','有梦想，就要努力去实现','不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。','upload/news_picture1.jpg','<p>不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?</p><p>你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。</p><p>真正有行动力的人不需要别人告诉他如何做，因为他已经在做了。就算碰到问题，他也会自己想办法，自己动手去解决或者主动寻求可以帮助他的人，而不是等着别人为自己解决问题。</p><p>首先要学习独立思考。花一点时间想一下自己喜欢什么，梦想是什么，不要别人说想环游世界，你就说你的梦想是环游世界。</p><p>很多人说现实束缚了自己，其实在这个世界上，我们一直都可以有很多选择，生活的决定权也—直都在自己手上，只是我们缺乏行动力而已。</p><p>如果你觉得安于现状是你想要的，那选择安于现状就会让你幸福和满足;如果你不甘平庸，选择一条改变、进取和奋斗的道路，在这个追求的过程中，你也一样会感到快乐。所谓的成功，即是按照自己想要的生活方式生活。最糟糕的状态，莫过于当你想要选择一条不甘平庸、改变、进取和奋斗的道路时，却以一种安于现状的方式生活，最后抱怨自己没有得到想要的人生。</p><p>因为喜欢，你不是在苦苦坚持，也因为喜欢，你愿意投入时间、精力，长久以往，获得成功就是自然而然的事情。</p>'),(162,'2023-03-03 13:38:37','又是一年毕业季','又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。','upload/news_picture2.jpg','<p>又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。</p><p>过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。一直都是晚会的忠实参与者，无论是台前还是幕后，忽然间，角色转变，那种感觉确实难以用语言表达。</p><p>	过去的三年，总是默默地期盼着这个好雨时节，因为这时候，会有灿烂的阳光，会有满目的百花争艳，会有香甜的冰激凌，这是个毕业的季节，当时不经世事的我们会殷切地期待学校那一大堆的活动，期待穿上绚丽的演出服或者礼仪服，站在大礼堂镁光灯下尽情挥洒我们的澎拜的激情。</p><p>百感交集，隔岸观火与身临其境的感觉竟是如此不同。从来没想过一场晚会送走的是我们自己的时候会是怎样的感情，毕业就真的意味着结束吗?倔强的我们不愿意承认，谢谢学弟学妹们慷慨的将这次的主题定为“我们在这里”。我知道，这可能是他们对我们这些过来人的尊敬和施舍。</p><p>没有为这场晚会排练、奔波，没有为班级、学生会、文学院出点力，还真有点不习惯，百般无奈中，用“工作忙”个万能的借口来搪塞自己，欺骗别人。其实自己心里明白，那只是在逃避，只是不愿面对繁华落幕后的萧条和落寞。大四了，大家各奔东西，想凑齐班上的人真的是难上加难，敏燕从越南回来，刚落地就匆匆回了学校，那么恋家的人也启程回来了，睿睿学姐也是从家赶来跟我们团圆。大家—如既往的寒暄、打趣、调侃对方，似乎一切又回到了当初的单纯美好。</p><p>看着舞台上活泼可爱的学弟学妹们，如同一群机灵的小精灵，清澈的眼神，稚嫩的肢体，轻快地步伐，用他们那热情洋溢的舞姿渲染着在场的每一个人，我知道，我不应该羡慕嫉妒他们，不应该顾自怜惜逝去的青春，不应该感叹夕阳无限好，曾经，我们也拥有过，曾经，我们也年轻过，曾经，我们也灿烂过。我深深地告诉自己，人生的每个阶段都是美的，年轻有年轻的活力，成熟也有成熟的魅力。多—份稳重、淡然、优雅，也是漫漫时光掠影遗留下的.珍贵赏赐。</p>'),(163,'2023-03-03 13:38:37','挫折路上，坚持常在心间','回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。','upload/news_picture3.jpg','<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>'),(164,'2023-03-03 13:38:37','挫折是另一个生命的开端','当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。','upload/news_picture4.jpg','<p>当遇到挫折或失败，你是看见失败还是看见机会?</p><p>挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。</p><p>人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。</p><p>大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。</p><p>	“塞翁失马，焉知非福。”人生的道路，并不是每一步都迈向成功，这就是追求的意义。我们还要认识到一点，挫折作为一种情绪状态和一种个人体验，各人的耐受性是大不相同的，有的人经历了一次次挫折，就能够坚忍不拔，百折不挠;有的人稍遇挫折便意志消沉，一蹶不振。所以，挫折感是一种主观感受，因为人的目的和需要不同，成功标准不同，所以同一种活动对于不同的人可能会造成不同的挫折感受。</p><p>凡事皆以平常心来看待，对于生命顺逆不要太执著。能够“破我执”是很高层的人生境界。</p><p>人事的艰难就是一种考验。就像—支剑要有磨刀来磨，剑才会利:一块璞玉要有粗石来磨，才会发出耀眼的光芒。我们能够做到的，只是如何减少、避免那些由于自身的原因所造成的挫折，而在遇到痛苦和挫折之后，则力求化解痛苦，争取幸福。我们要知道，痛苦和挫折是双重性的，它既是我们人生中难以完全避免的，也是我们在争取成功时，不可缺少的一种动力。因为我认为，推动我们奋斗的力量，不仅仅是对成功的渴望，还有为摆脱痛苦和挫折而进行的奋斗。</p>'),(165,'2023-03-03 13:38:37','你要去相信，没有到不了的明天','有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。','upload/news_picture5.jpg','<p>有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。</p><p>不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。</p><p>	不管你现在是在图书馆里背着怎么也看不进去的英语单词，还是你现在迷茫地看不清未来的方向不知道要往哪走。</p><p>不管你现在是在努力着去实现梦想却没能拉近与梦想的距离，还是你已经慢慢地找不到自己的梦想了。</p><p>你都要去相信，没有到不了的明天。</p><p>	有的时候你的梦想太大，别人说你的梦想根本不可能实现;有的时候你的梦想又太小，又有人说你胸无大志;有的时候你对死党说着将来要去环游世界的梦想，却换来他的不屑一顾，于是你再也不提自己的梦想;有的时候你突然说起将来要开个小店的愿望，却发现你讲述的那个人，并没有听到你在说什么。</p><p>不过又能怎么样呢，未来始终是自己的，梦想始终是自己的，没有人会来帮你实现它。</p><p>也许很多时候我们只是需要朋友的一句鼓励，一句安慰，却也得不到。但是相信我，世界上还有很多人，只是想要和你说说话。</p><p>因为我们都一样。一样的被人说成固执，一样的在追逐他们眼里根本不在意的东西。</p><p>所以，又有什么关系呢，别人始终不是你、不能懂你的心情，你又何必多去解释呢。这个世界会来阻止你，困难也会接踵而至，其实真正关键的只有自己，有没有那个倔强。</p><p>这个世界上没有不带伤的人，真正能治愈自己的，只有自己。</p>'),(166,'2023-03-03 13:38:37','离开是一种痛苦，是一种勇气，但同样也是一个考验，是一个新的开端','无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。','upload/news_picture6.jpg','<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>'),(167,'2023-03-03 13:38:37','Leave未必是一种痛苦','无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。','upload/news_picture7.jpg','<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>'),(168,'2023-03-03 13:38:37','坚持才会成功','回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。','upload/news_picture8.jpg','<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemintro`
--

DROP TABLE IF EXISTS `systemintro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemintro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `content` longtext NOT NULL COMMENT '内容',
  `picture1` longtext COMMENT '图片1',
  `picture2` longtext COMMENT '图片2',
  `picture3` longtext COMMENT '图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='关于我们';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemintro`
--

LOCK TABLES `systemintro` WRITE;
/*!40000 ALTER TABLE `systemintro` DISABLE KEYS */;
INSERT INTO `systemintro` VALUES (1,'2023-03-03 13:38:37','系统简介','SYSTEM INTRODUCTION','当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。','upload/systemintro_picture1.jpg','upload/systemintro_picture2.jpg','upload/systemintro_picture3.jpg');
/*!40000 ALTER TABLE `systemintro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'admin','users','管理员','2vcy214loui4bwodzbl1z25ptl25kbbh','2023-03-03 14:00:53','2023-03-03 15:00:54');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','管理员','2023-03-03 13:38:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuesheng`
--

DROP TABLE IF EXISTS `xuesheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `touxiang` longtext COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuesheng`
--

LOCK TABLES `xuesheng` WRITE;
/*!40000 ALTER TABLE `xuesheng` DISABLE KEYS */;
INSERT INTO `xuesheng` VALUES (11,'2023-03-03 13:38:37','学号1','123456','姓名1',1,'男','13823888881','班级1','upload/xuesheng_touxiang1.jpg'),(12,'2023-03-03 13:38:37','学号2','123456','姓名2',2,'男','13823888882','班级2','upload/xuesheng_touxiang2.jpg'),(13,'2023-03-03 13:38:37','学号3','123456','姓名3',3,'男','13823888883','班级3','upload/xuesheng_touxiang3.jpg'),(14,'2023-03-03 13:38:37','学号4','123456','姓名4',4,'男','13823888884','班级4','upload/xuesheng_touxiang4.jpg'),(15,'2023-03-03 13:38:37','学号5','123456','姓名5',5,'男','13823888885','班级5','upload/xuesheng_touxiang5.jpg'),(16,'2023-03-03 13:38:37','学号6','123456','姓名6',6,'男','13823888886','班级6','upload/xuesheng_touxiang6.jpg'),(17,'2023-03-03 13:38:37','学号7','123456','姓名7',7,'男','13823888887','班级7','upload/xuesheng_touxiang7.jpg'),(18,'2023-03-03 13:38:37','学号8','123456','姓名8',8,'男','13823888888','班级8','upload/xuesheng_touxiang8.jpg');
/*!40000 ALTER TABLE `xuesheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xueshengdaka`
--

DROP TABLE IF EXISTS `xueshengdaka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xueshengdaka` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shipinmingcheng` varchar(200) DEFAULT NULL COMMENT '视频名称',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `xuexijindu` varchar(200) NOT NULL COMMENT '学习进度',
  `dakashijian` datetime DEFAULT NULL COMMENT '打卡时间',
  `xuexineirong` longtext COMMENT '学习内容',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='学生打卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xueshengdaka`
--

LOCK TABLES `xueshengdaka` WRITE;
/*!40000 ALTER TABLE `xueshengdaka` DISABLE KEYS */;
INSERT INTO `xueshengdaka` VALUES (51,'2023-03-03 13:38:37','视频名称1','学号1','姓名1','未完成','2023-03-03 21:38:37','学习内容1','教师账号1','教师姓名1',1),(52,'2023-03-03 13:38:37','视频名称2','学号2','姓名2','未完成','2023-03-03 21:38:37','学习内容2','教师账号2','教师姓名2',2),(53,'2023-03-03 13:38:37','视频名称3','学号3','姓名3','未完成','2023-03-03 21:38:37','学习内容3','教师账号3','教师姓名3',3),(54,'2023-03-03 13:38:37','视频名称4','学号4','姓名4','未完成','2023-03-03 21:38:37','学习内容4','教师账号4','教师姓名4',4),(55,'2023-03-03 13:38:37','视频名称5','学号5','姓名5','未完成','2023-03-03 21:38:37','学习内容5','教师账号5','教师姓名5',5),(56,'2023-03-03 13:38:37','视频名称6','学号6','姓名6','未完成','2023-03-03 21:38:37','学习内容6','教师账号6','教师姓名6',6),(57,'2023-03-03 13:38:37','视频名称7','学号7','姓名7','未完成','2023-03-03 21:38:37','学习内容7','教师账号7','教师姓名7',7),(58,'2023-03-03 13:38:37','视频名称8','学号8','姓名8','未完成','2023-03-03 21:38:37','学习内容8','教师账号8','教师姓名8',8);
/*!40000 ALTER TABLE `xueshengdaka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xueshengzuoye`
--

DROP TABLE IF EXISTS `xueshengzuoye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xueshengzuoye` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `zuoyemingcheng` varchar(200) DEFAULT NULL COMMENT '作业名称',
  `zuoyewenjian` longtext COMMENT '作业文件',
  `wenjianneirong` longtext COMMENT '文件内容',
  `shangchuanshijian` datetime DEFAULT NULL COMMENT '上传时间',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `crossuserid` bigint(20) DEFAULT NULL COMMENT '跨表用户id',
  `crossrefid` bigint(20) DEFAULT NULL COMMENT '跨表主键id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='学生作业';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xueshengzuoye`
--

LOCK TABLES `xueshengzuoye` WRITE;
/*!40000 ALTER TABLE `xueshengzuoye` DISABLE KEYS */;
INSERT INTO `xueshengzuoye` VALUES (71,'2023-03-03 13:38:37','班级1','作业名称1','','文件内容1','2023-03-03 21:38:37','教师账号1','教师姓名1','学号1','姓名1',1,1),(72,'2023-03-03 13:38:37','班级2','作业名称2','','文件内容2','2023-03-03 21:38:37','教师账号2','教师姓名2','学号2','姓名2',2,2),(73,'2023-03-03 13:38:37','班级3','作业名称3','','文件内容3','2023-03-03 21:38:37','教师账号3','教师姓名3','学号3','姓名3',3,3),(74,'2023-03-03 13:38:37','班级4','作业名称4','','文件内容4','2023-03-03 21:38:37','教师账号4','教师姓名4','学号4','姓名4',4,4),(75,'2023-03-03 13:38:37','班级5','作业名称5','','文件内容5','2023-03-03 21:38:37','教师账号5','教师姓名5','学号5','姓名5',5,5),(76,'2023-03-03 13:38:37','班级6','作业名称6','','文件内容6','2023-03-03 21:38:37','教师账号6','教师姓名6','学号6','姓名6',6,6),(77,'2023-03-03 13:38:37','班级7','作业名称7','','文件内容7','2023-03-03 21:38:37','教师账号7','教师姓名7','学号7','姓名7',7,7),(78,'2023-03-03 13:38:37','班级8','作业名称8','','文件内容8','2023-03-03 21:38:37','教师账号8','教师姓名8','学号8','姓名8',8,8);
/*!40000 ALTER TABLE `xueshengzuoye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuexijieguo`
--

DROP TABLE IF EXISTS `xuexijieguo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuexijieguo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `fenshu` float NOT NULL COMMENT '分数',
  `xuexijieguo` varchar(200) NOT NULL COMMENT '学习结果',
  `pingyu` longtext COMMENT '评语',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `dengjiriqi` date DEFAULT NULL COMMENT '登记日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='学习结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuexijieguo`
--

LOCK TABLES `xuexijieguo` WRITE;
/*!40000 ALTER TABLE `xuexijieguo` DISABLE KEYS */;
INSERT INTO `xuexijieguo` VALUES (111,'2023-03-03 13:38:37','学号1','姓名1','班级1',1,'未达标','评语1','教师账号1','教师姓名1','2023-03-03'),(112,'2023-03-03 13:38:37','学号2','姓名2','班级2',2,'未达标','评语2','教师账号2','教师姓名2','2023-03-03'),(113,'2023-03-03 13:38:37','学号3','姓名3','班级3',3,'未达标','评语3','教师账号3','教师姓名3','2023-03-03'),(114,'2023-03-03 13:38:37','学号4','姓名4','班级4',4,'未达标','评语4','教师账号4','教师姓名4','2023-03-03'),(115,'2023-03-03 13:38:37','学号5','姓名5','班级5',5,'未达标','评语5','教师账号5','教师姓名5','2023-03-03'),(116,'2023-03-03 13:38:37','学号6','姓名6','班级6',6,'未达标','评语6','教师账号6','教师姓名6','2023-03-03'),(117,'2023-03-03 13:38:37','学号7','姓名7','班级7',7,'未达标','评语7','教师账号7','教师姓名7','2023-03-03'),(118,'2023-03-03 13:38:37','学号8','姓名8','班级8',8,'未达标','评语8','教师账号8','教师姓名8','2023-03-03');
/*!40000 ALTER TABLE `xuexijieguo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaixianxuexi`
--

DROP TABLE IF EXISTS `zaixianxuexi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zaixianxuexi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shipinmingcheng` varchar(200) NOT NULL COMMENT '视频名称',
  `kemumingcheng` varchar(200) NOT NULL COMMENT '科目名称',
  `fengmian` longtext COMMENT '封面',
  `yinpin` longtext COMMENT '音频',
  `shipin` longtext COMMENT '视频',
  `shipinjieshao` longtext COMMENT '视频介绍',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='在线学习';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaixianxuexi`
--

LOCK TABLES `zaixianxuexi` WRITE;
/*!40000 ALTER TABLE `zaixianxuexi` DISABLE KEYS */;
INSERT INTO `zaixianxuexi` VALUES (41,'2023-03-03 13:38:37','视频名称1','科目名称1','upload/zaixianxuexi_fengmian1.jpg,upload/zaixianxuexi_fengmian2.jpg,upload/zaixianxuexi_fengmian3.jpg','','','视频介绍1','2023-03-03','教师账号1','教师姓名1',1,1,'2023-03-03 21:38:37',1),(42,'2023-03-03 13:38:37','视频名称2','科目名称2','upload/zaixianxuexi_fengmian2.jpg,upload/zaixianxuexi_fengmian3.jpg,upload/zaixianxuexi_fengmian4.jpg','','','视频介绍2','2023-03-03','教师账号2','教师姓名2',2,2,'2023-03-03 21:38:37',2),(43,'2023-03-03 13:38:37','视频名称3','科目名称3','upload/zaixianxuexi_fengmian3.jpg,upload/zaixianxuexi_fengmian4.jpg,upload/zaixianxuexi_fengmian5.jpg','','','视频介绍3','2023-03-03','教师账号3','教师姓名3',3,3,'2023-03-03 21:38:37',3),(44,'2023-03-03 13:38:37','视频名称4','科目名称4','upload/zaixianxuexi_fengmian4.jpg,upload/zaixianxuexi_fengmian5.jpg,upload/zaixianxuexi_fengmian6.jpg','','','视频介绍4','2023-03-03','教师账号4','教师姓名4',4,4,'2023-03-03 21:38:37',4),(45,'2023-03-03 13:38:37','视频名称5','科目名称5','upload/zaixianxuexi_fengmian5.jpg,upload/zaixianxuexi_fengmian6.jpg,upload/zaixianxuexi_fengmian7.jpg','','','视频介绍5','2023-03-03','教师账号5','教师姓名5',5,5,'2023-03-03 21:38:37',5),(46,'2023-03-03 13:38:37','视频名称6','科目名称6','upload/zaixianxuexi_fengmian6.jpg,upload/zaixianxuexi_fengmian7.jpg,upload/zaixianxuexi_fengmian8.jpg','','','视频介绍6','2023-03-03','教师账号6','教师姓名6',6,6,'2023-03-03 21:38:37',6),(47,'2023-03-03 13:38:37','视频名称7','科目名称7','upload/zaixianxuexi_fengmian7.jpg,upload/zaixianxuexi_fengmian8.jpg,upload/zaixianxuexi_fengmian9.jpg','','','视频介绍7','2023-03-03','教师账号7','教师姓名7',7,7,'2023-03-03 21:38:37',7),(48,'2023-03-03 13:38:37','视频名称8','科目名称8','upload/zaixianxuexi_fengmian8.jpg,upload/zaixianxuexi_fengmian9.jpg,upload/zaixianxuexi_fengmian10.jpg','','','视频介绍8','2023-03-03','教师账号8','教师姓名8',8,8,'2023-03-03 21:38:37',8);
/*!40000 ALTER TABLE `zaixianxuexi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhishidian`
--

DROP TABLE IF EXISTS `zhishidian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhishidian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhishimingcheng` varchar(200) NOT NULL COMMENT '知识名称',
  `fengmian` longtext COMMENT '封面',
  `wenjian` longtext COMMENT '文件',
  `zhishixiangqing` longtext COMMENT '知识详情',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='知识点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhishidian`
--

LOCK TABLES `zhishidian` WRITE;
/*!40000 ALTER TABLE `zhishidian` DISABLE KEYS */;
INSERT INTO `zhishidian` VALUES (91,'2023-03-03 13:38:37','知识名称1','upload/zhishidian_fengmian1.jpg,upload/zhishidian_fengmian2.jpg,upload/zhishidian_fengmian3.jpg','','知识详情1','2023-03-03','教师账号1','教师姓名1','2023-03-03 21:38:37'),(92,'2023-03-03 13:38:37','知识名称2','upload/zhishidian_fengmian2.jpg,upload/zhishidian_fengmian3.jpg,upload/zhishidian_fengmian4.jpg','','知识详情2','2023-03-03','教师账号2','教师姓名2','2023-03-03 21:38:37'),(93,'2023-03-03 13:38:37','知识名称3','upload/zhishidian_fengmian3.jpg,upload/zhishidian_fengmian4.jpg,upload/zhishidian_fengmian5.jpg','','知识详情3','2023-03-03','教师账号3','教师姓名3','2023-03-03 21:38:37'),(94,'2023-03-03 13:38:37','知识名称4','upload/zhishidian_fengmian4.jpg,upload/zhishidian_fengmian5.jpg,upload/zhishidian_fengmian6.jpg','','知识详情4','2023-03-03','教师账号4','教师姓名4','2023-03-03 21:38:37'),(95,'2023-03-03 13:38:37','知识名称5','upload/zhishidian_fengmian5.jpg,upload/zhishidian_fengmian6.jpg,upload/zhishidian_fengmian7.jpg','','知识详情5','2023-03-03','教师账号5','教师姓名5','2023-03-03 21:38:37'),(96,'2023-03-03 13:38:37','知识名称6','upload/zhishidian_fengmian6.jpg,upload/zhishidian_fengmian7.jpg,upload/zhishidian_fengmian8.jpg','','知识详情6','2023-03-03','教师账号6','教师姓名6','2023-03-03 21:38:37'),(97,'2023-03-03 13:38:37','知识名称7','upload/zhishidian_fengmian7.jpg,upload/zhishidian_fengmian8.jpg,upload/zhishidian_fengmian9.jpg','','知识详情7','2023-03-03','教师账号7','教师姓名7','2023-03-03 21:38:37'),(98,'2023-03-03 13:38:37','知识名称8','upload/zhishidian_fengmian8.jpg,upload/zhishidian_fengmian9.jpg,upload/zhishidian_fengmian10.jpg','','知识详情8','2023-03-03','教师账号8','教师姓名8','2023-03-03 21:38:37');
/*!40000 ALTER TABLE `zhishidian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zixunjiaoshi`
--

DROP TABLE IF EXISTS `zixunjiaoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zixunjiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zixunbiaoti` varchar(200) NOT NULL COMMENT '咨询标题',
  `zixunwenti` longtext NOT NULL COMMENT '咨询问题',
  `zixunshijian` datetime DEFAULT NULL COMMENT '咨询时间',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `shhf` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='咨询教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zixunjiaoshi`
--

LOCK TABLES `zixunjiaoshi` WRITE;
/*!40000 ALTER TABLE `zixunjiaoshi` DISABLE KEYS */;
INSERT INTO `zixunjiaoshi` VALUES (101,'2023-03-03 13:38:37','咨询标题1','咨询问题1','2023-03-03 21:38:37','教师账号1','教师姓名1','学号1','姓名1',''),(102,'2023-03-03 13:38:37','咨询标题2','咨询问题2','2023-03-03 21:38:37','教师账号2','教师姓名2','学号2','姓名2',''),(103,'2023-03-03 13:38:37','咨询标题3','咨询问题3','2023-03-03 21:38:37','教师账号3','教师姓名3','学号3','姓名3',''),(104,'2023-03-03 13:38:37','咨询标题4','咨询问题4','2023-03-03 21:38:37','教师账号4','教师姓名4','学号4','姓名4',''),(105,'2023-03-03 13:38:37','咨询标题5','咨询问题5','2023-03-03 21:38:37','教师账号5','教师姓名5','学号5','姓名5',''),(106,'2023-03-03 13:38:37','咨询标题6','咨询问题6','2023-03-03 21:38:37','教师账号6','教师姓名6','学号6','姓名6',''),(107,'2023-03-03 13:38:37','咨询标题7','咨询问题7','2023-03-03 21:38:37','教师账号7','教师姓名7','学号7','姓名7',''),(108,'2023-03-03 13:38:37','咨询标题8','咨询问题8','2023-03-03 21:38:37','教师账号8','教师姓名8','学号8','姓名8','');
/*!40000 ALTER TABLE `zixunjiaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zuoyechengji`
--

DROP TABLE IF EXISTS `zuoyechengji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zuoyechengji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `zuoyemingcheng` varchar(200) DEFAULT NULL COMMENT '作业名称',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `zuoyefenshu` float NOT NULL COMMENT '作业分数',
  `pingyu` longtext COMMENT '评语',
  `pingfenriqi` date DEFAULT NULL COMMENT '评分日期',
  `crossuserid` bigint(20) DEFAULT NULL COMMENT '跨表用户id',
  `crossrefid` bigint(20) DEFAULT NULL COMMENT '跨表主键id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='作业成绩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zuoyechengji`
--

LOCK TABLES `zuoyechengji` WRITE;
/*!40000 ALTER TABLE `zuoyechengji` DISABLE KEYS */;
INSERT INTO `zuoyechengji` VALUES (81,'2023-03-03 13:38:37','班级1','作业名称1','教师账号1','教师姓名1','学号1','姓名1',1,'评语1','2023-03-03',1,1),(82,'2023-03-03 13:38:37','班级2','作业名称2','教师账号2','教师姓名2','学号2','姓名2',2,'评语2','2023-03-03',2,2),(83,'2023-03-03 13:38:37','班级3','作业名称3','教师账号3','教师姓名3','学号3','姓名3',3,'评语3','2023-03-03',3,3),(84,'2023-03-03 13:38:37','班级4','作业名称4','教师账号4','教师姓名4','学号4','姓名4',4,'评语4','2023-03-03',4,4),(85,'2023-03-03 13:38:37','班级5','作业名称5','教师账号5','教师姓名5','学号5','姓名5',5,'评语5','2023-03-03',5,5),(86,'2023-03-03 13:38:37','班级6','作业名称6','教师账号6','教师姓名6','学号6','姓名6',6,'评语6','2023-03-03',6,6),(87,'2023-03-03 13:38:37','班级7','作业名称7','教师账号7','教师姓名7','学号7','姓名7',7,'评语7','2023-03-03',7,7),(88,'2023-03-03 13:38:37','班级8','作业名称8','教师账号8','教师姓名8','学号8','姓名8',8,'评语8','2023-03-03',8,8);
/*!40000 ALTER TABLE `zuoyechengji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zuoyexinxi`
--

DROP TABLE IF EXISTS `zuoyexinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zuoyexinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zuoyemingcheng` varchar(200) NOT NULL COMMENT '作业名称',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `fengmian` longtext COMMENT '封面',
  `zuoyeneirong` longtext COMMENT '作业内容',
  `buzhishijian` datetime DEFAULT NULL COMMENT '布置时间',
  `jiezhishijian` datetime DEFAULT NULL COMMENT '截止时间',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='作业信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zuoyexinxi`
--

LOCK TABLES `zuoyexinxi` WRITE;
/*!40000 ALTER TABLE `zuoyexinxi` DISABLE KEYS */;
INSERT INTO `zuoyexinxi` VALUES (61,'2023-03-03 13:38:37','作业名称1','班级1','upload/zuoyexinxi_fengmian1.jpg,upload/zuoyexinxi_fengmian2.jpg,upload/zuoyexinxi_fengmian3.jpg','作业内容1','2023-03-03 21:38:37','2023-03-03 21:38:37','教师账号1','教师姓名1','2023-03-03 21:38:37',1),(62,'2023-03-03 13:38:37','作业名称2','班级2','upload/zuoyexinxi_fengmian2.jpg,upload/zuoyexinxi_fengmian3.jpg,upload/zuoyexinxi_fengmian4.jpg','作业内容2','2023-03-03 21:38:37','2023-03-03 21:38:37','教师账号2','教师姓名2','2023-03-03 21:59:38',3),(63,'2023-03-03 13:38:37','作业名称3','班级3','upload/zuoyexinxi_fengmian3.jpg,upload/zuoyexinxi_fengmian4.jpg,upload/zuoyexinxi_fengmian5.jpg','作业内容3','2023-03-03 21:38:37','2023-03-03 21:38:37','教师账号3','教师姓名3','2023-03-03 21:38:37',3),(64,'2023-03-03 13:38:37','作业名称4','班级4','upload/zuoyexinxi_fengmian4.jpg,upload/zuoyexinxi_fengmian5.jpg,upload/zuoyexinxi_fengmian6.jpg','作业内容4','2023-03-03 21:38:37','2023-03-03 21:38:37','教师账号4','教师姓名4','2023-03-03 21:38:37',4),(65,'2023-03-03 13:38:37','作业名称5','班级5','upload/zuoyexinxi_fengmian5.jpg,upload/zuoyexinxi_fengmian6.jpg,upload/zuoyexinxi_fengmian7.jpg','作业内容5','2023-03-03 21:38:37','2023-03-03 21:38:37','教师账号5','教师姓名5','2023-03-03 21:38:37',5),(66,'2023-03-03 13:38:37','作业名称6','班级6','upload/zuoyexinxi_fengmian6.jpg,upload/zuoyexinxi_fengmian7.jpg,upload/zuoyexinxi_fengmian8.jpg','作业内容6','2023-03-03 21:38:37','2023-03-03 21:38:37','教师账号6','教师姓名6','2023-03-03 21:38:37',6),(67,'2023-03-03 13:38:37','作业名称7','班级7','upload/zuoyexinxi_fengmian7.jpg,upload/zuoyexinxi_fengmian8.jpg,upload/zuoyexinxi_fengmian9.jpg','作业内容7','2023-03-03 21:38:37','2023-03-03 21:38:37','教师账号7','教师姓名7','2023-03-03 21:38:37',7),(68,'2023-03-03 13:38:37','作业名称8','班级8','upload/zuoyexinxi_fengmian8.jpg,upload/zuoyexinxi_fengmian9.jpg,upload/zuoyexinxi_fengmian10.jpg','作业内容8','2023-03-03 21:38:37','2023-03-03 21:38:37','教师账号8','教师姓名8','2023-03-03 21:38:37',8);
/*!40000 ALTER TABLE `zuoyexinxi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-06 21:31:29
