-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2018 at 01:20 PM
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
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `module_group` int(128) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Binary module id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `module_group`) VALUES
(1, 'Ortografie', 'Exerciții legate de ortografie', 1),
(2, 'Ortoepie', 'Exerciții legate de ortoepie', 2),
(3, 'Morfologie', 'Exerciții legate de morfologie', 4),
(4, 'Sintaxă', 'Exerciții legate de sintaxă', 8),
(5, 'Lexic și Semantică', 'Exerciții legate de lexic și semantică', 16),
(6, 'Punctuație', 'Exerciții legate de punctuație', 32);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `num` int(11) UNSIGNED NOT NULL,
  `quiz_id` int(11) UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `explanation` text COLLATE utf8_unicode_ci NOT NULL,
  `image` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` int(11) NOT NULL,
  `quiz_type` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL,
  `id_subcategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_types`
--

CREATE TABLE `quiz_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `is_visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quiz_types`
--

INSERT INTO `quiz_types` (`id`, `name`, `class`, `description`, `is_visible`) VALUES
(0, 'undefined', '', 'undefined quiz_type', 0),
(1, 'grilă', 'RadioQuestion', 'Alegerea variantei corecte dintr-o listă care are 2 sau mai multe variante.', 1),
(2, 'din casuță', 'SelectQuestion', 'Alegerea formei corecte din casuță.', 1),
(3, 'în casută', 'InputQuestion', 'Scrierea cuvântului în căsuță.', 1),
(4, 'text', 'TextQuestion', 'Găsirea greșelilor în text.', 1),
(5, 'imagine', 'ImageQuestion', 'Asocierea imaginilor cu denumirea corectă în limba română.', 1);

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
  `time_taken` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(30, 43, 11, 2, '2018-10-05 09:03:55', '2018-10-05 09:04:11', '16'),
(31, 46, 1, 3, '2018-10-06 10:14:58', '2018-10-06 10:15:12', '14'),
(32, 46, 1, 0, '2018-10-06 10:15:19', '2018-10-06 10:15:37', '18'),
(33, 43, 1, 0, '2018-10-14 17:16:27', '2018-10-14 17:17:04', '37'),
(34, 43, 1, 0, '0000-00-00 00:00:00', '2018-10-14 17:17:46', '1539530266'),
(35, 43, 1, 1, '2018-10-14 17:18:08', '2018-10-14 17:18:17', '9'),
(36, 45, 1, 2, '2018-10-15 11:25:00', '2018-10-15 11:25:07', '7'),
(37, 43, 1, 1, '2018-10-16 16:33:30', '2018-10-16 16:33:38', '8'),
(38, 59, 1, 1, '2018-10-17 10:30:14', '2018-10-17 10:30:20', '6'),
(39, 59, 1, 0, '2018-10-17 12:01:35', '2018-10-17 12:01:38', '3'),
(40, 59, 1, 1, '2018-10-17 12:15:52', '2018-10-17 12:15:54', '2'),
(41, 59, 1, 0, '2018-10-17 12:15:59', '2018-10-17 12:16:02', '3'),
(42, 64, 1, 2, '2018-10-18 14:23:17', '2018-10-18 14:23:32', '15'),
(43, 64, 1, 2, '2018-10-18 14:25:52', '2018-10-18 14:26:02', '10'),
(44, 64, 1, 2, '2018-10-18 15:06:18', '2018-10-18 15:06:24', '6'),
(45, 64, 1, 2, '2018-10-18 15:06:37', '2018-10-18 15:06:44', '7'),
(46, 64, 1, 1, '2018-10-18 15:38:25', '2018-10-18 15:38:30', '5'),
(47, 64, 1, 2, '2018-10-18 15:41:32', '2018-10-18 15:41:40', '8'),
(48, 64, 1, 1, '2018-10-18 15:43:36', '2018-10-18 15:43:43', '7'),
(49, 64, 1, 1, '2018-10-18 17:00:44', '2018-10-18 17:00:50', '6'),
(50, 64, 1, 1, '2018-10-18 17:23:32', '2018-10-18 17:23:37', '5'),
(51, 64, 1, 2, '2018-10-18 17:42:34', '2018-10-18 17:42:44', '10'),
(52, 64, 1, 2, '2018-10-18 17:56:30', '2018-10-18 17:56:40', '10'),
(53, 64, 1, 2, '2018-10-18 18:49:23', '2018-10-18 18:49:35', '12'),
(54, 64, 1, 1, '2018-10-18 18:58:07', '2018-10-18 18:58:21', '14'),
(55, 64, 1, 4, '2018-10-19 00:04:16', '2018-10-19 00:04:25', '9'),
(56, 64, 1, 1, '2018-10-19 00:04:32', '2018-10-19 00:04:42', '10'),
(57, 64, 1, 3, '2018-10-20 10:30:52', '2018-10-20 10:31:01', '9'),
(58, 64, 1, 3, '0000-00-00 00:00:00', '2018-10-20 18:07:24', '1540051644'),
(59, 64, 1, 0, '0000-00-00 00:00:00', '2018-10-20 19:51:17', '1540057877'),
(60, 64, 1, 0, '0000-00-00 00:00:00', '2018-10-20 20:59:38', '1540061978'),
(61, 64, 1, 0, '0000-00-00 00:00:00', '2018-10-20 21:50:35', '1540065035'),
(62, 66, 1, 0, '0000-00-00 00:00:00', '2018-10-21 11:00:42', '1540112442'),
(63, 64, 1, 0, '0000-00-00 00:00:00', '2018-10-21 11:53:16', '1540115596'),
(64, 64, 1, 0, '0000-00-00 00:00:00', '2018-10-21 11:56:25', '1540115785'),
(65, 64, 1, 0, '0000-00-00 00:00:00', '2018-10-21 11:57:45', '1540115865'),
(66, 64, 1, 0, '0000-00-00 00:00:00', '2018-10-21 12:17:46', '1540117066'),
(67, 64, 11, 0, '0000-00-00 00:00:00', '2018-10-21 12:41:10', '1540118470'),
(68, 64, 1, 0, '0000-00-00 00:00:00', '2018-10-21 17:32:39', '1540135959'),
(69, 1, 1, 0, '0000-00-00 00:00:00', '2018-10-21 22:45:36', '1540154736'),
(70, 2, 18, 0, '0000-00-00 00:00:00', '2018-10-21 23:00:22', '1540155622'),
(71, 5, 18, 0, '0000-00-00 00:00:00', '2018-10-21 23:46:23', '1540158383'),
(72, 3, 1, 0, '0000-00-00 00:00:00', '2018-10-22 23:06:04', '1540242364'),
(73, 6, 1, 0, '0000-00-00 00:00:00', '2018-10-23 02:39:43', '1540255183'),
(74, 6, 1, 0, '0000-00-00 00:00:00', '2018-10-23 03:05:02', '1540256702'),
(75, 3, 1, 0, '0000-00-00 00:00:00', '2018-10-23 12:40:48', '1540291248');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'webmaster', 'Adminstratorul site-ului - persoană care a proiectat și elaborat aplicația.'),
(2, 'supervizor', 'Managerul care poate vedea si edita toate modulele, submodulele, exercițiile, intrebările, etc.'),
(3, 'lucrator', 'Persoana care are acces doar la un singur modul, la toate tipurile de exerciții. Poate edita și adauga exerciții doar la un singur modul.');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `access` int(10) UNSIGNED DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `access`, `data`) VALUES
('0q7pvtuo17bj2j38ao8u9ci8qt', 1540291301, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:16:\"Manager Sintaxă\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:20:\"sintaxa@logodava.org\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),
('2qbk8svr85nt1p5qiruu97hn9u', 1540247211, 'urlRedirect|s:7:\"/admin/\";slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('3ijhgbt2lecl69pml2muer0hp1', 1540293429, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:10:\"Supervizor\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:23:\"supervizor@logodava.org\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"18\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}userModule|i:1;nonce|s:32:\"98745422bb49219b10505d065a8896c5\";'),
('6lkf8kcco0da57cnhvo56in9hd', 1540159790, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:10:\"Supervizor\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:23:\"supervizor@logodava.org\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"18\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('7ku9pnv5pooo3eounag5oj9loi', 1540242317, 'slim.flash|a:0:{}urlRedirect|s:12:\"/quiz/5/test\";user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('7tseedjok2gne5l7cis41s4j59', 1540253266, 'urlRedirect|s:7:\"/admin/\";slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('8m06co3v6iei34gjhchhhm5chs', 1540254578, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('ai7fg7l6vvlbh59g0qq10401k6', 1540254146, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('bhdtt7heakp0cne4iblhpn35ns', 1540160498, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:10:\"Supervizor\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:23:\"supervizor@logodava.org\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"18\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}userModule|s:1:\"1\";'),
('c02pm6vr706dqbhvc8mk9ereiu', 1540254151, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}userModule|i:1;'),
('cqv7c9tvq94b974e5prc7at3c9', 1540253206, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}userModule|s:1:\"1\";'),
('d5er5dljsd3jo723mu1dkuhsdh', 1540283341, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('dpe99knecbpb9o8ar2vqf97srl', 1540291222, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('fngcmje08qg20d8t0i6ge141pc', 1540254200, 'slim.flash|a:0:{}urlRedirect|s:12:\"/quiz/6/test\";user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('hga55pb0i3rl6156akmqg4nl0b', 1540257136, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('hnal2on55840vsubngtjlrgspm', 1540282882, 'slim.flash|a:0:{}'),
('igv1envq1vb186nrreh02vttat', 1540257161, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:16:\"Manager Sintaxă\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:20:\"sintaxa@logodava.org\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),
('k6frslb471mb8j36l709am1t14', 1540247152, 'urlRedirect|s:7:\"/admin/\";slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}userModule|i:1;'),
('km2srb72a4abccibki7ppv1mud', 1540250913, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('naio327uo0s9llf4a8540jemg8', 1540255295, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:16:\"Manager Sintaxă\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:20:\"sintaxa@logodava.org\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),
('nvtvnnr5992c1hnm51vhqsbt04', 1540282655, 'urlRedirect|s:6:\"/admin\";slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Manager Ortografie\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:23:\"ortografie@logodava.org\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"13\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('ok858q3pqsc0n7q2fm6g0438v8', 1540291342, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('pcs60o5gag9tro96susl5loa4h', 1540245983, 'slim.flash|a:0:{}urlRedirect|s:12:\"/quiz/5/test\";user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}userModule|s:1:\"6\";nonce|s:32:\"15077b17324934109288111386366a15\";num|i:1;score|b:0;correct|a:1:{i:1;a:1:{i:0;s:3:\"asa\";}}last|b:0;finished|s:2:\"no\";timetaken|a:2:{s:4:\"mins\";s:6:\"6 min \";s:4:\"secs\";s:6:\"04 sec\";}'),
('pdjbvlj8gaej4tadce0lnppev8', 1540257235, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:18:\"Manager Ortografie\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:23:\"ortografie@logodava.org\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"13\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('pl1ksp2j6sb99ur26bra39jnfi', 1540246146, 'urlRedirect|s:7:\"/admin/\";slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('q387o09a9nssjd425qhrehe7oo', 1540291210, 'slim.flash|a:0:{}urlRedirect|s:12:\"/quiz/3/test\";user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('rvpanab5t5v5vs913882dlp4uf', 1540292847, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:10:\"Supervizor\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:23:\"supervizor@logodava.org\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"18\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}'),
('smmfvbehgkop5sf3r8oj7mc6j0', 1540247476, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:16:\"Manager Sintaxă\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:20:\"sintaxa@logodava.org\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:2:\"11\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"3\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"8\";}'),
('sos1hfbrabdagoc76oco5e2ukn', 1540257875, 'slim.flash|a:0:{}'),
('vu2kt6m8vnma0mh058mfhsj5f6', 1540255920, 'slim.flash|a:0:{}user|O:31:\"SimpleQuiz\\Utils\\User\\AdminUser\":8:{s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0name\";s:13:\"Administrator\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0email\";s:22:\"bumbutudor10@gmail.com\";s:35:\"\0SimpleQuiz\\Utils\\Base\\User\0quizzes\";N;s:36:\"\0SimpleQuiz\\Utils\\Base\\User\0password\";N;s:30:\"\0SimpleQuiz\\Utils\\Base\\User\0id\";s:1:\"1\";s:33:\"\0SimpleQuiz\\Utils\\Base\\User\0level\";s:1:\"1\";s:32:\"\0SimpleQuiz\\Utils\\Base\\User\0role\";s:1:\"1\";s:40:\"\0SimpleQuiz\\Utils\\Base\\User\0moduleaccess\";s:1:\"1\";}');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(1) NOT NULL DEFAULT '0',
  `role` int(11) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `confirmhash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hashstamp` timestamp NULL DEFAULT NULL,
  `id_moduls` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `pass`, `email`, `level`, `role`, `confirmed`, `confirmhash`, `hashstamp`, `id_moduls`) VALUES
(1, 'Administrator', '$2y$10$LK9O0BesGScRkDWPnpVP3uGVcN6JqB/xsuFTq/xQFpNjsx2DvTOl2', 'bumbutudor10@gmail.com', 1, 1, 1, NULL, NULL, 1),
(11, 'Manager Sintaxă', '$2y$10$wsPmVLKiB2r8Ig2uO36I7uVJH/vPC1LKBQT/f2Q0.nHNWVsuzMiNW', 'sintaxa@logodava.org', 1, 3, 1, NULL, NULL, 8),
(13, 'Manager Ortografie', '$2y$10$zbYg4s0OQuVlR8wVwyGJ2O5zLn5luUCPTbPCreWOlZ6.bvqustTJK', 'ortografie@logodava.org', 1, 3, 1, NULL, NULL, 1),
(14, 'Manager Ortoepie', '$2y$10$VivgThEbPW30qvRtE6KZeezHqCJyeyqKO8TmM5v0QF5RhhDrFatpu', 'ortoepie@logodava.org', 1, 3, 1, NULL, NULL, 2),
(15, 'Manager Morfologie', '$2y$10$6EshiALtAQyOvWntj0Ojqu05LDNr24ZxOaJjbW6CPwM2jT07.AcF.', 'morfologie@logodava.org', 1, 3, 1, NULL, NULL, 4),
(16, 'Manager Lexic & Semantică', '$2y$10$MXCeGefljEMGeSTSX9Xk5e4LW.x8iS/I55NzOcl0.IYaClsZ6ePmG', 'lexicsem@logodava.org', 1, 3, 1, NULL, NULL, 16),
(17, 'Manager Punctuație', '$2y$10$HDMDK/ZzNja4Ugh8ycyiOuH1xzscCnZFJ3QkdtNOurw2CHbyI0uaW', 'punctuatie@logodava.org', 1, 3, 1, NULL, NULL, 32),
(18, 'Supervizor', '$2y$10$xaHeAMbAjUDkmfsGTO5Zd.evVLvffYjBTSXt1ybNkMhL4Mt4RVjmC', 'supervizor@logodava.org', 1, 1, 1, NULL, NULL, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `quiz_types`
--
ALTER TABLE `quiz_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quiz_users`
--
ALTER TABLE `quiz_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`id_subcategory`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
