-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: db_transactions
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `login_user`
--

DROP TABLE IF EXISTS `login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user` (
  `id` varchar(256) NOT NULL,
  `user_id` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  CONSTRAINT `fk_login_user_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
INSERT INTO `login_user` VALUES ('1bcb5c87-649b-4d56-8ea8-857819458e6d','bdbeb875-5f1f-44a2-9d32-002a4b76007c','ada@email.com','e10adc3949ba59abbe56e057f20f883e','2021-08-08 22:18:25','2021-08-08 22:18:25'),('21729bf2-aa9d-44d6-bbc2-4e51bee58a1e','7d6f3661-c529-457b-80f5-67c5b0a0c8f4','mae@email.com','e10adc3949ba59abbe56e057f20f883e','2021-08-08 22:19:38','2021-08-08 22:19:38'),('51012c1e-6fa0-477a-9d74-dc6dcb1a0269','6787a7f3-6a07-4ebf-b7fb-6333abe6b0c1','mae@roseli.com','e10adc3949ba59abbe56e057f20f883e','2021-08-08 23:16:24','2021-08-08 23:16:24'),('97e33ae0-2605-4d88-bc50-488a5093c477','8640968f-1641-4449-9eef-d404145a8888','mae@tse.com','e10adc3949ba59abbe56e057f20f883e','2021-08-08 22:21:38','2021-08-08 22:21:38'),('ccf4738e-f6c1-11eb-9a03-0242ac130003','a30c6ca8-f6c0-11eb-9a03-0242ac130003','aririfavero@gmail.com','2c3cec05a3d35602fae958281eb6a80a','2021-08-06 14:23:22','2021-08-06 14:23:22'),('d2ab3722-f6c1-11eb-9a03-0242ac130003','db20e222-f6c0-11eb-9a03-0242ac130003','emilio.pionatto@gmail.com','fc76542975671b919401eaf2bceb9776','2021-08-06 14:24:22','2021-08-06 14:24:22');
/*!40000 ALTER TABLE `login_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` varchar(256) NOT NULL,
  `wallet_origin` varchar(256) NOT NULL,
  `wallet_destiny` varchar(256) NOT NULL,
  `transaction_value` float NOT NULL,
  `description` text,
  `type_id` varchar(256) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_transactions_cash_1_idx` (`wallet_destiny`),
  KEY `fk_transactions_cash_2_idx` (`wallet_origin`),
  KEY `fk_transactions_cash_3_idx` (`type_id`),
  CONSTRAINT `fk_transactions_cash_3` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES ('015dbdaa-f6c3-11eb-9a03-0242ac130003','ac64bc86-f6c2-11eb-9a03-0242ac130003','9c15933c-f6c2-11eb-9a03-0242ac130003',5,'água','575f7a60-f6c1-11eb-9a03-0242ac130003','2021-08-06 14:37:21','2021-08-06 14:37:21'),('0a9669f1-c9c9-4774-a61d-2b5f37067faf','ac64bc86-f6c2-11eb-9a03-0242ac130003','9c15933c-f6c2-11eb-9a03-0242ac130003',20.01,'copo','575f7a60-f6c1-11eb-9a03-0242ac130003','2021-08-09 01:56:18','2021-08-09 01:56:18'),('17948ddc-c6c0-4610-a184-eefa4f96f6aa','ac64bc86-f6c2-11eb-9a03-0242ac130003','9c15933c-f6c2-11eb-9a03-0242ac130003',20.01,'copo','575f7a60-f6c1-11eb-9a03-0242ac130003','2021-08-09 01:54:20','2021-08-09 01:54:20'),('81a62f76-64b6-4bf4-be9f-16a179dafffc','ac64bc86-f6c2-11eb-9a03-0242ac130003','9c15933c-f6c2-11eb-9a03-0242ac130003',20.01,'copo','575f7a60-f6c1-11eb-9a03-0242ac130003','2021-08-09 01:58:52','2021-08-09 01:58:52'),('8925aa33-f70f-4363-b78d-12e1fbc8f2a5','ac64bc86-f6c2-11eb-9a03-0242ac130003','9c15933c-f6c2-11eb-9a03-0242ac130003',20.01,'copo','575f7a60-f6c1-11eb-9a03-0242ac130003','2021-08-09 02:08:53','2021-08-09 02:08:53'),('c19466f0-ea54-4032-b910-fd55317c819c','ac64bc86-f6c2-11eb-9a03-0242ac130003','9c15933c-f6c2-11eb-9a03-0242ac130003',20.01,'copo','575f7a60-f6c1-11eb-9a03-0242ac130003','2021-08-09 02:07:30','2021-08-09 02:07:30'),('f302d696-f6c2-11eb-9a03-0242ac130003','9c15933c-f6c2-11eb-9a03-0242ac130003','ac64bc86-f6c2-11eb-9a03-0242ac130003',75.5,'bolo','575f7a60-f6c1-11eb-9a03-0242ac130003','2021-08-06 14:38:21','2021-08-06 14:38:21');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` varchar(256) NOT NULL,
  `description` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES ('575f7a60-f6c1-11eb-9a03-0242ac130003','PIX',NULL,NULL),('5fa73e38-f6c1-11eb-9a03-0242ac130003','TED',NULL,NULL),('65b5a364-f6c1-11eb-9a03-0242ac130003','Vale Refeição',NULL,NULL);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(256) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `document` varchar(14) NOT NULL,
  `document_type` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `document_UNIQUE` (`document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','Giovanni','Favero','12345678900',0,'2021-08-08 04:26:30','2021-08-08 04:26:30'),('3','Eu','Favero','11111111111',0,'2021-08-08 15:49:24','2021-08-08 15:49:24'),('4','Voce','Favero','11111111112',0,'2021-08-08 15:55:00','2021-08-08 15:55:00'),('6','Voce','Favero','11111111113',0,'2021-08-08 15:57:00','2021-08-08 15:57:00'),('6787a7f3-6a07-4ebf-b7fb-6333abe6b0c1','Mamae','Rose','12312312355',0,'2021-08-08 23:16:24','2021-08-08 23:16:24'),('7d6f3661-c529-457b-80f5-67c5b0a0c8f4','Mae','Teixeira','12312312377',0,'2021-08-08 22:19:38','2021-08-08 22:19:38'),('8','Pig','Pig','11111111114',0,'2021-08-08 15:58:07','2021-08-08 15:58:07'),('840d2642-f88e-11eb-9a03-0242ac130003','Giovanna%last_name=Castro',NULL,'99999999999',1,'2021-08-08 05:12:38','2021-08-08 05:12:38'),('8640968f-1641-4449-9eef-d404145a8888','Mamae','Aparecida','12312312388',0,'2021-08-08 22:21:38','2021-08-08 22:21:38'),('a30c6ca8-f6c0-11eb-9a03-0242ac130003','Ariane','Favero','32348506823',0,'2021-08-06 14:15:23','2021-08-06 14:15:23'),('bdbeb875-5f1f-44a2-9d32-002a4b76007c','Ada','Castro','12312312300',0,'2021-08-08 22:18:25','2021-08-08 22:18:25'),('db20e222-f6c0-11eb-9a03-0242ac130003','Emilio','Favero','30195227816',0,'2021-08-06 14:19:23','2021-08-06 14:19:23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet` (
  `id` varchar(256) NOT NULL,
  `user_id` varchar(256) NOT NULL,
  `value` float DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cash_user_1_idx` (`user_id`),
  CONSTRAINT `fk_cash_user_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES ('1f455304-889a-4beb-a762-8cb34a91075e','6787a7f3-6a07-4ebf-b7fb-6333abe6b0c1',0,'2021-08-08 23:16:24','2021-08-08 23:16:24'),('73f422a5-5f9f-468e-88c1-3548883c5866','840d2642-f88e-11eb-9a03-0242ac130003',10000,NULL,NULL),('8da0b7bc-f7eb-11eb-9a03-0242ac130003','1',444.56,'2021-08-06 14:32:26','2021-08-06 14:32:26'),('9c15933c-f6c2-11eb-9a03-0242ac130003','a30c6ca8-f6c0-11eb-9a03-0242ac130003',120.01,'2021-08-06 14:31:26','2021-08-09 02:08:53'),('ac64bc86-f6c2-11eb-9a03-0242ac130003','db20e222-f6c0-11eb-9a03-0242ac130003',185.99,'2021-08-06 14:32:26','2021-08-09 02:08:53');
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-08 20:33:30
