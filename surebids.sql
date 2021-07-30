-- MySQL dump 10.13  Distrib 8.0.21, for osx10.15 (x86_64)
--
-- Host: remotemysql.com    Database: SvIV2UBr3Z
-- ------------------------------------------------------
-- Server version	8.0.13-4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auto_close` tinyint(1) NOT NULL DEFAULT '0',
  `auto_start` tinyint(1) NOT NULL DEFAULT '0',
  `bid_fee` decimal(50,2) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL,
  `log_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PENDING',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1w78eyenem7jaulsfmrhmt1mk` (`product`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,0,1,20.00,'2021-04-21 07:59:05','2021-04-29 17:00:00','b12e0ccb-ec1a-4e2e-bd74-67b714c9732f','PHONE','2021-04-12 00:00:00','CLOSED','2021-05-05 13:45:47',1),(2,0,1,20.00,'2021-04-28 09:19:55','2021-06-28 00:00:00','5655098b-5d36-4df2-95af-aa8a270aa6d9','HOUSE','2021-04-27 00:00:00','ACTIVE','2021-04-28 09:19:55',2),(3,0,1,20.00,'2021-04-28 09:20:44','2021-06-28 00:00:00','6839ce44-8ae3-4b93-8500-dfcfa91d9e64','FRIDGE','2021-04-28 00:00:00','ACTIVE','2021-04-28 09:20:44',3),(4,0,1,20.00,'2021-04-28 13:30:44','2021-05-31 00:00:00','f270cb94-3ec7-4e0b-a4b8-964b272d3aca','HILUX','2021-04-27 00:00:00','ACTIVE','2021-04-28 13:30:44',6),(5,0,1,20.00,'2021-04-28 13:31:22','2021-05-08 00:00:00','0eb0ffda-2e27-45c5-b421-aacb7a15c8d4','TV','2021-04-12 00:00:00','ACTIVE','2021-04-29 09:03:10',5),(6,0,1,30.00,'2021-04-28 13:31:44','2021-05-31 00:00:00','ff1b1332-62e9-476f-abb9-4c5e50a8f9a3','BIKE','2021-04-30 00:00:00','ACTIVE','2021-04-28 13:31:44',4),(7,0,1,20.00,'2021-04-29 09:26:10','2021-04-29 21:00:00','94466988-1f8a-4954-bc33-8d9e7b0659c3','PS','2021-04-28 01:25:00','ACTIVE','2021-04-29 09:26:10',7);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_bid`
--

DROP TABLE IF EXISTS `customer_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_bid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bid_amount` decimal(50,2) NOT NULL,
  `bid_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `auction` bigint(20) NOT NULL,
  `customer_profile` bigint(20) NOT NULL,
  `customer_transaction` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bag2rhogo5nm9anu9h449m155` (`customer_transaction`),
  UNIQUE KEY `UK_cjx1hv4ftdxbv8pjye42j0vuc` (`bid_number`),
  KEY `FK3taqj7uidkpmdp9uduurtj5si` (`auction`),
  KEY `FKkjiqspoinlt66uuopoqw8hhmw` (`customer_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_bid`
--

LOCK TABLES `customer_bid` WRITE;
/*!40000 ALTER TABLE `customer_bid` DISABLE KEYS */;
INSERT INTO `customer_bid` VALUES (1,100.00,'DC11OJ11BQ','2021-04-29 17:46:45','41ebe8ba-8b84-4463-97a1-1f4cd9c4414e','CLOSED','2021-04-29 17:49:41',1,1,2),(2,100.00,'DC11OFC5MZ','2021-04-29 17:49:37','d4a2169f-2437-4361-a7e5-58fef4ac5efa','CLOSED','2021-04-29 17:49:41',1,2,4),(3,100.00,'DB12PPNQYF','2021-04-30 01:15:08','5c9eb31f-0128-4018-8382-889855a5437e','CLOSED','2021-05-05 13:11:17',1,3,8),(4,586.00,'DB1LYVJHCW','2021-04-30 01:15:40','b9bea185-7f3b-40c4-8d8d-a62d63dcc313','WON','2021-05-05 13:45:46',1,3,10);
/*!40000 ALTER TABLE `customer_bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_profile`
--

DROP TABLE IF EXISTS `customer_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `credit` decimal(50,2) NOT NULL,
  `debit` decimal(50,2) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msisdn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8u0py2sh47svyp78fnnx6bsur` (`msisdn`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_profile`
--

LOCK TABLES `customer_profile` WRITE;
/*!40000 ALTER TABLE `customer_profile` DISABLE KEYS */;
INSERT INTO `customer_profile` VALUES (1,'2021-04-29 17:46:14',20.00,20.00,'PHELIX','OCHIENG','ee6c0620-2de8-4b38-ac36-3a33314cdda6',NULL,'254718059057','2021-04-29 14:46:37'),(2,'2021-04-29 17:48:59',60.00,20.00,'IAN','OUMO','944b29c4-6f6a-4f8f-9943-28b5b2fcc95f',NULL,'254708436487','2021-04-29 15:01:19'),(3,'2021-04-30 01:14:40',60.00,40.00,'JOHN','DOE','ab6fc432-ac1c-4426-9d95-2fb460ed793c','J.','254718058057','2021-04-29 22:15:33');
/*!40000 ALTER TABLE `customer_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_transaction`
--

DROP TABLE IF EXISTS `customer_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `subtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_amount` decimal(50,2) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_profile` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7l3y3qe2yqr2wl066onakym5r` (`transaction_id`),
  KEY `FKd5nydmky7pdqdvreuqna0g949` (`customer_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_transaction`
--

LOCK TABLES `customer_transaction` WRITE;
/*!40000 ALTER TABLE `customer_transaction` DISABLE KEYS */;
INSERT INTO `customer_transaction` VALUES (1,'2021-04-29 17:46:26','817dfc5f-3533-42be-a2e2-4c17ec6b445c','DEPOSIT',20.00,'OKG21HEPNJ','PHONE 100','CREDIT',1),(2,'2021-04-29 17:46:40','2d30febf-0b5b-4221-889b-32483170f640','BID',20.00,'DC11OJ11BQ','PHONE 100','DEBIT',1),(3,'2021-04-29 17:49:12','6fec26cd-6a53-4dbc-a995-7932d010d1e2','DEPOSIT',20.00,'OKG21HEPNL','PHONE 100','CREDIT',2),(4,'2021-04-29 17:49:31','d0fa3306-2970-4341-84a0-79f4b571837a','BID',20.00,'DC11OFC5MZ','PHONE 100','DEBIT',2),(5,'2021-04-29 17:57:54','205e81b6-b011-4392-9322-437fdfc8ca9e','DEPOSIT',20.00,'OKG21HEPNQ','PHONE 100','CREDIT',2),(6,'2021-04-29 18:01:21','2d2a6db5-5596-4958-9495-3c61d7a49937','DEPOSIT',20.00,'OKG21HEPRP','PHONE 100','CREDIT',2),(7,'2021-04-30 01:14:51','b3f021ff-473a-480c-9552-3479814161f2','DEPOSIT',30.00,'OKG21HEPD1','PHONE 100','CREDIT',3),(8,'2021-04-30 01:15:04','616e1ec5-a346-4d58-bbe8-edb6b2c5d036','BID',20.00,'DB12PPNQYF','PHONE 100','DEBIT',3),(9,'2021-04-30 01:15:21','d21d41d4-20b7-4be6-b9df-1923190eccca','DEPOSIT',30.00,'OKG21HEPD7','PHONE 586','CREDIT',3),(10,'2021-04-30 01:15:36','04c94861-04d5-4d91-a8e0-570bd4424148','BID',20.00,'DB1LYVJHCW','PHONE 586','DEBIT',3);
/*!40000 ALTER TABLE `customer_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_payment`
--

DROP TABLE IF EXISTS `log_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `is_processed` tinyint(1) DEFAULT '0',
  `transaction_amount` decimal(19,2) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_time` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_profile` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mh1enc9vkfhcvabcv4qkb709t` (`transaction_id`),
  KEY `FKkkct6be0hdtcs95nnp9xs2h5q` (`customer_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_payment`
--

LOCK TABLES `log_payment` WRITE;
/*!40000 ALTER TABLE `log_payment` DISABLE KEYS */;
INSERT INTO `log_payment` VALUES (1,'2021-04-29 17:46:19','ba851cfc-9ecd-4460-aded-bfae1b45bfc2',1,20.00,'OKG21HEPNJ','PHONE 100','2020-11-16 12:55:40','2021-04-29 17:46:28',1),(2,'2021-04-29 17:49:04','3295a4f0-0ab8-4fa9-a93a-fdaaf1ad1d5e',1,20.00,'OKG21HEPNL','PHONE 100','2020-11-16 12:55:40','2021-04-29 17:49:15',2),(3,'2021-04-29 17:57:46','1c734738-a9cc-47d2-846b-c271d5a93971',1,20.00,'OKG21HEPNQ','PHONE 100','2020-11-16 12:55:40','2021-04-29 17:57:57',2),(4,'2021-04-29 18:01:14','963742f9-a339-4ef4-8dee-6c07ea9b400b',1,20.00,'OKG21HEPRP','PHONE 100','2020-11-16 12:55:40','2021-04-29 18:01:24',2),(5,'2021-04-30 01:14:44','e7fcb9cd-a626-478f-9fb0-65bfc3d3840f',1,30.00,'OKG21HEPD1','PHONE 100','2020-11-16 12:55:40','2021-04-30 01:14:52',3),(6,'2021-04-30 01:15:14','c9a3ab4d-24fc-46c9-b26b-75bedae9b286',1,30.00,'OKG21HEPD7','PHONE 586','2020-11-16 12:55:40','2021-04-30 01:15:25',3);
/*!40000 ALTER TABLE `log_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `images` text COLLATE utf8_unicode_ci NOT NULL,
  `log_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `retail_price` decimal(50,2) NOT NULL,
  `slag` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2021-04-20 15:04:39','Bacon ipsum dolor amet picanha burgdoggen capicola bresaola, turducken ham hock short loin spare ribs swine tenderloin pork chicken doner pork chop. Ham ground round pork belly,','[\"1618931079.jpg\",\"1618931079.jpg\"]','b4973dd5-22e8-4ad5-a6a2-02415fe46926','Samsung Galaxy S11',200000.00,'samsung-galaxy-s11','ACTIVE','2021-05-12 14:08:26'),(2,'2021-04-28 09:18:43','Bacon ipsum dolor amet pork belly kevin pork chop sirloin. Meatloaf ribeye shoulder, beef fatback meatball swine corned beef pancetta landjaeger. Brisket strip steak filet mignon frankfurter sausage flank. Turkey porchetta prosciutto short loin. Ham pancetta cow t-bone jerky kevin. Sausage leberkas turkey salami, pig flank jowl tri-tip corned beef.','[\"3649_1619601523.jpg\"]','c5bea08b-1cae-401e-a6f1-04f73c3b29d1','Test Appartment',2000000.00,'test-appartment','ACTIVE','2021-04-28 09:18:52'),(3,'2021-04-28 09:19:16','Bacon ipsum dolor amet pork belly kevin pork chop sirloin. Meatloaf ribeye shoulder, beef fatback meatball swine corned beef pancetta landjaeger. Brisket strip steak filet mignon frankfurter sausage flank. Turkey porchetta prosciutto short loin. Ham pancetta cow t-bone jerky kevin. Sausage leberkas turkey salami, pig flank jowl tri-tip corned beef.','[\"6919_1619601556.jpg\"]','f0f9e886-9735-4880-8f54-d42f6cd6f4e2','Test Fridge',45000.00,'test-fridge','ACTIVE','2021-04-28 09:19:23'),(4,'2021-04-28 13:28:07','Bacon ipsum dolor amet buffalo tongue pork loin boudin. Salami swine chuck tri-tip. Meatloaf beef burgdoggen short loin ground round flank kevin tongue. Short ribs pork ribeye, prosciutto meatball sirloin ground round pork chop shank jowl andouille pig chislic. Pork belly landjaeger tongue doner ham hock capicola chislic beef ribs.\r\n\r\n','[\"1979_1619616487.jpg\"]','bcb0c640-1e83-4631-80dc-470e56d876f3','Motorbike',100000.00,'motorbike','ACTIVE','2021-04-28 13:28:10'),(5,'2021-04-28 13:29:19','Bacon ipsum dolor amet buffalo tongue pork loin boudin. Salami swine chuck tri-tip. Meatloaf beef burgdoggen short loin ground round flank kevin tongue. Short ribs pork ribeye, prosciutto meatball sirloin ground round pork chop shank jowl andouille pig chislic. Pork belly landjaeger tongue doner ham hock capicola chislic beef ribs.\r\n\r\n','[\"2937_1619616559.jpg\"]','04852f93-20b2-4db0-b7db-0f9e0d72fc2e','Television Set',20000.00,'television-set','ACTIVE','2021-04-28 13:29:21'),(6,'2021-04-28 13:30:20','Bacon ipsum dolor amet buffalo tongue pork loin boudin. Salami swine chuck tri-tip. Meatloaf beef burgdoggen short loin ground round flank kevin tongue. Short ribs pork ribeye, prosciutto meatball sirloin ground round pork chop shank jowl andouille pig chislic. Pork belly landjaeger tongue doner ham hock capicola chislic beef ribs.\r\n\r\n','[\"6405_1619616620.jpg\"]','0df1aa44-f54f-4f59-892c-15abb960026a','Toyota Hilux',20000.00,'toyota-hilux','ACTIVE','2021-04-28 13:30:23'),(7,'2021-04-29 09:25:24','Bacon ipsum dolor amet bresaola strip steak pork loin alcatra. Picanha swine pig corned beef turkey. Leberkas chuck beef sausage jowl. Chuck brisket filet mignon meatloaf. Spare ribs tongue salami pancetta pastrami, meatloaf leberkas doner turducken swine venison pork loin corned beef kevin. Alcatra swine jerky venison, ribeye t-bone biltong cow ham hock landjaeger drumstick bresaola.','[\"1310_1619688324.png\"]','58da0924-e1ee-4fbf-a787-cb548e949e06','PS 5',55000.00,'ps-5','ACTIVE','2021-04-29 09:25:26');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'2021-04-21 08:14:45','4bd3e798-eaae-4368-8409-518b1023e22e','Administrator','ACTIVE','2021-04-21 08:14:45'),(2,'2021-04-21 08:17:34','4bd3e798-eaae-4368-8409-518b1023e22e','Administrator','ACTIVE','2021-04-21 08:17:34');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `permission` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcdu069ajq6b1vc22coycmn4eg` (`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_outbox`
--

DROP TABLE IF EXISTS `sms_outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_outbox` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `msisdn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PENDING',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_outbox`
--

LOCK TABLES `sms_outbox` WRITE;
/*!40000 ALTER TABLE `sms_outbox` DISABLE KEYS */;
INSERT INTO `sms_outbox` VALUES (1,'2021-04-29 17:46:17','3e98f3a8-cd9b-467d-a050-b1efbe50df02','Welcome to SureBids, Phelix! Place your bids now, and try and find the lowest unique amount. Customer service: 0718058057','254718059057','PENDING','2021-04-29 17:46:17'),(2,'2021-04-29 17:46:47','610572ef-59ea-49b7-81f9-9a226bbd3b0a','PHELIX, your bid of KES 100 on Samsung Galaxy S11(ends 29/04/21 17:00) has been placed. Your bid is currently unique. Bid ID: DC11OJ11BQ','254718059057','PENDING','2021-04-29 17:46:47'),(3,'2021-04-29 17:49:02','e670dadf-ebb4-4575-8830-8bb0af790e9e','Welcome to SureBids, Ian! Place your bids now, and try and find the lowest unique amount. Customer service: 0718058057','254708436487','PENDING','2021-04-29 17:49:02'),(4,'2021-04-29 17:49:44','889e1ade-2b07-4c3b-8c81-7ad416dfe98c','Pole PHELIX, IAN has just bid KES 100 on Samsung Galaxy S11, so your bid is no longer unique. Bid again and find a unique amount! Bid ID: DC11OJ11BQ','254718059057','PENDING','2021-04-29 17:49:44'),(5,'2021-04-29 17:49:46','c4c3e97b-8071-4e9c-86c4-71511f4b25a5','Pole IAN, your bid of KES 100 on Samsung Galaxy S11(ends 29/04/21 17:00) is not unique. PHELIX has already bid that amount. Try again. Bid ID: DC11OFC5MZ','254708436487','PENDING','2021-04-29 14:54:44'),(6,'2021-04-29 17:58:08','434defda-c294-47cf-8bf2-a6dae88c3468','Pole IAN, your bid of KES 100 on Samsung Galaxy S11(ends BID_END_DATE) is not unique. WINNER_NAME has already bid that amount. Try again. Bid ID: BID_NUMBER','254708436487','PENDING','2021-04-29 17:58:08'),(7,'2021-04-29 18:01:36','238ea2ff-20ec-4394-9ee6-8012525f353b','IAN, you have already placed a bid for KES 100 on Samsung Galaxy S11. Please bid a different amount','254708436487','PENDING','2021-04-29 18:01:36'),(8,'2021-04-30 01:14:42','4063b925-3266-41e8-8bac-25893ccf4272','Welcome to SureBids, JOHN! Place your bids now, and try and find the lowest unique amount. Customer service: 0718058057','254718058057','PENDING','2021-04-30 01:14:42'),(9,'2021-04-30 01:15:12','db3ef7fb-e0b0-4a25-a510-2a92e70d254a','JOHN, your bid of KES 100 on Samsung Galaxy S11(ends 29/04/21 05:00 61200000) has been placed. Your bid is currently unique. Bid ID: DB12PPNQYF','254718058057','PENDING','2021-04-30 01:15:12'),(10,'2021-04-30 01:15:42','5f054c38-73cf-4abf-8a1a-61a37a5a6d83','JOHN, your bid of KES 586 on Samsung Galaxy S11(ends 29/04/21 05:00 61200000) has been placed. Your bid is currently unique. Bid ID: DB1LYVJHCW','254718058057','PENDING','2021-04-30 01:15:42'),(11,'2021-05-04 18:18:41','904c79c8-2961-46e1-904b-9c0e8a69638b','This is just test','254718058057','PENDING','2021-05-04 18:18:41'),(12,'2021-05-04 18:18:42','65d9e864-e445-4e5e-9587-e3cf98acb353','This is just test','254780054845','PENDING','2021-05-04 18:18:42'),(13,'2021-05-04 18:18:52','cc8ce4d7-b0e2-491c-b3b5-8a307a08c3b9','This is just test','254718058057','PENDING','2021-05-04 18:18:52'),(14,'2021-05-04 18:18:53','ef21b609-ff1c-41bb-97ae-4f048ea6c5ba','This is just test','254780054845','PENDING','2021-05-04 18:18:53'),(15,'2021-05-04 18:18:57','9a367cc7-06f5-437c-b6f9-67cf6bbaa513','This is just test','254718058057','PENDING','2021-05-04 18:18:57'),(16,'2021-05-04 18:18:58','a45c52f3-3f5a-4cb4-a9b5-c0fbb5fbaaa6','This is just test','254780054845','PENDING','2021-05-04 18:18:58');
/*!40000 ALTER TABLE `sms_outbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` text COLLATE utf8_unicode_ci NOT NULL,
  `log_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `msisdn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `sms_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKekvack4cpf25dxs235yryveyo` (`role`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
INSERT INTO `user_auth` VALUES (1,'2021-04-21 08:21:08',NULL,'Ian Oumo','4bd3e798-eaae-4368-8409-518b1023e22e','254708436487','$2y$10$RlhlV0NSem1UTWdoeVhOKurP6UoZpLSvRGsIi6Yd2O5qyZJGcDQA6','1234','ACTIVE','2021-04-21 08:24:00',1);
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `winner`
--

DROP TABLE IF EXISTS `winner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `winner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PENDING',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `auction` bigint(20) NOT NULL,
  `customer_bid` bigint(20) NOT NULL,
  `customer_profile` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4hfbywoq9btlukvr37n382nu5` (`customer_bid`),
  KEY `FK7xpprjnduytn97aoj1pqjttxn` (`auction`),
  KEY `FKa12sf0529bol3ik11oucot5yv` (`customer_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `winner`
--

LOCK TABLES `winner` WRITE;
/*!40000 ALTER TABLE `winner` DISABLE KEYS */;
INSERT INTO `winner` VALUES (1,'2021-05-05 13:45:48','fd6c2454-ce26-4bcc-a97b-05d662a34e38','PENDING','2021-05-05 13:45:48',1,4,3);
/*!40000 ALTER TABLE `winner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-13 17:20:14
