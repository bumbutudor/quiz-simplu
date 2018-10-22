-- MySQL dump 10.16  Distrib 10.1.35-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: logodava-quiz
-- ------------------------------------------------------
-- Server version	10.1.35-MariaDB

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_num` int(11) unsigned NOT NULL,
  `quiz_id` int(11) unsigned NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`correct`),
  KEY `quiz_id` (`quiz_id`),
  KEY `quiz_question_num` (`question_num`,`quiz_id`),
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`question_num`, `quiz_id`) REFERENCES `questions` (`num`, `quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answers_ibfk_3` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `module_group` int(128) unsigned NOT NULL DEFAULT '1' COMMENT 'Binary module id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ortografie','Exerciții legate de Ortografie',1),(2,'Ortoepie','Exerciții legate de Ortoepie',2),(3,'Morfologie','Exerciții legate de  Morfologie',4),(4,'Sintaxă','Exerciții legate de Sintaxă',8),(5,'Lexic și Semantică','Exerciții legate de Lexic și Semantică',16),(6,'Punctuație','Exerciții legate de Stilistică',32);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) unsigned NOT NULL,
  `quiz_id` int(11) unsigned NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `explanation` text COLLATE utf8_unicode_ci NOT NULL,
  `image` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `num` (`num`),
  KEY `num_2` (`num`,`quiz_id`),
  KEY `id` (`id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_types`
--

DROP TABLE IF EXISTS `quiz_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_types`
--

LOCK TABLES `quiz_types` WRITE;
/*!40000 ALTER TABLE `quiz_types` DISABLE KEYS */;
INSERT INTO `quiz_types` VALUES (0,'undefined','undefined','undefined subcategory',0),(1,'test-grila','RadioQuestion','Alegerea variantei corecte dintr-o lista care are 2 sau mai multe variante.',1),(2,'din casuta','SelectQuestion','Alegerea formei corecte din casuta.',1),(3,'in casuta','InputQuestion','Scrierea cuvantului in casuta care se afla in interiorul propozitiei.',1),(4,'text','TextQuestion','Gasirea greselilor in text.',1),(5,'imagine','ImageQuestion','Asocierea imaginilor cu denumirea corecta in limba romana.',1);
/*!40000 ALTER TABLE `quiz_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_users`
--

DROP TABLE IF EXISTS `quiz_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `score` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `date_submitted` datetime NOT NULL,
  `time_taken` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_users`
--

LOCK TABLES `quiz_users` WRITE;
/*!40000 ALTER TABLE `quiz_users` DISABLE KEYS */;
INSERT INTO `quiz_users` VALUES (3,43,5,2,'2018-09-24 15:01:30','2018-09-24 15:04:13','163'),(4,43,1,2,'2018-09-25 10:58:31','2018-09-25 10:58:39','8'),(5,43,1,2,'2018-09-25 11:07:07','2018-09-25 11:07:11','4'),(6,43,1,0,'2018-09-25 11:12:15','2018-09-25 11:16:43','268'),(7,43,1,1,'2018-09-25 19:45:15','2018-09-25 19:45:30','15'),(8,43,1,3,'2018-09-26 11:46:17','2018-09-26 11:46:32','15'),(9,43,1,2,'2018-09-26 18:18:36','2018-09-26 18:19:07','31'),(10,43,1,1,'2018-10-01 09:14:40','2018-10-01 09:14:48','8'),(11,43,1,1,'2018-10-02 13:11:02','2018-10-02 13:11:10','8'),(12,43,1,2,'2018-10-02 13:13:22','2018-10-02 13:13:29','7'),(13,43,1,1,'2018-10-02 13:15:37','2018-10-02 13:15:52','15'),(14,43,1,2,'2018-10-02 13:16:23','2018-10-02 13:16:34','11'),(15,43,1,1,'2018-10-02 13:16:40','2018-10-02 13:16:47','7'),(16,43,1,1,'2018-10-02 13:19:58','2018-10-02 13:20:05','7'),(17,43,1,2,'2018-10-02 13:59:26','2018-10-02 13:59:44','18'),(18,43,1,2,'2018-10-02 14:01:01','2018-10-02 14:01:18','17'),(19,43,1,3,'2018-10-02 14:04:47','2018-10-02 14:05:00','13'),(20,43,1,3,'2018-10-02 14:10:36','2018-10-02 14:10:49','13'),(21,43,1,1,'2018-10-02 14:11:03','2018-10-02 14:11:17','14'),(22,43,1,4,'2018-10-02 16:09:45','2018-10-02 16:09:59','14'),(23,43,1,2,'2018-10-02 16:10:09','2018-10-02 16:10:23','14'),(24,43,1,4,'2018-10-03 12:27:39','2018-10-03 12:28:00','21'),(25,43,1,2,'2018-10-04 13:18:38','2018-10-04 13:18:48','10'),(26,43,1,6,'2018-10-04 14:00:30','2018-10-04 14:00:46','16'),(27,43,1,4,'2018-10-04 14:41:34','2018-10-04 14:41:48','14'),(28,43,1,3,'2018-10-04 19:26:39','2018-10-04 19:26:55','16'),(29,43,10,6,'2018-10-05 08:38:11','2018-10-05 08:38:27','16'),(30,43,11,2,'2018-10-05 09:03:55','2018-10-05 09:04:11','16'),(31,43,1,1,'2018-10-19 10:05:43','2018-10-19 10:05:48','5'),(32,43,1,0,'2018-10-19 10:06:05','2018-10-19 10:06:09','4'),(33,51,1,1,'2018-10-19 10:06:19','2018-10-19 10:06:21','2'),(34,51,1,0,'2018-10-19 10:06:24','2018-10-19 10:06:27','3'),(35,43,1,0,'2018-10-19 10:09:14','2018-10-19 10:09:17','3'),(36,43,1,0,'2018-10-19 14:41:19','2018-10-19 14:41:23','4'),(37,43,1,1,'2018-10-19 14:42:58','2018-10-19 14:43:16','18'),(38,56,1,0,'2018-10-20 15:41:05','2018-10-20 15:42:32','87'),(39,56,1,0,'2018-10-20 15:45:43','2018-10-20 15:46:42','59'),(40,56,1,1,'0000-00-00 00:00:00','2018-10-20 15:59:16','1540043956'),(41,56,1,1,'2018-10-20 15:59:22','2018-10-20 15:59:23','1'),(42,56,1,1,'0000-00-00 00:00:00','2018-10-20 15:59:41','1540043981'),(43,56,1,0,'0000-00-00 00:00:00','2018-10-22 09:50:14','1540194614'),(44,61,1,0,'0000-00-00 00:00:00','2018-10-22 10:43:26','1540197806'),(45,61,1,0,'0000-00-00 00:00:00','2018-10-22 10:56:51','1540198611'),(46,66,1,0,'0000-00-00 00:00:00','2018-10-22 12:56:16','1540205776');
/*!40000 ALTER TABLE `quiz_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` int(11) NOT NULL,
  `quiz_type` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL,
  `id_subcategory` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `id` (`id`),
  KEY `created` (`created`),
  KEY `updated` (`updated`),
  KEY `id_subcategory` (`id_subcategory`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`id_subcategory`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'webmaster','Adminstratorul site-ului - persoana care a proiectat si elaborat aplicatia.'),(2,'supervizor','Managerul care poate vedea si edita toate modulele, submodulele, exercitiile, intrebarile, raspunsurile, lucratorii'),(3,'lucrator','Persoana care are acces doar la un singur modul, la toate tipurile de exercitii. Poate edita si adauga exercitii doar la un singur modul.');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `access` int(10) unsigned DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('9k14476lq5c6bph913e0ro8mee',1540205735,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:10:\"Supervizor\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('eirk7k5mp59meg5199raa7svu2',1540214445,'slim.flash|a:0:{}'),('g913l89thcmqmh2oqllhm8knnl',1540210066,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:10:\"Supervizor\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('hrjhmol0sc74v3u5l1q4djlsfg',1540214476,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:10:\"Supervizor\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('la3qhednqigcj8ma70ctv59a3r',1540207719,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:10:\"Supervizor\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('r2b174v43h796n6fguln6tdkf9',1540215548,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:10:\"Supervizor\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}userModule|s:1:\"6\";'),('ulc5up9rcvrm922beaa137j3sd',1540207681,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:10:\"Supervizor\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}userModule|s:1:\"2\";nonce|N;num|i:1;wrong|a:1:{i:1;a:1:{i:0;s:9:\"Domnia-Sa\";}}last|b:0;finished|s:2:\"no\";timetaken|a:2:{s:4:\"mins\";s:7:\"56 min \";s:4:\"secs\";s:6:\"16 sec\";}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `id_category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_modul` (`id_category`),
  CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(1) NOT NULL DEFAULT '0',
  `role` int(11) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `confirmhash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hashstamp` timestamp NULL DEFAULT NULL,
  `id_moduls` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `pass` (`pass`),
  KEY `confirmed` (`confirmed`),
  KEY `id_category` (`id_moduls`),
  KEY `id_role` (`role`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Supervizor','$2y$10$LK9O0BesGScRkDWPnpVP3uGVcN6JqB/xsuFTq/xQFpNjsx2DvTOl2','bumbutudor10@gmail.com',1,1,1,NULL,NULL,63),(5,'tudor','$2y$10$LK9O0BesGScRkDWPnpVP3uGVcN6JqB/xsuFTq/xQFpNjsx2DvTOl2','tudor@bumbu.com',0,3,1,NULL,NULL,1),(11,'Utilizator Sintaxa','$2y$10$wsPmVLKiB2r8Ig2uO36I7uVJH/vPC1LKBQT/f2Q0.nHNWVsuzMiNW','sintaxa@gmail.com',1,3,1,NULL,NULL,8),(12,'lexic & semantica','$2y$10$mFvL7oXMRdGJMNjcyOAHO.3BreW7d38hyX/T4nZQ9A0FgLB3n/8p.','lexic_semantica@gmail.com',1,3,1,NULL,NULL,16),(13,'ortografie','$2y$10$ikKfMl18mRr8Rqsvh80d3O6dkwAcKCkZXDI2rDuNU6QV2oXMsIZ1W','ortografie@gmail.com',1,3,1,NULL,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-22 16:39:11
