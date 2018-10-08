-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2018 at 11:37 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logodava-quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_num` int(11) UNSIGNED NOT NULL,
  `quiz_id` int(11) UNSIGNED NOT NULL,
  `text` varchar(255) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_num`, `quiz_id`, `text`, `correct`, `comment`) VALUES
(7, 1, 43, 'medic-È™ef', 1, ''),
(8, 1, 43, 'medic È™ef', 0, ''),
(9, 2, 43, 'medic-È™ef', 1, ''),
(10, 2, 43, 'medic È™ef', 0, ''),
(13, 3, 43, 'a', 1, ''),
(14, 3, 43, 'b', 0, ''),
(22, 5, 43, 'a', 1, ''),
(23, 5, 43, 'b', 0, ''),
(24, 5, 43, 'c', 0, ''),
(25, 4, 43, 'fi-ti atenti', 1, ''),
(26, 4, 43, 'asfasf', 0, ''),
(27, 4, 43, 'asfasfaasd', 0, ''),
(28, 4, 43, 'a', 0, ''),
(33, 6, 43, 'el a fost cel care m-a pulit in cap', 1, ''),
(34, 6, 43, 'sdgsdgs sdgs d sdg sg asga s', 0, ''),
(37, 7, 43, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has su', 0, ''),
(38, 7, 43, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has su', 1, ''),
(39, 1, 45, 'medic-È™ef', 1, ''),
(40, 1, 45, 'medic È™ef', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `module_group` int(128) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Binary module id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `module_group`) VALUES
(1, 'Ortografie', 'ExerciÈ›ii legate de ortografie.', 1),
(2, 'Ortoepie', 'ExerciÈ›ii legate de ortoepie.', 2),
(3, 'Morfologie', 'ExerciÈ›ii legate de morfologie.', 4),
(4, 'SintaxÄƒ', 'ExerciÈ›ii legate de sintaxÄƒ. ', 8),
(5, 'Lexic È™i SemanticÄƒ', 'ExerciÈ›ii legate de lexic È™i semanticÄƒ.', 16),
(6, 'StilisticÄƒ', 'ExerciÈ›ii legate de stilisticÄƒ.', 32);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `num` int(11) UNSIGNED NOT NULL,
  `quiz_id` int(11) UNSIGNED NOT NULL,
  `text` varchar(255) NOT NULL,
  `explanation` text CHARACTER SET utf8 COLLATE utf8_romanian_ci NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `num`, `quiz_id`, `text`, `explanation`, `image`) VALUES
(4, 1, 43, '', '', ''),
(5, 2, 43, '', '', ''),
(8, 3, 43, '', 'Se scrie corect medic-È™ef deoarece...', ''),
(9, 4, 43, '', 'Varianta corecta este fiti atenti, deoarece ...', ''),
(10, 5, 43, '', '', ''),
(13, 6, 43, '', '', ''),
(15, 7, 43, '', '', ''),
(16, 1, 45, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `quiz_type` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL,
  `id_subcategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `name`, `description`, `category`, `quiz_type`, `active`, `created`, `updated`, `id_subcategory`) VALUES
(43, 'Test 1 Exercitiu', 'Alege varianta corecta:', 1, 1, 1, '2018-09-24 07:53:27', '2018-10-01 10:14:24', 1),
(45, 'ExerciÈ›ii', 'dsgsdg', 4, 1, 1, '2018-10-05 07:21:10', '2018-10-05 12:00:38', 5);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_types`
--

CREATE TABLE `quiz_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `is_visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_types`
--

INSERT INTO `quiz_types` (`id`, `name`, `description`, `is_visible`) VALUES
(0, 'undefined', 'undefined subcategory', 0),
(1, 'test-grila', 'Alegerea variantei corecte dintr-o lista care are 2 sau mai multe variante.', 1),
(2, 'din casuta', 'Alegerea formei corecte din casuta.', 1),
(3, 'in casuta', 'Scrierea cuvantului in casuta care se afla in interiorul propozitiei.', 1),
(4, 'text', 'Gasirea greselilor in text.', 1),
(5, 'imagine', 'Asocierea imaginilor cu denumirea corecta in limba romana.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_users`
--

CREATE TABLE `quiz_users` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `date_submitted` datetime NOT NULL,
  `time_taken` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_users`
--

INSERT INTO `quiz_users` (`id`, `quiz_id`, `user_id`, `score`, `start_time`, `date_submitted`, `time_taken`) VALUES
(3, 43, 5, 2, '2018-09-24 15:01:30', '2018-09-24 15:04:13', '163'),
(4, 43, 1, 2, '2018-09-25 10:58:31', '2018-09-25 10:58:39', '8'),
(5, 43, 1, 2, '2018-09-25 11:07:07', '2018-09-25 11:07:11', '4'),
(6, 43, 1, 0, '2018-09-25 11:12:15', '2018-09-25 11:16:43', '268'),
(7, 43, 1, 1, '2018-09-25 19:45:15', '2018-09-25 19:45:30', '15'),
(8, 43, 1, 3, '2018-09-26 11:46:17', '2018-09-26 11:46:32', '15'),
(9, 43, 1, 2, '2018-09-26 18:18:36', '2018-09-26 18:19:07', '31'),
(10, 43, 1, 1, '2018-10-01 09:14:40', '2018-10-01 09:14:48', '8'),
(11, 43, 1, 1, '2018-10-02 13:11:02', '2018-10-02 13:11:10', '8'),
(12, 43, 1, 2, '2018-10-02 13:13:22', '2018-10-02 13:13:29', '7'),
(13, 43, 1, 1, '2018-10-02 13:15:37', '2018-10-02 13:15:52', '15'),
(14, 43, 1, 2, '2018-10-02 13:16:23', '2018-10-02 13:16:34', '11'),
(15, 43, 1, 1, '2018-10-02 13:16:40', '2018-10-02 13:16:47', '7'),
(16, 43, 1, 1, '2018-10-02 13:19:58', '2018-10-02 13:20:05', '7'),
(17, 43, 1, 2, '2018-10-02 13:59:26', '2018-10-02 13:59:44', '18'),
(18, 43, 1, 2, '2018-10-02 14:01:01', '2018-10-02 14:01:18', '17'),
(19, 43, 1, 3, '2018-10-02 14:04:47', '2018-10-02 14:05:00', '13'),
(20, 43, 1, 3, '2018-10-02 14:10:36', '2018-10-02 14:10:49', '13'),
(21, 43, 1, 1, '2018-10-02 14:11:03', '2018-10-02 14:11:17', '14'),
(22, 43, 1, 4, '2018-10-02 16:09:45', '2018-10-02 16:09:59', '14'),
(23, 43, 1, 2, '2018-10-02 16:10:09', '2018-10-02 16:10:23', '14'),
(24, 43, 1, 4, '2018-10-03 12:27:39', '2018-10-03 12:28:00', '21'),
(25, 43, 1, 2, '2018-10-04 13:18:38', '2018-10-04 13:18:48', '10'),
(26, 43, 1, 6, '2018-10-04 14:00:30', '2018-10-04 14:00:46', '16'),
(27, 43, 1, 4, '2018-10-04 14:41:34', '2018-10-04 14:41:48', '14'),
(28, 43, 1, 3, '2018-10-04 19:26:39', '2018-10-04 19:26:55', '16'),
(29, 43, 10, 6, '2018-10-05 08:38:11', '2018-10-05 08:38:27', '16'),
(30, 43, 11, 2, '2018-10-05 09:03:55', '2018-10-05 09:04:11', '16');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'webmaster', 'Adminstratorul site-ului - persoana care a proiectat si elaborat aplicatia.'),
(2, 'supervizor', 'Managerul care poate vedea si edita toate modulele, submodulele, exercitiile, intrebarile, raspunsurile, lucratorii'),
(3, 'lucrator', 'Persoana care are acces doar la un singur modul, la toate tipurile de exercitii. Poate edita si adauga exercitii doar la un singur modul.');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(32) NOT NULL,
  `access` int(10) UNSIGNED DEFAULT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `access`, `data`) VALUES
('2svglmo5kk1tj6ftbemf4spkuj', 1538677128, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),
('6aropqhp7tps2pr7qd8oak62rl', 1538722971, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),
('6svc81870qovtbddb73m68raih', 1538569430, 'slim.flash|a:0:{}quizid|s:2:\"43\";score|i:0;correct|a:0:{}wrong|a:0:{}finished|s:2:\"no\";num|i:0;last|N;timetaken|N;starttime|N;urlRedirect|s:13:\"/quiz/process\";user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}nonce|N;'),
('8fkl1lhgoaenvj78sksoi3mhuk', 1538729517, 'user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),
('8t65vv62qsmrdolk5vpshbcq9c', 1538725522, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}quizid|s:2:\"43\";score|i:0;correct|a:0:{}wrong|a:0:{}finished|s:2:\"no\";num|i:0;last|N;timetaken|N;starttime|s:19:\"2018-10-05 09:15:18\";nonce|s:32:\"a8a0b313755b352c8bdea23e1ca6f510\";'),
('9b1og7mm5bsjcmu4uhab91e90d', 1538682123, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"63\";}'),
('9la51nj6t7iikr373oo3rm54k0', 1538657034, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}'),
('9nlq3c9k306tapu6d54ralbebl', 1538666077, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}'),
('akqodmj1cj7j5qjph1thisgs3u', 1538732039, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}quizid|s:2:\"45\";score|i:0;correct|a:0:{}wrong|a:0:{}finished|s:2:\"no\";num|i:0;last|N;timetaken|N;starttime|N;'),
('an5b9uvh9lo2gfbqajimcn0nrg', 1538680006, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"32\";}'),
('blohp5j0af1ub2pcgrhot665ps', 1538681703, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"32\";}'),
('feee0n42s23c4absmg52odrh0a', 1538682694, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"32\";}'),
('kqt3qr47ibt839atta50hhtf5t', 1538651914, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}'),
('l14ech4o96kf6l1vlf92v9en7b', 1538729566, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),
('l1dj7bl67an4gumouvcn2bu75d', 1538723627, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Utilizator Sintaxa\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:17:\"sintaxa@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),
('mkt12b4c93csakgu154smum6kn', 1538562456, 'slim.flash|a:0:{}quizid|s:2:\"43\";score|i:0;correct|a:0:{}wrong|a:0:{}finished|s:2:\"no\";num|i:0;last|N;timetaken|N;starttime|N;urlRedirect|s:13:\"/quiz/process\";user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}'),
('nei8duq0cbsc3p6nab8v7nbnil', 1538679946, 'slim.flash|a:0:{}user|O:29:\"SimpleQuiz\\Utils\\User\\EndUser\":8:{s:38:\"\0SimpleQuiz\\Utils\\User\\EndUser\0quizzes\";N;s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:2:\"32\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;}'),
('p7i98upaqdba1vgqekug5q3no7', 1538682749, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),
('pai8gto1cmuv1dbrrl32kaneti', 1538682728, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:5:\"Ciala\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:16:\"pidroc@yahoo.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"10\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"4\";}'),
('q4rkhd2ops5n7ek8a6k74g43po', 1538673996, 'slim.flash|a:0:{}quizid|s:2:\"43\";score|i:0;correct|a:0:{}wrong|a:0:{}finished|s:2:\"no\";num|i:0;last|N;timetaken|N;starttime|N;urlRedirect|s:13:\"/quiz/process\";user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":6:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";}'),
('qnbcsmg04n6hcg871a7nka7nea', 1538675784, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":7:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";N;}');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `description`, `id_category`) VALUES
(1, 'Test 1 Submodul', 'Test 1 Submodul', 1),
(2, 'Test 2 Submodul', 'Test 2 Submodul', 1),
(3, 'Test 3 Submodul', 'Test 3 Submodul', 2),
(4, 'Test 4 Submodul', 'Test 4 Submodul', 2),
(5, 'Test 5 Submodul', 'Test 5 Submodul', 3),
(6, 'Test 6 Submodul', 'Test 6 Submodul', 4),
(7, 'Test 7 Submodul', 'Test 7 Submodul', 5),
(8, 'Test 8 Submodul', 'Test 8 Submodul', 6),
(9, 'Test 9 Submodul', 'Test 9 Submodul', 1),
(10, 'Test 10 Submodul', 'Test 10 Submodul', 1),
(11, 'Test 11 Submodul', 'Test 11 Submodul', 1),
(12, 'Test 12 Submodul', 'Test 12 Submodul', 1),
(13, 'Test 13  Submodul', 'Test 13  Submodul', 1),
(14, 'Test 14 Submodul', 'Test 14 Submodul', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(40) NOT NULL,
  `level` int(1) NOT NULL DEFAULT '0',
  `role` int(11) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `confirmhash` varchar(40) DEFAULT NULL,
  `hashstamp` timestamp NULL DEFAULT NULL,
  `id_moduls` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `pass`, `email`, `level`, `role`, `confirmed`, `confirmhash`, `hashstamp`, `id_moduls`) VALUES
(1, 'Administrator', '$2y$10$LK9O0BesGScRkDWPnpVP3uGVcN6JqB/xsuFTq/xQFpNjsx2DvTOl2', 'bumbutudor10@gmail.com', 1, 1, 1, NULL, NULL, 63),
(11, 'Utilizator Sintaxa', '$2y$10$wsPmVLKiB2r8Ig2uO36I7uVJH/vPC1LKBQT/f2Q0.nHNWVsuzMiNW', 'sintaxa@gmail.com', 1, 3, 1, NULL, NULL, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`correct`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `quiz_question_num` (`question_num`,`quiz_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `num` (`num`),
  ADD KEY `num_2` (`num`,`quiz_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`),
  ADD KEY `id` (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `updated` (`updated`),
  ADD KEY `id_subcategory` (`id_subcategory`);

--
-- Indexes for table `quiz_types`
--
ALTER TABLE `quiz_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_users`
--
ALTER TABLE `quiz_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_modul` (`id_category`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `pass` (`pass`),
  ADD KEY `confirmed` (`confirmed`),
  ADD KEY `id_category` (`id_moduls`),
  ADD KEY `id_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `quiz_types`
--
ALTER TABLE `quiz_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quiz_users`
--
ALTER TABLE `quiz_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`question_num`,`quiz_id`) REFERENCES `questions` (`num`, `quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_3` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
