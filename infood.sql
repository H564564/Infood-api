-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: in-food
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `favorites_recipe`
--

DROP TABLE IF EXISTS `favorites_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites_recipe` (
  `userid` varchar(45) NOT NULL,
  `recipeid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `recipeid` (`recipeid`),
  CONSTRAINT `favorites_recipe_ibfk_1` FOREIGN KEY (`recipeid`) REFERENCES `recipe` (`recipeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites_recipe`
--

LOCK TABLES `favorites_recipe` WRITE;
/*!40000 ALTER TABLE `favorites_recipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `foodid` varchar(45) NOT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `wareid` varchar(45) DEFAULT NULL,
  `foodname` varchar(45) DEFAULT NULL,
  `foodamount` int DEFAULT NULL,
  `foodunit` varchar(45) DEFAULT NULL,
  `fooddata` varchar(45) DEFAULT NULL,
  `foodtime` datetime DEFAULT NULL,
  `buytime` datetime DEFAULT NULL,
  `foodfrom` varchar(45) DEFAULT NULL,
  `buyfrom` varchar(45) DEFAULT NULL,
  `food_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`foodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES ('1','1','w1','哈嘎灣水蜜桃 ',100,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','水果類'),('10','2','w1','哈嘎灣鮭魚',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','門市購買','哈嘎灣','豆蛋魚肉類'),('2','3','W','哈嘎灣甜柿 ',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','王家農產','水果類'),('3','4','W','哈嘎灣高麗菜',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','王家農產','蔬菜類'),('4','5','W','哈嘎灣大白菜',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','山裡游','蔬菜類'),('5','4','W','哈嘎灣地瓜',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','全殼雜糧類'),('6','5','W','哈嘎灣牛奶',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','乳品類'),('7','3','W','哈嘎灣山雞',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','摩天農產','豆蛋魚肉類'),('8','6','W','哈嘎灣豬肉',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','摩天農產','豆蛋魚肉類'),('9','2','W','哈嘎灣芋頭',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','全殼雜糧類');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `food_AFTER_INSERT` AFTER INSERT ON `food` FOR EACH ROW BEGIN
insert into food_inserttrack(foodid,userid,wareid,foodname,foodamount,foodunit,fooddata,foodtime,buytime,foodfrom,buyfrom,food_type,inserttime)values(new.foodid,new.userid,new.wareid,new.foodname,new.foodamount,new.foodunit,new.fooddata,new.foodtime,new.buytime,new.foodfrom,new.buyfrom,new.food_type,now()); 
insert into hotfood(foodname)values(new.foodname);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `food_BEFORE_DELETE` BEFORE DELETE ON `food` FOR EACH ROW BEGIN
insert into food_deletetrack(foodid,userid,wareid,foodname,foodamount,foodunit,fooddata,foodtime,buytime,foodfrom,buyfrom,food_type,deletetime)values(old.foodid,old.userid,old.wareid,old.foodname,old.foodamount,old.foodunit,old.fooddata,old.foodtime,old.buytime,old.foodfrom,old.food_type,old.buyfrom,now()); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `food_deletetrack`
--

DROP TABLE IF EXISTS `food_deletetrack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_deletetrack` (
  `foodid` varchar(45) NOT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `wareid` varchar(45) DEFAULT NULL,
  `foodname` varchar(45) DEFAULT NULL,
  `foodamount` int DEFAULT NULL,
  `foodunit` varchar(45) DEFAULT NULL,
  `fooddata` varchar(45) DEFAULT NULL,
  `foodtime` datetime DEFAULT NULL,
  `buytime` datetime DEFAULT NULL,
  `foodfrom` varchar(45) DEFAULT NULL,
  `buyfrom` varchar(45) DEFAULT NULL,
  `food_type` varchar(45) DEFAULT NULL,
  `deletetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_deletetrack`
--

LOCK TABLES `food_deletetrack` WRITE;
/*!40000 ALTER TABLE `food_deletetrack` DISABLE KEYS */;
INSERT INTO `food_deletetrack` VALUES ('1','1','w1','和牛',3,'kg','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','costco','全聯利民店',NULL,'2021-07-28 09:46:51'),('10','3','w3','牛奶',1,'瓶','好吃','2021-08-03 00:46:40','2021-07-26 00:46:40','網路','乳品類','全聯利民店','2021-10-27 09:55:52'),('11','3','w5','白飯',1,'碗','好吃','2021-09-02 00:46:40','2021-07-26 00:46:40','實體店面','全殼雜糧類','全聯中壢店','2021-10-27 09:55:52'),('12','3','w5','牛油',1,'塊','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','電話訂購','油脂堅果類','全聯中壢店','2021-10-27 09:55:52'),('13','4','w6','豬肉',1,'kg','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','傳真訂購','豆蛋魚肉類','全聯中壢店','2021-10-27 09:55:52'),('14','4','w6','牛肉',1,'kg','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','傳真訂購','豆蛋魚肉類','全聯中壢店','2021-10-27 09:55:52'),('15','5','w8','香蕉',1,'根','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','傳真訂購','水果類','全聯內壢店','2021-10-27 09:55:52'),('16','4','w9','水梨',1,'顆','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','傳真訂購','水果類','全聯內壢店','2021-10-27 09:55:52'),('17','5','w8','白菜',1,'把','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','電話訂購','蔬菜類','全聯內壢店','2021-10-27 09:55:52'),('18','5','w8','大陸妹',1,'把','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','電話訂購','蔬菜類','全連平鎮店','2021-10-27 09:55:52'),('19','4','w9','泡菜',1,'罐','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','電話訂購','蔬菜類','全連平鎮店','2021-10-27 09:55:52'),('2','1','w1','雞腿',3,'kg','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','網路','豆蛋魚肉類','全聯利民店','2021-10-27 09:55:52'),('20','3','w3','豬肉片',1,'包','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','網路','豆蛋魚肉類','全連平鎮店','2021-10-27 09:55:52'),('21','3','w3','豬肉片',1,'包','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','網路','豆蛋魚肉類','全聯內壢店','2021-10-27 09:55:52'),('3','1','w1','兔肉',3,'kg','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','網路','豆蛋魚肉類','全聯利民店','2021-10-27 09:55:52'),('4','1','w1','牛肉',3,'kg','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','網路','豆蛋魚肉類','全聯中壢店','2021-10-27 09:55:52'),('5','1','w1','牛肉',3,'kg','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','網路','豆蛋魚肉類','全聯中壢店','2021-10-27 09:55:52'),('6','1','w1','魚肉',3,'kg','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','實體店面','豆蛋魚肉類','全聯內壢店','2021-10-27 09:55:52'),('7','2','w2','高麗菜',1,'顆','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','實體店面','蔬菜類','全聯內壢店','2021-10-27 09:55:52'),('8','3','w3','牛奶',1,'瓶','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','實體店面','乳品類','全聯利民店','2021-10-27 09:55:52'),('9','3','w3','蘋果',93,'袋','好吃','2021-07-31 00:46:40','2021-07-26 00:46:40','實體店面','水果類','全聯利民店','2021-10-27 09:55:52'),('20','5','W','農產調味乳',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','乳品類','哈嘎灣','2021-10-27 16:19:01'),('21','6','W','哈嘎灣山豬肉',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','豆蛋魚肉類','哈嘎灣','2021-10-27 16:19:01'),('20','3','W','農產羊奶',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','乳品類','哈嘎灣','2021-10-28 20:23:05'),('21','5','W','農產調味乳',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','乳品類','哈嘎灣','2021-10-28 20:23:05'),('22','6','W','哈嘎灣山豬肉',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','豆蛋魚肉類','哈嘎灣','2021-10-28 20:23:05'),('20','3','W','農產羊奶',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','乳品類','哈嘎灣','2021-10-28 20:38:02'),('21','5','W','農產調味乳',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','乳品類','哈嘎灣','2021-10-28 20:38:02'),('22','6','W','哈嘎灣山豬肉',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','豆蛋魚肉類','哈嘎灣','2021-10-28 20:38:02'),('11','5','W','摩天芝麻',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','門市購買','油脂堅果類','摩天農產','2021-12-05 20:41:09'),('12','2','w1','哈嘎灣鹹豬肉 ',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','門市購買','豆蛋魚肉類','哈嘎灣','2021-12-05 20:41:09'),('13','1','w3','哈嘎灣芋頭 ',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','門市購買','全榖雜糧類','哈嘎灣','2021-12-05 20:41:09'),('14','1','w3','哈嘎灣甜柿',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','門市購買','水果類','哈嘎灣','2021-12-05 20:41:09'),('15','4','w3','哈嘎灣香腸',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','電商購買','豆蛋魚肉類','哈嘎灣','2021-12-05 20:41:09'),('16','4','W','山裡游白米',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','電商購買','全榖雜糧類','山裡游','2021-12-05 20:41:09'),('17','6','W','山裡游紅藜',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','電商購買','全榖雜糧類','山裡游','2021-12-05 20:41:09'),('18','5','W','哈嘎灣山菜',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','電商購買','蔬菜類','哈嘎灣','2021-12-05 20:41:09'),('19','1','w1','偏鄉牛奶',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','乳品類','哈嘎灣','2021-12-05 20:41:09'),('20','3','W','農產羊奶',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','乳品類','哈嘎灣','2021-12-05 20:41:09'),('21','5','W','農產調味乳',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','乳品類','哈嘎灣','2021-12-05 20:41:09'),('22','6','W','哈嘎灣山豬肉',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','豆蛋魚肉類','哈嘎灣','2021-12-05 20:41:09'),('F23','3','W','蘋果',989,'顆','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','無','哈嘎灣','2021-12-05 20:41:09');
/*!40000 ALTER TABLE `food_deletetrack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_detail`
--

DROP TABLE IF EXISTS `food_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_detail` (
  `foodid` varchar(45) NOT NULL,
  `foodname` varchar(45) DEFAULT 'null',
  `geners` varchar(45) DEFAULT 'null',
  PRIMARY KEY (`foodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_detail`
--

LOCK TABLES `food_detail` WRITE;
/*!40000 ALTER TABLE `food_detail` DISABLE KEYS */;
INSERT INTO `food_detail` VALUES ('1','哈嘎灣水蜜桃','水果類|哈嘎灣|主打'),('10','哈嘎灣鮭魚','豆蛋魚肉類|哈嘎灣|限量'),('2','哈嘎灣恬柿','水果類|哈嘎灣|特賣'),('3','哈嘎灣高麗菜','蔬菜類|哈嘎灣|主打'),('4','哈嘎灣大白菜','蔬菜類|哈嘎灣|限量'),('5','哈嘎灣地瓜','全榖雜糧類|哈嘎灣|特賣'),('6','哈嘎灣牛奶','乳品類|哈嘎灣|特賣'),('7','哈嘎灣山雞','豆蛋魚肉類|哈嘎灣|主打'),('8','哈嘎灣豬肉','豆蛋魚肉類|哈嘎灣|限量'),('9','哈嘎灣芋頭','全榖雜糧類|哈嘎灣|特賣');
/*!40000 ALTER TABLE `food_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_inserttrack`
--

DROP TABLE IF EXISTS `food_inserttrack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_inserttrack` (
  `key` int NOT NULL AUTO_INCREMENT,
  `foodid` varchar(45) NOT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `wareid` varchar(45) DEFAULT NULL,
  `foodname` varchar(45) DEFAULT NULL,
  `foodamount` int DEFAULT NULL,
  `foodunit` varchar(45) DEFAULT NULL,
  `fooddata` varchar(45) DEFAULT NULL,
  `foodtime` datetime DEFAULT NULL,
  `buytime` datetime DEFAULT NULL,
  `foodfrom` varchar(45) DEFAULT NULL,
  `buyfrom` varchar(45) DEFAULT NULL,
  `food_type` varchar(45) DEFAULT NULL,
  `inserttime` datetime DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_inserttrack`
--

LOCK TABLES `food_inserttrack` WRITE;
/*!40000 ALTER TABLE `food_inserttrack` DISABLE KEYS */;
INSERT INTO `food_inserttrack` VALUES (66,'1','1','W','哈嘎灣水蜜桃 ',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','水果類','2021-10-27 10:59:11'),(67,'2','3','W','有機新鮮桑椹 ',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','王家農產','水果類','2021-10-27 10:59:11'),(68,'3','5','W','老王有機檸檬',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','王家農產','水果類','2021-10-27 10:59:11'),(69,'4','2','W','山裡游空心菜',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','山裡游','蔬菜類','2021-10-27 10:59:11'),(70,'5','4','W','哈嘎灣蓮藕',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','蔬菜類','2021-10-27 10:59:11'),(71,'6','1','W','哈嘎灣土雞',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','豆蛋魚肉類','2021-10-27 10:59:11'),(72,'7','1','W','摩天花生',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','摩天農產','油脂堅果類','2021-10-27 10:59:11'),(73,'8','3','W','霍天酪梨',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','摩天農產','油脂堅果類','2021-10-27 10:59:11'),(74,'9','6','W','哈嘎灣高麗菜',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','蔬菜類','2021-10-27 10:59:11'),(75,'10','3','W','哈嘎灣雞蛋',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','門市購買','哈嘎灣','豆蛋魚肉類','2021-10-27 10:59:11'),(76,'11','5','W','摩天芝麻',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','門市購買','摩天農產','油脂堅果類','2021-10-27 10:59:11'),(77,'12','2','W','哈嘎灣鹹豬肉 ',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','門市購買','哈嘎灣','豆蛋魚肉類','2021-10-27 10:59:11'),(78,'13','1','W','哈嘎灣芋頭 ',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','門市購買','哈嘎灣','全殼雜糧類','2021-10-27 10:59:11'),(79,'14','3','W','哈嘎灣甜柿',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','門市購買','哈嘎灣','油脂堅果類','2021-10-27 10:59:11'),(80,'15','4','W','哈嘎灣香腸',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','電商購買','哈嘎灣','豆蛋魚肉類','2021-10-27 10:59:11'),(81,'16','4','W','山裡游白米',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','電商購買','山裡游','全殼雜糧類','2021-10-27 10:59:11'),(82,'17','6','W','山裡游紅藜',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','電商購買','山裡游','全殼雜糧類','2021-10-27 10:59:11'),(83,'18','5','W','哈嘎灣山菜',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','電商購買','哈嘎灣','蔬菜類','2021-10-27 10:59:11'),(84,'19','1','W','農產牛奶',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','乳品類','2021-10-27 12:11:55'),(85,'19','1',NULL,'農產牛奶',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','乳品類',NULL),(86,'19','1',NULL,'農產羊奶',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','乳品類',NULL),(87,'19','1',NULL,'農產羊奶',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','乳品類',NULL),(88,'1','2',NULL,'哈嘎灣水蜜桃 ',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','水果類',NULL),(89,'1','2',NULL,'哈嘎灣水蜜桃 ',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','水果類',NULL),(90,'2','2',NULL,'有機新鮮桑椹 ',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','王家農產','水果類',NULL),(91,'2','3',NULL,'有機新鮮桑椹 ',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','王家農產','水果類',NULL),(92,'3','4',NULL,'老王有機檸檬',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','王家農產','水果類',NULL),(93,'3','4',NULL,'老王有機檸檬',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','王家農產','水果類',NULL),(94,'4','4',NULL,'山裡游空心菜',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','山裡游','蔬菜類',NULL),(95,'4','5',NULL,'山裡游空心菜',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','山裡游','蔬菜類',NULL),(96,'4','5',NULL,'山裡游空心菜',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','山裡游','蔬菜類',NULL),(97,'5','5',NULL,'哈嘎灣蓮藕',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','蔬菜類',NULL),(98,'5','5',NULL,'哈嘎灣蓮藕',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','蔬菜類',NULL),(99,'5','5',NULL,'哈嘎灣蓮藕',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','蔬菜類',NULL),(100,'6','3',NULL,'哈嘎灣土雞',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','豆蛋魚肉類',NULL),(101,'6','2',NULL,'哈嘎灣土雞',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','豆蛋魚肉類',NULL),(102,'6','2',NULL,'哈嘎灣土雞',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','豆蛋魚肉類',NULL),(103,'7','1',NULL,'摩天花生',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','摩天農產','油脂堅果類',NULL),(104,'7','1',NULL,'摩天花生',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','摩天農產','油脂堅果類',NULL),(105,'8','1',NULL,'霍天酪梨',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','摩天農產','油脂堅果類',NULL),(106,'8','2',NULL,'霍天酪梨',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','摩天農產','油脂堅果類',NULL),(107,'8','3',NULL,'霍天酪梨',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','摩天農產','油脂堅果類',NULL),(108,'9','4',NULL,'哈嘎灣高麗菜',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','蔬菜類',NULL),(109,'9','4',NULL,'哈嘎灣高麗菜',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'網頁購買','哈嘎灣','蔬菜類',NULL),(110,'10','5',NULL,'哈嘎灣雞蛋',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'門市購買','哈嘎灣','豆蛋魚肉類',NULL),(111,'10','5',NULL,'哈嘎灣雞蛋',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'門市購買','哈嘎灣','豆蛋魚肉類',NULL),(112,'11','6',NULL,'摩天芝麻',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'門市購買','摩天農產','油脂堅果類',NULL),(113,'11','6',NULL,'摩天芝麻',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'門市購買','摩天農產','油脂堅果類',NULL),(114,'12','4',NULL,'哈嘎灣鹹豬肉 ',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'門市購買','哈嘎灣','豆蛋魚肉類',NULL),(115,'12','1',NULL,'哈嘎灣鹹豬肉 ',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'門市購買','哈嘎灣','豆蛋魚肉類',NULL),(116,'13','1',NULL,'哈嘎灣芋頭 ',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'門市購買','哈嘎灣','全殼雜糧類',NULL),(117,'13','2',NULL,'哈嘎灣芋頭 ',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'門市購買','哈嘎灣','全殼雜糧類',NULL),(118,'14','2',NULL,'哈嘎灣甜柿',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'門市購買','哈嘎灣','水果類',NULL),(119,'14','1',NULL,'哈嘎灣甜柿',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'門市購買','哈嘎灣','水果類',NULL),(120,'15','4',NULL,'哈嘎灣香腸',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'電商購買','哈嘎灣','豆蛋魚肉類',NULL),(121,'15','3',NULL,'哈嘎灣香腸',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'電商購買','哈嘎灣','豆蛋魚肉類',NULL),(122,'16','1',NULL,'山裡游白米',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'電商購買','山裡游','全殼雜糧類',NULL),(123,'16','1',NULL,'山裡游白米',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'電商購買','山裡游','全殼雜糧類',NULL),(124,'17','2',NULL,'山裡游紅藜',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'電商購買','山裡游','全殼雜糧類',NULL),(125,'17','1',NULL,'山裡游紅藜',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'電商購買','山裡游','全殼雜糧類',NULL),(126,'17','1',NULL,'山裡游紅藜',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'電商購買','山裡游','全殼雜糧類',NULL),(127,'18','1',NULL,'哈嘎灣山菜',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'電商購買','哈嘎灣','蔬菜類',NULL),(128,'18','1',NULL,'哈嘎灣山菜',NULL,NULL,NULL,'2021-07-31 00:46:40',NULL,'電商購買','哈嘎灣','蔬菜類',NULL),(137,'20','3','W','農產羊奶',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','乳品類','2021-10-28 20:40:51'),(138,'21','5','W','農產調味乳',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','乳品類','2021-10-28 20:40:51'),(139,'22','6','W','哈嘎灣山豬肉',1,'量','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','豆蛋魚肉類','2021-10-28 20:40:51'),(140,'23','1','W','蘋果',999,'顆','測試','2021-07-31 00:46:40','2021-07-26 00:46:40','網頁購買','哈嘎灣','無','2021-11-04 00:39:40');
/*!40000 ALTER TABLE `food_inserttrack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotfood`
--

DROP TABLE IF EXISTS `hotfood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotfood` (
  `foodname` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotfood`
--

LOCK TABLES `hotfood` WRITE;
/*!40000 ALTER TABLE `hotfood` DISABLE KEYS */;
INSERT INTO `hotfood` VALUES ('牛肉'),('牛肉'),('魚肉'),('高麗菜'),('牛奶'),('蘋果'),('牛奶'),('白飯'),('牛油'),('豬肉'),('牛肉'),('香蕉'),('水梨'),('白菜'),('大陸妹'),('泡菜'),('豬肉片'),('豬肉片'),('哈嘎灣水蜜桃 '),('有機新鮮桑椹 '),('老王有機檸檬'),('山裡游空心菜'),('哈嘎灣蓮藕'),('哈嘎灣土雞'),('摩天花生'),('霍天酪梨'),('哈嘎灣高麗菜'),('哈嘎灣雞蛋'),('摩天芝麻'),('哈嘎灣鹹豬肉 '),('哈嘎灣芋頭 '),('哈嘎灣甜柿'),('哈嘎灣香腸'),('山裡游白米'),('山裡游紅藜'),('哈嘎灣山菜'),('牛奶'),('農產調味乳'),('哈嘎灣山豬肉'),('農產羊奶'),('農產調味乳'),('哈嘎灣山豬肉'),('農產羊奶'),('農產調味乳'),('哈嘎灣山豬肉'),('農產羊奶'),('農產調味乳'),('哈嘎灣山豬肉'),('蘋果');
/*!40000 ALTER TABLE `hotfood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_list` (
  `number` int NOT NULL AUTO_INCREMENT,
  `list_id` int DEFAULT NULL,
  `list_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` VALUES (1,1,'哈嘎灣水蜜桃'),(2,1,'有機新鮮桑椹 '),(3,1,'老王有機檸檬'),(4,1,'山裡游空心菜'),(5,1,'哈嘎灣蓮藕'),(6,2,'有機新鮮桑椹'),(7,2,'哈嘎灣土雞'),(8,2,'摩天花生'),(9,2,'霍天酪梨'),(10,2,'哈嘎灣高麗菜'),(11,2,'哈嘎灣雞蛋'),(12,2,'摩天芝麻'),(13,2,'哈嘎灣鹹豬肉'),(14,3,'有機新鮮桑椹'),(15,4,'哈嘎灣水蜜桃'),(16,4,'摩天花生'),(17,4,'哈嘎灣芋頭'),(18,4,'哈嘎灣甜柿'),(19,4,'哈嘎灣香腸'),(20,5,'哈嘎灣土雞'),(21,5,'哈嘎灣水蜜桃'),(22,5,'摩天花生'),(23,5,'有機新鮮桑椹'),(24,5,'山裡游白米'),(25,5,'摩天芝麻'),(26,5,'哈嘎灣蓮藕'),(27,6,'哈嘎灣土雞'),(28,6,'有機新鮮桑椹'),(29,6,'摩天花生'),(30,6,'山裡游紅藜'),(31,6,'山裡游白米'),(32,6,'哈嘎灣鹹豬肉'),(33,6,'摩天芝麻'),(34,6,'哈嘎灣山菜');
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `recipeid` varchar(45) NOT NULL,
  `recipename` varchar(45) DEFAULT NULL,
  `recipeintroduction` varchar(45) DEFAULT NULL,
  `recipetime` varchar(45) DEFAULT NULL,
  `recipenumber` int DEFAULT NULL,
  `recipeunit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`recipeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_data`
--

DROP TABLE IF EXISTS `recipe_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_data` (
  `recipeid` varchar(45) NOT NULL,
  `foodid` varchar(45) DEFAULT NULL,
  `foodname` int DEFAULT NULL,
  PRIMARY KEY (`recipeid`),
  CONSTRAINT `recipe_data_ibfk_1` FOREIGN KEY (`recipeid`) REFERENCES `recipe` (`recipeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_data`
--

LOCK TABLES `recipe_data` WRITE;
/*!40000 ALTER TABLE `recipe_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_step`
--

DROP TABLE IF EXISTS `recipe_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_step` (
  `recipeid` varchar(45) NOT NULL,
  `stepnumber` varchar(45) DEFAULT NULL,
  `stepdata` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`recipeid`),
  CONSTRAINT `recipe_step_ibfk_1` FOREIGN KEY (`recipeid`) REFERENCES `recipe` (`recipeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_step`
--

LOCK TABLES `recipe_step` WRITE;
/*!40000 ALTER TABLE `recipe_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_unit`
--

DROP TABLE IF EXISTS `recipe_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_unit` (
  `recipeid` varchar(45) NOT NULL,
  `unitname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`recipeid`),
  CONSTRAINT `recipe_unit_ibfk_1` FOREIGN KEY (`recipeid`) REFERENCES `recipe` (`recipeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_unit`
--

LOCK TABLES `recipe_unit` WRITE;
/*!40000 ALTER TABLE `recipe_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendation`
--

DROP TABLE IF EXISTS `recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendation` (
  `np` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) DEFAULT NULL,
  `foodid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`np`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation`
--

LOCK TABLES `recommendation` WRITE;
/*!40000 ALTER TABLE `recommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_account`
--

DROP TABLE IF EXISTS `share_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_account` (
  `shareid` varchar(45) NOT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `sharename` varchar(45) DEFAULT NULL,
  `sharephoto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `userid` (`userid`),
  CONSTRAINT `share_account_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_account`
--

LOCK TABLES `share_account` WRITE;
/*!40000 ALTER TABLE `share_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` varchar(45) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `useraccount` varchar(45) DEFAULT NULL,
  `userpassword` varchar(45) DEFAULT NULL,
  `userborn` date DEFAULT NULL,
  `userjob` varchar(45) DEFAULT NULL,
  `usershare` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','JUSTIN','justin88','justin1999','1999-09-14','學生',1),('2','WILSON','wilson66','wilson2000','2000-06-16','學生',1),('3','AMANDA','amanda23','amanda22','1972-02-23','家庭主婦',1),('4','JACK','jack19','jack29','1983-02-27','上班族',0),('5','CURRY','curry31','curry30','1993-02-07','其他',0),('6','BIEBER','bieber11','biber11','1969-06-09','上班族',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ware`
--

DROP TABLE IF EXISTS `ware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ware` (
  `wareid` varchar(45) NOT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `warename` varchar(45) DEFAULT NULL,
  `lastSaw` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`wareid`),
  KEY `userid` (`userid`),
  CONSTRAINT `ware_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ware`
--

LOCK TABLES `ware` WRITE;
/*!40000 ALTER TABLE `ware` DISABLE KEYS */;
INSERT INTO `ware` VALUES ('W','1','待分類','10/7 16:50','box1'),('w1','1','肉類','10/7 16:50','box2'),('w2','2','蔬菜','10/7 16:50','box1'),('w3','1','乳製品','10/7 16:50','box1'),('w4','2','肉類','10/7 16:50','box1'),('w5','3','上層','10/7 16:50','box1'),('w6','4','冷藏','10/7 16:50','box1'),('w7','5','待分類','10/7 16:50','box1'),('w8','3','下層','10/7 16:50','box1'),('w9','4','冷凍','10/7 16:50','box1');
/*!40000 ALTER TABLE `ware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week_receipe`
--

DROP TABLE IF EXISTS `week_receipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `week_receipe` (
  `userid` varchar(45) NOT NULL,
  `recipeid` varchar(45) NOT NULL,
  `timeid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`,`recipeid`),
  KEY `recipeid` (`recipeid`),
  CONSTRAINT `week_receipe_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `week_receipe_ibfk_2` FOREIGN KEY (`recipeid`) REFERENCES `recipe` (`recipeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_receipe`
--

LOCK TABLES `week_receipe` WRITE;
/*!40000 ALTER TABLE `week_receipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `week_receipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'in-food'
--

--
-- Dumping routines for database 'in-food'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 21:48:42
