/*
SQLyog Enterprise v12.08 (64 bit)
MySQL - 8.0.18 : Database - person_table
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`person_table` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `person_table`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `dep_id` int(11) NOT NULL,
  `dep_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`dep_id`,`dep_name`) values (1,'开发部'),(2,'运维部'),(3,'测试部');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dep_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dep` (`dep_id`),
  CONSTRAINT `fk_emp_dep` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`emp_id`,`emp_name`,`gender`,`email`,`dep_id`) values (1,'赵铁柱','男','sfaA@qq.com',3),(2,'undefined','女','Q5@qq.com',2),(3,'冯桂兰','女','223@sss.com',2),(25,'王中英','男','55252@@qq.com',1),(26,'吴牛逼','女','ssf2f22@@qq.com',1),(27,'邹铁柱','女','asf2rfsf@@qq.com',1),(28,'孙中兰','男','wqdq@@qq.com',1),(29,'undefined','男','dsss@qq.com',3),(30,'向中英','女','2fsafaf@@qq.com',1),(31,'冯杭生','男','QF25@@qq.com',1),(32,'孙铁柱','男','wqdq@@qq.com',1),(33,'冯桂兰','男','QF25@@qq.com',1),(34,'邹铁柱','女','asf2rfsf@@qq.com',1),(35,'王杭生','男','55252@@qq.com',1),(36,'王云峰','男','55252@@qq.com',1),(37,'胡桂兰','女','2s22f@@qq.com',1),(38,'郑中英','男','sssss@@qq.com',1),(39,'胡云峰','女','2s22f@@qq.com',1),(40,'孙云龙','男','wqdq@@qq.com',1),(41,'胡牛逼','女','2s22f@@qq.com',1),(42,'赵杭生','女','sfaA@@qq.com',1),(43,'孙钢','男','wqdq@@qq.com',1),(44,'吴牛逼','女','ssf2f22@@qq.com',1),(45,'赵东强','女','sfaA@@qq.com',1),(46,'邹杭生','女','asf2rfsf@@qq.com',1),(47,'向云龙','女','2fsafaf@@qq.com',1),(48,'吴云峰','女','ssf2f22@@qq.com',1),(49,'邹铁柱','女','asf2rfsf@@qq.com',1),(50,'邹杭生','女','asf2rfsf@@qq.com',1),(51,'孙云峰','男','wqdq@@qq.com',2),(52,'吴中兰','女','ssf2f22@@qq.com',2),(53,'吴云龙','女','ssf2f22@@qq.com',2),(54,'邹云龙','女','asf2rfsf@@qq.com',2),(55,'邹东强','女','asf2rfsf@@qq.com',2),(56,'胡桂兰','女','2s22f@@qq.com',2),(57,'王钢','男','55252@@qq.com',2),(58,'冯云龙','男','QF25@@qq.com',2),(59,'胡桂兰','女','2s22f@@qq.com',2),(60,'郑牛逼','男','sssss@@qq.com',2),(61,'郑中兰','男','sssss@@qq.com',2),(62,'王牛逼','男','55252@@qq.com',2),(63,'王中英','男','55252@@qq.com',2),(64,'郑杭生','男','sssss@@qq.com',2),(65,'郑杭生','男','sssss@@qq.com',2),(66,'孙牛逼','男','wqdq@@qq.com',2),(67,'向中英','女','2fsafaf@@qq.com',2),(68,'郑钢','男','sssss@@qq.com',2),(69,'钱中兰','女','SFAFAF@@qq.com',2),(70,'吴东强','女','ssf2f22@@qq.com',2),(71,'王云峰','男','55252@@qq.com',2),(72,'冯杭生','男','QF25@@qq.com',2),(73,'孙中英','男','wqdq@@qq.com',2),(74,'胡杭生','女','2s22f@@qq.com',2),(75,'向中英','女','2fsafaf@@qq.com',2),(76,'郑杭生','男','sssss@@qq.com',2),(77,'郑云龙','男','sssss@@qq.com',2),(78,'钱杭生','女','SFAFAF@@qq.com',2),(79,'王桂兰','男','55252@@qq.com',2),(80,'王中兰','男','55252@@qq.com',2),(81,'钱杭生','女','SFAFAF@@qq.com',2),(82,'赵中英','女','sfaA@@qq.com',2),(83,'向桂兰','女','2fsafaf@@qq.com',2),(84,'胡中英','女','2s22f@@qq.com',2),(85,'钱杭生','女','SFAFAF@@qq.com',2),(86,'郑云峰','男','sssss@@qq.com',2),(87,'邹杭生','女','asf2rfsf@@qq.com',2),(88,'胡中兰','女','2s22f@@qq.com',2),(89,'王云峰','男','55252@@qq.com',2),(90,'孙桂兰','男','wqdq@@qq.com',2),(91,'吴中英','女','ssf2f22@@qq.com',2),(92,'孙铁柱','男','wqdq@@qq.com',2),(93,'钱中英','女','SFAFAF@@qq.com',2),(94,'冯中兰','男','QF25@@qq.com',2),(95,'吴钢','女','ssf2f22@@qq.com',2),(96,'胡牛逼','女','2s22f@@qq.com',2),(97,'王牛逼','男','55252@@qq.com',2),(98,'吴东强','女','ssf2f22@@qq.com',2),(99,'钱云峰','女','SFAFAF@@qq.com',2),(100,'孙中兰','男','wqdq@@qq.com',2),(101,'周珍珍','女','SFAFAF@@qq.com',3),(102,'马娜娜','女','2fsafaf@@qq.com',3),(103,'李蕾蕾','女','sfaA@@qq.com',3),(104,'罗婉儿','女','asf2rfsf@@qq.com',3),(105,'李珍珍','女','sfaA@@qq.com',3),(106,'欧阳蕾蕾','女','ssf2f22@@qq.com',3),(107,'钟珍珍','男','55252@@qq.com',3),(108,'马美美','女','2fsafaf@@qq.com',3),(109,'上官美美','男','QF25@@qq.com',3),(110,'熊娜娜','男','wqdq@@qq.com',3),(111,'李娜娜','女','sfaA@@qq.com',3),(112,'熊蕾蕾','男','wqdq@@qq.com',3),(113,'周峰','女','SFAFAF@@qq.com',3),(114,'范蕾蕾','男','sssss@@qq.com',3),(115,'马珍珍','女','2fsafaf@@qq.com',3),(116,'陈露露','女','2s22f@@qq.com',3),(117,'陈露露','女','2s22f@@qq.com',3),(118,'李珍珍','女','sfaA@@qq.com',3),(119,'周美美','女','SFAFAF@@qq.com',3),(120,'马玄德','女','2fsafaf@@qq.com',3),(121,'范婉儿','男','sssss@@qq.com',3),(122,'欧阳冰冰','女','ssf2f22@@qq.com',3),(123,'周美美','女','SFAFAF@@qq.com',3),(124,'马美美','女','2fsafaf@@qq.com',3),(125,'熊婉儿','男','wqdq@@qq.com',3),(126,'马蕾蕾','女','2fsafaf@@qq.com',3),(127,'李露露','女','sfaA@@qq.com',3),(128,'马峰','女','2fsafaf@@qq.com',3),(129,'李娜娜','女','sfaA@@qq.com',3),(130,'马娜娜','女','2fsafaf@@qq.com',3),(131,'李峰','女','sfaA@@qq.com',3),(132,'李蕾蕾','女','sfaA@@qq.com',3),(133,'陈蕾蕾','女','2s22f@@qq.com',3),(134,'马冰冰','女','2fsafaf@@qq.com',3),(135,'上官娜娜','男','QF25@@qq.com',3),(136,'罗美美','女','asf2rfsf@@qq.com',3),(137,'周婉儿','女','SFAFAF@@qq.com',3),(138,'马峰','女','2fsafaf@@qq.com',3),(139,'欧阳娜娜','女','ssf2f22@@qq.com',3),(140,'熊冰冰','男','wqdq@@qq.com',3),(141,'马玄德','女','2fsafaf@@qq.com',3),(142,'欧阳露露','女','ssf2f22@@qq.com',3),(143,'上官婉儿','男','QF25@@qq.com',3),(144,'欧阳婉儿','女','ssf2f22@@qq.com',3),(145,'罗露露','女','asf2rfsf@@qq.com',3),(146,'陈蕾蕾','女','2s22f@@qq.com',3),(147,'欧阳蕾蕾','女','ssf2f22@@qq.com',3),(148,'陈露露','女','2s22f@@qq.com',3),(150,'钟珍珍','男','252@qq.com',1),(151,'胡春梅','女','ejj@qqdd',2),(152,'张良','男','sad@sdfsd',2),(153,'周亮','男','sad@sdddd',2),(154,'张康开','男','sss@ssd',2),(155,'刘德华','男','杀杀杀',2),(156,'丽萨','女','jsjdsj@dsdafk',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
