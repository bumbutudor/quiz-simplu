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
  `text` varchar(255) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`correct`),
  KEY `quiz_id` (`quiz_id`),
  KEY `quiz_question_num` (`question_num`,`quiz_id`),
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`question_num`, `quiz_id`) REFERENCES `questions` (`num`, `quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answers_ibfk_3` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (7,1,43,'medic-È™ef',1,''),(8,1,43,'medic È™ef',0,''),(9,2,43,'medic-È™ef',1,''),(10,2,43,'medic È™ef',0,''),(13,3,43,'a',1,''),(14,3,43,'b',0,''),(22,5,43,'a',1,''),(23,5,43,'b',0,''),(24,5,43,'c',0,''),(25,4,43,'fi-ti atenti',1,''),(26,4,43,'asfasf',0,''),(27,4,43,'asfasfaasd',0,''),(28,4,43,'a',0,''),(33,6,43,'el a fost cel care m-a pulit in cap',1,''),(34,6,43,'sdgsdgs sdgs d sdg sg asga s',0,''),(37,7,43,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has su',0,''),(38,7,43,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has su',1,'');
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
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `module_group` int(128) unsigned NOT NULL DEFAULT '1' COMMENT 'Binary module id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ortografie','Exercitii legate de ortografie. De exemplu: \"Alege forma corecta: Fiti/ fi-ti atenti!\"',1),(2,'Ortoepie','Exercitii legate de ortoepie. De exemplu: \"di la\" coractat in casuta',2),(3,'Morfologie','Exercitii legate de  morfologie. De exemplu: Alege forma corecta: \"hoteluri-hotele\".',4),(4,'Sintaxa','Exercitii legate de sintaxa. De exmplu în enunturi: Un grup de studenti a vizitat/au vizitat muzeul\".',8),(5,'Lexic & Semantica','Exercitii legate de lexic si semantica.',16),(6,'Stilistica','Exercitii legate de stilistica.',32);
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
  `text` varchar(255) NOT NULL,
  `explanation` text CHARACTER SET utf8 COLLATE utf8_romanian_ci NOT NULL,
  `image` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `num` (`num`),
  KEY `num_2` (`num`,`quiz_id`),
  KEY `id` (`id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (4,1,43,'','',''),(5,2,43,'','',''),(8,3,43,'','Se scrie corect medic-È™ef deoarece...',''),(9,4,43,'','Varianta corecta este fiti atenti, deoarece ...',''),(10,5,43,'','',''),(13,6,43,'','',''),(15,7,43,'','','');
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
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_types`
--

LOCK TABLES `quiz_types` WRITE;
/*!40000 ALTER TABLE `quiz_types` DISABLE KEYS */;
INSERT INTO `quiz_types` VALUES (0,'undefined','undefined subcategory',0),(1,'test-grila','Alegerea variantei corecte dintr-o lista care are 2 sau mai multe variante.',1),(2,'din casuta','Alegerea formei corecte din casuta.',1),(3,'in casuta','Scrierea cuvantului in casuta care se afla in interiorul propozitiei.',1),(4,'text','Gasirea greselilor in text.',1),(5,'imagine','Asocierea imaginilor cu denumirea corecta in limba romana.',1);
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
  `time_taken` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_users`
--

LOCK TABLES `quiz_users` WRITE;
/*!40000 ALTER TABLE `quiz_users` DISABLE KEYS */;
INSERT INTO `quiz_users` VALUES (3,43,5,2,'2018-09-24 15:01:30','2018-09-24 15:04:13','163'),(4,43,1,2,'2018-09-25 10:58:31','2018-09-25 10:58:39','8'),(5,43,1,2,'2018-09-25 11:07:07','2018-09-25 11:07:11','4'),(6,43,1,0,'2018-09-25 11:12:15','2018-09-25 11:16:43','268'),(7,43,1,1,'2018-09-25 19:45:15','2018-09-25 19:45:30','15'),(8,43,1,3,'2018-09-26 11:46:17','2018-09-26 11:46:32','15'),(9,43,1,2,'2018-09-26 18:18:36','2018-09-26 18:19:07','31'),(10,43,1,1,'2018-10-01 09:14:40','2018-10-01 09:14:48','8'),(11,43,1,1,'2018-10-02 13:11:02','2018-10-02 13:11:10','8'),(12,43,1,2,'2018-10-02 13:13:22','2018-10-02 13:13:29','7'),(13,43,1,1,'2018-10-02 13:15:37','2018-10-02 13:15:52','15'),(14,43,1,2,'2018-10-02 13:16:23','2018-10-02 13:16:34','11'),(15,43,1,1,'2018-10-02 13:16:40','2018-10-02 13:16:47','7'),(16,43,1,1,'2018-10-02 13:19:58','2018-10-02 13:20:05','7'),(17,43,1,2,'2018-10-02 13:59:26','2018-10-02 13:59:44','18'),(18,43,1,2,'2018-10-02 14:01:01','2018-10-02 14:01:18','17'),(19,43,1,3,'2018-10-02 14:04:47','2018-10-02 14:05:00','13'),(20,43,1,3,'2018-10-02 14:10:36','2018-10-02 14:10:49','13'),(21,43,1,1,'2018-10-02 14:11:03','2018-10-02 14:11:17','14'),(22,43,1,4,'2018-10-02 16:09:45','2018-10-02 16:09:59','14'),(23,43,1,2,'2018-10-02 16:10:09','2018-10-02 16:10:23','14'),(24,43,1,4,'2018-10-03 12:27:39','2018-10-03 12:28:00','21'),(25,43,1,2,'2018-10-04 13:18:38','2018-10-04 13:18:48','10'),(26,43,1,6,'2018-10-04 14:00:30','2018-10-04 14:00:46','16'),(27,43,1,4,'2018-10-04 14:41:34','2018-10-04 14:41:48','14'),(28,43,1,3,'2018-10-04 19:26:39','2018-10-04 19:26:55','16'),(29,43,10,6,'2018-10-05 08:38:11','2018-10-05 08:38:27','16'),(30,43,11,2,'2018-10-05 09:03:55','2018-10-05 09:04:11','16');
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
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
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
  KEY `id_subcategory` (`id_subcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (43,'Test 1 Exercitiu','Alege varianta corecta:',1,2,1,'2018-09-24 07:53:27','2018-10-09 21:01:59',8),(45,'sdgsd','dsgsdg',4,1,1,'2018-10-05 07:21:10','2018-10-05 10:21:10',6),(49,'Ddsgsdgsdgsdgsd','Alege varianta corectÄƒ:',6,1,1,'2018-10-08 12:34:36','2018-10-08 15:34:36',8),(50,'Ddsgsdgsdgsdgsd','Alege varianta corectÄƒ:',5,1,1,'2018-10-08 12:48:47','2018-10-08 15:48:47',23),(51,'Test Exercitiu 2','Test Exercitiu 2',6,2,1,'2018-10-11 06:21:21','2018-10-11 09:21:21',17),(52,'Test Exercitiu 3','Test Exercitiu 3',6,1,1,'2018-10-11 06:23:08','2018-10-11 09:23:47',8);
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
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
  `id` varchar(32) NOT NULL,
  `access` int(10) unsigned DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('08tl09gj51t8i88f4ivanv0rs7',1539108033,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('0of65ioebn82uek43m4jkmqciu',1539001548,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('2mrvbfvdfv1vpa5ov1g2kfuo3q',1539084106,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}quizid|s:2:\"43\";score|i:0;correct|a:0:{}wrong|a:0:{}finished|s:2:\"no\";num|i:0;last|N;timetaken|N;starttime|N;nonce|s:32:\"b80a574ac8459946031a0d34745cbf44\";'),('2svglmo5kk1tj6ftbemf4spkuj',1538677128,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('38t7rsoaev05o69gor8s1k73g0',1539174193,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('44hikbf6s7h0iu4l2pbab1at34',1539111935,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('4bgp57l08l9c626edq4fsmmd9b',1538986606,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('4i7vjgv6ugd1l8ci7j56qa48hj',1538986625,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),('5sejrt8nmlfmis6cg9g2rcge2a',1539002502,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('5tmndstbms3t532hto8uipfu1f',1539085651,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),('64aadm0jc5sj1p5sgabc6ka55d',1539173937,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('6aropqhp7tps2pr7qd8oak62rl',1538722971,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),('6svc81870qovtbddb73m68raih',1538569430,'slim.flash|a:0:{}quizid|s:2:\"43\";score|i:0;correct|a:0:{}wrong|a:0:{}finished|s:2:\"no\";num|i:0;last|N;timetaken|N;starttime|N;urlRedirect|s:13:\"/quiz/process\";user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}nonce|N;'),('6v264s9j0k78j0qrcopph3qqjq',1538730829,'slim.flash|a:0:{}'),('7293gvq2arvf64ic6lc6aspfmc',1539107709,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('7apqfp7n7bg073e262cv1ipapt',1539085623,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('7m4u9f75re15al4rmdi0k3hpt1',1539108628,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('928sqm8c4vulfp6vtpm2s2vv9k',1539106763,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:4:\"Vano\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:18:\"vanyok93@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"14\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),('9ago3iefuft5uf5q9asico06bl',1538988197,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:17:\"lexic & semantica\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:25:\"lexic_semantica@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"12\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"16\";}'),('9b1og7mm5bsjcmu4uhab91e90d',1538682123,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('9e7p8e7gfnfvpbl15rn58otk4n',1539110510,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('9la51nj6t7iikr373oo3rm54k0',1538657034,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}'),('9nlq3c9k306tapu6d54ralbebl',1538666077,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}'),('9rhepvrncoobcc8oq77t0ioar2',1538985902,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),('agtbhefcgqucv30o52hbut2iti',1539241064,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('an5b9uvh9lo2gfbqajimcn0nrg',1538680006,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"32\";}'),('blohp5j0af1ub2pcgrhot665ps',1538681703,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"32\";}'),('ca2kgub93gj6tjtk7vgjd0l6lt',1539068344,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('cd7gtn3i1mo864ks9apjhvt8p6',1539087317,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('cf64mp8u8od4oa7smiqf935gbl',1539113549,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('cm3tqrestdkj34k77j9s7pjnq3',1539241857,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}test|s:1:\"6\";'),('dccdm8ucf92isvu49ooma8gdd5',1539160545,'slim.flash|a:0:{}'),('dt703uqlp998orh3d74c4dfibf',1539241042,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}test|s:1:\"6\";'),('e05tip7hhr875h4jka4mojejv9',1539165761,'urlRedirect|s:13:\"/admin/backup\";slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}test|s:1:\"6\";'),('eh3q8k09e1a904e3frj7u1933b',1539113618,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}test|s:1:\"6\";'),('em6714b6meecdaj2dscnas8eth',1539003025,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:17:\"lexic & semantica\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:25:\"lexic_semantica@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"12\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"16\";}'),('f27okt2fn2m4is6761vs0dl90h',1539002100,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:17:\"lexic & semantica\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:25:\"lexic_semantica@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"12\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"16\";}'),('f41neveh8vjehdpntl6e4tfh41',1539070502,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('feee0n42s23c4absmg52odrh0a',1538682694,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"32\";}'),('hqegt80qc5ikaou0v8912qihfq',1539085519,'slim.flash|a:0:{}'),('i3pgci3eu91106le5hheapv9ld',1538985665,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),('ic3eevdc6chd0raldsoo0m3jnr',1539002816,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:17:\"lexic & semantica\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:25:\"lexic_semantica@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"12\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"16\";}'),('j1nlvnucgmrhhm0ehn4pvvedkb',1539113229,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('jsode6iop7spm0r0thonqrq4p3',1539173945,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}test|s:1:\"6\";'),('julv1tv3t6il07a2ht09nt6dgi',1539088257,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),('kqt3qr47ibt839atta50hhtf5t',1538651914,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}'),('l140nau6digjvg92cdnc8cvtha',1539240930,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('l1dj7bl67an4gumouvcn2bu75d',1538723627,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),('lecn3ndc6185k8kml62pqknn1m',1539113498,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('mb1pam420rbc74gm3s65visbme',1539069375,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('mc2ls61hk0320ik920fsiqj6m9',1538982549,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('mkt12b4c93csakgu154smum6kn',1538562456,'slim.flash|a:0:{}quizid|s:2:\"43\";score|i:0;correct|a:0:{}wrong|a:0:{}finished|s:2:\"no\";num|i:0;last|N;timetaken|N;starttime|N;urlRedirect|s:13:\"/quiz/process\";user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}'),('n5k7requqih46agp3990c1vje3',1539158034,'urlRedirect|s:13:\"/admin/backup\";slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('nei8duq0cbsc3p6nab8v7nbnil',1538679946,'slim.flash|a:0:{}user|O:29:\"SimpleQuiz\\Utils\\User\\EndUser\":8:{s:38:\"\0SimpleQuiz\\Utils\\User\\EndUser\0quizzes\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"32\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;}'),('o5o5np1ar0fm9gog7ipd4ml643',1539240905,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('oui90mrqp8vbmu5049qev0ivr1',1539110500,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:4:\"Vano\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:18:\"vanyok93@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"14\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),('p0k41hrfe7jn13spr3t3qk4fu9',1539072612,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('p70vu5j592ueuss28njl99atnc',1539238785,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('p7i98upaqdba1vgqekug5q3no7',1538682749,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),('pai8gto1cmuv1dbrrl32kaneti',1538682728,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"4\";}'),('q4rkhd2ops5n7ek8a6k74g43po',1538673996,'slim.flash|a:0:{}quizid|s:2:\"43\";score|i:0;correct|a:0:{}wrong|a:0:{}finished|s:2:\"no\";num|i:0;last|N;timetaken|N;starttime|N;urlRedirect|s:13:\"/quiz/process\";user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}'),('qdrso5onrcb627hb22olgtuqdu',1539108700,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('qnbcsmg04n6hcg871a7nka7nea',1538675784,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";N;}'),('r0m0s90a2s32vn82hpm3a4ort6',1539113607,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('rv9083eagvqomhufga7qne59db',1539110352,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('s45sdit1lrdisenqst5r6lurbr',1539106166,'urlRedirect|s:7:\"/admin/\";slim.flash|a:0:{}user|O:29:\"SimpleQuiz\\Utils\\User\\EndUser\":9:{s:38:\"\0SimpleQuiz\\Utils\\User\\EndUser\0quizzes\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Vania\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:18:\"vanyok93@yahoo.com\";s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"14\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"0\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;}'),('s792aumri9sboe14s5jcbpedjn',1539110166,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('sji51djitntjj46ogefc87vprb',1539107485,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),('tbfmflj39vaetedp9i8lc7q2l3',1538988739,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:10:\"ortografie\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:20:\"ortografie@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"13\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),('utnq7q7k9gboq2o3i3hv0tvt20',1539176805,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}test|s:1:\"6\";'),('vd3i0kajdbc8bb373e0g5bq1ps',1539113566,'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}');
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
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `id_category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_modul` (`id_category`),
  CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Test 1 Submodul','Test 1 Submodul',1),(2,'Test 2 Submodul','Test 2 Submodul',1),(3,'Test 3 Submodul','Test 3 Submodul',2),(4,'Test 4 Submodul','Test 4 Submodul',2),(5,'Test 5 Submodul','Test 5 Submodul',3),(6,'Test 6 Submodul','Test 6 Submodul',4),(7,'Test 7 Submodul','Test 7 Submodul',5),(8,'Test 8 Submodul','Test 8 Submodul',6),(9,'Test 9 Submodul','Test 9 Submodul',1),(10,'Test 10 Submodul','Test 10 Submodul',1),(11,'Test 11 Submodul','Test 11 Submodul',1),(12,'Test 12 Submodul','Test 12 Submodul',1),(13,'Test 13  Submodul','Test 13  Submodul',1),(14,'Test 14 Submodul','Test 14 Submodul',3),(17,'Test 20 Submodul','Test 20 Submodul',6),(18,'Test 1 Submodul','Test 1 Submodulul',1),(19,'Test 1 Submodulul','Test 1 Submodulul',1),(20,'Test 1 Submodulrrrr','Test 1 Submodul',1),(21,'Test 1 Submodulrrrrdgsgsdg','Test 1 Submodul',1),(22,'Test 20 Submodul','Test 7 Submodul',1),(23,'Test 71 Submodul','Test 71 Submodul',5),(24,'Test 81 Submodul','Test 81 Submodul',6);
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
  `name` varchar(60) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(40) NOT NULL,
  `level` int(1) NOT NULL DEFAULT '0',
  `role` int(11) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `confirmhash` varchar(40) DEFAULT NULL,
  `hashstamp` timestamp NULL DEFAULT NULL,
  `id_moduls` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `pass` (`pass`),
  KEY `confirmed` (`confirmed`),
  KEY `id_category` (`id_moduls`),
  KEY `id_role` (`role`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrator','$2y$10$LK9O0BesGScRkDWPnpVP3uGVcN6JqB/xsuFTq/xQFpNjsx2DvTOl2','bumbutudor10@gmail.com',1,1,1,NULL,NULL,63),(5,'tudor','$2y$10$LK9O0BesGScRkDWPnpVP3uGVcN6JqB/xsuFTq/xQFpNjsx2DvTOl2','tudor@bumbu.com',0,3,1,NULL,NULL,1),(11,'Utilizator Sintaxa','$2y$10$wsPmVLKiB2r8Ig2uO36I7uVJH/vPC1LKBQT/f2Q0.nHNWVsuzMiNW','sintaxa@gmail.com',1,3,1,NULL,NULL,8),(12,'lexic & semantica','$2y$10$mFvL7oXMRdGJMNjcyOAHO.3BreW7d38hyX/T4nZQ9A0FgLB3n/8p.','lexic_semantica@gmail.com',1,3,1,NULL,NULL,16),(13,'ortografie','$2y$10$ikKfMl18mRr8Rqsvh80d3O6dkwAcKCkZXDI2rDuNU6QV2oXMsIZ1W','ortografie@gmail.com',1,3,1,NULL,NULL,1),(14,'Vano','$2y$10$rL2Cikllw7Upel3Y7sECKuy6yqZ0/gjLuwIP8jRddEpN0R5Ntf9xy','vanyok93@yahoo.com',1,3,0,NULL,NULL,1);
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

-- Dump completed on 2018-10-11 10:11:23
