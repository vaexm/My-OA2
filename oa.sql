-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

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
-- Table structure for table `sp_dept`
--

DROP TABLE IF EXISTS `sp_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '部门名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '部门编号',
  `remark` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_dept`
--

LOCK TABLES `sp_dept` WRITE;
/*!40000 ALTER TABLE `sp_dept` DISABLE KEYS */;
INSERT INTO `sp_dept` VALUES (1,'总裁办',0,'该部门属于公司的最高管理层',1),(2,'办公室',0,'',2),(3,'行政部门',2,'行政部门隶属于办公室，主要负责公司的相关事务的管理',3),(4,'人事部',2,'人事部主要负责公司的人员的调动，人事制度的制定等。',5),(5,'客服部',2,'',6),(6,'财务部',0,'该部门主要负责本公司的相关财务工作。',7),(7,'技术部',0,'技术部主要负责解决公司的技术难题，并参与公司新项目的研发。',8),(8,'市场部',0,'',9),(9,'运营部',0,'该部门主要负责公司内部事务的运营以及相关产品的运营以及推广。',10);
/*!40000 ALTER TABLE `sp_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_doc`
--

DROP TABLE IF EXISTS `sp_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '公文标题',
  `filepath` varchar(255) DEFAULT NULL COMMENT '附件存储路径',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `hasfile` smallint(1) DEFAULT '0' COMMENT '是否存在附件',
  `content` text COMMENT '公文内容',
  `author` varchar(40) NOT NULL COMMENT '作者',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_doc`
--

LOCK TABLES `sp_doc` WRITE;
/*!40000 ALTER TABLE `sp_doc` DISABLE KEYS */;
INSERT INTO `sp_doc` VALUES (1,'关于公司考勤制度的调整','/Public/Upload/2017-05-10/59129c13afbb9.docx','php2.docx',1,'&lt;p&gt;&amp;nbsp; &amp;nbsp;即日起，公司实行每日考勤4次，外出同事按照外出考勤模式来处理，即日生效！所有员工必须严格遵守，否则进行相应的处罚123。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 2017.05.06&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;br/&gt;&lt;/p&gt;','admin',1494391827),(7,'提倡节水节电','/Public/Upload/2017-06-12/593e9606e9511.docx','email.docx',1,'&lt;p&gt;全体员工们：&lt;/p&gt;&lt;p&gt;　　我们的目标是将企业做大做强。做大与做强是辨证的统一，做强是内容，做大是形式;做强是做大的基础。&lt;/p&gt;&lt;p&gt;　　我们的方法是坚持走降本节支之路。具体运作需要大处着眼，小处着手。大的管理方向、管理手段要明确;管理方法、管理措施要可行。小的管理细节、管理漏洞要改进。&lt;/p&gt;&lt;p&gt;　　有了好的思路、好的方法也需要员工来配合，这样才能产生好的效果。我们企业规模在不断扩张，职工人数在不断增加，设备添置在不断增多，材料消耗在不断增长，从而各项成本相应增加。降本节支就成了企业发展过程中不容回避的问题，成了企业管理的核心。企业的兴衰连着每一位员工，企业的增效靠着节约每一样东西，员工们应该自加压力、保持危机感，始终将提高个人素质、养成良好习惯作为工作来对待，将杜绝浪费、勤俭节约作为美德来发扬。尽管我们易华过去创造了可观的效益，但如果我们放弃继续加强管理、降本节支、节能增效的努力，庞大的开支将使我们企业陷于瘫痪。&lt;/p&gt;&lt;p&gt;　　浪费是最可耻的行为，希望我们员工要从节约一滴水、节约一分钱、节约一度电抓起，从一件小事、一个细节来调动各个岗位的节约意识，发挥中层干部的带头模范作用，将节约的意识深入化、节约的行为日常化、节约的成果扩大化。&lt;/p&gt;&lt;p&gt;　　 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;倡议人：XXX&lt;/p&gt;&lt;p&gt;　　 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 时间：2017年6月12日&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','admin',1497273863),(2,'关于公司请假制度的说明',NULL,NULL,0,'&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 即日起，所有员工请假手续必须齐全，事假和病假要严格区分，必须提前一天请假，特殊情况除外。如有员工无故不来上班，则按旷工处理。若请假时间过长，需征得总裁办的同意。&lt;br/&gt;&lt;/p&gt;','admin',1494393358),(3,'关于部分员工的调动','/Public/Upload/2017-05-10/5912a36fc98dd.docx','PHP面试题总结.docx',1,'&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 经过公司领导层商议决定，现调整部分员工的工作岗位，望各员工严格按照名单执行，若有异议，则可向上级领导反映，名单见附件。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 人事部&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2017年05月08日&lt;br/&gt;&lt;/p&gt;','zenghua',1494393711),(4,'对下述员工进行处罚',NULL,NULL,0,'&lt;p&gt;因以下几名员工XXX,XXX.....等，在工作中出现了严重的失误，现对以下员工提出批评处理，并扣除一个月的奖金，望其他员工引以为戒。&lt;br/&gt;&lt;/p&gt;','zenghua',1494393859),(5,'关于公司新的产品即将上线的通告','/Public/Upload/2017-05-10/5912a4fb3c976.txt','密码.txt',1,'&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 目前，公司新的项目&lt;span&gt;&lt;strong&gt;e+优品&lt;/strong&gt;&lt;/span&gt;手机移动端app即将上线，望运营部全体员工严格按照上级要求做好该产品上线前的推广，市场预热，宣传活动等，为该产品进入市场做好准备。&lt;br/&gt;&lt;/p&gt;','xiaolong',1494394107),(6,'1233','/Public/Upload/2017-05-11/5914546025d8a.docx','JS.docx',1,'&lt;p&gt;vbnhm,k,.l&lt;br/&gt;&lt;/p&gt;','admin',1494504544),(8,'人力资源经理岗位职责',NULL,NULL,0,'&lt;p&gt;公司经营发展需要，经公司管理层会议决议，现任命_________同志为人力资源部部总经理，主持人力资源部的日常工作。&lt;/p&gt;&lt;p&gt;　　人力资源经理岗位职责为：&lt;/p&gt;&lt;p&gt;　　1、人力资源规划与行政后勤规划管理：&lt;/p&gt;&lt;p&gt;　　2、部门内部管理与规范：&lt;/p&gt;&lt;p&gt;　　3、招聘与配置管理：&lt;/p&gt;&lt;p&gt;　　4、培训与开发管理：&lt;/p&gt;&lt;p&gt;　　5、绩效考核管理：&lt;/p&gt;&lt;p&gt;　　6、薪酬福利管理：&lt;/p&gt;&lt;p&gt;　　7、人力资源日常事务的管理。&lt;/p&gt;&lt;p&gt;　　8、企业文化建设和员工关系管理：&lt;/p&gt;&lt;p&gt;　　总经理：&lt;/p&gt;&lt;p&gt;　　X年X月X日&lt;br/&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','vaexm',1497274219);
/*!40000 ALTER TABLE `sp_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_email`
--

DROP TABLE IF EXISTS `sp_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL COMMENT '发送者id',
  `to_id` int(11) NOT NULL COMMENT '接收者id',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `file` varchar(255) DEFAULT NULL COMMENT '文件',
  `hasfile` smallint(1) DEFAULT '0' COMMENT '是否有附件',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件原始名',
  `content` text COMMENT '内容',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `isread` smallint(1) DEFAULT '0' COMMENT '是否已读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_email`
--

LOCK TABLES `sp_email` WRITE;
/*!40000 ALTER TABLE `sp_email` DISABLE KEYS */;
INSERT INTO `sp_email` VALUES (2,3,4,'请假条','/Public/Upload/2017-05-10/5912ac2318676.docx',1,'PHP面试题总结.docx','人事部总监，你好，因家中有紧急的事需要处理，需请假两天，望人事批准！',1494395939,0),(3,9,1,'关于新项目进度的汇报','/Public/Upload/2017-05-10/5912aeb3c42c0.docx',1,'PHP面试题总结.docx','关于新项目可以按照预定时间成功完成，目前进展顺利。',1494396595,1),(4,9,1,'项目资金','/Public/Upload/2017-05-10/5912af16b8203.docx',1,'Zend Framework学习笔记.docx','由于项目需要，需要重新服务器，所以需要新的资金，望领导可以批准。',1494396694,1),(6,2,1,'年终总结','/Public/Upload/2017-05-12/59151bbac4efe.docx',1,'总结.docx','徐总，你好，以下是我的年度总结报告，请你给予建议。',1494555578,1),(20,9,1,'上周工作总结','/Public/Upload/2017-06-12/593e9b2f64a4a.docx',1,'工作总结 09.11-.docx','尊敬的领导你好，这是我上周的工作总结，望领导批复！',1497275183,1),(8,1,9,'批复','/Public/Upload/2017-05-12/591524f1a27e5.txt',1,'密码.txt','已阅，项目资金批准。',1494557937,0),(9,12,1,'新项目文件','/Public/Upload/2017-05-15/5919331f21c3f.docx',1,'php2.docx','尊敬的领导，由于新项目启动，诸多事项需要领导签字，望批准。',1494823711,1),(11,16,1,'客服部人员变动申请','/Public/Upload/2017-05-15/5919344c7551b.docx',1,'php2.docx','尊敬的领导，因工作需要，现客服部需对以下人员作出调整，望领导批准!',1494824012,0),(12,16,13,'报告','/Public/Upload/2017-05-15/591934dfdf61c.txt',1,'密码.txt','你好，我是客服部的张维宏，因活动需要，需要市场部配合我们的活动，希望市场部可以积极配合，确保活动顺利进行。',1494824159,0),(13,4,1,'关于薪酬制度调整的申请','/Public/Upload/2017-05-15/591935fd008e6.txt',1,'密码.txt','具体情况见附件！',1494824445,0),(14,4,1,'免去某某人职位的申请','/Public/Upload/2017-05-15/5919364ff32b9.docx',1,'gtihub常用命令.docx','现因某某人在工作中出现严重失职，现申请免去他的职务，望领导批准！',1494824528,0),(15,1,2,'nmm','/Public/Upload/2017-05-16/591ac9dc5b552.docx',1,'php2.docx','mm,mkhkjk',1494927836,0),(16,1,5,'nnnn','/Public/Upload/2017-05-16/591acaba13b8b.txt',1,'密码.txt','bnmmm',1494928058,0),(17,1,9,'回复','/Public/Upload/2017-05-17/591bed2b4c5dc.txt',1,'密码.txt','同意',1495002411,0),(18,1,7,'批复申请','/Public/Upload/2017-05-17/591bedba5b0f2.txt',1,'密码.txt','1234567同意批复',1495002554,0);
/*!40000 ALTER TABLE `sp_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_inform`
--

DROP TABLE IF EXISTS `sp_inform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_inform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `addtime` date DEFAULT NULL COMMENT '添加时间',
  `author` varchar(30) DEFAULT NULL COMMENT '发布者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_inform`
--

LOCK TABLES `sp_inform` WRITE;
/*!40000 ALTER TABLE `sp_inform` DISABLE KEYS */;
INSERT INTO `sp_inform` VALUES (1,'万盟关于加强员工工作作风的公告','所有员工上班时间必须按照规定时间上班，上班期间不得偷懒，必须按时高质量的完成工作','2017-04-30','admin'),(2,'关于公示全市万盟办公生产双主体责任名单的通知','大数据是信息技术发展到如今的一个产物，它也会过时，当下人们谈论的大数据基本属性包括：全量，大，多样性，低价值密度等！对于决策者来说，数据驱动业务是大数据最大的价值。','2017-05-02','vae'),(3,'万盟支付系统安全管理责任人名单','支付系统安全必须可靠，所有名单如下:xxx.xxx,等','2017-05-03','vaexm'),(4,' 万盟公司关于表彰各位员工的规定','经公司相关人员进行相关的评定，认为以下员工表现优秀，现对其进行表扬等','2017-05-05','vaexm'),(5,'关于公司轮休制度的调整','大数据技术的战略意义不在于掌握庞大的数据信息，而在于对这些含有意义的数据进行专业化处理。换言之，如果把大数据比作一种产业，那么这种产业实现盈利的关键，在于提高对数据的“加工能力”，通过“加工”实现数据的“增值”。','2017-05-07','zenghua'),(6,'公司新项目启动通知','现公司新项目启动，希望各部门可以积极配合技术部门的工作，确保该项目可以按照约定日期顺利完成并成功上线。','2017-05-08','HaoShu'),(7,'公司休假调整','大数据与云计算的关系就像一枚硬币的正反面一样密不可分。大数据必然无法用单台的计算机进行处理，必须采用分布式计算架构。它的特色在于对海量数据的挖掘，但它必须依托云计算的分布式处理、分布式数据库、云存储和虚拟化技术','2017-05-09','xiaoyan'),(8,'万盟新的薪酬体系的建立','经公司人事部门的决定，现建立新的薪酬制度，所有在职人员的薪酬统一上调5个百分点，望有关部门严格执行。','2017-05-10','zenghua');
/*!40000 ALTER TABLE `sp_inform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_knowledge`
--

DROP TABLE IF EXISTS `sp_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_knowledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `filepath` varchar(255) DEFAULT NULL COMMENT '附件存储路径',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `hasfile` smallint(1) DEFAULT '0' COMMENT '是否存在附件',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `content` text COMMENT '内容',
  `author` varchar(40) NOT NULL COMMENT '作者',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_knowledge`
--

LOCK TABLES `sp_knowledge` WRITE;
/*!40000 ALTER TABLE `sp_knowledge` DISABLE KEYS */;
INSERT INTO `sp_knowledge` VALUES (1,'微信小程序','/Public/Upload/2017-05-14/59186ac921811.docx','php2.docx',1,'微信小程序是一种全新的连接用户与服务的方式，它可以在微信内被便捷地获取和传播，同时具有出色的使用体验。','       小程序，未来可以代替一些低频的APP和小型的APP，尤其对线下商户灵活低成本实现在线支付等功能非常有帮助，它是微信为了实现微信链接一切而出的介于公众号和pc网站之间的即用即走的APP，\r\n需要下载到手机，无需注册，等等有很多好处，目前小程序刚刚在丰富之中，预计两个月后你去微信小程序搜索栏去搜各种现有APP的名字可能都会出现，而且会有一些创新的小程序项目，总之它是2017年的创业新机会为初创小公司节约了很大的创业资金成本和时间成本','admin',1494772425),(2,'PHP','/Public/Upload/2017-05-14/59186b9a851ba.docx','PHP面试题总结.docx',1,'PHP，是英文超文本预处理语言Hypertext Preprocessor的缩写','      PHP，是英文超文本预处理语言Hypertext Preprocessor的缩写。PHP 是一种 HTML 内嵌式的语言，是一种在服务器端执行的嵌入HTML文档的脚本语言，语言的风格有类似于C语言，被广泛地运用。','admin',1494772634),(3,'微信公众号开发','/Public/Upload/2017-05-14/59186bcebad0d.docx','gtihub常用命令.docx',1,'微信公众平台是运营者通过公众号为微信用户提供资讯和服务的平台，而公众平台开发接口则是提供服务的基础，开发者在公众平台网站中创建公众号、获取接口权限后，可以通过阅读本接口文档来帮助开发。','       为了识别用户，每个用户针对每个公众号会产生一个安全的OpenID，如果需要在多公众号、移动应用之间做用户共通，则需前往微信开放平台，将这些公众号和应用绑定到一个开放平台账号下，绑定后，一个用户虽然对多个公众号和应用有多个不同的OpenID，但他对所有这些同一开放平台账号下的公众号和应用，只有一个UnionID，可以在用户管理-获取用户基本信息（UnionID机制）文档了解详情。','admin',1494772686),(4,'产品运营','/Public/Upload/2017-05-14/59186c0088bad.docx','gtihub常用命令.docx',1,'      产品运营是一项从内容建设，用户维护，活动策划三个层面来管理产品内容和用户的职业','       产品活动通常有三种，一种是内容导向的，引导用户产出符合要求的内容，借此传播产品的内容价值观。一种是社群导向的，通过煽动用户互动来推动社群关系的扩展，活跃社群氛围。一种是产品本位导向的，通过大众化的参与来普及产品特色，加强产品品牌。','HaoShu',1494772736),(5,'人力资源管理',NULL,NULL,0,'人力资源管理的六大模块是:人力资源规划----招聘与配置----培训与开发----绩效管理----薪酬福利管理----劳动关系管理','□ 人力资源的核查：是指核查人力资源的数量、质量、结构及分布状况。  □ 人力资源信息包括：个人自然情况、录用资料、教育资料、工资资料、工作执行评价、工作经历、服务与离职资料、工作态度、工作或职务的历史资料等。  □ 人力资源管理的五大要素：获取、整合、保持与激励、控制与调整、开发  □ 人力资源需求预测的方法有：直觉预测方法（定性预测）和数学预测方法（定量预测）。 □ 人力资源供给预测包括：1、内部拥有量预测2、外部人力资源供给量','HaoShu',1494772787),(6,'大数据来临','/Public/Upload/2017-05-14/59186c74af761.docx','php2.docx',1,'大数据指的是所涉及的资料量规模巨大到无法通过目前主流软件工具，在合理时间内达到撷取、管理、处理、并整理。','       其实大数据是一个概念，你不能定义为大，或者多，或者复杂。在不同行业，不同技术背景的情况下，对于大数据的解释是不一样的。虽然目前我们不能用一个明确地概念来描述它，但是，我们可以说明它的一些属性，比如4v。无论安全性，还是难处理，这些都是描述大数据的属性，当你有了这些属性，把他们总结到一起的时候，那就是你理解的大数据，就像当初有人和你说什么是CPU一个道理，从懵懂到理解，需要实践中的积累','HaoShu',1494772852),(7,'人力资源计划','/Public/Upload/2017-06-09/593a0e771121c.docx','phpMailer手册.docx',1,'人力资源的核查：是指核查人力资源的数量、质量、结构及分布状况。 □ 人力资源信息包括：个人自然情况、录用资料、教育资料、工资资料、工作执行评价、工作经历、服务与离职资料、工作态度、工作或职务的历史资料等。','人力资源的核查：是指核查人力资源的数量、质量、结构及分布状况。 □ 人力资源信息包括：个人自然情况、录用资料、教育资料、工资资料、工作执行评价、工作经历、服务与离职资料、工作态度、工作或职务的历史资料等。 □ 人力资源管理的五大要素：获取、整合、保持与激励、控制与调整、开发 □ 人力资源需求预测的方法有：直觉预测方法（定性预测）和数学预测方法（定量预测）。 □ 人力资源供给预测包括：1、内部拥有量预测2、外部人力资源供给量','admin',1496977015),(8,'人力资源经理岗位职责','/Public/Upload/2017-06-12/593e980e03454.docx','php2.docx',1,'人力资源经理岗位职责为：\r\n　　1、人力资源规划与行政后勤规划管理：\r\n　　2、部门内部管理与规范：\r\n　　3、招聘与配置管理：','人力资源经理岗位职责为：\r\n　　1、人力资源规划与行政后勤规划管理：\r\n　　2、部门内部管理与规范：\r\n　　3、招聘与配置管理：\r\n　　4、培训与开发管理：\r\n　　5、绩效考核管理：\r\n　　6、薪酬福利管理：\r\n　　7、人力资源日常事务的管理。\r\n　　8、企业文化建设和员工关系管理','haoyang',1497274382),(9,'微信小程序使用大全',NULL,NULL,0,'1月9日凌晨，万众期待的微信小程序正式上线了！这个被认为可以颠覆移动互联网应用生态的，到底长什么样子，拥有哪些功能？咫尺君用最快的速度为大家收集到小程序的最新情报，第一时间为大家揭开小程序的神秘面纱。','小程序的界面非常简洁，与一般的App区别不大。除了第一次进入时需要加载和弹出授权请求外，使用体验。在使用小程序的过程中，也可以随时点击左上角返回微信的界面。\r\n一个公众号可以绑五个小程序，但一个小程序只能被一个公众号绑定。你可以通过公众号查看并进入所绑定的小程序，反之，也可以通过小程序查看并进入所关联的公众号','admin',1497274615),(10,'PHP中框架',NULL,NULL,0,'Yii是一个基于组件的高性能的PHP的框架，用于开发大规模Web应用。Yii采用严格的OOP编写，并有着完善的库引用以及全面的教程。从 MVC，DAO/ActiveRecord，widgets，caching，等级式RBAC，Web服务，到主体化，I18N和L10N。','PHPDevShell是一个开源（GNU/LGPL）的快速应用开发框架，用于开发不含Javascript的纯PHP。它有一个完整的GUI管 理员后台界面。其主要目标在于开发插件一类的基于管理的应用，其中速度、安全、稳定性及弹性是最优先考虑的重点。其设计形成了一个简单的学习曲线，PHP 开发者无需学习复杂的新术语。PHPDevShell的到来满足了开发者们对于一个轻量级但是功能完善，可以无限制的进行配置的GUI的需求','vae',1497274786),(11,'运营管理','/Public/Upload/2017-06-12/593e9a2f3424c.docx','php2.docx',1,'运营管理的对象是运营过程和运营系统。运营过程是一个投入、转换、产出的过程，是一个劳动过程或价值增值的过程，它是运营的第一大对象，运营必须考虑如何对这样的生产运营活动进行计划、组织和控制。运营系统是指上述变换过程得以实现的手段。它的构成与变换过程中的物质转换过程和管理过程相对应，包括一个物质系统和一个管理系统。','企业运营管理要控制的主要目标是质量，成本，时间和柔性，它们是企业竞争力的根本源泉。因此，运营管理在企业经营中具有重要的作用。特别是近二三十年来，现代企业的生产经营规模不断扩大，产品本身的技术和知识密集程度不断提高，产品的生产和服务过程日趋复杂，市场需求日益多样化、多变化，世界范围内的竞争日益激烈，这些因素使运营管理本身也在不断发生变化。尤其是近十几年来，随着信息技术突飞猛进的发展，为运营增添了新的有力手段，也使运营学的研究进入了一个新阶段，使其内容更加丰富，范围更加扩大，体系更加完整','admin',1497274927);
/*!40000 ALTER TABLE `sp_knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_meeting`
--

DROP TABLE IF EXISTS `sp_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '会议主题',
  `content` text COMMENT '会议内容',
  `starttime` datetime DEFAULT NULL COMMENT '举行时间',
  `people` varchar(255) DEFAULT NULL COMMENT '参与人员',
  `filepath` varchar(255) DEFAULT NULL COMMENT '附件存储路径',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `hasfile` smallint(1) DEFAULT '0' COMMENT '是否存在附件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_meeting`
--

LOCK TABLES `sp_meeting` WRITE;
/*!40000 ALTER TABLE `sp_meeting` DISABLE KEYS */;
INSERT INTO `sp_meeting` VALUES (3,'财务部工作汇报','本次会议，财务部主要汇报了上个月的财务工作总结，并向上级领导进行了相应的汇报。','2017-05-17 14:30:00','huang,leitao,vaexm,dongjun','/Public/Upload/2017-05-19/591ee1a1baae2.txt','密码.txt',1),(4,'万盟公司一周例会','本次会议为公司一周的例会，主要安排这一周新的工作计划，并使各部门所有人员做好准备。','2017-05-22 09:30:00','admin,vaexm,Haoshu,Haoyang,xu','/Public/Upload/2017-05-19/591ee22d0a288.txt','密码.txt',1),(5,'234','项目名称没差距比较靠后能看见门口，','2017-05-19 15:00:00','vaexm,admin,HaoShu,xiaoyan','/Public/Upload/2017-05-19/591ee274d128c.txt','新建文本文档.txt',1),(6,'关于新的项目的讨论','本次会议主要是为了讨论新的项目进展的情况，以及后续相应的安排等。','2017-05-23 10:00:00','admin,vae,mei,,hong,John','/Public/Upload/2017-05-19/591ee2db7e9bc.docx','phpMailer手册.docx',1),(7,'新项目启动讨论','主要讨论公司即将启动的新的项目的细节。','2017-06-13 10:20:44','admin,vae,vaexm',NULL,NULL,0),(8,'关于&quot;e+&quot;优品推广活动','本次会议主要是为了讨论“e+”优品的推广方案以及之后详细的细节等内容，望参会人员准时参加！','2017-06-13 21:58:10','admin.vaexm.HaoShu,Haoyang,xiaolong',NULL,NULL,0);
/*!40000 ALTER TABLE `sp_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_user`
--

DROP TABLE IF EXISTS `sp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL,
  `nickname` varchar(40) DEFAULT NULL COMMENT '昵称',
  `truename` varchar(40) DEFAULT NULL COMMENT '真实姓名',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门编号',
  `sex` varchar(10) NOT NULL COMMENT '性别',
  `birthday` date NOT NULL COMMENT '出生日期',
  `tel` varchar(11) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `remark` varchar(255) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_user`
--

LOCK TABLES `sp_user` WRITE;
/*!40000 ALTER TABLE `sp_user` DISABLE KEYS */;
INSERT INTO `sp_user` VALUES (2,'vaexm','123456789','tu','汤泽群',1,'男','1988-05-27','13453646191','12345@wanmeng.com','',1494385567,NULL),(3,'vae','123456','jia','刘佳勇',2,'男','1990-04-19','18829342787','18829342787@wanmeng.com','',1494385645,NULL),(4,'xm','12345678','hao','尹峰',3,'女','1992-05-13','18635622869','12356@163.com','',1494385735,NULL),(5,'john','2345678','chen','陈昊 ',3,'男','1993-05-19','15678963456','asdgfg@qq.com','',1494385849,NULL),(6,'zenghua','123456','hua','曾花',4,'女','1994-05-11','13152764205','123fgn@qq.com','人事部总监',1494390033,NULL),(7,'ying','12345678','haoying','郝颖',4,'女','1993-05-26','18829342606','1148423590@qq.com','',1494390087,NULL),(8,'xiaoyan','123456789','xiaoyan','史晓燕',4,'女','1989-05-18','18829349188','123445@163.com','',1494390210,NULL),(9,'HaoShu','123456789','hal','徐浩',7,'男','1993-05-12','13245673456','Xuhaowanmeng@365.com','技术部总监',1494390371,NULL),(10,'haoyang','haoya g123','yang','栗浩洋',7,'男','1990-09-12','13467543452','123rthh@qq.com','',1494390439,NULL),(11,'xu','xuzhao123','zhao','徐钊',7,'男','1989-08-10','18956784543','198976@163.com','',1494390515,NULL),(12,'dongjun','dongjun123','jun','沈东军',7,'男','1991-02-12','15803563184','15803563184@163.com','',1494390660,NULL),(13,'mei','mei123456','xiangrong','梅向荣',8,'女','1983-02-15','15534562341','adfgnb@163.com','',1494390797,NULL),(14,'chunjiang','fuchunjiang','fu','付春江',9,'男','1984-03-15','18256765432','fu@wanmeng365.com','',1494390872,NULL),(15,'xiaolong','123456789','long','王小龙',9,'男','1992-10-22','18276548922','wxiaol@365.com','',1494390949,NULL),(16,'hong','weihong123','weihong','张维宏',5,'女','1990-04-26','13213169969','13213169969@qq.com','',1494391034,NULL),(17,'huang','haung123456','ming','黄基明',6,'男','1992-06-17','15234765462','15234765462@qq.com','',1494391128,NULL),(18,'leitao','leitao123','tao','雷涛',6,'男','1990-05-22','13567893421','13567893421@163.com','',1494391240,NULL),(19,'mao','maoxuan123','xuan','毛选',9,'男','1992-10-13','18234569934','18234569934@163.com','',1494391432,NULL),(20,'xiaomiao','5897279','miao','小苗',5,'女','1994-10-16','18829342788','18829342788@qq.com','',1494391499,NULL),(1,'admin','admin','tu','涂磊',1,'男','1995-05-21','18623560978','18829342787@163.com','',1495371019,NULL);
/*!40000 ALTER TABLE `sp_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-13 13:49:13
