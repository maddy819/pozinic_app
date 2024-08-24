-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 24, 2024 at 07:13 AM
-- Server version: 8.0.39-0ubuntu0.20.04.1
-- PHP Version: 7.4.3-4ubuntu2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poznic`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int UNSIGNED NOT NULL,
  `question_id` int NOT NULL,
  `answer` longtext NOT NULL,
  `answer_explanation` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `type`, `url`, `image`, `description`, `tags`, `visible`, `created_at`) VALUES
(1, '3 Tips to Achieve Your Goals', '3-tips-to-achieve-your-goals', 'Workout', 'https://wordpress-923561-3205616.cloudwaysapps.com/index.php/2023/02/08/3-tips-to-achieve-your-goals-ready/', '1676552362.png', '<p>Tons of people make really important goals about their health and fitness year round, and especially around the new year. Unfortunately studies show that only about 5% of people actually accomplish the goals they set each year!</p><p><br></p><p>So discuss three tips you can implement to make sure that you are part of that 5%.&nbsp;</p><p><br></p><p>Tip # 1: Make goals that are specific and process-based</p><p><br></p><p>Let\'s say you want to get a six pack. That\'s a great goal, but how can we turn it into a specific process-based one? Well, 80% of seeing your abs is actually based on diet and nutrition. So, you could choose to replace three meals a week with a salad.. That way, every week you know you\'re making healthy choices. Every week, you know you\'re keeping your goal and keeping your promise to yourself. That way, you\'re much more likely to actually stick with your objective and eventually get that six-pack you\'ve been waiting for, rather than basing your sense of success on how you look in the mirror each day.</p><p><br></p><p>Tip # 2: Make goals that are easy to remember or, even better, impossible to forget!&nbsp;</p><p><br></p><p>I love to stand on one leg while I brush my teeth. It sounds almost too simple, but I brush my teeth three times a day. That means three times a day, I keep my promise to myself. Three times a day, I meet my goal. Three times a day, I\'m working the stabilization muscles in my ankles, knees, and pelvis. That way, when I go for a hike, or do acrobatics, or lift weights, I can move more easily and lift heavier than I would if I didn\'t keep to this simple daily ritual.&nbsp;</p><p><br></p><p>Also, I have a pull-up bar in the doorway of my bedroom. I keep a medicine ball on the ground in the kitchen. Our piano bench is a workout bench, and my adjustable dumbbells live on the floor in our living room.&nbsp;</p><p><br></p><p>So when I\'m walking into my bedroom, I regularly stop to do a quick set of pull-ups or just hang for a few seconds. When I\'m waiting for my food to cook, I pick up the medicine ball and do a few quick reps instead of checking my phone, and with my bench and dumbbells in the living room, I am constantly reminded to pop in a few sets or even to do a full home workout when I don\'t have time to hit the gym.</p><p><br></p><p>That said, you don\'t have to spend any money. Remember that you can always fill an old paint can or a cooler with some sand or water to make some weights. You can put a note on your stove to remind yourself to do a set of push-ups while the water boils, or you can do a few quick bicep curls when it\'s time to feed the cats. Just keep it simple and keep it visible.</p><p><br></p><p>Tip # 3: Record your success</p><p><br></p><p>I\'m a huge fan of congratulating and rewarding yourself! The more you reward yourself for making good choices, the more you build that solid base of consistency and it gets easier and easier to keep your goals.&nbsp;</p><p><br></p><p>So I make a weekly chart and fill it in each time I keep a promise to myself. If you’d like to try this, yours can be a complex chart with multiple weekly goals, or it can be as simple as a single line with one little box for each day. Each check represents a moment where you\'re congratulating yourself, where you\'re reminding yourself that you kept that promise, and you\'re sticking to your goals of building self trust. The confidence that comes with it is like a muscle and if you work it and keep it strong, then getting that six-pack or any other goal you have, is going to be much, much easier.&nbsp;</p><p><br></p><p>So before we wrap up, take just one second right now to think about something you’ve been wanting to change and then think about how to turn that into a specific, process-based goal. Then… go get em!</p>', NULL, 1, '2023-02-16 12:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` int DEFAULT NULL,
  `featured_for` int DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `featured`, `featured_for`, `description`, `created_at`) VALUES
(1, 'Trending Exercises', 'trending-exercises', 1, 1, NULL, '2022-12-03 14:57:21'),
(2, 'Workouts', 'workouts', 1, 2, NULL, '2022-12-03 14:57:32'),
(3, 'Splits', 'splits', 1, 4, NULL, '2022-12-03 14:57:48'),
(4, 'Program', 'program', 1, 3, NULL, '2022-12-03 14:58:02'),
(5, 'Cool Splits for You', 'cool-splits-for-you', 1, 4, NULL, '2023-01-07 22:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `durations`
--

CREATE TABLE `durations` (
  `id` bigint UNSIGNED NOT NULL,
  `duration` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `durations`
--

INSERT INTO `durations` (`id`, `duration`, `created_at`) VALUES
(1, 15, '2022-12-02 12:05:55'),
(3, 45, '2022-12-02 12:06:23'),
(4, 10, '2022-12-02 12:06:43'),
(5, 20, '2022-12-02 12:06:51'),
(6, 30, '2022-12-02 12:06:58'),
(7, 7, '2022-12-05 12:11:22'),
(8, 40, '2022-12-05 12:11:57'),
(9, 60, '2022-12-05 12:12:04');

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

CREATE TABLE `equipments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipments`
--

INSERT INTO `equipments` (`id`, `name`, `slug`, `weight`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Bodyweight', 'bodyweight', 5, NULL, '2022-12-02 09:27:47', '2022-12-02 09:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_exercise`
--

CREATE TABLE `equipment_exercise` (
  `id` bigint UNSIGNED NOT NULL,
  `equipment_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipment_exercise`
--

INSERT INTO `equipment_exercise` (`id`, `equipment_id`, `exercise_id`, `created_at`) VALUES
(1, 1, 1, '2022-12-02 09:29:31'),
(2, 1, 2, '2022-12-02 09:29:32'),
(3, 1, 3, '2022-12-02 09:29:33'),
(4, 1, 1, '2022-12-02 09:30:26'),
(5, 1, 2, '2022-12-02 09:30:27'),
(6, 1, 3, '2022-12-02 09:30:27'),
(7, 1, 4, '2022-12-02 09:30:28'),
(8, 1, 1, '2022-12-02 09:32:13'),
(9, 1, 2, '2022-12-02 09:32:14'),
(10, 1, 3, '2022-12-02 09:32:14'),
(11, 1, 4, '2022-12-02 09:32:16'),
(12, 1, 5, '2022-12-02 09:32:17'),
(13, 1, 6, '2022-12-02 09:32:17'),
(14, 1, 7, '2022-12-02 09:32:18'),
(15, 1, 1, '2022-12-02 09:34:21'),
(16, 1, 2, '2022-12-02 09:34:22'),
(17, 1, 3, '2022-12-02 09:34:22'),
(18, 1, 4, '2022-12-02 09:34:23'),
(19, 1, 5, '2022-12-02 09:34:24'),
(20, 1, 6, '2022-12-02 09:34:24'),
(21, 1, 7, '2022-12-02 09:34:25'),
(22, 1, 8, '2022-12-02 09:34:26'),
(23, 1, 9, '2022-12-02 09:34:26'),
(24, 1, 10, '2022-12-02 09:34:27'),
(25, 1, 11, '2022-12-02 09:34:28'),
(26, 1, 12, '2022-12-02 09:34:29'),
(27, 1, 13, '2022-12-02 09:34:30'),
(28, 1, 14, '2022-12-02 09:34:30'),
(29, 1, 15, '2022-12-02 09:34:31'),
(30, 1, 16, '2022-12-02 09:34:32'),
(31, 1, 17, '2022-12-02 09:34:32'),
(32, 1, 18, '2022-12-02 09:34:33'),
(33, 1, 19, '2022-12-02 09:34:34'),
(34, 1, 20, '2022-12-02 09:34:35'),
(35, 1, 21, '2022-12-02 09:34:35'),
(36, 1, 22, '2022-12-02 09:34:36'),
(37, 1, 23, '2022-12-02 09:34:37'),
(38, 1, 24, '2022-12-02 09:34:38'),
(39, 1, 25, '2022-12-02 09:34:38'),
(40, 1, 26, '2022-12-02 09:34:39'),
(41, 1, 27, '2022-12-02 09:34:40'),
(42, 1, 1, '2022-12-02 09:36:05'),
(43, 1, 2, '2022-12-02 09:36:06'),
(44, 1, 3, '2022-12-02 09:36:06'),
(45, 1, 4, '2022-12-02 09:36:07'),
(46, 1, 5, '2022-12-02 09:36:08'),
(47, 1, 6, '2022-12-02 09:36:08'),
(48, 1, 7, '2022-12-02 09:36:09'),
(49, 1, 8, '2022-12-02 09:36:09'),
(50, 1, 9, '2022-12-02 09:36:10'),
(51, 1, 10, '2022-12-02 09:36:11'),
(52, 1, 11, '2022-12-02 09:36:11'),
(53, 1, 12, '2022-12-02 09:36:12'),
(54, 1, 13, '2022-12-02 09:36:12'),
(55, 1, 14, '2022-12-02 09:36:13'),
(56, 1, 15, '2022-12-02 09:36:13'),
(57, 1, 16, '2022-12-02 09:36:14'),
(58, 1, 17, '2022-12-02 09:36:14'),
(59, 1, 18, '2022-12-02 09:36:15'),
(60, 1, 19, '2022-12-02 09:36:15'),
(61, 1, 20, '2022-12-02 09:36:16'),
(62, 1, 21, '2022-12-02 09:36:17'),
(63, 1, 22, '2022-12-02 09:36:17'),
(64, 1, 23, '2022-12-02 09:36:18'),
(65, 1, 24, '2022-12-02 09:36:18'),
(66, 1, 25, '2022-12-02 09:36:19'),
(67, 1, 26, '2022-12-02 09:36:19'),
(68, 1, 27, '2022-12-02 09:36:20'),
(69, 1, 28, '2022-12-02 09:36:21'),
(70, 1, 29, '2022-12-02 09:36:22'),
(71, 1, 30, '2022-12-02 09:36:22'),
(72, 1, 31, '2022-12-02 09:36:23'),
(73, 1, 32, '2022-12-02 09:36:24'),
(74, 1, 33, '2022-12-02 09:36:25'),
(75, 1, 34, '2022-12-02 09:36:25'),
(76, 1, 35, '2022-12-02 09:36:26'),
(77, 1, 36, '2022-12-02 09:36:27'),
(78, 1, 37, '2022-12-02 09:36:28'),
(79, 1, 38, '2022-12-02 09:36:28'),
(80, 1, 39, '2022-12-02 09:36:29'),
(81, 1, 40, '2022-12-02 09:36:30'),
(82, 1, 41, '2022-12-02 09:36:30'),
(83, 1, 42, '2022-12-02 09:36:31'),
(84, 1, 43, '2022-12-02 09:36:32'),
(85, 1, 44, '2022-12-02 09:36:32'),
(86, 1, 45, '2022-12-02 09:36:33'),
(87, 1, 46, '2022-12-02 09:36:34'),
(88, 1, 47, '2022-12-02 09:36:34'),
(89, 1, 48, '2022-12-02 09:36:35'),
(90, 1, 49, '2022-12-02 09:36:36'),
(91, 1, 50, '2022-12-02 09:36:37'),
(92, 1, 51, '2022-12-02 09:36:37'),
(93, 1, 52, '2022-12-02 09:36:38'),
(94, 1, 53, '2022-12-02 09:36:39'),
(95, 1, 54, '2022-12-02 09:36:40'),
(96, 1, 55, '2022-12-02 09:36:40'),
(97, 1, 56, '2022-12-02 09:36:41'),
(98, 1, 57, '2022-12-02 09:36:42'),
(99, 1, 58, '2022-12-02 09:36:42'),
(100, 1, 59, '2022-12-02 09:36:43'),
(101, 1, 60, '2022-12-02 09:36:44'),
(102, 1, 61, '2022-12-02 09:36:44'),
(103, 1, 62, '2022-12-02 09:36:45'),
(104, 1, 63, '2022-12-02 09:36:46'),
(105, 1, 64, '2022-12-02 09:36:46'),
(106, 1, 65, '2022-12-02 09:36:47'),
(107, 1, 66, '2022-12-02 09:36:48'),
(108, 1, 67, '2022-12-02 09:36:48'),
(109, 1, 68, '2022-12-02 09:36:49'),
(110, 1, 69, '2022-12-02 09:36:50'),
(111, 1, 70, '2022-12-02 09:36:51'),
(112, 1, 71, '2022-12-02 09:36:51'),
(113, 1, 72, '2022-12-02 09:36:52'),
(114, 1, 73, '2022-12-02 09:36:53'),
(115, 1, 74, '2022-12-02 09:36:53'),
(116, 1, 75, '2022-12-02 09:36:54'),
(117, 1, 76, '2022-12-02 09:36:55'),
(118, 1, 77, '2022-12-02 09:36:55'),
(119, 1, 78, '2022-12-02 09:36:56'),
(120, 1, 79, '2022-12-02 09:36:57'),
(121, 1, 80, '2022-12-02 09:36:57'),
(122, 1, 81, '2022-12-02 09:36:58'),
(123, 1, 82, '2022-12-02 09:36:59'),
(124, 1, 83, '2022-12-02 09:36:59'),
(125, 1, 84, '2022-12-02 09:37:00'),
(126, 1, 85, '2022-12-02 09:37:01'),
(127, 1, 86, '2022-12-02 09:37:02'),
(128, 1, 87, '2022-12-02 09:37:02'),
(129, 1, 88, '2022-12-02 09:37:03'),
(130, 1, 89, '2022-12-02 09:37:04'),
(131, 1, 90, '2022-12-02 09:37:04'),
(132, 1, 91, '2022-12-02 09:37:05'),
(133, 1, 92, '2022-12-02 09:37:06'),
(134, 1, 93, '2022-12-02 09:37:07'),
(135, 1, 94, '2022-12-02 09:37:07'),
(136, 1, 95, '2022-12-02 09:37:08'),
(137, 1, 96, '2022-12-02 09:37:09'),
(138, 1, 97, '2022-12-02 09:37:09'),
(139, 1, 98, '2022-12-02 09:37:10'),
(140, 1, 99, '2022-12-02 09:37:11'),
(141, 1, 100, '2022-12-02 09:37:12'),
(142, 1, 101, '2022-12-02 09:37:12'),
(143, 1, 102, '2022-12-02 09:37:13'),
(144, 1, 103, '2022-12-02 09:37:14'),
(145, 1, 104, '2022-12-02 09:37:14'),
(146, 1, 105, '2022-12-02 09:37:15'),
(147, 1, 106, '2022-12-02 09:37:16'),
(148, 1, 107, '2022-12-02 09:37:17'),
(149, 1, 108, '2022-12-02 09:37:18'),
(150, 1, 109, '2022-12-02 09:37:18'),
(151, 1, 110, '2022-12-02 09:37:19'),
(152, 1, 111, '2022-12-02 09:37:20'),
(153, 1, 112, '2022-12-02 09:37:21'),
(154, 1, 113, '2022-12-02 09:37:21'),
(155, 1, 114, '2022-12-02 09:37:22'),
(156, 1, 115, '2022-12-02 09:37:23'),
(157, 1, 116, '2022-12-02 09:37:23'),
(158, 1, 117, '2022-12-02 09:37:24'),
(159, 1, 118, '2022-12-02 09:37:25'),
(160, 1, 119, '2022-12-02 09:37:25'),
(161, 1, 120, '2022-12-02 09:37:26'),
(162, 1, 121, '2022-12-02 09:37:27'),
(163, 1, 122, '2022-12-02 09:37:27'),
(164, 1, 123, '2022-12-02 09:37:28'),
(165, 1, 124, '2022-12-02 09:37:29'),
(166, 1, 125, '2022-12-02 09:37:30'),
(167, 1, 126, '2022-12-02 09:37:30'),
(168, 1, 127, '2022-12-02 09:37:31'),
(169, 1, 128, '2022-12-02 09:37:32'),
(170, 1, 129, '2022-12-02 09:37:32'),
(171, 1, 130, '2022-12-02 09:37:33'),
(172, 1, 131, '2022-12-02 09:37:34'),
(173, 1, 132, '2022-12-02 09:37:34'),
(174, 1, 133, '2022-12-02 09:37:35'),
(175, 1, 134, '2022-12-02 09:37:36'),
(176, 1, 135, '2022-12-02 09:37:37'),
(177, 1, 136, '2022-12-02 09:37:37'),
(178, 1, 137, '2022-12-02 09:37:38'),
(179, 1, 138, '2022-12-02 09:37:39'),
(180, 1, 139, '2022-12-02 09:37:39'),
(181, 1, 140, '2022-12-02 09:37:40'),
(182, 1, 141, '2022-12-02 09:37:41'),
(183, 1, 142, '2022-12-02 09:37:42'),
(184, 1, 143, '2022-12-02 09:37:43'),
(185, 1, 144, '2022-12-02 09:37:43'),
(186, 1, 145, '2022-12-02 09:37:44'),
(187, 1, 146, '2022-12-02 09:37:45'),
(188, 1, 147, '2022-12-02 09:37:46'),
(189, 1, 148, '2022-12-02 09:37:46'),
(190, 1, 149, '2022-12-02 09:37:47'),
(191, 1, 150, '2022-12-02 09:37:48'),
(192, 1, 151, '2022-12-02 09:37:49'),
(193, 1, 152, '2022-12-02 09:37:49'),
(194, 1, 153, '2022-12-02 09:37:50'),
(195, 1, 154, '2022-12-02 09:37:51'),
(196, 1, 155, '2022-12-02 09:37:51'),
(197, 1, 156, '2022-12-02 09:37:52'),
(198, 1, 157, '2022-12-02 09:37:53'),
(199, 1, 158, '2022-12-02 09:37:54'),
(200, 1, 159, '2022-12-02 09:37:54'),
(201, 1, 160, '2022-12-02 09:37:55'),
(202, 1, 161, '2022-12-02 09:37:56'),
(203, 1, 162, '2022-12-02 09:37:57'),
(204, 1, 163, '2022-12-02 09:37:57'),
(205, 1, 164, '2022-12-02 09:37:58'),
(206, 1, 165, '2022-12-02 09:37:59'),
(207, 1, 166, '2022-12-02 09:37:59'),
(208, 1, 167, '2022-12-02 09:38:00'),
(209, 1, 168, '2022-12-02 09:38:01'),
(210, 1, 169, '2022-12-02 09:38:02'),
(211, 1, 170, '2022-12-02 09:38:02'),
(212, 1, 171, '2022-12-02 09:38:03'),
(213, 1, 172, '2022-12-02 09:38:04'),
(214, 1, 173, '2022-12-02 09:38:04'),
(215, 1, 174, '2022-12-02 09:38:05'),
(216, 1, 175, '2022-12-02 09:38:06'),
(217, 1, 176, '2022-12-02 09:38:07'),
(218, 1, 177, '2022-12-02 09:38:07'),
(219, 1, 178, '2022-12-02 09:38:08'),
(220, 1, 179, '2022-12-02 09:38:09'),
(221, 1, 180, '2022-12-02 09:38:10'),
(222, 1, 181, '2022-12-02 09:38:10'),
(223, 1, 182, '2022-12-02 09:38:11'),
(224, 1, 183, '2022-12-02 09:38:12'),
(225, 1, 184, '2022-12-02 09:38:12'),
(226, 1, 185, '2022-12-02 09:38:13'),
(227, 1, 186, '2022-12-02 09:38:14'),
(228, 1, 187, '2022-12-02 09:38:15'),
(229, 1, 188, '2022-12-02 09:38:16'),
(230, 1, 189, '2022-12-02 09:38:17'),
(231, 1, 190, '2022-12-02 09:38:17'),
(232, 1, 191, '2022-12-02 09:38:18'),
(233, 1, 192, '2022-12-02 09:38:19'),
(234, 1, 193, '2022-12-02 09:38:20'),
(235, 1, 194, '2022-12-02 09:38:21'),
(236, 1, 195, '2022-12-02 09:38:21'),
(237, 1, 196, '2022-12-02 09:38:22'),
(238, 1, 197, '2022-12-02 09:38:23'),
(239, 1, 198, '2022-12-02 09:38:23'),
(240, 1, 199, '2022-12-02 09:38:24'),
(241, 1, 200, '2022-12-02 09:38:25'),
(242, 1, 201, '2022-12-02 09:38:26'),
(243, 1, 202, '2022-12-02 09:38:26'),
(244, 1, 203, '2022-12-02 09:38:27'),
(245, 1, 204, '2022-12-02 09:38:28'),
(246, 1, 205, '2022-12-02 09:38:28'),
(247, 1, 206, '2022-12-02 09:38:29'),
(248, 1, 207, '2022-12-02 09:38:30'),
(249, 1, 208, '2022-12-02 09:38:31'),
(250, 1, 209, '2022-12-02 09:38:31'),
(251, 1, 210, '2022-12-02 09:38:32'),
(252, 1, 211, '2022-12-02 09:38:33'),
(253, 1, 212, '2022-12-02 09:38:33'),
(254, 1, 213, '2022-12-02 09:38:34'),
(255, 1, 214, '2022-12-02 09:38:35'),
(256, 1, 215, '2022-12-02 09:38:36'),
(257, 1, 216, '2022-12-02 09:38:37'),
(258, 1, 217, '2022-12-02 09:38:37'),
(259, 1, 218, '2022-12-02 09:38:38'),
(260, 1, 219, '2022-12-02 09:38:39'),
(261, 1, 220, '2022-12-02 09:38:39'),
(262, 1, 221, '2022-12-02 09:38:40'),
(263, 1, 222, '2022-12-02 09:38:41'),
(264, 1, 223, '2022-12-02 09:38:42'),
(265, 1, 224, '2022-12-02 09:38:42'),
(266, 1, 225, '2022-12-02 09:38:43'),
(267, 1, 226, '2022-12-02 09:38:44'),
(268, 1, 227, '2022-12-02 09:38:44'),
(269, 1, 228, '2022-12-02 09:38:45'),
(270, 1, 229, '2022-12-02 09:38:45'),
(271, 1, 230, '2022-12-02 09:38:46'),
(272, 1, 231, '2022-12-02 09:38:47'),
(273, 1, 232, '2022-12-02 09:38:47'),
(274, 1, 233, '2022-12-02 09:38:48'),
(275, 1, 234, '2022-12-02 09:38:49'),
(276, 1, 235, '2022-12-02 09:38:50'),
(277, 1, 236, '2022-12-02 09:38:50'),
(278, 1, 237, '2022-12-02 09:38:51'),
(279, 1, 238, '2022-12-02 09:38:52'),
(280, 1, 239, '2022-12-02 09:38:53'),
(281, 1, 240, '2022-12-02 09:38:53'),
(282, 1, 241, '2022-12-02 09:38:54'),
(283, 1, 242, '2022-12-02 09:38:55'),
(284, 1, 243, '2022-12-02 09:38:56'),
(285, 1, 244, '2022-12-02 09:38:56'),
(286, 1, 245, '2022-12-02 09:38:57'),
(287, 1, 246, '2022-12-02 09:38:58'),
(288, 1, 247, '2022-12-02 09:38:58'),
(289, 1, 248, '2022-12-02 09:38:59'),
(290, 1, 249, '2022-12-02 09:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_program`
--

CREATE TABLE `equipment_program` (
  `id` bigint UNSIGNED NOT NULL,
  `equipment_id` int NOT NULL,
  `program_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipment_program`
--

INSERT INTO `equipment_program` (`id`, `equipment_id`, `program_id`, `created_at`) VALUES
(5, 1, 5, '2022-12-05 12:12:14'),
(6, 1, 6, '2022-12-05 12:12:14'),
(7, 1, 7, '2022-12-05 12:12:14'),
(8, 1, 8, '2022-12-05 12:12:14'),
(9, 1, 9, '2022-12-05 12:12:14'),
(10, 1, 10, '2022-12-05 12:12:14'),
(11, 1, 11, '2022-12-05 12:12:14'),
(12, 1, 12, '2022-12-05 12:12:14'),
(13, 1, 13, '2022-12-05 12:12:14'),
(14, 1, 14, '2022-12-05 12:12:14'),
(15, 1, 15, '2022-12-05 12:12:14'),
(16, 1, 16, '2022-12-05 12:12:14'),
(17, 1, 17, '2022-12-05 12:12:14'),
(18, 1, 18, '2022-12-05 12:12:14'),
(19, 1, 19, '2022-12-05 12:12:14'),
(20, 1, 20, '2022-12-05 12:12:14'),
(21, 1, 21, '2022-12-05 12:12:14'),
(22, 1, 22, '2022-12-05 12:12:14'),
(23, 1, 23, '2022-12-05 12:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_split`
--

CREATE TABLE `equipment_split` (
  `id` bigint UNSIGNED NOT NULL,
  `equipment_id` int NOT NULL,
  `split_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipment_split`
--

INSERT INTO `equipment_split` (`id`, `equipment_id`, `split_id`, `created_at`) VALUES
(1, 1, 1, '2022-12-02 12:09:00'),
(2, 1, 2, '2022-12-02 12:09:00'),
(3, 1, 3, '2022-12-02 12:09:00'),
(4, 1, 4, '2022-12-02 12:09:00'),
(5, 1, 5, '2022-12-02 12:09:00'),
(6, 1, 6, '2022-12-02 12:09:00'),
(7, 1, 7, '2022-12-02 12:09:00'),
(8, 1, 8, '2022-12-02 12:09:00'),
(9, 1, 9, '2022-12-02 12:09:00'),
(10, 1, 10, '2022-12-02 12:09:00'),
(11, 1, 11, '2022-12-02 12:09:00'),
(12, 1, 12, '2022-12-02 12:09:00'),
(13, 1, 13, '2022-12-02 12:09:00'),
(14, 1, 14, '2022-12-02 12:09:00'),
(15, 1, 15, '2022-12-02 12:09:00'),
(16, 1, 16, '2022-12-02 12:09:00'),
(17, 1, 17, '2022-12-02 12:09:00'),
(18, 1, 18, '2022-12-02 12:09:00'),
(19, 1, 19, '2022-12-02 12:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_streches`
--

CREATE TABLE `equipment_streches` (
  `id` bigint UNSIGNED NOT NULL,
  `equipment_id` int NOT NULL,
  `strech_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_workouts`
--

CREATE TABLE `equipment_workouts` (
  `id` bigint UNSIGNED NOT NULL,
  `equipment_id` int NOT NULL,
  `workout_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipment_workouts`
--

INSERT INTO `equipment_workouts` (`id`, `equipment_id`, `workout_id`, `created_at`) VALUES
(110, 1, 110, '2022-12-05 14:01:53'),
(111, 1, 111, '2022-12-05 14:01:53'),
(112, 1, 112, '2022-12-05 14:01:53'),
(113, 1, 113, '2022-12-05 14:01:53'),
(114, 1, 114, '2022-12-05 14:01:53'),
(115, 1, 115, '2022-12-05 14:01:53'),
(116, 1, 116, '2022-12-05 14:01:53'),
(117, 1, 117, '2022-12-05 14:01:53'),
(118, 1, 118, '2022-12-05 14:01:53'),
(119, 1, 119, '2022-12-05 14:01:53'),
(120, 1, 120, '2022-12-05 14:01:53'),
(121, 1, 121, '2022-12-05 14:01:53'),
(122, 1, 122, '2022-12-05 14:01:53'),
(123, 1, 123, '2022-12-05 14:01:53'),
(124, 1, 124, '2022-12-05 14:01:53'),
(125, 1, 125, '2022-12-05 14:01:53'),
(126, 1, 126, '2022-12-05 14:01:53'),
(127, 1, 127, '2022-12-05 14:01:53'),
(128, 1, 128, '2022-12-05 14:01:53'),
(129, 1, 129, '2022-12-05 14:01:53'),
(130, 1, 130, '2022-12-05 14:01:53'),
(131, 1, 131, '2022-12-05 14:01:53'),
(132, 1, 132, '2022-12-05 14:01:53'),
(133, 1, 133, '2022-12-05 14:01:53'),
(134, 1, 134, '2022-12-05 14:01:53'),
(135, 1, 135, '2022-12-05 14:01:53'),
(136, 1, 136, '2022-12-05 14:01:53'),
(137, 1, 137, '2022-12-05 14:01:53'),
(138, 1, 138, '2022-12-05 14:01:53'),
(139, 1, 139, '2022-12-05 14:01:53'),
(140, 1, 140, '2022-12-05 14:01:53'),
(141, 1, 141, '2022-12-05 14:01:53'),
(142, 1, 142, '2022-12-05 14:01:53'),
(143, 1, 143, '2022-12-05 14:01:53'),
(144, 1, 144, '2022-12-05 14:01:53'),
(145, 1, 145, '2022-12-05 14:01:53'),
(146, 1, 146, '2022-12-05 14:01:53'),
(147, 1, 147, '2022-12-05 14:01:53'),
(148, 1, 148, '2022-12-05 14:01:53'),
(149, 1, 149, '2022-12-05 14:01:53'),
(150, 1, 150, '2022-12-05 14:01:53'),
(151, 1, 151, '2022-12-05 14:01:53'),
(152, 1, 152, '2022-12-05 14:01:53'),
(153, 1, 153, '2022-12-05 14:01:53'),
(154, 1, 154, '2022-12-05 14:01:53'),
(155, 1, 155, '2022-12-05 14:01:53'),
(156, 1, 156, '2022-12-05 14:01:53'),
(157, 1, 157, '2022-12-05 14:01:54'),
(158, 1, 158, '2022-12-05 14:01:54'),
(159, 1, 159, '2022-12-05 14:01:54'),
(160, 1, 160, '2022-12-05 14:01:54'),
(161, 1, 161, '2022-12-05 14:01:54'),
(162, 1, 162, '2022-12-05 14:01:54'),
(163, 1, 163, '2022-12-05 14:01:54'),
(164, 1, 164, '2022-12-05 14:01:54'),
(165, 1, 165, '2022-12-05 14:01:54'),
(166, 1, 166, '2022-12-05 14:01:54'),
(167, 1, 167, '2022-12-05 14:01:54'),
(168, 1, 168, '2022-12-05 14:01:54'),
(169, 1, 169, '2022-12-05 14:01:54'),
(170, 1, 170, '2022-12-05 14:01:54'),
(171, 1, 171, '2022-12-05 14:01:54'),
(172, 1, 172, '2022-12-05 14:01:54'),
(173, 1, 173, '2022-12-05 14:01:54'),
(174, 1, 174, '2022-12-05 14:01:54'),
(175, 1, 175, '2022-12-05 14:01:54'),
(176, 1, 176, '2022-12-05 14:01:54'),
(177, 1, 177, '2022-12-05 14:01:54'),
(178, 1, 178, '2022-12-05 14:01:54'),
(179, 1, 179, '2022-12-05 14:01:54'),
(180, 1, 180, '2022-12-05 14:01:54'),
(181, 1, 181, '2022-12-05 14:01:54'),
(182, 1, 1, '2022-12-07 17:21:24'),
(183, 1, 2, '2022-12-07 17:21:24'),
(184, 1, 3, '2022-12-07 17:21:24'),
(185, 1, 4, '2022-12-07 17:21:24'),
(186, 1, 5, '2022-12-07 17:21:24'),
(187, 1, 6, '2022-12-07 17:21:24'),
(188, 1, 7, '2022-12-07 17:21:24'),
(189, 1, 8, '2022-12-07 17:21:24'),
(190, 1, 9, '2022-12-07 17:21:24'),
(191, 1, 10, '2022-12-07 17:21:24'),
(192, 1, 11, '2022-12-07 17:21:24'),
(193, 1, 12, '2022-12-07 17:21:24'),
(194, 1, 13, '2022-12-07 17:21:24'),
(195, 1, 14, '2022-12-07 17:21:24'),
(196, 1, 15, '2022-12-07 17:21:24'),
(197, 1, 16, '2022-12-07 17:21:24'),
(198, 1, 17, '2022-12-07 17:21:24'),
(199, 1, 18, '2022-12-07 17:21:24'),
(200, 1, 19, '2022-12-07 17:21:24'),
(201, 1, 20, '2022-12-07 17:21:25'),
(202, 1, 21, '2022-12-07 17:21:25'),
(203, 1, 22, '2022-12-07 17:21:25'),
(204, 1, 23, '2022-12-07 17:21:25'),
(205, 1, 24, '2022-12-07 17:21:25'),
(206, 1, 25, '2022-12-07 17:21:25'),
(207, 1, 26, '2022-12-07 17:21:25'),
(208, 1, 27, '2022-12-07 17:21:25'),
(209, 1, 28, '2022-12-07 17:21:25'),
(210, 1, 29, '2022-12-07 17:21:25'),
(211, 1, 30, '2022-12-07 17:21:25'),
(212, 1, 31, '2022-12-07 17:21:25'),
(213, 1, 32, '2022-12-07 17:21:25'),
(214, 1, 33, '2022-12-07 17:21:25'),
(215, 1, 34, '2022-12-07 17:21:25'),
(216, 1, 35, '2022-12-07 17:21:25'),
(217, 1, 36, '2022-12-07 17:21:25'),
(218, 1, 37, '2022-12-07 17:21:25'),
(219, 1, 38, '2022-12-07 17:21:25'),
(220, 1, 39, '2022-12-07 17:21:25'),
(221, 1, 40, '2022-12-07 17:21:25'),
(222, 1, 41, '2022-12-07 17:21:25'),
(223, 1, 42, '2022-12-07 17:21:25'),
(224, 1, 43, '2022-12-07 17:21:25'),
(225, 1, 44, '2022-12-07 17:21:25'),
(226, 1, 45, '2022-12-07 17:21:25'),
(227, 1, 46, '2022-12-07 17:21:25'),
(228, 1, 47, '2022-12-07 17:21:25'),
(229, 1, 48, '2022-12-07 17:21:25'),
(230, 1, 49, '2022-12-07 17:21:25'),
(231, 1, 50, '2022-12-07 17:21:25'),
(232, 1, 51, '2022-12-07 17:21:25'),
(233, 1, 52, '2022-12-07 17:21:25'),
(234, 1, 53, '2022-12-07 17:21:25'),
(235, 1, 54, '2022-12-07 17:21:25'),
(236, 1, 55, '2022-12-07 17:21:25'),
(237, 1, 56, '2022-12-07 17:21:25'),
(238, 1, 57, '2022-12-07 17:21:25'),
(239, 1, 58, '2022-12-07 17:21:25'),
(240, 1, 59, '2022-12-07 17:21:25'),
(241, 1, 60, '2022-12-07 17:21:25'),
(242, 1, 61, '2022-12-07 17:21:25'),
(243, 1, 62, '2022-12-07 17:21:25'),
(244, 1, 63, '2022-12-07 17:21:25'),
(245, 1, 64, '2022-12-07 17:21:25'),
(246, 1, 65, '2022-12-07 17:21:25'),
(247, 1, 66, '2022-12-07 17:21:25'),
(248, 1, 67, '2022-12-07 17:21:25'),
(249, 1, 68, '2022-12-07 17:21:25'),
(250, 1, 69, '2022-12-07 17:21:25'),
(251, 1, 70, '2022-12-07 17:21:25'),
(252, 1, 71, '2022-12-07 17:21:25'),
(253, 1, 72, '2022-12-07 17:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `based_on` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `instructions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `breath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tip_video` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tip_video_thumbnail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video_link` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reps` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `focus_area` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `specific_muscles` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `good_for` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `level` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `title`, `based_on`, `code`, `slug`, `category_id`, `duration`, `instructions`, `breath`, `description`, `tip_video`, `tip_video_thumbnail`, `video_link`, `reps`, `focus_area`, `specific_muscles`, `good_for`, `type`, `Notes`, `level`, `image`, `tags`, `created_at`) VALUES
(1, '1 Arm Hip Thrust', 'Reps', 'POZEX1', '1-arm-hip-thrust', 1, NULL, '<ul><li>As you push your hips up, also drive your knees away toward your feet. This will help to keep the longest line possible through the spine.</li><li>At the bottom of the movement you should be looking forward between your knees. At the top you should be looking sideways (not up or down).</li><li>In the beginning, take your time in the top position to really feel the extension from hand to hand and from the top of your head to your knees. As you get into the movement, you can increase the speed and flow, but still try to keep that sense of expanding at the top of each rep.</li></ul>', '<ul><li>Inhale down, exhale up. Use a light, controlled exhale to encourage stability through the torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600558591.hd.mp4?s=087ed57f96478784721c8ef7bfdc3efac0462569&profile_id=175', 'https://i.vimeocdn.com/video/1236390361-6470c9b5b8c957fa7955ff22832cd642b73196b954ff07d9ba6f24f3de9bdc55-d_295x166', 'https://player.vimeo.com/external/613323088.hd.mp4?s=83bf406e10fb26dac31129d586e8a3826c7ea304&profile_id=175', NULL, 'legs,core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', '1669974555.jpg', NULL, '2022-12-02 09:36:05'),
(2, '1 Arm Plank', 'Duration', 'POZEX2', '1-arm-plank', 1, 30, '<ul><li>Reach out with your fingertips to keep the longest line possible from fingertips to heels.</li><li>Keep your weight over the pads of the second and third fingers. Actively push through your fingertips to avoid having too much pressure on your wrists.</li><li>Rather than thinking about contracting your abs, try to lengthen your spine and feel energy expanding out of your lower back.</li><li>Look down and just slightly in front of you (not forward) to keep length through the back of the neck</li></ul>', '<ul><li>Continue breathing throughout the plank. Use a light, controlled exhale to encourage stability through the torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600897383.hd.mp4?s=246fbf15a973e9149f9a6310351b6a816c22b6fc&profile_id=175', 'https://i.vimeocdn.com/video/1236793997-e3824f9f6292013815979374fea2a3e3af21fcafd4dfb4ac4a91c280d83ff984-d_640', 'https://player.vimeo.com/external/613858440.hd.mp4?s=76242fdce8635fb2d14fa139ce7eb670186f20f7&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669974571.jpg', NULL, '2022-12-02 09:36:06'),
(3, '1 Leg Alternating Push-Ups', 'Reps', 'POZEX3', '1-leg-alternating-push-ups', NULL, NULL, '<ul><li>Try to keep your body as still as possible as you switch legs on each rep. At first, focus on keeping the transition smooth and slow. Then increase the speed as much as you can without causing extra tension or wobble.</li><li>Rather than thinking about lifting your leg, think about reaching away with your toes to keep the leg lengthened and knee straight.</li><li>You can keep your hands spaced slightly wider to focus more on the pecs, or keep them close to the torso with the elbows in tight to focus more on the triceps.</li></ul>', '<ul><li>Inhale down, exhale up. Use a light, controlled exhale to encourage stability through the torso.</li></ul>', NULL, 'https://player.vimeo.com/external/604884132.hd.mp4?s=f9031e9ae9093b7cc0f54d98f8b9e38328bc40ee&profile_id=175', 'https://i.vimeocdn.com/video/1241292690-8cd34ee14b49cdc68aafa66a2f7a2874dfb5b73146029820c746204071f23e07-d_640', 'https://player.vimeo.com/external/613858492.hd.mp4?s=4bf3ab56ff0f0485b7da7fa2d2a1903bd51e8749&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669974587.jpg', NULL, '2022-12-02 09:36:06'),
(4, '1 Leg Bent Over Towel Row', 'Reps', 'POZEX4', '1-leg-bent-over-towel-row', NULL, NULL, '<ul><li>You can perform this with a towel, rolled up t-shirt, rope, or anything else that won’t be damaged by you trying to rip it in half. Because your goal is to try to rip it in half the entire time.</li><li>As you descend into position, drive your tailbone back to keep length in your lower back, and allow your standing knee to bend to accommodate that movement.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears.</li><li>You can use an overhand grip (palms down) to target the upper back or an underhand grip (palms up) to target more of the lower lats. I recommend trying them both.</li></ul>', '<ul><li>Inhale out, exhale in. Use a light, controlled exhale to encourage stability through your torso and to allow you to keep a constant pulling tension between the arms.</li></ul>', NULL, 'https://player.vimeo.com/external/629031875.hd.mp4?s=c518bab5fe39644ace1d6bbf792ea70f7aafbf9a&profile_id=175', 'https://i.vimeocdn.com/video/1271302644-8cab31d75812d113343817291b975e59fcefae54747103fb6_640', 'https://player.vimeo.com/external/620355712.hd.mp4?s=68919d184873eb52708e7803f1186eb670a6c7fa&profile_id=175', NULL, 'back', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669974604.jpg', NULL, '2022-12-02 09:36:07'),
(5, '1 Leg Deadlift', 'Reps', 'POZEX5', '1-leg-deadlift', NULL, NULL, '<ul><li>Allow your gaze to move smoothly down as you descend into the deadlift, in order to keep a long line through the back of the neck.</li><li>Begin the movement by driving your tailbone back to keep length in your lower back, and allow your standing knee to bend slightly to accommodate that movement.</li><li>Only descend as low as you can with a long spine, and no hunching in your lower back.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears.</li></ul>', '<ul><li>Inhale down, exhale up. Notice how the inhalation slightly expands the chest and helps keep a small, healthy curve in the lumbar spine, while the exhale helps stabilize the core as you push back to standing.</li></ul>', NULL, 'https://player.vimeo.com/external/628381383.hd.mp4?s=ce95da7c3eeb4efef6da95c5c707ac29e1a72c0f&profile_id=175', 'https://i.vimeocdn.com/video/1270671264-2dd7a1f219b71f310a902b48950616bef03e03791a4c0a202_640', 'https://player.vimeo.com/external/624190507.hd.mp4?s=1c9bd89a3e7d8bab1c9e87cbaf1b779d93fd45d9&profile_id=175', NULL, 'legs,back,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669974623.jpg', NULL, '2022-12-02 09:36:08'),
(6, '1 Leg Deadlift with Isometric Towel Pull', 'Reps', 'POZEX6', '1-leg-deadlift-with-isometric-towel-pull', NULL, NULL, '<ul><li>You can perform this with a towel, rolled up t-shirt, rope, or anything else that won’t be damaged by you trying to rip it in half. Because your goal is to try to rip it in half the entire time.</li><li>As you descend, drive your tailbone back to keep length in your lower back, and allow your standing knee to bend slightly to accommodate that movement.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears.</li><li>Keep your elbows slightly bent, at the same angle, the entire time. It should feel like you’re hugging a huge tree!</li></ul>', '<ul><li>Continue breathing throughout the movement. Use a light, controlled exhale to encourage stability through the torso.</li></ul>', NULL, 'https://player.vimeo.com/external/625720909.hd.mp4?s=ec42005526fa5f9455841eedf2864e5a21caa1e9&profile_id=175', 'https://i.vimeocdn.com/video/1268094161-74f51d402bfb97e7638a810505e0b3411ab043d8dd25dc4ed_640', 'https://player.vimeo.com/external/624188827.hd.mp4?s=7cf36b3fcb44b97e1d8f0a1755ff74507c32c15a&profile_id=175', NULL, 'back,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669974645.jpg', NULL, '2022-12-02 09:36:08'),
(7, '1 Leg Deadlift with Towel Row', 'Reps', 'POZEX7', '1-leg-deadlift-with-towel-row', NULL, NULL, '<ul><li>Allow your gaze to move smoothly down as you descend into the deadlift, in order to keep a long line through the back of your neck.</li><li>You can perform this with a towel, rolled up t-shirt, rope, or anything else that won’t be damaged by you trying to rip it in half. Because your goal is to try to rip it in half the entire time.</li><li>As you descend, drive your tailbone back to keep length in your lower back, and just allow your standing knee to bend slightly to accommodate that movement.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears.</li><li>You can use an overhand grip (palms down) to target the upper back or an underhand grip (palms up) to target more of the lower lats. Both are great options</li></ul>', '<ul><li>Continue breathing throughout the movement. Use a light, controlled exhale to encourage stability through the torso.</li></ul>', NULL, 'https://player.vimeo.com/external/625723033.hd.mp4?s=d50160a46e13cf5abb606615b81c739b66e7eaaa&profile_id=175', 'https://i.vimeocdn.com/video/1268094166-831318ed3dab18e452c1b46bfd3c2f5a0eac52f0c085a3429_640', 'https://player.vimeo.com/external/624189701.hd.mp4?s=993576706038dd6f79736ba69399744d2fc55601&profile_id=175', NULL, 'back,glutes', NULL, 'building-mass', 'exercise', NULL, 'Advanced', '1669974739.jpg', NULL, '2022-12-02 09:36:09'),
(8, '1 Leg Knee Pull', 'Reps', 'POZEX8', '1-leg-knee-pull', NULL, NULL, '<ul><li>Once you’ve wrapped your hands around your knee, feel your head floating up and your chest expanding open as much as possible before your first pull. Then try to keep that openness throughout the exercise.</li><li>Keep a slight bend in your elbows the entire time.</li><li>To keep a long spine, don’t engage your core. Instead, think about gently pushing your belly forward toward your bent leg to encourage a small, healthy curve in the lumbar spine.</li><li>If you don’t yet have the flexibility to hold your knee, you can wrap a strap or towel around your knee instead.</li></ul>', '<ul><li>Inhale as you stand calmly in balance. Exhale as you push your knee out as hard as you can and fight that push by pulling in with your arms and back. Use a strong, controlled exhale to encourage stability and strength.</li></ul>', NULL, 'https://player.vimeo.com/progressive_redirect/playback/673638927/rendition/1080p?loc=external&signature=0b2bd035a79874cca74fbd7bc5f5fa23bc3eb2a688ab08063fd3698925bf8da3', 'https://i.vimeocdn.com/video/1268094166-831318ed3dab18e452c1b46bfd3c2f5a0eac52f0c085a3429_640', 'https://player.vimeo.com/external/620355970.hd.mp4?s=a48de21ef898d06a4c270a9d05cbc99ae364c068&profile_id=175', NULL, 'back,biceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:36:09'),
(9, '1 Leg Plank', 'Duration', 'POZEX9', '1-leg-plank', NULL, NULL, '<ul><li>Don’t lift your back leg. Instead, reach back with your toes and keep the longest line possible from the top of your head to the tips of your toes.</li><li>Keep your weight over the pads of the second and third fingers. Actively push through your fingertips to avoid having too much pressure on the wrists.</li><li>Rather than thinking about contracting your abs, try to lengthen your spine and feel energy expanding out of your lower back.</li><li>Look down and just slightly in front of you (not forward) to keep length through the back of the neck.</li></ul>', '<ul><li>Continue breathing throughout the plank. Use a light, controlled exhale to encourage stability through the torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600895673.hd.mp4?s=ee978bedd68ab7d968253cd5d4be755576adca5b&profile_id=175', 'https://i.vimeocdn.com/video/1236791768-d08f7c1c8ed9ee8ce2a603f1757dfcc4fc41b4abdd4ab58c0edb039a22c6ed37-d_640', 'https://player.vimeo.com/external/613858531.hd.mp4?s=5a46aa5fd08c1a7b208b8871cede63c0083a9094&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669974785.jpg', NULL, '2022-12-02 09:36:10'),
(10, '1 leg Push-Ups on Knees', 'Reps', 'POZEX10', '1-leg-push-ups-on-knees', NULL, NULL, '<ul><li>Don’t try to lift your back leg too high. The goal is to reach back through the toes and keep the lower back long and relaxed.</li><li>Keep your elbows between a 30-45° angle, choosing the angle that is most comfortable for your body.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears.</li><li>Gently engage your core to lengthen your spine. Try To keep the longest line possible from your knees to the top of your head.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604879208.hd.mp4?s=3e956a0f1d96a9ed7c298bef36d87d4c4a4f853c&profile_id=175', 'https://i.vimeocdn.com/video/1241286825-41ecf7daafbb718c100090d335b6896ce6e4a348fe61ed54e1fbfedff2d2caca-d_640', 'https://player.vimeo.com/external/613858554.hd.mp4?s=3cf88701cdc187fb51d97a4cc09ee90aab7d0d42&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner', '1669974815.jpg', NULL, '2022-12-02 09:36:11'),
(11, '1 Leg Reaching Push-Ups', 'Reps', 'POZEX11', '1-leg-reaching-push-ups', NULL, NULL, '<ul><li>Instead of “lifting” your leg, think of reaching up and back as far as you can with your toes. This will help keep your leg extended and keep pressure off the lower back (You should have a small curve in the lower back during this exercise).</li><li>Keep your chest wide and your shoulders relaxed down away from your ears throughout the entire exercise.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on your wrists.</li><li>To focus the work on your pecs (chest), keep your elbows between a 30-45° angle from your torso. To focus more on your triceps, tuck your elbows in tight against your sides.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604884798.hd.mp4?s=75b9b667d6882f604d8497346b56d98d54429b83&profile_id=175', 'https://i.vimeocdn.com/video/1241292928-46818e7e3bca7b27e1abdd58556d89454b0bc6c2892bb9de2bbe4385cde692c7-d_640', 'https://player.vimeo.com/external/613858632.hd.mp4?s=39c47a0315bb441d50ec89f1c7f53042e0538d22&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669974840.jpg', NULL, '2022-12-02 09:36:11'),
(12, '1 Leg Reaching Push-Ups - Alternating', 'Reps', 'POZEX12', '1-leg-reaching-push-ups-alternating', NULL, NULL, '<ul><li>Instead of “lifting” your leg, think of reaching up and back as far as you can with your toes. This will help keep your leg extended and keep pressure off the lower back (You should have a small curve in the lower back during this exercise).</li><li>Keep your body as still and quiet as possible as you change legs on each rep.</li><li>To focus the work on your pecs (chest), keep your elbows between a 30-45° angle from your torso. To focus more on your triceps, tuck your elbows in tight against your sides.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604901738.hd.mp4?s=ae0920061bc08264e7241450c57a18af7045924b&profile_id=175', 'https://i.vimeocdn.com/video/1241312560-a1e07cb0dc22b140090d472bdee8d4b7515fe498ec1be1976a096357894ef849-d_640', 'https://player.vimeo.com/external/613858589.hd.mp4?s=f9867b1bb5ed38d4310ac818f56d7506fcf40cc5&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Advanced', '1669974910.jpg', NULL, '2022-12-02 09:36:12'),
(13, '1 Leg Reaching Squats', 'Reps', 'POZEX13', '1-leg-reaching-squats', NULL, NULL, '<ul><li>Initiate the descent by your toes reaching. Then the knee bends to accommodate that movement. The ascent is initiated by the fingers reaching back up. You should feel your fingers and toes reaching away from each other the entire time.</li><li>As you reach with your fingers, keep your chest wide and your shoulders relaxed down away from your ears.</li><li>When you think you’re at the bottom of the movement… you’re probably not! On each rep, see how deep you can get. Feel as if someone was pulling back and down on your toes.</li></ul>', '<ul><li>Exhale down, inhale up. Use the exhalation on the way down to go even deeper than you think possible.</li></ul>', NULL, 'https://player.vimeo.com/external/600959096.hd.mp4?s=2539ddf1847ac49344a72e04eee3afc8b5658fc5&profile_id=175', 'https://i.vimeocdn.com/video/1236870684-0180cf0a9dc023a69576475de9a61cf20f5a6f74950c93c96ad3f54ba3cbe54b-d_640', 'https://player.vimeo.com/external/622094944.hd.mp4?s=4dce367c8ac917fba0171cd67608d73833c25d27&profile_id=175', NULL, 'legs,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669976690.jpg', NULL, '2022-12-02 09:36:12'),
(14, '1 Leg Reaching Squats - Contralateral', 'Reps', 'POZEX14', '1-leg-reaching-squats-contralateral', NULL, NULL, '<ul><li>As you descend, drive your tailbone down and back, while keeping the chest open and facing forward as much as possible. Look straight ahead of you to encourage a long spine.</li><li>Really look forward at the bottom and then up and to the side as you push back to standing. Allow your gaze to guide the movement.</li><li>The standing knee will naturally move slightly in as you descend. That’s totally fine. Just be sure to keep the pad of your big toe firmly rooted on the ground to encourage a healthy tracking of your knee over your foot.</li><li>Allow the inhale as you ascend to help open your chest.</li></ul>', '<ul><li>Exhale down, inhale upExhale down, inhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600958726.hd.mp4?s=d35bf20b937f58136645d2e3a3c50f400b500fb1&profile_id=175', 'https://i.vimeocdn.com/video/1236877751-589cc4c73758ec91912fa3739785a07835ee98c8c9fc496760abd9de3c348df8-d_640', 'https://player.vimeo.com/external/622094927.hd.mp4?s=9bb89a0e1b3e730ad461cc2d83be60df6c481271&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669976717.jpg', NULL, '2022-12-02 09:36:13'),
(15, '1 Leg Squat', 'Reps', 'POZEX15', '1-leg-squat', NULL, NULL, '<ul><li>Initiate the descent by driving your tailbone down and back, rather than thinking of bending your knee first.</li><li>You can allow your torso to bend slightly forward in order to descend further, but only go as low as you can keeping a gentle curve in your lower back (no hunching!). Also try to keep your chest open and your gaze forward, not down, while descending.</li><li>If you struggle with balance, you can keep your big toe of the bent leg gently touching the ground. Then as you feel more comfortable with the movement, you can gently lift it off.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600959998.hd.mp4?s=e63cf2c7600809c8088579c6f63610b9e9a8291f&profile_id=175', 'https://i.vimeocdn.com/video/1236871507-2c79f25024280c66d2bf798c06a91958b993ed8438eaab1a26f95278f9d60ef5-d_640', 'https://player.vimeo.com/external/622094911.hd.mp4?s=988825fa34cdfefa6ca2407c449738989cf66fd9&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669976743.jpg', NULL, '2022-12-02 09:36:13'),
(16, '1 Leg Squat with Contralateral Reach', 'Reps', 'POZEX16', '1-leg-squat-with-contralateral-reach', NULL, NULL, '<ul><li>As you descend, drive your tailbone down and back, while keeping the chest open and facing forward as much as possible. Look straight ahead of you to encourage a long spine.</li><li>Really look forward at the bottom and then up and to the side as you push back to standing. Allow your gaze to guide the movement.</li><li>The standing knee will naturally move slightly in as you descend. That’s totally fine. Just be sure to keep the pad of your big toe firmly rooted on the ground to encourage a healthy tracking of your knee over your foot.</li><li>Allow the inhale as you ascend to help open your chest.</li></ul>', '<ul><li>Exhale down, inhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600959588.hd.mp4?s=446a09b99a7beb46634c0a7e7848670a7be43831&profile_id=175', 'https://i.vimeocdn.com/video/1236870876-631eb553f82ca6d04bde2823f74421dd63b67fec3d8d4e046c5c7bad66640e73-d_640', 'https://player.vimeo.com/progressive_redirect/playback/622094769/rendition/1080p?loc=external&signature=16e732d800e5ef3c2b22b5eed7234621801b912c056ccec017abc361099cccda', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669976781.jpg', NULL, '2022-12-02 09:36:14'),
(17, 'Alphabet Abs', 'Reps', 'POZEX17', 'alphabet-abs', NULL, NULL, '<ul><li>Try to keep your lower back as close to the ground as possible the entire  time. Feel free to adjust the height and angle of your legs as you get tired. This ensures you can complete the full alphabet without releasing your lower back in order to protect your spine.</li><li>To make the exercise harder, lengthen your legs and keep them closer to the ground. To make it easier, bend your knees and/or lift them a bit higher.</li><li>Keep your jaw as relaxed as possible the entire time.</li><li>For variety, write out the names of your family or a favorite quote. This exercise is tough, but can also be fun!</li></ul>', '<ul><li>Breathe calmly throughout the exercise. Use a light, controlled breath to keep the core engaged and not disrupt the position of your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/615698568.hd.mp4?s=a5e015ea70d283388fcabb31250e3a17e621d490&profile_id=175', 'https://i.vimeocdn.com/video/1257636545-5091bb98471520205ccb3754ca4693a270c0edcec2cdb54f85b60428ff833524-d_640', 'https://player.vimeo.com/external/613858655.hd.mp4?s=a7871dd3dadc46213c07c38e18a2666ff345f36d&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669976805.jpg', NULL, '2022-12-02 09:36:14'),
(18, 'Back Lunges', 'Reps', 'POZEX18', 'back-lunges', NULL, NULL, '<ul><li>Lower your back knee as close to the ground as possible without touching it on each rep.</li><li>Push powerfully back up to standing from the very bottom of the movement.</li><li>Keep your torso as vertical as possible throughout the movement. To achieve this, look forward, not down. Avoid leaning forward at any point.</li><li>Place your fingertips lightly against the back of your head, keeping your elbows open and your shoulders relaxed down away from your ears. In order to lengthen through the back of your neck, do not lace your fingers behind your head.</li></ul>', '<ul><li>Inhale down, exhale up.</li><li>You can also invert your breathing, inhaling up, in order to feel how the inhalation can help expand your chest and torso at the top of the movement.</li></ul>', NULL, 'https://player.vimeo.com/external/640877710.hd.mp4?s=d4c90bdea6f7643de819ceffe16ca1042955fa9c&profile_id=175', 'https://i.vimeocdn.com/video/1289144287-7be209c989233f7ed7e8e22326a72b9242fdc0b4880f95f41_640', 'https://player.vimeo.com/external/620356127.hd.mp4?s=ce3c786dc4ef842240e763e9d9f398a2e062e44f&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669976830.jpg', NULL, '2022-12-02 09:36:15'),
(19, 'Back Widows', 'Reps', 'POZEX19', 'back-widows', NULL, NULL, '<ul><li>Do not engage your abs at all during this exercise. Instead, push your elbows into the ground and squeeze your shoulder blades together to push yourself off the ground.</li><li>To increase the difficulty, try to push your back even higher than you think you can for an extra few seconds at the top of each rep.</li><li>To reduce neck tension, tuck your chin gently towards your chest throughout the movement.</li><li>Keep your elbows slightly below (closer to your feet) the level of your shoulders.</li></ul>', '<ul><li>Inhale while lying flat on the ground before each rep. Exhale slowly throughout the entire movement, up and down, on each rep.</li></ul>', NULL, 'https://player.vimeo.com/external/615696313.hd.mp4?s=48a736a7d7a46b0223e64adb07e4740e87290fec&profile_id=175', 'https://i.vimeocdn.com/video/1257634470-55d8a2644fa9f5bc6b78708063d6afebb227a8075e8f3511cee6e1e725e491ce-d_640', 'https://player.vimeo.com/external/613858706.hd.mp4?s=a041f725c5e573b0a3da943c18bb427e9956b51d&profile_id=175', NULL, 'shoulders,back', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669976853.jpg', NULL, '2022-12-02 09:36:15'),
(20, 'Bear Crawl', 'Reps', 'POZEX20', 'bear-crawl', NULL, NULL, '<ul><li>Keep a long line through the entire spine. You should be looking down, not forward.</li><li>Focus on pushing your entire back as high as you can the entire time, while keeping your tailbone relaxed and pointing down towards the ground</li><li>While you want to engage your core intensely throughout this exercise, still keep your arms and legs as relaxed as possible. Try to gently absorb each step you take. You know…. Like a bear!</li></ul>', '<ul><li>Continue breathing calmly throughout the entire movement.</li><li>Use a light, controlled breath in order to keep the core engaged throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/600148124.hd.mp4?s=596121000633828d8063a33a32066d90613eed9e&profile_id=175', 'https://i.vimeocdn.com/video/1235869776-e2b4a9219224b599403974a0bd9d52f8ede8efe92a6f6776480788b86fb45226-d_640', 'https://player.vimeo.com/external/624191024.hd.mp4?s=6f57080000427cfcf57801a105a904852ba92ec0&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669976879.jpg', NULL, '2022-12-02 09:36:16'),
(21, 'Bear Hold', 'Duration', 'POZEX21', 'bear-hold', NULL, NULL, '<ul><li>Keep your head and neck in line with your spine, meaning you’ll be looking down at the floor rather than forward.</li><li>Think of the Bear Hold as a movement, not a position. You should be actively pushing your back up the entire time, not just holding it in place.</li><li>Keep your neck as relaxed as possible. You can even look gently side to side to ensure you’re not tightening in your neck or shoulders.</li></ul>', '<ul><li>Continue breathing calmly throughout the entire hold.</li><li>Use a light, controlled breath in order to keep the core engaged throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/600894159.hd.mp4?s=74b8dbee9c8a90f72af61a6f783ba43de02a7182&profile_id=175', 'https://i.vimeocdn.com/video/1236791820-4fc4c404d44527408dfbfcc4d5d53292828515a0c71e9da0a759fc7bcbf2d76b-d_640', 'https://player.vimeo.com/external/613858747.hd.mp4?s=2196393adcda7ea57b6e3ce8d6f9d901c04a23a7&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669976938.jpg', NULL, '2022-12-02 09:36:17'),
(22, 'Bent Knee Glute Kickbacks', 'Reps', 'POZEX22', 'bent-knee-glute-kickbacks', NULL, NULL, '<ul><li>Keep your core gently engaged as you lift your heel to avoid overarching your  lower back.</li><li>To increase the burn, hold at the top of the movement on each rep and try to push your heel even higher for a few seconds before lowering it.</li><li>To focus more on the hamstrings, drive your heel up and slightly back away from your head. To focus more on your glutes, drive your heel up slightly forward towards your head and focus on really contracting the glutes to initiate the movement.</li><li>Keep your spine long throughout the movement. You should be looking down toward the ground to lengthen the back of your neck.</li></ul>', '<ul><li>Exhale up. Inhale down.</li></ul>', NULL, 'https://player.vimeo.com/external/600893606.hd.mp4?s=52d58974785c01c14c25ea47ff6e96c13c99fad1&profile_id=175', 'https://i.vimeocdn.com/video/1236789533-87d529414603dd48e12af7d7f34c1a7a8884ba85726029c25749a29c04f44ab0-d_640', 'https://player.vimeo.com/external/613858780.hd.mp4?s=bc138063085af9cce9a129e99a569b4b2fd612a4&profile_id=175', NULL, 'glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669976978.jpg', NULL, '2022-12-02 09:36:17'),
(23, 'Bent Over Underhand Towel Row', 'Reps', 'POZEX23', 'bent-over-underhand-towel-row', NULL, NULL, '<ul><li>Get into the bent over position by scooping your tailbone back. Allow your knees to bend only as much as they need to in order to accommodate the movement of your torso.</li><li>You can perform this with straight or slightly bent knees. Only bend over as far as you can while keeping a long line in your lower back and your chest open.</li><li>Look down and slightly forward (not straight ahead of you) to keep a long line through the back or your neck.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears.</li><li>You can perform this with a towel, rolled up t-shirt, rope, or anything else that won’t be damaged by you trying to rip it in half. Because your main goal is to try to rip it in half the entire time.</li><li>You can use an overhand grip (palms down) to target your upper back or an underhand grip (palms up) to target more of your lower lats. Both are great options; I recommend trying them both.</li></ul>', '<ul><li>Continue breathing calmly the entire time. Use a light, controlled breath to keep your torso steady and your core engaged.</li></ul>', NULL, 'https://player.vimeo.com/external/629032050.hd.mp4?s=077f42a5f5346b0c019bc71743d195a6e6a5dbf7&profile_id=175', 'https://i.vimeocdn.com/video/1271302930-02323dcc31c1c615e7c5ea1e039eb9418b9b668b087489ab0_640', 'https://player.vimeo.com/external/624191200.hd.mp4?s=486ec6b926c111a5856d9220fe134e0133cfb804&profile_id=175', NULL, 'back,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', '1669977007.jpg', NULL, '2022-12-02 09:36:18'),
(24, 'Bicycle Crunch', 'Duration', 'POZEX24', 'bicycle-crunch', NULL, NULL, '<ul><li>Do not try to touch your knees with your elbows. Instead, keep your elbows open, your chest wide, and reach the front of your shoulder to the opposite knee on each rep</li><li>.</li><li>Start slowly, focusing on really squeezing as high as you can at the top of each rep. Then gradually increase your speed, only going as fast as you can with perfect form.</li><li>Keep your shoulder blades off the ground the entire time.</li></ul>', '<ul><li>Continue breathing calmly the entire time. Use a light, controlled breath to keep your core engaged.</li></ul>', NULL, 'https://player.vimeo.com/external/615699845.hd.mp4?s=bbac652a4f0044cf5d09af31bed1bfe8f2d7fadb&profile_id=175', 'https://i.vimeocdn.com/video/1257637321-3a664096f99da07ec450eb44c6ff6344e884ed6d70276ee62f527b167e5cfabe-d_640', 'https://player.vimeo.com/external/613858834.hd.mp4?s=f90b325abd799f192ab5c286032c0944700b1f3e&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', '1669978355.jpg', NULL, '2022-12-02 09:36:18'),
(25, 'Bird Dog Plank (1 Leg, 1 Arm)', 'Duration', 'POZEX25', 'bird-dog-plank-1-leg-1-arm', NULL, NULL, '<ul><li>The more you reach with your fingers and toes, the easier this will be!</li><li>Keep the front of your hips open and your core gently engaged to avoid your butt being higher than your lower back.</li><li>In order to keep your head and neck in line with your spine, look down at the ground between your hands, not forward.</li><li>Continue lengthening your spine as long as you can with perfect form. Finish the movement the moment you feel your lower back begin to drop at all.</li><li>Don’t lift your back leg too high. The goal is to have a long line from your fingertips to your toes.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600895386.hd.mp4?s=392189a1f7141b7324c394030789dc48bc35ee90&profile_id=175', 'https://i.vimeocdn.com/video/1236791630-7b79fd8f65992a7581013df4925d19e116069b3508c71188e0369626a8298f3e-d_640', 'https://player.vimeo.com/external/613858916.hd.mp4?s=83fc09156dc285c2fdc8c31a5995028008b3e8b8&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669978389.jpg', NULL, '2022-12-02 09:36:19'),
(26, 'Bulgarian Split Squat', 'Reps', 'POZEX26', 'bulgarian-split-squat', NULL, NULL, '<ul><li>Think about your torso moving down and back as you descend. The front knee may move a bit in front of your toes, but the main movement should be downward, not forward.</li><li>Keep your torso as vertical as possible throughout the movement. To achieve this, look forward, not down, and avoid leaning forward.</li><li>You can experiment with different distances between the chair and your front foot. There is no one right position and each distance will invite different muscles to work. Moving the foot very far forward will also add an awesome flexibility challenge as well!</li></ul>', '<ul><li>Inhale down, exhale up.</li><li>You can also invert the breathing, inhaling up, in order to feel how the inhalation can help expand the chest and torso at the top of the movement.</li></ul>', NULL, 'https://player.vimeo.com/external/646537734.hd.mp4?s=49460faadcb37252ba2a8dae0bc925fb41a48767&profile_id=175', 'https://i.vimeocdn.com/video/1301478411-566c69450dd07ad8a9a77170aaef9162cdb03021ccd8f7d94_640', 'https://player.vimeo.com/external/620356175.hd.mp4?s=db6b8da5469c506bf34029704a01e1ca0889f4c1&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669978422.jpg', NULL, '2022-12-02 09:36:19'),
(27, 'Butt Kicks', 'Reps', 'POZEX27', 'butt-kicks', NULL, NULL, '<ul><li>The obvious focus of this exercise is on the quick movement of your legs and your heels hitting the hands behind your back. But be sure to also keep part of your focus on your feet as they touch the ground. The goal is to be as light and silent as possible each time your foot touches the ground.</li><li>This exercise is fun to do fast! But be sure to never go faster than you can while keeping a long spine and relaxed jaw.</li><li>Look straight ahead of you, not down, to keep your spine and neck lengthened.</li></ul>', '<ul><li>Continue breathing calmly throughout the entire movement, keeping your breath as relaxed as possible.</li></ul>', NULL, 'https://player.vimeo.com/external/625687459.hd.mp4?s=c20da136f73cf5f8cb2a4348843997b3fabb6591&profile_id=175', 'https://i.vimeocdn.com/video/1268082675-31d8823f6f0fd952928663c726322d96c7a7901f09afd4a57_640', 'https://player.vimeo.com/external/620356231.hd.mp4?s=3fcd01da7357ca28948900a8e043f6ba1168b702&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Beginner', '1669978470.jpg', NULL, '2022-12-02 09:36:20'),
(28, 'Calf Raises', 'Reps', 'POZEX28', 'calf-raises', NULL, NULL, '<ul><li>Extend your arms out to your sides and a few inches in front of you. Keep your chest wide and your shoulders relaxed down away from your ears.</li><li>Reach through your fingertips throughout the entire movement.</li><li>Keep your eyes gently focused on a single spot directly in front of you through the movement to help with balance</li><li>.</li><li>Hold at the top of the movement for a few seconds, pushing the front of your ankles forward while simultaneously pushing as high as you can through the top of your head.</li><li>Keep your weight distributed evenly between the balls of your big and little toes, and don’t allow the outside of your ankle to fall out towards the side.</li><li>To avoid wobble in the ankle, lower yourself slowly back down to the ground in one continuous movement, without letting your weight drop at any point.</li></ul>', '<ul><li>Continue breathing calmly throughout the entire movement.</li><li>Use a light, controlled breath to avoid unnecessary movement of your torso during the exercise.</li></ul>', NULL, 'https://player.vimeo.com/external/625717731.hd.mp4?s=99914c4d8e547a8c501c8c565770e4c41d58c1d6&profile_id=175', 'https://i.vimeocdn.com/video/1268089508-00e39c9573a31fef5c0a8c60f660dffcbfa96366fc44939a0_640', 'https://player.vimeo.com/external/620356264.hd.mp4?s=f5bafc49eb951dbd6d01e42347c3ce43cb52520e&profile_id=175', NULL, 'calves', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', '1669978497.jpg', NULL, '2022-12-02 09:36:21'),
(29, 'Calf Raises - Sumo Squat', 'Reps', 'POZEX29', 'calf-raises-sumo-squat', NULL, NULL, '<ul><li>Keep your upper body perfectly still throughout the movement. Specifically avoid letting your torso move upward as you push yourself up onto the balls of your feet.</li><li>Take a wide stance with your feet turned out 30 - 45°. Choose an angle that allows you to keep your knees over your feet when you bend your legs.</li><li>Hold at the top of the movement for a few seconds, pushing the front of your ankles forward while simultaneously pushing as high as you can through the top of your head.</li><li>Allow your head to float upward as you release your knees out over your feet, in order to keep a long spine throughout the movement.</li><li>To avoid wobble in your ankle, lower yourself slowly back down to the ground in one continuous movement, without letting your weight drop at any point.</li></ul>', '<ul><li>Continue breathing calmly throughout the entire movement.</li><li>Use a light, controlled breath to avoid unnecessary movement of the torso during the exercise.</li></ul>', NULL, 'https://player.vimeo.com/external/666658261.hd.mp4?s=0c637436e098a4bd2c3ab6b111d29d302891a78f&profile_id=175', 'https://i.vimeocdn.com/video/1349889194-69e5eeeaf6a97d719c3b3cc701369cc84da4e7e96f1b2ed6845d593d17355be0-d_640', 'https://player.vimeo.com/external/624191927.hd.mp4?s=a92512d0fcaeb7c2122c42dd766a220116b1c155&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669978573.jpg', NULL, '2022-12-02 09:36:22'),
(30, 'Calf Raises - Wall Assisted', 'Reps', 'POZEX30', 'calf-raises-wall-assisted', NULL, NULL, '<ul><li>Choose a distance from the wall that allows your elbow to rest comfortably just a few inches in front of your body.</li><li>Try to perform the raises with as little help as possible from the wall, but if you take your fingers off the wall, keep them close to it to avoid having to sacrifice the quality of the movement if you need to touch it again for balance.</li><li>Hold at the top of the movement for a few seconds, pushing the front of your ankles forward while simultaneously pushing as high as you can through the top of your head.</li><li>To avoid wobble in the ankle, lower yourself slowly back down to the ground in one continuous movement, without letting your weight drop at any point.</li></ul>', '<ul><li>Continue breathing calmly throughout the entire movement.</li><li>Use a light, controlled breath to avoid unnecessary movement of your torso during the exercise.</li></ul>', NULL, 'https://player.vimeo.com/external/666658369.hd.mp4?s=6cb81fe3eaae78f34631b5617f2f872b403032b0&profile_id=175', 'https://i.vimeocdn.com/video/1349889468-c72d3b355dc4d8346208bdd53a080609d42423d5e8987557afcf3597a484fb36-d_640', 'https://player.vimeo.com/external/624193254.hd.mp4?s=e8b2b292a1d02667053358e7702309861237ba02&profile_id=175', NULL, 'calves', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669978606.jpg', NULL, '2022-12-02 09:36:22'),
(31, 'Calf Raises - Wall Assisted 1 Leg', 'Reps', 'POZEX31', 'calf-raises-wall-assisted-1-leg', NULL, NULL, '<ul><li>As you push up for each rep, keep your weight evenly balanced between the balls of your big and little toes. Avoid any wobble or lateral movement in your ankle.</li><li>Choose a distance from the wall that allows your elbow to rest comfortably a few inches in front of your body.</li><li>Keep your pelvis parallel to the ground while performing the movement. Don’t let one side lift higher than the other.</li><li>Hold at the top of the movement for a few seconds, pushing the front of your ankle forward while simultaneously pushing as high as you can through the top of your head.</li></ul>', '<ul><li>Exhale on the way up and during the hold at the top of the movement. Inhale down.</li></ul>', NULL, 'https://player.vimeo.com/external/666658309.hd.mp4?s=2a5ab4a554f738defc4d91ce740d008a7f76fd8b&profile_id=175', 'https://i.vimeocdn.com/video/1349889306-2e8a2f3df1ed2befab9ae3f18391081685c38451fd12bd79b76412f6c29af32c-d_640', 'https://player.vimeo.com/external/624192328.hd.mp4?s=39a2859b9dbc681be4144c0542fe0e0b3731894d&profile_id=175', NULL, 'calves', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', '1669978658.jpg', NULL, '2022-12-02 09:36:23'),
(32, 'Calf Raises with Head Rotation', 'Reps', 'POZEX32', 'calf-raises-with-head-rotation', NULL, NULL, '<ul><li>Keep the balls of your big and little toe equally rooted into the ground the entire time to avoid your ankle falling in or out.</li><li>Really reach out through your fingers and up through the top of your head the entire time.</li><li>Try to keep your torso completely still as your head rotates in isolation.</li><li>Guide your  head rotation with the eyes, actually looking side to side.</li></ul>', '<ul><li>Continue breathing calmly throughout the entire movement.</li><li>Use a light, controlled breath to avoid unnecessary movement of your torso during the exercise.</li></ul>', NULL, 'https://player.vimeo.com/external/666658419.hd.mp4?s=0409ccab950419cfe69c53ffd500153783030378&profile_id=175', 'https://i.vimeocdn.com/video/1349889797-b17ea002c41e0a728e5c547e8060af33100b6727d9d9159180f9261312a7ebdb-d_640', 'https://player.vimeo.com/external/624193692.hd.mp4?s=e12174de638503c0873dc6d5754a4a78b5796e20&profile_id=175', NULL, 'calves', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669978691.jpg', NULL, '2022-12-02 09:36:24'),
(33, 'Calf Raises with Torso Rotation', 'Reps', 'POZEX33', 'calf-raises-with-torso-rotation', NULL, NULL, '<ul><li>During the rotations, your entire upper body (including the arms and head) should move together as one piece while the pelvis stays facing perfectly forward.</li><li>Film yourself the first time you try this. You may find that your pelvis is moving without you being aware of it. If so, think about gently rotating your pelvis in the opposite direction of your torso, in order to avoid it getting pulled into rotation by your upper body.</li><li>It helps a lot with balance to pick a spot on the wall in front of you to focus on, and then to also focus on spots on each side while rotating.</li></ul>', '<ul><li>Continue breathing calmly throughout your entire movement.</li><li>Use a light, controlled breath to avoid unnecessary movement of your  torso during the exercise.</li></ul>', NULL, 'https://player.vimeo.com/external/625715334.hd.mp4?s=8958b6f482af74d062f4b368192a864ba9af8747&profile_id=175', 'https://i.vimeocdn.com/video/1268084985-dad1444c449be4f52c79f51207f5f620762f6aaaaee7ded18_640', 'https://player.vimeo.com/external/620356473.hd.mp4?s=72075177987feb927183ee339afa50debffe29d0&profile_id=175', NULL, 'calves', NULL, 'building-mass', 'exercise', NULL, 'Advanced', '1669978720.jpg', NULL, '2022-12-02 09:36:25'),
(34, 'Calf Raises with Upward Tilt', 'Reps', 'POZEX34', 'calf-raises-with-upward-tilt', NULL, NULL, '<ul><li>Extend your arms out to your sides and a few inches in front of you. Keep your chest wide and your shoulders relaxed down away from your ears. Reach through your fingertips.</li><li>Initiate the upward tilt by looking up. The more you actually see something, the better your balance will be.</li><li>Keep your mouth open and your jaw relaxed during the tilt to avoid neck tension.</li><li>Keep your weight distributed evenly between the balls of your big and little toes, and don’t allow the outside of your ankle to fall out towards the side.</li><li>To avoid wobble in your ankle, lower yourself slowly back down to the ground in one continuous movement, without letting your weight drop at any point.</li></ul>', '<ul><li>Continue breathing calmly throughout your entire movement.</li><li>Use a light, controlled breath to avoid unnecessary movement of your torso during the exercise.</li></ul>', NULL, 'https://player.vimeo.com/external/625716563.hd.mp4?s=5820d80dec52fb1d47a254fee93585bc8d784aa6&profile_id=175', 'https://i.vimeocdn.com/video/1268086439-b933c9829a9344755117877c4eb770a79ee6a7a48401ae6db_640', 'https://player.vimeo.com/external/620356625.hd.mp4?s=a6a207c39720d6926d029b701bfb7a4de9ba9b53&profile_id=175', NULL, 'calves', NULL, 'building-mass', 'exercise', NULL, 'Advanced', '1669978746.jpg', NULL, '2022-12-02 09:36:25'),
(35, 'Circular Glute Bridges', 'Reps', 'POZEX35', 'circular-glute-bridges', NULL, NULL, '<ul><li>At the top of the movement the front of your pelvis should be higher than your belly. Achieve this by pushing your hips upwards while gently contracting your core to avoid overarching your lower back.</li><li>Think quality not quantity: Focus on getting the smoothest circular motion possible, with no wobbles or jerkiness in the movement. Only then should you try to make the circle as big as possible, never sacrificing the quality of movement for the size.</li><li>Drive your knees away from your head the entire time, working to lengthen your spine as much as possible.</li></ul>', '<ul><li>Inhale as your torso releases down and to the side, exhale as you begin to push it back, up and around the other side.</li><li>You can also practice keeping a constant, gentle breath the entire time, without linking your breath directly to the movement.</li></ul>', NULL, 'https://player.vimeo.com/external/646538213.hd.mp4?s=63a3640d882a2c17e08ae39facf7e566981b81b0&profile_id=175', 'https://i.vimeocdn.com/video/1301516670-58d433bb1bad5c290dc672344ebd1a1476e04c0844a730816_640', 'https://player.vimeo.com/external/613859166.hd.mp4?s=21aae891fa0537849d1cb4f94a0943fb31bb502a&profile_id=175', NULL, 'glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669978774.jpg', NULL, '2022-12-02 09:36:26'),
(36, 'Circular Plank with Undulation', 'Reps', 'POZEX36', 'circular-plank-with-undulation', NULL, NULL, '<ul><li>Start small. Focus first on the connection between your breath and the movement of your spine, feeling how the inhale invites expansion through the front of your torso and the exhale assists in engaging your core and swooping back up the other side.</li><li>As you begin to feel more comfortable, you can make the movement bigger and bigger, but never sacrifice quality for quantity.</li><li>Enjoy the swooping nature of this movement! The more you allow your body to drop and swoop to one side, the more you can use that momentum to feel it flow right back up the other side.</li></ul>', '<ul><li>Inhale during the top half of your  movement and exhale during the bottom half.</li></ul>', NULL, 'https://player.vimeo.com/external/600897611.hd.mp4?s=623b1947879913b313f907a5f0346bb9f94bad67&profile_id=175', 'https://i.vimeocdn.com/video/1236794335-080bbce86a2b7903c48ba4b87f5251131b77bb8b043d2b07b7ca1dc30887a643-d_640', 'https://player.vimeo.com/external/613859359.hd.mp4?s=28cc67c403523f51966f888ff78ab56e4d8e79ec&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise,warmup', NULL, 'Intermediate,Advanced', '1669978796.jpg', NULL, '2022-12-02 09:36:27'),
(37, 'Circular Push-Ups', 'Reps', 'POZEX37', 'circular-push-ups', NULL, NULL, '<ul><li>For a single set, change directions every few reps. For multiple sets, change directions on each new set, preferably performing an even number of sets.</li><li>Try to keep your back as flat as possible. For a fun challenge, have someone put something on your back and try not to let it fall off while performing the pushups.</li><li>Imagine you have a paint brush sticking right out of the top of your head and you want to draw a perfect circle on a canvas in front of you.</li><li>Keep your hands turned slightly out, between 30 and 45°.</li><li>Keep your weight over the pads of your second and third fingers, actively pushing through your fingertips to avoid having too much pressure on your wrists.</li></ul>', '<ul><li>Inhale during the top half of the movement and exhale during the bottom half.</li></ul>', NULL, 'https://player.vimeo.com/external/604898709.hd.mp4?s=fe1a1081c61d58fd9da7810b5d014f7fa1ef32ab&profile_id=175', 'https://i.vimeocdn.com/video/1241309052-a36bb158a40bfdc3f90f9723e9ee810ef3b0ee37695f7b6594bf2b0e07f39d4a-d_640', 'https://player.vimeo.com/external/599112417.hd.mp4?s=4b74580be25347a269640a746315c1909aaae71b&profile_id=175', NULL, 'core,chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', '1669978824.jpg', NULL, '2022-12-02 09:36:28');
INSERT INTO `exercises` (`id`, `title`, `based_on`, `code`, `slug`, `category_id`, `duration`, `instructions`, `breath`, `description`, `tip_video`, `tip_video_thumbnail`, `video_link`, `reps`, `focus_area`, `specific_muscles`, `good_for`, `type`, `Notes`, `level`, `image`, `tags`, `created_at`) VALUES
(38, 'Circular Push-Ups with Undulation', 'Reps', 'POZEX38', 'circular-push-ups-with-undulation', NULL, NULL, '<ul><li>This exercise is rather technical at first, but it is also fun and should feel good! Focus on the sensation of your  breath and movement more than the technical details.</li><li>If you haven’t tried Circular Pushups (without undulation) yet, be sure to check them out in the Exercise Library, as this more advanced variation is based on them, and is much easier to perform if you’re already comfortable with them.</li><li>You can begin these pushups with just a slight bend in your elbows, in order to focus more on the undulation through your  spine and the swooping movement of your entire body. Then, after a few reps, bend your arms more and more to add more of a muscular challenge for your chest and triceps.</li><li>Make sure that your head is moving the entire time, as well as your torso. Your gaze should also be moving in a perfect circle.</li><li>Use momentum! As your body drops down to one side, really enjoy the momentum that comes from that swooping motion, and allow the energy from the drop to help swing your body back up on the other side.</li></ul>', '<ul><li>Inhale as you release your torso down and to the side, and then exhale powerfully as you begin to push your torso back up the other side.</li><li>The inhalation will help expand the front of your body, and the exhalation will help contract your core to accentuate the curving of your spine as you push up. The more generous you are with your breath, the easier (and more fun) this will be!</li></ul>', NULL, 'https://player.vimeo.com/external/604899335.hd.mp4?s=ee3ce539a30df782caad4298d08167d5e8dfbf9d&profile_id=175', 'https://i.vimeocdn.com/video/1241310891-8140f3a570fd066b4e552f253ad7bb0be50c7364b5ef283ce5f19f95abbb834d-d_640', 'https://player.vimeo.com/external/613859400.hd.mp4?s=f3a0de1789f28354bc49702149ee80518a5beb71&profile_id=175', NULL, 'core,chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669978849.jpg', NULL, '2022-12-02 09:36:28'),
(39, 'Clamshells', 'Reps', 'POZEX39', 'clamshells', NULL, NULL, '<ul><li>This exercise can be a true killer for the glutes, or a cute, rather useless exercise from a 90’s workout video, depending on how you perform them. Follow these tips clearly!</li><li>Keep your pelvis perpendicular to the ground. Do not let your top butt cheek move back as you lift your leg. You can even place your top hand on that side of your butt and push forward a bit as you lift your leg to ensure you keep the work in your glutes.</li><li>Press the insides of your feet together gently as you lift your leg.</li><li>At the top of each rep, stay a second or two and really squeeze that top knee as high as you can.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/615697323.hd.mp4?s=a151550022168d535ba7b5bb48fb863d0f8adace&profile_id=175', 'https://i.vimeocdn.com/video/1257635370-48d5118ad9122f216de8c9eb57ed448579a5edd6ebd0f1517b4cdccb3b566cc9-d_640', 'https://player.vimeo.com/external/613859499.hd.mp4?s=ad16d55c4fb3f0a40b9177b1331c7138ce330eb4&profile_id=175', NULL, 'glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner', '1669978874.jpg', NULL, '2022-12-02 09:36:29'),
(40, 'Clapping Push-Ups', 'Reps', 'POZEX40', 'clapping-push-ups', NULL, NULL, '<ul><li>Focus on cushioning the arrival of your hands on the ground on each rep. Keep the landing as silent and gentle on your wrists as possible.</li><li>You can build upto clapping push-ups by working on explosive push-ups without the clap.</li><li>Once you can’t manage more with claps, you can push yourself harder by then continuing with regular push-ups to failure.</li><li>Push like crazy through your fingertips on both the way up and the way down on each rep.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604899983.hd.mp4?s=c8381f67906cc6c78c727d788fa77c5f1659687d&profile_id=175', 'https://i.vimeocdn.com/video/1241311015-e52e40a1bf7ee26a7c1479cb637f0434d32a8b6ea2aa5ef08b0d82e7ad08a9f7-d_640', 'https://player.vimeo.com/external/620356671.hd.mp4?s=b9f4eeff0cca4d9d81ee8d2c0d1f362d6337d36e&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Advanced', '1669978903.jpg', NULL, '2022-12-02 09:36:30'),
(41, 'Cliffhanger Plank', 'Duration', 'POZEX41', 'cliffhanger-plank', NULL, NULL, '<ul><li>Push your lower back up as high as you can and keep your butt down.</li><li>To make it easier, keep your hands closer to you. To make it harder, move them further forward away from your head.</li><li>Rather than trying to “stay up,” focus on pushing your body forward with your feet and back with your fingertips.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600894825.hd.mp4?s=e662b76ea7d99b1a6026d048b8caf8b045e1bc1b&profile_id=175', 'https://i.vimeocdn.com/video/1236790818-adb5f017c78d8af469259e72626cb51d5e7780163f01ef0eddf63486805a3e2d-d_640', 'https://player.vimeo.com/external/613859503.hd.mp4?s=4dfeab8b7ba07fbe86d85e90c790a8f357d99840&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669978930.jpg', NULL, '2022-12-02 09:36:30'),
(42, 'Cliffhanger Push-Ups - Modified', 'Reps', 'POZEX42', 'cliffhanger-push-ups-modified', NULL, NULL, '<ul><li>Rotate your fingers slightly to increase comfort on your shoulders and elbows.</li><li>Push your lower back up as high as you can and keep your butt down.</li><li>To make it easier, keep your hands closer to you. To make it harder, move them further forward away from your head.</li><li>Push your body back with your fingertips throughout your entire movement.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604888020.hd.mp4?s=2d5f36622f09599fe7c67cd72f8df03e857f2941&profile_id=175', 'https://i.vimeocdn.com/video/1241296716-935d5ebe4a33157865beeedfc172e66cc805b1351fa7287e4c350652a286066b-d_640', 'https://player.vimeo.com/external/613859534.hd.mp4?s=aa70b090eeb0af9aa68cd68a08781c6bcc7d0992&profile_id=175', NULL, 'core,chest', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669978956.jpg', NULL, '2022-12-02 09:36:31'),
(43, 'Cobra Push-Ups', 'Reps', 'POZEX43', 'cobra-push-ups', NULL, NULL, '<ul><li>At the bottom, keep the longest line possible from the top of your head to your heels, and keep your body as close to the ground as possible.</li><li>As you push yourself up, try not to let the lower body move too much. The more you isolate the upper body, the more you can drive the work straight to the triceps.</li><li>Look forward and a bit up as you push yourself up, but don’t look too high, as the goal is to keep a long line through the back of your neck.</li><li>Keep your elbows tucked tightly at your sides to focus the work on your triceps.</li></ul>', '<ul><li>Inhale up, focusing on using a strong, generous inhale to expand the entire front of your torso. Exhale down, using the exhale to help stabilize the core to keep a long line through the entire body.</li></ul>', NULL, 'https://player.vimeo.com/progressive_redirect/playback/679959769/rendition/1080p?loc=external&signature=c002874cf8b8cc0d6482898fa68367fe65c40e6b0aebdab3690b0acf542cbcd6', 'https://i.vimeocdn.com/video/1241296716-935d5ebe4a33157865beeedfc172e66cc805b1351fa7287e4c350652a286066b-d_640', 'https://player.vimeo.com/external/613859600.hd.mp4?s=179d0cda586ac043a9b265819403f29fe025e564&profile_id=175', NULL, 'triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:36:32'),
(44, 'Cobra Push-Ups - Half Cobras', 'Reps', 'POZEX44', 'cobra-push-ups-half-cobras', NULL, NULL, '<ul><li>As you push yourself up, focus on your chest expanding and floating forward and up.</li><li>Keep your elbows tucked tightly at your sides to focus the work on your triceps.</li><li>Look forward and a bit up as you push yourself up, but don’t look too high, as the goal is to keep a long line through the back of your neck.</li></ul>', '<ul><li>Inhale up, focusing on using a strong, generous inhale to expand the entire front of your torso. Exhale down, using the exhale to help stabilize the core to keep a long line through the entire body.</li></ul>', NULL, 'https://player.vimeo.com/external/604900981.hd.mp4?s=a2b432c729ab4d59fad2b4a0d51aa7dd417ccd72&profile_id=175', 'https://i.vimeocdn.com/video/1241312475-b559bee96652ce4aa3aaa65a5663e2c6c66c89a06de9146c42f4198d154ab5fb-d_640', 'https://player.vimeo.com/external/613859566.hd.mp4?s=991b6d9dd5e3656d7cf23b2791819910086c6cf3&profile_id=175', NULL, 'triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669979023.jpg', NULL, '2022-12-02 09:36:32'),
(45, 'Cossack Squats', 'Reps', 'POZEX45', 'cossack-squats', NULL, NULL, '<ul><li>It’s fine to bend at the waist and have your upper body leaning forward, as long as you don’t round in the lower back.</li><li>On each rep, the front of one foot will come off the ground. As you place it back on the ground, rotate the foot back in so your toes are facing more forward than out. This will help keep your weight forward and get lower in the squat.</li><li>Similarly, on each rep, rotate your body a bit so you’re facing the extended leg.</li></ul>', '<ul><li>There are advantages to inhaling on the way down and exhaling on the way up, and there are different advantages to reversing the breath and inhaling on the way up. I recommend trying both versions!</li></ul>', NULL, 'https://player.vimeo.com/external/600953141.hd.mp4?s=170334664d47ab012d058ee9d3073f715f63e263&profile_id=175', 'https://i.vimeocdn.com/video/1236862223-37750bf53fa69c6f9c4fdd746727de76804555d76124877609405e495a483bd1-d_640', 'https://player.vimeo.com/external/555022055.hd.mp4?s=aed91841a67a8d1f9df945755c3dfad92b6657fc&profile_id=174', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669979047.jpg', NULL, '2022-12-02 09:36:33'),
(46, 'Cossack Squats - Chair Assisted', 'Reps', 'POZEX46', 'cossack-squats-chair-assisted', NULL, NULL, '<ul><li>Don’t put any weight on the chair; instead use it only for balance. Then, as you feel more comfortable with the exercise, try to use it less and less as you work toward a full Cossack Squat with no assistance.</li><li>It’s fine to bend at your waist and have your upper body leaning forward, as long as you don’t round in the lower back.</li><li>On each rep, the front of one foot will come off the ground. As you place it back on the ground, rotate the foot back in so your toes are facing more forward than out. This will help keep your weight forward and get lower in the squat.</li></ul>', '<ul><li>There are advantages to inhaling on the way down and exhaling on the way up, and there are different advantages to reversing the breath and inhaling on the way up. I recommend trying both versions!</li></ul>', NULL, 'https://player.vimeo.com/external/600954776.hd.mp4?s=537bf31d914682c52b3b03f10798b10a190fd576&profile_id=175', 'https://i.vimeocdn.com/video/1236865730-f704f3078fa1d5f3e9ed8e4c8415f868d024d832dfefa7f5230cda1336de4270-d_640', 'https://player.vimeo.com/external/622094580.hd.mp4?s=c2a6fb534e69bf4e4e74cd3e6d759cbef4315ab8&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669979075.jpg', NULL, '2022-12-02 09:36:34'),
(47, 'Cossack Squats - Low', 'Reps', 'POZEX47', 'cossack-squats-low', NULL, NULL, '<ul><li>The main goal of this exercise is to keep your pelvis as low as possible as you move from one leg to the other through the middle. So don’t think about pushing up from each side; rather focus on pushing to the side.</li><li>It’s fine to bend at your waist and have your upper body leaning forward, as long as you don’t round your lower back.</li><li>On each rep, the front of one foot will come off the ground. As you place it back on the ground, rotate the foot back in so your toes are facing more forward than out. This will help keep your weight forward and get lower in the squat.</li></ul>', '<ul><li>There are advantages to inhaling on your way down and exhaling on your way up, and there are different advantages to reversing the breath and inhaling on your way up. I recommend trying both versions!</li></ul>', NULL, 'https://player.vimeo.com/external/600955308.hd.mp4?s=f5f5285ac26ef839f5860e7718c04d6b9eed5705&profile_id=175', 'https://i.vimeocdn.com/video/1236866367-517ad4fe8a142bd1fcc87abbe8901bb743ffb1b8e65cb7138fbe9fa6bae89271-d_640', 'https://player.vimeo.com/external/622094545.hd.mp4?s=b927ee340149638496c3062ec2a7fb92bec156cb&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669979157.jpg', NULL, '2022-12-02 09:36:34'),
(48, 'Cossack Squats - Low with Rotation', 'Reps', 'POZEX48', 'cossack-squats-low-with-rotation', NULL, NULL, '<ul><li>The main goal of this variation is to feel the opening of your chest and front of your torso as you pass from side to side to side through the middle. So don’t just think about rotating your arms. Instead, focus on how the rotation of your arms invites the chest to expand and open upward.</li><li>On the other hand, as you rotate your arms forward at the bottom, still try to keep your chest as open as possible.</li><li>It’s fine to bend at your waist and have your upper body leaning forward, as long as you don’t round in the lower back.</li><li>On each rep, the front of one foot will come off the ground. As you place it back on the ground, rotate your foot back in so your toes are facing more forward than out. This will help keep your weight forward and get lower in the squat.</li></ul>', '<ul><li>Your breath is crucial for this variation. Exhale on the way down on each side, then inhale generously as you pass through the center. Focus on how a strong inhalation causes an organic opening of the chest and front of your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600955038.hd.mp4?s=d8c58749b1703cc1bbc43f8a7c8e08e28df883aa&profile_id=175', 'https://i.vimeocdn.com/video/1236865776-cde5599a2bb3305ee884e5be7435d37164ccc67d1b01bbdff707b285ee9ee1a0-d_640', 'https://player.vimeo.com/external/622094519.hd.mp4?s=9dea5cb9e907d3070550145c0edda4b6b28e89a9&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Advanced', '1669979188.jpg', NULL, '2022-12-02 09:36:35'),
(49, 'Crossover Lunge', 'Reps', 'POZEX49', 'crossover-lunge', NULL, NULL, '<ul><li>The main goal of the Crossover Lunge is to step to the side, but to keep your torso and head facing straight forward.</li><li>Lower your back knee as close to the ground as possible without touching it on each rep.</li><li>Push powerfully back up to standing from the very bottom of the movement.</li><li>Keep your torso as vertical as possible throughout the movement. To achieve this, look forward, not down, and avoid leaning forward at any point.</li></ul>', '<ul><li>Inhale down, exhale up.</li><li>You can also invert the breathing, inhaling on the way up, in order to feel how the inhalation can help expand the chest and torso at the top of the movement.</li></ul>', NULL, 'https://player.vimeo.com/external/640877938.hd.mp4?s=a799664124bfda420f0adbe816df76bf059a318e&profile_id=175', 'https://i.vimeocdn.com/video/1289144534-03c30bb90069e606ffc181d7c3f23d7dc7cd1c20574a74856_640', 'https://player.vimeo.com/external/620356733.hd.mp4?s=6751d02586a3b8c5a1eaa4529a93fc7f9ee679fa&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669979233.jpg', NULL, '2022-12-02 09:36:36'),
(50, 'Crossover Lunge - Contralateral', 'Reps', 'POZEX50', 'crossover-lunge-contralateral', NULL, NULL, '<ul><li>The Contralateral Crossover Lunge is much easier to perform if you actually look at a point in front of you, as well as on each side.</li><li>Don’t just move your arms to the side on each rep. Rather, think about reaching as far as you can with your fingertips.</li><li>Lower your back knee as close to the ground as possible without touching it on each rep.</li><li>Push powerfully back up to standing from the very bottom of the movement.</li><li>Keep your torso as vertical as possible throughout the movement. To achieve this, look forward, not down, and avoid leaning forward at any point.</li></ul>', '<ul><li>Inhale down, exhale up.</li><li>You can also invert your breathing, inhaling on the way up, in order to feel how the inhalation can help expand your chest and torso at the top of the movement.</li></ul>', NULL, 'https://player.vimeo.com/external/640877853.hd.mp4?s=bdc959ebe6dfdebefc2944fd03394d61b9ec64fb&profile_id=175', 'https://i.vimeocdn.com/video/1289144474-b0b5170d495dc657facb9239c0581e819175cbb4d6f0e9011_640', 'https://player.vimeo.com/external/620356689.hd.mp4?s=7f1923b5dd6c19050e9faf1d84389796c8dc41b6&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669979269.jpg', NULL, '2022-12-02 09:36:37'),
(51, 'Crossover Lunge with Contralateral Suspension', 'Reps', 'POZEX51', 'crossover-lunge-with-contralateral-suspension', NULL, NULL, '<ul><li>Begin the swing of your leg from the very moment you push off the ground with your front foot. Also, try to feel the circular motion of your leg swinging around your body. your leg should feel almost like it bounces back forward from back on each rep.</li><li>Reach with your fingertips and lengthen your arms as much as possible. The more you feel the weight of your arms, the more you’ll get a strong spiral through your spine and can really enjoy the twisting part of this exercise.</li><li>Find a point to focus your gaze upon on each side, and really try to see that point on each rep. The more focus you have with your eyes, the easier the balance will be.</li><li>Keep your spine as long as possible throughout this exercise. You can imagine your spine and torso like a tree reaching to the sky, with your arms and legs like branches blowing in the wind.</li></ul>', '<ul><li>Exhale down, inhale up. At the top of the movement on each rep, feel how the inhalation helps you expand and lengthen your torso</li></ul>', NULL, 'https://player.vimeo.com/external/640877775.hd.mp4?s=7e6a2e3fd4ef81be5e3cbce44a9d20de3e7490f1&profile_id=175', 'https://i.vimeocdn.com/video/1289144381-067c785ce7af3c4d789d6f50a4f80f89d0c926a8706fac1de_640', 'https://player.vimeo.com/external/620356705.hd.mp4?s=a990d35c2fd1b4f2e77a07a438c3b6bfd5f64256&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669979321.jpg', NULL, '2022-12-02 09:36:37'),
(52, 'Crow Pose - Modified', 'Duration', 'POZEX52', 'crow-pose-modified', NULL, NULL, '<ul><li>When first learning this exercise, you can position yourself with a couch or bed just in front of you, so that it’s impossible to fall forward. But if you do fall a bit forward and your head comes to rest against that surface, instead of just stopping and starting over, push as hard as you can with your fingertips to bring your weight back. This is the way you’ll balance once you’re comfortable in this pose.</li><li>Keep your weight balanced over the pads of the 2nd and 3rd fingers. That way if you start to fall back a bit, you can push forward off the palm, and if you start to fall forward a bit, you can push back from your fingertips.</li><li>Never jump or move quickly into this pose. Instead, slowly pour your weight forward, pushing with the palms of your hand to control each millimeter of the movement.</li><li>Crow Pose can be performed with the elbows straight or slightly bent. For beginners, a slight bend makes it easier to balance, as well as to rest your knees more easily against your arms for balance.</li></ul>', '<ul><li>Keep breathing as calmly as possible throughout the entire exercise. Using a light breath may help avoid unnecessary movement in the torso to help with balance.</li></ul>', NULL, 'https://player.vimeo.com/external/646539023.hd.mp4?s=2f9c28e50dc62879357e333cc84eceeaefd5425a&profile_id=175', 'https://i.vimeocdn.com/video/1301521095-13b69b373d4c71a52eac4d6a404aef83baeeeb10931707852_640', 'https://player.vimeo.com/external/620356779.hd.mp4?s=9036b231ca2cb0c9330f51d7f3cd601550afac27&profile_id=175', NULL, 'core,forearms', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669979354.jpg', NULL, '2022-12-02 09:36:38'),
(53, 'Crow Pose - Modified 1 Leg', 'Duration', 'POZEX53', 'crow-pose-modified-1-leg', NULL, NULL, '<ul><li>When first learning this exercise, you can position yourself with a couch or bed just in front of you, so that it’s impossible to fall forward. But if you do fall a bit forward and your head comes to rest against that surface, instead of just stopping and starting over, push as hard as you can with your fingertips to bring your weight back. This is the way you’ll balance once you’re comfortable in this pose.</li><li>Keep your weight balanced over the pads of your 2nd and 3rd fingers. That way if you start to fall back a bit, you can push forward off your palm, and if you start to fall forward a bit, you can push back from your fingertips.</li><li>Never jump or move quickly into this pose. Instead, slowly pour your weight forward, pushing with the palms of your hand to control each millimeter of the movement.</li></ul>', '<ul><li>Keep breathing as calmly as possible throughout the entire exercise. Using a light breath may help avoid unnecessary movement in your torso to help with balance.</li></ul>', NULL, 'https://player.vimeo.com/external/646538622.hd.mp4?s=a67f54ee7bef9fff51bc6128191997017f394db6&profile_id=175', 'https://i.vimeocdn.com/video/1301526130-2565b2e19a217270e45fc0257d56bb745f77864034adbc7c3_640', 'https://player.vimeo.com/external/620356766.hd.mp4?s=cbba731e5cdd1b97890507fad6c9d78388e07800&profile_id=175', NULL, 'core,forearms', NULL, 'building-mass', 'exercise', NULL, 'Advanced', '1669979417.jpg', NULL, '2022-12-02 09:36:39'),
(54, 'Decline Push-Ups', 'Reps', 'POZEX54', 'decline-push-ups', NULL, NULL, '<ul><li>As you begin working on Decline Push-Ups, start with your feet just a bit off the ground, using a large book or similar surface. As you get stronger and more comfortable, you can continue increasing the height of the surface for your feet.</li><li>Depending on the height of the surface you use for your feet, you may need to bend your neck and look up a bit to avoid hitting your nose on the ground. This is totally fine, but try to keep your lower back as long and straight as possible throughout.</li><li>Keep your elbows between a 30-45° angle, choosing the angle that is most comfortable for your body.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears throughout the entire exercise.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604900406.hd.mp4?s=75a6d2e460399e8421ad4e27e22075342d4a7efe&profile_id=175', 'https://i.vimeocdn.com/video/1241311088-a4c9512e00185ac02ddf85ab5f9c1fad62675b6ceb04e0b6a55f6a00b6fe1263-d_640', 'https://player.vimeo.com/external/613859808.hd.mp4?s=9cec284d720f5fa92a608f4d00d711cb6f358ee1&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669979466.jpg', NULL, '2022-12-02 09:36:39'),
(55, 'Elevated Glute Bridge Hold', 'Duration', 'POZEX55', 'elevated-glute-bridge-hold', NULL, NULL, '<ul><li>Rather than trying to move your pelvis “up,” drive your knees away from your head to create the longest line possible through the spine.</li><li>Gently pulling your heels toward your head will avoid the chair moving, as well as increasing the challenge to the hamstrings.</li><li>Begin the movement by gently tucking your tailbone and rolling your hips up off the ground.</li><li>Smoothly lower yourself back down at the end, releasing the gentle tuck of your pelvis only once your entire back is flat on the ground.</li></ul>', '<ul><li>Exhale as you tuck your pelvis and raise your hips. Then use a continuous light, controlled breath while holding at the top of the movement to avoid unnecessary movement of your torso. Exhale down.</li></ul>', NULL, 'https://player.vimeo.com/external/615706133.hd.mp4?s=ace3f7499b05de8e09c292de56fb91124be4443c&profile_id=175', 'https://i.vimeocdn.com/video/1257645661-f76ce73621750d671f11036233cc783ba731f88fe9e9e9ecbbd15bfc2a8ee418-d_640', 'https://player.vimeo.com/external/613860017.hd.mp4?s=163c0f211701b896ea179bcab627239c663287cf&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669979510.jpg', NULL, '2022-12-02 09:36:40'),
(56, 'Elevated Glute Bridge Hold - 1 Leg', 'Duration', 'POZEX56', 'elevated-glute-bridge-hold-1-leg', NULL, NULL, '<ul><li>In order to lift and lengthen one leg, think about the toes reaching up and away, rather than just “lifting your leg.”</li><li>Always keep both thighs at the same height, as if you were performing an Elevated Glute Bridge Hold with both feet down. The only movement should be your lower leg and the foot on each rep.</li><li>It is incredibly easy to allow your pelvis to start to drop without noticing while holding one leg up. So really focus on reaching away with your toes and keeping your hips high!</li><li>Begin the movement by gently tucking your tailbone and rolling your hips up off the ground.</li></ul>', '<ul><li>Exhale as you tuck the pelvis and raise your hips. Then use a continuous light, controlled breath while holding at the top of the movement to avoid unnecessary movement of your torso. Exhale down.</li></ul>', NULL, 'https://player.vimeo.com/external/615702427.hd.mp4?s=dda23dbfb61bae45097d82e88172ed91988dd3d0&profile_id=175', 'https://i.vimeocdn.com/video/1257640688-bcaf9d6d78880663ac1620cfbe06a4989a7e615dc1c17908124cdc1d1fd8114c-d_640', 'https://player.vimeo.com/progressive_redirect/playback/613859984/rendition/1080p?loc=external&signature=5e4591fe445233d09e5e1dc7fbbc782f39908203921e4899ff26b0e1bcb76681', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669981686.jpg', NULL, '2022-12-02 09:36:41'),
(57, 'Elevated Glute Bridge with Kicks', 'Reps', 'POZEX57', 'elevated-glute-bridge-with-kicks', NULL, NULL, '<ul><li>Imagine you are shooting paint out of the toes of your lengthened leg, and try to paint the biggest arc possible. Rather than pulling your leg toward you, think about reaching your toes away and really enjoy the momentum of each kick.</li><li>It’s super fun to get into a really rocking swing with the lengthened leg. But always be sure to only kick as far as you can while keeping your hips high and your leg straight.</li><li>Regarding the foot on the chair, pulling your heel a bit toward your head will avoid the chair moving, as well as increasing the challenge to the hamstrings.</li></ul>', '<ul><li>Exhale as you kick the leg toward your head, using the engagement of your core that comes with a strong exhale to help stabilize the pelvis as your leg moves dynamically. Inhale as your leg moves back out away from your head.</li></ul>', NULL, 'https://player.vimeo.com/external/615707087.hd.mp4?s=182db47855b2c208f417d21dda90b14cc961d5f7&profile_id=175', 'https://i.vimeocdn.com/video/1257646691-6ef228565f7085076c2d8668e0b48cb67810cc2a0eecb1210279c8c3c49c55e7-d_640', 'https://player.vimeo.com/external/613860044.hd.mp4?s=b84029dfc4d1a11eecf8f0a66a46cc6c0c0b762d&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Advanced', '1669981721.jpg', NULL, '2022-12-02 09:36:42'),
(58, 'Elevated Glute Bridge with Leg Extensions', 'Reps', 'POZEX58', 'elevated-glute-bridge-with-leg-extensions', NULL, NULL, '<ul><li>In order to lift and lengthen one leg, think about the toes reaching away from your head, rather than just “lifting the leg.”</li><li>Always keep both thighs at the same height, as if you were performing an Elevated Glute Bridge Hold with both feet down. The only movement should be the lower leg and the foot on each rep.</li><li>During the transition from one leg to the other, it is incredibly easy to allow the hips to drop without noticing. Focus on keeping the hips high and still as you switch legs on each rep. Feel free to take your time switching legs as you learn this exercise, eventually decreasing the transition time as you gain mastery.</li></ul>', '<ul><li>Exhale gently as you lift the leg on each rep. Inhale as you lower the leg back to the chair.</li></ul>', NULL, 'https://player.vimeo.com/external/615705337.hd.mp4?s=6b1616e116e538be2f71ca0b20ce9cf891e79dd7&profile_id=175', 'https://i.vimeocdn.com/video/1257644506-3d16f134ea17eee04160e2d13f8d59b4e86f5f1e3a457fcfa9f3db408e079a58-d_640', 'https://player.vimeo.com/external/613860088.hd.mp4?s=1f8aa4942c18760d99bc4bfb9b4550ea2558ae6c&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669981759.jpg', NULL, '2022-12-02 09:36:42'),
(59, 'Elevated Undulating Glute Bridge', 'Reps', 'POZEX59', 'elevated-undulating-glute-bridge', NULL, NULL, '<ul><li>The goal of this exercise is to increase your ability to articulate clearly through your spine, trying to move just one vertebra at a time. So you should start very slowly, and only start gradually increasing the speed once you can really feel each individual vertebra lifting off the ground in sequence.</li><li>While the movement begins with a clear tucking of your pelvis, you want to focus on pointing your tailbone up and forward, so that both your knees and your tailbone are moving constantly up at an angle away from your head.</li><li>The way down is just as important as the way up! Don’t just drop your spine onto the ground. Rather try to articulate as clearly as possible, only allowing one vertebra at a time to come into contact with the floor.</li></ul>', '<ul><li>Exhale as you tuck the pelvis and begin the movement. Then use a continuous light, controlled breath throughout the movement, trying not to let the breath cause any unnecessary movement or wobble in the upper body or legs.</li></ul>', NULL, 'https://player.vimeo.com/external/615708223.hd.mp4?s=9f98b0e015fb10d4434373e0c6e4698c8dc282ba&profile_id=175', 'https://i.vimeocdn.com/video/1257655200-70ef35655867d0a7d0723e6cfd076fc9ed787b0fa9679aa89f568e4d5e3cc78c-d_640', 'https://player.vimeo.com/external/613860119.hd.mp4?s=b5e9f183a231ac8fb710f6c280d26af3fb7762eb&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669981802.jpg', NULL, '2022-12-02 09:36:43'),
(60, 'Extended Glute Bridge Hold', 'Duration', 'POZEX60', 'extended-glute-bridge-hold', NULL, NULL, '<ul><li>The further your heels are from your head, the harder this exercise will be. So you can try it at first with the feet just a bit further from you than you would for a regular Glute Bridge, and then move them further and further away as you get stronger and more comfortable with the movement.</li><li>Pull your heels gently back toward your head throughout the entire hold. This will help keep the hips as high as possible, while also increasing the challenge to the hamstrings.</li><li>At the top of the movement the front of your pelvis should be higher than your belly. Achieve this by pushing the hips upwards while gently contracting your core to avoid overarching the lower back.</li></ul>', '<ul><li>Exhale as you tuck your pelvis and raise your hips. Then use a continuous light, controlled breath while holding at the top of the movement. Exhale down.</li></ul>', NULL, 'https://player.vimeo.com/external/615717244.hd.mp4?s=a73caeebef8d624ef945e17c477509ffc89a564f&profile_id=175', 'https://i.vimeocdn.com/video/1257656045-09f0fd0e14a8f75b9e722d7a05ded0ef08a721c8482839109b712577290e135e-d_640', 'https://player.vimeo.com/external/613860248.hd.mp4?s=7415f73902b4ecd86f0d38bbcdde30a61d435f34&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669981843.jpg', NULL, '2022-12-02 09:36:44'),
(61, 'Extended Lunges', 'Reps', 'POZEX61', 'extended-lunges', NULL, NULL, '<ul><li>The further back you place the back foot, the harder this exercise will be, in terms of strength, balance, and flexibility. So start with your feet just a bit further apart from each other than you would for a traditional lunge, and move them further and further as you get more comfortable with the movement.</li><li>Keep your torso as vertical as possible throughout the movement. To achieve this, look forward, not down, and avoid leaning forward at any point.</li><li>Place your fingertips lightly against the back of your head, keeping your elbows open and your shoulders relaxed down away from your ears. In order to lengthen through the back of the neck, do not lace your fingers behind your head.</li><li>Push up until both legs are straight at the top of each rep.</li></ul>', '<ul><li>Inhale down, exhale up.</li><li>You can also invert the breathing, inhaling up, in order to feel how the inhalation can help expand the chest and torso at the top of the movement.</li></ul>', NULL, 'https://player.vimeo.com/external/640877994.hd.mp4?s=77e481f06327b136b1d00054289ba8a39638706f&profile_id=175', 'https://i.vimeocdn.com/video/1289144780-b6d883e4f3a29ad081cf2bf66320caab3653be6d991dae751_640', 'https://player.vimeo.com/external/620356832.hd.mp4?s=deb26dbdeed139f612b2d96a365aafe357505f51&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669981898.jpg', NULL, '2022-12-02 09:36:44'),
(62, 'Fingertip Push-Ups', 'Reps', 'POZEX62', 'fingertip-push-ups', NULL, NULL, '<ul><li>If you’ve never tried Fingertip Push-Ups before, you may want to first work on your Fingertip Plank first, to build the finger and hand strength before moving on to this more dynamic exercise.</li><li>Think of actively pushing your body up with your fingers, rather than feeling the weight sinking down into them. Keep your hands and fingers as active as possible throughout the exercise.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears throughout the entire exercise.</li><li>Gently engage your core to lengthen the spine, trying to keep the longest line possible from your heels to the top of your head.</li><li>To make this exercise easier, feel free to perform it with your knees on the ground.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604900658.hd.mp4?s=f24ab56a905d119d8087c067e873338e1f3a2e7d&profile_id=175', 'https://i.vimeocdn.com/video/1241311248-e030987510d0c869cbfffc126a386ae8624d1559510e186cbdb90e4185ec6ae4-d_640', 'https://player.vimeo.com/external/613860400.hd.mp4?s=aba0f17707bf423d35258e416cb3ad04814d177f&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669981933.jpg', NULL, '2022-12-02 09:36:45'),
(63, 'Fists of Fury', 'Reps', 'POZEX63', 'fists-of-fury', NULL, NULL, '<ul><li>This exercise can rock your biceps and triceps as much as lifting weights if you choose to really give it everything you’ve got. The key is to start by pushing the two fists as hard as possible against each other. Then, push the top fist even harder to initiate the movement. Most people start this exercise off powerfully, and then gradually decrease the intensity of the fists pushing into each other. Be sure to push like crazy the entire time!</li><li>Keep your chest as wide as possible the entire time, especially as you push your hands away from you.</li><li>You can push your hands straight out in front of you, or a bit down at the same time. The goal is to find the angle that allows you to straighten your elbows as much as possible at the end of the push, and that will change from body to body. So be sure to experiment with different angles to find the one that feels best to you!</li></ul>', '<ul><li>Exhale powerfully during the push in both directions. Inhale at the top and bottom of the movement, before beginning the intense push.</li></ul>', NULL, 'https://player.vimeo.com/external/628385029.hd.mp4?s=51e6b3b52433541155c3e77a703befb2719c02ae&profile_id=175', 'https://i.vimeocdn.com/video/1270673725-9d16cb415f585a917f058144abc44fa77165c16f7d215ab5c_640', 'https://player.vimeo.com/external/567718971.hd.mp4?s=f469b5d856c8312f7675b3489dac44089b7cb608&profile_id=175', NULL, 'triceps,biceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', '1669981970.jpg', NULL, '2022-12-02 09:36:46'),
(64, 'Forward Lunges', 'Reps', 'POZEX64', 'forward-lunges', NULL, NULL, '<ul><li>It’s fine for your front knee to move slightly forward as you bend your legs, but you don’t want to move much past the toes of the front foot. So focus on stepping actively forward, but then on feeling a real sense of verticality  as you lower yourself down to the bottom of each rep.</li><li>Lower your back knee as close to the ground as possible without touching it on each rep.</li><li>Push powerfully back to standing from the very bottom of the movement. It’s common for folks to first stand, then push back. Try to keep the full return to standing one dynamic movement.</li><li>Keep your torso as vertical as possible throughout the movement. To achieve this, look forward, not down, and avoid leaning forward at any point.</li><li>Place your fingertips lightly against the back of your head, keeping your elbows open and your shoulders relaxed down away from your ears. In order to lengthen through the back of the neck, do not lace your fingers behind your head.</li></ul>', '<ul><li>Exhale as you descend and through the beginning of the push back up. Inhale as your momentum carries you back to standing.</li></ul>', NULL, 'https://player.vimeo.com/external/640878052.hd.mp4?s=376c0a2194b5a60d9e78cafd162b01324da10a36&profile_id=175', 'https://i.vimeocdn.com/video/1289144824-720f9d7561589057da1141505df584738f3ff3e718740b97f_640', 'https://player.vimeo.com/external/620357151.hd.mp4?s=a5d5426a3d68fd43d64ef1047b6d5e0cbc5f8adc&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669982022.jpg', NULL, '2022-12-02 09:36:46'),
(65, 'Freeze', 'Reps', 'POZEX65', 'freeze', NULL, NULL, '<ul><li>If you’re new to this movement, be sure to start very slowly, really taking your time to properly place the hands and lower the head to the ground. To get your legs off the ground, you never want to jump or move quickly. Instead, pour your weight into your hands, feeling the weight release off the legs until you can gently lift them.</li><li>Similarly, at the beginning you can really take your time on each side, holding for multiple breaths until you feel comfortable moving into and out of that position. You can even perform this as a held exercise rather than performing reps, seeing how long you can stay in a calm balance on each side.</li><li>To make it easier to get your weight onto your hands and head, try to get your elbow into your side as low as possible, close to your belly button. This will help keep more of your weight off the legs.</li><li>Never allow your weight to push down into your hands and wrists. Instead, focus on pushing actively through the pads of your fingers, as well as your fingertips, the entire time.</li></ul>', '<ul><li>Breathe calmly throughout the exercise. Never hold your breath, but also keep your breath light so as to encourage the core engagement necessary to stabilize the body over the hands and head.</li></ul>', NULL, 'https://player.vimeo.com/external/646541041.hd.mp4?s=d657dc8ea86fbe154da9cab5cf0e199e92e85bc9&profile_id=175', 'https://i.vimeocdn.com/video/1301514182-b750fdb3e5bec5a409be18e9e4114228026635033df62f829_640', 'https://player.vimeo.com/external/620357551.hd.mp4?s=258159cce995042ca01a7bcc3c2d59a77696c1d8&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669982084.jpg', NULL, '2022-12-02 09:36:47'),
(66, 'Freeze with Kicks', 'Reps', 'POZEX66', 'freeze-with-kicks', NULL, NULL, '<ul><li>Be sure to practice the foundational Freeze (without kicks) before moving onto this more advanced version.</li><li>I generally teach this exercise with two kicks on each side (one with each leg). But feel free to play with it. You can do 4 or more kicks, as well as playing with different movements with the legs. There’s no end to the fun variations you can create!</li><li>To make it easier to get your weight onto your hands and head, try to get your elbow into your side as low as possible, close to your belly button. This will help keep more of your weight off the legs.</li><li>Never allow your weight to push down into your hands and wrists. Instead, focus on pushing actively through the pads of your fingers, as well as your fingertips, the entire time.</li></ul>', '<ul><li>Breathe calmly throughout the exercise. Never hold your breath, but also keep your breath light so as to encourage the core engagement necessary to stabilize the body over the hands and head.</li></ul>', NULL, 'https://player.vimeo.com/external/646539743.hd.mp4?s=786241959ba319e49c1d81c3ee72c152c57990e0&profile_id=175', 'https://i.vimeocdn.com/video/1301516619-498b178b458740ea33fe26f08d03e2becce7c3ab23b976455_640', 'https://player.vimeo.com/external/620357270.hd.mp4?s=b2663863692b1e25bde8adce79d3c7c36cf418ad&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669982111.jpg', NULL, '2022-12-02 09:36:48'),
(67, 'Freeze with Vertical Balance', 'Reps', 'POZEX67', 'freeze-with-vertical-balance', NULL, NULL, '<ul><li>Be sure to practice the foundational Freeze, and then Freeze with Kicks, before moving onto this more advanced version.</li><li>Take your time feeling a really solid balance on each side before starting to lift the legs. Move slowly and try to really feel where your legs and feet are in space. It is very helpful to point your toes and really reach toward the sky with them.</li><li>If you’re new to this exercise, you can ask a friend to spot you at first. Ask them to not actually hold your legs, but to keep their hands right around your legs as you move up and down, so they can help you stabilize if needed.</li><li>Never allow your weight to push down into your hands and wrists. Instead, focus on pushing actively through the pads of your fingers, as well as your fingertips, the entire time.</li></ul>', '<ul><li>Breathe calmly throughout the exercise. Never hold your breath, but also keep your breath light so as to encourage the core engagement necessary to stabilize the body over the hands and head.</li></ul>', NULL, 'https://player.vimeo.com/external/646540390.hd.mp4?s=44967b828041d2149884bf1b9a5393b16b08a760&profile_id=175', 'https://i.vimeocdn.com/video/1301517959-9511803fe8dfeef68e2fe0f266a2334c100851ef99b54901c_640', 'https://player.vimeo.com/external/620357489.hd.mp4?s=9ea43c0e63cbe0e4ecdc2c7647b446fd6ad8083b&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Advanced', '1669982155.jpg', NULL, '2022-12-02 09:36:48'),
(68, 'Glute Bridge - Alternating Leg Extensions', 'Reps', 'POZEX68', 'glute-bridge-alternating-leg-extensions', NULL, NULL, '<ul><li>In order to lift and lengthen one leg, think about the toes reaching up and away from your head, rather than just “lifting the leg.”</li><li>Always keep both thighs at the same height, as if you were performing a Glute Bridge with both feet down. The only movement should be the lower leg and the foot on each rep.</li><li>During the transition from one leg to the other, it is incredibly easy to allow the hips to drop without noticing. Focus on keeping the hips high and still as you switch legs on each rep. Feel free to take your time switching legs as you learn this exercise, eventually decreasing the transition time as you gain mastery.</li></ul>', '<ul><li>Exhale gently as you lift the leg on each rep. Inhale as you lower the leg back to the chair.</li></ul>', NULL, 'https://player.vimeo.com/external/615704151.hd.mp4?s=f6256f3f29f2e0d1c68894e3786c3dc7992f0527&profile_id=175', 'https://i.vimeocdn.com/video/1257643513-1a704b858392666733461fd67d2de2f6b810e2ced8a40b384d570ea8dd29e73b-d_640', 'https://player.vimeo.com/external/613860428.hd.mp4?s=19deb18e7656895b19584aa1863fd6c3c95fc9c7&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669982184.jpg', NULL, '2022-12-02 09:36:49'),
(69, 'Glute Bridge - Reps', 'Reps', 'POZEX69', 'glute-bridge-reps', NULL, NULL, '<ul><li>At the top of the movement the front of your pelvis should be higher than your belly. Achieve this by pushing the hips upwards while gently contracting your core to avoid overarching the lower back.</li><li>When you think you’re at the top of each rep, you’re probably not! Try to squeeze and push your hips just a tiny bit higher at the top of each rep.</li><li>Begin the movement by gently tucking your tailbone and rolling your hips up off the ground. Then drive your knees away from your head the entire time, working to lengthen the spine as much as possible.</li><li>Smoothly lower yourself back down on each rep, never just letting the pelvis drop down to the ground at the end.</li></ul>', '<ul><li>Exhale as you tuck the pelvis and raise your hips. Then use a continuous light, controlled breath while holding at the top of the movement. Exhale down.</li></ul>', NULL, 'https://player.vimeo.com/external/615722642.hd.mp4?s=5234a9e90098b7f55d6801e6537371bef24286fe&profile_id=175', 'https://i.vimeocdn.com/video/1257663552-820a1b727b699c74314fd3566cc3e0c3ca9d051593c2926a6080d5ae60279fbe-d_640', 'https://player.vimeo.com/external/613860508.hd.mp4?s=4d133998d11bbbea164fbd94eeb4da67f4a12338&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669982214.jpg', NULL, '2022-12-02 09:36:50'),
(70, 'Glute Bridge Hold', 'Duration', 'POZEX70', 'glute-bridge-hold', NULL, NULL, '<ul><li>At the top of the movement the front of your pelvis should be higher than your belly. Achieve this by pushing your hips upwards while gently contracting your core to avoid overarching your lower back.</li><li>Begin the movement by gently tucking your tailbone and rolling your hips up off the ground.</li><li>Drive your knees away from your head the entire time, working to lengthen the spine as much as possible.</li><li>Smoothly lower yourself back down at the end, releasing the gentle tuck of your pelvis only once your entire back is flat on the ground.</li></ul>', '<ul><li>Exhale as you tuck your pelvis and raise your hips. Then use a continuous light, controlled breath while holding at the top of the movement. Exhale down.</li></ul>', NULL, 'https://player.vimeo.com/external/615724295.hd.mp4?s=9a1bf5bda45c01088ada1436591e9d29077594b8&profile_id=175', 'https://i.vimeocdn.com/video/1257665594-ee0831ccd49fb03f817b6a9a4a20410a5cdf1442e07990cfd7b59a5073f54f37-d_640', 'https://player.vimeo.com/external/613860678.hd.mp4?s=90ec7ca1eb9370cf37b63ef2941afc16ccf48d58&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', '1669982241.jpg', NULL, '2022-12-02 09:36:51'),
(71, 'Glute Bridge Walkouts', 'Reps', 'POZEX71', 'glute-bridge-walkouts', NULL, NULL, '<ul><li>Take small steps at the beginning. Prioritize keeping the hips high and the spine as long as possible.</li><li>It’s easy to let your pelvis and torso rock from side to side as you move the legs. It’s ok for there to be a small lateral rock to allow your legs to move easily, but try to keep the movement as gentle as possible.</li><li>As you walk your feet out, each time you put your heel down, pull it gently back toward your body. This will help keep your torso from wobbling and will increase the challenge to the hamstrings.</li></ul>', '<ul><li>Breathe calmly throughout the entire exercise. Use a light, controlled breath to avoid unnecessary movement in your torso or pelvis.</li></ul>', NULL, 'https://player.vimeo.com/external/615727248.hd.mp4?s=932b35db37d279fb070725ffc54dceb67df2144e&profile_id=175', 'https://i.vimeocdn.com/video/1257668042-31a6a07ff462c10f5bf525c831b2d3618113671d9512c8294c667d779bc0a73d-d_640', 'https://player.vimeo.com/external/613860822.hd.mp4?s=7aeaf64fc65d5e5b79b09b5f15fdad7d056a2e05&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669982440.jpg', NULL, '2022-12-02 09:36:51');
INSERT INTO `exercises` (`id`, `title`, `based_on`, `code`, `slug`, `category_id`, `duration`, `instructions`, `breath`, `description`, `tip_video`, `tip_video_thumbnail`, `video_link`, `reps`, `focus_area`, `specific_muscles`, `good_for`, `type`, `Notes`, `level`, `image`, `tags`, `created_at`) VALUES
(72, 'Glute Bridge with Kicks', 'Reps', 'POZEX72', 'glute-bridge-with-kicks', NULL, NULL, '<ul><li>Imagine you are shooting paint out of the toes of your lengthened leg, and try to paint the biggest arc possible. Rather than pulling your leg toward you, think about reaching your toes away and really enjoy the momentum of each kick.</li><li>It’s super fun to get into a really rocking swing with the lengthened leg. But always be sure to only kick as far as you can while keeping your hips high and your leg straight.</li><li>For your foot on the ground, pull your heel a bit toward your head while performing the kicks. This will help stabilize your pelvis, as well as increasing the challenge to the hamstrings.</li></ul>', '<ul><li>Exhale as you kick the leg toward your head, using the engagement of the core that comes with a strong exhale to help stabilize the pelvis as the leg moves dynamically. Inhale as the leg moves back out away from your head.</li></ul>', NULL, 'https://player.vimeo.com/external/615726188.hd.mp4?s=6871536ef3834bdf7ac07d22b6be1dce374d7962&profile_id=175', 'https://i.vimeocdn.com/video/1257666583-87f880b07ab36dc82bb063d2a7521281ab0c18b0e6402453c4f083f735e2bc24-d_640', 'https://player.vimeo.com/external/613860988.hd.mp4?s=726b5f0800bcad65a52532444928be93f448ac0d&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669982479.jpg', NULL, '2022-12-02 09:36:52'),
(73, 'Good Mornings ', 'Reps', 'POZEX73', 'good-mornings', NULL, NULL, '<ul><li>You can perform Good Mornings with straight legs or with a slight bend in the knees as you lower your torso down. The straight leg version will increase the stretch and strengthening in the lower back and backs of the legs, but it’s much better to bend your knees if that allows you to keep your spine long instead of rounding in your lower back.</li><li>As you lower your torso down, allow your weight to shift slightly back toward your heels, so your pelvis and legs can move slightly back to counterbalance the weight of your torso moving forward off of your axis.</li><li>Keep your chest open and your shoulders relaxed down away from your ears the entire time.</li><li>Only go as low as you can with a straight back. I highly recommend filming yourself with your phone, as I find folks very often round in their lower backs without realizing it!</li></ul>', '<ul><li>Inhale down, exhale up. On the way down, pay attention to how the inhalation expands the chest and torso, making it easier to lengthen the spine and keep the chest open as you descend.</li></ul>', NULL, 'https://player.vimeo.com/progressive_redirect/playback/673638786/rendition/1080p?loc=external&signature=e89da06223868ec470c4ba877e96933a8586d258d0ed770b29bdd52f62bd0520', 'https://i.vimeocdn.com/video/1257666583-87f880b07ab36dc82bb063d2a7521281ab0c18b0e6402453c4f083f735e2bc24-d_640', 'https://player.vimeo.com/external/624194560.hd.mp4?s=2a204b6d1c4007819671cba62ba8d879eb635ed0&profile_id=175', NULL, 'back', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:36:53'),
(74, 'Good Mornings with Twist', 'Reps', 'POZEX74', 'good-mornings-with-twist', NULL, NULL, '<ul><li>Always try to lift one elbow without letting the other elbow descend. The more you focus on preventing that other elbow from moving down (rather than just twisting the torso), the more benefit you’ll get!</li><li>As you get to the top of each twist, try to push that elbow even higher than you think you can for an extra second, exhaling powerfully to assist the movement. To increase the challenge, actively lift that elbow toward the sky for an entire exhale on each side.</li><li>You can perform Good Mornings with Twist with straight legs or with a slight bend in the knees. The straight leg version will increase the stretch and strengthening in the lower back and backs of the legs, but it’s much better to bend the knees if that allows you to keep the spine long instead of rounding in the lower back.</li><li>Keep your chest open and your shoulders relaxed down away from your ears the entire time.</li><li>Only go as low as you can with a straight back. I highly recommend filming yourself with your phone, as I find folks very often round in their lower backs without realizing it!</li></ul>', '<ul><li>Inhale in the middle and then exhale as you lift the elbow on each side. Using a strong, controlled exhale will help stabilize the core and allow for more engagement of the deeper rotational muscles around the spine.</li></ul>', NULL, 'https://player.vimeo.com/external/628388070.hd.mp4?s=251f95ac14e9cf9a148647aa397da41c37dfc3b9&profile_id=175', 'https://i.vimeocdn.com/video/1270676113-c117cdf28b41fce39f6cab812323488ef31dc520916aeb824_640', 'https://player.vimeo.com/external/624194245.hd.mp4?s=a6528540c6d07738d1df78279699b2e026d4516f&profile_id=175', NULL, 'core,back', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', '1669982538.jpg', NULL, '2022-12-02 09:36:53'),
(75, 'Groiners', 'Reps', 'POZEX75', 'groiners', NULL, NULL, '<ul><li>Groiners are extremely versatile, and can be performed more like a stretch, or more like a dynamic core and mobility exercise. You can play with both versions, but I recommend you always start out slowly. With one knee forward, really take your time to feel the position and to sink deep into your hip flexibility. Then you can gradually increase the speed, never going faster than you can while keeping perfect form on every rep.</li><li>Depending on your flexibility and anatomy, you may or may not be able to place your foot right next to your hand. No problem! You can keep it a bit back and/or out as necessary, and gradually work on getting closer and closer to the “textbook” version over time.</li><li>Try to keep the hips low as you switch legs on each rep. While there will always be a bit of movement in the pelvis to make room for the legs, you don’t want the hips to travel too high.</li></ul>', '<ul><li>When performing Groiners slowly, switch your legs during the exhale, then take at least one full breath before switching legs again. As you increase the speed, you can shift to a constant, calm breathing, never holding your breath or breathing too fast.</li></ul>', NULL, 'https://player.vimeo.com/external/646541331.hd.mp4?s=8e9cd5d0e320ef0ba4373468a36c0b86422b17ab&profile_id=175', 'https://i.vimeocdn.com/video/1301513147-b058d064555658c482b20aebd258227e07d03afeb2d9a16eb_640', 'https://player.vimeo.com/external/624195192.hd.mp4?s=13ef6d56dd96d925640c6820cfc23d07d4650530&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', '1669982565.jpg', NULL, '2022-12-02 09:36:54'),
(76, 'Hand Crushers', 'Reps', 'POZEX76', 'hand-crushers', NULL, NULL, '<ul><li>This is an excellent warm-up for the wrists before weight-bearing exercises such as push-ups or planks. If you’re using it as a warm-up, push past the burn just a bit, enough to get the blood really flowing and the muscles of the forearm activated, but not enough to get sore. If you’re looking to build forearm strength, you can continue to total failure and then repeat for multiple sets. In either case, it’s going to burn, so be sure to enjoy it!</li><li>Open both hands as wide as possible and then close them as tightly as possible on each and every rep, no matter how fast you go.</li><li>Start each set slowly, in order to ensure complete opening and closing of the hands, then increase the speed to find a fun and challenging flow.</li><li>Keep your chest open and your shoulders relaxed down away from your ears the entire time.</li></ul>', '<ul><li>Keep breathing as calmly as possible throughout the entire exercise, which will not be easy toward the end! You can also sing a silly song to take your mind off the pain and inject more fun into this awesome exercise.</li></ul>', NULL, 'https://player.vimeo.com/external/628393472.hd.mp4?s=72452262edfe3e7c712316e010d934a090b749ee&profile_id=175', 'https://i.vimeocdn.com/video/1270682076-d39375351f57861a3c3dce78ce2d12265cd41d3d72d48907b_640', 'https://player.vimeo.com/progressive_redirect/playback/620357589/rendition/1080p?loc=external&signature=f3b9c935efc730f80f35735a438b9288de7715361a95c38af75bb7457b2ecc2e', NULL, 'forearms', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner,Intermediate,Advanced', '1669982592.jpg', NULL, '2022-12-02 09:36:55'),
(77, 'Handstand Against Wall', 'Reps', 'POZEX77', 'handstand-against-wall', NULL, NULL, '<ul><li>Always take the time to place your hands properly before kicking up into the handstand. Your hands should be just a few inches from the wall and directly under your shoulders</li><li>If you’re new to this exercise, ask a friend to spot you as you try the first few times. NEVER ask someone to hold your legs, as that increases the chance that you might fall on your head. Instead, ask them to hold your hips on each side, so that you can always quickly and easily relax your legs back down if you need to.</li><li>Push powerfully through your hands and keep your arms straight as you kick up.</li><li>Keep your abs engaged throughout, trying to keep the lower back lengthened as much as possible to avoid the “banana” position.</li><li>You can relax your head completely and look straight out in front of you, or you can look down between your thumbs. Relaxing your head will help keep a straighter spine, and looking down will help increase balance, which is helpful if your goal is to learn a free-standing handstand. But if you do look down, make sure to only tilt your head up as much as is necessary to see the space between your thumbs. If you can see the wall, your head is too far back, which will make it much harder to keep a long, straight spine.</li></ul>', '<ul><li>Exhale while kicking up. Once up, keep a calm, controlled breath throughout the hold. Focus particularly on using a strong (but not deep) exhale to help keep the abs engaged.</li></ul>', NULL, 'https://player.vimeo.com/external/604890466.hd.mp4?s=4a7a437b4c23c7c10fbdb9f185416219d53cfc83&profile_id=175', 'https://i.vimeocdn.com/video/1241300489-4ca98c3f2d366d612868706872413a3d1649e034a191175e6c74561e0b9cea95-d_640', 'https://player.vimeo.com/external/620357671.hd.mp4?s=16f82ce55b09c5403e1d29ea6d338ba409170caa&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:36:55'),
(78, 'Handstand Against Wall - 1 Foot', 'Reps', 'POZEX78', 'handstand-against-wall-1-foot', NULL, NULL, '<ul><li>This is the same as doing a normal Handstand Against Wall, except that once you’re in position, you’ll bend one knee so that the foot of the bent leg can gently touch the wall, but the rest of your body can be in a perfect straight line from your hands to the tips of your toes.</li><li>Keep your knees together, which will help you stabilize the entire body while allowing the necessary freedom on the foot of the bent leg to balance on the wall.</li><li>Always take the time to place your hands properly before kicking up into the handstand. Your hands should be just a few inches from the wall and directly under your shoulders</li><li>If you’re new to this exercise, ask a friend to spot you as you try the first few times. NEVER ask someone to hold your legs, as that increases the chance that you might fall on your head. Instead, ask them to hold your hips on each side, so that you can always quickly and easily relax your legs back down if you need to.</li><li>Keep your abs engaged throughout, trying to keep your lower back lengthened as much as possible to avoid the “banana” position.</li><li>You can relax your head completely and look straight out in front of you, or you can look down between your thumbs. Relaxing your head will help keep a straighter spine, and looking down will help increase balance, which is helpful if your goal is to learn an unsupported handstand. But if you do look down, make sure to only tilt your head back as much as is necessary to see the space between your thumbs. If you can see the wall, your head is too far back, which will make it much harder to keep a long, straight spine.</li></ul>', '<ul><li>Exhale while kicking up. Once up, keep a calm, controlled breath throughout the hold. Focus particularly on using a strong (but not deep) exhale to help keep your abs engaged.</li></ul>', NULL, 'https://player.vimeo.com/external/646542180.hd.mp4?s=8d57d2688c21af50a3b6bdeaec746390edca9dab&profile_id=175', 'https://i.vimeocdn.com/video/1301519754-8064569e5af78ab97c145c100e45ebf18345c7e40b41de07c_640', 'https://player.vimeo.com/external/620357625.hd.mp4?s=561655ee7fdf88e723c661969d2986a1cd1485b9&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:36:56'),
(79, 'Handstand Facing Wall - Cartwheel Up', 'Reps', 'POZEX79', 'handstand-facing-wall-cartwheel-up', NULL, NULL, '<ul><li>Do not try to cartwheel up into a handstand against the wall until you’re very comfortable performing the Handstand Facing Wall - Walk Up.</li><li>Try to get your hands as close as possible to the position they’ll be in during the handstand as you cartwheel up. Most people will need to move the hands in at least one small step after cartwheeling up, and that’s totally fine. Just try to focus on getting as quickly and cleanly as possible into the final handstand position.</li><li>Always come down at least a few seconds before you need to, to ensure you never find yourself running out of strength before smoothly and safely coming down.</li><li>Once up, your main goals are to</li><li>1)reach as high as you can with your toes</li><li>2)keep your sternum as far from the wall as possible</li><li>3)Keep your armpits as close to the wall as possible</li></ul>', '<ul><li>Exhale while cartwheeling up into position. Once up, keep a calm, controlled breath throughout the hold. Focus particularly on using a strong (but not deep) exhale to help keep your abs engaged.</li></ul>', NULL, 'https://player.vimeo.com/external/604890877.hd.mp4?s=3bb2d389a685993757f7817b73214a31bce7d750&profile_id=1755', 'https://i.vimeocdn.com/video/1241300142-33cce6e9bf07dbee300ef41b4536adf08a7dbff06b03e87052a3355e09d01e9a-d_640', 'https://player.vimeo.com/external/620357723.hd.mp4?s=082171f4ab7f3f352aa9bfc1e972f8e8f3633756&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:36:57'),
(80, 'Handstand Facing Wall - Walk Up', 'Reps', 'POZEX80', 'handstand-facing-wall-walk-up', NULL, NULL, '<ul><li>This is an excellent exercise to build shoulder and core strength, as well as to work toward an unsupported handstand. But you should be very comfortable holding a Handstand Against Wall (with your back facing the wall) for at least 30 seconds before attempting this more advanced variation.</li><li>The closer your hands are to the wall as you swing your legs up, the less you’ll have to walk in with your hands and the easier it’ll feel. On the other hand, if your hands are too close, it’s easy to “banana” and fall out of your handstand before even getting into position. I recommend starting with your hands about 60cm (2 feet) away from the wall at first.</li><li>Always come down at least a few seconds before you need to, to ensure you never find yourself running out of strength before smoothly and safely coming down.</li><li>1)Once up, your main goals are to</li><li>2)reach as high as you can with your toes</li><li>3)keep your sternum as far from the wall as possible</li><li>Keep your armpits as close to the wall as possible</li></ul>', '<ul><li>Exhale while kicking up into position. Once up, keep a calm, controlled breath throughout the hold. Focus particularly on using a strong (but not deep) exhale to help keep your abs engaged.</li></ul>', NULL, 'https://player.vimeo.com/external/604890877.hd.mp4?s=3bb2d389a685993757f7817b73214a31bce7d750&profile_id=175', 'https://i.vimeocdn.com/video/1241300142-33cce6e9bf07dbee300ef41b4536adf08a7dbff06b03e87052a3355e09d01e9a-d_640', 'https://player.vimeo.com/external/620357855.hd.mp4?s=c7138fca5fd5560e0410664e98ce468b016f18a0&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:36:57'),
(81, 'Handstand Push-Ups', 'Reps', 'POZEX81', 'handstand-push-ups', NULL, NULL, '<ul><li>Before trying Handstand Push-Ups for the first time, you should feel completely comfortable performing Handstand Scapular Push-Ups.</li><li>Place your hands about 1 hand-width wider on each side than you would for a normal handstand against the wall, and turn your fingers out to the sides just a bit, about 10 - 20 degrees.</li><li>If you’re new to this exercise, ask a friend to spot you as you try the first few times. NEVER ask someone to hold your legs, as that increases the chance that you might fall on your head. Instead, ask them to hold your hips on each side, so that you can always quickly and easily relax your legs back down if you need to.</li><li>As you start each session (even if you’ve done these before), only lower yourself a little bit on the first rep, to ensure you have a solid hand placement and will feel comfortable pushing yourself back up. Then you can go deeper and deeper until you can gently touch the top of your head to the ground on each rep.</li><li>Keep your abs engaged and try to avoid arching your back into the “banana” position throughout the exercise. If you’re struggling to avoid excessive curve in your lower back, practice Handstand Against Wall and Handstand Facing Wall to build the strength necessary to keep the core engaged while pushing yourself up.</li><li>Always roll your head and stretch your neck a bit before and after this exercise.</li></ul>', '<ul><li>Inhale at the top of the movement and during the first part of the descent. Then exhale for the rest of the descent and the push back to the top. Always feel free to take a full breath or two at the top anytime you like, but be careful not to let too big of a breath interfere with keeping your abs engaged and your lower back lengthened.</li></ul>', NULL, 'https://player.vimeo.com/external/646708398.hd.mp4?s=45a66eede97a0a32a22425a81758d79601f0a5a5&profile_id=175', 'https://i.vimeocdn.com/video/1301905262-da4234721822229b906668bd8a6821558dc7de339e42ce46a_640', 'https://player.vimeo.com/external/620358157.hd.mp4?s=4c4cd4e906b674f16cf6dd11a26ce9ebe62f0477&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:36:58'),
(82, 'Handstand Scapular Push-Ups', 'Reps', 'POZEX82', 'handstand-scapular-push-ups', NULL, NULL, '<ul><li>to be filled</li></ul>', '<ul><li>to be filled</li></ul>', NULL, 'https://player.vimeo.com/external/646708560.hd.mp4?s=e2830514ae4fa30f1eba54222f7afb5e601c8bad&profile_id=175', 'https://i.vimeocdn.com/video/1301905509-74a702dc8d03020b06f67203fb91704d812ab32ee5f5f7a0d_640', 'https://player.vimeo.com/external/620358436.hd.mp4?s=a5fd5d0d9ea38c143b15b2069bc21f88dab57672&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:36:59'),
(83, 'Handstand Walkout', 'Reps', 'POZEX83', 'handstand-walkout', NULL, NULL, '<ul><li>to be filled</li></ul>', '<ul><li>to be filled</li></ul>', NULL, 'https://player.vimeo.com/external/666658472.hd.mp4?s=a37c20fce283bb4f9f78c17c98a9da42fe0eda81&profile_id=175', 'https://i.vimeocdn.com/video/1349889853-90dda09a0f571bbb7b113079207c36b5de1b593cd90ce00c9d328f13cf6d1ee4-d_640', 'https://player.vimeo.com/external/620358502.hd.mp4?s=6c83540b07ca9958b81a577d7306f2501965da65&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:36:59'),
(84, 'Headstand - Combo', 'Reps', 'POZEX84', 'headstand-combo', NULL, NULL, '<ul><li>This exercise is a combination of Headstand Straddle Ups, Headstand Pike Ups, and Headstand Tuck Ups. So be sure to practice each of those separately before attempting this more advanced variation.</li><li>Each of the three headstand variations included in this combo version require a different degree of allowing the pelvis to shift backward to counterbalance your legs. So really take your time transitioning between each of the three as you begin practicing, to ensure you can really feel where your pelvis is and enjoy the subtle differences between each part of the exercise.</li><li>It’s difficult to practice this exercise with a wall behind you, as you need space to allow your pelvis to move quite far back for the Pike Up part of the exercise. So if you’re new to this, ask a friend to spot you by kneeling beside you and gently placing their hand on your lower back. That way they can help if you start to fall backward, but can move their hand with you as you allow your pelvis to shift forward and back with the different movements.</li><li>Always roll your head and stretch your neck a bit before and after this exercise.</li></ul>', '<ul><li>Inhale as you lower your legs or knees down in each of the three variations, and exhale as you lift them back up. Use a powerful, controlled exhale to encourage core engagement.</li></ul>', NULL, 'https://player.vimeo.com/external/604891667.hd.mp4?s=dce00c490abf800f06c8bdc7f240edb721c3bc48&profile_id=175', 'https://i.vimeocdn.com/video/1241301158-ec559db2aa07a740e9c631757e9e9dc639f5c9b17b2cbbe0784e38d596c97d6a-d_640', 'https://player.vimeo.com/external/620358918.hd.mp4?s=963ceb2cfe0a573b32a4bc673295fc43be144cc0&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:37:00'),
(85, 'Headstand - Elbows', 'Duration', 'POZEX85', 'headstand-elbows', NULL, NULL, '<ul><li>Your elbows are too far apart! I know, I know, I can’t see you, and yet I’m almost 100% sure this is true. Keep your elbows as close together as possible, especially as you get into position. This will create more space between your hands and your elbows, which increases your leverage so you can more easily stay in balance and avoid falling forward or back.</li><li>As you get into position, tuck your chin further down toward your chest than you think you need to. This will help ensure that once you move up into the headstand, your neck will be perfectly straight. Most people think their neck is lengthened when in fact it’s tilted back a bit, putting unnecessary strain on the back of the cervical spine. Once up, you should feel the weight exactly on the center of the top of your head, not further forward on the head or forehead.</li><li>Once up, push into the ground with your hands and elbows the entire time. If you’re in the correct position, you should be able to literally lift your head slightly off the ground, so as to avoid any unnecessary strain in the neck.</li><li>You can easily practice this with your back just a few centimeters away from  a wall.</li><li>Reach toward the sky with your toes the entire time. You can also film yourself to see if you’re truly straight, as most people feel like they’re straight when the legs are in fact leaning out in front of their body.</li><li>Always roll your head and stretch your neck a bit before and after this exercise.</li></ul>', '<ul><li>Exhale while lifting your legs up into position. Once up, keep a calm, controlled breath throughout the hold. Focus particularly on using a controlled exhale to help keep the abs engaged.</li></ul>', NULL, 'https://player.vimeo.com/external/604891094.hd.mp4?s=412ed4e23d07836b72d964e037cf524d96606610&profile_id=175', 'https://i.vimeocdn.com/video/1241300287-58769de8302dcbe885fd95446ae765e5d261ed39581a91bbe95a6a991209d323-d_640', 'https://player.vimeo.com/external/620358552.hd.mp4?s=c67bff56673869bf7af767ea373ce0a3274d5b80&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:01'),
(86, 'Headstand - Hands', 'Duration', 'POZEX86', 'headstand-hands', NULL, NULL, '<ul><li>Keep your hands directly out in front of your shoulders, rather than further apart from each other. Keep your elbows in the entire time, with the elbows at approximately 90 degree angles.</li><li>In the beginning, keep more of the weight on your hands, which will make it harder to keep your torso and legs perfectly vertical. That’s fine! Focus first on getting comfortable in the position without too much weight on your head and neck, and always push your head into the ground to lift your toes even higher, rather than allowing the weight to sink down into your neck.</li><li>Never kick up into a headstand. Instead, gently pour your weight into your hands and head until you can slowly and easily lift your feet off the ground.</li><li>As your neck muscles get stronger and you get more comfortable in this movement(which may take many weeks or months of regular practice), you can pour more weight into the head and neck. Eventually, for a rocking strength and balance challenge, you can practice this with only your fingertips on the ground. Then just three fingers, then two, then one, then… it’s time for a free-standing headstand!</li></ul>', '<ul><li>Exhale while lifting your legs up into position. Once up, keep a calm, controlled breath throughout the hold. Focus particularly on using a controlled exhale to help keep the abs engaged.</li></ul>', NULL, 'https://player.vimeo.com/external/604891486.hd.mp4?s=c239f955618f5f27601f190f81f5b64441f8cdf9&profile_id=175', 'https://i.vimeocdn.com/video/1241300700-7901bae37aadcb08eb922e5f7e9224cb22c59c49411752d711f8586aee73ea2a-d_640', 'https://player.vimeo.com/external/620358665.hd.mp4?s=dc28d73307127c4dea29dfba558018d18dd77705&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:02'),
(87, 'Headstand - Straddle Ups', 'Reps', 'POZEX87', 'headstand-straddle-ups', NULL, NULL, '<ul><li>To move your legs up or down, don’t think about moving them up or down! Rather reach out  as far as you can with your toes. The more you reach with your toes and open your legs out to the side, the less you’ll need to shift your weight forward and back and the easier it will be.</li><li>As your legs descend on each rep, allow your butt to shift back a bit, to counterbalance the weight of the legs out in front of you.</li><li>Keep your hands directly out in front of your shoulders, rather than further apart from each other. Keep your elbows in the entire time, with the elbows at approximately 90 degree angles.</li></ul>', '<ul><li>Inhale as you lower your legs, exhale as you reach out to the sides and then back up with your toes.</li></ul>', NULL, 'https://player.vimeo.com/external/604892001.hd.mp4?s=ade11d4e062e0d1b52d516493e50a89130f38f30&profile_id=175', 'https://i.vimeocdn.com/video/1241301149-53868f6be1892b2336efa462e39ece0d4a178b5b86ac5ae317c9d3f94c3919df-d_640', 'https://player.vimeo.com/external/620358701.hd.mp4?s=be95412dea65dd18e89dec79b78d709076a0f8fe&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:37:02'),
(88, 'Headstand - Tuck Ups', 'Reps', 'POZEX88', 'headstand-tuck-ups', NULL, NULL, '<ul><li>When moving the legs up and down, try to keep your shins perpendicular to the ground. This will require you to allow your butt to shift back further than you may expect. I recommend filming yourself with your phone so you can see if your legs are actually in the position you think they are!</li><li>As you lower your legs, think about actively pulling your knees in toward your belly.</li><li>Keep your hands directly out in front of your shoulders, rather than further apart from each other. Keep your elbows in the entire time, with the elbows at approximately 90 degree angles.</li></ul>', '<ul><li>Inhale as you lower your knees down, exhale as you reach back up with your toes and lengthen your legs.</li></ul>', NULL, 'https://player.vimeo.com/external/604892179.hd.mp4?s=317614a8bb7cfea564e88764e87a5fbb76851c53&profile_id=175', 'https://i.vimeocdn.com/video/1241301699-d5dc5bdabd3d5d6e250e8aa91ad969190e9ff6a427c7179b6b07c2897fa787e5-d_640', 'https://player.vimeo.com/external/620358735.hd.mp4?s=f6575afcdf1aa1f44024a98ce8b95817823d02a8&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:37:03'),
(89, 'Headstand- Pike Ups', 'Reps', 'POZEX89', 'headstand-pike-ups', NULL, NULL, '<ul><li>You should be able to perform Headstand - Straddle Ups comfortably before moving onto this more advanced variation.</li><li>More than any other headstand variation, you need to let your butt travel far back while lowering your legs, to counterbalance their weight moving in front of your axis of balance. Allow your lower back to bend, and think of moving your butt away from your toes as you lower your legs.</li><li>Conversely, as you lift your legs back up, you should feel your hips and butt moving back into alignment until your entire body is in a perfectly straight line at the top of each rep.</li><li>Keep your hands directly out in front of your shoulders, rather than further apart from each other. Keep your elbows in the entire time, with the elbows at approximately 90 degree angles.</li></ul>', '<ul><li>Inhale as you lower your legs, exhale as you reach them back up.</li></ul>', NULL, 'https://player.vimeo.com/external/604892289.hd.mp4?s=6f5edcb4f54edd879e8f763fd2a2e2ad1540a7f7&profile_id=175', 'https://i.vimeocdn.com/video/1241313439-30a82ee365aef7752d48c56a7b979f93ab445143979e62bb238374efba78f676-d_640', 'https://player.vimeo.com/external/620359295.hd.mp4?s=56df27195b52bd972087f72c00ff2687ce38faa5&profile_id=175', NULL, 'shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:37:04'),
(90, 'High Kicks', 'Reps', 'POZEX90', 'high-kicks', NULL, NULL, '<ul><li>Reach through your fingertips and keep your arms just slightly in front of the centerline of your body.</li><li>Rather than thinking of “lifting” your leg, imagine shooting energy out of your toes, and really swinging your leg out and up. The more momentum you generate, and the more you let the leg just fly, the higher you can kick.</li><li>Only want to kick as high as you can without excessive rounding in the lower back. It’s totally normal to have a little bit of rounding, but you should always feel like you have a long spine and can easily keep your chest open and your gaze straight in front of you.</li><li>On that note, you’re probably rounding your lower back more than you realize! Try filming yourself with your phone to check your form so you can perform this one perfectly.</li></ul>', '<ul><li>If you exhale while kicking your leg up, it’ll help generate more power for a faster, higher kick. If you inhale while kicking your leg up, it’ll help keep the chest and front of the torso more open. So I recommend you practice both, and occasionally switch from one to the other to get the best of both worlds.</li></ul>', NULL, 'https://player.vimeo.com/external/628396370.hd.mp4?s=08e7617cbd3ec32551d80aa8923d6e4039e4d8f9&profile_id=175', 'https://i.vimeocdn.com/video/1270685128-4e53dcbd32ac4e7e947c46de3f7957316a2b1d3a361ac132b_640', 'https://player.vimeo.com/external/620359433.hd.mp4?s=9a3ad9e45c665212a0cdc4184c9f3ea69172d0b7&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:04'),
(91, 'High Knees', 'Reps', 'POZEX91', 'high-knees', NULL, NULL, '<ul><li>No matter how warm you are, I recommend starting High Knees every time nice and slow. Focus the first few reps on getting the knees as high as possible while pushing your belly forward.  Then you can gradually build speed, working to keep that long lower back and high knee action as much as possible.</li><li>Roughly 100% of the people I coach on this exercise start the first few reps and then drop the knees lower and lower as they get into it. This exercise is not jogging in place! The entire purpose is to work on dynamically lifting the knees high while keeping length through the lower back, so never sacrifice form for speed (unless you really like jogging in place, in which case… have fun!).</li><li>While the main focus is on the high knees, it’s also important to keep the feet quick and light. See how quiet you can keep the feet throughout the exercise.</li></ul>', '<ul><li>You can either exhale lightly each time you lift a knee, or you can just keep a constant, calm breathing throughout. Both techniques offer different benefits, so I recommend trying both.</li></ul>', NULL, 'https://player.vimeo.com/external/666658519.hd.mp4?s=2af01a57a0f3ad26e28721738fc443fae67b0581&profile_id=175', 'https://i.vimeocdn.com/video/1349889869-010f0c8e83c079cbc1b7a47f439be4ffc0ff137f5fd876c9a20324e2261b469d-d_640', 'https://player.vimeo.com/external/620359454.hd.mp4?s=9028706eac61cb9b34b9ded009205069340f3948&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:37:05'),
(92, 'Hindu Push-Ups  (Dand)', 'Reps', 'POZEX92', 'hindu-push-ups-dand', NULL, NULL, '<ul><li>Start in a Downward Facing Dog pose (Adho Mukha Svanasana), with your feet flat on the ground and your body in a “v” position. Then dive your head down and forward, and as your head passes in front of your hands, swoop it up in a smooth motion, pausing in Upward Facing Dog pose (Urdhva Mukha Svanasana) with your arms straight, your chest as open as possible, and your gaze slightly up in front of you.</li><li>Begin this exercise slowly, taking as much time as you’d like in each of the poses. Then you can start to gradually increase the speed, working to move into both Downward and Upward Facing Dog poses as quickly and efficiently as possible on each rep. Never sacrifice the quality of the movement, poses, or breath for the sake of more speed.</li><li>This exercise should feel good, enjoy it!</li></ul>', '<ul><li>Inhale generously as you move from Downward Facing Dog to Upward Facing Dog. Exhale as you push back to Downward Facing Dog.</li></ul>', NULL, 'https://player.vimeo.com/external/604901567.hd.mp4?s=5e36873a0ff0bafc78ae66c2a5c1d90428fb72ae&profile_id=175', 'https://i.vimeocdn.com/video/1241311859-cc78f9f8e976b26e88ea856ff8abc62dea68ddb606a284d1de9478a0e5a3fe34-d_640', 'https://player.vimeo.com/external/599112541.hd.mp4?s=8487c14552aa3afc46860e47827912044fb1bcfb&profile_id=175', NULL, 'chest,triceps,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:06'),
(93, 'Hindu Push-Ups with Undulation', 'Reps', 'POZEX93', 'hindu-push-ups-with-undulation', NULL, NULL, '<ul><li>If you’re not yet comfortable with traditional Hindu Push-ups, be sure to try them first, as this is an advanced variation of them.</li><li>This exercise has an amazing flow once you get into the groove, but it also requires a truly powerful contraction through all the anterior (front) muscles of the core in order to keep the undulation flowing smoothly through the spine. So don’t be shy – really go for it, both with the movement and your breath!</li><li>Allow your knees to bend and open to the sides as you move forward, to allow your head and torso to stay close to the ground.</li><li>The undulation never ends in this movement, so there should never be any point of stillness once you start moving.</li></ul>', '<ul><li>Inhale as you dive down and forward from Downward Facing Dog. Exhale as you push back toward Downward Facing Dog. Work to link the inhalation with the expansion of the entire front side of your body, and to link the exhalation with the powerful contraction of the front of your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/604901159.hd.mp4?s=a468a7a2120c75e3c100cf600c0b4ab72c42ddac&profile_id=175', 'https://i.vimeocdn.com/video/1241311770-3fdae35497db78cba86908811a057b11b59075fd0f515246a07d7d978b28fc0f-d_640', 'https://player.vimeo.com/external/613861104.hd.mp4?s=c43182afad1b47f82fbb2e5bfa8c87fcecf9ad00&profile_id=175', NULL, 'chest,triceps,shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:07'),
(94, 'Hip Rockets', 'Reps', 'POZEX94', 'hip-rockets', NULL, NULL, '<ul><li>The floating movement in Hip Rockets comes from a combination of kicking the leg up, pushing off through the bottom foot, and pushing hard into the ground with your arms. At first it may feel challenging to focus on all three of those at the same time, so feel free to choose one to focus on for each set as you get started. Then as each part starts to become muscle memory, you can switch your focus until you can effortlessly put together all the pieces and enjoy a true sense of flying and floating.</li><li>Think of directing your straight leg up, rather than back toward your head. The more you really reach with your toes, the easier (and more fun!) it’ll be.</li><li>This is a great exercise to practice barefoot, as it offers a powerful chance to work on functional foot strength and articulation. But if you do, be sure to really focus on using the push of the toes on the way up and down, to keep the landing as quiet as possible on each rep.</li></ul>', '<ul><li>Exhale as you kick the leg up, inhale as it comes back down.</li></ul>', NULL, 'https://player.vimeo.com/external/615717848.hd.mp4?s=9a2d45677645c6084d5e79add66124da98687387&profile_id=175', 'https://i.vimeocdn.com/video/1257657278-3f9e4e6b63adb6ddb40527d05c737fb9fa31e669b6e882337fcb76891727933a-d_640', 'https://player.vimeo.com/external/613861118.hd.mp4?s=05829344263f710c6fc7d9775ecdee6c1157fdd9&profile_id=175', NULL, 'glutes,legs,triceps', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:37:07'),
(95, 'Hip Thrust with Spiral Reach', 'Reps', 'POZEX95', 'hip-thrust-with-spiral-reach', NULL, NULL, '<ul><li>You can practice this exercise alternating sides each time or doing a full set on one side. In the beginning, it can be helpful to stick to one side on each set, so you can really sink into the sensation and technique. Then, as you gain comfort with the movement, you can start alternating sides on each rep, which provides a great chance to work on feeling deep spirals through the torso on both sides.</li><li>Really reach with your fingers on each and every rep. There should be no “end” to this movement; even as you begin to relax the pelvis back down on each rep, you should still be reaching away with the fingertips to create as much length as possible through the spine.</li><li>Also really look  in the direction you’re reaching on each rep!</li><li>Depending on your body proportions and shoulder flexibility, you may want to place the back hand a bit closer or further back from your butt. Experiment with different distances to find the one that’s best for you.</li></ul>', '<ul><li>Inhale generously as you lift your hips and reach back. Feel how the inhalation organically opens the chest and helps encourage the spiral through the spine. Exhale as you release back down</li></ul>', NULL, 'https://player.vimeo.com/external/615703539.hd.mp4?s=be566d9c57a6f6477f38912544ce4d340a322448&profile_id=175', 'https://i.vimeocdn.com/video/1257642242-0d1b46d2b20b8e6623f4daa6c5e4affb1c776a3993bcd536caf2b22a0c2b733d-d_640', 'https://player.vimeo.com/external/613861149.hd.mp4?s=b2eac7dbb6c7605e5f785f8f4036537b50eed66a&profile_id=175', NULL, 'glutes,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:08'),
(96, 'Hollow Body Hold', 'Duration', 'POZEX96', 'hollow-body-hold', NULL, NULL, '<ul><li>Gently tuck your chin toward your chest to keep your neck as relaxed as possible. If you experience any tension in your neck, perform this exercise with your hands behind your head.</li><li>Really reach with your fingers the entire time.</li><li>Keep your lower back glued to the ground throughout the full movement.</li><li>Hold each rep as long as you can with perfect form. As soon as you are no longer able to keep your lower back pressing firmly toward the ground, draw your knees back to 90° and repeat the movement for multiple reps.</li></ul>', '<ul><li>Use a strong controlled exhale to help engage your core as you first tuck the chin and lift your shoulders off the ground. Throughout the rest of the exercise, keep breathing continuously, using a light, controlled breath to avoid any unnecessary movement in the core.</li></ul>', NULL, 'https://player.vimeo.com/external/615736195.hd.mp4?s=702f1997705894c7b8eae42154a1ab272abb97ad&profile_id=175', 'https://i.vimeocdn.com/video/1257682804-198164659212745a8e90bc21452f213ac744d32ed46ccb56418f76196432947c-d_640', 'https://player.vimeo.com/external/613861251.hd.mp4?s=44df7e55ac663fb7c2a0b3b722e683de66a24402&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:37:09'),
(97, 'Hollow Body Hold with Full Scissors', 'Duration', 'POZEX97', 'hollow-body-hold-with-full-scissors', NULL, NULL, '<ul><li>Really reach with your fingers and toes the entire time.</li><li>Keep your movements quick and light, coordinating the arms and legs so they move together.</li><li>Keep your lower back glued to the ground throughout the full movement.</li><li>To decrease the challenge, lift your legs higher (but keep them straight). To increase the challenge, lower them closer to the ground.</li></ul>', '<ul><li>Use a strong controlled exhale to help engage the core as you first tuck the chin and lift your shoulders off the ground. Throughout the rest of the exercise, keep breathing continuously, using a light, controlled breath to avoid any unnecessary movement in your core.</li></ul>', NULL, 'https://player.vimeo.com/external/615728914.hd.mp4?s=64c57a4715e18c1703db88115a40991976d5d175&profile_id=175', 'https://i.vimeocdn.com/video/1257669845-fa2d231f055b626427cdfde50ecc405ed049f2accd47f2ed2a51389dff7ad638-d_640', 'https://player.vimeo.com/external/613861239.hd.mp4?s=7d41b716e580a9a54b59e73125206db61b9f0b04&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:37:09'),
(98, 'Hollow Body Hold with Hands Behind Head', 'Duration', 'POZEX98', 'hollow-body-hold-with-hands-behind-head', NULL, NULL, '<ul><li>Rather than lacing your fingers behind your head, just touch them lightly to the sides of the back of your head. This will allow you to offer yourself the amount of support you need for your neck while keeping your chest open and your shoulders relaxed.</li><li>Only lower your legs as low as you can while keeping your lower back as close as possible to the ground.</li><li>Hold each rep as long as you can with perfect form. As soon as you are no longer able to keep your lower back pressing firmly toward the ground, draw your knees back to 90° and repeat the movement for multiple reps.</li></ul>', '<ul><li>Use a strong controlled exhale to help engage your core as you first tuck the chin and lift your shoulders off the ground. Throughout the rest of the exercise, keep breathing continuously, using a light, controlled breath to avoid any unnecessary movement in your core.</li></ul>', NULL, 'https://player.vimeo.com/external/615732734.hd.mp4?s=155a63d2589cad613224ce33be5ca7ddb256f3e0&profile_id=175', 'https://i.vimeocdn.com/video/1257674298-ae0b5d77310a58bb20cac53a943fb31e645a4fa844dcf38b00b05a4db7370354-d_640', 'https://player.vimeo.com/external/613861292.hd.mp4?s=e2818aa2c195918908db3fe55f08127eb71d50f3&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:10'),
(99, 'Hollow Body Hold with Kicks', 'Duration', 'POZEX99', 'hollow-body-hold-with-kicks', NULL, NULL, '<ul><li>Keep your kicks quick and light, while trying to keep your torso as still as possible throughout the exercise.</li><li>Rather than lacing your fingers behind your head, just touch them lightly to the sides of the back of your head.</li><li>This will allow you to offer yourself the amount of support you need for your neck while keeping your chest open and your shoulders relaxed.</li><li>Only lower your legs as low as you can while keeping your lower back as close as possible to the ground.</li></ul>', '<ul><li>Use a strong controlled exhale to help engage your core as you first tuck the chin and lift your shoulders off the ground. Throughout the rest of the exercise, keep breathing continuously, using a light, controlled breath to avoid any unnecessary movement in your core.</li></ul>', NULL, 'https://player.vimeo.com/external/615734676.hd.mp4?s=68d57e231f13d9d69c8e2d4495d85d68bc6c162c&profile_id=175', 'https://i.vimeocdn.com/video/1257675902-49d7c8537ab0a94912267ed31530cd34e1be0cf800b259f6e0e80273359ef843-d_640', 'https://player.vimeo.com/external/613861351.hd.mp4?s=415aca0601721b7be81ee925f64f07e8e1a1b3f2&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:11'),
(100, 'Hollow Body Holds with Extended Arms', 'Duration', 'POZEX100', 'hollow-body-holds-with-extended-arms', NULL, NULL, '<ul><li>This is an excellent exercise for training the specific combination of core engagement and shoulder flexibility necessary to perform a handstand.</li><li>Be sure to simultaneously reach back with your fingers and keep pushing them down toward the ground the entire time. Then you need to fight that downward push by engaging the abs to lift your shoulders and upper back off the ground. If it feels like that makes it harder to perform the exercise, you’re doing it right!</li><li>Also reach with your toes, keeping your legs straight and as long as possible.</li></ul>', '<ul><li>Use a strong controlled exhale to help engage the core as you first tuck the chin and lift your shoulders off the ground. Throughout the rest of the exercise, keep breathing continuously, using a shallow controlled breath to avoid any unnecessary movement in the core.</li></ul>', NULL, 'https://player.vimeo.com/external/615730586.hd.mp4?s=d29dd7c1011aad51ff20d73ce1045caf45586461&profile_id=175', 'https://i.vimeocdn.com/video/1257672078-c151706bed8b2de7cf2e2b1599496dbca0f6a31451262dd8f13925f420dfc17a-d_640', 'https://player.vimeo.com/external/613861187.hd.mp4?s=d0cb8963061eac28468fb35c3ac185445662de06&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:12'),
(101, 'Incline Push-Ups', 'Reps', 'POZEX101', 'incline-push-ups', NULL, NULL, '<ul><li>You can perform Incline Push-Ups at any angle. Feel free to start on a high surface, such as a counter, and then as you get stronger, you can start working with lower and lower surfaces until you’re ready to transition to the ground.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears throughout the entire exercise.</li><li>Gently engage your core to lengthen the spine, trying to keep the longest line possible from your heels to the top of your head.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604887323.hd.mp4?s=0675b6b82f36b9b31cee69ed9ce7cafc32ea8451&profile_id=175', 'https://i.vimeocdn.com/video/1241296221-188d4a1e241f4d42be7bcd101b89a56a23ceed60c019d158a6616ce8c4f65a07-d_640', 'https://player.vimeo.com/external/613861374.hd.mp4?s=38296e4278fdbaf2fca49367567ee2847b280eb0&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:37:12'),
(102, 'Jump Lunges', 'Reps', 'POZEX102', 'jump-lunges', NULL, NULL, '<ul><li>Imagine your head floating off your spine like a balloon throughout the exercise. The lighter you feel and the longer your spine, the easier and more fun it will feel.</li><li>Push through both feet on each jump, focusing on articulating through your feet and toes as push off the ground.</li><li>In the beginning, focus on form, not height. Each and every lunge should feature your knees at roughly 90 degree angles with your back knee just off the ground, an open chest, and a long spine. As you get more comfortable, you can start to jump higher and higher, but never sacrifice form for height.</li></ul>', '<ul><li>Exhale down, inhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/640877540.hd.mp4?s=0b025bb0ae2a74e2132dc63beee0a1cc8648aa4a&profile_id=175', 'https://i.vimeocdn.com/video/1289143849-5bfd623a1e6ec5b083ac086783604e7cb7543b67a14267511_640', 'https://player.vimeo.com/external/620359467.hd.mp4?s=3a9752a9efa4be1a51fd1113195a1b9ca66e405c&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:13');
INSERT INTO `exercises` (`id`, `title`, `based_on`, `code`, `slug`, `category_id`, `duration`, `instructions`, `breath`, `description`, `tip_video`, `tip_video_thumbnail`, `video_link`, `reps`, `focus_area`, `specific_muscles`, `good_for`, `type`, `Notes`, `level`, `image`, `tags`, `created_at`) VALUES
(103, 'Jump Squats', 'Reps', 'POZEX103', 'jump-squats', NULL, NULL, '<ul><li>Focus on pushing powerfully through the legs and articulating through the feet to create as much vertical energy as possible. Your pelvis should never thrust forward while jumping. Instead, keep your abs gently engaged to keep a long line through the spine.</li><li>Use the swing of the arms behind you to help generate momentum. Then as the arms swing up in the front, freeze the movement as the upper arms reach parallel to the ground, with your fingers pointing straight up. This will help transfer the energy from the swing of the arms into the jump.</li><li>Only bend your knees as much as you can while keeping a long spine. It’s ok if there’s a tiny bit of rounding in the lower back at the very bottom of the movement, but you should never feel like you’re leaning forward and need to “unfold” your torso during the jump.</li><li>Push through the feet and toes on each jump, and then keep them reaching down toward the ground in the air so you can use them to land as lightly and quietly as possible on each rep.</li></ul>', '<ul><li>Exhale down, inhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600954434.hd.mp4?s=b43d0ff7dbb86bcbf3fdf2826104c1a3f3677349&profile_id=175', 'https://i.vimeocdn.com/video/1236870443-c09b36efa06ec7e37f5cbb957ba5133354ec8acc87fc73afcd1efaa2d59e1f25-d_640', 'https://player.vimeo.com/external/622094364.hd.mp4?s=6f6f33b4bb5571fbd37eb0f063bd35a993ef80b1&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:14'),
(104, 'Jump Squats - 1 Leg', 'Reps', 'POZEX104', 'jump-squats-1-leg', NULL, NULL, '<ul><li>Push not just through the standing leg, but also through your foot and your toes. A lot of extra strength can come from fully articulating through the toes, even while wearing shoes.</li><li>Then, keep your toes reaching down toward the ground in the air so you can use them to land as lightly and quietly as possible on each rep.</li><li>Use the swing of the arms behind you to help generate momentum. Then as the arms swing up in the front, freeze the movement as the upper arms reach parallel to the ground, with your fingers pointing straight up. This will help transfer the energy from the swing of your arms into the jump.</li><li>You may not be able to jump very high at first, or perhaps may not even get the foot completely off the ground at all. No problem! Just focus on power and verticality and keep practicing, and you’ll be starting to catch air in no time!</li></ul>', '<ul><li>Exhale down, inhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600953257.hd.mp4?s=0610e5f0373da1e614b4dcd88f05396334eabc51&profile_id=175', 'https://i.vimeocdn.com/video/1236863220-fcacabebeca0b73be7768b60b9baf35d069a7de07d3f55543cf7bb1b4c7fb1b4-d_640', 'https://player.vimeo.com/external/622094317.hd.mp4?s=e3abb0d0ec328b12dc34576849c34a9a5f8f78ad&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:14'),
(105, 'Jump Squats - Crystal ball', 'Reps', 'POZEX105', 'jump-squats-crystal-ball', NULL, NULL, NULL, NULL, NULL, 'https://player.vimeo.com/external/600953983.hd.mp4?s=fbb9889344d64b08847cba30e845020252904f9c&profile_id=175', 'https://i.vimeocdn.com/video/1236864029-4e46fbf98cb4b76b81daae84619214af49fb3c077e95e9126b73279c7e9fc003-d_640', 'https://player.vimeo.com/external/622094111.hd.mp4?s=f73584327ebdf00bbde7d040dd687045f30f2afc&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:15'),
(106, 'Jump Squats - Tuck Jump', 'Reps', 'POZEX106', 'jump-squats-tuck-jump', NULL, NULL, '<ul><li>Think of this exercise as having three distinct parts: the jump, the tuck of the knees, and the landing. If you try to tuck your knees too early in the jump, you’ll sacrifice height, making it harder to perform the tuck. Then, after you tuck the knees, push them quickly back down so they’re in place for a quiet landing and quick turnaround for the next jump.</li><li>Focus on pushing powerfully through your legs and articulating through your feet to create as much vertical energy as possible. Your pelvis should never thrust forward while jumping. Instead, keep your abs gently engaged to keep a long line through the spine.</li><li>Only bend your knees as much as you can while keeping a long spine. It’s ok if there’s a tiny bit of rounding in the lower back at the very bottom of the movement, but you should never feel like you’re leaning forward and need to “unfold” your torso during the jump.</li><li>Push through the feet and toes on each jump, and then keep them reaching down toward the ground in the air so you can use them to land as lightly and quietly as possible on each rep.</li></ul>', '<ul><li>Exhale down, inhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600953538.hd.mp4?s=73b3f9b66937b66e2e3ed5444cca19b25a8854f6&profile_id=175', 'https://i.vimeocdn.com/video/1236862755-1a582c84766e56d41c8f6bc8f11ff5a61dd57fb6670fd282b09cf9c5adc19d07-d_640', 'https://player.vimeo.com/external/622094501.hd.mp4?s=c5e0c76a4866155bad3004e894a2c2e3b14d7867&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:16'),
(107, 'Jump Squats - Tuck Jump with Hand Tap', 'Reps', 'POZEX107', 'jump-squats-tuck-jump-with-hand-tap', NULL, NULL, '<ul><li>You should be able to perform full sets of normal Tuck Jumps before moving onto this more advanced variation.</li><li>Keeping your hands up the entire time means you can’t generate momentum with the arms, making this an incredibly challenging exercise. Focus on really pushing through the feet and toes on each jump to get as much height as possible.</li><li>Try to keep your hands at the same height and bring your knees upto them, rather than lowering your hands to tap your knees. That said, if your hands drop a bit… it’s ok!</li><li>Only bend your knees as much as you can while keeping a long spine. It’s ok if there’s a tiny bit of rounding in your lower back at the very bottom of the movement, but you should never feel like you’re leaning forward and need to “unfold” your torso during the jump.</li></ul>', '<ul><li>Exhale down, inhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600953403.hd.mp4?s=2df2a5e9dd5811d7173b4211f32e541e3151e2c2&profile_id=175', 'https://i.vimeocdn.com/video/1236863121-18b5c893e185a63bba5581612e6ddadde279582924a6cd94ea76c3a7f7d1456e-d_640', 'https://player.vimeo.com/external/622094016.hd.mp4?s=dad8cb434e5ab76b2d4bc979751dd1c3b77da1d5&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:17'),
(108, 'Jumping Jacks', 'Reps', 'POZEX108', 'jumping-jacks', NULL, NULL, '<ul><li>Land softly on the balls of your feet on each jump, trying to keep the movement of your feet quick and light.</li><li>Keep your chest open and your shoulders relaxed down away from your ears throughout the exercise.</li><li>Keep your hands open and your fingers reaching. You can imagine your fingers are cutting through the air as you jump.</li></ul>', '<ul><li>Maintain a smooth, calm breathing pattern throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/628399116.hd.mp4?s=2d6b9f642b5230f749c32a68fd436a72e7823f2d&profile_id=175', 'https://i.vimeocdn.com/video/1270687656-60f30c3d8fde64d33a2f44da7f4557963ab066d91aa7bd08e_640', 'https://player.vimeo.com/external/620359481.hd.mp4?s=8fe37644d906cdb041eed1eb9fdffbb99b9331e1&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:37:18'),
(109, 'King Tuts', 'Reps', 'POZEX109', 'king-tuts', NULL, NULL, '<ul><li>This exercise includes three main movements. Cycle through each of them continuously until you can perform all three simultaneously throughout the entire exercise:</li><li>1)Push out to the sides with your palms as hard as you can.</li><li>2)Pull your fingertips back in toward your head as hard as you can.</li><li>3)Straighten your arm and rotate the inside of your elbow forward and up.</li><li>4)Keep your shoulders relaxed down away from your ears.</li><li>You will likely feel a powerful stretch through your forearms, especially when you first start practicing King Tuts. This is a good sign!</li></ul>', '<ul><li>Inhale generously to prepare for each push. Then, exhale powerfully as you push, feeling how the exhale helps encourage engagement of your core to stabilize your torso while pushing like crazy through your arms and hands.</li></ul>', NULL, 'https://player.vimeo.com/external/628402208.hd.mp4?s=c26defbef5b892c496ba64dd5fb2bf9f8e5f9c33&profile_id=175', 'https://i.vimeocdn.com/video/1270690653-dc2f52cff37c9bba6fd2bd976b78f28c3f12eb1a1886e5e2a_640', 'https://player.vimeo.com/external/620359501.hd.mp4?s=72baa555b232efd572c868a4f575851eff98c417&profile_id=175', NULL, 'forearms,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:18'),
(110, 'Knee to Elbow Push-Ups', 'Reps', 'POZEX110', 'knee-to-elbow-push-ups', NULL, NULL, '<ul><li>Depending on your flexibility, your knee may not actually touch your elbow, and that’s fine. Just focus on driving the knee forward and then reaching back with your toes to lengthen the leg again.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears throughout the entire exercise.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604887411.hd.mp4?s=2723de99c26c180f7b6a457184a4ac93bbf1b50c&profile_id=175', 'https://i.vimeocdn.com/video/1241296159-37747fd90937e34c089c6fad1d6821e17df121d9fd267427e049b4d4bde89ebe-d_640', 'https://player.vimeo.com/external/613861489.hd.mp4?s=ebeb13814fc00d777c04aba3bbf3c856aa8b7c58&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:19'),
(111, 'Knee to Elbow Push-Ups - Alternating', 'Reps', 'POZEX111', 'knee-to-elbow-push-ups-alternating', NULL, NULL, '<ul><li>Depending on your flexibility, your knee may not actually touch your elbow, and that’s fine. Just focus on driving the knee forward and then reaching back with your toes to lengthen the leg again.</li><li>Try to keep the transition from one leg to the other as quick and light as possible.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears throughout the entire exercise.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604887547.hd.mp4?s=d04f099b2a74363013c7fb9e2f4707d09cbc8ac7&profile_id=175', 'https://i.vimeocdn.com/video/1241297171-f24fbda5aac5bcfa460c64e71bb351668e77ed3e67ec9a64361c706f393c3565-d_640', 'https://player.vimeo.com/external/613861435.hd.mp4?s=7d7540b084ebf0bfdd7fa4e8cba0bc9524e5585b&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:20'),
(112, 'Kneeling Hip Thrust', 'Reps', 'POZEX112', 'kneeling-hip-thrust', NULL, NULL, '<ul><li>Keep your chest open and your shoulders relaxed down away from your ears throughout the exercise.</li><li>Rather than just pushing your pelvis forward, focus on really feeling the opening in the front of the pelvis on each rep.</li><li>Place a yoga mat or towel under your knees if desired</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/615743122.hd.mp4?s=baf2b8cd2c3f9740e696ed03a2f741a7c8807c60&profile_id=175', 'https://i.vimeocdn.com/video/1257684999-0b18e2a7bfa3da9e0b6d790a3659e146b67841d596c5e3de4e3ef75a77263f71-d_640', 'https://player.vimeo.com/external/624196033.hd.mp4?s=5a9ebbb65b7655e6a3b739540e5699b05aa01772&profile_id=175', NULL, 'glutes,legs', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:37:21'),
(113, 'Kneeling Hip Thrust - Incline', 'Reps', 'POZEX113', 'kneeling-hip-thrust-incline', NULL, NULL, '<ul><li>When first performing this exercise, lean back just a bit, and focus on keeping a long spine and avoiding excessive arching in the lower back. As you get stronger and more comfortable, you can lean back further, but only as much as you can while keeping the core engaged and the spine long.</li><li>Maintain the same angle with your torso throughout the exercise.</li><li>Keep your chest open and your shoulders relaxed down away from your ears.</li><li>Rather than just pushing your pelvis forward, focus on really feeling the opening in the front of the pelvis on each rep.</li><li>Place a yoga mat or folded-over towel under your knees if desired.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/615742180.hd.mp4?s=079e8d834c777b711f3165af4b0deb7f7372b523&profile_id=175', 'https://i.vimeocdn.com/video/1257684073-50550b35bfcaffaae042900903b0868af95387bdbd883af39488652502f48998-d_640', 'https://player.vimeo.com/external/624195627.hd.mp4?s=e307df0975c3a582383cf2bdfe859b1b08e2fe7f&profile_id=175', NULL, 'glutes,legs,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:21'),
(114, 'Knuckle Push-Ups', 'Reps', 'POZEX114', 'knuckle-push-ups', NULL, NULL, '<ul><li>Always perform Knuckle Push-Ups on a mat or folded-over towel until you can perform them effortlessly. Only then should you move to a hard surface such as a wood floor.</li><li>Keep your palms facing each other and your thumbs pointing down toward the ground.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears throughout the entire exercise.</li><li>Gently engage your core to lengthen the spine, trying to keep the longest line possible from your heels to the top of your head.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604887880.hd.mp4?s=512c9b50139852a3107558cc18107dbeefcf96eb&profile_id=175', 'https://i.vimeocdn.com/video/1241296527-6ef250a6f6ec67b05529e7ed26d18a3832c08b2cd4164590bc2c06cfbd6ca5f1-d_640', 'https://player.vimeo.com/external/613863304.hd.mp4?s=ccebbbbf80bbcf8366bc277e5a6df26eb31b68cd&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:22'),
(115, 'L-Sit  ', 'Duration', 'POZEX115', 'l-sit', NULL, NULL, '<ul><li>You should be able to easily perform multiple holds of L-Sit Preparation and L-Sit Knee Raise before moving onto this more advanced exercise.</li><li>Rather than “lifting your legs,” reach  actively forward and up with your toes.</li><li>Rotate your arms back and down to push your chest forward and up.</li><li>If you can’t get your legs up to parallel to the ground, no problem! As long as your toes are even a few millimeters off the ground, you’ll get a great workout from this exercise!</li></ul>', '<ul><li>Breath calmly throughout the exercise. Use a strong, controlled exhale to keep your core engaged and your torso quiet.</li></ul>', NULL, 'https://player.vimeo.com/external/646708705.hd.mp4?s=d64ac4d157c10abe02a17fe270523327ab594e7c&profile_id=175', 'https://i.vimeocdn.com/video/1301906133-c004b75838e2e6e7ed763e919bf5b2ea03ec271cc86e6c3e5_640', 'https://player.vimeo.com/external/624196328.hd.mp4?s=981fc786e475a4013d3fc899a29e89306e706437&profile_id=175', NULL, 'core,back,legs', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:23'),
(116, 'L-Sit - Preparation', 'Duration', 'POZEX116', 'l-sit-preparation', NULL, NULL, '<ul><li>Push down powerfully through your hands to lift your torso and chest. You should never feel like the weight of your body is sinking into the hands and wrists. Instead, keep your hands actively pushing the entire time to protect the wrists and encourage better form.</li><li>Rotate your arms back and down to push your chest forward and up.</li><li>Keep your abs engaged to avoid arching the lower back.</li><li>Keep the longest line possible down the entire front of your body, from your forehead to the fronts of your knees.</li></ul>', '<ul><li>Breath calmly throughout the exercise. Use a strong, controlled exhale to keep your core engaged and your torso quiet.</li></ul>', NULL, 'https://player.vimeo.com/external/646708638.hd.mp4?s=7cb88e8817a0f261d6cbeb1661b97b5d3bb7f5c8&profile_id=175', 'https://i.vimeocdn.com/video/1301905641-fced5044a844dcb630fe23b1d47d4f6f388b9ba464ee70a21_640', 'https://player.vimeo.com/external/624196831.hd.mp4?s=3a1b31e4eb4731775381b9552909a8d924c8b307&profile_id=175', NULL, 'core,back', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:23'),
(117, 'L-Sit Knee Raise', 'Duration', 'POZEX117', 'l-sit-knee-raise', NULL, NULL, '<ul><li>You should be able to easily perform multiple holds of L-Sit Knee Preparations and before moving onto this more advanced exercise.</li><li>Rather than “lifting your knees,” reach  actively forward and up with your knees, as if you wanted to point them up at the sky in front of you.</li><li>Rotate your arms back and down to push your chest forward and up.</li><li>Hold your knees as high as you can. The higher you can hold them, the easier it will be to eventually move onto the full L-Sit with straight legs.</li></ul>', '<ul><li>Breath calmly throughout the exercise. Use a strong, controlled exhale to keep your core engaged and your torso quiet.</li></ul>', NULL, 'https://player.vimeo.com/external/646708783.hd.mp4?s=d6139b0246ba44d84d0418dff9dca22c9b169c82&profile_id=175', 'https://i.vimeocdn.com/video/1301906049-c9789e98652c17c70b85d67ea9e86c281727278edb6250ecb_640', 'https://player.vimeo.com/external/624197101.mpd?s=bb82ba507d8a7fb1ef927dd4488dce976cf832ca', NULL, 'core,back,legs', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:24'),
(118, 'L-Sit with Kicks', 'Duration', 'POZEX118', 'l-sit-with-kicks', NULL, NULL, '<ul><li>You should be able to easily perform multiple holds of the standard L-Sit before moving onto this more advanced variation.</li><li>Rather than “lifting your legs,” reach  actively forward and up with your toes.</li><li>Kicking your legs increases the challenge of an L-Sit a lot! So as you gain strength, you can do just a few kicks, then hold a standard L-Sit until you can’t. As you get stronger, you can perform the kicks longer and longer, until you can keep kicking through the entire hold.</li><li>Rotate your arms back and down to push your chest forward and up.</li></ul>', '<ul><li>Breath calmly throughout the exercise. Use a strong, controlled exhale to keep your core engaged and your torso quiet.</li></ul>', NULL, 'https://player.vimeo.com/external/646708857.hd.mp4?s=9ef1932029f9f1692a3aabf48ed150b54f6fa588&profile_id=175', 'https://i.vimeocdn.com/video/1301906291-0038bd1545c640d4ccc1bf0e9f27f07dc17a86c13e407c074_640', 'https://player.vimeo.com/external/624197410.hd.mp4?s=aab2e89e0e801f299d2e8653e8a850d424763a8b&profile_id=175', NULL, 'core,back,legs', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:37:25'),
(119, 'Lateral Knee Push', 'Reps', 'POZEX119', 'lateral-knee-push', NULL, NULL, '<ul><li>Push your knee out and the hand in as hard as you can for the duration of each exhale. If you think you’re pushing as hard as you can, you’re probably still not!</li><li>Focus on lengthening your spine and feeling your head float up toward the sky. The effort should be intense on your leg and arm that are pushing, but the rest of your body should stay as calm and quiet as possible.</li><li>If the balance feels too challenging, feel free to rest the free hand on a counter or other surface to focus on the strength aspect of this exercise while building up the balance to perform it unsupported.</li></ul>', '<ul><li>Inhale as you rest in the center between pushes. Then exhale powerfully as you push your hand and knee toward each other as hard as you can.</li></ul>', NULL, 'https://player.vimeo.com/external/631677796.hd.mp4?s=5f2394833cd6176a53ddfadd061ae9ba4befbadd&profile_id=175', 'https://i.vimeocdn.com/video/1273965673-d7e38541aca69e896e30b5cc576fbb2cecf8cec469b18f843_640', 'https://player.vimeo.com/external/620359529.hd.mp4?s=909b8d6ac8652a3434e07a727fd67a4fa792621c&profile_id=175', NULL, 'glutes,chest', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:25'),
(120, 'Lateral Push-Ups', 'Reps', 'POZEX120', 'lateral-push-ups', NULL, NULL, '<ul><li>From the bottom of each push-up, think about pushing yourself powerfully to the side, not up. If you try to push up and then sideways, the movement will feel heavy, but if you push sideways first, the momentum will help carry you from one side to the other with ease.</li><li>Keep your weight as light and quick as possible as you pass through the center at the end of each rep, which will help build more strength and power, and help prepare you for the more advanced variation, Plyometric Lateral Push-ups.</li><li>As you lower yourself down on each rep, allow your outside knee to open out to the side to make space for your entire body to arrive as close to the ground as possible without touching.</li><li>One push-up is one rep, but it’s ideal to perform an even number of reps to work both sides of the body evenly.</li></ul>', '<ul><li>Exhale as you lower yourself down on each side and begin to push back to the other side. Inhale actively as you pass through the center.</li></ul>', NULL, 'https://player.vimeo.com/external/604887911.hd.mp4?s=8fc5b654504eb04698edf696eb6548206985c3c2&profile_id=175', 'https://i.vimeocdn.com/video/1241296710-32f5ac4896c09b305939306b882e9d00a4e53f8cbeb70b947e7537fd2155286f-d_640', 'https://player.vimeo.com/external/599112393.hd.mp4?s=4cd2fff8b4b11b30df50582b94f2680c34189a80&profile_id=175', NULL, 'chest,triceps,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:26'),
(121, 'Lateral Push-Ups - Plyometric', 'Reps', 'POZEX121', 'lateral-push-ups-plyometric', NULL, NULL, '<ul><li>The goal is to explode sideways from the bottom of the push-up, so that you have a moment with both hands in the air as you pass through center. If you aren’t yet able to do that, start with normal Lateral Push-ups in the Exercise Library, the foundation for this more advanced variation.</li><li>As you lower yourself down on each rep, allow your outside knee to open out to the side to make space for your entire body to arrive as close to the ground as possible without touching.</li><li>Try to land lightly and quietly on your hands on each rep, cushioning the landing with the bending of the elbows.</li></ul>', '<ul><li>Exhale as you lower yourself down on each side and begin to push back to the other side. Inhale as you pass through the center.</li></ul>', NULL, 'https://player.vimeo.com/external/607169496.hd.mp4?s=10558b6728cc929622a7002b31af5184366edee7&profile_id=175', 'https://i.vimeocdn.com/video/1243822320-bec6f0397e81a97579da4ebe678ed3d782c9c63a2ed9274f8a8ae3dd7302dad0-d_640', 'https://player.vimeo.com/external/613863416.hd.mp4?s=d7e98ead98ab428d7253053fe092ed72fd6cdd97&profile_id=175', NULL, 'chest,triceps,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:27'),
(122, 'Laterals  ', 'Reps', 'POZEX122', 'laterals', NULL, NULL, '<ul><li>The main goal of this exercise is to improve strength and articulation through your feet. You can definitely perform it with shoes on, but no matter what you want to focus on pushing as much as possible with the feet on each lateral, really reaching with the toes of both feet on every rep.</li><li>Unlike squats, you want to keep your torso as tall and vertical as possible throughout Laterals, never bending forward or back, nor bending to the side.</li><li>Use the bend of your knee as you land on each side to cushion the landing. There should be no pause in the movement - the landing acts as the preparation for the next lateral jump.</li></ul>', '<ul><li>Inhale as you pass through the center. Exhale as you land on each side and prepare for the next jump.</li></ul>', NULL, 'https://player.vimeo.com/external/631675328.hd.mp4?s=2dce2f4cb6a7f80f7faa2c1b1efa6d9f0ff961e1&profile_id=175', 'https://i.vimeocdn.com/video/1273962550-bc1d5016d154ea23de11994dd587a1b697a9453bb91bd7740_640', 'https://player.vimeo.com/external/620359869.hd.mp4?s=1a33736a95efc68f63d705477219464df5721ad4&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:27'),
(123, 'Laterals with Balance', 'Reps', 'POZEX123', 'laterals-with-balance', NULL, NULL, '<ul><li>You do not need to hold a long balance on each side, but be sure that you can! A fun game is to take turns doing this one with a friend - the friend can call out “balance” at any point, and you have to stay on whichever side you’re on for a few extra seconds in an effortless balance.</li><li>Reach with your fingers and keep your arms extended just a bit in front of the centerline of your body.</li><li>The main goal of this exercise is to improve strength and articulation through the feet. You can definitely perform it with shoes on, but no matter what you want to focus on pushing as much as possible with the feet on each lateral, really reaching with the toes of both feet on every rep.</li><li>Unlike squats, you want to keep your torso as tall and vertical as possible throughout Laterals, never bending forward or back, nor bending to the side.</li></ul>', '<ul><li>Inhale as you pass through the center. Exhale as you land and balance on each side.</li></ul>', NULL, 'https://player.vimeo.com/external/631673875.hd.mp4?s=a925ac4f9b5d8982bddd45e27a6ec41c492b8d73&profile_id=175', 'https://i.vimeocdn.com/video/1273960420-68dce79d333d0da89296169db1c41333e2030e01306582b61_640', 'https://player.vimeo.com/external/620359723.hd.mp4?s=e66f15b90453a1956ca4a013b3b7b7684ed93361&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:28'),
(124, 'Laterals with Leg Raise', 'Reps', 'POZEX124', 'laterals-with-leg-raise', NULL, NULL, '<ul><li>Keep your torso as vertical as possible and avoid tilting the pelvis while performing each kick.</li><li>The focus is not on how high you can raise the leg, but rather the articulation of the feet during the jump and landing, as well as the balance while kicking. So let the leg swing freely, but only as high as you can while maintaining perfect form through the torso and arms.</li><li>Reach with your fingers and keep your arms extended just a bit in front of the centerline of your body.</li><li>Raise your leg to the side, but still in front  of your arm. If you try to kick too far to the side, it’ll be impossible to do so without hiking your pelvis to one side.</li><li>Keep your arms level during the kick, being careful not to push your arm down toward the kicking leg.</li></ul>', '<ul><li>Exhale as you jump laterally and perform the leg raise on each side. Inhale quickly as the leg lowers back down before the next jump.</li></ul>', NULL, 'https://player.vimeo.com/external/628405732.hd.mp4?s=a8bb86b133073a1de8a57d8ff2f83db92da250d5&profile_id=175', 'https://i.vimeocdn.com/video/1270693072-696183cdc75305c7dda1f8653bd508e647ccf0751ee77c911_640', 'https://player.vimeo.com/external/624197612.hd.mp4?s=47fefb1ffacc50a585443e527f0bd03ced538880&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise,warmup', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:37:29'),
(125, 'Laterals with Upward Tilt', 'Reps', 'POZEX125', 'laterals-with-upward-tilt', NULL, NULL, '<ul><li>The upward tilt adds a powerful balance challenge to this exercise. Pick a point above you to focus on with your eyes on each rep, which will help a lot  with maintaining balance.</li><li>You can perform this with just the head tilting up, or allowing the upper chest and shoulders to also rotate up a bit. Either version offers great benefits, just be sure to keep your abs gently engaged to avoid arching at all in the lower back.</li><li>Reach with your fingers and keep your arms extended just a bit in front of the centerline of your body.</li><li>Unlike squats, you want to keep your torso as tall and vertical as possible throughout Laterals, never bending forward or back, nor bending to the side.</li></ul>', '<ul><li>Exhale as you jump and land on each side. Inhale as you tilt upward and then back down to neutral.</li></ul>', NULL, 'https://player.vimeo.com/external/631676898.hd.mp4?s=e8bac7c7da10340b9e41cff0434155006b5ffe18&profile_id=175', 'https://i.vimeocdn.com/video/1273963929-f6d2cea7dd768fe893c9ba62c2856ce5601ae09f7a449caf0_640', 'https://player.vimeo.com/external/624198115.hd.mp4?s=a18f84e8aa25a1a1fc3ffa0259427c99452be473&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise,warmup', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:30'),
(126, 'Leg Swings ', 'Reps', 'POZEX126', 'leg-swings', NULL, NULL, '<ul><li>Focus on relaxing the pelvis while allowing the leg to swing forward and up as high as possible. Rather than thinking of “lifting” your leg, imagine shooting energy out of your toes, and really swinging your leg out and up. The more momentum you generate, and the more you let the leg just fly, the higher the leg will swing.</li><li>Focus on keeping a long spine, and specifically avoid rounding in the lower back as the leg swings forward. Never sacrifice your form to get the leg higher.</li><li>Reach through your fingertips and keep your arms just slightly in front of the centerline of your body.</li><li>If the balance feels too challenging, feel free to rest one free hand on a counter or other surface to focus on the strength aspect of this exercise while building up the balance to perform it unsupported.</li></ul>', '<ul><li>If you exhale while swinging the leg up, it’ll help generate more power for a faster, higher swing. If you inhale while swinging the leg up, it’ll help keep the chest and front of your torso more open and avoid arching in the lower back. So I recommend you practice both, and occasionally switch from one to the other to get the best of both worlds.</li></ul>', NULL, 'https://player.vimeo.com/external/631681311.hd.mp4?s=90d7edf2cf220cdb4bfe734d2bcf0e856138e102&profile_id=175', 'https://i.vimeocdn.com/video/1273968687-a9f70f38386664a863328afdc4c3dea7fbbc07fbab581e66d_640', 'https://player.vimeo.com/external/620360116.hd.mp4?s=50d6bf6306d10ca36a98bf383e06048333c27b43&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise,warmup', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:30'),
(127, 'Leg Swings - Bent Knee', 'Reps', 'POZEX127', 'leg-swings-bent-knee', NULL, NULL, '<ul><li>Focus your awareness on the hinging of the joints of your knee and the front of your pelvis. While you want to start the leg swing with momentum, as soon as the leg is swinging, relax the pelvis and leg so the knee can hinge as effortlessly as possible. This will allow the thigh to swing high and the knee to travel up and back toward your chest at the top of each swing.</li><li>Focus on keeping a long spine, and specifically avoid rounding in the lower back as the leg swings forward. Never sacrifice your form to get the leg higher.</li><li>Reach through your fingertips and keep your arms just slightly in front of the centerline of your body.</li><li>If the balance feels too challenging, feel free to rest one free hand on a counter or other surface to focus on the strength aspect of this exercise while building up the balance to perform it unsupported.</li></ul>', '<ul><li>If you exhale while swinging the leg up, it’ll help generate more power for a faster, higher swing. If you inhale while swinging the leg up, it’ll help keep the chest and front of the torso more open and avoid arching in the lower back. So I recommend you practice both, and occasionally switch from one to the other to get the best of both worlds.</li></ul>', NULL, 'https://player.vimeo.com/external/666658562.hd.mp4?s=92f95767162659f8815908ef5ee2e4e903a4aaad&profile_id=175', 'https://i.vimeocdn.com/video/1349890003-e83d8b2edbef8d77546275be23385a045a0d56122ee460ec7359e429c4158a3d-d_640', 'https://player.vimeo.com/external/620360125.hd.mp4?s=6469da5bc2579334ec3d8c1ee2e81bc5ab6f8cc8&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise,warmup', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:31'),
(128, 'Leg Swings - Bent Knee with Support', 'Reps', 'POZEX128', 'leg-swings-bent-knee-with-support', NULL, NULL, '<ul><li>Place one hand on a counter or other surface for support. Choose a surface that allows you to use your hand to assist with balance without changing the form of your body. Your hand should be:</li><li>1) Just a bit in front of the centerline of your body.</li><li>2) High enough to have a slight bend in your elbow.</li><li>3) Low enough to be able to keep your shoulder relaxed down away from your ear.</li><li>Focus your awareness on the hinging of the joints of your knee and the front of your pelvis. While you want to start the leg swing with momentum, as soon as the leg is swinging, relax your pelvis and leg so the knee can hinge as effortlessly as possible. This will allow the thigh to swing high and your knee to travel up and back toward your chest at the top of each swing.</li><li>Focus on keeping a long spine, and specifically avoid rounding in the lower back as your leg swings forward. Never sacrifice your form to get the leg higher.</li></ul>', '<ul><li>If you exhale while swinging your leg up, it’ll help generate more power for a faster, higher swing. If you inhale while swinging your leg up, it’ll help keep the chest and front of your torso more open and avoid arching in your lower back. So I recommend you practice both, and occasionally switch from one to the other to get the best of both worlds.</li></ul>', NULL, 'https://player.vimeo.com/external/631680104.hd.mp4?s=90802dcc51cc4e4d78caaaefdd9234b2982f610f&profile_id=175', 'https://i.vimeocdn.com/video/1273966488-a4bb2b71cf51a6e6b35ebb71e1a9e281d821a54f790f2885c_640', 'https://player.vimeo.com/external/620359951.hd.mp4?s=f774b8fd304c050c545ba69463b1819a5912854c&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:37:32'),
(129, 'Leg Swings with Support', 'Reps', 'POZEX129', 'leg-swings-with-support', NULL, NULL, '<ul><li>Place one hand on a counter or other surface for support. Choose a surface that allows you to use your hand to assist with balance without changing the form of your body. Your hand should be:</li><li>1) Just a bit in front of the centerline of your body.</li><li>2) High enough to have a slight bend in your elbow.</li><li>3) Low enough to be able to keep your shoulder relaxed down away from your ear.</li><li>Focus on relaxing your pelvis while allowing the leg to swing forward and up as high as possible. Rather than thinking of “lifting” your leg, imagine shooting energy out of your toes, and really swinging your leg out and up. The more momentum you generate, and the more you let the leg just fly, the higher the leg will swing.</li><li>Keep a long spine, and specifically avoid rounding in your lower back as the leg swings forward. Never sacrifice your form to get the leg higher.</li></ul>', '<ul><li>If you exhale while swinging your leg up, it’ll help generate more power for a faster, higher swing. If you inhale while swinging your leg up, it’ll help keep your chest and front of your torso more open and avoid arching in your lower back. So I recommend you practice both, and occasionally switch from one to the other to get the best of both worlds.</li></ul>', NULL, 'https://player.vimeo.com/external/666658607.hd.mp4?s=8137eaba3d363dd1065ea5bc2329d34b494fc877&profile_id=175', 'https://i.vimeocdn.com/video/1349890279-9db89dc53099c0fac0861c5ce5fe4e0d29ef015f3d091f6ba267ca19097d6497-d_640', 'https://player.vimeo.com/external/620360168.hd.mp4?s=c01f285112d0210cd35a519b6640cc822d67b6d6&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:37:32'),
(130, 'Low Plank (Chaturanga)', 'Duration', 'POZEX130', 'low-plank-chaturanga', NULL, NULL, '<ul><li>Press your elbows firmly against your sides to help stabilize your torso.</li><li>Keep your chest wide and your ears relaxed away from your ears.</li><li>Gently engage your core to lengthen the spine, trying to keep the longest line possible from your heels to the top of your head.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li></ul>', '<ul><li>Breathe calmly throughout the exercise. Use a light, controlled breath to keep your core engaged and not disrupt the position of your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600896077.hd.mp4?s=b16fb17463a6f305075a69db2a60a829d8ea7146&profile_id=175', 'https://i.vimeocdn.com/video/1236792472-0218da6c47a034ae6d9a5db96d8d4841bb06167d581af1cf1336a9cbe673c682-d_640', 'https://player.vimeo.com/external/613863609.hd.mp4?s=a333443d03fce0bac69a54b95c7d21ee04c1c81e&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:33'),
(131, 'Lunges', 'Reps', 'POZEX131', 'lunges', NULL, NULL, '<ul><li>Keep your torso as vertical as possible throughout the movement. To achieve this, look forward, not down, and avoid leaning forward at any point.</li><li>Place your fingertips lightly against the back of your head, keeping your elbows open and your shoulders relaxed down away from your ears. In order to lengthen through the back of the neck, do not lace your fingers behind your head.</li><li>Allow your head to float upward as you release the knees forward over your feet, moving your torso down in a smooth movement until your back knee is just off the ground.</li><li>As you ascend, push the ankle of your back foot forward as much as you can to fully engage your calf muscle. At the top of the movement, both legs should be completely straight.</li></ul>', '<ul><li>Inhale down, exhale up.</li><li>You can also invert the breathing, inhaling up, in order to feel how the inhalation can help expand your chest and torso at the top of the movement.</li></ul>', NULL, 'https://player.vimeo.com/external/640878607.hd.mp4?s=e15dc6593ac5dee48b31216547979182d80aa8e4&profile_id=175', 'https://i.vimeocdn.com/video/1289146051-30163c6df7571dd27e4202ca15db0f28b3484e8303c94504e_640', 'https://player.vimeo.com/external/620360485.hd.mp4?s=6d627f41028fa5c661ca3114f91b896c3b698c66&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:37:34'),
(132, 'Lunges to High Kicks', 'Reps', 'POZEX132', 'lunges-to-high-kicks', NULL, NULL, '<ul><li>Start the kick from the very bottom of the lunge, pushing powerfully up and forward from your back leg and then allowing that momentum to swing your leg up in front of you.</li><li>Keep your torso as vertical as possible throughout the movement. To achieve this, look forward, not down, and avoid leaning forward at any point.</li><li>Only kick as high as you can without excessive rounding in your lower back. It’s totally normal to have a little bit of rounding, but you should always feel like you have a long spine and can easily keep your chest open and your gaze straight in front of you.</li></ul>', '<ul><li>Inhale down, exhale up.</li><li>You can also invert the breathing, inhaling up, in order to feel how the inhalation can help expand your chest and torso at the top of the movement.</li></ul>', NULL, 'https://player.vimeo.com/external/640878410.hd.mp4?s=1e2d928916de2c35134de7bb6fb182e065c6fc21&profile_id=175', 'https://i.vimeocdn.com/video/1289145631-dd628966cb2f4962d3b1523c39a0b0696e9a6cddbfacd67ff_640', 'https://player.vimeo.com/external/620360233.hd.mp4?s=d679c0a64e7ad007c207dd45b70a3bbd7fa921c5&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:34'),
(133, 'Lunges with 3-Way Reach', 'Reps', 'POZEX133', 'lunges-with-3-way-reach', NULL, NULL, '<ul><li>The reach is performed not only with the arms, but also with the chest and the gaze. Really look back in the direction of the reach, and feel the chest expanding as you do.</li><li>Each reach to the side creates a spiral from the bottom of the tailbone all the way up the spine and out the top of the head. And hey, that spiral should feel good!</li><li>While it’s fine for your front knee to travel a bit forward during the lunge, it shouldn’t move much past the toes of that foot. Really reaching with the fingers will help counter the forward movement of your front leg.</li></ul>', '<ul><li>Inhale generously as you bend the knees and reach up and/or back. Exhale as you return to standing on straight legs.</li><li>Focus your awareness on how a generous inhalation helps expand the chest and increases the sensation of the spiral through the spine. This exercise should feel really good to perform, and I promise that the more you really use your breath, the better it’ll feel!</li></ul>', NULL, 'https://player.vimeo.com/external/640878476.hd.mp4?s=c3fa0abbb919d9c33d090a3b958bbd33c94ec9cc&profile_id=175', 'https://i.vimeocdn.com/video/1289145653-368f91d7ed4673a62bda58b3983707ccb78692b5a228939d9_640', 'https://player.vimeo.com/external/620360284.hd.mp4?s=202dddd04013f433084165a8cc7c24a8a287699d&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:35'),
(134, 'Lunges with Spiral Reach', 'Reps', 'POZEX134', 'lunges-with-spiral-reach', NULL, NULL, '<ul><li>The reach is performed not only with the arms, but also with the chest and the gaze. Really look back in the direction of the reach, and feel the chest expanding as you do.</li><li>Each reach to the side creates a spiral from the bottom of the tailbone all the way up the spine and out the top of the head. And hey, that spiral should feel good!</li><li>While it’s fine for the front knee to travel a bit forward during the lunge, it shouldn’t move much past the toes of that foot. Really reaching up and back with the fingers will help counter the forward movement of the front leg.</li></ul>', '<ul><li>Inhale generously as you bend the knees and reach up and back. Exhale as you return to standing on straight legs.</li><li>Focus your awareness on how a generous inhalation helps expand the chest and increases the sensation of the spiral through the spine. This exercise should feel really good to perform, and I promise that the more you really use your breath, the better it’ll feel!</li></ul>', NULL, 'https://player.vimeo.com/external/640878540.hd.mp4?s=0319c95c1b37ef6c815cfed43a4b517c9c0288b7&profile_id=175', 'https://i.vimeocdn.com/video/1289145867-24963f2d216574c6e84bee73d916f2b7530f3e09f537a7734_640', 'https://player.vimeo.com/external/620360423.hd.mp4?s=03d3006afaff475d45d05b5951a4de83666db406&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:36'),
(135, 'Lying Towel Lat Pulldown', 'Reps', 'POZEX135', 'lying-towel-lat-pulldown', NULL, NULL, '<ul><li>Pull the towel apart as hard as you can the entire time, as if you wanted to rip it in half. The pulling-apart movement is far more important to focus on than the forward and back movement of the arms.</li><li>Keep your chest wide and your shoulders down away from your ears the entire time, including when you extend your arms out in front of you.</li><li>The higher you hold your chest off the ground, the more you’ll also work the muscles of the lower back, transforming this into a killer full-back workout!</li></ul>', '<ul><li>Use a quick inhale and a strong, controlled exhale throughout the exercise to encourage core engagement and to avoid unnecessary wobbling through your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/666658656.hd.mp4?s=165ca546638f39176863409f8e0510ebb932575c&profile_id=175', 'https://i.vimeocdn.com/video/1349890376-d72cada406f0437a0cdb80454de2a143faa0d52d4b2712850eb15f634adae6a5-d_640', 'https://player.vimeo.com/external/613863777.hd.mp4?s=2acba61fe052df0a5f000f5a8ef57a08ee059a65&profile_id=175', NULL, 'back', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:37'),
(136, 'Marching Glute Bridge', 'Reps', 'POZEX136', 'marching-glute-bridge', NULL, NULL, '<ul><li>During the transition from one leg to the other, it is incredibly easy to allow your hips to drop without noticing. Focus on keeping the hips high and still as you switch legs on each rep. Feel free to take your time switching legs as you learn this exercise, eventually decreasing the transition time as you gain mastery.</li><li>The front of your pelvis should always be higher than your belly. Achieve this by pushing the hips upwards while gently contracting your core to avoid overarching the lower back.</li><li>Begin the movement by gently tucking your tailbone and rolling your hips up off the ground. Then drive your “standing” knee away from your head on each rep, working to lengthen your spine as much as possible.</li></ul>', '<ul><li>Exhale gently as you tuck the knee on each rep. Inhale as you lower the leg back to the chair.</li></ul>', NULL, 'https://player.vimeo.com/external/615719203.hd.mp4?s=06162a75d74492b4767d0af4b53efab1c4403068&profile_id=175', 'https://i.vimeocdn.com/video/1257659137-0fc362edb9ad82ec18b2c4254bdce5317398315bdb3f90e2aec3cbbc96f8ca32-d_640', 'https://player.vimeo.com/external/613863899.hd.mp4?s=216e732ae082c262c06325412c82986335920da5&profile_id=175', NULL, 'glutes,legs', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:37:37'),
(137, 'Mountain Climber', 'Duration', 'POZEX137', 'mountain-climber', NULL, NULL, '<ul><li>Start slowly and focus on dialing in perfect form on each rep before increasing speed. Then, only go as fast as you can while keeping that form perfect.</li><li>Many people use way more muscle than is necessary (or helpful) to perform Mountain Climbers. Think about the knees swinging forward with momentum, and then bouncing back on each rep.</li><li>Keep your lower back lengthened. It’s ok for your pelvis to rise a bit in order to make space for your knees, but you should never excessively round in the lower back.</li></ul>', '<ul><li>Breathe calmly throughout the exercise. Use a light, controlled breath to keep your core engaged and not disrupt the position of your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600894031.hd.mp4?s=825bdb7a1ffd5e041c2b2095ae31cfe97155c69e&profile_id=175', 'https://i.vimeocdn.com/video/1236789939-554874efe29e70712c7c5cc35a94e19d33505ce111606aea6f9247995bf53226-d_640', 'https://player.vimeo.com/external/613864070.hd.mp4?s=74d81ca8fa9f7c05838ac256230b32559ba2da6d&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:38'),
(138, 'Mountain Climber - Cross Body', 'Duration', 'POZEX138', 'mountain-climber-cross-body', NULL, NULL, '<ul><li>In order to feel a spiral through your entire spine, think about really driving your knee far to the side as you swing it forward, while looking straight down between your hands so as to avoid the head turning on each rep.</li><li>Start slowly and focus on dialing in perfect form on each rep before increasing speed. Then, only go as fast as you can while keeping that form perfect.</li><li>Keep your lower back lengthened. It’s ok for your pelvis to rise a bit in order to make space for your knees, but you should never excessively round in the lower back.</li></ul>', '<ul><li>Breathe calmly throughout the exercise. Use a light, controlled breath to keep your core engaged and not disrupt the position of your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600893758.hd.mp4?s=8f4dbcb7fa096858f9f9ed449bbec2be1f5b1a1e&profile_id=175', 'https://i.vimeocdn.com/video/1236789839-2b7bf8f6845a4f2129d7871c2a77c8941edb8db51ee61724c54c620cf0b6679f-d_640', 'https://player.vimeo.com/external/613859706.hd.mp4?s=1f8aa4dbd599455205464ea61006d2104cb0432a&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:39');
INSERT INTO `exercises` (`id`, `title`, `based_on`, `code`, `slug`, `category_id`, `duration`, `instructions`, `breath`, `description`, `tip_video`, `tip_video_thumbnail`, `video_link`, `reps`, `focus_area`, `specific_muscles`, `good_for`, `type`, `Notes`, `level`, `image`, `tags`, `created_at`) VALUES
(139, 'Narrow Push-Ups', 'Reps', 'POZEX139', 'narrow-push-ups', NULL, NULL, '<ul><li>Keep your elbows tucked tightly against your sides to focus more of the effort on the triceps.</li><li>To find the ideal hand position, lay on your belly and place your hands on the ground at the sides of your torso so that your thumbs are underneath the bottom of your pectoral (chest) muscles.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li><li>You can perform these push-ups with a perfectly straight spine, or you can gently arch the upper back and look just a bit in front of you to keep a long spine. Either variation is fine, but no matter what, be sure not to arch your lower back at any point.</li><li>To make this exercise easier, feel free to perform it with your knees on the ground.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600558591.hd.mp4?s=087ed57f96478784721c8ef7bfdc3efac0462569&profile_id=175', 'https://i.vimeocdn.com/video/1236390361-6470c9b5b8c957fa7955ff22832cd642b73196b954ff07d9ba6f24f3de9bdc55-d_295x166', 'https://player.vimeo.com/external/599112443.hd.mp4?s=f319314753c7498957051b861377d081c17fa847&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:39'),
(140, 'Narrow Push-Ups - 1 leg ', 'Reps', 'POZEX140', 'narrow-push-ups-1-leg', NULL, NULL, '<ul><li>If you really reach with the toes of your extended leg, it should feel light. If it feels heavy, you’re probably bending the knee and allowing the weight of your leg to drop. Reach, reach, reach!</li><li>Keep your elbows tucked tightly against your sides to focus more of the effort on the triceps.</li><li>To find the ideal hand position, lay on your belly and place your hands on the ground at the sides of your torso so that your thumbs are underneath the bottom of your pectoral (chest) muscles.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on your wrists.</li><li>To make this exercise easier, feel free to perform it with your knees on the ground.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604884302.hd.mp4?s=fb2f77d7d4cab542c287d196c46e544ca2d9cb37&profile_id=175', 'https://i.vimeocdn.com/video/1241293342-f960769de77f399febf75ec2f2e9acaba3ff8f0d059ff28443374d40cbae1417-d_640', 'https://player.vimeo.com/external/613864207.hd.mp4?s=2de6131bf1e42caf5806fb02e8e9b69ba4d9cacc&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:40'),
(141, 'Narrow Push-Ups - 1 Leg Alternating ', 'Reps', 'POZEX141', 'narrow-push-ups-1-leg-alternating', NULL, NULL, '<ul><li>Try to keep your body as still and quiet as possible as you switch legs on each rep. At first, focus on keeping the transition smooth and slow, then increase the speed as much as you can without causing extra tension or wobble.</li><li>Don’t “lift” the back leg. Instead, think of reaching back as far as you can with your toes, so that the knee straightens as you create the longest line possible from the tips of your toes to the top of your head.</li><li>Keep your elbows tucked tightly against your sides to focus more of the effort on the triceps.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604885959.hd.mp4?s=c7fbb5860c46e14d254c6cca27f7e6d30e6e66ed&profile_id=175', 'https://i.vimeocdn.com/video/1241295272-ea8a09d1ff91c1bf4389ac63fd222fc0cfa0291bdfd7952c408720cc429b7e2c-d_640', 'https://player.vimeo.com/external/613864414.hd.mp4?s=e5c7917b3269d76d309e7924e05b61643cfc2e73&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:41'),
(142, 'Narrow Push-Ups on Knees', 'Reps', 'POZEX142', 'narrow-push-ups-on-knees', NULL, NULL, '<ul><li>Place a mat, towel, or cushion under your knees for comfort.</li><li>Keep the longest line possible from your knees through the top of your head. In particular, avoid bending too much at the waist and sticking your butt up in the air.</li><li>Keep your elbows tucked tightly against your sides to focus more of the effort on the triceps.</li><li>To find the ideal hand position, lay on your belly and place your hands on the ground at the sides of your torso so that your thumbs are underneath the bottom of your pectoral (chest) muscles.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604888302.hd.mp4?s=dcd471fdc93f7c0a0db4d06e31e129ac3d2faac1&profile_id=175', 'https://i.vimeocdn.com/video/1241297269-b0b9a89351e312f598cee3a7c3cca37d226f9bc87555ff08d0c10efca6c472e9-d_640', 'https://player.vimeo.com/external/613864471.hd.mp4?s=93d0e794a2381c1279e04f056c9df40d56212d8a&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:37:42'),
(143, 'Oscillating Sumo Squats', 'Reps', 'POZEX143', 'oscillating-sumo-squats', NULL, NULL, '<ul><li>Place your feet wide and turn your toes slightly out toward the sides. Then, as you descend, point your tailbone down and back while keeping your chest open and facing forward.</li><li>To initiate each movement to one side, push into the opposite heel, feeling how that push starts a lateral undulation that travels up the spine, with the head moving last.</li><li>Do not engage your core! Keep your belly completely relaxed to allow an organic curve in the lower back and to feel the undulation moving through the spine with as much freedom and flow as possible.</li><li>There is no set movement for the arms. The goal is to keep the chest relaxed open and to allow the arms and hands to move in response to the movement of the spine.</li><li>You can allow your knees to move side to side a bit with the movement of your torso, or you can keep them fixed in place, isolating the lateral movement to the upper body. Both versions have wonderful benefits, and I highly recommend you try both!</li></ul>', '<ul><li>Keep your breath as relaxed and regular as possible throughout the exercise.</li></ul>', NULL, 'https://player.vimeo.com/external/600955779.hd.mp4?s=4e88d3ae8f31f90b8946b722c6c87bb0e66ddd65&profile_id=175', 'https://i.vimeocdn.com/video/1236868506-3ec96d409b987dcc73c285ff9f9d6d5ae1475a1b206372a9c6128191086e98f0-d_640', 'https://player.vimeo.com/external/622093986.hd.mp4?s=053dd73422dc78835f2d4d857317189678300b34&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:43'),
(144, 'Oscillating Sumo Squats with Figure 8', 'Reps', 'POZEX144', 'oscillating-sumo-squats-with-figure-8', NULL, NULL, '<ul><li>You should be comfortable with regular Oscillating Sumo Squats before trying this more advanced variation, which adds a powerful rotation through the spine on each lateral movement.</li><li>To initiate each movement to one side, push into the opposite heel, feeling how that push starts a lateral undulation that travels up the spine, with the head moving last.</li><li>The rotation of the spine is a result of allowing the momentum that comes from the push through the heel to travel freely through the entire spine. Do not “try” to rotate your torso. Instead, see how much you can allow it to turn in response to the wave traveling through the spine.</li><li>Do not engage your core! Keep your belly completely relaxed to allow an organic curve in the lower back and to feel the undulation moving through the spine with as much freedom and flow as possible.</li><li>There is no set movement for the arms. The goal is to keep the chest relaxed open and to allow the arms and hands to move in response to the movement of the spine.</li></ul>', '<ul><li>Keep your breath as relaxed and regular as possible throughout the exercise.</li></ul>', NULL, 'https://player.vimeo.com/external/600955553.hd.mp4?s=17d140bf10f2d4526a96e7105eeb35321fa89675&profile_id=175', 'https://i.vimeocdn.com/video/1236869245-2ed36efa66b93106d377c1944d7e5d2d0b1c6d2b49abac5050c0af291e13475f-d_640', 'https://player.vimeo.com/external/622093940.hd.mp4?s=1f69648b442e8151685a7428df7833ff6ef8d130&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:43'),
(145, 'Pelvic Tilts', 'Reps', 'POZEX145', 'pelvic-tilts', NULL, NULL, '<ul><li>The goal of Pelvic Tilts is to work on increasing your awareness of the articulation available in the pelvis and lower spine, as well as the relationship between the breath and the organic rocking movement of the pelvis. Therefore, focus on your breath and on feeling the subtlest movement possible, rather than trying to get stronger.</li><li>The tucking of the pelvis is the same subtle movement you should use to start all glute bridge variations, and the arching of the spine initiated by the movement of the tailbone is the same as the beginning of most squat variations. So the more you are able to really feel the smallest details of this movement, the more it will serve you in other, more dynamic exercises.</li><li>In general, slower is better. But the goal is not to move slowly. Rather the slower speed of this exercise is a result of focusing on articulation and breath.</li></ul>', '<ul><li>Keep your breath as relaxed and regular as possible throughout the exercise. Use a light breath so as not to cause unnecessary movement in the pelvis or torso.</li></ul>', NULL, 'https://player.vimeo.com/external/646708918.hd.mp4?s=11ed8c750ee5e3610b91f56798669a769715ee0b&profile_id=175', 'https://i.vimeocdn.com/video/1301906565-bf46dd6de089eb72a3a3b7feab92bb98cd92ad97ce664ece5_640', 'https://player.vimeo.com/external/613864746.hd.mp4?s=b2a7e00c9657301091a834a4e07a03f785839ad7&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:44'),
(146, 'Pike Push-Ups ', 'Reps', 'POZEX146', 'pike-push-ups', NULL, NULL, '<ul><li>In order to focus the work on your shoulders (and not just your chest, as in regular push-ups), aim the top of your head down right between your hands as you descend.</li><li>Similarly, from the bottom of the movement, think about pushing the tailbone and pelvis up, not back.</li><li>To increase the challenge, bring your feet closer to your hands and push up onto your tippy toes. To decrease the challenge, move your feet a bit further back away from your hands.</li><li>To increase the challenge to the triceps, keep your elbows in toward each other. To focus more on the shoulders, allow the elbows to flare out a bit toward the sides.</li></ul>', '<ul><li>Inhale down, exhale up. If you find this exercise challenging, you can also begin the exhale a bit earlier, on the last 25% of the descent, which will help engage the core to assist with a stronger push.</li></ul>', NULL, 'https://player.vimeo.com/external/604888617.hd.mp4?s=64b02a1b90aea59b6c7e8fcbf9d3d35d584f278a&profile_id=175', 'https://i.vimeocdn.com/video/1241298100-36553b0b95aa11057a5f15b7a66fe7c5f28540523eea8a3da953a8eeafee8e8e-d_640', 'https://player.vimeo.com/external/613865002.hd.mp4?s=6741008c6301c1983a67a7055369cb6aa6e702af&profile_id=175', NULL, 'shoulders', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:45'),
(147, 'Pike Push-Ups - 1 Leg', 'Reps', 'POZEX147', 'pike-push-ups-1-leg', NULL, NULL, '<ul><li>Don’t “lift” the back leg. Instead, think of reaching up and back as far as you can with your toes, so that the knee straightens as you create the longest line possible from the tips of your toes to the top of your head.</li><li>In order to focus the work on your shoulders (and not just your chest, as in regular push-ups), aim the top of your head down right between your hands as you descend.</li><li>Similarly, from the bottom of the movement, think about pushing the tailbone and pelvis up, not back.</li><li>To increase the challenge, bring your feet closer to your hands and push up onto your tippy toes. To decrease the challenge, move your feet a bit further back away from your hands.</li><li>To increase the challenge to the triceps, keep your elbows in toward each other. To focus more on the shoulders, allow the elbows to flare out a bit toward the sides.</li></ul>', '<ul><li>Inhale down, exhale up. If you find this exercise challenging, you can also begin the exhale a bit earlier, on the last 25% of the descent, which will help engage the core to assist with a stronger push.</li></ul>', NULL, 'https://player.vimeo.com/external/604888473.hd.mp4?s=622cffd909b07570a50c218dd0f78bd1f8f47dde&profile_id=175', 'https://i.vimeocdn.com/video/1241297266-4e20709e79bc629625413e1032b4b5a2ed8d854730d92e47f756a9916a20ddef-d_640', 'https://player.vimeo.com/external/613865002.hd.mp4?s=6741008c6301c1983a67a7055369cb6aa6e702af&profile_id=175', NULL, 'shoulders', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:37:46'),
(148, 'Plank - Elbows', 'Duration', 'POZEX148', 'plank-elbows', NULL, NULL, '<ul><li>Actively push into the ground with your forearms the entire time.</li><li>Keep the front of your pelvis open and the core gently engaged to avoid your butt being higher than your lower back.</li><li>In order to keep your head and neck in line with your spine you should be looking down toward your hands, not forward.</li><li>Continue lengthening your spine as long as you can with perfect form. Finish the movement the moment you feel your lower back begin to drop at all.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600894949.hd.mp4?s=2932de69c44aac15dd7f8b7927822046c3f06e90&profile_id=175', 'https://i.vimeocdn.com/video/1236791171-1feb1a5993fd12eb9d9b70d9d1e87a2c93682a6d096decab746c25e29e9d500e-d_640', 'https://player.vimeo.com/external/613859935.hd.mp4?s=f9a9d3ed5a1a1e69b6de2e7b13fffa405d3d0cb1&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:37:46'),
(149, 'Plank - Fingertips', 'Duration', 'POZEX149', 'plank-fingertips', NULL, NULL, '<ul><li>Think of actively pushing your body up with your fingers, rather than allowing the weight to sink down onto them. Keep your hands and fingers as active as possible throughout the exercise.</li><li>Place your hands shoulder-width apart and keep your arms perpendicular to the ground.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears throughout the entire exercise.</li><li>Gently engage your core to lengthen the spine, trying to keep the longest line possible from your heels to the top of your head.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600895251.hd.mp4?s=c20eb32b54052688f725730f0aa8be0b3ad00cc6&profile_id=175', 'https://i.vimeocdn.com/video/1236792034-502328f9c830c73618dad769a938328a393e3d8acb59dc9b02bf5557874b9c90-d_640', 'https://player.vimeo.com/external/613860374.hd.mp4?s=3a0dbe2612f4dd9c9bdf79e9fc5e5d2f16e64f89&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:47'),
(150, 'Plank - Hands', 'Duration', 'POZEX150', 'plank-hands', NULL, NULL, '<ul><li>Keep the front of your hips open and the core gently engaged to avoid the butt being higher than your lower back.</li><li>In order to keep your head and neck in line with your spine you should be looking down at the ground between your hands, not forward.</li><li>Continue lengthening your spine as long as you can with perfect form. Finish the movement the moment you feel your lower back begin to drop at all.</li><li>Keep your weight over the pads of your second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/progressive_redirect/playback/673639070/rendition/1080p?loc=external&signature=f29ab64b4fab43c733dc8162a6424358a83ed7f0b9ee380dff2e3137ca947432', 'https://i.vimeocdn.com/video/1236792034-502328f9c830c73618dad769a938328a393e3d8acb59dc9b02bf5557874b9c90-d_640', 'https://player.vimeo.com/external/613861028.hd.mp4?s=5c1b0b1013bf34b6b68e3fb7c304e8ce37597c5c&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:37:48'),
(151, 'Plank - Knuckles', 'Duration', 'POZEX151', 'plank-knuckles', NULL, NULL, '<ul><li>Always perform Knuckle Planks on a mat or folded-over towel until you can perform them effortlessly. Only then should you move to a hard surface such as a wood floor.</li><li>Think of actively pushing your body up with your fists, rather than allowing the weight to sink down onto them.</li><li>Place your fists below your shoulders with your palms facing each other and your thumbs on the outside of your closed fist, pointing down toward the ground.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears throughout the entire exercise.</li><li>Gently engage your core to lengthen the spine, trying to keep the longest line possible from your heels to the top of your head.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600896393.hd.mp4?s=54b932c3962f11ce061818ed834fc3475e20dfec&profile_id=175', 'https://i.vimeocdn.com/video/1236792625-acdabb1c857e64aa8b0a7cafeed1c40f8126bd4c229916a4e7a6e02e3d7f578a-d_640', 'https://player.vimeo.com/external/615445013.hd.mp4?s=da9c989844cbf73e43ac50600a6cc0c095b914f6&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:49'),
(152, 'Plank Jacks', 'Duration', 'POZEX152', 'plank-jacks', NULL, NULL, '<ul><li>The pelvis will need to lift up a bit to make space for the movement of the legs, but you do not want to stick your butt up. Instead, think about the entire torso and pelvis floating up just enough to make room for easy movements with the lower body.</li><li>Keep the landing of the feet as light and quiet as possible.</li><li>If you’re new to this exercise, you can start by only jumping your feet apart a bit. Then, as you feel more comfortable, try to spread them wider and wider on each jump.</li></ul>', '<ul><li>Keep your breath as relaxed and regular as possible throughout the exercise. Use a light breath so as not to cause unnecessary movement in the pelvis or torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600897221.hd.mp4?s=66b40a4f4880184e6d12a2fe1152e227528f842c&profile_id=175', 'https://i.vimeocdn.com/video/1236793924-d9336dffec02f45627ea1583bab8f638b09abdec62b4a692ca39a489bff92ffc-d_640', 'https://player.vimeo.com/external/613865055.hd.mp4?s=ef22fb7345d0441cf12de78d4cedb95028bbb27c&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:37:49'),
(153, 'Plank to Side Plank', 'Reps', 'POZEX153', 'plank-to-side-plank', NULL, NULL, '<ul><li>Take your time in the plank, as well as the side plank on each side, to really feel the length through the spine and the support of the muscles of the core. Focus in particular on keeping a long line through the entire body while transitioning from the plank to side plank and back.</li><li>As you transition from the plank into the side plank, extend the top arm as soon as possible and to really reach with your fingers. It might feel easier to first find your balance before extending the arm, but in reality, the more you reach with fingers of the top hand, the easier it will be to keep your balance.</li><li>Keep the longest line possible from hand to hand while in the side plank.</li><li>During the plank you should be looking down, not forward, to keep a long spine. During the side plank, you should be looking directly in front of you, not up or down.</li></ul>', '<ul><li>You can choose to spend time breathing in each of the positions to really dial in your form, or you can move more smoothly from the plank to side plank and back on each rep.</li><li>To start, I recommend inhaling as you move from the plank to side plank, and exhaling as you move from the side plank back down to the plank. But in the long run, you can also just breathe naturally throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/600899917.hd.mp4?s=8901599c2037bee9b13dfb7f984659e473cd0842&profile_id=175', 'https://i.vimeocdn.com/video/1236797052-7b75defd2af902c9da77dfc9cf3a82142d0270ff9e1d34c21aa16079169b61bd-d_640', 'https://player.vimeo.com/external/620360631.hd.mp4?s=25f6df7a4d8ee76fa46f3c92ab604051e50884c1&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:50'),
(154, 'Plank with Back Reach Under', 'Reps', 'POZEX154', 'plank-with-back-reach-under', NULL, NULL, '<ul><li>Fully release your abs while reaching up and forward on each rep. This will help you achieve more extension and rotation through the spine. It will also encourage lengthening your core muscles that you’ll then engage, leading to better contraction and more ROM (Range of Motion).</li><li>As you reach under your torso, don’t just think of contracting your core. Instead, think of moving your sternum and belly up away from the ground to  make room for your arm to pass under.</li><li>Similarly, don’t aim your fingers under your torso as you reach back. Aim your fingers at your torso, so you’re forced to really actively move your torso up out of the way.</li><li>You want to lift your torso as you reach under, but not your butt. Keep your butt down throughout the exercise.</li><li>When you are reaching as far under your body as you can… you’re probably not! So instead of reaching to a certain point, exhale forcefully and really squeeze in the core to reach your fingers just a few millimeters further for a second or two.</li></ul>', '<ul><li>Inhale generously as you reach up in front of you. Feel how the inhalation encourages expansion and rotation through the spine and torso.</li><li>Then exhale as you reach back under your torso. Use a strong, controlled exhale, and notice how the exhale helps contract the abs, allowing you to reach further with your fingers.</li></ul>', NULL, 'https://player.vimeo.com/external/646708985.hd.mp4?s=8671caa5cf98d6ec63b77c5b2e1691c532fdfd51&profile_id=175', 'https://i.vimeocdn.com/video/1301907194-0c94e0ecfceda59ae5aef2418bca73d0d355613a8dd3ca18d_640', 'https://player.vimeo.com/external/624198254.hd.mp4?s=0ce7c7cb630309f89803bc1115f257bf1770a1ae&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:51'),
(155, 'Plank with Front and Back Reach Under', 'Reps', 'POZEX155', 'plank-with-front-and-back-reach-under', NULL, NULL, '<ul><li>Be sure to master Plank with Front Reach Under and Plank with Back Reach Under before trying this more advanced variation.</li><li>As you reach the hand forward under your torso, aim your fingers as far forward (toward your head) as possible.</li><li>Fully release your abs while reaching up and swooping the arm around on each rep. This will help you achieve more extension and rotation through the spine. It will also encourage lengthening your core muscles that you’ll then engage, leading to better contraction and more ROM (Range of Motion).</li><li>Be sure to enjoy the spiral motion of your arm as you raise and swoop it up on each rep!</li></ul>', '<ul><li>Inhale generously as you swoop the arm up and around on each rep. Feel how the inhalation encourages expansion and rotation through the spine and torso.</li><li>Then exhale as you reach under your torso. Use a strong, controlled exhale, and notice how the exhale helps contract the abs, allowing you to reach further with your fingers.</li></ul>', NULL, 'https://player.vimeo.com/external/646709036.hd.mp4?s=b0faf4fa0fc147752e6f57cc2c54bca41ff7934b&profile_id=175', 'https://i.vimeocdn.com/video/1301906923-06a4be6f31bb8254750a5f1b4c308749af041de1d5e48c2b3_640', 'https://player.vimeo.com/external/613865084.hd.mp4?s=5e74c0f409eb20a7191867680fab60450820a0cf&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:51'),
(156, 'Plank with Front Reach Under', 'Reps', 'POZEX156', 'plank-with-front-reach-under', NULL, NULL, '<ul><li>As you reach the hand under your torso, aim your fingers as far forward (toward your head) as possible.</li><li>Fully release your abs and allow your torso to rotate open while reaching up on each rep. Also look up toward your hand, to encourage a spiral through the entire spine.</li><li>As you reach under your torso, don’t just think of contracting the core. Instead, think of moving your sternum and chest up away from the ground to  make room for your arm to pass under.</li><li>Similarly, don’t aim your fingers under your torso as you reach back. Aim your fingers at your torso, so you’re forced to really actively move your torso up out of the way.</li><li>Be sure to enjoy the spiral motion of the arm and torso as you raise the arm up and back on each rep!</li></ul>', '<ul><li>Inhale generously as you swoop the arm up and around on each rep. Feel how the inhalation encourages expansion and rotation through the spine and torso.</li><li>Then exhale as you reach under your torso. Use a strong, controlled exhale, and notice how the exhale helps contract the abs, allowing you to reach further with your fingers.</li></ul>', NULL, 'https://player.vimeo.com/external/646709102.hd.mp4?s=9bba3f9d7778b82e42511d65582eb77a6f66b5eb&profile_id=175', 'https://i.vimeocdn.com/video/1301906904-4cfe6dfa615322fa6d9e50717d3b790a7c637af04ede43cae_640', 'https://player.vimeo.com/external/624198427.hd.mp4?s=a3476c350f53401b758040f5e49b74dcdfa33b51&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:52'),
(157, 'Plank with Handstand Suspension', 'Reps', 'POZEX157', 'plank-with-handstand-suspension', NULL, NULL, '<ul><li>On the lengthened leg, think about reaching out and up with your toes, rather than trying to “lift your leg.” Reach as far as you can and avoid bending the knee.</li><li>On the bottom leg, really articulate and push through the toes to help get higher in your suspension. Then, keep the toes pointed away as you’re in the air, so you can also articulate through the foot on the way down to land as softly and quietly as possible on each rep.</li><li>For beginners, you can look down at the ground a bit in front of your fingers, as you see in the video above. As you get more comfortable with the movement, you can also release the head down as you kick the leg up on each rep.</li><li>It’s fine to allow a little bit of movement in the lower back, but you don’t want to end up in the “banana” position. Think about gently contracting the core to lengthen the back as you kick up on each rep.</li></ul>', '<ul><li>Inhaling as you kick up into the suspension will help you feel expansion through your torso and length through your spine. Exhaling as you kick up will help you more easily contract the core to encourage a long line through the spine. I recommend practicing both methods in the beginning to feel the benefits of each.</li></ul>', NULL, 'https://player.vimeo.com/external/600895772.hd.mp4?s=83cb2e57a0ceb5fd997d47d053cf88a63acfd682&profile_id=175', 'https://i.vimeocdn.com/video/1236792098-728263d7980736f8a18c3d2960fb3c24d80fcacd8f698fa571a264e807029ab4-d_640', 'https://player.vimeo.com/external/620360820.hd.mp4?s=fe460af342b07ff4f71fab3a4da7b734fa133b1e&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:53'),
(158, 'Plank with Kicks', 'Reps', 'POZEX158', 'plank-with-kicks', NULL, NULL, '<ul><li>Only kick the leg as high as you can without creating excessive arching in the lower back.</li><li>On the lengthened leg, think about reaching out and up with your toes, rather than trying to “lift your leg.” Reach as far as you can with your toes and avoid bending your knee.</li><li>In order to keep your head and neck in line with your spine you should be looking down at the ground, not forward.</li><li>Keep your weight over the pads of your second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600900047.hd.mp4?s=0d1bff880e2e041a3443b00cd54029353c805710&profile_id=175', 'https://i.vimeocdn.com/video/1236798735-3f4a49b9eb5ffc608319756738dded9e4e32fc51afe2cab597b186e6072b1444-d_640', 'https://player.vimeo.com/external/613865116.hd.mp4?s=1549f9be419cb0c8c7191e52e79fa7ccc63f2968&profile_id=175', NULL, 'core,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:54'),
(159, 'Plank with Side Reach Under', 'Reps', 'POZEX159', 'plank-with-side-reach-under', NULL, NULL, '<ul><li>As you reach under your torso, don’t just think of contracting the core. Instead, think of moving your sternum and belly up away from the ground to  make room for your arm to pass under.</li><li>Similarly, don’t aim your fingers under your torso as you reach back. Aim your fingers at your torso, so you’re forced to really actively move your torso up out of the way.</li><li>Be sure to enjoy the spiral motion of the arm and torso as you raise the arm up and back on each rep!</li><li>When you are reaching as far under your body as you can… you’re probably not! So instead of reaching to a certain point, exhale forcefully and really squeeze in the core to reach your fingers just a few millimeters further for a second or two.</li></ul>', '<ul><li>Inhale generously as you swoop the arm up and around on each rep. Feel how the inhalation encourages expansion and rotation through the spine and torso.</li><li>Then exhale as you reach under your torso. Use a strong, controlled exhale, and notice how the exhale helps contract the abs, allowing you to reach further with your fingers.</li></ul>', NULL, 'https://player.vimeo.com/external/646709152.hd.mp4?s=b65dc0a0d47cde74443aebf5e5d27e6db448ef05&profile_id=175', 'https://i.vimeocdn.com/video/1301907209-27868af055a36e9415b9f567db3aa66cca459e4ea78ddc325_640', 'https://player.vimeo.com/external/613865150.hd.mp4?s=91c9c081dfcb35234c48a83021416514373c51ec&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:54'),
(160, 'Pulling Hands', 'Reps', 'POZEX160', 'pulling-hands', NULL, NULL, '<ul><li>Keep your chest open wide and your shoulders relaxed down away from your ears, especially as you exhale and pull on each rep.</li><li>Keep your hands slightly in front of your elbows, so that your arms form a bit of a circle.</li><li>To further engage the muscles of the middle back, think not just about pulling your hands, but also squeezing your shoulder blades together on each pull.</li><li>This exercise can work your back and rear deltoids like crazy. But the only resistance is your own willingness to pull as hard as you can. So shift into Beast Mode and feel that burn!</li></ul>', '<ul><li>Inhale generously while resting between reps. Exhale powerfully while pulling your hands apart, using a controlled exhale to encourage stillness through the torso.</li></ul>', NULL, 'https://player.vimeo.com/external/632730797.hd.mp4?s=aec3f1f78e4f4950250df49d736a611066a8ee1e&profile_id=175', 'https://i.vimeocdn.com/video/1275058474-ce4d681121f628d5530aa6d99a85c11b8862167447a46bce7_640', 'https://player.vimeo.com/external/620360947.hd.mp4?s=b4d7d09cc678a41e553dedb7e73a20164fad4106&profile_id=175', NULL, 'back,core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:55'),
(161, 'Pulling Hands with Lateral Shift', 'Reps', 'POZEX161', 'pulling-hands-with-lateral-shift', NULL, NULL, '<ul><li>To create the lateral shift of the hands, don’t think about moving the hands to one side. Instead, pull as hard as you can with both hands, and then pull even harder with one hand, while still resisting like crazy with the other.</li><li>As you pull the hands to each side, keep your torso and pelvis pointing straight forward.</li><li>For a powerful back workout, be sure to pull far enough that the elbow of the hand being pulled moves all the way to the inside of that shoulder, closer to the center of your chest.</li><li>Keep your chest open wide and your shoulders relaxed down away from your ears, especially as you exhale and pull on each rep.</li><li>This exercise can work your back and rear deltoids like crazy. But the only resistance is your own willingness to pull as hard as you can. So shift into Beast Mode and feel that burn!</li></ul>', '<ul><li>Inhale generously while resting between reps. Exhale powerfully while pulling your hands to one side, using a controlled exhale to encourage stillness through the torso.</li></ul>', NULL, 'https://player.vimeo.com/external/632724729.hd.mp4?s=5042526c4eba3bc228edfa7efda6c89747e2fc15&profile_id=175', 'https://i.vimeocdn.com/video/1275052598-ff3ac88b195a3f16558d8d78fe454d94404d0ec6a52d50a45_640', 'https://player.vimeo.com/external/620360918.hd.mp4?s=8be21c8b46c8cf608efbf1bf4f0d2d2ead340359&profile_id=175', NULL, 'back,core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:56'),
(162, 'Pulsing Leg Lifts', 'Reps', 'POZEX162', 'pulsing-leg-lifts', NULL, NULL, '<ul><li>Rather than thinking about lifting the leg, think about reaching away and up with the toes to keep the leg lengthened and the knee straight.</li><li>Reach through your fingertips and keep your arms just slightly in front of the centerline of your body.</li><li>Only kick as high as you can without rounding in the lower back.</li><li>The goal is to keep your chest open, your shoulders relaxed down away from your shoulders, and a long spine. It’s easy to focus on trying to kick the leg higher on each pulse, but that’s far less important than keeping solid form throughout your entire body.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in the torso.</li></ul>', NULL, 'https://player.vimeo.com/external/632731500.hd.mp4?s=a0c542bde6bc85298ccd7e8bc12a0f495bf78fe4&profile_id=175', 'https://i.vimeocdn.com/video/1275058624-6e30b5bcb59be236d663f5d4a603fd0d1d13c8c52a77d1ef1_640', 'https://player.vimeo.com/external/620360973.hd.mp4?s=fb2c0563c1be1add0ff57f9acd0a04b2656e899f&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:57'),
(163, 'Push Backs   ', 'Reps', 'POZEX163', 'push-backs', NULL, NULL, '<ul><li>As you push back from the front position, keep your butt down and your belly and chest as close to the ground as possible. Allow your knees to open a bit to the sides to make space for your torso.</li><li>Push yourself back from your fingertips and the pads of your second and third fingers, not from your palms.</li><li>Look down, not forward, through the entire movement, to keep a long spine.</li></ul>', '<ul><li>Exhale as you lower your body down and push back. Inhale as you push yourself forward.</li></ul>', NULL, 'https://player.vimeo.com/external/607170422.hd.mp4?s=aa7757b8e8e00c4bbd4e7ba8244ec79d67418816&profile_id=175', 'https://i.vimeocdn.com/video/1243823152-a75143aec2e07bba3e8936996f6b089db1c8b3ab71f4ad655989246fe8807bbc-d_640', 'https://player.vimeo.com/external/613865762.hd.mp4?s=513b2a7e29e49845a6cd893f415ad9902e93f743&profile_id=175', NULL, 'shoulders,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:37:57'),
(164, 'Push Backs - Bidirectional', 'Reps', 'POZEX164', 'push-backs-bidirectional', NULL, NULL, '<ul><li>As you push back from the front position, try to reach back toward your heels with your tailbone. Then, as you push yourself forward again, think about driving forward from the very top of your head. Make sure to look down, not forward, to keep a long spine.</li><li>While the head will have more focus while moving forward and the tailbone while moving back, thinking about energy shooting out in both directions throughout the entire exercise will help lengthen the spine and increase flow and ease.</li><li>Keep your knees just off the ground and your chest as low as possible.</li></ul>', '<ul><li>Exhale as you push back. Inhale as you push yourself forward.</li></ul>', NULL, 'https://player.vimeo.com/external/607169940.hd.mp4?s=9c28997d6866b4a36dace25cf9f5f65c74d11e91&profile_id=175', 'https://i.vimeocdn.com/video/1243822670-d06eb16b33d263181396e396d4e918ccbe20e5ba7e1626b35405e28639bf9b9c-d_640', 'https://player.vimeo.com/external/613865188.hd.mp4?s=bf20b8c2333a372f62f4d8114847ec7daa336701&profile_id=175', NULL, 'shoulders,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:58'),
(165, 'Push Backs on Knees', 'Reps', 'POZEX165', 'push-backs-on-knees', NULL, NULL, '<ul><li>As you push yourself forward, keep a straight line from the front of your knees up through the front of your torso.  As you push back, focus on deepening that crease between your legs and belly, which will help keep the torso low and focus more of the effort into your shoulders.</li><li>Feel free to put a towel or mat under your knees as needed for comfort.</li><li>As you begin this movement, feel free to break it down into three individual movements in order to perfect your form. As you get more comfortable with it, feel free to find more of a flow and to link together the movements.</li></ul>', '<ul><li>Exhale as you lower your body down and push back. Inhale as you push yourself forward.</li></ul>', NULL, 'https://player.vimeo.com/external/607170057.hd.mp4?s=ba13d6618dc1958308df7e8a2656dfe38584838d&profile_id=175', 'https://i.vimeocdn.com/video/1243822932-2506dfbe18bebfda52acb8e74d71792d005d69b9b99e923a5ace624bb7a70ccd-d_640', 'https://player.vimeo.com/external/613865402.hd.mp4?s=b538c5d8f7f1263153feccb4694b4da212b03b3a&profile_id=175', NULL, 'shoulders,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:37:59'),
(166, 'Push Backs with Alternating Knee Taps', 'Reps', 'POZEX166', 'push-backs-with-alternating-knee-taps', NULL, NULL, '<ul><li>As you push back from the front position, try to reach back toward your heels with your tailbone. Then, as you push yourself forward again, think about driving forward from the very top of your head. Make sure to look down, not forward, to keep a long spine.</li><li>Depending on your flexibility, your knee may not actually touch your elbow, and that’s fine. Just focus on driving the knee forward and then reaching back with your toes to lengthen the leg again.</li><li>As you push yourself forward, focus on keeping your chest low from the beginning of the push, rather than first pushing forward and then lowering your torso, as you would in push-up.</li><li>Keep your knees just off the ground and your chest as low as possible.</li></ul>', '<ul><li>Exhale as you push back. Inhale as you push yourself forward.</li></ul>', NULL, 'https://player.vimeo.com/external/604884664.hd.mp4?s=bb138de96257b0f6cae88993a5a32a866a4b66b0&profile_id=175', 'https://i.vimeocdn.com/video/1241292996-3d4eb5f691e5f2add6347f1060ee1ac3b568860ba664cb0f16d5bd74d82055bb-d_640', 'https://player.vimeo.com/external/613865726.hd.mp4?s=1314d52f8c203cfdcaddb292ff78ee5e593651f4&profile_id=175', NULL, 'shoulders,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:37:59'),
(167, 'Push-Ups  ', 'Reps', 'POZEX167', 'push-ups', NULL, NULL, '<ul><li>Keep your elbows between a 30-45° angle, choosing the angle that is most comfortable for your body.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears throughout the entire exercise.</li><li>Gently engage your core to lengthen the spine, trying to keep the longest line possible from your heels to the top of your head.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li><li>To make push-ups easier, perform them with your knees on the ground.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/612641455.hd.mp4?s=0b9d19aab9e0d963baf23c35af05f1a6f6568631&profile_id=175', 'https://i.vimeocdn.com/video/1250114218-6ef8889c34fc795d326c15c35886309183b77ce817c42723da9efa4f0b9c388a-d_640', 'https://player.vimeo.com/external/613866530.hd.mp4?s=4e7d4831df0d86b56e9ff557d4c411740bf48284&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:00'),
(168, 'Push-Ups on Knees', 'Reps', 'POZEX168', 'push-ups-on-knees', NULL, NULL, '<ul><li>Place a mat, towel, or cushion under your knees for comfort.</li><li>Keep your elbows between a 30-45° angle, choosing the angle that is most comfortable for your body.</li><li>Keep your chest wide and your shoulders relaxed down away from your ears throughout the entire exercise.</li><li>Gently engage your core to lengthen the spine, trying to keep the longest line possible from your knees to the top of your head.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.Keep the longest line possible from your knees through the top of your head. In particular, avoid bending too much at the waist and sticking your butt up in the air.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/607170572.hd.mp4?s=29bae5c45e18439cec2f8df8ac5d4d2a6a9d48ef&profile_id=175', 'https://i.vimeocdn.com/video/1243823453-ff5f2d36df3de4897dad432fe82c2eb5347cc17b8dc06e064b3ba159f6686a58-d_640', 'https://player.vimeo.com/external/613865802.hd.mp4?s=f23e7623046f9c936742b03055738fa8a1b7bd3c&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:38:01'),
(169, 'Push-Ups to Downward Facing Dog', 'Reps', 'POZEX169', 'push-ups-to-downward-facing-dog', NULL, NULL, '<ul><li>Begin this exercise slowly, taking as much time as you’d like each time you arrive in Downward Facing Dog (Adho Mukha Svanasana). As you get comfortable with the movement, you can increase the speed,but never sacrifice the quality of the movement or your breath for the sake of more speed.</li><li>To move back into Downward Facing Dog, push from the pads of your fingers, as well as the fingertips, while sinking your heels back and down into the ground.</li><li>In the Downward Facing Dog, try to bring your armpits as close to your knees as possible, allowing your tailbone to float upward while you do.</li><li>This exercise should feel good, enjoy it!</li></ul>', '<ul><li>Exhale throughout the push-up, and inhale as you push back into Downward Facing Dog.</li><li>Then exhale as you push deeper intoDownward Facing Dog, and finally inhale as you move forward back into position for the next push-up.</li></ul>', NULL, 'https://player.vimeo.com/external/612640437.hd.mp4?s=627a0abf97d5275f08823dce57b4497484f11daf&profile_id=175', 'https://i.vimeocdn.com/video/1250113054-bf72c20b180a5df253c4354fa0bdcde44ee292efd2c90b709dc359759c232089-d_640', 'https://player.vimeo.com/external/613865851.hd.mp4?s=ce8ddeb7db524bafcc97c26fff98d3cf4f057045&profile_id=175', NULL, 'chest,triceps,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:02'),
(170, 'Push-Ups to Parallel Side Plank', 'Reps', 'POZEX170', 'push-ups-to-parallel-side-plank', NULL, NULL, '<ul><li>As you transition from the push-up into the side plank, extend the top arm as soon as possible and really reach with your fingers. It might feel easier to first find your balance before extending the arm, but the more you reach with fingers of the top hand, the easier it will be to keep your balance.</li><li>During the push-up you should be looking down, not forward, to keep a long spine. During the side plank, you should be looking directly in front of you, not up or down.</li><li>Take your time in the side plank, really feeling the length through the spine and long reach from the palm of the bottom hand to the fingers of the top hand. Focus in particular on keeping a long line through the entire body while transitioning from the push-up to side plank and back.</li><li>During the push-up you should be looking down, not forward, to keep a long spine. During the side plank, you should be looking directly in front of you, not up or down.</li></ul>', '<ul><li>Exhale during the push-up. Inhale generously as you transition to the side plank. Then begin the next exhale as you begin to lower yourself back down for the next push-up.</li></ul>', NULL, 'https://player.vimeo.com/progressive_redirect/playback/673639211/rendition/1080p?loc=external&signature=e022ca7a7fee449e653894e562cb60f1758ae8705eec6238ae7d9108b2f14fa8', 'https://i.vimeocdn.com/video/1250113054-bf72c20b180a5df253c4354fa0bdcde44ee292efd2c90b709dc359759c232089-d_640', 'https://player.vimeo.com/external/613865972.hd.mp4?s=9d2135157aac805f689ef161016b36f63f1ccbab&profile_id=175', NULL, 'chest,triceps,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:02'),
(171, 'Push-Ups to Side Plank with Leg Lift', 'Reps', 'POZEX171', 'push-ups-to-side-plank-with-leg-lift', NULL, NULL, '<ul><li>I recommend you try Push-Ups to Parallel Side Plank before moving onto this more advanced variation.</li><li>In the beginning, feel free to first  lift your arm, and then lift your leg once you’ve found your balance with the top arm extended. As you get more comfortable, work toward lifting your arm and leg at the same time.</li><li>The more you reach through the fingers and toes, the easier it will be to find your balance and enjoy the expansion in every direction.</li><li>During the push-up you should be looking down, not forward, to keep a long spine. During the side plank, you should be looking directly in front of you, not up or down.</li></ul>', '<ul><li>Exhale during the push-up. Inhale generously as you transition to the side plank. Then begin the next exhale as you begin to lower yourself back down for the next push-up.</li></ul>', NULL, 'https://player.vimeo.com/external/612640772.hd.mp4?s=fa2c68b6d765199a1e9ec110acfae8e8b89419ac&profile_id=175', 'https://i.vimeocdn.com/video/1250114350-39f180d411d3fe7d1520dd84f246f41c39c65e703702d1fe310b79ce3244980a-d_640', 'https://player.vimeo.com/external/613866102.hd.mp4?s=9e07c65680c31b59d75a19c3097f23824ee66cab&profile_id=175', NULL, 'chest,triceps,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:38:03'),
(172, 'Push-Ups to Staggered Side Plank', 'Reps', 'POZEX172', 'push-ups-to-staggered-side-plank', NULL, NULL, '<ul><li>In the beginning, it can help to separate the three parts of this exercise: the push-up, the transition into the side plank, and the transition back to the push-up. As you become more comfortable, try to keep the momentum flowing, so that there is no break between the push-up and side plank on either the way up or down.</li><li>As you come down from the side plank, keep your fingers active as your hand makes contact with the ground. The goal is to keep the transition smooth and silent, never banging the hand on the ground.</li><li>Keep your core gently engaged throughout the entire movement to lengthen the spine, but don’t suck in the belly. Instead, think of lengthening the lower back.</li></ul>', '<ul><li>Exhale during the push-up (both down and up) and inhale as you transition from the push-up to the side plank, beginning the next exhale as you transition back down from the side plank into the next push-up.</li></ul>', NULL, 'https://player.vimeo.com/external/612641224.hd.mp4?s=cdd6e956ec538d66ec220cacda67285ab335bd2c&profile_id=175', 'https://i.vimeocdn.com/video/1250114710-494b58c41a3e340b3ea6faf514037a1460dfc54fa4a3023c7072bdcf10f37556-d_640', 'https://player.vimeo.com/external/613866377.hd.mp4?s=131d0aac617d49fc87dbd3462d814f42c37fc1b1&profile_id=175', NULL, 'chest,triceps,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:04');
INSERT INTO `exercises` (`id`, `title`, `based_on`, `code`, `slug`, `category_id`, `duration`, `instructions`, `breath`, `description`, `tip_video`, `tip_video_thumbnail`, `video_link`, `reps`, `focus_area`, `specific_muscles`, `good_for`, `type`, `Notes`, `level`, `image`, `tags`, `created_at`) VALUES
(173, 'Pushing Hands', 'Reps', 'POZEX173', 'pushing-hands', NULL, NULL, '<ul><li>Keep your chest open wide and your shoulders relaxed down away from your ears, especially as you exhale and push on each rep.</li><li>Focus on feeling the push equally spread between the fingertips, the pads at the base of your fingers, and on the palms.</li><li>This exercise can work your chest like crazy. But the only resistance is your own willingness to push as hard as you can. So shift into Beast Mode and feel that burn!</li></ul>', '<ul><li>Inhale generously while resting between reps. Exhale powerfully while pushing your hands together as hard as you can, using a controlled exhale to encourage core engagement and stillness through your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/632725133.hd.mp4?s=d1da79f00ab0b0c1eb827a7a02a4cc6a550ef08f&profile_id=175', 'https://i.vimeocdn.com/video/1275052448-7d3d16693723f0e6600b1208cbcbf57b2af98a67335c4aeb3_640', 'https://player.vimeo.com/external/620361026.hd.mp4?s=06be50552cfd971685ce1a10aabcbf7b6ddadf78&profile_id=175', NULL, 'chest,core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:04'),
(174, 'Pushing Hands with Lateral Shift', 'Reps', 'POZEX174', 'pushing-hands-with-lateral-shift', NULL, NULL, '<ul><li>To create the lateral shift of the hands, don’t think about moving the hands to one side. Instead, push as hard as you can with both hands, and then push even harder with one hand, while still resisting like crazy with the other.</li><li>As you push the hands to each side, keep your torso and pelvis facing straight forward.</li><li>For a powerful chest workout, be sure to push far enough that the elbow of the pushing hand moves all the way to the inside of that shoulder, as close as possible to the center of your chest.</li><li>Keep your chest open wide and your shoulders relaxed down away from your ears, especially as you exhale and push on each rep.</li><li>Focus on feeling the push equally spread between the fingertips, the pads at the base of your fingers, and on the palms.</li></ul>', '<ul><li>Inhale generously while resting between reps. Exhale powerfully while pushing your hands together as hard as you can, using a controlled exhale to encourage core engagement and stillness through your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/632725015.hd.mp4?s=cad4b211a30848d3f19c02d0774c9b1685c73b40&profile_id=175', 'https://i.vimeocdn.com/video/1275052221-8935945c57c5b8fdc74ad3d267ad200f41cb9a72fe58855b7_640', 'https://player.vimeo.com/external/620360997.hd.mp4?s=f334ec0aa8d3105843ca3b6a5a773294ed9e9b56&profile_id=175', NULL, 'chest,core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:05'),
(175, 'Rear Delt Plank', 'Reps', 'POZEX175', 'rear-delt-plank', NULL, NULL, '<ul><li>Do NOT lift your elbow! Instead, actively reach the elbow gently toward the ground the entire time, and focus the effort on the muscles of the back and the back of the shoulder. The more you try to reach that elbow down toward the ground while rotating upward, the harder the exercise will feel and the more benefit you’ll get!</li><li>In addition to rotating the body up away from the ground, you also want to push your forearm into the ground to lift your entire torso as high as possible.</li><li>Allow your gaze to move with your torso. At the top of the movement you should be looking straight out to the side, and at the bottom of the movement you should be looking in the opposite direction, at the wall behind your bottom arm.</li></ul>', '<ul><li>Inhale down. Exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600900723.hd.mp4?s=bd8954951d9a082f00b7bea51b69c7fbcce00620&profile_id=175', 'https://i.vimeocdn.com/video/1236797858-4bc77e849ce634f8beb1e18e6e97f66cb78d37b009eb7deef8650a2c99079886-d_640', 'https://player.vimeo.com/external/613866565.hd.mp4?s=27d3d2eebb2dd584097b7b421d05500b6afe3bbe&profile_id=175', NULL, 'core,back,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:06'),
(176, 'Reverse Crossover Lunge', 'Reps', 'POZEX176', 'reverse-crossover-lunge', NULL, NULL, '<ul><li>The main goal of the Crossover Lunge is to step back to the side, but to keep your torso and head facing straight forward.</li><li>Lower your back knee as close to the ground as possible without touching it on each rep.</li><li>Push powerfully back up to standing from the very bottom of the movement.</li><li>Keep your torso as vertical as possible throughout the movement. To achieve this, look forward, not down, and avoid leaning forward at any point.</li></ul>', '<ul><li>nhale down, exhale up.</li><li>You can also invert the breathing, inhaling on the way up, in order to feel how the inhalation can help expand the chest and torso at the top of the movement.</li></ul>', NULL, 'https://player.vimeo.com/external/640878229.hd.mp4?s=2233f1795fb92d2ec11b0e0bd4fc3756ff1b97ef&profile_id=175', 'https://i.vimeocdn.com/video/1289145185-4eee2a6ce1c599280da2099e5f89d6afe5f8fc10e05ee6da4_640', 'https://player.vimeo.com/external/620361268.hd.mp4?s=f80e1236ad7a072f5a90f7905e9d9263327532a2&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:07'),
(177, 'Reverse Crossover Lunge - Contralateral', 'Reps', 'POZEX177', 'reverse-crossover-lunge-contralateral', NULL, NULL, '<ul><li>The Reverse Contralateral Crossover Lunge is much easier to perform if you actually look at a point in front of you, as well as on each side. Really reach with your fingertips and look past them at a point to assist with balance.</li><li>Lower your back knee as close to the ground as possible without touching it on each rep.</li><li>Push powerfully back up to standing from the very bottom of the movement.</li><li>Keep your torso as vertical as possible throughout the movement. To achieve this, look forward, not down, and avoid leaning forward at any point.</li></ul>', '<ul><li>Inhale down, exhale up.</li><li>You can also invert your breathing, inhaling on the way up, in order to feel how the inhalation can help expand your chest and torso at the top of the movement.</li></ul>', NULL, 'https://player.vimeo.com/external/640878170.hd.mp4?s=046d213d32220a9da058d111e206771e250bee3f&profile_id=175', 'https://i.vimeocdn.com/video/1289145081-95b2c952a822bdad0b30cef6f773891b9d7352ca356f1c6d2_640', 'https://player.vimeo.com/external/620361064.hd.mp4?s=d757fe1060ddc9e72bd24b096552b94d1e701d4c&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:07'),
(178, 'Reverse Crossover Lunge with Contralateral Suspension', 'Reps', 'POZEX178', 'reverse-crossover-lunge-with-contralateral-suspension', NULL, NULL, '<ul><li>Be sure to master the Reverse Crossover Lunge - Contralateral before trying this more advanced variation.</li><li>Begin the swing of the leg from the very moment you push off the ground with the back foot.</li><li>Focus on creating a circular motion with the leg swinging around your body. The leg should feel almost like it bounces back from the front on each rep.</li><li>Reach with your fingertips and lengthen your arms as much as possible. The more you feel the weight of the arms, the more you’ll get a strong spiral through the spine and will more clearly feel how effortlessly the arms and leg can bounce back from the front.</li></ul>', '<ul><li>Exhale down, inhale up. At the top of the movement on each rep, feel how the inhalation helps you expand and lengthen your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/640878109.hd.mp4?s=74397f87916c5c0aa136e047a91f763ae2b78674&profile_id=175', 'https://i.vimeocdn.com/video/1289144963-6037ee0f3e3f1297f9ab21d1597f4628e03707f2a2160cf7c_640', 'https://player.vimeo.com/external/620361268.hd.mp4?s=f80e1236ad7a072f5a90f7905e9d9263327532a2&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:38:08'),
(179, 'Reverse Hindu Push-Ups', 'Reps', 'POZEX179', 'reverse-hindu-push-ups', NULL, NULL, '<ul><li>In the transition from Upward Facing Dog (chest open, arms straight) to Downward Facing Dog (tailbone high, body in “v” shape), push your body back, not up, and continue to push back even as you arrive into Downward Facing Dog, until your tailbone is as high as possible and the fronts of your armpits are as open as possible.</li><li>Feel free to explore different rhythms for this exercise. As you begin, it can help to really take your time in each position, even spending multiple breaths in each before moving to the next part of the exercise. As you get into the flow, you can reduce and then eliminate those pauses, keeping a constant movement throughout.</li><li>In Upward Facing Dog, look slightly up and feel your chest expanding forward and upward with your inhale.</li></ul>', '<ul><li>Inhale as you push forward into upward Facing Dog. Exhale as you push back into Downward Facing Dog.</li></ul>', NULL, 'https://player.vimeo.com/external/607171081.hd.mp4?s=636f8abbb1e84134bcceb9ea90970ead8a593012&profile_id=175', 'https://i.vimeocdn.com/video/1243824142-1ac17cb2626accb56fd4941b3d8c612e8b768063ffae5ddc874ffbeeccce9660-d_640', 'https://player.vimeo.com/external/599112658.hd.mp4?s=0ba6df627167d03ee302306afedbb54073f2b571&profile_id=175', NULL, 'chest,triceps,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:09'),
(180, 'Reverse Hindu Push-Ups with Undulation', 'Reps', 'POZEX180', 'reverse-hindu-push-ups-with-undulation', NULL, NULL, '<ul><li>While we need to choose a position to start from, this exercise truly has no real beginning or end. So you should feel as you get into a set that you’re in one continuous cycle of undulations, much like waves breaking in the ocean.</li><li>If you’re not already comfortable with normal Reverse Hindu Push-ups, make sure to try them first, as this is a more advanced variation of them.</li><li>Keep your belly and chest as close to the ground as possible as you swoop back and up into Downward Facing Dog. During this backward movement, keep the head relaxed down and allow the knees to bend and open toward the sides to make space for your torso to stay close to the ground.</li><li>The main focus of this exercise should be your breath. Connecting the breath to the undulation of the spine is what will help you find a powerful flow.</li></ul>', '<ul><li>Inhale as you push forward into upward Facing Dog. Exhale as you push back into Downward Facing Dog. Much like the wave analogy in the Tip above, your breath should also feel like waves breaking. Feel free to explore strong, audible breath, even playing with replicating the sound of waves building and crashing. This exercise takes a bit of practice to get down, but once you do, it should feel so good!</li></ul>', NULL, 'https://player.vimeo.com/external/607170729.hd.mp4?s=b4959e4640e3fbc55948548b035f6c81846ebfc8&profile_id=175', 'https://i.vimeocdn.com/video/1243823891-7bf7e99e1cb21734c949511ffa8f2ff09e85926f5bc9f4a4127f7af1efad1a25-d_640', 'https://player.vimeo.com/external/613866608.hd.mp4?s=d97b02428a11fa90830f03b09647fe72c9407ca5&profile_id=175', NULL, 'chest,triceps,shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:10'),
(181, 'Reverse Leg Lift to Plank Crunch', 'Reps', 'POZEX181', 'reverse-leg-lift-to-plank-crunch', NULL, NULL, '<ul><li>Think about reaching out and up with your toes, rather than trying to “lift your leg.” Reach as far as you can with your toes and avoid bending the knee or arching in the lower back.</li><li>Start slowly, separating the leg lift from the plank crunch. Then, as you get more comfortable, you can blend them together into one movement.</li><li>As you perform the crunch, push the middle of your back up as high as you can to make room for your leg. Then, move your knee and head toward each other at the same time.</li><li>Keep your weight over the pads of your second and third fingers, actively pushing through your fingertips to avoid having too much pressure on your wrists.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600896196.hd.mp4?s=e5dc06f15870ffd72c4295ef9192dea5426d535e&profile_id=175', 'https://i.vimeocdn.com/video/1236792565-87c24a90427214a6fab2ce8d05281b77ee360c63ef67920cd1f40b20f32bbdf5-d_640', 'https://player.vimeo.com/external/613866667.hd.mp4?s=27de40ece7681c9501001752fd5d21c82ca09ced&profile_id=175', NULL, 'core,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:10'),
(182, 'Reverse Plank (Purvottanasana)', 'Duration', 'POZEX182', 'reverse-plank-purvottanasana', NULL, NULL, '<ul><li>Roll your shoulders back while you open and lift your chest.</li><li>Keep your pelvis high and your core gently engaged to avoid over-arching the lower back.</li><li>You can keep your chin tucked gently toward your chest (as you see in the video above), or you can release it back completely.</li><li>Point your fingers toward your toes and push into the pads of your 2nd and 3rd fingers, as well as your fingertips.</li></ul>', '<ul><li>Breathe calmly and steadily, using each inhale to lengthen the spine.</li></ul>', NULL, 'https://player.vimeo.com/external/615789075.hd.mp4?s=4c4960eb6f354233d5c15c2d0d54dc2a03909479&profile_id=175', 'https://i.vimeocdn.com/video/1257730051-515078bd402d6ccaee0524695c4063f9ab258eaf53f31e65375dfa44fa790139-d_640', 'https://player.vimeo.com/external/613866693.hd.mp4?s=66ae662dd51f5505f4478424494b377481f71b72&profile_id=175', NULL, 'back,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:11'),
(183, 'Reverse Plank with Leg Extensions', 'Reps', 'POZEX183', 'reverse-plank-with-leg-extensions', NULL, NULL, '<ul><li>In order to lift and lengthen one leg, think about the toes reaching out and up away from your head, rather than just “lifting your leg.”</li><li>During the transition from one leg to the other, focus on keeping the hips high and still as you switch legs on each rep. Feel free to take your time switching legs as you learn this exercise, eventually decreasing the transition time as you gain mastery.</li><li>Roll your shoulders back while you open and lift your chest.</li><li>You can keep your chin tucked gently toward your chest (as you see in the video above), or you can release it back completely.</li></ul>', '<ul><li>Exhale gently as you lift your leg on each rep. Inhale as you lower the leg back down.</li></ul>', NULL, 'https://player.vimeo.com/external/615792560.hd.mp4?s=02fc984015fb010b9caf4f4368df5851985b46af&profile_id=175', 'https://i.vimeocdn.com/video/1257735751-cd90afd6a44ba6ee9b2588cd806f934a9f5bd0b9e23c9a5d2b5841aae184b979-d_640', 'https://player.vimeo.com/external/613866718.hd.mp4?s=87651f7f3a6a3ca28e345cc82b53c821eca43771&profile_id=175', NULL, 'back,glutes,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:12'),
(184, 'Reverse Tabletop', 'Duration', 'POZEX184', 'reverse-tabletop', NULL, NULL, '<ul><li>Place your hands on the ground with your fingers pointing forward and your arms shoulder-width apart. Then as you arrive at the top of the movement, roll your shoulders back, and open and lift your chest.</li><li>You can keep your chin tucked gently toward your chest (as you see in the video above), or you can release it back completely.</li><li>Push your pelvis up while directing the knees forward in order to keep the pelvis high. Try to keep a long, straight line through your torso and thighs.</li></ul>', '<ul><li>Breathe calmly and steadily, using each inhale to lengthen your spine.</li></ul>', NULL, 'https://player.vimeo.com/external/615790308.hd.mp4?s=52fd0390a23631fcf5cd6de1041793b6b8d2491a&profile_id=175', 'https://i.vimeocdn.com/video/1257731273-b107fce063cbb491d300d0394b086459ffc13b86182605d407a29bf9d20d41c6-d_640', 'https://player.vimeo.com/external/613866791.hd.mp4?s=a49a0afd57d6e41042696ff2de63309898d3a123&profile_id=175', NULL, 'back,glutes,core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:12'),
(185, 'Reverse Tabletop with Leg Extensions', 'Reps', 'POZEX185', 'reverse-tabletop-with-leg-extensions', NULL, NULL, '<ul><li>In order to lift and lengthen one leg, think about the toes reaching away from your head, rather than just “lifting your leg.”</li><li>Always keep both thighs at the same height, as if you were performing a Reverse Tabletop with both feet down. The only visible movement should be the lower leg and the foot lifting and lowering on each rep.</li><li>You can keep your chin tucked gently toward your chest (as you see in the video above), or you can release it back completely.</li><li>During the transition from one leg to the other, focus on keeping the hips high and still as you switch legs on each rep. Feel free to take your time switching legs as you learn this exercise, eventually decreasing the transition time as you gain mastery.</li></ul>', '<ul><li>Exhale gently as you lift the leg on each rep. Inhale as you lower the leg back down.</li></ul>', NULL, 'https://player.vimeo.com/external/615789811.hd.mp4?s=6e885ab221d20e9af1cff3aa4ce19950053e5ee5&profile_id=175', 'https://i.vimeocdn.com/video/1257730529-dc70a2c862c77c5d30ab3b23d8b46a11880b34a9e9c716fd16b2a15562d5251f-d_640', 'https://player.vimeo.com/external/613866758.hd.mp4?s=a2baade09bf9dbe976370f31008d8a86d514a739&profile_id=175', NULL, 'back,glutes,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:13'),
(186, 'Russian Twist', 'Duration', 'POZEX186', 'russian-twist', NULL, NULL, '<ul><li>To decrease the challenge, place your feet (or just the tips of your toes) on the ground in front of you. To increase the challenge, straighten your legs and reach your toes out in front of you.</li><li>Keep your chest open and your shoulders relaxed down away from your ears. Keeping your hands together will slightly close your chest, so be sure to breathe generously into the front of your torso to help stay open.</li><li>Follow your hands with your gaze, keeping your neck and jaw relaxed.</li></ul>', '<ul><li>Exhale as you twist to the side. Inhale as you move back through center.</li></ul>', NULL, 'https://player.vimeo.com/external/615700096.hd.mp4?s=4fbc57e179325ff67fbe5fa9e1cde53b1a360119&profile_id=175', 'https://i.vimeocdn.com/video/1257637402-1e70eb25b7220ae415351bf663b1104f9881cc6337fddc682c90651a09bf069f-d_640', 'https://player.vimeo.com/external/613866820.hd.mp4?s=0542de5a9c7b9b142d25a0a502bb32dd47d0976a&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:14'),
(187, 'Scapular Push-Ups', 'Reps', 'POZEX187', 'scapular-push-ups', NULL, NULL, '<ul><li>Keep your chest open and your shoulders relaxed down away from your ears.</li><li>As you descend, allow your spine to fall as far down between your shoulder blades as possible.</li><li>As you push back up, push the middle of your back as high as you can on each rep. At the top, stay an extra beat and try to push even higher as you exhale powerfully.</li></ul>', '<ul><li>Inhale down. Exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/649040432.hd.mp4?s=b72db7d571a5b8a0a0c2b92baf397d9f9a41fe30&profile_id=175', 'https://i.vimeocdn.com/video/1308017645-c7df4e6a53ec9fed0eb5dde5ce8f100dbf79c585704a20e23_640', 'https://player.vimeo.com/external/613867225.hd.mp4?s=06493414d648d61c5ecff1d59e5630e16563c8b1&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:15'),
(188, 'Scapular Push-Ups - 1 Arm ', 'Reps', 'POZEX188', 'scapular-push-ups-1-arm', NULL, NULL, '<ul><li>You should be comfortable performing regular Scapular Push-Ups before trying this more advanced variation.</li><li>You can place your free hand behind your back, or behind your head. Placing it behind your head will slightly increase the challenge.</li><li>Keep your chest perfectly parallel to the ground, as if you were performing regular scapular push-ups with both hands on the ground.</li><li>At the top of each rep, stay an extra beat and try to push even higher as you exhale powerfully.</li></ul>', '<ul><li>Inhale down. Exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604885466.hd.mp4?s=618bba5ec571c43529bd350c4791bd55bf363a79&profile_id=175', 'https://i.vimeocdn.com/video/1241294144-d4b38cd958adec095e78ebc44dbdc22f6be58aa7e0d99949f4fe4330f9cfe9cd-d_640', 'https://player.vimeo.com/external/624198868.hd.mp4?s=407e6ce7f5a785e5e29420c5803aee7b3e0f6e58&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise,warmup', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:16'),
(189, 'Scapular Push-Ups - 1 Arm on Knees', 'Reps', 'POZEX189', 'scapular-push-ups-1-arm-on-knees', NULL, NULL, '<ul><li>You should be comfortable performing regular Scapular Push-Ups on Knees before trying this more advanced variation.</li><li>Place a mat or towel under your knees for comfort.</li><li>You can place your free hand behind your back, or behind your head. Placing it behind your head will slightly increase the challenge.</li><li>Keep your chest perfectly parallel to the ground, as if you were performing regular scapular push-ups with both hands on the ground.</li><li>At the top of each rep, stay an extra beat and try to push even higher as you exhale powerfully.</li></ul>', '<ul><li>Inhale down. Exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604885329.hd.mp4?s=05740e6f539aca85c620a2c195465e1b324f1d83&profile_id=175', 'https://i.vimeocdn.com/video/1241293402-9078ded266c1ecb749bae231bf944dd40b470dfb2a518bddf96c4fd784a80213-d_640', 'https://player.vimeo.com/external/613866849.hd.mp4?s=7251427e9381bb4b84810c1f3c5f1274f5fc1192&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:17'),
(190, 'Scapular Push-Ups - Alternating 1 Leg', 'Reps', 'POZEX190', 'scapular-push-ups-alternating-1-leg', NULL, NULL, '<ul><li>Switch legs as quickly as possible at the bottom of each rep, working to keep the rest of your body as still as possible.</li><li>Rather than thinking about lifting your leg, think about reaching away with the toes to keep your leg lengthened and your knee straight.</li><li>Keep your chest open and your shoulders relaxed down away from your ears.</li><li>As you descend, allow your spine to fall as far down between your shoulder blades as possible.</li><li>As you push back up, push the middle of your back as high as you can on each rep. At the top, stay an extra beat and try to push even higher as you exhale powerfully.</li></ul>', '<ul><li>Inhale down. Exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604885848.hd.mp4?s=ae5ce93df6996c069184c1273679fa9cb56a117c&profile_id=175', 'https://i.vimeocdn.com/video/1241293823-d75b23035e0a2a3d497438cfd309582e8fccc4b92e82f7f80fc6bad3f7226a16-d_640', 'https://player.vimeo.com/external/613866902.hd.mp4?s=ab8db27b620297e7395a6a1c81034c803792514f&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise,warmup', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:17'),
(191, 'Scapular Push-Ups on Knees', 'Reps', 'POZEX191', 'scapular-push-ups-on-knees', NULL, NULL, '<ul><li>Place a mat or towel under your knees for comfort.</li><li>Keep your chest open and your shoulders relaxed down away from your ears.</li><li>As you descend, allow your spine to fall as far down between your shoulder blades as possible.</li><li>As you push back up, push the middle of your back as high as you can on each rep. At the top, stay an extra beat and try to push even higher as you exhale powerfully.</li></ul>', '<ul><li>Inhale down. Exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/607171424.hd.mp4?s=c92e61d6cd30dc140645cd8c0629d7c79134a0cc&profile_id=175', 'https://i.vimeocdn.com/video/1243824396-91e1dc091328325d992371bb95ba275716ad3792c6a965ad2ae809ac4915436c-d_640', 'https://player.vimeo.com/external/613867014.hd.mp4?s=ff8c2a28bc0f41b5c67a6e746fc1e3fbf116ec67&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:38:18'),
(192, 'Scissors', 'Duration', 'POZEX192', 'scissors', NULL, NULL, '<ul><li>Keep your kicks quick but strong, while keeping your torso as still as possible.</li><li>Rather than lacing your fingers behind your head, just touch them lightly to the sides of the back of your head. This will allow you to offer yourself the amount of support you need for your neck while keeping your chest open and your shoulders relaxed.</li><li>Only hold your legs as low as you can while keeping your lower back as close as possible to the ground.</li></ul>', '<ul><li>Use a strong controlled exhale to help engage the core as you first tuck the chin and lift your shoulders off the ground. Throughout the rest of the exercise, keep breathing continuously, using a light, controlled breath to avoid any unnecessary movement in the core.</li></ul>', NULL, 'https://player.vimeo.com/external/615700817.hd.mp4?s=de2699ea524f1a27eb7be0d0491ffa4f8a423fef&profile_id=175', 'https://i.vimeocdn.com/video/1257637711-a37ba963251cd9cf27a93c6d3fcc85b2b45a53270b2ef7f877234a10f3bd4796-d_640', 'https://player.vimeo.com/external/613867353.hd.mp4?s=d504a25d4bd85cac92892886a875bc2e5b6da5b6&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:19'),
(193, 'Scorpion Push Backs', 'Reps', 'POZEX193', 'scorpion-push-backs', NULL, NULL, '<ul><li>As you push yourself up and reach the leg around behind you, turn your head to really look at your foot. As you lower yourself back down, turn your head completely to look in the opposite direction.</li><li>Really reach back and around with your toes, as if you were trying to touch your opposite shoulder with them. To do this, allow one side of the pelvis to lift higher off the ground to allow a spiral through the entire spine and all the way through the leg to the tips of your toes.</li><li>From the bottom of the movement, think of pushing your tailbone up, not back.</li></ul>', '<ul><li>Inhale down. Exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/604885230.hd.mp4?s=375e9269aa8ba7517d69a6aab56b0693f4e71e44&profile_id=175', 'https://i.vimeocdn.com/video/1241304484-85e9bae34ab1dfd618c9853889143d874d3208129905bfbaac3f744adce4d570-d_640', 'https://player.vimeo.com/external/613867427.hd.mp4?s=ca813a3caa51ea7fca43099acdf0eeaca84c4906&profile_id=175', NULL, 'shoulders,triceps', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:38:20'),
(194, 'Scorpion Push-Ups', 'Reps', 'POZEX194', 'scorpion-push-ups', NULL, NULL, '<ul><li>As you lower yourself down and reach the leg around behind you, turn your head to really look at your foot. As you lower yourself back down, turn your head to look straight down.</li><li>Really reach back and around with your toes, as if you were trying to touch your opposite shoulder with them. To do this, allow one side of the pelvis to lift higher off the ground to allow a spiral through the entire spine and all the way through the leg to the tips of your toes.</li><li>You can perform these with your hands at any width. The wider you go, the more it will target the chest, and the narrower you go (especially if you keep your elbows tucked in), the more it will target your triceps.</li></ul>', '<ul><li>Inhale down. Exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/607171734.hd.mp4?s=8df8f225d67678aeab22a821925b0de468463542&profile_id=175', 'https://i.vimeocdn.com/video/1243824725-8de14d4b37ca20cb298bb7786eb51163abe5ab4f5de3837d455c4c4f20caaf37-d_640', 'https://player.vimeo.com/external/613867463.hd.mp4?s=b43e2648e663e20ce39d64dbf5a5767ab43f855a&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:21'),
(195, 'Shoulder Taps', 'Duration', 'POZEX195', 'shoulder-taps', NULL, NULL, '<ul><li>It’s totally normal for your body to move a bit side to side as you perform Shoulder Taps, but try to keep the movement to a minimum.</li><li>Focus on keeping a long spine and quick, light movement with the arms.</li><li>You can also slow this exercise down, holding your fingers against each shoulder for 2-3 seconds to move the focus from speed to more of an isometric contraction.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600900331.hd.mp4?s=6ecedd29ee8d1f0918fa39c60a88c102848fdce0&profile_id=175', 'https://i.vimeocdn.com/video/1236797340-e135ad49557b93d7ad2ad1775aa89a52c8ead2058ebba43e411e7bcab8d6a9c4-d_640', 'https://player.vimeo.com/external/627013547.hd.mp4?s=9f2dc50419ce6b548101d9dd902f4e7539ee0874&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:21'),
(196, 'Side Lunges - Alternating', 'Reps', 'POZEX196', 'side-lunges-alternating', NULL, NULL, '<ul><li>It’s fine for you to bend forward a bit at the waist as you descend, but do not allow your lower back to round and hunch forward.</li><li>You can perform Side Lunges with your hands in front of you, behind your head, or with your arms out to the sides. In all cases, the goal is to keep your chest wide and your shoulders relaxed down away from your ears.</li><li>Drive your tailbone down and back and then allow the knees to travel forward a bit as you descend, rather than moving your knees forward.</li></ul>', '<ul><li>Inhale down. Exhale up. Notice how the inhalation encourages the chest to expand and stay open on the way down.</li><li>You can also invert the breathing, exhaling down and inhaling up. This will help feel more verticality through the spine and expansion through the torso as you push back up to standing.</li></ul>', NULL, 'https://player.vimeo.com/external/640877600.hd.mp4?s=0adc5de14bed995263e5d446ac8a06a08acf8776&profile_id=175', 'https://i.vimeocdn.com/video/1289144049-d105200d09289aab2174afb484d8c944bc605f93b2c669ae6_640', 'https://player.vimeo.com/external/620361402.hd.mp4?s=ab521b21e0dc059bd47bc09e67a598a621aeccd3&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:22'),
(197, 'Side Lunges - Suspended ', 'Reps', 'POZEX197', 'side-lunges-suspended', NULL, NULL, '<ul><li>As you push back up to center on each rep, articulate through the foot and push as much as possible with the toes as your foot leaves the ground.</li><li>Then keep reaching with the toes so you can also articulate on the way back down to cushion the landing.</li><li>As you suspend, reach up through the very top of your head, to keep your spine as long as possible.</li><li>Keep your chest open and your shoulders relaxed down away from your ears.</li></ul>', '<ul><li>Exhale down. Inhale up. Use the inhalation to lengthen through the spine and feel your torso expand.</li></ul>', NULL, 'https://player.vimeo.com/external/640878355.hd.mp4?s=314d3125a1e6c2fd4db5ef99e86823846078aa7d&profile_id=175', 'https://i.vimeocdn.com/video/1289145396-02787e2a4edf5a9d704fa1374b3353bd4fba4e536d50da6d1_640', 'https://player.vimeo.com/external/620361458.hd.mp4?s=5b2391506742838d4ea3b0a44bd173bb3abdf497&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise,warmup', NULL, 'Intermediate', NULL, NULL, '2022-12-02 09:38:23'),
(198, 'Side Plank Hip Dips', 'Reps', 'POZEX198', 'side-plank-hip-dips', NULL, NULL, '<ul><li>Allow your head to move with your spine. You should be looking straight out in front of you, but your head should tilt as you move up and down.</li><li>As you release your torso down, think about expanding the side of your ribs, rather than allowing the pelvis to just drop down. Think about trying to touch your supporting arm with the side of your torso to stretch those muscles before contracting them to lift yourself back up.</li><li>As you move down, reach toward your waist with your top elbow. As you push yourself back up, contract strongly through the bottom side of the torso and reach your elbow up and away from your feet.</li></ul>', '<ul><li>Inhale down. Exhale up.</li><li>Use a strong, controlled exhale to assist in powerfully contracting the obliques, the core muscles on the side of your ribs and waist.</li></ul>', NULL, 'https://player.vimeo.com/external/600901619.hd.mp4?s=4707529a342204c5e91ef8c0dc56cb2046babc36&profile_id=175', 'https://i.vimeocdn.com/video/1236799042-5accf334d41141cddba531061fc625e153f1f861bee17b9d1db716a3b8af8527-d_640', 'https://player.vimeo.com/external/624199301.hd.mp4?s=b5be77af57ec63b1e02f3c254c5a9605dc036257&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:23'),
(199, 'Side Plank with Leg Lift', 'Duration', 'POZEX199', 'side-plank-with-leg-lift', NULL, NULL, '<ul><li>In the beginning, feel free to first  lift your arm and find your balance before lifting your leg. As you get more comfortable, work to get into the full position as quickly as possible to increase the balance challenge.</li><li>The more you reach through the fingers and toes, the easier it will be to find your balance and enjoy the expansion in every direction.</li><li>Push actively through the fingertips and the pads of the 2nd and 3rd fingers.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600901863.hd.mp4?s=9696ceecbcca4319a29e4a990e63544d6b80410d&profile_id=175', 'https://i.vimeocdn.com/video/1236799230-b13845565d9c4d73bca91292d56e4dd0c36e9598cf522f1635b688f706fcbde3-d_640', 'https://player.vimeo.com/external/620367173.hd.mp4?s=796dd94650bc12b736b92ec910bf506eedf4e465&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:24'),
(200, 'Side Step Lunges - Alternating', 'Reps', 'POZEX200', 'side-step-lunges-alternating', NULL, NULL, '<ul><li>It’s fine for you to bend forward a bit at the waist as you descend, but do not allow your lower back to round and hunch forward.</li><li>On each rep, push powerfully back up to standing from the very bottom of the movement.</li><li>As you step out to the side, extend your toes (even if you’re wearing shoes) and articulate through the foot to cushion your landing.</li><li>Drive your tailbone down and back and then allow the knees to travel forward a bit as you descend, rather than moving your knees forward.</li></ul>', '<ul><li>Inhale down. Exhale up. Notice how the inhalation encourages the chest to expand and stay open on the way down.</li><li>You can also invert the breathing, exhaling down and inhaling up. This will help feel more verticality through the spine and expansion through the torso as you push back up to standing.</li></ul>', NULL, 'https://player.vimeo.com/external/640877647.hd.mp4?s=e698d151b0d8cd06785cb187e362bad431b88032&profile_id=175', 'https://i.vimeocdn.com/video/1289144074-1af7cd8d8be47c9137bc2140a509e138328549c4bae2a250d_640', 'https://player.vimeo.com/external/620361600.hd.mp4?s=50c4d3cb5020a9cdf0eacb52a17328d937b74634&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:25'),
(201, 'Skater Jumps', 'Reps', 'POZEX201', 'skater-jumps', NULL, NULL, '<ul><li>Perform Skater Jumps as a continuous flow, with the bending of your knee acting both as the cushioning of the landing and the preparation for the next jump.</li><li>Reach with your fingers! The more you reach, the better balance you’ll have.</li><li>Focus on feeling how the swing of the arms actually helps you get more momentum on each jump. It should feel like your arms are carrying you through space, rather than you carrying them.</li><li>Try to get as deep as possible on each side before jumping again. This is crucial for strength, flexibility, and athleticism. Hint: You can probably go lower than you think!</li></ul>', '<ul><li>Inhale as you jump and use a light, controlled exhale as you land on each side.</li></ul>', NULL, 'https://player.vimeo.com/external/632729610.hd.mp4?s=716daf84b47c1ba84433c29efc57fd66b92c653f&profile_id=175', 'https://i.vimeocdn.com/video/1275057654-80af37dc15f20fa12d71f22d63f27a8cd600429507fce549f_640', 'https://player.vimeo.com/external/624200916.hd.mp4?s=6799f16fc1540ce048f76252bbee04fee3163deb&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:26'),
(202, 'Skater Jumps with Balance', 'Reps', 'POZEX202', 'skater-jumps-with-balance', NULL, NULL, '<ul><li>On each side, use the bending of the knee to slow yourself down and then keep lowering yourself as low as you can get with perfect form. Do not land first and then bend the knee.</li><li>While you don’t need to stay multiple seconds on each side, you do want to have a true balance. So on every rep you should be able to hold in balance as long as you like before jumping to the other side again.</li><li>Drive your tailbone down and back while keeping your chest and head facing forward and up.</li><li>Reach with your fingers! The more you reach, the better balance you’ll have.</li><li>Focus on feeling how the swing of the arms actually helps you get more momentum on each jump. It should feel like your arms are carrying you through space, rather than you carrying them.</li></ul>', '<ul><li>Inhale as you jump and use a strong, controlled exhale as you land on each side.</li></ul>', NULL, 'https://player.vimeo.com/external/632725634.hd.mp4?s=1fa1065fd068b96bb56421a8ecc0fdad272e8b36&profile_id=175', 'https://i.vimeocdn.com/video/1275053907-a7a99b11c4974897b46614e8477a599e60c2ed9f2f527be7a_640', 'https://player.vimeo.com/external/624200416.hd.mp4?s=fb39ddfe81633c418688c59bf670944b41f60c8e&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:26'),
(203, 'Skater Jumps with Balance and Toe Tap', 'Reps', 'POZEX203', 'skater-jumps-with-balance-and-toe-tap', NULL, NULL, '<ul><li>Depending on your flexibility, you may not be able to actually touch your toe and that’s fine. But be sure to get as deep as you can and really reach down on every rep.</li><li>The balance is a crucial part of this exercise. Don’t just touch your toes while falling toward center. Instead, take your time to reach slowly down, seeing how low you can get and how calmly you can keep your balance.</li><li>Drive your tailbone down and back while keeping your chest and head facing forward and up.</li><li>Focus on feeling how the swing of the arms actually helps you get more momentum on each jump. It should feel like your arms are carrying you through space, rather than you carrying them.</li><li>You will have to bend forward at the waist to reach toward your toes. But never reach further than you can while keeping a long line through the lower back.</li></ul>', '<ul><li>Inhale as you jump and use a strong, controlled exhale as you land on each side.</li></ul>', NULL, 'https://player.vimeo.com/external/632725242.hd.mp4?s=f9fe4ee1ee3c22de870e6166bc698c4d36f1de68&profile_id=175', 'https://i.vimeocdn.com/video/1275053150-3a030e04c408c6fab36248ed2c73fef3856541c8ef2a502cc_640', 'https://player.vimeo.com/external/624199746.hd.mp4?s=734016f59c25512841901c05ecfca59f37f05324&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:27'),
(204, 'Skater Jumps with Safety Touch', 'Reps', 'POZEX204', 'skater-jumps-with-safety-touch', NULL, NULL, '<ul><li>This is a great exercise to work toward full Skater Jumps! In the beginning, feel free to place weight on that back foot as it touches down behind you. Then, as you get more comfortable with the balance, place less and less weight on it until you can keep it in the air the entire time on each rep.</li><li>Reach with your fingers! The more you reach, the better balance you’ll have.</li><li>Focus on feeling how the swing of the arms actually helps you get more momentum on each jump. It should feel like your arms are carrying you through space, rather than you carrying them.</li><li>Try to get as deep as possible on each side before jumping again. This is crucial for strength, flexibility, and athleticism. Hint: You can probably go lower than you think!</li></ul>', '<ul><li>Inhale as you jump and use a light, controlled exhale as you land on each side.</li></ul>', NULL, 'https://player.vimeo.com/external/632726677.hd.mp4?s=c518e37fa3ba2881bb3ee2ac990108f1d3ce6f30&profile_id=175', 'https://i.vimeocdn.com/video/1275055174-0fca5ff6b43ae2b27157473c4c82ab11378c3dbd48caa9f69_640', 'https://player.vimeo.com/external/624200544.hd.mp4?s=1a3532f7de2a88cb6d7f899953fbe235554ab7d2&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:38:28'),
(205, 'Skater Jumps with Toe Tap', 'Reps', 'POZEX205', 'skater-jumps-with-toe-tap', NULL, NULL, '<ul><li>Depending on your flexibility, you may not be able to actually touch your toe and that’s fine. But be sure to get as deep as you can and really reach down on every rep.</li><li>Perform this exercise as a continuous flow, with the bending of your knee on each side acting both as the cushioning of the landing and the preparation for the next jump.</li><li>Reach with your fingers! The more you reach, the better balance you’ll have.</li><li>You will have to bend forward at the waist to reach toward your toes. But never reach further than you can while keeping a long line through the lower back.</li></ul>', '<ul><li>Inhale as you jump and use a light, controlled exhale as you land on each side.</li></ul>', NULL, 'https://player.vimeo.com/external/632728015.hd.mp4?s=ebb610d4ce413c98fd05b8ee08395c48a94ac993&profile_id=175', 'https://i.vimeocdn.com/video/1275056231-5233b3885559ba75275751452e2a3b5617817ffcf2389bf18_640', 'https://player.vimeo.com/external/624200691.hd.mp4?s=7c6b9b2322296bf0a9d1bdcd6e4ca881ea11d64b&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:28'),
(206, 'Skater Jumps with Triple Toe Tap', 'Reps', 'POZEX206', 'skater-jumps-with-triple-toe-tap', NULL, NULL, '<ul><li>Be sure to master Skater Jumps with Toe Tap before working on this more advanced variation.</li><li>Depending on your flexibility, you may not be able to actually touch your toe and that’s fine. But be sure to get as deep as you can and really reach down on every rep.</li><li>You will have to bend forward at the waist to reach toward your toes. But never reach further than you can while keeping a long line through the lower back.</li><li>Keep your arms at a 90 degree angle on each tap, meaning when one arm is reaching down, the other should be reaching straight out to the side.</li></ul>', '<ul><li>Inhale as you jump and use a light, controlled exhale as you land on each side.</li></ul>', NULL, 'https://player.vimeo.com/external/632729301.hd.mp4?s=8ec36950cded8d082237864f8b116f3342b40b5c&profile_id=175', 'https://i.vimeocdn.com/video/1275057093-87dd83bf5bbf3fd3ba2e245397fa098c6c69c67db5382836c_640', 'https://player.vimeo.com/external/624200819.hd.mp4?s=1db5f3520e851236490c864a6c345f75f641e6e6&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:38:29'),
(207, 'Slalom Jumps', 'Duration', 'POZEX207', 'slalom-jumps', NULL, NULL, '<ul><li>Keep your toes pointing forward and your feet spaced apart the same distance throughout.</li><li>Keep your torso in the middle and jump your legs quickly and lightly to the sides, rather than allowing your whole body to move side to side.</li><li>As someone who grew up skiing, I find it fun to pretend I’m holding ski poles and actually slalom skiing. But you’re welcome to perform Slalom Jumps with your hands behind your head, arms extended out to the sides, or on your hips.</li></ul>', '<ul><li>Maintain a light, quiet breath throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/628409608.hd.mp4?s=e8d86b1bd84eec25afc4c03c8d91d1a13496b238&profile_id=175', 'https://i.vimeocdn.com/video/1270697002-0d4090a35c32cd8769831e492ef22b3015d4e2926a3650665_640', 'https://player.vimeo.com/external/620361835.hd.mp4?s=f56b17df4cd16feff8ee7a0a3b5043c7d452ae39&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:30'),
(208, 'Slalom Jumps - 1 Leg', 'Duration', 'POZEX208', 'slalom-jumps-1-leg', NULL, NULL, '<ul><li>The side to side movement will not be as wide compared to the 2-leg version, and that’s fine. Focus on keeping your jumps quick and light, and landing silently on every jump.</li><li>Keep your torso in the middle and jump your leg quickly and lightly to the sides, rather than allowing your whole body to move side to side.</li><li>Think about lengthening up through the spine throughout, keeping your chest open and your shoulders relaxed down away from your ears.</li></ul>', '<ul><li>Maintain a light, quiet breath throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/628407876.hd.mp4?s=a3a2ab689d241f5035b5bc153c8351d6f96b6bbf&profile_id=175', 'https://i.vimeocdn.com/video/1270694407-c40e199452ab011b9c9ba19883826322358fbfe0ab6605e91_640', 'https://player.vimeo.com/external/620361811.hd.mp4?s=343073da0d2f53b822b0d4fe6e768e3ad98bc7da&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:31'),
(209, 'Slow Eccentric Push-Ups', 'Reps', 'POZEX209', 'slow-eccentric-push-ups', NULL, NULL, '<ul><li>Take between 5 and 10 seconds for each descent, choosing a duration and repeating it for each rep within a set.</li><li>Gently engage your core to lengthen the spine, trying to keep the longest line possible from your heels to the top of your head.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li><li>To make this exercise easier, perform it with your knees on the ground.</li></ul>', '<ul><li>Use a steady, gentle breath throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/612637754.hd.mp4?s=54c6dfc5d4c656c086ccfc1ac8360f5c50ad4aff&profile_id=175', 'https://i.vimeocdn.com/video/1250118643-6c276f8b0ea65490ac337b0bd826b51da4c835a9d9c8bf13af2db3bda3042d18-d_640', 'https://player.vimeo.com/external/613867484.hd.mp4?s=4ee03d82c8827aea3849fda7e8fc4d33869ba6aa&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:31'),
(210, 'Slow Push-Ups', 'Reps', 'POZEX210', 'slow-push-ups', NULL, NULL, '<ul><li>Take between 5 and 10 seconds for each part of the push-up (down and up), choosing a duration and repeating it for each rep within a set. For an additional challenge, add a hold of the same duration at the bottom of each rep, keeping your torso and pelvis just off the ground.</li><li>Keep your jaw and neck as relaxed as possible.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li><li>To make this exercise easier, perform it with your knees on the ground.</li></ul>', '<ul><li>Use a steady, gentle breath throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/612638330.hd.mp4?s=ba6031870d3c96e7ff8438cf7013cbe77c3df82a&profile_id=175', 'https://i.vimeocdn.com/video/1250111698-c3f6b44d5aefcecf87aedfa8c3981936ec98e2d245e22701a7a4c31390615040-d_640', 'https://player.vimeo.com/external/613867516.hd.mp4?s=c05053315407f638f7ca90e3a8da1d8d5ef62511&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:32');
INSERT INTO `exercises` (`id`, `title`, `based_on`, `code`, `slug`, `category_id`, `duration`, `instructions`, `breath`, `description`, `tip_video`, `tip_video_thumbnail`, `video_link`, `reps`, `focus_area`, `specific_muscles`, `good_for`, `type`, `Notes`, `level`, `image`, `tags`, `created_at`) VALUES
(211, 'Snow Angels', 'Reps', 'POZEX211', 'snow-angels', NULL, NULL, '<ul><li>Keep your arms and hands as high off the ground as possible the entire time. The more you fight to resist gravity, the stronger you’ll get!</li><li>Reach with your fingers and feel how that reaching can guide the movement of the arms.</li><li>Lift your chest and shoulders as high as possible off the ground, but keep your head and neck in line with your spine. To do this, look down and just slightly forward, rather than out in front of you.</li></ul>', '<ul><li>Use a steady, gentle breath throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/600558591.hd.mp4?s=087ed57f96478784721c8ef7bfdc3efac0462569&profile_id=175', 'https://i.vimeocdn.com/video/1236390361-6470c9b5b8c957fa7955ff22832cd642b73196b954ff07d9ba6f24f3de9bdc55-d_295x166', 'https://player.vimeo.com/external/613867549.hd.mp4?s=808fca988558bf3e04f49dca139a9ee2fce8e5ca&profile_id=175', NULL, 'back,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:33'),
(212, 'Snow Angels - Bent Over', 'Reps', 'POZEX212', 'snow-angels-bent-over', NULL, NULL, '<ul><li>Keep your arms and hands as high off the ground as possible the entire time. The more you fight to resist gravity, the stronger you’ll get!</li><li>Reach with your fingers and feel how that reaching can guide the movement of the arms.</li><li>You can perform this with straight or slightly bent knees. Only bend over as far as you can while keeping a long line in your lower back and your chest open.</li><li>Look down and slightly forward (not straight ahead of you) to keep a long line through the back or your neck.</li></ul>', '<ul><li>Use a steady, gentle breath throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/628411263.hd.mp4?s=baa31ed28df67dde33775ad947517b73d6c18f7e&profile_id=175', 'https://i.vimeocdn.com/video/1270698375-77b8419163f407b182f017a9802a57eb5633509627cd7c3d2_640', 'https://player.vimeo.com/external/620361853.hd.mp4?s=f7c94186cc8803302d662a9c0906f8d19031c3eb&profile_id=175', NULL, 'back,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:33'),
(213, 'Speed Push-Ups', 'Reps', 'POZEX213', 'speed-push-ups', NULL, NULL, '<ul><li>Try to go the same depth on every single rep. A simple trick to achieve this is to place a roll of toilet paper or similar size (and soft!) object on the ground under your chest. Then you lower yourself until you feel it tap your chest and push yourself back up.</li><li>Write down your reps. Tracking your progress over time on speed push-ups is a truly powerful motivator!</li><li>You can perform these in any push-up position: standard, wide, narrow, incline, decline, etc. Have fun!</li></ul>', '<ul><li>Keep breathing throughout. I recommend multiple push-ups per breath, as breathing too quickly will tire you out and can lead to hyperventilation.</li></ul>', NULL, 'https://player.vimeo.com/external/612638530.hd.mp4?s=a52290bab31334922f82e437b0c2ad6558b45cc9&profile_id=175', 'https://i.vimeocdn.com/video/1250118776-cd98aaeac34368dd89bb7e1e1a4f5ce744b44439874864c877f9ed5d9348cbef-d_640', 'https://player.vimeo.com/external/613867582.hd.mp4?s=c0b41475d0dd056d676aec80b7df1c6279533794&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:34'),
(214, 'Sphynx Push-Ups', 'Reps', 'POZEX214', 'sphynx-push-ups', NULL, NULL, '<ul><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li><li>Place a mat or towel under your elbows for comfort if desired.</li><li>To decrease the challenge, move your hands forward further from your head. To increase the challenge, move them closer.</li><li>To make this exercise easier, perform it with your knees on the ground.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/612638724.hd.mp4?s=4a988d4c14ad993a0b533182a9823cfb37e6e42a&profile_id=175', 'https://i.vimeocdn.com/video/1250111886-22fea25a4e68a611dacda3a7efd5e6238ba468d91ba195990b4a65083cfb43b8-d_640', 'https://player.vimeo.com/external/613867620.hd.mp4?s=b749400592342b885c7e1bb6cb73381a6a43bf1c&profile_id=175', NULL, 'triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:35'),
(215, 'Squat Jacks', 'Reps', 'POZEX215', 'squat-jacks', NULL, NULL, '<ul><li>Try to keep your body low to the ground while moving the legs dynamically. Your upper body will have to move up and down a bit no matter what, but the less it does, the better your workout will be.</li><li>Land lightly and quietly on your feet on each rep.</li><li>Keep your chest open and your shoulders relaxed down away from your ears.</li></ul>', '<ul><li>Use a steady, gentle breath throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/600956207.hd.mp4?s=7a4dbc651153d14f60f8ded70175b7deed3f77c0&profile_id=175', 'https://i.vimeocdn.com/video/1236867849-819a5e911cba8c696c31a0b4c4a88bdd85510f278bceadb95343f1f542f3511e-d_640', 'https://player.vimeo.com/external/622093807.hd.mp4?s=39eeef011c8aed03c1317d3f9a07dfd29731e63a&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:36'),
(216, 'Squat Pulses', 'Reps', 'POZEX216', 'squat-pulses', NULL, NULL, '<ul><li>Perform Squat Pulses at the very bottom of your squat. You should be as low as you can get while keeping your chest open, with no hunching in the lower back.</li><li>The pulses should be small, light movements. You can think about pushing up just a few inches and releasing, or you can do the opposite, actually focusing on pushing your body down and then feeling how the elasticity of your muscles will naturally bounce you back up.</li><li>The width of your stance and the angle of your feet should allow you to keep your chest open and facing forward (not down) and your knees over your feet while descending.</li></ul>', '<ul><li>Use a steady, gentle breath throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/600956450.hd.mp4?s=744befc5a036775709444d75ba0eb285c37edc9e&profile_id=175', 'https://i.vimeocdn.com/video/1236867162-602dbf863e094e721263b906bd933cf78ee7d61aa0aecbfb3b49ba606a664647-d_640', 'https://player.vimeo.com/external/567718951.hd.mp4?s=8ec667b3c31d570ea1be9d49b1daa9e46e309ef5&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:37'),
(217, 'Squat to Good Morning', 'Reps', 'POZEX217', 'squat-to-good-morning', NULL, NULL, '<ul><li>This exercise consists of four distinct movements: Descending into the squat, scooping back into the good morning, dropping back to the bottom of your squat, and then pushing back up to standing. Be sure to separate these four steps on each and every rep, and in particular, avoid moving into the good morning position before getting to the very bottom of your squat.</li><li>The good morning can be performed with legs straight or slightly bent, depending on your flexibility.</li><li>The width of your stance and the angle of your feet during the squat should allow you to keep your chest open and facing forward (not down) and your knees over your feet while descending.</li></ul>', '<ul><li>One rep consists of two full breaths, but can be performed starting with an exhale or inhale. For example, you can inhale down into the squat, exhale as you transition to the good morning, inhale again as you move back to the bottom of the squat, and then exhale back to standing. You can also invert all of those, beginning with an exhale as you descend. There are advantages to both approaches, so I recommend trying both.</li></ul>', NULL, 'https://player.vimeo.com/external/600956728.hd.mp4?s=8b84a8ddda42425bb503cbb8b48e955d10e12d75&profile_id=175', 'https://i.vimeocdn.com/video/1236867669-b6269e88e0811d8e7fb31d71f12d7ad623770133c47b98846266c5b64c088b89-d_640', 'https://player.vimeo.com/external/622093038.hd.mp4?s=315ac5395162120671222649cd408816222ac104&profile_id=175', NULL, 'legs,glutes,back', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:37'),
(218, 'Squats', 'Reps', 'POZEX218', 'squats', NULL, NULL, '<ul><li>You can allow your knees to move forward a bit past your toes, but the main focus of your movement should always be driving the tailbone down and back during the descent while keeping a gentle curve or a long line (but never a hunch) in the lower back.</li><li>The width of your stance and the angle of your feet should allow you to keep your chest open and facing forward (not down) and your knees over your feet while descending.</li><li>Allow your head to float upward as your drive your tailbone back and down, allowing your knees to bend.</li><li>Go as deep into the movement as possible keeping your chest facing forward without any hunching in your lower back.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600958303.hd.mp4?s=3991b2f84ea1ae4fae6b7ff28f2d7c6a08ba7130&profile_id=175', 'https://i.vimeocdn.com/video/1236869649-1d1679ce52b6f3126ccb3fc0468068929e98a4a26ed3f8a73fb9bf7af43f99d7-d_640', 'https://player.vimeo.com/external/567718895.hd.mp4?s=42fd7cf1973d83a7a711352c780bd47e251687cf&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:38'),
(219, 'Squats with Rotational Reach', 'Reps', 'POZEX219', 'squats-with-rotational-reach', NULL, NULL, '<ul><li>Use your gaze to lead the movement, looking where your hand is reaching. Especially at the top of the movement, be sure to really look up and to the side, rather than just moving your head.</li><li>Similarly, be sure to reach as far as you can with your fingers.</li><li>It is ok for your knees to rotate slightly with the movement. Just be sure to always keep the ball of your little toe of each foot on the ground the entire time to avoid the knee dropping excessively inward.</li></ul>', '<ul><li>Inhale down. Exhale up.</li><li>Use a generous inhalation to encourage the expansion of the chest and rotation through the spine.</li></ul>', NULL, 'https://player.vimeo.com/external/600956037.hd.mp4?s=206c8766d59bf819c0fd4c09bf1a7bf92bf9b3a2&profile_id=175', 'https://i.vimeocdn.com/video/1236867253-6bd0dae24ccc9e887538f2a115aedeb635397141cd71cdf5855ce3865d50035b-d_640', 'https://player.vimeo.com/external/622093866.hd.mp4?s=f2dd76c3068a1697883e5f8a2109390e72a32459&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:39'),
(220, 'Squeeze Ups ', 'Reps', 'POZEX220', 'squeeze-ups', NULL, NULL, '<ul><li>Watching squeeze ups, they look just like standard push-ups. But they should feel completely different! At the bottom of each rep, instead of pushing, squeeze your hands together absolutely as hard as you can, allowing the squeeze to initiate the upward movement of the body.</li><li>Keep your hands flat on the ground and push powerfully through the fingertips and pads of the second and third fingers.</li><li>Take your time! If you rush, you’ll most likely engage more pushing than is ideal. Instead, focus on the squeeze, and allow your body to move up at a slow, steady pace.</li><li>To make this exercise easier, perform it with your knees on the ground.</li></ul>', '<ul><li>Inhale down. Then use a slow, powerful exhale on the way up.</li></ul>', NULL, 'https://player.vimeo.com/external/612638997.hd.mp4?s=72bc648cace789affabc60de56e6616836bc1f99&profile_id=175', 'https://i.vimeocdn.com/video/1250111877-7534ee4547be237dac56fe7e91cfffae1cf93903f3cb7100ce03bf837b87c0f8-d_640', 'https://player.vimeo.com/external/613867727.hd.mp4?s=e40e5a79197da9725a98617e0372fa14c9e12099&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:39'),
(221, 'Staggered Push-Ups', 'Reps', 'POZEX221', 'staggered-push-ups', NULL, NULL, '<ul><li>Turn the fingers of the front hand slightly in to avoid strain in the shoulder.</li><li>Keep the elbow of the back arm tucked tightly against the side of your body to help with stability and focus more effort on the triceps.</li><li>To increase the challenge, move the front hand further forward. To decrease the challenge, move it back closer to your body.</li></ul>', '<ul><li>Inhale down. Exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/612639304.hd.mp4?s=40302b67982e6a99574fb0be5a36fefe70ef056c&profile_id=175', 'https://i.vimeocdn.com/video/1250114875-8c1774057a3e423ef608c1112ee34a962765ad725f7ecac7a499d3918ea2d9a1-d_640', 'https://player.vimeo.com/external/599112465.hd.mp4?s=3ff6c5dd2b574e1b50b228040dfc3820a228c18d&profile_id=175', NULL, 'chest,triceps,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:40'),
(222, 'Standing Hip Extension', 'Reps', 'POZEX222', 'standing-hip-extension', NULL, NULL, '<ul><li>Keep a long spine, with your head and chest facing forward. It’s normal to have a small curve in the lower back, but the upper back should be vertical.</li><li>Reach out and back with your toes, keeping your leg straight throughout.</li><li>Keep your chest open and your shoulders relaxed down away from your ears.</li></ul>', '<ul><li>Exhale on each kick upward. Inhale as the leg descends before the next kick.</li></ul>', NULL, 'https://player.vimeo.com/external/628413000.hd.mp4?s=33bb164d69b61d9b0fe95d4a4bf6d8ffeae7068b&profile_id=175', 'https://i.vimeocdn.com/video/1270700367-68ea0180d257ffc247b6720e754c491c6e1d9350997400b96_640', 'https://player.vimeo.com/external/620361882.hd.mp4?s=df911ea9ec4c1b5da19b590d32b454cd21ce62d3&profile_id=175', NULL, 'glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:38:41'),
(223, 'Standing Torso Twist', 'Reps', 'POZEX223', 'standing-torso-twist', NULL, NULL, '<ul><li>Touch your fingers gently to the back of your head, with ample space between your fingers. Do not lace your fingers together, as this will pull the head forward unnecessarily.</li><li>Try to twist further than you think you can on each and every rep, using the exhale to try to squeeze out a few extra millimeters on each side.</li><li>Keep your pelvis facing straight forward. To achieve this, it may help to even think about twisting it a bit in the opposite direction as your upper body.</li><li>Film yourself the first time you try this, to ensure you’re not letting your hips rotate without realizing it.</li></ul>', '<ul><li>Exhale as you twist to each side. Inhale back to center.</li><li>Use a strong, generous exhale to encourage a powerful rotation on each rep.</li></ul>', NULL, 'https://player.vimeo.com/external/628415018.hd.mp4?s=79c57b210bfd935b932efbf33b1201c6321e881f&profile_id=175', 'https://i.vimeocdn.com/video/1270701858-86de6a6e1d9d367ca7ed497d5ac6fe8334c8087e179ef2816_640', 'https://player.vimeo.com/external/567718520.hd.mp4?s=091183d205cf2440b68172520c00bc9aa0c0eeb9&profile_id=175', NULL, 'back,core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:42'),
(224, 'Sumo Squat Pulses', 'Reps', 'POZEX224', 'sumo-squat-pulses', NULL, NULL, '<ul><li>Perform Sumo Squat Pulses at the very bottom of your sumo squat. You should be as low as you can get while keeping your chest open, with no hunching in the lower back.</li><li>The pulses should be small, light movements. You can think about pushing up just a few inches and releasing, or you can do the opposite, actually focusing on pushing your body down and then feeling how the elasticity of your muscles will naturally bounce you back up.</li><li>Take a nice, wide stance, with your toes pointing out just slightly.</li></ul>', '<ul><li>Use a steady, gentle breath throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/600957212.hd.mp4?s=48b52d9ca7d4d8f0bea814118c6e9321b71a8cd2&profile_id=175', 'https://i.vimeocdn.com/video/1236868130-b1da609554156addb87fba03a455f1ab75f2ef0b0a05cbee38c65a6017191f0d-d_640', 'https://player.vimeo.com/external/567718925.hd.mp4?s=ba5e8bbd5f140cbd60cde0ee23c1892606af6671&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:42'),
(225, 'Sumo Squats', 'Reps', 'POZEX225', 'sumo-squats', NULL, NULL, '<ul><li>The main focus of your movement should always be driving the tailbone down and back during the descent, while keeping a gentle curve or a long line (but never a hunch) in the lower back.</li><li>Take a nice, wide stance, with your toes pointing out just slightly.</li><li>Allow your head to float upward as your drive your tailbone back and down, allowing your knees to bend.</li><li>Go as deep into the movement as possible keeping your chest facing forward without any hunching in your lower back.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600957460.hd.mp4?s=8953a3595b6855e3f02d48cadabde34871f66475&profile_id=175', 'https://i.vimeocdn.com/video/1236871152-10844d7959cd72fe74856e0407964dd14cfaa86330a4566772bb4a01d5c5244f-d_640', 'https://player.vimeo.com/external/622092993.hd.mp4?s=4a47647cc717b4a0528a76903135fe9471df7c2a&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:43'),
(226, 'Sumo Squats with Rotational Reach', 'Reps', 'POZEX226', 'sumo-squats-with-rotational-reach', NULL, NULL, '<ul><li>Use your gaze to lead the movement, looking where your hand is reaching. Especially at the top of the movement, be sure to really look up and to the side, rather than just moving your head.</li><li>Similarly, be sure to reach as far as you can with your fingers.</li><li>It is ok for your knees to rotate slightly with the movement. Just be sure to always keep the ball of your little toe of each foot on the ground the entire time to avoid the knee dropping excessively inward.</li></ul>', '<ul><li>Inhale down. Exhale up.</li><li>Use a generous inhalation to encourage the expansion of the chest and rotation through the spine.</li></ul>', NULL, 'https://player.vimeo.com/external/600558591.hd.mp4?s=087ed57f96478784721c8ef7bfdc3efac0462569&profile_id=175', 'https://i.vimeocdn.com/video/1236390361-6470c9b5b8c957fa7955ff22832cd642b73196b954ff07d9ba6f24f3de9bdc55-d_295x166', 'https://player.vimeo.com/external/622092893.hd.mp4?s=dfcdccf60204a69b809e8c1220fbb35784adf881&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:44'),
(227, 'Superman ', 'Reps', 'POZEX227', 'superman', NULL, NULL, '<ul><li>Keep a long neck, with your head in line with your spine. This means you should be looking down, not forward.</li><li>Reach out of your fingers and toes as much as possible the entire time.</li><li>At the top of each rep, hold an extra second or two, working to get your arms and legs even higher if possible.</li></ul>', '<ul><li>Inhale as you lift up on each rep. Exhale down.</li><li>Notice how a generous inhalation encourages the chest to open and the back to arch  as you lift yourself up.</li></ul>', NULL, 'https://player.vimeo.com/external/600558591.hd.mp4?s=087ed57f96478784721c8ef7bfdc3efac0462569&profile_id=175', 'https://i.vimeocdn.com/video/1236390361-6470c9b5b8c957fa7955ff22832cd642b73196b954ff07d9ba6f24f3de9bdc55-d_295x166', 'https://player.vimeo.com/external/613868027.hd.mp4?s=0baf333ae0dfe4c90054608beb6a6bacd6aa4649&profile_id=175', NULL, 'back', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:44'),
(228, 'Superman - Arms Only', 'Reps', 'POZEX228', 'superman-arms-only', NULL, NULL, '<ul><li>Keep a long neck, with your head in line with your spine. This means you should be looking down, not forward.</li><li>Reach out of your fingers as much as possible the entire time.</li><li>At the top of each rep, hold an extra second or two, working to get your arms even higher if possible.</li></ul>', '<ul><li>Inhale as you lift up on each rep. Exhale down.</li><li>Notice how a generous inhalation encourages the chest to open and the back to arch  as you lift yourself up.</li></ul>', NULL, 'https://player.vimeo.com/external/600558591.hd.mp4?s=087ed57f96478784721c8ef7bfdc3efac0462569&profile_id=175', 'https://i.vimeocdn.com/video/1236390361-6470c9b5b8c957fa7955ff22832cd642b73196b954ff07d9ba6f24f3de9bdc55-d_295x166', 'https://player.vimeo.com/external/613867901.hd.mp4?s=e2579ca7eedaff72f6086b6f7e91dde39d257280&profile_id=175', NULL, 'back', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:38:45'),
(229, 'Superman - Full Scissors', 'Duration', 'POZEX229', 'superman-full-scissors', NULL, NULL, '<ul><li>Coordinate the movement of the arms and legs so they move at the same speed.</li><li>Use a contralateral arm/leg coordination. Meaning when the left arm is up, the right leg should be up with it.</li><li>Keep a long neck, with your head in line with your spine. This means you should be looking down, not forward.</li><li>Reach out of your fingers and toes as much as possible the entire time.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600558591.hd.mp4?s=087ed57f96478784721c8ef7bfdc3efac0462569&profile_id=175', 'https://i.vimeocdn.com/video/1236390361-6470c9b5b8c957fa7955ff22832cd642b73196b954ff07d9ba6f24f3de9bdc55-d_295x166', 'https://player.vimeo.com/external/613867922.hd.mp4?s=4b07e1c9206cb482e845099d7692c0b5e4218b38&profile_id=175', NULL, 'back,shoulders,core', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:38:45'),
(230, 'Superman - Laterals', 'Reps', 'POZEX230', 'superman-laterals', NULL, NULL, '<ul><li>As you twist to each side, avoid letting the opposite hand and arm drop. The goal is to combine a strong rotation with a powerful lift off the ground throughout.</li><li>Reach out of your fingers as much as possible the entire time.</li><li>As you twist on each rep, hold an extra second or two on each side, working to twist even further if possible.</li></ul>', '<ul><li>Inhale as you lift up to get into position. Then exhale as you twist to each side, and inhale back to center on each rep.</li></ul>', NULL, 'https://player.vimeo.com/external/600558591.hd.mp4?s=087ed57f96478784721c8ef7bfdc3efac0462569&profile_id=175', 'https://i.vimeocdn.com/video/1236390361-6470c9b5b8c957fa7955ff22832cd642b73196b954ff07d9ba6f24f3de9bdc55-d_295x166', 'https://player.vimeo.com/external/613867953.hd.mp4?s=5c854b66f429b552bfaafa17473fec2a790b2122&profile_id=175', NULL, 'back,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:46'),
(231, 'Superman - Prisoner Laterals', 'Reps', 'POZEX231', 'superman-prisoner-laterals', NULL, NULL, '<ul><li>Touch your fingers gently to the back of your head, with ample space between your fingers. Do not lace your fingers together, as this will pull the head forward unnecessarily.</li><li>As you twist to each side, avoid letting the opposite elbow drop. The goal is to combine a strong rotation with a powerful lift off the ground throughout.</li><li>Reach out of your fingers as much as possible the entire time.</li><li>As you twist on each rep, hold an extra second or two on each side, working to twist even further if possible.</li></ul>', '<ul><li>Inhale as you lift up to get into position. Then exhale as you twist to each side, and inhale back to center on each rep.</li></ul>', NULL, 'https://player.vimeo.com/external/600558591.hd.mp4?s=087ed57f96478784721c8ef7bfdc3efac0462569&profile_id=175', 'https://i.vimeocdn.com/video/1236390361-6470c9b5b8c957fa7955ff22832cd642b73196b954ff07d9ba6f24f3de9bdc55-d_295x166', 'https://player.vimeo.com/external/613867989.hd.mp4?s=12c421952116dbc28dbc371f79a780c877040107&profile_id=175', NULL, 'back,core', NULL, 'building-mass', 'exercise', NULL, 'Advanced', NULL, NULL, '2022-12-02 09:38:47'),
(232, 'Surfer Squats', 'Reps', 'POZEX232', 'surfer-squats', NULL, NULL, '<ul><li>Keep the “tripod” of the foot (heel, ball of little toe, ball of big toe) firmly rooted into the ground throughout.</li><li>It’s fine to hinge at the waist and lean forward a bit, but always keep your chest open and avoid any hunching in the lower back.</li><li>Choose a width of stance and rotation of the toes that allows you to keep the knee of the bent leg roughly over the big toe of that foot as you bend.</li></ul>', '<ul><li>Exhale down. Inhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600958053.hd.mp4?s=ac104a7624521ea1167efc3e6f3c136c926d43c8&profile_id=175', 'https://i.vimeocdn.com/video/1236869421-74cd52f699d1ba2eb814f4608f7537860a685abb86d7ba72bdfdf889c48ef60a-d_640', 'https://player.vimeo.com/external/622092859.hd.mp4?s=81d5970a54c6bc0faad5766b6ec78e57ce80ab53&profile_id=175', NULL, 'legs,glutes', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:47'),
(233, 'Torso Twist with Isometric Towel Pull', 'Reps', 'POZEX233', 'torso-twist-with-isometric-towel-pull', NULL, NULL, '<ul><li>You can perform this with a towel, rolled up t-shirt, rope, or anything else that won’t be damaged by you trying to rip it in half. Because your goal is to try to actually rip it in half the entire time!</li><li>Keep your chest open and your shoulders relaxed down away from your ears, especially as you reach the hardest part of the twist on each rep.</li><li>Try to twist further than you think you can on each and every rep, using the exhale to try to squeeze out a few extra millimeters on each side.</li><li>Keep your pelvis facing straight forward. To achieve this, it may help to even think about twisting it a bit in the opposite direction as your upper body.</li><li>Film yourself the first time you try this, to ensure you’re not letting your hips rotate without realizing it.</li></ul>', '<ul><li>Exhale as you twist to each side. Inhale back to center.</li><li>Use a strong, generous exhale to encourage a powerful rotation on each rep.</li></ul>', NULL, 'https://player.vimeo.com/external/628417196.hd.mp4?s=27fef0c45c7f83dfb4164a32365cb884cbb012cf&profile_id=175', 'https://i.vimeocdn.com/video/1270703899-c575dcf4b9374625aadddc5fa856c9ac161b9cf5d9520026a_640', 'https://player.vimeo.com/external/620362263.hd.mp4?s=a0abbdac547bace6c1ccac75633dc6d31bf6704e&profile_id=175', NULL, 'back,core', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:48'),
(234, 'Towel Lat Pulldown', 'Reps', 'POZEX234', 'towel-lat-pulldown', NULL, NULL, '<ul><li>You can perform this with a towel, rolled up t-shirt, rope, or anything else that won’t be damaged by you trying to rip it in half. Because your goal is to try to actually rip it in half the entire time!</li><li>Pull your shoulder blades down and together to open your chest and project your energy (from your chest and your gaze) forward and up. Keep that forward-and-up focus throughout the entire exercise.</li><li>Keep your core engaged throughout to avoid excessive curve in the lower back.</li></ul>', '<ul><li>Inhale at the top, then exhale as you pull the towel down slowly. Inhale again at the bottom, then exhale as you push it back up.</li><li>If you go very slowly (which is a great way to do this exercise!), you can separate the breath from the movement, simply breathing regularly with a strong but controlled breath, to avoid disrupting the stillness in the torso.</li></ul>', NULL, 'https://player.vimeo.com/external/629032533.hd.mp4?s=7cf73b7311edb99e5ae48f4909be29101984fc4a&profile_id=175', 'https://i.vimeocdn.com/video/1271302931-164c025e5b8de36436baa7ad12b35893643a4f7e1bc241417_640', 'https://player.vimeo.com/external/620362483.hd.mp4?s=d9c2bcf2873bc3d1d7799188087ed30fba785456&profile_id=175', NULL, 'back,core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:49'),
(235, 'Towel Row', 'Reps', 'POZEX235', 'towel-row', NULL, NULL, '<ul><li>You can perform this with a towel, rolled up t-shirt, rope, or anything else that won’t be damaged by you trying to rip it in half. Because your goal is to try to actually rip it in half the entire time!</li><li>Squeeze your shoulder blades together and keep your chest as wide as possible throughout.</li><li>Keep your knees slightly bent and your tailbone pointing down and a bit back, to avoid tucking the pelvis.</li></ul>', '<ul><li>Inhale with your arms out, then exhale as you pull the towel in slowly. Inhale again with the towel against you, then exhale as you push it back out.</li><li>If you go very slowly (which is a great way to do this exercise!), you can separate the breath from the movement, simply breathing regularly with a strong but controlled breath, to avoid disrupting the stillness in the torso.</li></ul>', NULL, 'https://player.vimeo.com/external/629033059.hd.mp4?s=d24b5b1bf95cb2ae12fd1a5e2be1583225e4cd97&profile_id=175', 'https://i.vimeocdn.com/video/1271303329-71adf34c942cee4a259f65021de8b731c3a1ee3b1973ec48d_640', 'https://player.vimeo.com/external/620362569.hd.mp4?s=c6c90a2435e43f5caed7e798e20cc154a48e8f1e&profile_id=175', NULL, 'back,core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:50'),
(236, 'Twist Crunches', 'Duration', 'POZEX236', 'twist-crunches', NULL, NULL, '<ul><li>Place your fingertips lightly against the back of your head, keeping your elbows open, your chest wide, and your shoulders relaxed down away from your ears. In order to lengthen through the back of your neck, do not lace your fingers behind your head.</li><li>On each crunch, move the front of your shoulder (not your elbow) up toward the opposite knee. Keep the elbow open out to the side to keep width through your torso and to focus the effort on the abs and obliques.</li><li>At the top of each rep, squeeze for an extra second or two, trying to get just a few millimeters higher than you think you can.</li></ul>', '<ul><li>Exhale up. Inhale down.</li><li>Use a strong, controlled exhale to help encourage contraction through the core.</li></ul>', NULL, 'https://player.vimeo.com/external/615791004.hd.mp4?s=b6b2618fe2a5022545dbbdac0b0eb23f707f87cd&profile_id=175', 'https://i.vimeocdn.com/video/1257732101-3116b50cdd3bc29b9362a7ecf07e6cfc7c2ac1d053160ddd35be08cbca5292a3-d_640', 'https://player.vimeo.com/external/613868070.hd.mp4?s=a3908e4ee7b1144a4fdff5df7f5faadef7f6f1ba&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:50'),
(237, 'Undulating Glute Bridge', 'Reps', 'POZEX237', 'undulating-glute-bridge', NULL, NULL, '<ul><li>The primary goal of this exercise is not to build strength. The goal is to develop awareness and mobility through the pelvis and spine, and to learn to better articulate through each vertebra. Be sure to really place your attention deep within your spine and focus on feeling the movement of each individual vertebra.</li><li>During the ascent and the descent, drive your knees forward away from your body, to help lengthen the spine and create space for more subtle and clear articulation of the pelvis and spine.</li><li>The way down is just as important as the way up! Focus on only allowing one vertebra at a time to make contact with the ground as you roll down.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/615720630.hd.mp4?s=eac967dd0fbed6398fcddc8ddab44babad6297c8&profile_id=175', 'https://i.vimeocdn.com/video/1257661708-e570e628fe09bd2336eb56ba76ccc65c1dea7c77cd732ad38bbd24f51125a26e-d_640', 'https://player.vimeo.com/external/613868139.hd.mp4?s=d7be908f18fcb2b42c002d7a3f22e8e518d1447a&profile_id=175', NULL, 'glutes,legs', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:51'),
(238, 'Walking Pike Plank', 'Reps', 'POZEX238', 'walking-pike-plank', NULL, NULL, '<ul><li>As you walk your legs toward your hands, push hard into the ground with your hands and work to bring your armpits back toward your legs, rather than letting your shoulders move forward out over your hands.</li><li>Keep your head and neck in line with your spine. In the plank, you should be looking straight down at the ground. Then, as you walk yourself in, your gaze should move more and more back toward your legs. At the top of the pike, you should be looking back through your legs.</li><li>Don’t worry if you can’t get all the way up into the pike at first. This exercise is a staple of acrobatic training that combines strength and flexibility in a challenging and beneficial way. Take your time. And if you want to increase your flexibility, gently stretching your hamstrings before and after this exercise is a great idea!</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600896761.hd.mp4?s=ca1cd2a3f71fa2d08310505ba95071ad25df393e&profile_id=175', 'https://i.vimeocdn.com/video/1236793315-f14f89ccd275a9d1450372b9461b98e7d2e1ae52414763e370c846c1e55ce8fc-d_640', 'https://player.vimeo.com/external/613868275.hd.mp4?s=f32fababd0394bcd6e736511a938a3750f0c044b&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:52'),
(239, 'Walking Planks', 'Duration', 'POZEX239', 'walking-planks', NULL, NULL, '<ul><li>Your torso will naturally tilt a bit side to side as you move down onto your elbows and back up. But try to keep that tilting to the bare minimum possible, keeping a long line through the spine.</li><li>Keep the core gently engaged throughout to encourage a long spine, and avoid sticking the butt up in the air.</li><li>You can use a mat or towel under your elbows for comfort if desired.</li></ul>', '<ul><li>Inhale down. Exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/600900440.hd.mp4?s=dad0c4b97ff238d84bb34eb199907bc1abdfa333&profile_id=175', 'https://i.vimeocdn.com/video/1236797767-8e7c8f157df80d08bfc45b8ecf61719b8436744dab68262d53076f6cf6770712-d_640', 'https://player.vimeo.com/external/613868374.hd.mp4?s=69b6c81e95d1a2639172a5a6f864dd0c69cc126f&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:53'),
(240, 'Wall Push-Ups', 'Reps', 'POZEX240', 'wall-push-ups', NULL, NULL, '<ul><li>Choose a height for your hands and a standing from the wall that allows you to perform the push-ups with your shoulders relaxed down away from the ears throughout.</li><li>Keep your ankles relaxed and the longest line possible from your heels all the way up your spine and out the top of your head.</li><li>If you want to increase the challenge, you can arch a bit in your upper (not lower) back, and lower yourself into the wall until your chest touches it.</li></ul>', '<ul><li>Inhale down toward the wall. Exhale as you push yourself back out.</li></ul>', NULL, 'https://player.vimeo.com/external/612639800.hd.mp4?s=b39cddf9851c659de32a12bc1aa2cd1e4a2dfa38&profile_id=175', 'https://i.vimeocdn.com/video/1250112143-f48f3dfa4e72af2855d46ab43671c65b146251edd61b86b45ce50f458db3966d-d_640', 'https://player.vimeo.com/external/613868591.hd.mp4?s=fc4d67d2f088d11ec3e4e7b4a8f34b7c6c3079d3&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:38:53'),
(241, 'Wall Push-Ups - 1 Arm', 'Reps', 'POZEX241', 'wall-push-ups-1-arm', NULL, NULL, '<ul><li>You can place the non-working hand behind your back, or up with your fingers against the side of your head. In either case, focus on keeping your torso perfectly parallel to the wall, never letting one shoulder get closer to it than the other.</li><li>Choose a height for your hand (the one against the wall) and a distance from the wall that allows you to perform the push-ups with your shoulders relaxed down away from the ears throughout.</li><li>Keep your ankles relaxed and the longest line possible from your heels all the way up your spine and out the top of your head.</li></ul>', '<ul><li>Inhale down toward the wall. Exhale as you push yourself back out.</li></ul>', NULL, 'https://player.vimeo.com/external/612637518.hd.mp4?s=ccaeea4d866a930bcef19757260cdbf46d4fe0c5&profile_id=175', 'https://i.vimeocdn.com/video/1250110084-255e05ebe736ac841698aeff97d814a49943ed8b6e53a4a82a73eabf5b2dba08-d_640', 'https://player.vimeo.com/external/613868410.hd.mp4?s=b6c87a932f16f941127e34f219667a51e7040300&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:38:54'),
(242, 'Wall Push-Ups - Plyometric', 'Reps', 'POZEX242', 'wall-push-ups-plyometric', NULL, NULL, '<ul><li>As you push yourself out away from the wall, articulate through your hands and fingers, so your fingers are reaching toward the wall as you suspend in the air. Then, make contact first with those extended fingers, cushioning the landing into the wall on each rep. Keep each rep as silent and graceful as possible.</li><li>If you want to increase the challenge, you can arch a bit in your upper (not lower) back, and lower yourself into the wall until your chest touches it.</li><li>Keep your ankles relaxed and the longest line possible from your heels all the way up your spine and out the top of your head.</li></ul>', '<ul><li>Inhale down toward the wall. Exhale as you push yourself back out.</li></ul>', NULL, 'https://player.vimeo.com/external/612639460.hd.mp4?s=8fbd80d93ed7a1fdff641f4479221853e231ed9b&profile_id=175', 'https://i.vimeocdn.com/video/1250112452-c2d7c07186f1fba601d52a79a7c1052a5fc86c5ee178bddf39abf32fc01baed6-d_640', 'https://player.vimeo.com/external/613868461.hd.mp4?s=85371e1b3eb6f9b533fb4a7f945a13c195879084&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner', NULL, NULL, '2022-12-02 09:38:55'),
(243, 'Wall Sit', 'Duration', 'POZEX243', 'wall-sit', NULL, NULL, '<ul><li>Keep your feet flat on the ground, with your weight evenly distributed over the “tripod” of your foot (heel, ball of big toe, ball of little toe).</li><li>Keep your hips and knees at right (90 degree) angles. If you’re not yet able to stay that low, you can start higher, and then work your way down as you gain strength.</li><li>Keep your back flat against the wall, with equal pressure on each shoulder.</li></ul>', '<ul><li>Breathe gently throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/629033372.hd.mp4?s=9c5456a1f30659fa6d215d757e384b7efb1e8486&profile_id=175', 'https://i.vimeocdn.com/video/1271303689-71d3c4f6b27cb6516f6eac82d312fce9131374a7d86240d49_640', 'https://player.vimeo.com/external/620362799.hd.mp4?s=5fd8f784324d1aebfa11a37b6be11550415640de&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:56'),
(244, 'Wall Sit - 1 Leg', 'Duration', 'POZEX244', 'wall-sit-1-leg', NULL, NULL, '<ul><li>You should be able to hold a normal (2-leg) Wall Sit for at least 30 seconds with perfect form before moving onto this more advanced variation.</li><li>Keep your foot flat on the ground, with your weight evenly distributed over the “tripod” of your foot (heel, ball of big toe, ball of little toe).</li><li>Keep your hips and knee at right (90 degree) angles. If you’re not yet able to stay that low, you can start higher, and then work your way down as you gain strength.</li><li>Keep your back flat against the wall, with equal pressure on each shoulder.</li></ul>', '<ul><li>Breathe gently throughout.</li></ul>', NULL, 'https://player.vimeo.com/external/600148124.hd.mp4?s=596121000633828d8063a33a32066d90613eed9e&profile_id=175', 'https://i.vimeocdn.com/video/1235869776-e2b4a9219224b599403974a0bd9d52f8ede8efe92a6f6776480788b86fb45226-d_640', 'https://player.vimeo.com/external/620362767.hd.mp4?s=47c7d4da21fb97509b1e05570de3377fa5dfb1a5&profile_id=175', NULL, 'legs', NULL, 'building-mass', 'exercise', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:56'),
(245, 'Wide Plank', 'Duration', 'POZEX245', 'wide-plank', NULL, NULL, '<ul><li>Place the hands a few inches wider than for a standard plank, with your fingers pointed slightly out to the sides. Choose a width and hand angle that allows you to keep your chest open and your shoulders relaxed down away from your ears.</li><li>Gently engage your core to lengthen the spine, trying to keep the longest line possible from your heels to the top of your head.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li><li>Keep the front of your hips open and the core gently engaged to avoid the butt being higher than your lower back.</li></ul>', '<ul><li>Use a light, controlled breath to avoid any unnecessary movement in your torso.</li></ul>', NULL, 'https://player.vimeo.com/external/600897109.hd.mp4?s=57a6d642237d4ffeef5034ba7aefbd41988c28e1&profile_id=175', 'https://i.vimeocdn.com/video/1236793654-100c152eb297cb865dd67b9baa280592347a654b36a10d67ad5d6ee165b4e957-d_640', 'https://player.vimeo.com/external/613868757.hd.mp4?s=4939cf0aede4273e97e66f59113e94c82fa2394c&profile_id=175', NULL, 'core,shoulders', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:57'),
(246, 'Wide Push-Ups', 'Reps', 'POZEX246', 'wide-push-ups', NULL, NULL, '<ul><li>Place the hands a few inches wider than for a standard push-up, with your fingers pointed slightly out to the sides. Choose a width and hand angle that allows you to keep your chest open and your shoulders relaxed down away from your ears, especially as you lower yourself down.</li><li>Gently engage your core to lengthen the spine, trying to keep the longest line possible from your heels to the top of your head.</li><li>Keep your weight over the pads of the second and third fingers, actively pushing through your fingertips to avoid having too much pressure on the wrists.</li><li>Keep the front of your hips open and the core gently engaged to avoid the butt being higher than your lower back.</li><li>To make this exercise easier, perform it with your knees on the ground.</li></ul>', '<ul><li>Inhale down, exhale up.</li></ul>', NULL, 'https://player.vimeo.com/external/612640309.hd.mp4?s=b86a6e83f24d74b168dfa03345a62df0d6fcad9a&profile_id=175', 'https://i.vimeocdn.com/video/1250112782-594d3901548de379af747f0aa609a1acfa72f40461a54cfe531d718122b511e0-d_640', 'https://player.vimeo.com/external/613868936.hd.mp4?s=de214907b85622cecf9fab7727498c0a433b2771&profile_id=175', NULL, 'chest,triceps', NULL, 'building-mass', 'exercise', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:58'),
(247, 'Windshield Wipers', 'Reps', 'POZEX247', 'windshield-wipers', NULL, NULL, '<ul><li>As you lower your legs to each side, keep the back of the opposite shoulder glued to the ground as much as possible, and reach with the fingers of the opposite hand.</li><li>You can perform windshield wipers with your legs straight, or with a slight bend in the knees. The more you bend your knees, the easier it will feel.</li><li>Reach out with your toes as much as possible, feeling that it’s the tips of the toes that lead the movement of the legs.</li><li>Keep your knees together, trying not to allow the bottom leg to slide further out on each side.</li></ul>', '<ul><li>Exhale as you lower your legs to each side and lift them back to center. Inhale at center between reps.</li></ul>', NULL, 'https://player.vimeo.com/external/615701613.hd.mp4?s=106200ce19a18767367f1cd955bd84a662238adc&profile_id=175', 'https://i.vimeocdn.com/video/1257639399-781a7a82009f41a1ac2b6066be763d71ca2c1dee9b0acf0a4d2b53085e9ac95a-d_640', 'https://player.vimeo.com/external/613869081.hd.mp4?s=75442a471bbd56def4e6d7eedd8d7166d5f41d24&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise,warmup', NULL, 'Intermediate,Advanced', NULL, NULL, '2022-12-02 09:38:58'),
(248, 'Windshield Wipers - Bent knees', 'Reps', 'POZEX248', 'windshield-wipers-bent-knees', NULL, NULL, '<ul><li>Bent knee windshield wipers can be performed as a strengthening exercise, a stretch, or a combination of both. To increase the stretch, spend longer on each side, keeping your legs just off the ground, your knees together, and your opposite shoulder pushed firmly into the ground. To increase the muscular challenge, descend slowly on each side, then move the legs back to center quickly and powerfully while exhaling.</li><li>Keep your knees together, trying not to allow the bottom knee to slide further out on each side.</li><li>You can perform bent knee windshield wipers with your knees at a right (90 degree) angle, or with the legs extended a bit more. The more you extend the legs, the more challenging it will feel.</li></ul>', '<ul><li>Exhale as you lower your legs to each side and lift them back to center. Inhale at center between reps.</li></ul>', NULL, 'https://player.vimeo.com/external/615701004.hd.mp4?s=88c298c92beba4972922a6ae80cb86db4beb207b&profile_id=175', 'https://i.vimeocdn.com/video/1257639883-9c838b2817a2d02fc137102f7dd5dd0dac545e7490cb38addd242af52f994392-d_640', 'https://player.vimeo.com/external/613869038.hd.mp4?s=784af5f4f2957ff5b61c98eb0bcd8f87feb55368&profile_id=175', NULL, 'core', NULL, 'building-mass', 'exercise,warmup', NULL, 'Beginner,Intermediate', NULL, NULL, '2022-12-02 09:38:59'),
(249, 'Wrist Circles', 'Reps', 'POZEX249', 'wrist-circles', NULL, NULL, '<ul><li>Performing wrist circles before putting weight on your hands (such as for push-ups or planks) is an excellent way to warm up the wrists and protect the delicate tendons passing through the Carpal Tunnel. But be sure to also perform Wrist Circles after your workout as well, to increase circulation and promote mobility.</li><li>Keep your chest open and your shoulders relaxed down away from your ears the entire time.</li><li>Focus on activating the fingers as well as the wrists, and try to make the largest, smoothest circles possible. Be sure to roll them in both directions.</li></ul>', '<ul><li>Keep your breath as effortless and relaxed as possible throughout the exercise.</li></ul>', NULL, 'https://player.vimeo.com/external/646709258.hd.mp4?s=b580a117788c0b5498790d19ecad3623983c7a1d&profile_id=175', 'https://i.vimeocdn.com/video/1301907482-d4b69cd9c06cb6038563e80dac4e53f70e7256f64572ac8b0_640', 'https://player.vimeo.com/external/620362838.hd.mp4?s=e800e711e79c93972c218364ac4c5c0bca33a994&profile_id=175', NULL, 'forearms', NULL, 'building-mass', 'warmup', NULL, 'Beginner,Intermediate,Advanced', NULL, NULL, '2022-12-02 09:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `exercise_variations`
--

CREATE TABLE `exercise_variations` (
  `id` bigint UNSIGNED NOT NULL,
  `exercise_code` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reps` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rest_duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exercise_workout`
--

CREATE TABLE `exercise_workout` (
  `id` bigint UNSIGNED NOT NULL,
  `workout_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `duration` int NOT NULL,
  `variation_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sets` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `based_on` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ex_duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ex_reps` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rest_duration` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercise_workout`
--

INSERT INTO `exercise_workout` (`id`, `workout_id`, `exercise_id`, `category_id`, `duration`, `variation_name`, `sets`, `based_on`, `ex_duration`, `ex_reps`, `rest_duration`, `created_at`) VALUES
(1, 1, 218, 2, 10, 'Squats', '1 set', 'duration', '30', NULL, 20, '2022-12-18 06:30:59'),
(2, 1, 164, 2, 10, 'Push Backs - Bidirectional', '1 set', 'duration', '45', NULL, 30, '2022-12-18 06:30:59'),
(3, 1, 102, 2, 10, 'Jump Lunges', '1 set', 'duration', '45', NULL, 30, '2022-12-18 06:30:59'),
(4, 1, 74, 2, 10, 'Good Mornings With Twist', '1 set', 'duration', '45', NULL, 30, '2022-12-18 06:30:59'),
(5, 1, 120, 2, 10, 'Lateral Pushups', '1 set', 'duration', '45', NULL, 30, '2022-12-18 06:30:59'),
(6, 1, 212, 2, 10, 'Snow Angels - Bent Over', '1 set', 'duration', '45', NULL, 30, '2022-12-18 06:30:59'),
(7, 1, 138, 2, 10, 'Mountain Climber- Cross Body', '1 set', 'duration', '45', NULL, 30, '2022-12-18 06:30:59'),
(8, 1, 218, NULL, 20, 'Squats', '1 set', 'duration', '30', NULL, 20, '2022-12-18 06:31:20'),
(9, 1, 164, NULL, 20, 'Push Backs- Bidirectional', '2 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:20'),
(10, 1, 102, NULL, 20, 'Jump Lunges', '2 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:20'),
(11, 1, 74, NULL, 20, 'Good Mornings With Twist', '2 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:20'),
(12, 1, 120, NULL, 20, 'Lateral Pushups', '2 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:20'),
(13, 1, 212, NULL, 20, 'Snow Angels- Bent Over', '2 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:20'),
(14, 1, 138, NULL, 20, 'Mountain Climber- Cross Body', '2 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:20'),
(15, 1, 218, NULL, 30, 'Squats', '1 set', 'duration', '30', NULL, 20, '2022-12-18 06:31:40'),
(16, 1, 164, NULL, 30, 'Push Backs- Bidirectional', '3 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:40'),
(17, 1, 102, NULL, 30, 'Jump Lunges', '3 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:40'),
(18, 1, 74, NULL, 30, 'Good Mornings With Twist', '3 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:40'),
(19, 1, 120, NULL, 30, 'Lateral Pushups', '3 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:40'),
(20, 1, 212, NULL, 30, 'Snow Angels- Bent Over', '3 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:40'),
(21, 1, 138, NULL, 30, 'Mountain Climber- Cross Body', '3 sets', 'duration', '45', NULL, 30, '2022-12-18 06:31:40'),
(22, 2, 249, NULL, 15, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:32:45'),
(23, 2, 76, NULL, 15, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:32:45'),
(24, 2, 92, NULL, 15, 'Hindu Push-Ups (Dand)', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:32:45'),
(25, 2, 37, NULL, 15, 'Circular Push-Ups', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:32:45'),
(26, 2, 172, NULL, 15, 'Push-Ups to Staggered Side Plank', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:32:45'),
(27, 2, 179, NULL, 15, 'Reverse Hindu Push-Ups', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:32:45'),
(28, 2, 120, NULL, 15, 'Lateral Push-Ups', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:32:45'),
(29, 2, 139, NULL, 15, 'Narrow Push-Ups', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:32:45'),
(30, 2, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:33:32'),
(31, 2, 76, NULL, 30, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:33:32'),
(32, 2, 92, NULL, 30, 'Hindu Push-Ups (Dand)', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:32'),
(33, 2, 37, NULL, 30, 'Circular Push-Ups', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:32'),
(34, 2, 172, NULL, 30, 'Push-Ups to Staggered Side Plank', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:32'),
(35, 2, 179, NULL, 30, 'Reverse Hindu Push-Ups', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:32'),
(36, 2, 120, NULL, 30, 'Lateral Push-Ups', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:32'),
(37, 2, 139, NULL, 30, 'Narrow Push-Ups', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:32'),
(38, 2, 249, NULL, 45, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:33:56'),
(39, 2, 76, NULL, 45, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:33:56'),
(40, 2, 92, NULL, 45, 'Hindu Push-Ups (Dand)', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:56'),
(41, 2, 37, NULL, 45, 'Circular Push-Ups', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:56'),
(42, 2, 172, NULL, 45, 'Push-Ups to Staggered Side Plank', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:56'),
(43, 2, 179, NULL, 45, 'Reverse Hindu Push-Ups', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:56'),
(44, 2, 120, NULL, 45, 'Lateral Push-Ups', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:56'),
(45, 2, 139, NULL, 45, 'Narrow Push-Ups', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:33:56'),
(46, 3, 249, NULL, 15, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:35:21'),
(47, 3, 76, NULL, 15, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:35:21'),
(48, 3, 92, NULL, 15, 'Hindu Push-Ups (Dand)', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:35:21'),
(49, 3, 37, NULL, 15, 'Circular Push-Ups', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:35:21'),
(50, 3, 172, NULL, 15, 'Push-Ups to Staggered Side Plank', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:35:21'),
(51, 3, 179, NULL, 15, 'Reverse Hindu Push-Ups', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:35:21'),
(52, 3, 120, NULL, 15, 'Lateral Push-Ups', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:35:21'),
(53, 3, 139, NULL, 15, 'Narrow Push-Ups', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:35:21'),
(54, 3, 249, 2, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:35:40'),
(55, 3, 76, 2, 30, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:35:40'),
(56, 3, 92, 2, 30, 'Hindu Push-Ups (Dand)', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:40'),
(57, 3, 37, 2, 30, 'Circular Push-Ups', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:40'),
(58, 3, 172, 2, 30, 'Push-Ups to Staggered Side Plank', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:40'),
(59, 3, 179, 2, 30, 'Reverse Hindu Push-Ups', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:40'),
(60, 3, 120, 2, 30, 'Lateral Push-Ups', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:40'),
(61, 3, 139, 2, 30, 'Narrow Push-Ups', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:40'),
(62, 3, 249, NULL, 45, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:35:55'),
(63, 3, 76, NULL, 45, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:35:55'),
(64, 3, 92, NULL, 45, 'Hindu Push-Ups (Dand)', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:55'),
(65, 3, 37, NULL, 45, 'Circular Push-Ups', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:55'),
(66, 3, 172, NULL, 45, 'Push-Ups to Staggered Side Plank', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:55'),
(67, 3, 179, NULL, 45, 'Reverse Hindu Push-Ups', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:55'),
(68, 3, 120, NULL, 45, 'Lateral Push-Ups', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:55'),
(69, 3, 139, NULL, 45, 'Narrow Push-Ups', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:35:55'),
(70, 4, 249, NULL, 15, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:37:09'),
(71, 4, 76, NULL, 15, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:37:09'),
(72, 4, 93, NULL, 15, 'Hindu Push-Ups with Undulation', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:37:09'),
(73, 4, 38, NULL, 15, 'Circular Push-Ups with Undulation', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:37:09'),
(74, 4, 170, NULL, 15, 'Push-Ups to Parallel Side Plank', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:37:09'),
(75, 4, 180, NULL, 15, 'Reverse Hindu Push-Ups with Undulation', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:37:09'),
(76, 4, 121, NULL, 15, 'Lateral Push - Ups - Plyometric', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:37:09'),
(77, 4, 141, NULL, 15, 'Narrow Push - Ups -1 Leg Alternating', '1 set', 'duration', '30', NULL, 45, '2022-12-18 06:37:09'),
(78, 4, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:37:25'),
(79, 4, 76, NULL, 30, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:37:25'),
(80, 4, 93, NULL, 30, 'Hindu Push-Ups with Undulation', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:25'),
(81, 4, 38, NULL, 30, 'Circular Push-Ups with Undulation', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:25'),
(82, 4, 170, NULL, 30, 'Push-Ups to Parallel Side Plank', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:25'),
(83, 4, 180, NULL, 30, 'Reverse Hindu Push-Ups with Undulation', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:25'),
(84, 4, 121, NULL, 30, 'Lateral Push-Ups- Plyometric', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:25'),
(85, 4, 141, NULL, 30, 'Narrow Push-Ups -1 Leg Alternating', '2 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:25'),
(86, 4, 249, NULL, 45, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:37:41'),
(87, 4, 76, NULL, 45, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:37:41'),
(88, 4, 93, NULL, 45, 'Hindu Push-Ups with Undulation', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:41'),
(89, 4, 38, NULL, 45, 'Circular Push-Ups with Undulation', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:41'),
(90, 4, 170, NULL, 45, 'Push-Ups to Parallel Side Plank', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:41'),
(91, 4, 180, NULL, 45, 'Reverse Hindu Push-Ups with Undulation', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:41'),
(92, 4, 121, NULL, 45, 'Lateral Push-Ups- Plyometric', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:41'),
(93, 4, 141, NULL, 45, 'Narrow Push-Ups -1 Leg Alternating', '3 sets', 'duration', '30', NULL, 45, '2022-12-18 06:37:41'),
(94, 5, 249, NULL, 15, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:38:37'),
(95, 5, 76, NULL, 15, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:38:37'),
(96, 5, 93, NULL, 15, 'Hindu Push-Ups with Undulation', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:38:37'),
(97, 5, 38, NULL, 15, 'Circular Push-Ups with Undulation', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:38:37'),
(98, 5, 170, NULL, 15, 'Push-Ups to Parallel Side Plank', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:38:37'),
(99, 5, 180, NULL, 15, 'Reverse Hindu Push-Ups with Undulation', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:38:37'),
(100, 5, 121, NULL, 15, 'Lateral Push-Ups- Plyometric', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:38:37'),
(101, 5, 141, NULL, 15, 'Narrow Push-Ups -1 Leg Alternating', '1 set', 'duration', '40', NULL, 40, '2022-12-18 06:38:37'),
(102, 5, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:38:55'),
(103, 5, 76, NULL, 30, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:38:55'),
(104, 5, 93, NULL, 30, 'Hindu Push-Ups with Undulation', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:38:55'),
(105, 5, 38, NULL, 30, 'Circular Push-Ups with Undulation', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:38:55'),
(106, 5, 170, NULL, 30, 'Push-Ups to Parallel Side Plank', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:38:55'),
(107, 5, 180, NULL, 30, 'Reverse Hindu Push-Ups with Undulation', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:38:55'),
(108, 5, 121, NULL, 30, 'Lateral Push-Ups- Plyometric', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:38:55'),
(109, 5, 141, NULL, 30, 'Narrow Push-Ups -1 Leg Alternating', '2 sets', 'duration', '40', NULL, 40, '2022-12-18 06:38:55'),
(110, 5, 249, NULL, 45, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', 0, '2022-12-18 06:39:12'),
(111, 5, 76, NULL, 45, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2022-12-18 06:39:12'),
(112, 5, 93, NULL, 45, 'Hindu Push-Ups with Undulation', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:39:12'),
(113, 5, 38, NULL, 45, 'Circular Push-Ups with Undulation', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:39:12'),
(114, 5, 170, NULL, 45, 'Push-Ups to Parallel Side Plank', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:39:12'),
(115, 5, 180, NULL, 45, 'Reverse Hindu Push-Ups with Undulation', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:39:12'),
(116, 5, 121, NULL, 45, 'Lateral Push-Ups- Plyometric', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:39:12'),
(117, 5, 141, NULL, 45, 'Narrow Push-Ups -1 Leg Alternating', '3 sets', 'duration', '40', NULL, 40, '2022-12-18 06:39:12'),
(118, 6, 237, NULL, 10, 'Undulating Glute Bridge', '1 set', 'reps', NULL, '5 - 8 reps ', 20, '2022-12-22 10:53:17'),
(119, 6, 70, NULL, 10, 'Glute Bridge Hold', '1 set', 'duration', '20', NULL, 30, '2022-12-22 10:53:17'),
(120, 6, 112, NULL, 10, 'Kneeling Hip Thrust', '1 set', 'reps', NULL, '10 - 15 reps  ', 30, '2022-12-22 10:53:17'),
(121, 6, 201, NULL, 10, 'Skater Jumps', '1 set', 'reps', NULL, '10 - 15 reps  on each side', 30, '2022-12-22 10:53:17'),
(122, 6, 22, NULL, 10, 'Bent Knee Glute kickbacks', '1 set', 'reps', NULL, '10 - 15 reps  on each side', 30, '2022-12-22 10:53:17'),
(123, 6, 237, NULL, 20, 'Undulating Glute Bridge', '1 set', 'reps', NULL, '5 - 8 reps ', 20, '2022-12-22 10:53:34'),
(124, 6, 70, NULL, 20, 'Glute Bridge Hold', '2 sets', 'duration', '20', NULL, 30, '2022-12-22 10:53:34'),
(125, 6, 112, NULL, 20, 'Kneeling Hip Hold', '2 sets', 'reps', NULL, '10 - 15 reps ', 30, '2022-12-22 10:53:34'),
(126, 6, 201, NULL, 20, 'Skater Jumps', '2 sets', 'reps', NULL, '10 - 15 reps  on each side', 30, '2022-12-22 10:53:34'),
(127, 6, 22, NULL, 20, 'Bent Knee Glute kickbacks', '2 sets', 'reps', NULL, '10 - 15 reps  on each side', 30, '2022-12-22 10:53:34'),
(128, 6, 237, NULL, 30, 'Undulating Glute Bridge', '1 set', 'reps', NULL, '5 - 8 reps', 20, '2022-12-22 10:53:53'),
(129, 6, 70, NULL, 30, 'Glute Bridge Hold', '3 sets', 'duration', '20', NULL, 30, '2022-12-22 10:53:53'),
(130, 6, 112, NULL, 30, 'Kneeling Hip Hold', '3 sets', 'reps', NULL, '10 - 15 reps ', 30, '2022-12-22 10:53:53'),
(131, 6, 201, NULL, 30, 'Skater Jumps', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 10:53:53'),
(132, 6, 22, NULL, 30, 'Bent Knee Glute kickbacks', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 10:53:53'),
(133, 7, 68, NULL, 10, 'Glute Bridge - Alternating Leg Extensions', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2022-12-22 10:56:28'),
(134, 7, 18, NULL, 10, 'Back Lunges', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2022-12-22 10:56:28'),
(135, 7, 1, NULL, 10, '1 Arm Hip Thrust', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2022-12-22 10:56:28'),
(136, 7, 217, NULL, 10, 'Squat to Good Morning', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 10:56:28'),
(137, 7, 103, NULL, 10, 'Jump Squats', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 10:56:28'),
(138, 7, 68, NULL, 20, 'Glute Bridge - Alternating Leg Extensions', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2022-12-22 10:56:54'),
(139, 7, 18, NULL, 20, 'Back Lunges', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2022-12-22 10:56:54'),
(140, 7, 1, NULL, 20, '1 Arm Hip Thrust', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2022-12-22 10:56:54'),
(141, 7, 217, NULL, 20, 'Squat to Good Morning', '2 sets', 'reps', NULL, '10 - 15 reps ', 30, '2022-12-22 10:56:54'),
(142, 7, 103, NULL, 20, 'Jump Squats', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 10:56:54'),
(143, 7, 68, NULL, 30, 'Glute Bridge - Alternating Leg Extensions', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2022-12-22 10:57:17'),
(144, 7, 18, NULL, 30, 'Back Lunges', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2022-12-22 10:57:17'),
(145, 7, 1, NULL, 30, '1 Arm Hip Thrust', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2022-12-22 10:57:17'),
(146, 7, 217, NULL, 30, 'Squat to Good Morning', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 10:57:17'),
(147, 7, 103, NULL, 30, 'Jump Squats', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 10:57:17'),
(148, 8, 217, NULL, 10, 'Squat to Good Morning', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 11:01:02'),
(149, 8, 200, NULL, 10, 'Side Step Lunges - Alternating', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:01:02'),
(150, 8, 95, NULL, 10, 'Hip Thrust with Spiral Reach', '1 set', 'reps', NULL, '5 - 7 reps on each side', 30, '2022-12-22 11:01:02'),
(151, 8, 205, NULL, 10, 'Skater Jumps with Toe Tap', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:01:02'),
(152, 8, 105, NULL, 10, 'Jump Squats - Crystal ball', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 11:01:02'),
(153, 8, 217, NULL, 20, 'Squat to Good Morning', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 11:01:28'),
(154, 8, 200, NULL, 20, 'Side Step Lunges - Alternating', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:01:28'),
(155, 8, 95, NULL, 20, 'Hip Thrust with Spiral Reach', '2 sets', 'reps', NULL, '5 - 7 reps on each side', 30, '2022-12-22 11:01:28'),
(156, 8, 205, NULL, 20, 'Skater Jumps with Toe Tap', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:01:28'),
(157, 8, 105, NULL, 20, 'Jump Squats - Crystal ball', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 11:01:28'),
(158, 8, 217, NULL, 30, 'Squat to Good Morning', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 11:01:47'),
(159, 8, 200, NULL, 30, 'Side Step Lunges - Alternating', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:01:47'),
(160, 8, 95, NULL, 30, 'Hip Thrust with Spiral Reach', '3 sets', 'reps', NULL, '5 - 7 reps on each side', 30, '2022-12-22 11:01:47'),
(161, 8, 205, NULL, 30, 'Skater Jumps with Toe Tap', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:01:47'),
(162, 8, 105, NULL, 30, 'Jump Squats - Crystal ball', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 11:01:47'),
(163, 9, 217, NULL, 10, 'Squat to Good Morning', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 11:04:50'),
(164, 9, 72, NULL, 10, 'Glute Bridge with Kicks', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:04:50'),
(165, 9, 202, NULL, 10, 'Skater Jumps with Balance', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:04:50'),
(166, 9, 55, NULL, 10, 'Elevated Glute Bridge Hold', '1 set', 'duration', '30', NULL, 30, '2022-12-22 11:04:50'),
(167, 9, 102, NULL, 10, 'Jump Lunges', '1 set', 'reps', NULL, '7 - 10 reps on each side', 30, '2022-12-22 11:04:50'),
(168, 9, 217, NULL, 20, 'Squat to Good Morning', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 11:05:16'),
(169, 9, 72, NULL, 20, 'Glute Bridge with Kicks', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:05:16'),
(170, 9, 202, NULL, 20, 'Skater Jumps with Balance', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:05:16'),
(171, 9, 55, NULL, 20, 'Elevated Glute Bridge Hold', '2 sets', 'duration', '30', NULL, 30, '2022-12-22 11:05:16'),
(172, 9, 102, NULL, 20, 'Jump Lunges', '2 sets', 'reps', NULL, '7 - 10 reps on each side', 30, '2022-12-22 11:05:16'),
(173, 9, 217, NULL, 30, 'Squat to Good Morning', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2022-12-22 11:05:36'),
(174, 9, 72, NULL, 30, 'Glute Bridge with Kicks', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:05:36'),
(175, 9, 202, NULL, 30, 'Skater Jumps with Balance', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:05:36'),
(176, 9, 55, NULL, 30, 'Elevated Glute Bridge Hold', '3 sets', 'duration', '30', NULL, 30, '2022-12-22 11:05:36'),
(177, 9, 102, NULL, 30, 'Jump Lunges', '3 sets', 'reps', NULL, '7 - 10 reps on each side', 30, '2022-12-22 11:05:36'),
(178, 10, 58, NULL, 10, 'Elevated Glute Bridge with Leg Extensions', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2022-12-22 11:08:12'),
(179, 10, 203, NULL, 10, 'Skater Jumps with Balance and Toe Tap', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2022-12-22 11:08:12'),
(180, 10, 94, NULL, 10, 'Hip Rockets', '1 set', 'reps', NULL, '10 - 15 reps  on each side', 30, '2022-12-22 11:08:12'),
(181, 10, 102, NULL, 10, 'Jump Lunges', '1 set', 'reps', NULL, '7 - 10 reps  on each side', 30, '2022-12-22 11:08:12'),
(182, 10, 60, NULL, 10, 'Extended Glute Bridge Hold', '1 set', 'duration', '30', NULL, 30, '2022-12-22 11:08:12'),
(183, 10, 58, NULL, 20, 'Elevated Glute Bridge with Leg Extensions', '2 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2022-12-22 11:08:34'),
(184, 10, 203, NULL, 20, 'Skater Jumps with Balance and Toe Tap', '2 sets', 'reps', NULL, '10 - 15 reps  on each side', 30, '2022-12-22 11:08:34'),
(185, 10, 94, NULL, 20, 'Hip Rockets', '2 sets', 'reps', NULL, '10 - 15 reps  on each side', 30, '2022-12-22 11:08:34'),
(186, 10, 102, NULL, 20, 'Jump Lunges', '2 sets', 'reps', NULL, '7 - 10 reps  on each side', 30, '2022-12-22 11:08:34'),
(187, 10, 60, NULL, 20, 'Extended Glute Bridge Hold', '2 sets', 'duration', '30', NULL, 30, '2022-12-22 11:08:34'),
(188, 10, 58, NULL, 30, 'Elevated Glute Bridge with Leg Extensions', '3 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2022-12-22 11:08:52'),
(189, 10, 203, NULL, 30, 'Skater Jumps with Balance and Toe Tap', '3 sets', 'reps', NULL, '10 - 15 reps  on each side', 30, '2022-12-22 11:08:52'),
(190, 10, 94, NULL, 30, 'Hip Rockets', '3 sets', 'reps', NULL, '10 - 15 reps  on each side', 30, '2022-12-22 11:08:52'),
(191, 10, 102, NULL, 30, 'Jump Lunges', '3 sets', 'reps', NULL, '7 - 10 reps  on each side', 30, '2022-12-22 11:08:52'),
(192, 10, 60, NULL, 30, 'Extended Glute Bridge Hold', '3 sets', 'duration', '30', NULL, 30, '2022-12-22 11:08:52'),
(193, 11, 145, NULL, 7, 'Pelvic Tilts', '1 set', 'duration', '30', NULL, 30, '2022-12-22 11:10:54'),
(194, 11, 70, NULL, 7, 'Glute Bridge Hold', '1 set', 'duration', '30', NULL, 30, '2022-12-22 11:10:54'),
(195, 11, 35, NULL, 7, 'Circular Glute Bridges', '1 set', 'duration', '30', NULL, 30, '2022-12-22 11:10:54'),
(196, 11, 184, NULL, 7, 'Reverse Tabletop', '1 set', 'duration', '30', NULL, 30, '2022-12-22 11:10:54'),
(197, 11, 136, NULL, 7, 'Marching Glute Bridge', '1 set', 'duration', '30', NULL, 30, '2022-12-22 11:10:54'),
(198, 11, 145, NULL, 15, 'Pelvic Tilts', '1 set', 'duration', '30', NULL, 30, '2022-12-22 11:11:13'),
(199, 11, 70, NULL, 15, 'Glute Bridge Hold', '2 sets', 'duration', '30', NULL, 30, '2022-12-22 11:11:13'),
(200, 11, 35, NULL, 15, 'Circular Glute Bridges', '2 sets', 'duration', '30', NULL, 30, '2022-12-22 11:11:13'),
(201, 11, 184, NULL, 15, 'Reverse Tabletop', '2 sets', 'duration', '30', NULL, 30, '2022-12-22 11:11:13'),
(202, 11, 136, NULL, 15, 'Marching Glute Bridge', '2 sets', 'duration', '30', NULL, 30, '2022-12-22 11:11:13'),
(203, 11, 145, NULL, 20, 'Pelvic Tilts', '1 set', 'duration', '30', NULL, 30, '2022-12-22 11:11:43'),
(204, 11, 70, NULL, 20, 'Glute Bridge Hold', '3 sets', 'duration', '30', NULL, 30, '2022-12-22 11:11:43'),
(205, 11, 35, NULL, 20, 'Circular Glute Bridges', '3 sets', 'duration', '30', NULL, 30, '2022-12-22 11:11:43'),
(206, 11, 184, NULL, 20, 'Reverse Tabletop', '3 sets', 'duration', '30', NULL, 30, '2022-12-22 11:11:43'),
(207, 11, 136, NULL, 20, 'Marching Glute Bridge', '3 sets', 'duration', '30', NULL, 30, '2022-12-22 11:11:43'),
(208, 12, 237, NULL, 7, 'Undulating Glute Bridge', '1 set', 'duration', '30', NULL, 30, '2022-12-22 19:18:11'),
(209, 12, 35, NULL, 7, 'Circular Glute Bridges', '1 set', 'duration', '30', NULL, 30, '2022-12-22 19:18:11'),
(210, 12, 1, NULL, 7, '1 Arm Hip Thrust', '1 set', 'duration', '30 on each side', NULL, 30, '2022-12-22 19:18:11'),
(211, 12, 55, NULL, 7, 'Elevated Glute Bridge Hold', '1 set', 'duration', '30', NULL, 30, '2022-12-22 19:18:11'),
(212, 12, 71, NULL, 7, 'Glute Bridge Walkouts', '1 set', 'duration', '30', NULL, 30, '2022-12-22 19:18:12'),
(213, 12, 237, NULL, 15, 'Undulating Glute Bridge', '2 sets ', 'duration', '30', NULL, 30, '2022-12-22 19:18:33'),
(214, 12, 35, NULL, 15, 'Circular Glute Bridges', '2 sets ', 'duration', '30', NULL, 30, '2022-12-22 19:18:33'),
(215, 12, 1, NULL, 15, '1 Arm Hip Thrust', '2 sets', 'duration', '30 on each side', NULL, 30, '2022-12-22 19:18:33'),
(216, 12, 55, NULL, 15, 'Elevated Glute Bridge Hold', '2 sets', 'duration', '30', NULL, 30, '2022-12-22 19:18:33'),
(217, 12, 71, NULL, 15, 'Glute Bridge Walkouts', '2 sets', 'duration', '30', NULL, 30, '2022-12-22 19:18:33'),
(218, 12, 237, NULL, 20, 'Undulating Glute Bridge', '3 sets ', 'duration', '30', NULL, 30, '2022-12-22 19:18:52'),
(219, 12, 35, NULL, 20, 'Circular Glute Bridges', '3 sets ', 'duration', '30', NULL, 30, '2022-12-22 19:18:52'),
(220, 12, 1, NULL, 20, '1 Arm Hip Thrust', '3 sets', 'duration', '30 on each side', NULL, 30, '2022-12-22 19:18:52'),
(221, 12, 55, NULL, 20, 'Elevated Glute Bridge Hold', '3 sets', 'duration', '30', NULL, 30, '2022-12-22 19:18:52'),
(222, 12, 71, NULL, 20, 'Glute Bridge Walkouts', '3 sets', 'duration', '30', NULL, 30, '2022-12-22 19:18:52'),
(223, 13, 59, NULL, 7, 'Elevated Undulating Glute Bridge', '1 set', 'duration', '30', NULL, 30, '2023-01-02 13:47:37'),
(224, 13, 72, NULL, 7, 'Glute Bridge with kicks ', '1 set', 'duration', '30', NULL, 30, '2023-01-02 13:47:37'),
(225, 13, 58, NULL, 7, 'Elevated Glute Bridge with Leg Extensions', '1 set', 'duration', '30 on each side', NULL, 30, '2023-01-02 13:47:37'),
(226, 13, 55, NULL, 7, 'Elevated Glute Bridge Hold', '1 set', 'duration', '30', NULL, 30, '2023-01-02 13:47:37'),
(227, 13, 183, NULL, 7, 'Reverse Plank with Leg Extensions', '1 set', 'duration', '30', NULL, 30, '2023-01-02 13:47:37'),
(228, 13, 59, NULL, 15, 'Elevated Undulating Glute Bridge', '2 sets', 'duration', '30', NULL, 30, '2023-01-02 13:47:56'),
(229, 13, 72, NULL, 15, 'Glute Bridge with kicks ', '2 sets', 'duration', '30', NULL, 30, '2023-01-02 13:47:56'),
(230, 13, 58, NULL, 15, 'Elevated Glute Bridge with Leg Extensions', '2 sets', 'duration', '30 on each side', NULL, 30, '2023-01-02 13:47:56'),
(231, 13, 55, NULL, 15, 'Elevated Glute Bridge Hold', '2 sets', 'duration', '30', NULL, 30, '2023-01-02 13:47:56'),
(232, 13, 183, NULL, 15, 'Reverse Plank with Leg Extensions', '2 sets', 'duration', '30', NULL, 30, '2023-01-02 13:47:56'),
(233, 13, 59, NULL, 20, 'Elevated Undulating Glute Bridge', '3 sets', 'duration', '30', NULL, 30, '2023-01-02 13:48:22'),
(234, 13, 72, NULL, 20, 'Glute Bridge with kicks ', '3 sets', 'duration', '30', NULL, 30, '2023-01-02 13:48:22'),
(235, 13, 58, NULL, 20, 'Elevated Glute Bridge with Leg Extensions', '3 sets', 'duration', '30 on each side', NULL, 30, '2023-01-02 13:48:22'),
(236, 13, 55, NULL, 20, 'Elevated Glute Bridge Hold', '3 sets', 'duration', '30', NULL, 30, '2023-01-02 13:48:22'),
(237, 13, 183, NULL, 20, 'Reverse Plank with Leg Extensions', '3 sets', 'duration', '30', NULL, 30, '2023-01-02 13:48:22'),
(238, 14, 226, NULL, 15, 'Sumo Squats with Rotational Reach', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:50:33'),
(239, 14, 202, NULL, 15, 'Skater Jumps with Balance', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:50:33'),
(240, 14, 156, NULL, 15, 'Plank with Front Reach Under', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 13:50:33'),
(241, 14, 111, NULL, 15, 'Knee to Elbow Push-Ups - Alternating', '1 set', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-01-02 13:50:33'),
(242, 14, 50, NULL, 15, 'Crossover Lunge - Contralateral', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:50:33'),
(243, 14, 226, NULL, 30, 'Sumo Squats with Rotational Reach', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:50:52'),
(244, 14, 202, NULL, 30, 'Skater Jumps with Balance', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:50:52'),
(245, 14, 156, NULL, 30, 'Plank with Front Reach Under', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 13:50:52'),
(246, 14, 111, NULL, 30, 'Knee to Elbow Push-Ups - Alternating', '2 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-01-02 13:50:52'),
(247, 14, 50, NULL, 30, 'Crossover Lunge - Contralateral', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:50:52'),
(248, 14, 226, NULL, 45, 'Sumo Squats with Rotational Reach', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:51:15'),
(249, 14, 202, NULL, 45, 'Skater Jumps with Balance', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:51:15'),
(250, 14, 156, NULL, 45, 'Plank with Front Reach Under', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 13:51:15'),
(251, 14, 111, NULL, 45, 'Knee to Elbow Push-Ups - Alternating', '3 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-01-02 13:51:15'),
(252, 14, 50, NULL, 45, 'Crossover Lunge - Contralateral', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:51:15'),
(253, 15, 95, NULL, 15, 'Hip Thrust with Spiral Reach', '1 set', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 13:53:22'),
(254, 15, 134, NULL, 15, 'Lunges with Spiral Reach', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:53:22'),
(255, 15, 201, NULL, 15, 'Skater Jumps', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:53:22'),
(256, 15, 194, NULL, 15, 'Scorpion Push-Ups', '1 set', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-01-02 13:53:22'),
(257, 15, 1, NULL, 15, '1 Arm Hip Thrust', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:53:22'),
(258, 15, 95, NULL, 30, 'Hip Thrust with Spiral Reach', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 13:53:49'),
(259, 15, 134, NULL, 30, 'Lunges with Spiral Reach', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:53:49'),
(260, 15, 201, NULL, 30, 'Skater Jumps', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:53:49'),
(261, 15, 94, NULL, 30, 'Scorpion Push-Ups', '2 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-01-02 13:53:49'),
(262, 15, 1, NULL, 30, '1 Arm Hip Thrust', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:53:49'),
(263, 15, 35, NULL, 45, 'Hip Thrust with Spiral Reach', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 13:54:08'),
(264, 15, 134, NULL, 45, 'Lunges with Spiral Reach', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:54:08'),
(265, 15, 201, NULL, 45, 'Skater Jumps', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:54:08'),
(266, 15, 94, NULL, 45, 'Scorpion Push-Ups', '3 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-01-02 13:54:08'),
(267, 15, 1, NULL, 45, '1 Arm Hip Thrust', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:54:08'),
(268, 16, 226, NULL, 15, 'Sumo Squats with Rotational Reach', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:58:48'),
(269, 16, 202, NULL, 15, 'Skater Jumps with Balance', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:58:48'),
(270, 16, 156, NULL, 15, 'Plank with Front Reach Under', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:58:48'),
(271, 16, 111, NULL, 15, 'Knee to Elbow Push-Ups - Alternating', '1 set', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 13:58:48'),
(272, 16, 50, NULL, 15, 'Crossover Lunge - Contralateral', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:58:48'),
(273, 16, 226, NULL, 30, 'Sumo Squats with Rotational Reach', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:59:07'),
(274, 16, 202, NULL, 30, 'Skater Jumps with Balance', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:59:07'),
(275, 16, 156, NULL, 30, 'Plank with Front Reach Under', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:59:07'),
(276, 16, 111, NULL, 30, 'Knee to Elbow Push-Ups - Alternating', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 13:59:07'),
(277, 16, 50, NULL, 30, 'Crossover Lunge - Contralateral', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:59:07'),
(278, 16, 226, NULL, 45, 'Sumo Squats with Rotational Reach', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:59:26'),
(279, 16, 202, NULL, 45, 'Skater Jumps with Balance', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:59:26'),
(280, 16, 156, NULL, 45, 'Plank with Front Reach Under', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 13:59:26'),
(281, 16, 111, NULL, 45, 'Knee to Elbow Push-Ups - Alternating', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 13:59:26'),
(282, 16, 50, NULL, 45, 'Crossover Lunge - Contralateral', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 13:59:26'),
(283, 17, 95, NULL, 15, 'Hip Thrust with Spiral Reach', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 14:02:34'),
(284, 17, 134, NULL, 15, 'Lunges with Spiral Reach', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:02:34'),
(285, 17, 201, NULL, 15, 'Skater Jumps', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:02:34'),
(286, 17, 194, NULL, 15, 'Scorpion Push-Ups', '1 set', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 14:02:34'),
(287, 17, 1, NULL, 15, '1 Arm Hip Thrust', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:02:34'),
(288, 17, 95, NULL, 30, 'Hip Thrust with Spiral Reach', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 14:02:51'),
(289, 17, 134, NULL, 30, 'Lunges with Spiral Reach', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:02:51'),
(290, 17, 201, NULL, 30, 'Skater Jumps', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:02:51'),
(291, 17, 194, NULL, 30, 'Scorpion Push-Ups', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 14:02:51'),
(292, 17, 1, NULL, 30, '1 Arm Hip Thrust', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:02:51'),
(293, 17, 95, NULL, 45, 'Hip Thrust with Spiral Reach', '3 sets', 'reps', NULL, '6 - 10 reps on each side ', 30, '2023-01-02 14:03:12'),
(294, 17, 134, NULL, 45, 'Lunges with Spiral Reach', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:03:12'),
(295, 17, 201, NULL, 45, 'Skater Jumps', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:03:12'),
(296, 17, 194, NULL, 45, 'Scorpion Push-Ups', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 14:03:12'),
(297, 17, 1, NULL, 45, '1 Arm Hip Thrust', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:03:12'),
(298, 18, 144, NULL, 15, 'Oscillating Sumo Squats with Figure 8', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 14:05:15'),
(299, 18, 203, NULL, 15, 'Skater Jumps with Balance and Toe Tap', '1 set', 'reps', NULL, '8 - 12 reps  on each side', 30, '2023-01-02 14:05:15'),
(300, 18, 155, NULL, 15, 'Plank with Front and Back Reach Under', '1 set', 'reps', NULL, '6 - 12 reps on each side', 30, '2023-01-02 14:05:15'),
(301, 18, 110, NULL, 15, 'Knee to Elbow Push-Ups', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:05:15'),
(302, 18, 51, NULL, 15, 'Crossover Lunge with Contralateral Suspension', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:05:15'),
(303, 18, 144, NULL, 30, 'Oscillating Sumo Squats with Figure 8', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 14:05:32'),
(304, 18, 203, NULL, 30, 'Skater Jumps with Balance and Toe Tap', '2 sets', 'reps', NULL, '8 - 12 reps  on each side', 30, '2023-01-02 14:05:32'),
(305, 18, 155, NULL, 30, 'Plank with Front and Back Reach Under', '2 sets', 'reps', NULL, '6 - 12 reps on each side', 30, '2023-01-02 14:05:32'),
(306, 18, 110, NULL, 30, 'Knee to Elbow Push-Ups', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:05:32'),
(307, 18, 51, NULL, 30, 'Crossover Lunge with Contralateral Suspension', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:05:32'),
(308, 18, 144, NULL, 45, 'Oscillating Sumo Squats with Figure 8', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 14:05:48'),
(309, 18, 203, NULL, 45, 'Skater Jumps with Balance and Toe Tap', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 14:05:48'),
(310, 18, 155, NULL, 45, 'Plank with Front and Back Reach Under', '3 sets', 'reps', NULL, '6 - 12 reps on each side', 30, '2023-01-02 14:05:49'),
(311, 18, 110, NULL, 45, 'Knee to Elbow Push-Ups', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:05:49'),
(312, 18, 51, NULL, 45, 'Crossover Lunge with Contralateral Suspension', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:05:49'),
(313, 19, 16, NULL, 15, '1 Leg Squat with Contralateral Reach', '1 set', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-01-02 14:07:43'),
(314, 19, 33, NULL, 15, 'Calf Raises with Torso Rotation', '1 set', 'reps', NULL, '5 - 8 reps on each side', 20, '2023-01-02 14:07:43'),
(315, 19, 205, NULL, 15, 'Skater Jumps with Toe Tap', '1 set', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-01-02 14:07:43'),
(316, 19, 193, NULL, 15, 'Scorpion Push Backs', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 14:07:43'),
(317, 19, 95, NULL, 15, 'Hip Thrust with Spiral Reach', '1 set', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 14:07:43'),
(318, 19, 16, NULL, 30, '1 Leg Squat with Contralateral Reach', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-01-02 14:07:59'),
(319, 19, 33, NULL, 30, 'Calf Raises with Torso Rotation', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 20, '2023-01-02 14:07:59'),
(320, 19, 205, NULL, 30, 'Skater Jumps with Toe Tap', '2 sets', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-01-02 14:07:59'),
(321, 19, 193, NULL, 30, 'Scorpion Push Backs', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 14:07:59'),
(322, 19, 95, NULL, 30, 'Hip Thrust with Spiral Reach', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 14:07:59'),
(323, 19, 16, NULL, 45, '1 Leg Squat with Contralateral Reach', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-01-02 14:08:15'),
(324, 19, 33, NULL, 45, 'Calf Raises with Torso Rotation', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 20, '2023-01-02 14:08:15'),
(325, 19, 205, NULL, 45, 'Skater Jumps with Toe Tap', '3 sets', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-01-02 14:08:15'),
(326, 19, 193, NULL, 45, 'Scorpion Push Backs', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 14:08:15'),
(327, 19, 95, NULL, 45, 'Hip Thrust with Spiral Reach', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-01-02 14:08:15'),
(328, 20, 144, NULL, 15, 'Oscillating Sumo Squats with Figure 8', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:10:00'),
(329, 20, 203, NULL, 15, 'Skater Jumps with Balance and Toe Tap', '1 set', 'reps', NULL, '10 - 15 reps  on each side', 30, '2023-01-02 14:10:00'),
(330, 20, 155, NULL, 15, 'Plank with Front and Back Reach Under', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 14:10:00'),
(331, 20, 110, NULL, 15, 'Knee to Elbow Push-Ups', '1 set', 'reps', NULL, '12 - 18 reps on each side', 30, '2023-01-02 14:10:00'),
(332, 20, 51, NULL, 15, 'Crossover Lunge with Contralateral Suspension', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:10:00'),
(333, 20, 144, NULL, 30, 'Oscillating Sumo Squats with Figure 8', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:10:18'),
(334, 20, 203, NULL, 30, 'Skater Jumps with Balance and Toe Tap', '2 sets', 'reps', NULL, '10 - 15  reps on each side', 30, '2023-01-02 14:10:18'),
(335, 20, 155, NULL, 30, 'Plank with Front and Back Reach Under', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 14:10:18'),
(336, 20, 110, NULL, 30, 'Knee to Elbow Push-Ups', '2 sets', 'reps', NULL, '12 - 18 reps on each side', 30, '2023-01-02 14:10:18'),
(337, 20, 51, NULL, 30, 'Crossover Lunge with Contralateral Suspension', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:10:18'),
(338, 20, 144, NULL, 45, 'Oscillating Sumo Squats with Figure 8', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:10:36'),
(339, 20, 203, NULL, 45, 'Skater Jumps with Balance and Toe Tap', '3 sets', 'reps', NULL, '10 - 15 reps  on each side', 30, '2023-01-02 14:10:36'),
(340, 20, 155, NULL, 45, 'Plank with Front and Back Reach Under', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-01-02 14:10:36'),
(341, 20, 110, NULL, 45, 'Knee to Elbow Push-Ups', '3 sets', 'reps', NULL, '12 - 18 reps on each side', 30, '2023-01-02 14:10:36'),
(342, 20, 51, NULL, 45, 'Crossover Lunge with Contralateral Suspension', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:10:36'),
(343, 21, 16, NULL, 15, '1 Leg Squat with Contralateral Reach', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:12:02'),
(344, 21, 33, NULL, 15, 'Calf Raises with Torso Rotation', '1 set', 'reps', NULL, '5 - 8 reps', 30, '2023-01-02 14:12:02'),
(345, 21, 205, NULL, 15, 'Skater Jumps with Toe Tap', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:12:02'),
(346, 21, 193, NULL, 15, 'Scorpion Push Backs', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 14:12:02'),
(347, 21, 95, NULL, 15, 'Hip Thrust with Spiral Reach', '1 set', 'reps', NULL, '5 - 7 reps on each side', 30, '2023-01-02 14:12:02'),
(348, 21, 16, NULL, 30, '1 Leg Squat with Contralateral Reach', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:12:20'),
(349, 21, 33, NULL, 30, 'Calf Raises with Torso Reach', '2 sets', 'reps', NULL, '5 - 8 reps', 30, '2023-01-02 14:12:20'),
(350, 21, 205, NULL, 30, 'Skater Jumps with Toe Tap', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:12:20'),
(351, 21, 193, NULL, 30, 'Scorpion Push Backs', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 14:12:20'),
(352, 21, 51, NULL, 30, 'Hip Thrust with Spiral Reach', '2 sets', 'reps', NULL, '5 - 7 reps on each side', 30, '2023-01-02 14:12:20'),
(353, 21, 16, NULL, 45, '1 Leg Squat with Contralateral Reach', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:12:42'),
(354, 21, 33, NULL, 45, 'Calf Raises with Torso Reach', '3 sets', 'reps', NULL, '5 - 8 reps', 30, '2023-01-02 14:12:42'),
(355, 21, 205, NULL, 45, 'Skater Jumps with Toe Tap', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-01-02 14:12:42'),
(356, 21, 193, NULL, 45, 'Scorpion Push Backs', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 14:12:42'),
(357, 21, 51, NULL, 45, 'Hip Thrust with Spiral Reach', '3 sets', 'reps', NULL, '5 - 7 reps on each side', 30, '2023-01-02 14:12:42'),
(403, 22, 197, NULL, 20, 'Side Lunges - Suspended', '1 set', 'reps', NULL, '10 reps  on each side', 20, '2023-01-02 18:18:01'),
(404, 22, 122, NULL, 20, 'Laterals', '1 set', 'reps', NULL, '10 reps  on each side', 30, '2023-01-02 18:18:01'),
(405, 22, 153, NULL, 20, 'Plank to Side Plank', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-02 18:18:01'),
(406, 22, 201, NULL, 20, 'Skater Jumps', '1 set', 'reps', NULL, '10 - 12 reps  on each side', 30, '2023-01-02 18:18:01'),
(407, 22, 15, NULL, 20, '1 Leg Squat', '1 set', 'reps', NULL, '8 - 12 reps  on each side', 30, '2023-01-02 18:18:01'),
(408, 22, 2, NULL, 20, '1 Arm Plank', '1 set ', 'duration', '30 on each side', NULL, 30, '2023-01-02 18:18:01'),
(409, 22, 30, NULL, 20, 'Calf Raises - Wall Assisted', '1 set', 'reps', NULL, '10 - 15 reps ', 30, '2023-01-02 18:18:01'),
(445, 23, 197, NULL, 40, 'Side Lunges - Suspended', '1 set', 'reps', NULL, '10 reps  on each side', 20, '2023-01-13 07:31:41'),
(446, 23, 122, NULL, 40, 'Laterals', '2 sets', 'reps', NULL, '10 reps  on each side', 30, '2023-01-13 07:31:41'),
(447, 23, 153, NULL, 40, 'Plank to Side Plank', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-13 07:31:41'),
(448, 23, 201, NULL, 40, 'Skater Jumps', '2 sets', 'reps', NULL, '10 - 12 reps  on each side', 30, '2023-01-13 07:31:41'),
(449, 23, 15, NULL, 40, '1 Leg Squat', '2 sets', 'reps', NULL, '8 - 12 reps  on each side', 30, '2023-01-13 07:31:41'),
(450, 23, 201, NULL, 40, '1 Arm Plank', '2 sets', 'duration', '30 on each side', NULL, 30, '2023-01-13 07:31:41'),
(451, 23, 30, NULL, 40, 'Calf Raises - Wall Assisted', '2 sets', 'reps', NULL, '10 - 15 reps ', 30, '2023-01-13 07:31:41'),
(452, 22, 197, NULL, 60, 'Side Lunges - Suspended', '1 set', 'reps', NULL, '10 on each side', 20, '2023-01-13 07:32:38'),
(453, 22, 122, NULL, 60, 'Laterals', '3 sets', 'reps', NULL, '10 on each side', 30, '2023-01-13 07:32:38'),
(454, 22, 153, NULL, 60, 'Plank to Side Plank', '3 sets', 'reps', NULL, '6 - 10 on each side', 30, '2023-01-13 07:32:38'),
(455, 22, 201, NULL, 60, 'Skater Jumps', '3 sets', 'reps', NULL, '10 - 12 on each side', 30, '2023-01-13 07:32:38'),
(456, 22, 15, NULL, 60, '1 Leg Squat', '3 sets', 'reps', NULL, '8 - 12 on each side', 30, '2023-01-13 07:32:38'),
(457, 22, 2, NULL, 60, '1 Arm Plank', '3 sets', 'duration', '30 on each side', NULL, 30, '2023-01-13 07:32:38'),
(458, 22, 30, NULL, 60, 'Calf Raises - Wall Assisted', '3 sets', 'reps', NULL, '10 - 15', 30, '2023-01-13 07:32:38'),
(459, 22, 197, NULL, 40, 'Side Lunges - Suspended', '1 set', 'reps', NULL, '10 reps  on each side', 20, '2023-01-13 07:36:32'),
(460, 22, 122, NULL, 40, 'Laterals', '2 sets', 'reps', NULL, '10 reps  on each side', 30, '2023-01-13 07:36:32'),
(461, 22, 153, NULL, 40, 'Plank to Side Plank', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-01-13 07:36:32'),
(462, 22, 201, NULL, 40, 'Skater Jumps', '2 sets', 'reps', NULL, '10 - 12 reps  on each side', 30, '2023-01-13 07:36:32'),
(463, 22, 15, NULL, 40, '1 Leg Squat', '2 sets', 'reps', NULL, '8 - 12 reps  on each side', 30, '2023-01-13 07:36:32'),
(464, 22, 201, NULL, 40, '1 Arm Plank', '2 sets', 'duration', '30 on each side', NULL, 30, '2023-01-13 07:36:32'),
(465, 22, 30, NULL, 40, 'Calf Raises - Wall Assisted', '2 sets', 'reps', NULL, '10 - 15 reps ', 30, '2023-01-13 07:36:32'),
(466, 23, 123, NULL, 20, 'Laterals with Balance', '1 set', 'reps', NULL, '6 -10 reps  on each side', 20, '2023-02-08 08:02:53'),
(467, 23, 202, NULL, 20, 'Skater Jumps with Balance', '1 set', 'reps', NULL, '6 -10 reps  on each side', 30, '2023-02-08 08:02:53'),
(468, 23, 172, NULL, 20, 'Push-Ups to Staggered Side Plank', '1 set', 'reps', NULL, '5 - 8 reps  on each side', 30, '2023-02-08 08:02:53'),
(469, 23, 205, NULL, 20, 'skater Jumps with Toe Tap', '1 set', 'reps', NULL, '10 - 12 reps  on each side', 30, '2023-02-08 08:02:53'),
(470, 23, 5, NULL, 20, '1 Leg Deadlift', '1 set', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 08:02:53'),
(471, 23, 159, NULL, 20, 'Plank with side Reach Under', '1 set ', 'reps', NULL, '8 - 12 reps  on each side', 30, '2023-02-08 08:02:53'),
(472, 23, 28, NULL, 20, 'Calf Raises ', '1 set', 'reps', NULL, '10 - 15 reps ', 30, '2023-02-08 08:02:53'),
(473, 23, 123, NULL, 60, 'Laterals with Balance', '1 set', 'reps', NULL, '6 -10 reps  on each side', 20, '2023-02-08 08:05:07'),
(474, 23, 202, NULL, 60, 'Skater Jumps with Balance', '3 sets', 'reps', NULL, '6 -10 reps  on each side', 30, '2023-02-08 08:05:07'),
(475, 23, 172, NULL, 60, 'Push-Ups to Staggered Side Plank', '3 sets', 'reps', NULL, '5 - 8 reps  on each side', 30, '2023-02-08 08:05:07'),
(476, 23, 205, NULL, 60, 'skater Jumps with Toe Tap', '3 sets', 'reps', NULL, '10 - 12 reps  on each side', 30, '2023-02-08 08:05:07'),
(477, 23, 5, NULL, 60, '1 Leg Deadlift', '3 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 08:05:07'),
(478, 23, 159, NULL, 60, 'Plank with side Reach Under', '3 sets', 'reps', NULL, '8 - 12 reps  on each side', 30, '2023-02-08 08:05:07'),
(479, 23, 28, NULL, 60, 'Calf Raises ', '3 sets', 'reps', NULL, '10 - 15 reps ', 30, '2023-02-08 08:05:07'),
(480, 24, 124, NULL, 20, 'Laterals with Leg Raise', '1 set', 'reps', NULL, '6 -10 reps  on each side', 30, '2023-02-08 08:07:39'),
(481, 24, 203, NULL, 20, 'Skater Jumps with Balance and Toe Tap', '1 set', 'reps', NULL, '6 -10 reps  on each side', 30, '2023-02-08 08:07:39'),
(482, 24, 170, NULL, 20, 'Push-Ups to Parallel Side Plank', '1 set', 'reps', NULL, '5 - 8 reps  on each side', 30, '2023-02-08 08:07:39'),
(483, 24, 127, NULL, 20, 'Leg Swings - Bent Knee', '1 set', 'reps', NULL, '10 - 15 reps  on each side', 30, '2023-02-08 08:07:39'),
(484, 24, 13, NULL, 20, '1 Leg Reaching squats', '1 set', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 08:07:39'),
(485, 24, 155, NULL, 20, 'Plank with Front and Back Reach Under', '1 set ', 'reps', NULL, '6  - 10 reps  on each side', 30, '2023-02-08 08:07:39'),
(486, 24, 32, NULL, 20, 'Calf Raises with Head Rotation', '1 set', 'reps', NULL, '10 - 14 reps  on each side', 30, '2023-02-08 08:07:39'),
(487, 24, 124, NULL, 40, 'Laterals with Leg Raise', '1 set', 'reps', NULL, '6 -10 reps  on each side', 30, '2023-02-08 08:07:58'),
(488, 24, 203, NULL, 40, 'Skater Jumps with Balance and Toe Tap', '2 sets', 'reps', NULL, '6 -10 reps  on each side', 30, '2023-02-08 08:07:58'),
(489, 24, 170, NULL, 40, 'Push-Ups to Parallel Side Plank', '2 sets', 'reps', NULL, '5 - 8 reps  on each side', 30, '2023-02-08 08:07:58'),
(490, 24, 127, NULL, 40, 'Leg Swings - Bent Knee', '2 sets', 'reps', NULL, '10 - 15 reps  on each side', 30, '2023-02-08 08:07:58'),
(491, 24, 13, NULL, 40, '1 Leg Reaching squats', '2 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 08:07:58');
INSERT INTO `exercise_workout` (`id`, `workout_id`, `exercise_id`, `category_id`, `duration`, `variation_name`, `sets`, `based_on`, `ex_duration`, `ex_reps`, `rest_duration`, `created_at`) VALUES
(492, 24, 155, NULL, 40, 'Plank with Front and Back Reach Under', '2 sets', 'reps', NULL, '6  - 10 reps  on each side', 30, '2023-02-08 08:07:58'),
(493, 24, 32, NULL, 40, 'Calf Raises with Head Rotation', '2 sets', 'reps', NULL, '10 - 14 reps ', 30, '2023-02-08 08:07:58'),
(494, 24, 124, NULL, 60, 'Laterals with Leg Raise', '1 set', 'reps', NULL, '6 -10 reps  on each side', 30, '2023-02-08 08:08:17'),
(495, 24, 203, NULL, 60, 'Skater Jumps with Balance and Toe Tap', '3 sets', 'reps', NULL, '6 -10 reps  on each side', 30, '2023-02-08 08:08:17'),
(496, 24, 170, NULL, 60, 'Push-Ups to Parallel Side Plank', '3 sets', 'reps', NULL, '5 - 8 reps  on each side', 30, '2023-02-08 08:08:17'),
(497, 24, 127, NULL, 60, 'Leg Swings - Bent Knee', '3 sets', 'reps', NULL, '10 - 15 reps  on each side', 30, '2023-02-08 08:08:17'),
(498, 24, 13, NULL, 60, '1 Leg Reaching squats', '3 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 08:08:17'),
(499, 24, 155, NULL, 60, 'Plank with Front and Back Reach Under', '3 sets', 'reps', NULL, '6  - 10 reps  on each side', 30, '2023-02-08 08:08:17'),
(500, 24, 32, NULL, 60, 'Calf Raises with Head Rotation', '3 sets', 'reps', NULL, '10 - 14 reps ', 30, '2023-02-08 08:08:17'),
(501, 25, 125, NULL, 20, 'Laterals with Upward Tilt', '1 set', 'reps', NULL, '6 -10 reps  on each side', 20, '2023-02-08 09:58:03'),
(502, 25, 206, NULL, 20, 'Skater Jumps with Triple Toe Tap', '1 set', 'reps', NULL, '6 -10 reps  on each side', 30, '2023-02-08 09:58:03'),
(503, 25, 171, NULL, 20, 'Push-Ups to Side Plank with Leg Lift', '1 set', 'reps', NULL, '5 - 8 reps  on each side', 30, '2023-02-08 09:58:03'),
(504, 25, 132, NULL, 20, 'Lunges to High Kicks', '1 set', 'reps', NULL, '10 - 15 reps  on each side', 30, '2023-02-08 09:58:03'),
(505, 25, 14, NULL, 20, '1 Leg Reaching squats - Contralateral', '1 set', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 09:58:03'),
(506, 25, 25, NULL, 20, 'Bird Dog Plank (1 Leg, 1 Arm)', '1 set', 'duration', '60 on each side', NULL, 30, '2023-02-08 09:58:03'),
(507, 25, 33, NULL, 20, 'Calf Raises with Torso Rotation', '1 set', 'reps', NULL, '10 - 14 reps ', 30, '2023-02-08 09:58:03'),
(508, 25, 125, NULL, 40, 'Laterals with Upward Tilt', '1 set', 'reps', NULL, '6 -10 reps  on each side', 20, '2023-02-08 09:58:20'),
(509, 25, 206, NULL, 40, 'Skater Jumps with Triple Toe Tap', '2 sets', 'reps', NULL, '6 -10 reps  on each side', 30, '2023-02-08 09:58:20'),
(510, 25, 171, NULL, 40, 'Push-Ups to Side Plank with Leg Lift', '2 sets', 'reps', NULL, '5 - 8 reps  on each side', 30, '2023-02-08 09:58:20'),
(511, 25, 132, NULL, 40, 'Lunges to High Kicks', '2 sets', 'reps', NULL, '10 - 15 reps  on each side', 30, '2023-02-08 09:58:20'),
(512, 25, 14, NULL, 40, '1 Leg Reaching squats - Contralateral', '2 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 09:58:20'),
(513, 25, 25, NULL, 40, 'Bird Dog Plank (1 Leg, 1 Arm)', '2 sets', 'duration', '60 on each side', NULL, 30, '2023-02-08 09:58:20'),
(514, 25, 33, NULL, 40, 'Calf Raises with Torso Rotation', '2 sets', 'reps', NULL, '10 - 14 reps ', 30, '2023-02-08 09:58:20'),
(515, 25, 125, NULL, 60, 'Laterals with Upward Tilt', '1 set', 'reps', NULL, '6 -10 reps on each side', 20, '2023-02-08 09:58:39'),
(516, 25, 206, NULL, 60, 'Skater Jumps with Triple Toe Tap', '3 sets', 'reps', NULL, '6 -10 reps on each side', 30, '2023-02-08 09:58:39'),
(517, 25, 171, NULL, 60, 'Push-Ups to Side Plank with Leg Lift', '3 sets', 'reps', NULL, '5 - 8 reps  on each side', 30, '2023-02-08 09:58:39'),
(518, 25, 132, NULL, 60, 'Lunges to High Kicks', '3 sets', 'reps', NULL, '10 - 15 reps  on each side', 30, '2023-02-08 09:58:39'),
(519, 25, 14, NULL, 60, '1 Leg Reaching squats - Contralateral', '3 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 09:58:39'),
(520, 25, 25, NULL, 60, 'Bird Dog Plank (1 Leg, 1 Arm)', '3 sets', 'duration', '60 on each side', NULL, 30, '2023-02-08 09:58:39'),
(521, 25, 33, NULL, 60, 'Calf Raises with Torso Rotation', '3 sets', 'reps', NULL, '10 - 14 reps ', 30, '2023-02-08 09:58:39'),
(522, 26, 248, NULL, 7, 'Windshield Wipers - Bent Knees', '1 set', 'duration', '20', NULL, 20, '2023-02-08 09:59:59'),
(523, 26, 248, NULL, 7, 'Hollow Body Hold', '1 set', 'duration', '20', NULL, 30, '2023-02-08 09:59:59'),
(524, 26, 198, NULL, 7, 'Side Plank Hip Dips', '1 set', 'duration', '20 on each side', NULL, 30, '2023-02-08 09:59:59'),
(525, 26, 150, NULL, 7, 'Plank - Hands', '1 set', 'duration', '20', NULL, 30, '2023-02-08 09:59:59'),
(526, 26, 236, NULL, 7, 'Twist Crunches', '1 set', 'duration', '20', NULL, 30, '2023-02-08 09:59:59'),
(527, 27, 36, NULL, 7, 'Circular Plank with Undulation', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:00:58'),
(528, 27, 96, NULL, 7, 'Hollow Body Hold', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:00:58'),
(529, 27, 198, NULL, 7, 'Side Plank Hip Dips', '1 set', 'duration', '30 on each side', NULL, 30, '2023-02-08 10:00:58'),
(530, 27, 195, NULL, 7, 'Shoulder Taps', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:00:58'),
(531, 27, 24, NULL, 7, 'Bicycle Crunch', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:00:58'),
(532, 28, 36, NULL, 7, 'Circular Plank with Undulation', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:01:55'),
(533, 28, 96, NULL, 7, 'Hollow Body Hold', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:01:55'),
(534, 28, 198, NULL, 7, 'Side Plank Hip Dips', '1 set', 'duration', '30 on each side', NULL, 30, '2023-02-08 10:01:55'),
(535, 28, 195, NULL, 7, 'Shoulder Taps', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:01:55'),
(536, 28, 24, NULL, 7, 'Bicycle Crunch', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:01:55'),
(537, 29, 248, NULL, 7, 'Windshield Wipers - Bent knees', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:03:06'),
(538, 29, 99, NULL, 7, 'Hollow Body Hold with Kicks', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:03:06'),
(539, 29, 99, NULL, 7, 'Plank with Side Reach Under', '1 set', 'duration', '30 on each side', NULL, 30, '2023-02-08 10:03:06'),
(540, 29, 137, NULL, 7, 'Mountain Climber', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:03:06'),
(541, 29, 24, NULL, 7, 'Bicycle Crunch', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:03:06'),
(542, 30, 247, NULL, 7, 'Windshield Wipers ', '1 set', 'duration', '40', NULL, 30, '2023-02-08 10:04:06'),
(543, 30, 97, NULL, 7, 'Hollow Body Hold with Full Scissors', '1 set', 'duration', '40', NULL, 30, '2023-02-08 10:04:06'),
(544, 30, 199, NULL, 7, 'Side Plank with Leg Lift', '1 set', 'duration', '40 on each side', NULL, 30, '2023-02-08 10:04:06'),
(545, 30, 138, NULL, 7, 'Mountain Climber - Cross Body', '1 set', 'duration', '40', NULL, 30, '2023-02-08 10:04:06'),
(546, 30, 186, NULL, 7, 'Russian Twist', '1 set', 'duration', '40', NULL, 30, '2023-02-08 10:04:06'),
(547, 31, 248, NULL, 10, 'Windshield Wipers  - Bent Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 10:07:29'),
(548, 31, 73, NULL, 10, 'Good Mornings', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 10:07:29'),
(549, 31, 160, NULL, 10, 'Pulling Hands', '1 set', 'duration', '30', NULL, 30, '2023-02-08 10:07:29'),
(550, 31, 228, NULL, 10, 'Superman - Arms Only', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:07:29'),
(551, 31, 184, NULL, 10, 'Reverse Tabletop', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:07:29'),
(552, 31, 211, NULL, 10, 'Snow Angels', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:07:29'),
(553, 31, 248, NULL, 20, 'Windshield Wipers  - Bent Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 10:07:47'),
(554, 31, 73, NULL, 20, 'Good Mornings', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 10:07:47'),
(555, 31, 160, NULL, 20, 'Pulling Hands', '2 sets', 'duration', '30', NULL, 30, '2023-02-08 10:07:47'),
(556, 31, 228, NULL, 20, 'Superman - Arms Only', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:07:47'),
(557, 31, 184, NULL, 20, 'Reverse Tabletop', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:07:47'),
(558, 31, 211, NULL, 20, 'Snow Angels', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:07:47'),
(559, 31, 248, NULL, 30, 'Windshield Wipers  - Bent Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 10:08:32'),
(560, 31, 73, NULL, 30, 'Good Mornings', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 10:08:32'),
(561, 31, 160, NULL, 30, 'Pulling Hands', '3 sets', 'duration', '30', NULL, 30, '2023-02-08 10:08:32'),
(562, 31, 228, NULL, 30, 'Superman - Arms Only', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:08:32'),
(563, 31, 184, NULL, 30, 'Reverse Tabletop', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:08:32'),
(564, 31, 211, NULL, 30, 'Snow Angels', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:08:32'),
(565, 32, 248, NULL, 10, 'Windshield Wipers  - Bent Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 10:10:27'),
(566, 32, 74, NULL, 10, 'Good Mornings with Twist', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 10:10:27'),
(567, 32, 161, NULL, 10, 'Pulling Hands with Lateral Shift', '1 set', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-08 10:10:27'),
(568, 32, 227, NULL, 10, 'Superman ', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:10:27'),
(569, 32, 182, NULL, 10, 'Reverse Plank (Purvottanasana)', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:10:27'),
(570, 32, 212, NULL, 10, 'Snow Angels - Bent Over', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:10:27'),
(571, 32, 248, NULL, 20, 'Windshield Wipers  - Bent Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 10:10:50'),
(572, 32, 74, NULL, 20, 'Good Mornings with Twist', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 10:10:50'),
(573, 32, 161, NULL, 20, 'Pulling Hands with Lateral Shift', '2 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-08 10:10:50'),
(574, 32, 227, NULL, 20, 'Superman ', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:10:50'),
(575, 32, 182, NULL, 20, 'Reverse Plank (Purvottanasana)', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:10:50'),
(576, 32, 212, NULL, 20, 'Snow Angels - Bent Over', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:10:50'),
(577, 32, 248, NULL, 30, 'Windshield Wipers  - Bent Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 10:11:08'),
(578, 32, 74, NULL, 30, 'Good Mornings with Twist', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 10:11:08'),
(579, 32, 161, NULL, 30, 'Pulling Hands with Lateral Shift', '3 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-08 10:11:08'),
(580, 32, 227, NULL, 30, 'Superman ', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:11:08'),
(581, 32, 182, NULL, 30, 'Reverse Plank (Purvottanasana)', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:11:08'),
(582, 32, 212, NULL, 30, 'Snow Angels - Bent Over', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 10:11:08'),
(583, 33, 248, NULL, 10, 'Windshield Wipers  - Bent Knees', '1 set', 'reps', NULL, '5 - 8 reps on each side', 20, '2023-02-08 10:12:58'),
(584, 33, 223, NULL, 10, 'Standing Torso Twist', '1 set', 'reps', NULL, '5 - 8 reps  on each side', 20, '2023-02-08 10:12:58'),
(585, 33, 1, NULL, 10, '1 Arm Hip Thrust', '1 set', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 10:12:58'),
(586, 33, 230, NULL, 10, 'Superman - Laterals', '1 set', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 10:12:58'),
(587, 33, 235, NULL, 10, 'Towel Row', '1 set', 'reps', NULL, '8 - 12 reps ', 45, '2023-02-08 10:12:58'),
(588, 33, 185, NULL, 10, 'Reverse Tabletop with Leg Extensions', '1 set', 'reps', NULL, '8 - 12 reps  on each side', 40, '2023-02-08 10:12:58'),
(589, 33, 5, NULL, 10, '1 Leg Deadlift', '1 set', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 10:12:58'),
(590, 33, 248, NULL, 20, 'Windshield Wipers  - Bent Knees', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 20, '2023-02-08 10:13:18'),
(591, 33, 223, NULL, 20, 'Standing Torso Twist', '2 sets', 'reps', NULL, '5 - 8 reps  on each side', 20, '2023-02-08 10:13:18'),
(592, 33, 1, NULL, 20, '1 Arm Hip Thrust', '2 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 10:13:18'),
(593, 33, 230, NULL, 20, 'Superman - Laterals', '2 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 10:13:18'),
(594, 33, 235, NULL, 20, 'Towel Row', '2 sets', 'reps', NULL, '8 - 12 reps ', 45, '2023-02-08 10:13:18'),
(595, 33, 185, NULL, 20, 'Reverse Tabletop with Leg Extensions', '2 sets', 'reps', NULL, '8 - 12 reps  on each side', 40, '2023-02-08 10:13:18'),
(596, 33, 5, NULL, 20, '1 Leg Deadlift', '2 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 10:13:18'),
(597, 33, 248, NULL, 30, 'Windshield Wipers  - Bent Knees', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 20, '2023-02-08 10:13:37'),
(598, 33, 223, NULL, 30, 'Standing Torso Twist', '3 sets', 'reps', NULL, '5 - 8 reps  on each side', 20, '2023-02-08 10:13:37'),
(599, 33, 1, NULL, 30, '1 Arm Hip Thrust', '3 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 10:13:37'),
(600, 33, 230, NULL, 30, 'Superman - Laterals', '3 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 10:13:37'),
(601, 33, 235, NULL, 30, 'Towel Row', '3 sets', 'reps', NULL, '8 - 12 reps ', 45, '2023-02-08 10:13:37'),
(602, 33, 185, NULL, 30, 'Reverse Tabletop with Leg Extensions', '3 sets', 'reps', NULL, '8 - 12 reps  on each side', 40, '2023-02-08 10:13:37'),
(603, 33, 5, NULL, 30, '1 Leg Deadlift', '3 sets', 'reps', NULL, '6 - 10 reps  on each side', 30, '2023-02-08 10:13:37'),
(604, 34, 36, NULL, 10, 'Circular Plank with Undulation', '1 set', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 10:16:42'),
(605, 34, 74, NULL, 10, 'Good Mornings with Twist', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-02-08 10:16:42'),
(606, 34, 95, NULL, 10, 'Hip Thrust with Spiral Reach', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 10:16:42'),
(607, 34, 231, NULL, 10, 'Superman - Prisoner Laterals', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 10:16:42'),
(608, 34, 23, NULL, 10, 'Bent Over Underhand Towel Row', '1 set', 'reps', NULL, '10 - 15 reps ', 40, '2023-02-08 10:16:42'),
(609, 34, 183, NULL, 10, 'Reverse Plank with Leg Extensions', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 10:16:42'),
(610, 34, 19, NULL, 10, 'Back Widows', '1 set', 'reps', NULL, '6 - 10 reps ', 40, '2023-02-08 10:16:42'),
(611, 34, 36, NULL, 20, 'Circular Plank with Undulation', '1 set', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 10:17:04'),
(612, 34, 74, NULL, 20, 'Good Mornings with Twist', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-02-08 10:17:04'),
(613, 34, 95, NULL, 20, 'Hip Thrust with Spiral Reach', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 10:17:04'),
(614, 34, 231, NULL, 20, 'Superman - Prisoner Laterals', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 10:17:04'),
(615, 34, 23, NULL, 20, 'Bent Over Underhand Towel Row', '2 sets', 'reps', NULL, '10 - 15 reps ', 40, '2023-02-08 10:17:04'),
(616, 34, 183, NULL, 20, 'Reverse Plank with Leg Extensions', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 10:17:04'),
(617, 34, 19, NULL, 20, 'Back Widows', '2 sets', 'reps', NULL, '6 - 10 reps ', 40, '2023-02-08 10:17:04'),
(618, 34, 36, NULL, 30, 'Circular Plank with Undulation', '1 set', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 10:17:22'),
(619, 34, 74, NULL, 30, 'Good Mornings with Twist', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-02-08 10:17:22'),
(620, 34, 95, NULL, 30, 'Hip Thrust with Spiral Reach', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 10:17:23'),
(621, 34, 231, NULL, 30, 'Superman - Prisoner Laterals', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 10:17:23'),
(622, 34, 23, NULL, 30, 'Bent Over Underhand Towel Row', '3 sets', 'reps', NULL, '10 - 15 reps ', 40, '2023-02-08 10:17:23'),
(623, 34, 183, NULL, 30, 'Reverse Plank with Leg Extensions', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 10:17:23'),
(624, 34, 19, NULL, 30, 'Back Widows', '3 sets', 'reps', NULL, '6 - 10 reps ', 40, '2023-02-08 10:17:23'),
(625, 35, 247, NULL, 10, 'Windshield Wipers', '1 set', 'reps', NULL, '6 - 10 reps on each side', 15, '2023-02-08 10:19:01'),
(626, 35, 233, NULL, 10, 'Torso Twist with Isometric Towel Pull', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-02-08 10:19:01'),
(627, 35, 95, NULL, 10, 'Hip Thrust with Spiral Reach', '1 set', 'reps', NULL, '6 - 10 reps on each side', 40, '2023-02-08 10:19:01'),
(628, 35, 231, NULL, 10, 'Superman - Prisoner Laterals', '1 set', 'reps', NULL, '6 - 10 reps on each side', 40, '2023-02-08 10:19:01'),
(629, 35, 4, NULL, 10, '1 Leg Bent Over Towel Row', '1 set', 'reps', NULL, '10 - 15 reps ', 40, '2023-02-08 10:19:01'),
(630, 35, 183, NULL, 10, 'Reverse Plank with Leg Extensions', '1 set', 'reps', NULL, '6 - 10 reps on each side', 40, '2023-02-08 10:19:01'),
(631, 35, 6, NULL, 10, '1 Leg Deadlift with Isometric Towel Pull', '1 set', 'reps', NULL, '6 - 15 reps ', 40, '2023-02-08 10:19:01'),
(632, 35, 247, NULL, 20, 'Windshield Wipers', '1 set', 'reps', NULL, '6 - 10 reps on each side', 15, '2023-02-08 10:19:20'),
(633, 35, 233, NULL, 20, 'Torso Twist with Isometric Towel Pull', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-02-08 10:19:20'),
(634, 35, 95, NULL, 20, 'Hip Thrust with Spiral Reach', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 40, '2023-02-08 10:19:20'),
(635, 35, 231, NULL, 20, 'Superman - Prisoner Laterals', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 40, '2023-02-08 10:19:20'),
(636, 35, 4, NULL, 20, '1 Leg Bent Over Towel Row', '2 sets', 'reps', NULL, '10 - 15 reps ', 40, '2023-02-08 10:19:20'),
(637, 35, 183, NULL, 20, 'Reverse Plank with Leg Extensions', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 40, '2023-02-08 10:19:20'),
(638, 35, 6, NULL, 20, '1 Leg Deadlift with Isometric Towel Pull', '2 sets', 'reps', NULL, '6 - 15 reps ', 40, '2023-02-08 10:19:20'),
(639, 35, 247, NULL, 30, 'Windshield Wipers', '1 set', 'reps', NULL, '6 - 10 reps on each side', 15, '2023-02-08 10:19:48'),
(640, 35, 233, NULL, 30, 'Torso Twist with Isometric Towel Pull', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-02-08 10:19:48'),
(641, 35, 95, NULL, 30, 'Hip Thrust with Spiral Reach', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 40, '2023-02-08 10:19:48'),
(642, 35, 231, NULL, 30, 'Superman - Prisoner Laterals', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 40, '2023-02-08 10:19:48'),
(643, 35, 4, NULL, 30, '1 Leg Bent Over Towel Row', '3 sets', 'reps', NULL, '10 - 15 reps ', 40, '2023-02-08 10:19:48'),
(644, 35, 183, NULL, 30, 'Reverse Plank with Leg Extensions', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 40, '2023-02-08 10:19:48'),
(645, 35, 6, NULL, 30, '1 Leg Deadlift with Isometric Towel Pull', '3 sets', 'reps', NULL, '6 - 15 reps ', 40, '2023-02-08 10:19:48'),
(646, 41, 218, NULL, 10, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:21:56'),
(647, 41, 131, NULL, 10, 'Lunges', '1 set', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-02-08 11:21:56'),
(648, 41, 225, NULL, 10, 'Sumo Squats', '1 set', 'reps', NULL, '15 - 18 reps', 20, '2023-02-08 11:21:56'),
(649, 41, 103, NULL, 10, 'Jump Squats', '1 set', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:21:56'),
(650, 41, 232, NULL, 10, 'Surfer Squats', '1 set', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-02-08 11:21:56'),
(651, 41, 237, NULL, 10, 'Undulating Glute Bridge', '1 set', 'reps', NULL, '4 - 7 reps', 20, '2023-02-08 11:21:56'),
(652, 41, 30, NULL, 10, 'Calf Raises - Wall Assisted', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:21:56'),
(653, 41, 218, NULL, 20, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:22:40'),
(654, 41, 131, NULL, 20, 'Lunges', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-02-08 11:22:40'),
(655, 41, 225, NULL, 20, 'Sumo Squats', '2 sets', 'reps', NULL, '15 - 18 reps', 20, '2023-02-08 11:22:40'),
(656, 41, 103, NULL, 20, 'Jump Squats', '2 sets', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:22:40'),
(657, 41, 232, NULL, 20, 'Surfer Squats', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-02-08 11:22:40'),
(658, 41, 237, NULL, 20, 'Undulating Glute Bridge', '2 sets', 'reps', NULL, '4 - 7 reps', 20, '2023-02-08 11:22:40'),
(659, 41, 30, NULL, 20, 'Calf Raises - Wall Assisted', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:22:40'),
(660, 41, 218, NULL, 30, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:23:01'),
(661, 41, 131, NULL, 30, 'Lunges', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 30, '2023-02-08 11:23:01'),
(662, 41, 225, NULL, 30, 'Sumo Squats', '3 sets', 'reps', NULL, '15 - 18 reps', 20, '2023-02-08 11:23:01'),
(663, 41, 103, NULL, 30, 'Jump Squats', '3 sets', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:23:01'),
(664, 41, 232, NULL, 30, 'Surfer Squats', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-02-08 11:23:01'),
(665, 41, 237, NULL, 30, 'Undulating Glute Bridge', '3 sets', 'reps', NULL, '4 - 7 reps', 20, '2023-02-08 11:23:01'),
(666, 41, 30, NULL, 30, 'Calf Raises - Wall Assisted', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:23:01'),
(667, 42, 218, NULL, 10, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:25:03'),
(668, 42, 18, NULL, 10, 'Back Lunges', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:25:03'),
(669, 42, 217, NULL, 10, 'Squat to Good Morning', '1 set', 'reps', NULL, '8 - 12 reps', 20, '2023-02-08 11:25:03'),
(670, 42, 105, NULL, 10, 'Jump Squats - Crystal ball', '1 set', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:25:03'),
(671, 42, 46, NULL, 10, 'Cossack Squats - Chair Assisted', '1 set', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-02-08 11:25:03'),
(672, 42, 69, NULL, 10, 'Glute Bridge - Reps', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:25:03'),
(673, 42, 28, NULL, 10, 'Calf Raises', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:25:03'),
(674, 42, 218, NULL, 20, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:25:22'),
(675, 42, 18, NULL, 20, 'Back Lunges', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:25:22'),
(676, 42, 217, NULL, 20, 'Squat to Good Morning', '2 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-08 11:25:22'),
(677, 42, 105, NULL, 20, 'Jump Squats - Crystal ball', '2 sets', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:25:22'),
(678, 42, 46, NULL, 20, 'Cossack Squats - Chair Assisted', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-02-08 11:25:22'),
(679, 42, 69, NULL, 20, 'Glute Bridge - Reps', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:25:22'),
(680, 42, 28, NULL, 20, 'Calf Raises', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:25:22'),
(681, 42, 218, NULL, 30, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:25:44'),
(682, 42, 18, NULL, 30, 'Back Lunges', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:25:44'),
(683, 42, 217, NULL, 30, 'Squat to Good Morning', '3 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-08 11:25:44'),
(684, 42, 105, NULL, 30, 'Jump Squats - Crystal ball', '3 sets', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:25:44'),
(685, 42, 46, NULL, 30, 'Cossack Squats - Chair Assisted', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-02-08 11:25:44'),
(686, 42, 69, NULL, 30, 'Glute Bridge - Reps', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:25:44'),
(687, 42, 28, NULL, 30, 'Calf Raises', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:25:44'),
(688, 43, 218, NULL, 10, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:27:29'),
(689, 43, 49, NULL, 10, 'Crossover Lunge', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 11:27:29'),
(690, 43, 143, NULL, 10, 'Oscillating Sumo Squats', '1 set', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 11:27:29'),
(691, 43, 105, NULL, 10, 'Jump Squats - Crystal ball', '1 set', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:27:29'),
(692, 43, 45, NULL, 10, 'Cossack Squats', '1 set', 'reps', NULL, '5 - 8 reps on each side', 40, '2023-02-08 11:27:29'),
(693, 43, 68, NULL, 10, 'Glute Bridge - Alternating Leg Extensions', '1 set', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:27:29'),
(694, 43, 28, NULL, 10, 'Calf Raises', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:27:29'),
(695, 43, 218, NULL, 20, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:27:56'),
(696, 43, 49, NULL, 20, 'Crossover Lunge', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 11:27:56'),
(697, 43, 143, NULL, 20, 'Oscillating Sumo Squats', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 11:27:56'),
(698, 43, 105, NULL, 20, 'Jump Squats - Crystal ball', '2 sets', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:27:56'),
(699, 43, 45, NULL, 20, 'Cossack Squats', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 40, '2023-02-08 11:27:56'),
(700, 43, 68, NULL, 20, 'Glute Bridge - Alternating Leg Extensions', '2 sets', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:27:56'),
(701, 43, 28, NULL, 20, 'Calf Raises', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:27:56'),
(702, 43, 218, NULL, 30, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:28:15'),
(703, 43, 49, NULL, 30, 'Crossover Lunge', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 11:28:15'),
(704, 43, 143, NULL, 30, 'Oscillating Sumo Squats', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 11:28:15'),
(705, 43, 105, NULL, 30, 'Jump Squats - Crystal ball', '3 sets', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:28:15'),
(706, 43, 45, NULL, 30, 'Cossack Squats', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 40, '2023-02-08 11:28:15'),
(707, 43, 68, NULL, 30, 'Glute Bridge - Alternating Leg Extensions', '3 sets', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:28:15'),
(708, 43, 28, NULL, 30, 'Calf Raises', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:28:15'),
(709, 44, 218, NULL, 10, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:29:55'),
(710, 44, 132, NULL, 10, 'Lunges to High Kicks', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:29:55'),
(711, 44, 15, NULL, 10, '1 Leg Squat', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 11:29:55'),
(712, 44, 107, NULL, 10, 'Jump Squats - Tuck Jump with Hand Tap', '1 set', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:29:55'),
(713, 44, 47, NULL, 10, 'Cossack Squats - Low', '1 set', 'reps', NULL, '5 - 8 reps on each side', 40, '2023-02-08 11:29:55'),
(714, 44, 94, NULL, 10, 'Hip Rockets', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 11:29:55'),
(715, 44, 29, NULL, 10, 'Calf Raises - Sumo Squat', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:29:55'),
(716, 44, 218, NULL, 20, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:30:16'),
(717, 44, 132, NULL, 20, 'Lunges to High Kicks', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:30:16'),
(718, 44, 15, NULL, 20, '1 Leg Squat', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 11:30:16'),
(719, 44, 107, NULL, 20, 'Jump Squats - Tuck Jump with Hand Tap', '2 sets', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:30:16'),
(720, 44, 47, NULL, 20, 'Cossack Squats - Low', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 40, '2023-02-08 11:30:16'),
(721, 44, 94, NULL, 20, 'Hip Rockets', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 11:30:16'),
(722, 44, 29, NULL, 20, 'Calf Raises - Sumo Squat', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:30:16'),
(723, 44, 218, NULL, 30, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:30:34'),
(724, 44, 132, NULL, 30, 'Lunges to High Kicks', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:30:34'),
(725, 44, 15, NULL, 30, '1 Leg Squat', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 11:30:34'),
(726, 44, 107, NULL, 30, 'Jump Squats - Tuck Jump with Hand Tap', '3 sets', 'reps', NULL, '10 - 15 reps', 60, '2023-02-08 11:30:34'),
(727, 44, 47, NULL, 30, 'Cossack Squats - Low', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 40, '2023-02-08 11:30:34'),
(728, 44, 94, NULL, 30, 'Hip Rockets', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 11:30:34'),
(729, 44, 29, NULL, 30, 'Calf Raises - Sumo Squat', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:30:34'),
(730, 45, 218, NULL, 10, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:31:48'),
(731, 45, 13, NULL, 10, '1 Leg Reaching Squats', '1 set', 'reps', NULL, '6 - 12 reps on each side', 45, '2023-02-08 11:31:48'),
(732, 45, 102, NULL, 10, 'Jump Lunges', '1 set', 'reps', NULL, '15 - 20 reps', 60, '2023-02-08 11:31:48'),
(733, 45, 48, NULL, 10, 'Cossack Squats - Low with Rotation', '1 set', 'reps', NULL, '6 - 10 reps on each side', 45, '2023-02-08 11:31:48'),
(734, 45, 104, NULL, 10, 'Jump Squats - 1 Leg', '1 set', 'reps', NULL, '6 - 10 reps on each side', 45, '2023-02-08 11:31:48'),
(735, 45, 60, NULL, 10, 'Extended Glute Bridge Hold', '1 set', 'duration', '45', NULL, 30, '2023-02-08 11:31:48'),
(736, 45, 31, NULL, 10, 'Calf Raises - Wall Assisted 1 Leg', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:31:48'),
(737, 45, 218, NULL, 20, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:32:06'),
(738, 45, 13, NULL, 20, '1 Leg Reaching Squats', '2 sets', 'reps', NULL, '6 - 12 reps on each side', 45, '2023-02-08 11:32:06'),
(739, 45, 102, NULL, 20, 'Jump Lunges', '2 sets', 'reps', NULL, '15 - 20 reps', 60, '2023-02-08 11:32:06'),
(740, 45, 48, NULL, 20, 'Cossack Squats - Low with Rotation', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 45, '2023-02-08 11:32:06'),
(741, 45, 104, NULL, 20, 'Jump Squats - 1 Leg', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 45, '2023-02-08 11:32:06'),
(742, 45, 60, NULL, 20, 'Extended Glute Bridge Hold', '2 sets', 'duration', '45', NULL, 30, '2023-02-08 11:32:06'),
(743, 45, 31, NULL, 20, 'Calf Raises - Wall Assisted 1 Leg', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:32:06'),
(744, 45, 218, NULL, 30, 'Squats', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-08 11:32:26'),
(745, 45, 13, NULL, 30, '1 Leg Reaching Squats', '3 sets', 'reps', NULL, '6 - 12 reps on each side', 45, '2023-02-08 11:32:26'),
(746, 45, 102, NULL, 30, 'Jump Lunges', '3 sets', 'reps', NULL, '15 - 20 reps', 60, '2023-02-08 11:32:26'),
(747, 45, 48, NULL, 30, 'Cossack Squats - Low with Rotation', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 45, '2023-02-08 11:32:26'),
(748, 45, 104, NULL, 30, 'Jump Squats - 1 Leg', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 45, '2023-02-08 11:32:26'),
(749, 45, 60, NULL, 30, 'Extended Glute Bridge Hold', '3 sets', 'duration', '45', NULL, 30, '2023-02-08 11:32:26'),
(750, 45, 31, NULL, 30, 'Calf Raises - Wall Assisted 1 Leg', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:32:26'),
(751, 51, 91, NULL, 10, 'High Knees', '1 set', 'reps', NULL, '20 - 30 reps on each side', 20, '2023-02-08 11:48:30'),
(752, 51, 215, NULL, 10, 'Squat Jacks', '1 set', 'reps', NULL, '15 - 20 reps', 20, '2023-02-08 11:48:30'),
(753, 51, 196, NULL, 10, 'Side Lunges - Alternating', '1 set', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-08 11:48:30'),
(754, 51, 243, NULL, 10, 'Wall Sit', '1 set', 'duration', '30', NULL, 30, '2023-02-08 11:48:30'),
(755, 51, 103, NULL, 10, 'Jump Squats', '1 set', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 11:48:30'),
(756, 51, 30, NULL, 10, 'Calf Raises - Wall Assisted', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:48:30'),
(757, 51, 91, NULL, 20, 'High Knees', '1 set', 'reps', NULL, '20 - 30 reps on each side', 20, '2023-02-08 11:50:07'),
(758, 51, 215, NULL, 20, 'Squat Jacks', '2 sets', 'reps', NULL, '15 - 20 reps', 20, '2023-02-08 11:50:07'),
(759, 51, 196, NULL, 20, 'Side Lunges - Alternating', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-08 11:50:07'),
(760, 51, 243, NULL, 20, 'Wall Sit', '2 sets', 'duration', '30', NULL, 30, '2023-02-08 11:50:07'),
(761, 51, 103, NULL, 20, 'Jump Squats', '2 sets', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 11:50:07'),
(762, 51, 30, NULL, 20, 'Calf Raises - Wall Assisted', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:50:07'),
(763, 51, 91, NULL, 30, 'High Knees', '1 set', 'reps', NULL, '20 - 30 reps on each side', 20, '2023-02-08 11:50:35'),
(764, 51, 215, NULL, 30, 'Squat Jacks', '3 sets', 'reps', NULL, '15 - 20 reps', 20, '2023-02-08 11:50:35'),
(765, 51, 196, NULL, 30, 'Side Lunges - Alternating', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-08 11:50:35'),
(766, 51, 243, NULL, 30, 'Wall Sit', '3 sets', 'duration', '30', NULL, 30, '2023-02-08 11:50:35'),
(767, 51, 103, NULL, 30, 'Jump Squats', '3 sets', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 11:50:35'),
(768, 51, 30, NULL, 30, 'Calf Raises - Wall Assisted', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-08 11:50:35'),
(769, 52, 128, NULL, 10, 'Leg Swings - Bent Knee with Support', '1 set', 'reps', NULL, '15 - 20 reps on each side', 10, '2023-02-08 11:52:25'),
(770, 52, 215, NULL, 10, 'Squat Jacks', '1 set', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-02-08 11:52:25'),
(771, 52, 200, NULL, 10, 'Side Step Lunges - Alternating', '1 set', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-08 11:52:25'),
(772, 52, 224, NULL, 10, 'Sumo Squat Pulses', '1 set', 'duration', '45', NULL, 30, '2023-02-08 11:52:25'),
(773, 52, 105, NULL, 10, 'Jump Squats - Crystall ball', '1 set', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 11:52:25'),
(774, 52, 30, NULL, 10, 'Calf Raises - Wall Assisted', '1 set', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:52:25'),
(775, 52, 128, NULL, 20, 'Leg Swings - Bent Knee with Support', '1 set', 'reps', NULL, '15 - 20 reps on each side', 10, '2023-02-08 11:53:05'),
(776, 52, 215, NULL, 20, 'Squat Jacks', '2 sets', 'reps', NULL, '15 - 20 reps on each side', 3, '2023-02-08 11:53:05'),
(777, 52, 200, NULL, 20, 'Side Step Lunges - Alternating', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-08 11:53:05'),
(778, 52, 224, NULL, 20, 'Sumo Squat Pulses', '2 sets', 'duration', '45', NULL, 30, '2023-02-08 11:53:05'),
(779, 52, 105, NULL, 20, 'Jump Squats - Crystall ball', '2 sets', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 11:53:05'),
(780, 52, 30, NULL, 20, 'Calf Raises - Wall Assisted', '2 sets', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:53:05'),
(781, 52, 128, NULL, 30, 'Leg Swings - Bent Knee with Support', '1 set', 'reps', NULL, '15 - 20 reps on each side', 10, '2023-02-08 11:53:33'),
(782, 52, 215, NULL, 30, 'Squat Jacks', '3 sets', 'reps', NULL, '15 - 20 reps on each side', 3, '2023-02-08 11:53:33'),
(783, 52, 200, NULL, 30, 'Side Step Lunges - Alternating', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-08 11:53:33'),
(784, 52, 224, NULL, 30, 'Sumo Squat Pulses', '3 sets', 'duration', '45', NULL, 30, '2023-02-08 11:53:33'),
(785, 52, 105, NULL, 30, 'Jump Squats - Crystall ball', '3 sets', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 11:53:33'),
(786, 52, 30, NULL, 30, 'Calf Raises - Wall Assisted', '3 sets', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:53:33'),
(787, 53, 127, NULL, 10, 'Leg Swings - Bent Knee ', '1 set', 'reps', NULL, '10 - 15 reps on each side', 10, '2023-02-08 11:55:48'),
(788, 53, 205, NULL, 10, 'Skater Jump with Toe Tap', '1 set', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-02-08 11:55:48'),
(789, 53, 197, NULL, 10, 'Side Lunges - Suspended', '1 set', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-08 11:55:48'),
(790, 53, 217, NULL, 10, 'Squat to Good Morning', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 11:55:48'),
(791, 53, 105, NULL, 10, 'Jump Squats - Crystall ball', '1 set', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 11:55:48'),
(792, 53, 28, NULL, 10, 'Calf Raises ', '1 set', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:55:48'),
(793, 53, 127, NULL, 20, 'Leg Swings - Bent Knee ', '1 set', 'reps', NULL, '10 - 15 reps on each side', 10, '2023-02-08 11:56:13'),
(794, 53, 205, NULL, 20, 'Skater Jump with Toe Tap', '2 sets', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-02-08 11:56:13'),
(795, 53, 197, NULL, 20, 'Side Lunges - Suspended', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-08 11:56:13'),
(796, 53, 217, NULL, 20, 'Squat to Good Morning', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 11:56:13'),
(797, 53, 105, NULL, 20, 'Jump Squats - Crystall ball', '2 sets', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 11:56:13'),
(798, 53, 28, NULL, 20, 'Calf Raises ', '2 sets', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:56:13'),
(799, 53, 127, NULL, 30, 'Leg Swings - Bent Knee ', '1 set', 'reps', NULL, '10 - 15 reps on each side', 10, '2023-02-08 11:56:31'),
(800, 53, 205, NULL, 30, 'Skater Jump with Toe Tap', '3 sets', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-02-08 11:56:31'),
(801, 53, 197, NULL, 30, 'Side Lunges - Suspended', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-08 11:56:31'),
(802, 53, 217, NULL, 30, 'Squat to Good Morning', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 11:56:31'),
(803, 53, 105, NULL, 30, 'Jump Squats - Crystall ball', '3 sets', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 11:56:31'),
(804, 53, 28, NULL, 30, 'Calf Raises ', '3 sets', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:56:31'),
(805, 54, 208, NULL, 10, 'Slalom Jump -1 Leg', '1 set', 'reps', NULL, '15 - 20 reps on each side', 20, '2023-02-08 11:57:48'),
(806, 54, 15, NULL, 10, '1 Leg Squat', '1 set', 'reps', NULL, '12 - 15 reps on each side', 20, '2023-02-08 11:57:48'),
(807, 54, 244, NULL, 10, 'Wall Sit - 1 Leg', '1 set', 'duration', '30 on each side', NULL, 20, '2023-02-08 11:57:48'),
(808, 54, 26, NULL, 10, 'Bulgarian Split Squat', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:57:48'),
(809, 54, 102, NULL, 10, 'Jump Lunges', '1 set', 'reps', NULL, '8 - 12 reps on each side', 45, '2023-02-08 11:57:48'),
(810, 54, 32, NULL, 10, 'Calf Raises with Head Rotation', '1 set', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:57:48'),
(811, 54, 208, NULL, 20, 'Slalom Jump -1 Leg', '1 set', 'reps', NULL, '15 - 20 reps on each side', 20, '2023-02-08 11:58:43'),
(812, 54, 15, NULL, 20, '1 Leg Squat', '2 sets', 'reps', NULL, '12 - 15 reps on each side', 20, '2023-02-08 11:58:43'),
(813, 54, 244, NULL, 20, 'Wall Sit - 1 Leg', '2 sets', 'duration', '30 on each side', NULL, 20, '2023-02-08 11:58:43'),
(814, 54, 26, NULL, 20, 'Bulgarian Split Squat', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:58:43'),
(815, 54, 102, NULL, 20, 'Jump Lunges', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 45, '2023-02-08 11:58:43'),
(816, 54, 32, NULL, 20, 'Calf Raises with Head Rotation', '2 sets', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:58:43'),
(817, 54, 208, NULL, 30, 'Slalom Jump -1 Leg', '1 set', 'reps', NULL, '15 - 20 reps on each side', 20, '2023-02-08 11:59:07'),
(818, 54, 15, NULL, 30, '1 Leg Squat', '3 sets', 'reps', NULL, '12 - 15 reps on each side', 20, '2023-02-08 11:59:07'),
(819, 54, 244, NULL, 30, 'Wall Sit - 1 Leg', '3 sets', 'duration', '30 on each side', NULL, 20, '2023-02-08 11:59:07'),
(820, 54, 26, NULL, 30, 'Bulgarian Split Squat', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 11:59:07'),
(821, 54, 102, NULL, 30, 'Jump Lunges', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 45, '2023-02-08 11:59:07'),
(822, 54, 32, NULL, 30, 'Calf Raises with Head Rotation', '3 sets', 'reps', NULL, '6 - 10 reps', 30, '2023-02-08 11:59:07'),
(823, 55, 208, NULL, 10, 'Slalom Jump -1 Leg', '1 set', 'reps', NULL, '15 - 20 reps on each side', 20, '2023-02-08 12:00:33'),
(824, 55, 13, NULL, 10, '1 Leg Reaching Squat', '1 set', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 12:00:33'),
(825, 55, 47, NULL, 10, 'Cossack Squats - Low', '1 set', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 12:00:33'),
(826, 55, 61, NULL, 10, 'Extended Lunges', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 12:00:33'),
(827, 55, 107, NULL, 10, 'Jump Squats - Tuck Jump with Hand Tap', '1 set', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 12:00:33'),
(828, 55, 31, NULL, 10, 'Calf Raises - Wall Assisted 1 Leg', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 12:00:33'),
(829, 55, 208, NULL, 20, 'Slalom Jump -1 Leg', '1 set', 'reps', NULL, '15 - 20 reps on each side', 20, '2023-02-08 12:00:52'),
(830, 55, 13, NULL, 20, '1 Leg Reaching Squat', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 12:00:52'),
(831, 55, 47, NULL, 20, 'Cossack Squats - Low', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 12:00:52'),
(832, 55, 61, NULL, 20, 'Extended Lunges', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 12:00:52'),
(833, 55, 107, NULL, 20, 'Jump Squats - Tuck Jump with Hand Tap', '2 sets', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 12:00:52'),
(834, 55, 31, NULL, 20, 'Calf Raises - Well Assisted 1 Leg', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 12:00:52'),
(835, 55, 208, NULL, 30, 'Slalom Jump -1 Leg', '1 set', 'reps', NULL, '15 - 20 reps on each side', 20, '2023-02-08 12:01:12'),
(836, 55, 13, NULL, 30, '1 Leg Reaching Squat', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 12:01:12'),
(837, 55, 47, NULL, 30, 'Cossack Squats - Low', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-08 12:01:12'),
(838, 55, 61, NULL, 30, 'Extended Lunges', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 12:01:12'),
(839, 55, 107, NULL, 30, 'Jump Squats - Tuck Jump with Hand Tap', '3 sets', 'reps', NULL, '10 - 15 reps', 45, '2023-02-08 12:01:12'),
(840, 55, 31, NULL, 30, 'Calf Raises - Well Assisted 1 Leg', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-08 12:01:12'),
(841, 56, 108, NULL, 10, 'Jumping Jack', '1 set', 'reps', NULL, '20 - 30 reps', 20, '2023-02-08 13:51:47'),
(842, 56, 160, NULL, 10, 'Pulling Hands', '1 set', 'reps', NULL, '6 - 10 reps', 20, '2023-02-08 13:51:47'),
(843, 56, 225, NULL, 10, 'Sumo Squats', '1 set', 'reps', NULL, '15 - 20 reps', 30, '2023-02-08 13:51:47'),
(844, 56, 240, NULL, 10, 'Wall Push-Ups', '1 set', 'reps', NULL, '15 - 20 reps', 20, '2023-02-08 13:51:47'),
(845, 56, 30, NULL, 10, 'Calf Raises - Well Assisted', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 13:51:47'),
(846, 56, 63, NULL, 10, 'Fists of Fury', '1 set', 'reps', NULL, '5 reps on each side', 30, '2023-02-08 13:51:47'),
(847, 56, 108, NULL, 20, 'Jumping Jack', '1 set', 'reps', NULL, '20 - 30 reps', 20, '2023-02-08 13:52:08'),
(848, 56, 160, NULL, 20, 'Pulling Hands', '2 sets', 'reps', NULL, '6 - 10 reps', 20, '2023-02-08 13:52:08'),
(849, 56, 225, NULL, 20, 'Sumo Squats', '2 sets', 'reps', NULL, '15 - 20 reps', 30, '2023-02-08 13:52:08'),
(850, 56, 240, NULL, 20, 'Wall Push-Ups', '2 sets', 'reps', NULL, '15 - 20 reps', 20, '2023-02-08 13:52:08'),
(851, 56, 30, NULL, 20, 'Calf Raises - Well Assisted', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 13:52:08'),
(852, 56, 63, NULL, 20, 'Fists of Fury', '2 sets', 'reps', NULL, '5 reps on each side', 30, '2023-02-08 13:52:08'),
(853, 56, 108, NULL, 30, 'Jumping Jack', '1 set', 'reps', NULL, '20 - 30 reps', 20, '2023-02-08 13:52:28'),
(854, 56, 160, NULL, 30, 'Pulling Hands', '3 sets', 'reps', NULL, '6 - 10 reps', 20, '2023-02-08 13:52:28'),
(855, 56, 225, NULL, 30, 'Sumo Squats', '3 sets', 'reps', NULL, '15 - 20 reps', 30, '2023-02-08 13:52:28'),
(856, 56, 240, NULL, 30, 'Wall Push-Ups', '3 sets', 'reps', NULL, '15 - 20 reps', 20, '2023-02-08 13:52:28'),
(857, 56, 30, NULL, 30, 'Calf Raises - Well Assisted', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-08 13:52:28'),
(858, 56, 63, NULL, 30, 'Fists of Fury', '3 sets', 'reps', NULL, '5 reps on each side', 30, '2023-02-08 13:52:28'),
(865, 58, 108, NULL, 10, 'Jumping Jacks', '1 set', 'reps', NULL, '20 - 30 reps', 20, '2023-02-08 14:01:50'),
(866, 58, 128, NULL, 10, 'Leg Swings - Bent Knee with Support', '1 set', 'reps', NULL, '10 reps on each side', 20, '2023-02-08 14:01:50'),
(867, 58, 131, NULL, 10, 'Lunges', '1 set', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 14:01:50'),
(868, 58, 218, NULL, 10, 'Squats', '1 set', 'reps', NULL, '15 -20 reps', 40, '2023-02-08 14:01:50'),
(869, 58, 196, NULL, 10, 'Side Lunges - Alternating', '1 set', 'reps', NULL, '8 - 12 reps on each side', 40, '2023-02-08 14:01:50'),
(870, 58, 224, NULL, 10, 'Sumo Squat Pulses', '1 set', 'reps', NULL, '20 - 30 reps', 30, '2023-02-08 14:01:50'),
(871, 58, 30, NULL, 10, 'Calf Raises - Wall Assisted', '1 set', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-08 14:01:50'),
(872, 58, 108, NULL, 20, 'Jumping Jacks', '1 set', 'reps', NULL, '20 - 30 reps', 20, '2023-02-08 14:02:22'),
(873, 58, 128, NULL, 20, 'Leg Swings - Bent Knee with Support', '1 set', 'reps', NULL, '10 reps on each side', 20, '2023-02-08 14:02:22'),
(874, 58, 131, NULL, 20, 'Lunges', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 14:02:22'),
(875, 58, 218, NULL, 20, 'Squats', '2 sets', 'reps', NULL, '15 -20 reps', 40, '2023-02-08 14:02:22'),
(876, 58, 196, NULL, 20, 'Side Lunges - Alternating', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 40, '2023-02-08 14:02:22'),
(877, 58, 224, NULL, 20, 'Sumo Squat Pulses', '2 sets', 'reps', NULL, '20 - 30 reps', 30, '2023-02-08 14:02:22'),
(878, 58, 30, NULL, 20, 'Calf Raises - Wall Assisted', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-08 14:02:22'),
(879, 58, 108, NULL, 30, 'Jumping Jacks', '1 set', 'reps', NULL, '20 - 30 reps', 20, '2023-02-08 14:02:53'),
(880, 58, 128, NULL, 30, 'Leg Swings - Bent Knee with Support', '1 set', 'reps', NULL, '10 reps on each side', 20, '2023-02-08 14:02:53'),
(881, 58, 131, NULL, 30, 'Lunges', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 30, '2023-02-08 14:02:53'),
(882, 58, 218, NULL, 30, 'Squats', '3 sets', 'reps', NULL, '15 -20 reps', 40, '2023-02-08 14:02:53'),
(883, 58, 196, NULL, 30, 'Side Lunges - Alternating', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 40, '2023-02-08 14:02:53'),
(884, 58, 224, NULL, 30, 'Sumo Squat Pulses', '3 sets', 'reps', NULL, '20 - 30 reps', 30, '2023-02-08 14:02:53'),
(885, 58, 30, NULL, 30, 'Calf Raises - Wall Assisted', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-08 14:02:53'),
(886, 60, 128, NULL, 15, 'Leg Swings - Bent Knee with Support', '1 set', 'reps', NULL, '15 reps on each side', 20, '2023-02-15 15:06:49'),
(887, 60, 122, NULL, 15, 'Laterals', '1 set', 'reps', NULL, '10 - 12 reps on each side', 20, '2023-02-15 15:06:49'),
(888, 60, 226, NULL, 15, 'Sumo Squats with Rotational Reach', '1 set', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-15 15:06:49'),
(889, 60, 201, NULL, 15, 'Skater Jumps', '1 set', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-02-15 15:06:49'),
(890, 60, 35, NULL, 15, 'Circular Glute Bridges', '1 set', 'reps', NULL, '5 reps on each side', 15, '2023-02-15 15:06:49'),
(891, 60, 196, NULL, 15, 'Side Lunges - Alternating', '1 set', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-15 15:06:49'),
(892, 60, 30, NULL, 15, 'Calf Raises - Wall Assisted', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-15 15:06:49'),
(893, 60, 128, NULL, 30, 'Leg Swings - Bent Knee with Support', '1 set', 'reps', NULL, '15 reps on each side', 20, '2023-02-15 15:07:28'),
(894, 60, 122, NULL, 30, 'Laterals', '2 sets', 'reps', NULL, '10 - 12 reps on each side', 20, '2023-02-15 15:07:28'),
(895, 60, 226, NULL, 30, 'Sumo Squats with Rotational Reach', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-15 15:07:28'),
(896, 60, 201, NULL, 30, 'Skater Jumps', '2 sets', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-02-15 15:07:28'),
(897, 60, 35, NULL, 30, 'Circular Glute Bridges', '2 sets', 'reps', NULL, '5 reps on each side', 15, '2023-02-15 15:07:28'),
(898, 60, 196, NULL, 30, 'Side Lunges - Alternating', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-15 15:07:28'),
(899, 60, 30, NULL, 30, 'Calf Raises - Wall Assisted', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-15 15:07:28'),
(900, 60, 128, NULL, 45, 'Leg Swings - Bent Knee with Support', '1 set', 'reps', NULL, '15 reps on each side', 20, '2023-02-15 15:07:51'),
(901, 60, 122, NULL, 45, 'Laterals', '3 sets', 'reps', NULL, '10 - 12 reps on each side', 20, '2023-02-15 15:07:51'),
(902, 60, 226, NULL, 45, 'Sumo Squats with Rotational Reach', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-15 15:07:51'),
(903, 60, 201, NULL, 45, 'Skater Jumps', '3 sets', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-02-15 15:07:51'),
(904, 60, 35, NULL, 45, 'Circular Glute Bridges', '3 sets', 'reps', NULL, '5 reps on each side', 15, '2023-02-15 15:07:51'),
(905, 60, 196, NULL, 45, 'Side Lunges - Alternating', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-15 15:07:51'),
(906, 60, 30, NULL, 45, 'Calf Raises - Wall Assisted', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-15 15:07:51'),
(907, 62, 207, NULL, 15, 'Slalom Jumps', '1 set', 'reps', NULL, '15 - 20 reps on each side', 20, '2023-02-16 09:07:30'),
(908, 62, 143, NULL, 15, 'Oscillating Sumo Squats', '1 set', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-16 09:07:30'),
(909, 62, 219, NULL, 15, 'Squats with Rotational Reach ', '1 set', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-16 09:07:30');
INSERT INTO `exercise_workout` (`id`, `workout_id`, `exercise_id`, `category_id`, `duration`, `variation_name`, `sets`, `based_on`, `ex_duration`, `ex_reps`, `rest_duration`, `created_at`) VALUES
(910, 62, 204, NULL, 15, 'Skater Jumps with Safety Touch', '1 set', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-02-16 09:07:30'),
(911, 62, 217, NULL, 15, 'Squat to Good Morning', '1 set', 'reps', NULL, '10 - 15 reps', 20, '2023-02-16 09:07:30'),
(912, 62, 90, NULL, 15, 'High Kicks', '1 set', 'reps', NULL, '15 - 20 reps on each side', 20, '2023-02-16 09:07:30'),
(913, 62, 28, NULL, 15, 'Calf Raises', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-16 09:07:30'),
(914, 62, 207, NULL, 30, 'Slalom Jumps', '1 set', 'reps', NULL, '15 - 20 reps on each side', 20, '2023-02-16 09:07:52'),
(915, 62, 143, NULL, 30, 'Oscillating Sumo Squats', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-16 09:07:52'),
(916, 62, 219, NULL, 30, 'Squats with Rotational Reach ', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-16 09:07:52'),
(917, 62, 204, NULL, 30, 'Skater Jumps with Safety Touch', '2 sets', 'reps', NULL, '15 - 20 reps on each side', 30, '2023-02-16 09:07:52'),
(918, 62, 217, NULL, 30, 'Squat to Good Morning', '2 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-16 09:07:52'),
(919, 62, 90, NULL, 30, 'High Kicks', '2 sets', 'reps', NULL, '15 - 20 reps on each side', 20, '2023-02-16 09:07:52'),
(920, 62, 28, NULL, 30, 'Calf Raises', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-16 09:07:52'),
(921, 57, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '5 reps on each direction', NULL, '2023-02-19 17:15:43'),
(922, 57, 76, NULL, 10, 'Hand Crushers', '1 set', 'reps', NULL, '20 - 30 reps', 15, '2023-02-19 17:15:43'),
(923, 57, 168, NULL, 10, 'Push-Ups on Knees', '1 set', 'reps', NULL, '8 - 12 reps', 20, '2023-02-19 17:15:43'),
(924, 57, 22, NULL, 10, 'Bent Knee Glute Kickbacks', '1 set', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-19 17:15:43'),
(925, 57, 228, NULL, 10, 'Superman - Arms Only', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-19 17:15:43'),
(926, 57, 69, NULL, 10, 'Glute Bridge - Reps', '1 set', 'reps', NULL, '8 - 12 reps', 20, '2023-02-19 17:15:43'),
(927, 57, 248, NULL, 10, 'Windshield Wipers - Bent Knees', '1 set', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-19 17:15:43'),
(928, 57, 249, NULL, 20, 'Wrist Circles', '1 set', 'reps', NULL, '5 reps on each direction', NULL, '2023-02-19 17:18:53'),
(929, 57, 76, NULL, 20, 'Hand Crushers', '2 set', 'reps', NULL, '20 - 30 reps', 15, '2023-02-19 17:18:53'),
(930, 57, 168, NULL, 20, 'Push-Ups on Knees', '2 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-19 17:18:53'),
(931, 57, 22, NULL, 20, 'Bent Knee Glute Kickbacks', '2 sets', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-19 17:18:53'),
(932, 57, 228, NULL, 20, 'Superman - Arms Only', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-19 17:18:53'),
(933, 57, 69, NULL, 20, 'Glute Bridge - Reps', '2 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-19 17:18:53'),
(934, 57, 248, NULL, 20, 'Windshield Wipers - Bent Knees', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-19 17:18:53'),
(935, 57, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '5 reps on each direction', NULL, '2023-02-19 17:20:06'),
(936, 57, 76, NULL, 30, 'Hand Crushers', '3 set', 'reps', NULL, '20 - 30 reps', 15, '2023-02-19 17:20:06'),
(937, 57, 168, NULL, 30, 'Push-Ups on Knees', '3 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-19 17:20:06'),
(938, 57, 22, NULL, 30, 'Bent Knee Glute Kickbacks', '3 sets', 'reps', NULL, '10 - 15 reps on each side', 20, '2023-02-19 17:20:06'),
(939, 57, 228, NULL, 30, 'Superman - Arms Only', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-19 17:20:06'),
(940, 57, 69, NULL, 30, 'Glute Bridge - Reps', '3 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-19 17:20:06'),
(941, 57, 248, NULL, 30, 'Windshield Wipers - Bent Knees', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-19 17:20:06'),
(942, 50, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-19 17:21:33'),
(943, 50, 147, NULL, 10, 'Pike Push-Ups - 1 Leg', '1 set', 'reps', NULL, '8 -12 reps on each side', 30, '2023-02-19 17:21:33'),
(944, 50, 5, NULL, 10, '1 Leg Deadlift', '1 set', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-19 17:21:33'),
(945, 50, 40, NULL, 10, 'Clapping Push-Ups ', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-19 17:21:33'),
(946, 50, 229, NULL, 10, 'Superman - Full Scissors', '1 set', 'duration', '30', NULL, 20, '2023-02-19 17:21:33'),
(947, 50, 186, NULL, 10, 'Russian Twist', '1 set', 'duration', '30', NULL, 20, '2023-02-19 17:21:33'),
(948, 50, 249, NULL, 20, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-19 17:21:54'),
(949, 50, 147, NULL, 20, 'Pike Push-Ups - 1 Leg', '2 sets', 'reps', NULL, '8 -12 reps on each side', 30, '2023-02-19 17:21:54'),
(950, 50, 5, NULL, 20, '1 Leg Deadlift', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-19 17:21:54'),
(951, 50, 40, NULL, 20, 'Clapping Push-Ups ', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-19 17:21:54'),
(952, 50, 229, NULL, 20, 'Superman - Full Scissors', '2 sets', 'duration', '30', NULL, 20, '2023-02-19 17:21:54'),
(953, 50, 186, NULL, 20, 'Russian Twist', '2 sets', 'duration', '30', NULL, 20, '2023-02-19 17:21:54'),
(954, 50, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-19 17:22:10'),
(955, 50, 147, NULL, 30, 'Pike Push-Ups - 1 Leg', '3 sets', 'reps', NULL, '8 -12 reps on each side', 30, '2023-02-19 17:22:10'),
(956, 50, 5, NULL, 30, '1 Leg Deadlift', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-19 17:22:10'),
(957, 50, 40, NULL, 30, 'Clapping Push-Ups ', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-19 17:22:10'),
(958, 50, 229, NULL, 30, 'Superman - Full Scissors', '3 sets', 'duration', '30', NULL, 20, '2023-02-19 17:22:10'),
(959, 50, 186, NULL, 30, 'Russian Twist', '3 sets', 'duration', '30', NULL, 20, '2023-02-19 17:22:10'),
(960, 36, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 11:51:58'),
(961, 36, 76, NULL, 10, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 11:51:58'),
(962, 36, 191, NULL, 10, 'Scapular Push-Ups on Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 11:51:58'),
(963, 36, 241, NULL, 10, 'Wall Push-Ups - 1 Arm', '1 set', 'reps', NULL, '10 - 12 reps on each side', 30, '2023-02-25 11:51:58'),
(964, 36, 173, NULL, 10, 'Pushing Hands ', '1 set', 'duration', '30', NULL, 30, '2023-02-25 11:51:58'),
(965, 36, 165, NULL, 10, 'Push Backs on Knees', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-25 11:51:58'),
(966, 36, 209, NULL, 10, 'Slow Eccentric push-Ups', '1 set', 'reps', NULL, '5 - 8 reps', 30, '2023-02-25 11:51:58'),
(967, 36, 44, NULL, 10, 'Cobra Push-Ups - Half Cobras', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 11:51:58'),
(968, 36, 249, NULL, 20, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 11:52:22'),
(969, 36, 76, NULL, 20, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 11:52:22'),
(970, 36, 191, NULL, 20, 'Scapular Push-Ups on Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 11:52:22'),
(971, 36, 241, NULL, 20, 'Wall Push-Ups - 1 Arm', '2 sets', 'reps', NULL, '10 - 12 reps on each side', 30, '2023-02-25 11:52:22'),
(972, 36, 173, NULL, 20, 'Pushing Hands ', '2 sets', 'duration', '30', NULL, 30, '2023-02-25 11:52:22'),
(973, 36, 165, NULL, 20, 'Push Backs on Knees', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-25 11:52:22'),
(974, 36, 209, NULL, 20, 'Slow Eccentric push-Ups', '2 sets', 'reps', NULL, '5 - 8 reps', 30, '2023-02-25 11:52:22'),
(975, 36, 44, NULL, 20, 'Cobra Push-Ups - Half Cobras', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 11:52:22'),
(976, 36, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 11:53:11'),
(977, 36, 76, NULL, 30, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 11:53:11'),
(978, 36, 191, NULL, 30, 'Scapular Push-Ups on Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 11:53:11'),
(979, 36, 241, NULL, 30, 'Wall Push-Ups - 1 Arm', '3 sets', 'reps', NULL, '10 - 12 reps on each side', 30, '2023-02-25 11:53:11'),
(980, 36, 173, NULL, 30, 'Pushing Hands ', '3 sets', 'duration', '30', NULL, 30, '2023-02-25 11:53:11'),
(981, 36, 165, NULL, 30, 'Push Backs on Knees', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-25 11:53:11'),
(982, 36, 209, NULL, 30, 'Slow Eccentric push-Ups', '3 sets', 'reps', NULL, '5 - 8 reps', 30, '2023-02-25 11:53:11'),
(983, 36, 44, NULL, 30, 'Cobra Push-Ups - Half Cobras', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 11:53:11'),
(984, 37, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:24:57'),
(985, 37, 76, NULL, 10, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:24:57'),
(986, 37, 187, NULL, 10, 'Scapular Push-Ups ', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:24:57'),
(987, 37, 167, NULL, 10, 'Push-Ups ', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:24:57'),
(988, 37, 173, NULL, 10, 'Pushing Hands ', '1 set', 'duration', '40', NULL, 30, '2023-02-25 16:24:57'),
(989, 37, 163, NULL, 10, 'Push Backs', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:24:57'),
(990, 37, 209, NULL, 10, 'Slow Eccentric push-Ups', '1 set', 'reps', NULL, '6 - 10 reps', 45, '2023-02-25 16:24:57'),
(991, 37, 43, NULL, 10, 'Cobra Push-Ups ', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-25 16:24:57'),
(992, 37, 249, NULL, 20, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:25:29'),
(993, 37, 76, NULL, 20, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:25:29'),
(994, 37, 187, NULL, 20, 'Scapular Push-Ups ', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:25:29'),
(995, 37, 167, NULL, 20, 'Push-Ups ', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:25:29'),
(996, 37, 173, NULL, 20, 'Pushing Hands ', '2 sets', 'duration', '40', NULL, 30, '2023-02-25 16:25:29'),
(997, 37, 163, NULL, 20, 'Push Backs', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:25:29'),
(998, 37, 209, NULL, 20, 'Slow Eccentric push-Ups', '2 sets', 'reps', NULL, '6 - 10 reps', 45, '2023-02-25 16:25:29'),
(999, 37, 43, NULL, 20, 'Cobra Push-Ups ', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-25 16:25:29'),
(1000, 37, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:25:47'),
(1001, 37, 76, NULL, 30, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:25:47'),
(1002, 37, 187, NULL, 30, 'Scapular Push-Ups ', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:25:47'),
(1003, 37, 167, NULL, 30, 'Push-Ups ', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:25:47'),
(1004, 37, 173, NULL, 30, 'Pushing Hands ', '3 sets', 'duration', '40', NULL, 30, '2023-02-25 16:25:47'),
(1005, 37, 163, NULL, 30, 'Push Backs', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:25:47'),
(1006, 37, 209, NULL, 30, 'Slow Eccentric push-Ups', '3 sets', 'reps', NULL, '6 - 10 reps', 45, '2023-02-25 16:25:47'),
(1007, 37, 43, NULL, 30, 'Cobra Push-Ups ', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-25 16:25:47'),
(1008, 38, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:27:56'),
(1009, 38, 76, NULL, 10, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:27:56'),
(1010, 38, 189, NULL, 10, 'Scapular Push-Ups - 1Arm on Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:27:56'),
(1011, 38, 120, NULL, 10, 'Lateral Push-Ups ', '1 set', 'reps', NULL, '4 - 7 reps on each side', 45, '2023-02-25 16:27:56'),
(1012, 38, 174, NULL, 10, 'Pushing Hands with Lateral Shift', '1 set', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-25 16:27:56'),
(1013, 38, 163, NULL, 10, 'Push Backs', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-25 16:27:56'),
(1014, 38, 210, NULL, 10, 'Slow push-Ups ', '1 set', 'reps', NULL, '4 - 7 reps', 45, '2023-02-25 16:27:56'),
(1015, 38, 139, NULL, 10, 'Narrow Push-Ups ', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:27:56'),
(1016, 38, 249, NULL, 20, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:28:12'),
(1017, 38, 76, NULL, 20, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:28:12'),
(1018, 38, 189, NULL, 20, 'Scapular Push-Ups - 1Arm on Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:28:12'),
(1019, 38, 120, NULL, 20, 'Lateral Push-Ups ', '2 sets', 'reps', NULL, '4 - 7 reps on each side', 45, '2023-02-25 16:28:12'),
(1020, 38, 174, NULL, 20, 'Pushing Hands with Lateral Shift', '2 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-25 16:28:12'),
(1021, 38, 163, NULL, 20, 'Push Backs', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-25 16:28:12'),
(1022, 38, 210, NULL, 20, 'Slow push-Ups ', '2 sets', 'reps', NULL, '4 - 7 reps', 45, '2023-02-25 16:28:12'),
(1023, 38, 139, NULL, 20, 'Narrow Push-Ups ', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:28:12'),
(1024, 38, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:28:28'),
(1025, 38, 76, NULL, 30, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:28:28'),
(1026, 38, 189, NULL, 30, 'Scapular Push-Ups - 1Arm on Knees', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:28:28'),
(1027, 38, 120, NULL, 30, 'Lateral Push-Ups ', '3 sets', 'reps', NULL, '4 - 7 reps on each side', 45, '2023-02-25 16:28:28'),
(1028, 38, 174, NULL, 30, 'Pushing Hands with Lateral Shift', '3 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-25 16:28:28'),
(1029, 38, 163, NULL, 30, 'Push Backs', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-25 16:28:28'),
(1030, 38, 210, NULL, 30, 'Slow push-Ups ', '3 sets', 'reps', NULL, '4 - 7 reps', 45, '2023-02-25 16:28:28'),
(1031, 38, 139, NULL, 30, 'Narrow Push-Ups ', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:28:28'),
(1032, 39, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:29:49'),
(1033, 39, 76, NULL, 10, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:29:49'),
(1034, 39, 190, NULL, 10, 'Scapular Push-Ups - Alternating 1 Leg', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:29:49'),
(1035, 39, 120, NULL, 10, 'Lateral Push-Ups ', '1 set', 'reps', NULL, '5 - 8 reps on each side', 45, '2023-02-25 16:29:49'),
(1036, 39, 220, NULL, 10, 'Squeeze Ups', '1 set', 'reps', NULL, '6 - 10 reps', 45, '2023-02-25 16:29:49'),
(1037, 39, 164, NULL, 10, 'Push Backs - Bidirectional', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:29:49'),
(1038, 39, 111, NULL, 10, 'Knee to Elbow Push-Ups - Alternating', '1 set', 'reps', NULL, '5 - 8 reps on each side', 45, '2023-02-25 16:29:49'),
(1039, 39, 10, NULL, 10, '1 leg Push-Ups on Knees', '1 set', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-02-25 16:29:49'),
(1040, 39, 249, NULL, 20, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:30:04'),
(1041, 39, 76, NULL, 20, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:30:04'),
(1042, 39, 190, NULL, 20, 'Scapular Push-Ups - Alternating 1 Leg', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:30:04'),
(1043, 39, 120, NULL, 20, 'Lateral Push-Ups ', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 45, '2023-02-25 16:30:04'),
(1044, 39, 220, NULL, 20, 'Squeeze Ups', '2 sets', 'reps', NULL, '6 - 10 reps', 45, '2023-02-25 16:30:04'),
(1045, 39, 164, NULL, 20, 'Push Backs - Bidirectional', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:30:04'),
(1046, 39, 111, NULL, 20, 'Knee to Elbow Push-Ups - Alternating', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 45, '2023-02-25 16:30:04'),
(1047, 39, 10, NULL, 20, '1 leg Push-Ups on Knees', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-02-25 16:30:04'),
(1048, 39, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:30:19'),
(1049, 39, 76, NULL, 30, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:30:19'),
(1050, 39, 190, NULL, 30, 'Scapular Push-Ups - Alternating 1 Leg', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:30:19'),
(1051, 39, 120, NULL, 30, 'Lateral Push-Ups ', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 45, '2023-02-25 16:30:19'),
(1052, 39, 220, NULL, 30, 'Squeeze Ups', '3 sets', 'reps', NULL, '6 - 10 reps', 45, '2023-02-25 16:30:19'),
(1053, 39, 164, NULL, 30, 'Push Backs - Bidirectional', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-25 16:30:19'),
(1054, 39, 111, NULL, 30, 'Knee to Elbow Push-Ups - Alternating', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 45, '2023-02-25 16:30:19'),
(1055, 39, 10, NULL, 30, '1 leg Push-Ups on Knees', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 30, '2023-02-25 16:30:19'),
(1056, 40, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:31:31'),
(1057, 40, 76, NULL, 10, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:31:31'),
(1058, 40, 188, NULL, 10, 'Scapular Push-Ups -1Arm', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:31:31'),
(1059, 40, 121, NULL, 10, 'Lateral Push-Ups  - Plyometric', '1 set', 'reps', NULL, '6 - 10 reps on each side', 60, '2023-02-25 16:31:31'),
(1060, 40, 220, NULL, 10, 'Squeeze Ups', '1 set', 'reps', NULL, '8 - 12 reps', 45, '2023-02-25 16:31:31'),
(1061, 40, 166, NULL, 10, 'Push Backs with Alternating Knee Taps', '1 set', 'reps', NULL, '5 - 8 reps on each side', 45, '2023-02-25 16:31:31'),
(1062, 40, 42, NULL, 10, 'Cliffhanger Push-Ups - Modified', '1 set', 'reps', NULL, '6 - 10 reps on each side', 45, '2023-02-25 16:31:31'),
(1063, 40, 12, NULL, 10, '1 Leg Reaching Push-Ups - Alternating', '1 set', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-25 16:31:31'),
(1064, 40, 249, NULL, 20, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:31:48'),
(1065, 40, 76, NULL, 20, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:31:48'),
(1066, 40, 188, NULL, 20, 'Scapular Push-Ups -1Arm', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:31:48'),
(1067, 40, 121, NULL, 20, 'Lateral Push-Ups  - Plyometric', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 60, '2023-02-25 16:31:48'),
(1068, 40, 220, NULL, 20, 'Squeeze Ups', '2 sets', 'reps', NULL, '8 - 12 reps', 45, '2023-02-25 16:31:48'),
(1069, 40, 166, NULL, 20, 'Push Backs with Alternating Knee Taps', '2 sets', 'reps', NULL, '5 - 8 reps on each side', 45, '2023-02-25 16:31:48'),
(1070, 40, 42, NULL, 20, 'Cliffhanger Push-Ups - Modified', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 45, '2023-02-25 16:31:48'),
(1071, 40, 12, NULL, 20, '1 Leg Reaching Push-Ups - Alternating', '2 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-25 16:31:48'),
(1072, 40, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:32:04'),
(1073, 40, 76, NULL, 30, 'Hand Crushers', '1 set', 'duration', '30', NULL, 15, '2023-02-25 16:32:04'),
(1074, 40, 188, NULL, 30, 'Scapular Push-Ups -1Arm', '1 set', 'reps', NULL, '10 reps', 20, '2023-02-25 16:32:04'),
(1075, 40, 121, NULL, 30, 'Lateral Push-Ups  - Plyometric', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 60, '2023-02-25 16:32:04'),
(1076, 40, 220, NULL, 30, 'Squeeze Ups', '3 sets', 'reps', NULL, '8 - 12 reps', 45, '2023-02-25 16:32:04'),
(1077, 40, 166, NULL, 30, 'Push Backs with Alternating Knee Taps', '3 sets', 'reps', NULL, '5 - 8 reps on each side', 45, '2023-02-25 16:32:04'),
(1078, 40, 42, NULL, 30, 'Cliffhanger Push-Ups - Modified', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 45, '2023-02-25 16:32:04'),
(1079, 40, 12, NULL, 30, '1 Leg Reaching Push-Ups - Alternating', '3 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-25 16:32:04'),
(1080, 46, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:33:29'),
(1081, 46, 165, NULL, 10, 'Push Backs on Knees', '1 set', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:33:29'),
(1082, 46, 73, NULL, 10, 'Good Mornings', '1 set', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:33:29'),
(1083, 46, 167, NULL, 10, 'Push -Ups', '1 set', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:33:29'),
(1084, 46, 228, NULL, 10, 'Superman - Arm Only', '1 set', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:33:29'),
(1085, 46, 148, NULL, 10, 'Plank - Elbows', '1 set', 'duration', '30', NULL, 20, '2023-02-25 16:33:29'),
(1086, 46, 249, NULL, 20, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:33:51'),
(1087, 46, 165, NULL, 20, 'Push Backs on Knees', '2 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:33:51'),
(1088, 46, 73, NULL, 20, 'Good Mornings', '2 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:33:52'),
(1089, 46, 167, NULL, 20, 'Push -Ups', '2 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:33:52'),
(1090, 46, 228, NULL, 20, 'Superman - Arm Only', '2 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:33:52'),
(1091, 46, 148, NULL, 20, 'Plank - Elbows', '2 sets', 'duration', '30', NULL, 20, '2023-02-25 16:33:52'),
(1092, 46, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:34:11'),
(1093, 46, 165, NULL, 30, 'Push Backs on Knees', '3 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:34:11'),
(1094, 46, 73, NULL, 30, 'Good Mornings', '3 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:34:11'),
(1095, 46, 167, NULL, 30, 'Push -Ups', '3 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:34:11'),
(1096, 46, 228, NULL, 30, 'Superman - Arm Only', '3 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:34:11'),
(1097, 46, 148, NULL, 30, 'Plank - Elbows', '3 sets', 'duration', '30', NULL, 20, '2023-02-25 16:34:11'),
(1098, 47, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:36:01'),
(1099, 47, 163, NULL, 10, 'Push Backs ', '1 set', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:36:01'),
(1100, 47, 74, NULL, 10, 'Good Mornings with Twist', '1 set', 'reps', NULL, '6 - 10 reps', 20, '2023-02-25 16:36:01'),
(1101, 47, 246, NULL, 10, 'Wide Push -Ups', '1 set', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:36:01'),
(1102, 47, 227, NULL, 10, 'Superman', '1 set', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:36:01'),
(1103, 47, 195, NULL, 10, 'Shoulder Taps', '1 set', 'duration', '20', NULL, 20, '2023-02-25 16:36:01'),
(1104, 47, 249, NULL, 20, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:36:18'),
(1105, 47, 163, NULL, 20, 'Push Backs ', '2 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:36:18'),
(1106, 47, 74, NULL, 20, 'Good Mornings with Twist', '2 sets', 'reps', NULL, '6 - 10 reps', 20, '2023-02-25 16:36:18'),
(1107, 47, 246, NULL, 20, 'Wide Push -Ups', '2 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:36:18'),
(1108, 47, 227, NULL, 20, 'Superman', '2 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:36:18'),
(1109, 47, 195, NULL, 20, 'Shoulder Taps', '2 sets', 'duration', '20', NULL, 20, '2023-02-25 16:36:18'),
(1110, 47, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:36:36'),
(1111, 47, 163, NULL, 30, 'Push Backs ', '3 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:36:36'),
(1112, 47, 74, NULL, 30, 'Good Mornings with Twist', '3 sets', 'reps', NULL, '6 - 10 reps', 20, '2023-02-25 16:36:36'),
(1113, 47, 246, NULL, 30, 'Wide Push -Ups', '3 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:36:36'),
(1114, 47, 227, NULL, 30, 'Superman', '3 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:36:36'),
(1115, 47, 195, NULL, 30, 'Shoulder Taps', '3 sets', 'duration', '20', NULL, 20, '2023-02-25 16:36:36'),
(1116, 48, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:37:58'),
(1117, 48, 92, NULL, 10, 'Hindu Puch-Ups (Dand)', '1 set', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:37:58'),
(1118, 48, 212, NULL, 10, 'Snow Angels - Bent Over', '1 set', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:37:58'),
(1119, 48, 139, NULL, 10, 'Narrow Push-Ups', '1 set', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:37:58'),
(1120, 48, 230, NULL, 10, 'Superman - Laterals', '1 set', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-25 16:37:58'),
(1121, 48, 137, NULL, 10, 'Mountain Climber', '1 set', 'duration', '20', NULL, 20, '2023-02-25 16:37:58'),
(1122, 48, 249, NULL, 20, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:38:15'),
(1123, 48, 92, NULL, 20, 'Hindu Puch-Ups (Dand)', '2 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:38:15'),
(1124, 48, 212, NULL, 20, 'Snow Angels - Bent Over', '2 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:38:15'),
(1125, 48, 139, NULL, 20, 'Narrow Push-Ups', '2 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:38:15'),
(1126, 48, 230, NULL, 20, 'Superman - Laterals', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-25 16:38:15'),
(1127, 48, 137, NULL, 20, 'Mountain Climber', '2 sets', 'duration', '20', NULL, 20, '2023-02-25 16:38:15'),
(1128, 48, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:38:31'),
(1129, 48, 92, NULL, 30, 'Hindu Puch-Ups (Dand)', '3 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:38:31'),
(1130, 48, 212, NULL, 30, 'Snow Angels - Bent Over', '3 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:38:31'),
(1131, 48, 139, NULL, 30, 'Narrow Push-Ups', '3 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:38:31'),
(1132, 48, 230, NULL, 30, 'Superman - Laterals', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-25 16:38:31'),
(1133, 48, 137, NULL, 30, 'Mountain Climber', '3 sets', 'duration', '20', NULL, 20, '2023-02-25 16:38:31'),
(1134, 49, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:40:13'),
(1135, 49, 164, NULL, 10, 'Push Back - Bidirectional', '1 set', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:40:13'),
(1136, 49, 212, NULL, 10, 'Snow Angels - Bent Over', '1 set', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:40:13'),
(1137, 49, 210, NULL, 10, 'Slow Push-Ups', '1 set', 'reps', NULL, '6 - 10 reps', 20, '2023-02-25 16:40:13'),
(1138, 49, 231, NULL, 10, 'Superman - Prisoner  Laterals', '1 set', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-25 16:40:13'),
(1139, 49, 138, NULL, 10, 'Mountain Climber - Cross Body', '1 set', 'duration', '30', NULL, 20, '2023-02-25 16:40:13'),
(1140, 49, 249, NULL, 20, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:40:32'),
(1141, 49, 164, NULL, 20, 'Push Back - Bidirectional', '2 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:40:32'),
(1142, 49, 212, NULL, 20, 'Snow Angels - Bent Over', '2 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:40:32'),
(1143, 49, 210, NULL, 20, 'Slow Push-Ups', '2 sets', 'reps', NULL, '6 - 10 reps', 20, '2023-02-25 16:40:32'),
(1144, 49, 231, NULL, 20, 'Superman - Prisoner  Laterals', '2 sets', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-25 16:40:32'),
(1145, 49, 138, NULL, 20, 'Mountain Climber - Cross Body', '2 sets', 'duration', '30', NULL, 20, '2023-02-25 16:40:32'),
(1146, 49, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:40:48'),
(1147, 49, 164, NULL, 30, 'Push Back - Bidirectional', '3 sets', 'reps', NULL, '10 - 15 reps', 20, '2023-02-25 16:40:48'),
(1148, 49, 212, NULL, 30, 'Snow Angels - Bent Over', '3 sets', 'reps', NULL, '8 - 12 reps', 20, '2023-02-25 16:40:48'),
(1149, 49, 210, NULL, 30, 'Slow Push-Ups', '3 sets', 'reps', NULL, '6 - 10 reps', 20, '2023-02-25 16:40:48'),
(1150, 49, 231, NULL, 30, 'Superman - Prisoner  Laterals', '3 sets', 'reps', NULL, '6 - 10 reps on each side', 20, '2023-02-25 16:40:48'),
(1151, 49, 138, NULL, 30, 'Mountain Climber - Cross Body', '3 sets', 'duration', '30', NULL, 20, '2023-02-25 16:40:48'),
(1152, 50, 249, NULL, 10, 'Wrist Circles', '1 set', 'reps', NULL, '10 reps', NULL, '2023-02-25 16:42:42'),
(1153, 50, 147, NULL, 10, 'Pike Push-Ups - 1 Leg', '1 set', 'reps', NULL, '8 -12 reps on each side', 30, '2023-02-25 16:42:42'),
(1154, 50, 5, NULL, 10, '1 Leg Deadlift', '1 set', 'reps', NULL, '8 - 12 reps on each side', 20, '2023-02-25 16:42:42'),
(1155, 50, 40, NULL, 10, 'Clapping Push-Ups ', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-25 16:42:42'),
(1156, 50, 229, NULL, 10, 'Superman - Full Scissors', '1 set', 'duration', '30', NULL, 20, '2023-02-25 16:42:42'),
(1157, 50, 186, NULL, 10, 'Russian Twist', '1 set', 'duration', '30', NULL, 20, '2023-02-25 16:42:42'),
(1164, 72, 249, NULL, 15, 'Wrist Circles', '1 set', 'reps', NULL, '10 in each direction', NULL, '2023-02-27 19:04:08'),
(1165, 72, 42, NULL, 15, 'Cliffhanger Push-Ups - Modified', '1 set', 'reps', NULL, '8 - 12 reps', 30, '2023-02-27 19:04:08'),
(1166, 72, 6, NULL, 15, '1 Leg Deadlift with Isometric Towel Pull', '1 set', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-27 19:04:08'),
(1167, 72, 36, NULL, 15, 'Circular Plank with Undulation', '1 set', 'reps', NULL, '6 - 10 reps in each direction', 20, '2023-02-27 19:04:08'),
(1168, 72, 72, NULL, 15, 'Glute Bridge with Kicks', '1 set', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-27 19:04:08'),
(1169, 72, 166, NULL, 15, 'Push Backs with Alternating Knee Taps', '1 set', 'reps', NULL, '10 - 15 reps', 30, '2023-02-27 19:04:08'),
(1170, 72, 29, NULL, 15, 'Calf Raises - Sumo Squat ', '1 set', 'reps', NULL, '15 - 18 reps', 20, '2023-02-27 19:04:08'),
(1171, 72, 249, NULL, 30, 'Wrist Circles', '1 set', 'reps', NULL, '10 in each direction', NULL, '2023-02-27 19:04:35'),
(1172, 72, 42, NULL, 30, 'Cliffhanger Push-Ups - Modified', '2 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-27 19:04:35'),
(1173, 72, 6, NULL, 30, '1 Leg Deadlift with Isometric Towel Pull', '2 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-27 19:04:35'),
(1174, 72, 36, NULL, 30, 'Circular Plank with Undulation', '2 sets', 'reps', NULL, '6 - 10 reps in each direction', 20, '2023-02-27 19:04:35'),
(1175, 72, 72, NULL, 30, 'Glute Bridge with Kicks', '2 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-27 19:04:35'),
(1176, 72, 166, NULL, 30, 'Push Backs with Alternating Knee Taps', '2 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-27 19:04:35'),
(1177, 72, 29, NULL, 30, 'Calf Raises - Sumo Squat ', '2 sets', 'reps', NULL, '15 - 18 reps', 20, '2023-02-27 19:04:35'),
(1178, 72, 249, NULL, 45, 'Wrist Circles', '1 set', 'reps', NULL, '10 in each direction', NULL, '2023-02-27 19:05:06'),
(1179, 72, 42, NULL, 45, 'Cliffhanger Push-Ups - Modified', '3 sets', 'reps', NULL, '8 - 12 reps', 30, '2023-02-27 19:05:06'),
(1180, 72, 6, NULL, 45, '1 Leg Deadlift with Isometric Towel Pull', '3 sets', 'reps', NULL, '4 - 7 reps on each side', 30, '2023-02-27 19:05:06'),
(1181, 72, 36, NULL, 45, 'Circular Plank with Undulation', '3 sets', 'reps', NULL, '6 - 10 reps in each direction', 20, '2023-02-27 19:05:06'),
(1182, 72, 72, NULL, 45, 'Glute Bridge with Kicks', '3 sets', 'reps', NULL, '8 - 12 reps on each side', 30, '2023-02-27 19:05:06'),
(1183, 72, 166, NULL, 45, 'Push Backs with Alternating Knee Taps', '3 sets', 'reps', NULL, '10 - 15 reps', 30, '2023-02-27 19:05:06'),
(1184, 72, 29, NULL, 45, 'Calf Raises - Sumo Squat ', '3 sets', 'reps', NULL, '15 - 18 reps', 20, '2023-02-27 19:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `focus_areas`
--

CREATE TABLE `focus_areas` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exercise` int NOT NULL DEFAULT '0',
  `workout` int NOT NULL DEFAULT '0',
  `program` int NOT NULL DEFAULT '0',
  `split` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `focus_areas`
--

INSERT INTO `focus_areas` (`id`, `name`, `slug`, `exercise`, `workout`, `program`, `split`, `created_at`) VALUES
(1, 'Legs', 'legs', 1, 1, 1, 0, '2022-12-02 09:23:04'),
(2, 'Core', 'core', 1, 1, 1, 0, '2022-12-02 09:23:37'),
(3, 'Shoulders', 'shoulders', 1, 1, 1, 0, '2022-12-02 09:24:10'),
(4, 'Chest', 'chest', 1, 1, 1, 0, '2022-12-02 09:24:43'),
(5, 'Triceps', 'triceps', 1, 1, 0, 0, '2022-12-02 09:25:11'),
(6, 'Forearms', 'forearms', 1, 1, 0, 0, '2022-12-02 09:25:47'),
(7, 'Back', 'back', 1, 1, 0, 0, '2022-12-02 09:29:52'),
(8, 'Glutes', 'glutes', 1, 1, 1, 0, '2022-12-02 09:30:55'),
(10, 'Biceps', 'biceps', 1, 1, 0, 0, '2022-12-02 09:32:47'),
(11, 'Calves', 'calves', 1, 1, 0, 0, '2022-12-02 09:35:04'),
(12, 'Full Body', 'full-body', 1, 1, 1, 1, '2022-12-02 12:04:53'),
(13, 'Upper Body', 'upper-body', 1, 1, 0, 0, '2022-12-05 13:47:04'),
(14, 'Lower Body', 'lower-body', 1, 1, 0, 0, '2022-12-05 13:52:51');

-- --------------------------------------------------------

--
-- Table structure for table `good_fors`
--

CREATE TABLE `good_fors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `good_fors`
--

INSERT INTO `good_fors` (`id`, `name`, `slug`, `created_at`) VALUES
(1, 'Building-mass', 'building-mass', '2022-12-02 09:26:51'),
(2, 'Functional Strength', 'functional-strength', '2022-12-02 12:07:59'),
(3, 'Burning Fat', 'burning-fat', '2022-12-02 12:08:23'),
(4, 'Building Muscle', 'building-muscle', '2022-12-05 12:08:57'),
(5, 'Fat Loss', 'fat-loss', '2022-12-05 12:09:34'),
(6, 'Functional Training', 'functional-training', '2022-12-05 12:09:55'),
(7, 'Back Pain', 'back-pain', '2022-12-05 12:10:06'),
(8, 'Balance', 'balance', '2022-12-05 12:10:23'),
(9, 'Back Health', 'back-health', '2022-12-05 13:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint UNSIGNED NOT NULL,
  `meal_id` int UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `meal_id`, `title`, `slug`, `quantity`, `created_at`) VALUES
(1, 1, 'Tea/Coffee w/ Almond Milk -', 'teacoffee-w-almond-milk', '1 cup (180 ml)', '2022-12-05 14:50:46'),
(2, 1, 'Apple -', 'apple', '100 gms (1 medium sized bowl)', '2022-12-05 14:51:10'),
(3, 1, 'Avocado -', 'avocado', '50 gms (approximately 1/4 avocado)', '2022-12-05 14:51:30'),
(4, 1, 'Mixed Veggies -', 'mixed-veggies', '100 gms (1 medium sized bowl)', '2022-12-05 14:52:12'),
(5, 1, 'Bread -', 'bread', '45 gms (approximately 2 slices)', '2022-12-05 14:52:32'),
(6, 2, 'Pita Bread -', 'pita-bread', '45 gms (1 6\" portion)', '2022-12-05 14:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `id` bigint UNSIGNED NOT NULL,
  `nutrition_id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `suggestions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`id`, `nutrition_id`, `code`, `title`, `slug`, `time`, `suggestions`, `created_at`) VALUES
(1, 1, 'POZMEAL1', 'Meal 1 - Breakfast (Approximate calories: 300)', 'meal-1-breakfast-approximate-calories-300', 'Morning', '<ul><li>Make a tomato, mushroom & avocado sandwich with the above ingredients</li></ul>', '2022-12-05 14:47:10'),
(2, 1, 'POZMEAL2', 'Meal 2 - Lunch (Approximate calories: 280)', 'meal-2-lunch-approximate-calories-280', 'Afternoon', '<ul><li>Drizzle some balsamic vinaigrette and olive oil on a plate of leafy greens, cucumber and capsicum slices & grated carrots</li></ul>', '2022-12-05 14:47:10'),
(3, 1, 'POZMEAL3', 'Meal 3 - Snack (Approximate calories: 260)', 'meal-3-snack-approximate-calories-260', 'Evening', '<ul><li>Blend the banana Blend the banana & pea protein with spinach or kale, 30 ml almond milk & some water to make a protein shake</li><li>whey isolate with 30 ml milk and some water to make a protein shake</li></ul>', '2022-12-05 14:47:10'),
(4, 1, 'POZMEAL4', 'Meal 4 - Dinner (Approximate calories: 350)', 'meal-4-dinner-approximate-calories-350', 'Night', '<ul><li>Make a stir fry with chopped vegetables & tofu make a wholesome bowl</li><li>Have with rice & a side of green salad</li></ul>', '2022-12-05 14:47:10'),
(5, 1, 'POZMEAL5', 'Meal 5 - Dessert (Approximate calories: 55)', 'meal-5-dessert-approximate-calories-55', 'Night', NULL, '2022-12-05 14:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `muscles`
--

CREATE TABLE `muscles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nutrition`
--

CREATE TABLE `nutrition` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `calorie_range_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `calorie_range_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nutrition`
--

INSERT INTO `nutrition` (`id`, `code`, `title`, `slug`, `calorie_range_1`, `calorie_range_2`, `image`, `instructions`, `created_at`) VALUES
(1, 'POZNUT1', ' Sample Eating Plan, Vegan Vegetarian 1', 'sample-eating-plan-vegan-vegetarian-1', '1100', '1350', NULL, '<ul><li>Measurements are in cooked weight, unless mentioned otherwise</li><li>The daily allowance for ghee/butter/oil (or any substitute) is 10 grams, to be split as desired, between breakfast, lunch, dinner & any other meals</li><li>The daily allowance for milk (whole, soy, almond or any other) is 100 ml</li><li>Substitute 100 grams of rice with 100 grams of sweet potato, or 80 grams of quinoa, or 80 grams of noodle, or 80 grams of wheat pasta or 40 grams of roti (Indian bread)</li><li>Substitute 1 slice of bread with 2 brown rice cakes</li><li>Substitute apple with any melon or papaya or berries of average 200 grams or any other fruit of average 100 grams</li><li>Meals can be interchanged or divided into multiple portions</li><li>Consume 3-3</li><li>5 litres of water a day</li><li>Aim to get 7-9 hours of restful sleep at night</li><li>Include 1 Multivitamin & 1 Omega-3 capsule in your day</li><li>It is recommended to consume a small quantity of simple carbs & protein, pre-workout</li><li>For more on ingredients & food substitution, please check out the nutrition blogs in our library</li></ul>', '2022-12-05 14:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int NOT NULL,
  `duration_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `price`, `plan_type`, `duration`, `duration_type`, `description`, `created_at`) VALUES
(1, 'Free', '0', 'trial', 1, 'months', 'Free Plan for free users', '2021-10-02 07:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `playlist_saved`
--

CREATE TABLE `playlist_saved` (
  `id` bigint UNSIGNED NOT NULL,
  `playlist_id` int UNSIGNED NOT NULL,
  `exercise_id` int UNSIGNED DEFAULT NULL,
  `workout_id` int UNSIGNED DEFAULT NULL,
  `program_id` int UNSIGNED DEFAULT NULL,
  `split_id` int UNSIGNED DEFAULT NULL,
  `strech_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `playlist_saved`
--

INSERT INTO `playlist_saved` (`id`, `playlist_id`, `exercise_id`, `workout_id`, `program_id`, `split_id`, `strech_id`, `created_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, '2022-12-03 06:35:43'),
(2, 1, 5, NULL, NULL, NULL, NULL, '2022-12-03 06:35:55'),
(3, 1, 4, NULL, NULL, NULL, NULL, '2022-12-03 06:36:00'),
(4, 2, 1, NULL, NULL, NULL, NULL, '2022-12-09 01:50:41'),
(5, 2, 2, NULL, NULL, NULL, NULL, '2022-12-09 01:50:47'),
(6, 3, 4, NULL, NULL, NULL, NULL, '2022-12-09 01:51:01'),
(8, 6, 1, NULL, NULL, NULL, NULL, '2022-12-28 03:38:55'),
(11, 1, 8, NULL, NULL, NULL, NULL, '2023-02-16 19:58:29');

-- --------------------------------------------------------

--
-- Table structure for table `poststrech_workout`
--

CREATE TABLE `poststrech_workout` (
  `id` bigint UNSIGNED NOT NULL,
  `exercise_id` int NOT NULL,
  `workout_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `good_for` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_days` int NOT NULL,
  `configured_days` int DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `focus_area` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `breath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instructions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` int NOT NULL DEFAULT '1',
  `category_id` bigint DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `code`, `title`, `slug`, `good_for`, `no_of_days`, `configured_days`, `image`, `focus_area`, `duration`, `video_link`, `level`, `breath`, `instructions`, `tags`, `visible`, `category_id`, `created_at`) VALUES
(5, 'POZPM1', 'Push-Up Extravaganza', 'push-up-extravaganza', 'building-muscle,fat-loss', 12, 12, '1670249856.jpg', 'core,shoulders,chest', '15,30', NULL, 'Intermediate,Advanced', '<ul><li>Because this program works the same muscles in every workout, you should always take at least 1 - 2 days off between sessions. This will ensure you get the most benefit from each workout, and will help avoid injury or joint strain.</li></ul>', '<ul><li>This fun and unique HIIT-style program focuses exclusively on unusual push-up variations that incorporate fluid movement and undulations. It is a great way to build your chest and triceps, while also increasing your functional-strength and mobility.</li><li>The first half of this program consists of 6 sessions of the Push-Up Power Workout, which introduces simpler versions of these push-up variations. After three sessions, the exercise times will increase in duration to further challenge your endurance once you get the hang of the movements. In the second half, you will perform the Undulating Push-Up Power Workout, which includes the more advanced versions, and which will again increase in duration after 3 sessions.</li><li>Some of these push-up variations may feel quite challenging at first, but once you get the hang of them, they are super fun! The key is to focus on your breath. Be sure to also watch the videos and read the tips. The time you put into truly understating and mastering them as you get started will pay off pay off tremendously in the long run.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(6, 'POZPM6', 'Spiral Power Plus', 'spiral-power-plus', 'functional-training,back-pain', 12, 4, '1670249894.jpg', 'full-body', '15,45,30', NULL, 'Intermediate,Advanced', '<ul><li>This program is designed to be performed 4 - 5 days a week. I recommend taking a rest day after every second session.</li></ul>', '<ul><li>This program alternates between upper and lower body workouts, with a focus on functional movement and spiral-based exercises.</li><li>You’ll perform this 2-day upper/lower body split 3 times (for a total of 6 workout sessions), with the durations of the exercises increasing the last time. Then you’ll move to a more advanced version of the same split, again performing it 3 times, with increased duration the last time.</li><li>Many of these exercises may be unfamiliar to you, so be sure to take the time to watch the videos and read the tips. The more you establish solid form early on, the more you’ll enjoy and benefit from these exercises.</li><li>This program repeats these alternating workouts multiple times before increasing the number of reps. Then it introduces you to more advanced variations of the same exercises, again increasing the number of reps toward the end of the program. This gives you the opportunity to learn the exercises and establish truly solid form, which which is key to building true strength and athleticism.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(7, 'POZPM7', 'Better Balance Basics', 'better-balance-basics', 'balance,functional-training,fat-loss', 8, NULL, NULL, 'full-body', '20 / 40 / 60', NULL, 'Beginner,Intermediate', '<ul><li>The most effective schedule for this program is to do the workouts every other day.</li><li>If you’re choosing the shortest versions of the workouts or are not feeling sore, you can also perform multiple days consecutively before taking a rest. Just be sure to always take at least one day off each week.</li></ul>', '<ul><li>This dynamic program is excellent for building functional-strength, with a focus on balance and stability.</li><li>You will perform the first workout five times, then will progress to more complex variations of the exercises in the second half of the program. Use the repetition in this program to perfect your form and build the strong foundations that will allow you to truly enjoy and benefit from these exercises.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(8, 'POZPM8', 'Burly Balance', 'burly-balance', 'balance,functional-training,fat-loss', 9, NULL, NULL, 'full-body', '20 / 40 / 60', NULL, 'Intermediate,Advanced', '<ul><li>The most effective schedule for this program is to do the workouts every other day.</li><li>If you’re choosing the shortest versions of the workouts or are not feeling sore, you can also perform multiple days consecutively before taking a rest. Just be sure to always take at least one day off each week.</li></ul>', '<ul><li>This program will introduce you to a series of fun and challenging functional exercises that focus on balance and athleticism. Throughout the program, you will progress through three versions of each exercise, increasing in complexity and difficulty.</li><li>You will perform each of the three workouts in this program only five times before progressing to a more challenging version, and it includes some awesomely challenging variations, so be sure to use each and every session to really master the exercises!</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(9, 'POZPM9', 'Glorious Glutes', 'glorious-glutes', 'building-muscle,back-pain', 6, 6, '1675842804.jpg', 'legs,core,glutes', '15,20,7', NULL, 'Beginner,Intermediate', '<ul><li>After each workout in this program, take 1 - 2 days off, depending on soreness. It’s important to give your muscles (and tendons and ligaments) time to recover before working them intensely again. And… this workout is intense!</li></ul>', '<ul><li>Grab your towel or yoga mat - this intense glute workout rocks multiple variations of the glute bridge, offering a powerful low impact workout for the glutes, hamstrings, and lower back.</li><li>You’ll perform the first workout three times before progressing to the next one. After your third session of the beginner workout, if you feel you’d like to repeat it again before moving on, feel free to repeat a day before continuing. To do this, tap the day number that you just completed instead of the next day’s number at the bottom of the Program Overview page. You may repeat any workout in any program as many times as you’d like before moving on.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(10, 'POZPM10', 'Golden Glutes', 'golden-glutes', 'building-muscle,back-pain', 6, 6, '1675842821.jpg', 'legs,core,glutes', '15,20,7', NULL, 'Intermediate,Advanced', '<ul><li>After each workout in this program, take 1 - 2 days off, depending on soreness. It’s important to give your muscles (and tendons and ligaments) time to recover before working them intensely again. And… this workout is intense!</li></ul>', '<ul><li>This two-phase program includes a wide variety of exercises to rock the glutes, hamstrings, and lower back. It includes fun and unusual glute bridge variations, with some especially challenging ones in the second half of the program.</li><li>You’ll perform the intermediate workout three times before progressing to 3 sessions of the advanced workout. After your third session, if you feel you’d like to repeat the first workout more before moving onto the next level of difficulty, feel free to repeat a day before continuing. To do this, simply tap the day number that you just completed instead of the next day’s number at the bottom of the Program Overview page. You may repeat any workout in any program as many times as you’d like before moving on.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(11, 'POZPM11', 'The Seven Minute Six Pack', 'the-seven-minute-six-pack', 'building-muscle,fat-loss,back-pain', 9, 9, '1675842854.jpg', 'core', '15,7', NULL, 'Beginner,Intermediate', '<ul><li>After each workout in this program, take 1 - 2 days off, depending on soreness. It’s important to give your muscles (and tendons and ligaments) time to recover before working them intensely again.</li><li>After your third session on each workout, if you feel you’d like to repeat it before moving onto the next level of difficulty, feel free to repeat a day before moving on. To do this, simply tap the day number that you just completed instead of the next day’s number at the bottom of the Program Overview page. You may repeat any workout in any program as many times as you’d like before moving on.</li><li>This program can be performed in tandem with another full body program for those looking to really focus on core strength.</li></ul>', '<ul><li>This program is a series of three quick, efficient HIIT-style core workouts. You will perform each workout three times before moving onto the next (more difficult) one.</li><li>While this program is called the Seven Minute Six Pack, you’ll be building more than just washboard abs! This program works every single muscle in the core, from the abs and obliques to the pelvic floor muscles and multifidus (the small muscles connected to each vertebra)… enjoy!</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(12, 'POZPM12', 'The Advanced Seven Minute Six Pack', 'the-advanced-seven-minute-six-pack', 'building-muscle,fat-loss,back-pain', 9, 9, '1675842873.jpg', 'core', '15,7', NULL, 'Intermediate,Advanced', '<ul><li>After each workout in this program, take 1 - 2 days off, depending on soreness. It’s important to give your muscles (and tendons and ligaments) time to recover before working them intensely again.</li><li>After your third session on each workout, if you feel you’d like to spend more time on it before moving on, feel free to repeat a day before continuing the program. To do this, simply tap the day number that you just completed instead of the next day’s number at the bottom of the Program Overview page.</li><li>This program can be performed in tandem with another full body program for those looking to really focus on core strength.</li></ul>', '<ul><li>This program combines classic core crushing exercises with a few of our favorite Poznic Training originals, to offer you a series of three rocking HIIT-style core workouts. You will perform each workout three times before moving onto the next (more difficult) one.</li><li>This program not only works the entire core, but also offers a killer cardio and balance challenge.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(13, 'POZPM13', 'Strong and Capable', 'strong-and-capable', 'building-muscle,fat-loss', 18, 18, '1675842894.jpg', 'full-body', '15,45,30', NULL, 'Beginner', '<ul><li>Perform the three days consecutively, then take one day off before repeating.</li><li>Or repeat the 3-day split (cycle) twice in a row before taking a rest day, but be sure to always take at least one day off each week.</li><li>This program is most appropriate for people working out at least 4 days a week.</li></ul>', '<ul><li>Whether you’re looking to burn fat, build muscle, or improve your general health, this well-rounded program will deliver. Inspired by traditional Push/Pull/Legs splits, it provides a full body workout over the course of each 3-day cycle.</li><li>First you’ll perform this 3-day full body split 3 times, for a total of 9 workout sessions. Then you’ll move to a more advanced version of the same split, again performing it 3 times.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(14, 'POZPM14', 'Ready for Action', 'ready-for-action', 'building-muscle,fat-loss', 27, 27, '1675842927.jpg', 'full-body', '15,45,30', NULL, 'Intermediate,Advanced', '<ul><li>Perform the three days consecutively, then take one day off before repeating.</li><li>Or repeat the 3-day split (cycle) twice in a row before taking a rest day, but be sure to always take at least one day off each week.</li><li>This program is most appropriate for people working out at least 4 days a week.</li></ul>', '<ul><li>This powerful program lasts approximately 6 weeks and is great for those looking to dive deep into an extended fitness journey. It is inspired by traditional Push/Pull/Legs splits, and provides a full body workout over the course of each 3-day cycle.</li><li>Throughout the 27 workout sessions, you’ll progress from simpler foundational exercises to more advanced and creative variations. Be sure to establish solid form in the early sessions  to ensure you can enjoy the more complex variations later in the program.</li><li>In this program, you’ll perform the first 3-day full body split 3 times, for a total of 9 workout sessions. Then you’ll move to a more challenging version of the same split, again performing it 3 times. Finally you’ll move to the most advanced version… good luck!</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(15, 'POZPM15', 'The Ultimate Full Body', 'the-ultimate-full-body', 'building-muscle,fat-loss', 18, 18, '1675842952.jpg', 'full-body', '15,45,30', NULL, 'Intermediate,Advanced', '<ul><li>Perform the three days consecutively, then take one day off before repeating.</li><li>Or repeat the 3-day split (cycle) twice in a row before taking a rest day, but be sure to always take at least one day off each week.</li><li>This program is most appropriate for people working out at least 4 days a week.</li></ul>', '<ul><li>This comprehensive program works strength, balance, explosive power, mobility, and endurance. The first half of the program is not easy, but be sure to commit yourself to learning and executing the exercises with power and precision, as the second half includes some really fun, dynamic, and challenging variations on what you’ll have mastered.</li><li>This program is inspired by traditional Push/Pull/Legs splits, and provides a full body workout over the course of each 3-day cycle.</li><li>You’ll perform the first 3-day full body split 3 times, for a total of 9 workout sessions. Then you’ll move to the more advanced version of the same split, again performing it 3 times.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(16, 'POZPM16', 'Strong and Steady Legs', 'strong-and-steady-legs', 'building-muscle,back-pain', 6, NULL, '1675842971.jpg', 'legs,core,glutes', '10,20,30', NULL, 'Beginner', '<ul><li>After each workout in this program, take 1 - 2 days off, depending on soreness. It’s important to give your muscles (and tendons and ligaments) time to recover before working them intensely again. Enjoy!</li></ul>', '<ul><li>This short, focused program gives a powerful boost to your glutes, hamstrings and lower back. It’s a great way to decrease back pain, improve strength through the lower body, and improve stability and balance.</li><li>You’ll perform the first workout three times before progressing to the next one. After your third session of the beginner workout, if you feel you’d like to spend more time on it before moving on, feel free to repeat a day before continuing. To do this, tap the day number that you just completed instead of the next day’s number at the bottom of the Program Overview page. You may repeat any workout in any program as many times as you’d like before moving on.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(17, 'POZPM17', 'Lower Body Lift Off', 'lower-body-lift-off', 'functional-training,back-pain', 9, NULL, '1675842999.jpg', 'legs,core,glutes', '10,20,30', NULL, 'Intermediate', '<ul><li>After each workout in this program, take 1 - 2 days off, depending on soreness. It’s important to give your muscles (and tendons and ligaments) time to recover before working them intensely again. Enjoy!</li></ul>', '<ul><li>This program rocks your glutes and hamstrings through a progression of dynamic exercises that include challenges in strength, balance, and explosive power. They also include a solid dose of spinal rotations, offering a wonderful benefit to those with back issues, as well as anyone looking of increase functional-strength and athleticism.</li><li>You’ll perform each of the three workouts three times, for a total of 9 sessions. The exercises in each workout progress in difficulty, so if you feel you need more time to master one of the workouts before moving on, feel free to repeat it. To do this, tap the day number that you just completed instead of the next day’s number at the bottom of the Program Overview page. You may repeat any workout in any program as many times as you’d like before moving on.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(18, 'POZPM18', 'Legs of Steel', 'legs-of-steel', 'building-muscle,back-pain', 6, NULL, '1675843014.jpg', 'legs,core,glutes', '10,20,30', NULL, 'Advanced', '<ul><li>After each workout in this program, take 1 - 2 days off, depending on soreness. It’s important to give your muscles (and tendons and ligaments) time to recover before working them intensely again. Enjoy!</li></ul>', '<ul><li>This program is built from two highly athletic workouts and will keep you sweating while building truly powerful glutes and hamstrings.</li><li>You’ll perform the first workout three times before progressing to the next one. After your third session of the first workout, if you feel you’d like to spend more time on it before moving on, feel free to repeat a day before continuing. To do this, tap the day number that you just completed instead of the next day’s number at the bottom of the Program Overview page. You may repeat any workout in any program as many times as you’d like before moving on.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(19, 'POZPM19', 'Vital Body Basics', 'vital-body-basics', 'building-muscle,fat-loss', 12, 12, '1675843039.jpg', 'full-body', '15,45,30', NULL, 'Beginner', '<ul><li>It’s ideal to perform both days of a split consecutively before taking a break. So with this program, you can take a break after every 2, 4, or 6 days. Just be sure to take at least one day off each week.</li></ul>', '<ul><li>This program alternates between upper and lower body workouts, and consists exclusively of classic exercises that are guaranteed to deliver results. If you’re eager to dive into powerful workouts without having to learn complex new exercises, this program is for you!</li><li>You’ll perform this 2-day upper/lower body split 3 times, for a total of 6 sessions. Then you’ll move to a split with more advanced versions of the same exercises, again performing it 3 times.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(20, 'POZPM20', 'The Classic Full Body', 'the-classic-full-body', 'building-muscle,fat-loss', 18, 18, '1675843061.jpg', 'full-body', '15,45,30', NULL, 'Intermediate', '<ul><li>It’s ideal to perform both days of a split consecutively before taking a break. So with this program, you can take a break after every 2, 4, or 6 days. Just be sure to take at least one day off each week.</li></ul>', '<ul><li>This program is made up of tried and true exercises that will help you build strength and burn calories. It alternates between upper and lower body workouts, and progresses through three levels of difficulty over 18 sessions.</li><li>As exercises in this program are less unusual than some others in this app, it’s a great chance to work on really honing your form and execution of these classics.</li><li>You’ll perform the first 2-day split 3 times, for a total of 6 sessions. The exercises will increase in difficulty after that, and then again after another 6.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(21, 'POZPM21', 'Full Body Adventure', 'full-body-adventure', 'building-muscle,fat-loss', 18, 18, '1675843092.jpg', 'full-body', '15,45,30', NULL, 'Intermediate,Advanced', '<ul><li>As this program is intense, I recommend taking a rest day after every second workout.</li><li>If you prefer, you can also take a rest day after every 4 or 6 days. Gains in strength and size are best achieved by working muscles that are not too sore. So if, for example, you’re about to work your legs and they’re still sore from the workout two days before, it might wise to take a rest day before continuing. Regardless of soreness, always be sure to take at least one day off each week.</li></ul>', '<ul><li>Ready for a challenge? This program progresses from classic intermediate exercises to powerfully demanding variations that will leave you exhausted but proud of yourself… and stronger too!</li><li>It alternates between upper and lower body workouts, and progresses through three levels of difficulty over 18 sessions.</li><li>You’ll perform the first 2-day split 3 times, for a total of 6 sessions. Then the exercises will increase in difficulty, and then again after another 6 sessions.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(22, 'POZPM22', 'Functional Fun', 'functional-fun', 'functional-strength,building-muscle,fat-loss', 30, 30, '1675843124.jpg', 'full-body', '15,45,30', NULL, 'Beginner,Intermediate', '<ul><li>Due to the functional nature of this program and the alternation between upper and lower body, you can safely perform it multiple days in a row. The simplest way to perform it is to do two days in a row and then take a rest day. If you’re not too sore, you can also string together up to 6 days of workouts in a row,  as long as you take at least one full rest day per week.</li></ul>', '<ul><li>This program focuses on balance, coordination, and functional strength, using fun, original exercises. The first 6 workouts are foundational, low-impact beginner’s workouts, which will help prepare you for the more unusual workouts as you move along. This program is especially effective for athletes, or anyone looking to improve their dynamic movement skills.</li><li>This program alternates between upper and lower body workouts, repeating each 2-day (upper/lower) split 3 times before progressing the next, more difficult set of workouts.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14'),
(23, 'POZPM23', 'The Athletic Body', 'the-athletic-body', 'functional-strength,building-muscle,fat-loss', 24, 24, '1675843156.jpg', 'full-body', '15,45,30', NULL, 'Intermediate,Advanced', '<ul><li>Due to the functional nature of this program and the alternation between upper and lower body, you can safely perform it multiple days in a row. The simplest way to perform it is to do two days in a row and then take a rest day. If you’re not too sore, you can also string together up to 6 days of workouts in a row,  as long as you take at least one full rest day per week.</li></ul>', '<ul><li>This program focuses on balance, coordination, and functional strength, using fun, original exercises. The first 6 workouts are foundational, low-impact beginner’s workouts, which will help prepare you for the more unusual workouts as you move along. This program is especially effective for athletes, or anyone looking to improve their dynamic movement skills.</li><li>This program alternates between upper and lower body workouts, repeating each 2-day (upper/lower) split 3 times before progressing the next, more difficult set of workouts.</li></ul>', NULL, 1, NULL, '2022-12-05 12:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `program_workout`
--

CREATE TABLE `program_workout` (
  `id` bigint UNSIGNED NOT NULL,
  `program_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `workout_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int NOT NULL,
  `starting_day` int NOT NULL,
  `ending_day` int NOT NULL,
  `total_days` int NOT NULL,
  `frequency` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_workout`
--

INSERT INTO `program_workout` (`id`, `program_id`, `workout_id`, `duration`, `starting_day`, `ending_day`, `total_days`, `frequency`, `created_at`) VALUES
(1, '5', '2', 15, 1, 3, 3, NULL, '2022-12-18 07:03:07'),
(2, '5', '3', 15, 4, 6, 3, NULL, '2022-12-18 07:03:07'),
(3, '5', '4', 15, 7, 9, 3, NULL, '2022-12-18 07:03:07'),
(4, '5', '5', 15, 10, 12, 3, NULL, '2022-12-18 07:03:07'),
(5, '5', '2', 30, 1, 3, 3, NULL, '2022-12-18 09:09:09'),
(6, '5', '3', 30, 4, 6, 3, NULL, '2022-12-18 09:09:09'),
(7, '5', '4', 30, 7, 9, 3, NULL, '2022-12-18 09:09:09'),
(8, '5', '5', 30, 10, 12, 3, NULL, '2022-12-18 09:09:09'),
(9, '6', '14', 15, 1, 1, 1, NULL, '2023-01-10 00:26:39'),
(10, '6', '3', 15, 2, 2, 1, NULL, '2023-01-10 00:26:39'),
(11, '6', '4', 15, 3, 3, 1, NULL, '2023-01-10 00:26:39'),
(12, '6', '5', 15, 4, 4, 1, NULL, '2023-01-10 00:26:39'),
(13, '6', '14', 45, 1, 1, 1, NULL, '2023-01-10 00:26:58'),
(14, '6', '3', 45, 2, 2, 1, NULL, '2023-01-10 00:26:58'),
(15, '6', '4', 45, 3, 3, 1, NULL, '2023-01-10 00:26:58'),
(16, '6', '5', 45, 4, 4, 1, NULL, '2023-01-10 00:26:58'),
(17, '6', '14', 30, 1, 1, 1, NULL, '2023-01-10 00:27:13'),
(18, '6', '3', 30, 2, 2, 1, NULL, '2023-01-10 00:27:13'),
(19, '6', '4', 30, 3, 3, 1, NULL, '2023-01-10 00:27:13'),
(20, '6', '5', 30, 4, 4, 1, NULL, '2023-01-10 00:27:13'),
(21, '9', '11', 7, 1, 3, 3, NULL, '2023-01-10 00:37:21'),
(22, '9', '12', 7, 4, 6, 3, NULL, '2023-01-10 00:37:21'),
(23, '9', '11', 15, 1, 3, 3, NULL, '2023-01-10 00:37:49'),
(24, '9', '12', 15, 4, 6, 3, NULL, '2023-01-10 00:37:49'),
(25, '9', '11', 20, 1, 3, 3, NULL, '2023-01-10 00:38:03'),
(26, '9', '12', 20, 4, 6, 3, NULL, '2023-01-10 00:38:03'),
(27, '10', '12', 7, 1, 3, 3, NULL, '2023-01-10 00:40:51'),
(28, '10', '13', 7, 4, 6, 3, NULL, '2023-01-10 00:40:51'),
(29, '10', '12', 15, 1, 3, 3, NULL, '2023-01-10 00:41:07'),
(30, '10', '13', 15, 4, 6, 3, NULL, '2023-01-10 00:41:07'),
(31, '10', '12', 20, 1, 3, 3, NULL, '2023-01-10 00:41:22'),
(32, '10', '13', 20, 4, 6, 3, NULL, '2023-01-10 00:41:22'),
(33, '11', '26', 7, 1, 3, 3, NULL, '2023-01-10 00:45:25'),
(34, '11', '27', 7, 4, 6, 3, NULL, '2023-01-10 00:45:25'),
(35, '11', '28', 7, 7, 9, 3, NULL, '2023-01-10 00:45:25'),
(36, '11', '26', 15, 1, 3, 3, NULL, '2023-01-10 00:45:42'),
(37, '11', '27', 15, 4, 6, 3, NULL, '2023-01-10 00:45:42'),
(38, '11', '28', 15, 7, 9, 3, NULL, '2023-01-10 00:45:42'),
(39, '12', '28', 7, 1, 3, 3, NULL, '2023-01-10 00:49:48'),
(40, '12', '29', 7, 4, 6, 3, NULL, '2023-01-10 00:49:48'),
(41, '12', '30', 7, 7, 9, 3, NULL, '2023-01-10 00:49:48'),
(42, '12', '28', 15, 1, 3, 3, NULL, '2023-01-10 00:50:07'),
(43, '12', '29', 15, 4, 6, 3, NULL, '2023-01-10 00:50:07'),
(44, '12', '30', 15, 7, 9, 3, NULL, '2023-01-10 00:50:07'),
(45, '13', '36', 15, 1, 1, 1, NULL, '2023-01-10 01:10:56'),
(46, '13', '31', 15, 2, 2, 1, NULL, '2023-01-10 01:10:56'),
(47, '13', '41', 15, 3, 3, 1, NULL, '2023-01-10 01:10:56'),
(48, '13', '36', 15, 4, 4, 1, NULL, '2023-01-10 01:10:56'),
(49, '13', '31', 15, 5, 5, 1, NULL, '2023-01-10 01:10:56'),
(50, '13', '41', 15, 6, 6, 1, NULL, '2023-01-10 01:10:56'),
(51, '13', '36', 15, 7, 7, 1, NULL, '2023-01-10 01:10:56'),
(52, '13', '31', 15, 8, 8, 1, NULL, '2023-01-10 01:10:56'),
(53, '13', '41', 15, 9, 9, 1, NULL, '2023-01-10 01:10:56'),
(54, '13', '37', 15, 10, 10, 1, NULL, '2023-01-10 01:10:56'),
(55, '13', '32', 15, 11, 11, 1, NULL, '2023-01-10 01:10:56'),
(56, '13', '42', 15, 12, 12, 1, NULL, '2023-01-10 01:10:56'),
(57, '13', '37', 15, 13, 13, 1, NULL, '2023-01-10 01:10:56'),
(58, '13', '32', 15, 14, 14, 1, NULL, '2023-01-10 01:10:56'),
(59, '13', '42', 15, 15, 15, 1, NULL, '2023-01-10 01:10:56'),
(60, '13', '37', 15, 16, 16, 1, NULL, '2023-01-10 01:10:56'),
(61, '13', '32', 15, 17, 17, 1, NULL, '2023-01-10 01:10:56'),
(62, '13', '42', 15, 18, 18, 1, NULL, '2023-01-10 01:10:56'),
(63, '13', '36', 30, 1, 1, 1, NULL, '2023-01-10 01:11:14'),
(64, '13', '31', 30, 2, 2, 1, NULL, '2023-01-10 01:11:14'),
(65, '13', '41', 30, 3, 3, 1, NULL, '2023-01-10 01:11:14'),
(66, '13', '36', 30, 4, 4, 1, NULL, '2023-01-10 01:11:14'),
(67, '13', '31', 30, 5, 5, 1, NULL, '2023-01-10 01:11:14'),
(68, '13', '41', 30, 6, 6, 1, NULL, '2023-01-10 01:11:14'),
(69, '13', '36', 30, 7, 7, 1, NULL, '2023-01-10 01:11:14'),
(70, '13', '31', 30, 8, 8, 1, NULL, '2023-01-10 01:11:14'),
(71, '13', '41', 30, 9, 9, 1, NULL, '2023-01-10 01:11:14'),
(72, '13', '37', 30, 10, 10, 1, NULL, '2023-01-10 01:11:14'),
(73, '13', '32', 30, 11, 11, 1, NULL, '2023-01-10 01:11:14'),
(74, '13', '42', 30, 12, 12, 1, NULL, '2023-01-10 01:11:14'),
(75, '13', '37', 30, 13, 13, 1, NULL, '2023-01-10 01:11:14'),
(76, '13', '32', 30, 14, 14, 1, NULL, '2023-01-10 01:11:14'),
(77, '13', '42', 30, 15, 15, 1, NULL, '2023-01-10 01:11:14'),
(78, '13', '37', 30, 16, 16, 1, NULL, '2023-01-10 01:11:14'),
(79, '13', '32', 30, 17, 17, 1, NULL, '2023-01-10 01:11:14'),
(80, '13', '42', 30, 18, 18, 1, NULL, '2023-01-10 01:11:14'),
(81, '13', '36', 45, 1, 1, 1, NULL, '2023-01-10 01:11:29'),
(82, '13', '31', 45, 2, 2, 1, NULL, '2023-01-10 01:11:29'),
(83, '13', '41', 45, 3, 3, 1, NULL, '2023-01-10 01:11:29'),
(84, '13', '36', 45, 4, 4, 1, NULL, '2023-01-10 01:11:29'),
(85, '13', '31', 45, 5, 5, 1, NULL, '2023-01-10 01:11:29'),
(86, '13', '41', 45, 6, 6, 1, NULL, '2023-01-10 01:11:29'),
(87, '13', '36', 45, 7, 7, 1, NULL, '2023-01-10 01:11:29'),
(88, '13', '31', 45, 8, 8, 1, NULL, '2023-01-10 01:11:29'),
(89, '13', '41', 45, 9, 9, 1, NULL, '2023-01-10 01:11:29'),
(90, '13', '37', 45, 10, 10, 1, NULL, '2023-01-10 01:11:29'),
(91, '13', '32', 45, 11, 11, 1, NULL, '2023-01-10 01:11:29'),
(92, '13', '42', 45, 12, 12, 1, NULL, '2023-01-10 01:11:29'),
(93, '13', '37', 45, 13, 13, 1, NULL, '2023-01-10 01:11:29'),
(94, '13', '32', 45, 14, 14, 1, NULL, '2023-01-10 01:11:29'),
(95, '13', '42', 45, 15, 15, 1, NULL, '2023-01-10 01:11:29'),
(96, '13', '37', 45, 16, 16, 1, NULL, '2023-01-10 01:11:29'),
(97, '13', '32', 45, 17, 17, 1, NULL, '2023-01-10 01:11:29'),
(98, '13', '42', 45, 18, 18, 1, NULL, '2023-01-10 01:11:29'),
(99, '14', '37', 15, 1, 1, 1, NULL, '2023-01-10 01:32:01'),
(100, '14', '32', 15, 2, 2, 1, NULL, '2023-01-10 01:32:01'),
(101, '14', '42', 15, 3, 3, 1, NULL, '2023-01-10 01:32:01'),
(102, '14', '37', 15, 4, 4, 1, NULL, '2023-01-10 01:32:01'),
(103, '14', '32', 15, 5, 5, 1, NULL, '2023-01-10 01:32:01'),
(104, '14', '42', 15, 6, 6, 1, NULL, '2023-01-10 01:32:01'),
(105, '14', '37', 15, 7, 7, 1, NULL, '2023-01-10 01:32:01'),
(106, '14', '32', 15, 8, 8, 1, NULL, '2023-01-10 01:32:01'),
(107, '14', '42', 15, 9, 9, 1, NULL, '2023-01-10 01:32:01'),
(108, '14', '38', 15, 10, 10, 1, NULL, '2023-01-10 01:32:01'),
(109, '14', '33', 15, 11, 11, 1, NULL, '2023-01-10 01:32:01'),
(110, '14', '43', 15, 12, 12, 1, NULL, '2023-01-10 01:32:01'),
(111, '14', '38', 15, 13, 13, 1, NULL, '2023-01-10 01:32:01'),
(112, '14', '33', 15, 14, 14, 1, NULL, '2023-01-10 01:32:01'),
(113, '14', '38', 15, 15, 15, 1, NULL, '2023-01-10 01:32:01'),
(114, '14', '33', 15, 16, 16, 1, NULL, '2023-01-10 01:32:01'),
(115, '14', '43', 15, 17, 17, 1, NULL, '2023-01-10 01:32:01'),
(116, '14', '39', 15, 18, 18, 1, NULL, '2023-01-10 01:32:01'),
(117, '14', '34', 15, 19, 19, 1, NULL, '2023-01-10 01:32:01'),
(118, '14', '44', 15, 20, 20, 1, NULL, '2023-01-10 01:32:01'),
(119, '14', '39', 15, 21, 21, 1, NULL, '2023-01-10 01:32:01'),
(120, '14', '34', 15, 22, 22, 1, NULL, '2023-01-10 01:32:01'),
(121, '14', '44', 15, 23, 23, 1, NULL, '2023-01-10 01:32:01'),
(122, '14', '39', 15, 24, 24, 1, NULL, '2023-01-10 01:32:01'),
(123, '14', '34', 15, 25, 25, 1, NULL, '2023-01-10 01:32:01'),
(124, '14', '44', 15, 26, 26, 1, NULL, '2023-01-10 01:32:01'),
(125, '14', '43', 15, 27, 27, 1, NULL, '2023-01-10 01:32:01'),
(126, '14', '37', 30, 1, 1, 1, NULL, '2023-01-10 01:32:19'),
(127, '14', '32', 30, 2, 2, 1, NULL, '2023-01-10 01:32:19'),
(128, '14', '42', 30, 3, 3, 1, NULL, '2023-01-10 01:32:19'),
(129, '14', '37', 30, 4, 4, 1, NULL, '2023-01-10 01:32:19'),
(130, '14', '32', 30, 5, 5, 1, NULL, '2023-01-10 01:32:19'),
(131, '14', '42', 30, 6, 6, 1, NULL, '2023-01-10 01:32:19'),
(132, '14', '37', 30, 7, 7, 1, NULL, '2023-01-10 01:32:19'),
(133, '14', '32', 30, 8, 8, 1, NULL, '2023-01-10 01:32:19'),
(134, '14', '42', 30, 9, 9, 1, NULL, '2023-01-10 01:32:19'),
(135, '14', '38', 30, 10, 10, 1, NULL, '2023-01-10 01:32:19'),
(136, '14', '33', 30, 11, 11, 1, NULL, '2023-01-10 01:32:19'),
(137, '14', '43', 30, 12, 12, 1, NULL, '2023-01-10 01:32:19'),
(138, '14', '38', 30, 13, 13, 1, NULL, '2023-01-10 01:32:19'),
(139, '14', '33', 30, 14, 14, 1, NULL, '2023-01-10 01:32:19'),
(140, '14', '38', 30, 15, 15, 1, NULL, '2023-01-10 01:32:19'),
(141, '14', '33', 30, 16, 16, 1, NULL, '2023-01-10 01:32:19'),
(142, '14', '43', 30, 17, 17, 1, NULL, '2023-01-10 01:32:19'),
(143, '14', '39', 30, 18, 18, 1, NULL, '2023-01-10 01:32:19'),
(144, '14', '34', 30, 19, 19, 1, NULL, '2023-01-10 01:32:19'),
(145, '14', '44', 30, 20, 20, 1, NULL, '2023-01-10 01:32:19'),
(146, '14', '39', 30, 21, 21, 1, NULL, '2023-01-10 01:32:19'),
(147, '14', '34', 30, 22, 22, 1, NULL, '2023-01-10 01:32:19'),
(148, '14', '44', 30, 23, 23, 1, NULL, '2023-01-10 01:32:19'),
(149, '14', '39', 30, 24, 24, 1, NULL, '2023-01-10 01:32:19'),
(150, '14', '34', 30, 25, 25, 1, NULL, '2023-01-10 01:32:19'),
(151, '14', '44', 30, 26, 26, 1, NULL, '2023-01-10 01:32:19'),
(152, '14', '43', 30, 27, 27, 1, NULL, '2023-01-10 01:32:19'),
(153, '14', '37', 45, 1, 1, 1, NULL, '2023-01-10 01:32:41'),
(154, '14', '32', 45, 2, 2, 1, NULL, '2023-01-10 01:32:41'),
(155, '14', '42', 45, 3, 3, 1, NULL, '2023-01-10 01:32:41'),
(156, '14', '37', 45, 4, 4, 1, NULL, '2023-01-10 01:32:41'),
(157, '14', '32', 45, 5, 5, 1, NULL, '2023-01-10 01:32:41'),
(158, '14', '42', 45, 6, 6, 1, NULL, '2023-01-10 01:32:41'),
(159, '14', '37', 45, 7, 7, 1, NULL, '2023-01-10 01:32:41'),
(160, '14', '32', 45, 8, 8, 1, NULL, '2023-01-10 01:32:41'),
(161, '14', '42', 45, 9, 9, 1, NULL, '2023-01-10 01:32:41'),
(162, '14', '38', 45, 10, 10, 1, NULL, '2023-01-10 01:32:41'),
(163, '14', '33', 45, 11, 11, 1, NULL, '2023-01-10 01:32:41'),
(164, '14', '43', 45, 12, 12, 1, NULL, '2023-01-10 01:32:41'),
(165, '14', '38', 45, 13, 13, 1, NULL, '2023-01-10 01:32:41'),
(166, '14', '33', 45, 14, 14, 1, NULL, '2023-01-10 01:32:41'),
(167, '14', '38', 45, 15, 15, 1, NULL, '2023-01-10 01:32:41'),
(168, '14', '33', 45, 16, 16, 1, NULL, '2023-01-10 01:32:41'),
(169, '14', '43', 45, 17, 17, 1, NULL, '2023-01-10 01:32:41'),
(170, '14', '39', 45, 18, 18, 1, NULL, '2023-01-10 01:32:41'),
(171, '14', '34', 45, 19, 19, 1, NULL, '2023-01-10 01:32:41'),
(172, '14', '44', 45, 20, 20, 1, NULL, '2023-01-10 01:32:41'),
(173, '14', '39', 45, 21, 21, 1, NULL, '2023-01-10 01:32:41'),
(174, '14', '34', 45, 22, 22, 1, NULL, '2023-01-10 01:32:41'),
(175, '14', '44', 45, 23, 23, 1, NULL, '2023-01-10 01:32:41'),
(176, '14', '39', 45, 24, 24, 1, NULL, '2023-01-10 01:32:41'),
(177, '14', '34', 45, 25, 25, 1, NULL, '2023-01-10 01:32:41'),
(178, '14', '44', 45, 26, 26, 1, NULL, '2023-01-10 01:32:41'),
(179, '14', '43', 45, 27, 27, 1, NULL, '2023-01-10 01:32:41'),
(180, '15', '39', 15, 1, 1, 1, NULL, '2023-01-10 06:39:36'),
(181, '15', '34', 15, 2, 2, 1, NULL, '2023-01-10 06:39:36'),
(182, '15', '44', 15, 3, 3, 1, NULL, '2023-01-10 06:39:36'),
(183, '15', '39', 15, 4, 4, 1, NULL, '2023-01-10 06:39:36'),
(184, '15', '34', 15, 5, 5, 1, NULL, '2023-01-10 06:39:36'),
(185, '15', '44', 15, 6, 6, 1, NULL, '2023-01-10 06:39:36'),
(186, '15', '39', 15, 7, 7, 1, NULL, '2023-01-10 06:39:36'),
(187, '15', '34', 15, 8, 8, 1, NULL, '2023-01-10 06:39:36'),
(188, '15', '44', 15, 9, 9, 1, NULL, '2023-01-10 06:39:36'),
(189, '15', '40', 15, 10, 10, 1, NULL, '2023-01-10 06:39:36'),
(190, '15', '35', 15, 11, 11, 1, NULL, '2023-01-10 06:39:36'),
(191, '15', '45', 15, 12, 12, 1, NULL, '2023-01-10 06:39:36'),
(192, '15', '40', 15, 13, 13, 1, NULL, '2023-01-10 06:39:36'),
(193, '15', '35', 15, 14, 14, 1, NULL, '2023-01-10 06:39:36'),
(194, '15', '45', 15, 15, 15, 1, NULL, '2023-01-10 06:39:36'),
(195, '15', '40', 15, 16, 16, 1, NULL, '2023-01-10 06:39:36'),
(196, '15', '35', 15, 17, 17, 1, NULL, '2023-01-10 06:39:36'),
(197, '15', '45', 15, 18, 18, 1, NULL, '2023-01-10 06:39:36'),
(198, '15', '39', 30, 1, 1, 1, NULL, '2023-01-10 06:39:54'),
(199, '15', '34', 30, 2, 2, 1, NULL, '2023-01-10 06:39:54'),
(200, '15', '44', 30, 3, 3, 1, NULL, '2023-01-10 06:39:54'),
(201, '15', '39', 30, 4, 4, 1, NULL, '2023-01-10 06:39:54'),
(202, '15', '34', 30, 5, 5, 1, NULL, '2023-01-10 06:39:54'),
(203, '15', '44', 30, 6, 6, 1, NULL, '2023-01-10 06:39:54'),
(204, '15', '39', 30, 7, 7, 1, NULL, '2023-01-10 06:39:54'),
(205, '15', '34', 30, 8, 8, 1, NULL, '2023-01-10 06:39:54'),
(206, '15', '44', 30, 9, 9, 1, NULL, '2023-01-10 06:39:54'),
(207, '15', '40', 30, 10, 10, 1, NULL, '2023-01-10 06:39:54'),
(208, '15', '35', 30, 11, 11, 1, NULL, '2023-01-10 06:39:54'),
(209, '15', '45', 30, 12, 12, 1, NULL, '2023-01-10 06:39:54'),
(210, '15', '40', 30, 13, 13, 1, NULL, '2023-01-10 06:39:54'),
(211, '15', '35', 30, 14, 14, 1, NULL, '2023-01-10 06:39:54'),
(212, '15', '45', 30, 15, 15, 1, NULL, '2023-01-10 06:39:54'),
(213, '15', '40', 30, 16, 16, 1, NULL, '2023-01-10 06:39:54'),
(214, '15', '35', 30, 17, 17, 1, NULL, '2023-01-10 06:39:54'),
(215, '15', '45', 30, 18, 18, 1, NULL, '2023-01-10 06:39:54'),
(216, '15', '39', 45, 1, 1, 1, NULL, '2023-01-10 06:40:15'),
(217, '15', '34', 45, 2, 2, 1, NULL, '2023-01-10 06:40:15'),
(218, '15', '44', 45, 3, 3, 1, NULL, '2023-01-10 06:40:15'),
(219, '15', '39', 45, 4, 4, 1, NULL, '2023-01-10 06:40:15'),
(220, '15', '34', 45, 5, 5, 1, NULL, '2023-01-10 06:40:15'),
(221, '15', '44', 45, 6, 6, 1, NULL, '2023-01-10 06:40:15'),
(222, '15', '39', 45, 7, 7, 1, NULL, '2023-01-10 06:40:15'),
(223, '15', '34', 45, 8, 8, 1, NULL, '2023-01-10 06:40:15'),
(224, '15', '44', 45, 9, 9, 1, NULL, '2023-01-10 06:40:15'),
(225, '15', '40', 45, 10, 10, 1, NULL, '2023-01-10 06:40:15'),
(226, '15', '35', 45, 11, 11, 1, NULL, '2023-01-10 06:40:15'),
(227, '15', '45', 45, 12, 12, 1, NULL, '2023-01-10 06:40:15'),
(228, '15', '40', 45, 13, 13, 1, NULL, '2023-01-10 06:40:15'),
(229, '15', '35', 45, 14, 14, 1, NULL, '2023-01-10 06:40:15'),
(230, '15', '45', 45, 15, 15, 1, NULL, '2023-01-10 06:40:15'),
(231, '15', '40', 45, 16, 16, 1, NULL, '2023-01-10 06:40:15'),
(232, '15', '35', 45, 17, 17, 1, NULL, '2023-01-10 06:40:15'),
(233, '15', '45', 45, 18, 18, 1, NULL, '2023-01-10 06:40:15'),
(234, '19', '46', 15, 1, 1, 1, NULL, '2023-01-12 09:25:01'),
(235, '19', '51', 15, 2, 2, 1, NULL, '2023-01-12 09:25:01'),
(236, '19', '46', 15, 3, 3, 1, NULL, '2023-01-12 09:25:01'),
(237, '19', '51', 15, 4, 4, 1, NULL, '2023-01-12 09:25:01'),
(238, '19', '46', 15, 5, 5, 1, NULL, '2023-01-12 09:25:01'),
(239, '19', '51', 15, 6, 6, 1, NULL, '2023-01-12 09:25:01'),
(240, '19', '47', 15, 7, 7, 1, NULL, '2023-01-12 09:25:01'),
(241, '19', '52', 15, 8, 8, 1, NULL, '2023-01-12 09:25:01'),
(242, '19', '47', 15, 9, 9, 1, NULL, '2023-01-12 09:25:01'),
(243, '19', '52', 15, 10, 10, 1, NULL, '2023-01-12 09:25:01'),
(244, '19', '47', 15, 11, 11, 1, NULL, '2023-01-12 09:25:01'),
(245, '19', '52', 15, 12, 12, 1, NULL, '2023-01-12 09:25:01'),
(246, '19', '46', 30, 1, 1, 1, NULL, '2023-01-12 09:25:17'),
(247, '19', '51', 30, 2, 2, 1, NULL, '2023-01-12 09:25:17'),
(248, '19', '46', 30, 3, 3, 1, NULL, '2023-01-12 09:25:18'),
(249, '19', '51', 30, 4, 4, 1, NULL, '2023-01-12 09:25:18'),
(250, '19', '46', 30, 5, 5, 1, NULL, '2023-01-12 09:25:18'),
(251, '19', '51', 30, 6, 6, 1, NULL, '2023-01-12 09:25:18'),
(252, '19', '47', 30, 7, 7, 1, NULL, '2023-01-12 09:25:18'),
(253, '19', '52', 30, 8, 8, 1, NULL, '2023-01-12 09:25:18'),
(254, '19', '47', 30, 9, 9, 1, NULL, '2023-01-12 09:25:18'),
(255, '19', '52', 30, 10, 10, 1, NULL, '2023-01-12 09:25:18'),
(256, '19', '47', 30, 11, 11, 1, NULL, '2023-01-12 09:25:18'),
(257, '19', '52', 30, 12, 12, 1, NULL, '2023-01-12 09:25:18'),
(258, '19', '46', 45, 1, 1, 1, NULL, '2023-01-12 09:25:36'),
(259, '19', '51', 45, 2, 2, 1, NULL, '2023-01-12 09:25:36'),
(260, '19', '46', 45, 3, 3, 1, NULL, '2023-01-12 09:25:36'),
(261, '19', '51', 45, 4, 4, 1, NULL, '2023-01-12 09:25:36'),
(262, '19', '46', 45, 5, 5, 1, NULL, '2023-01-12 09:25:36'),
(263, '19', '51', 45, 6, 6, 1, NULL, '2023-01-12 09:25:36'),
(264, '19', '47', 45, 7, 7, 1, NULL, '2023-01-12 09:25:36'),
(265, '19', '52', 45, 8, 8, 1, NULL, '2023-01-12 09:25:36'),
(266, '19', '47', 45, 9, 9, 1, NULL, '2023-01-12 09:25:36'),
(267, '19', '52', 45, 10, 10, 1, NULL, '2023-01-12 09:25:36'),
(268, '19', '47', 45, 11, 11, 1, NULL, '2023-01-12 09:25:36'),
(269, '19', '52', 45, 12, 12, 1, NULL, '2023-01-12 09:25:36'),
(270, '20', '47', 15, 1, 1, 1, NULL, '2023-01-12 09:36:42'),
(271, '20', '52', 15, 2, 2, 1, NULL, '2023-01-12 09:36:42'),
(272, '20', '47', 15, 3, 3, 1, NULL, '2023-01-12 09:36:42'),
(273, '20', '52', 15, 4, 4, 1, NULL, '2023-01-12 09:36:42'),
(274, '20', '47', 15, 5, 5, 1, NULL, '2023-01-12 09:36:42'),
(275, '20', '52', 15, 6, 6, 1, NULL, '2023-01-12 09:36:42'),
(276, '20', '48', 15, 7, 7, 1, NULL, '2023-01-12 09:36:42'),
(277, '20', '53', 15, 8, 8, 1, NULL, '2023-01-12 09:36:42'),
(278, '20', '48', 15, 9, 9, 1, NULL, '2023-01-12 09:36:42'),
(279, '20', '53', 15, 10, 10, 1, NULL, '2023-01-12 09:36:42'),
(280, '20', '48', 15, 11, 11, 1, NULL, '2023-01-12 09:36:42'),
(281, '20', '53', 15, 12, 12, 1, NULL, '2023-01-12 09:36:42'),
(282, '20', '49', 15, 13, 13, 1, NULL, '2023-01-12 09:36:42'),
(283, '20', '54', 15, 14, 14, 1, NULL, '2023-01-12 09:36:42'),
(284, '20', '49', 15, 15, 15, 1, NULL, '2023-01-12 09:36:42'),
(285, '20', '54', 15, 16, 16, 1, NULL, '2023-01-12 09:36:42'),
(286, '20', '49', 15, 17, 17, 1, NULL, '2023-01-12 09:36:42'),
(287, '20', '54', 15, 18, 18, 1, NULL, '2023-01-12 09:36:42'),
(288, '20', '47', 30, 1, 1, 1, NULL, '2023-01-12 09:37:05'),
(289, '20', '52', 30, 2, 2, 1, NULL, '2023-01-12 09:37:05'),
(290, '20', '47', 30, 3, 3, 1, NULL, '2023-01-12 09:37:05'),
(291, '20', '52', 30, 4, 4, 1, NULL, '2023-01-12 09:37:05'),
(292, '20', '47', 30, 5, 5, 1, NULL, '2023-01-12 09:37:05'),
(293, '20', '52', 30, 6, 6, 1, NULL, '2023-01-12 09:37:05'),
(294, '20', '48', 30, 7, 7, 1, NULL, '2023-01-12 09:37:05'),
(295, '20', '53', 30, 8, 8, 1, NULL, '2023-01-12 09:37:05'),
(296, '20', '48', 30, 9, 9, 1, NULL, '2023-01-12 09:37:05'),
(297, '20', '53', 30, 10, 10, 1, NULL, '2023-01-12 09:37:05'),
(298, '20', '48', 30, 11, 11, 1, NULL, '2023-01-12 09:37:05'),
(299, '20', '53', 30, 12, 12, 1, NULL, '2023-01-12 09:37:05'),
(300, '20', '49', 30, 13, 13, 1, NULL, '2023-01-12 09:37:05'),
(301, '20', '54', 30, 14, 14, 1, NULL, '2023-01-12 09:37:05'),
(302, '20', '49', 30, 15, 15, 1, NULL, '2023-01-12 09:37:05'),
(303, '20', '54', 30, 16, 16, 1, NULL, '2023-01-12 09:37:05'),
(304, '20', '49', 30, 17, 17, 1, NULL, '2023-01-12 09:37:05'),
(305, '20', '54', 30, 18, 18, 1, NULL, '2023-01-12 09:37:05'),
(306, '20', '47', 45, 1, 1, 1, NULL, '2023-01-12 09:37:19'),
(307, '20', '52', 45, 2, 2, 1, NULL, '2023-01-12 09:37:20'),
(308, '20', '47', 45, 3, 3, 1, NULL, '2023-01-12 09:37:20'),
(309, '20', '52', 45, 4, 4, 1, NULL, '2023-01-12 09:37:20'),
(310, '20', '47', 45, 5, 5, 1, NULL, '2023-01-12 09:37:20'),
(311, '20', '52', 45, 6, 6, 1, NULL, '2023-01-12 09:37:20'),
(312, '20', '48', 45, 7, 7, 1, NULL, '2023-01-12 09:37:20'),
(313, '20', '53', 45, 8, 8, 1, NULL, '2023-01-12 09:37:20'),
(314, '20', '48', 45, 9, 9, 1, NULL, '2023-01-12 09:37:20'),
(315, '20', '53', 45, 10, 10, 1, NULL, '2023-01-12 09:37:20'),
(316, '20', '48', 45, 11, 11, 1, NULL, '2023-01-12 09:37:20'),
(317, '20', '53', 45, 12, 12, 1, NULL, '2023-01-12 09:37:20'),
(318, '20', '49', 45, 13, 13, 1, NULL, '2023-01-12 09:37:20'),
(319, '20', '54', 45, 14, 14, 1, NULL, '2023-01-12 09:37:20'),
(320, '20', '49', 45, 15, 15, 1, NULL, '2023-01-12 09:37:20'),
(321, '20', '54', 45, 16, 16, 1, NULL, '2023-01-12 09:37:20'),
(322, '20', '49', 45, 17, 17, 1, NULL, '2023-01-12 09:37:20'),
(323, '20', '54', 45, 18, 18, 1, NULL, '2023-01-12 09:37:20'),
(324, '21', '48', 15, 1, 1, 1, NULL, '2023-01-12 09:46:53'),
(325, '21', '53', 15, 2, 2, 1, NULL, '2023-01-12 09:46:53'),
(326, '21', '48', 15, 3, 3, 1, NULL, '2023-01-12 09:46:53'),
(327, '21', '53', 15, 4, 4, 1, NULL, '2023-01-12 09:46:53'),
(328, '21', '48', 15, 5, 5, 1, NULL, '2023-01-12 09:46:53'),
(329, '21', '53', 15, 6, 6, 1, NULL, '2023-01-12 09:46:53'),
(330, '21', '54', 15, 7, 7, 1, NULL, '2023-01-12 09:46:53'),
(331, '21', '49', 15, 8, 8, 1, NULL, '2023-01-12 09:46:53'),
(332, '21', '54', 15, 9, 9, 1, NULL, '2023-01-12 09:46:53'),
(333, '21', '49', 15, 10, 10, 1, NULL, '2023-01-12 09:46:53'),
(334, '21', '54', 15, 11, 11, 1, NULL, '2023-01-12 09:46:53'),
(335, '21', '49', 15, 12, 12, 1, NULL, '2023-01-12 09:46:53'),
(336, '21', '50', 15, 13, 13, 1, NULL, '2023-01-12 09:46:53'),
(337, '21', '55', 15, 14, 14, 1, NULL, '2023-01-12 09:46:53'),
(338, '21', '50', 15, 15, 15, 1, NULL, '2023-01-12 09:46:53'),
(339, '21', '55', 15, 16, 16, 1, NULL, '2023-01-12 09:46:53'),
(340, '21', '50', 15, 17, 17, 1, NULL, '2023-01-12 09:46:53'),
(341, '21', '55', 15, 18, 18, 1, NULL, '2023-01-12 09:46:53'),
(342, '21', '48', 30, 1, 1, 1, NULL, '2023-01-12 09:47:08'),
(343, '21', '53', 30, 2, 2, 1, NULL, '2023-01-12 09:47:08'),
(344, '21', '48', 30, 3, 3, 1, NULL, '2023-01-12 09:47:08'),
(345, '21', '53', 30, 4, 4, 1, NULL, '2023-01-12 09:47:08'),
(346, '21', '48', 30, 5, 5, 1, NULL, '2023-01-12 09:47:08'),
(347, '21', '53', 30, 6, 6, 1, NULL, '2023-01-12 09:47:08'),
(348, '21', '54', 30, 7, 7, 1, NULL, '2023-01-12 09:47:08'),
(349, '21', '49', 30, 8, 8, 1, NULL, '2023-01-12 09:47:08'),
(350, '21', '54', 30, 9, 9, 1, NULL, '2023-01-12 09:47:08'),
(351, '21', '49', 30, 10, 10, 1, NULL, '2023-01-12 09:47:08'),
(352, '21', '54', 30, 11, 11, 1, NULL, '2023-01-12 09:47:08'),
(353, '21', '49', 30, 12, 12, 1, NULL, '2023-01-12 09:47:08'),
(354, '21', '50', 30, 13, 13, 1, NULL, '2023-01-12 09:47:08'),
(355, '21', '55', 30, 14, 14, 1, NULL, '2023-01-12 09:47:08'),
(356, '21', '50', 30, 15, 15, 1, NULL, '2023-01-12 09:47:08'),
(357, '21', '55', 30, 16, 16, 1, NULL, '2023-01-12 09:47:08'),
(358, '21', '50', 30, 17, 17, 1, NULL, '2023-01-12 09:47:08'),
(359, '21', '55', 30, 18, 18, 1, NULL, '2023-01-12 09:47:08'),
(360, '21', '48', 45, 1, 1, 1, NULL, '2023-01-12 09:47:34'),
(361, '21', '53', 45, 2, 2, 1, NULL, '2023-01-12 09:47:34'),
(362, '21', '48', 45, 3, 3, 1, NULL, '2023-01-12 09:47:34'),
(363, '21', '53', 45, 4, 4, 1, NULL, '2023-01-12 09:47:34'),
(364, '21', '48', 45, 5, 5, 1, NULL, '2023-01-12 09:47:34'),
(365, '21', '53', 45, 6, 6, 1, NULL, '2023-01-12 09:47:34'),
(366, '21', '54', 45, 7, 7, 1, NULL, '2023-01-12 09:47:34'),
(367, '21', '49', 45, 8, 8, 1, NULL, '2023-01-12 09:47:34'),
(368, '21', '54', 45, 9, 9, 1, NULL, '2023-01-12 09:47:34'),
(369, '21', '49', 45, 10, 10, 1, NULL, '2023-01-12 09:47:34'),
(370, '21', '54', 45, 11, 11, 1, NULL, '2023-01-12 09:47:34'),
(371, '21', '49', 45, 12, 12, 1, NULL, '2023-01-12 09:47:34'),
(372, '21', '50', 45, 13, 13, 1, NULL, '2023-01-12 09:47:34'),
(373, '21', '55', 45, 14, 14, 1, NULL, '2023-01-12 09:47:34'),
(374, '21', '50', 45, 15, 15, 1, NULL, '2023-01-12 09:47:34'),
(375, '21', '55', 45, 16, 16, 1, NULL, '2023-01-12 09:47:34'),
(376, '21', '50', 45, 17, 17, 1, NULL, '2023-01-12 09:47:34'),
(377, '21', '55', 45, 18, 18, 1, NULL, '2023-01-12 09:47:34'),
(378, '22', '58', 15, 1, 1, 1, NULL, '2023-01-12 15:15:04'),
(379, '22', '59', 15, 2, 2, 1, NULL, '2023-01-12 15:15:04'),
(380, '22', '58', 15, 3, 3, 1, NULL, '2023-01-12 15:15:04'),
(381, '22', '59', 15, 4, 4, 1, NULL, '2023-01-12 15:15:04'),
(382, '22', '58', 15, 5, 5, 1, NULL, '2023-01-12 15:15:04'),
(383, '22', '59', 15, 6, 6, 1, NULL, '2023-01-12 15:15:04'),
(384, '22', '60', 15, 7, 7, 1, NULL, '2023-01-12 15:15:04'),
(385, '22', '61', 15, 8, 8, 1, NULL, '2023-01-12 15:15:04'),
(386, '22', '60', 15, 9, 9, 1, NULL, '2023-01-12 15:15:04'),
(387, '22', '61', 15, 10, 10, 1, NULL, '2023-01-12 15:15:04'),
(388, '22', '60', 15, 11, 11, 1, NULL, '2023-01-12 15:15:04'),
(389, '22', '61', 15, 12, 12, 1, NULL, '2023-01-12 15:15:04'),
(390, '22', '62', 15, 13, 13, 1, NULL, '2023-01-12 15:15:04'),
(391, '22', '63', 15, 14, 14, 1, NULL, '2023-01-12 15:15:04'),
(392, '22', '62', 15, 15, 15, 1, NULL, '2023-01-12 15:15:04'),
(393, '22', '63', 15, 16, 16, 1, NULL, '2023-01-12 15:15:04'),
(394, '22', '62', 15, 17, 17, 1, NULL, '2023-01-12 15:15:04'),
(395, '22', '63', 15, 18, 18, 1, NULL, '2023-01-12 15:15:04'),
(396, '22', '64', 15, 19, 19, 1, NULL, '2023-01-12 15:15:04'),
(397, '22', '65', 15, 20, 20, 1, NULL, '2023-01-12 15:15:04'),
(398, '22', '64', 15, 21, 21, 1, NULL, '2023-01-12 15:15:04'),
(399, '22', '65', 15, 22, 22, 1, NULL, '2023-01-12 15:15:04'),
(400, '22', '64', 15, 23, 23, 1, NULL, '2023-01-12 15:15:04'),
(401, '22', '65', 15, 24, 24, 1, NULL, '2023-01-12 15:15:04'),
(402, '22', '66', 15, 25, 25, 1, NULL, '2023-01-12 15:15:04'),
(403, '22', '67', 15, 26, 26, 1, NULL, '2023-01-12 15:15:04'),
(404, '22', '66', 15, 27, 27, 1, NULL, '2023-01-12 15:15:04'),
(405, '22', '67', 15, 28, 28, 1, NULL, '2023-01-12 15:15:04'),
(406, '22', '66', 15, 29, 29, 1, NULL, '2023-01-12 15:15:04'),
(407, '22', '67', 15, 30, 30, 1, NULL, '2023-01-12 15:15:04'),
(408, '22', '58', 30, 1, 1, 1, NULL, '2023-01-12 15:15:21'),
(409, '22', '59', 30, 2, 2, 1, NULL, '2023-01-12 15:15:21'),
(410, '22', '58', 30, 3, 3, 1, NULL, '2023-01-12 15:15:21'),
(411, '22', '59', 30, 4, 4, 1, NULL, '2023-01-12 15:15:21'),
(412, '22', '58', 30, 5, 5, 1, NULL, '2023-01-12 15:15:21'),
(413, '22', '59', 30, 6, 6, 1, NULL, '2023-01-12 15:15:21'),
(414, '22', '60', 30, 7, 7, 1, NULL, '2023-01-12 15:15:21'),
(415, '22', '61', 30, 8, 8, 1, NULL, '2023-01-12 15:15:21'),
(416, '22', '60', 30, 9, 9, 1, NULL, '2023-01-12 15:15:21'),
(417, '22', '61', 30, 10, 10, 1, NULL, '2023-01-12 15:15:21'),
(418, '22', '60', 30, 11, 11, 1, NULL, '2023-01-12 15:15:21'),
(419, '22', '61', 30, 12, 12, 1, NULL, '2023-01-12 15:15:21'),
(420, '22', '62', 30, 13, 13, 1, NULL, '2023-01-12 15:15:22'),
(421, '22', '63', 30, 14, 14, 1, NULL, '2023-01-12 15:15:22'),
(422, '22', '62', 30, 15, 15, 1, NULL, '2023-01-12 15:15:22'),
(423, '22', '63', 30, 16, 16, 1, NULL, '2023-01-12 15:15:22'),
(424, '22', '62', 30, 17, 17, 1, NULL, '2023-01-12 15:15:22'),
(425, '22', '63', 30, 18, 18, 1, NULL, '2023-01-12 15:15:22'),
(426, '22', '64', 30, 19, 19, 1, NULL, '2023-01-12 15:15:22'),
(427, '22', '65', 30, 20, 20, 1, NULL, '2023-01-12 15:15:22'),
(428, '22', '64', 30, 21, 21, 1, NULL, '2023-01-12 15:15:22'),
(429, '22', '65', 30, 22, 22, 1, NULL, '2023-01-12 15:15:22'),
(430, '22', '64', 30, 23, 23, 1, NULL, '2023-01-12 15:15:22'),
(431, '22', '65', 30, 24, 24, 1, NULL, '2023-01-12 15:15:22'),
(432, '22', '66', 30, 25, 25, 1, NULL, '2023-01-12 15:15:22'),
(433, '22', '67', 30, 26, 26, 1, NULL, '2023-01-12 15:15:22'),
(434, '22', '66', 30, 27, 27, 1, NULL, '2023-01-12 15:15:22'),
(435, '22', '67', 30, 28, 28, 1, NULL, '2023-01-12 15:15:22'),
(436, '22', '66', 30, 29, 29, 1, NULL, '2023-01-12 15:15:22'),
(437, '22', '67', 30, 30, 30, 1, NULL, '2023-01-12 15:15:22'),
(438, '22', '58', 45, 1, 1, 1, NULL, '2023-01-12 15:15:38'),
(439, '22', '59', 45, 2, 2, 1, NULL, '2023-01-12 15:15:38'),
(440, '22', '58', 45, 3, 3, 1, NULL, '2023-01-12 15:15:38'),
(441, '22', '59', 45, 4, 4, 1, NULL, '2023-01-12 15:15:38'),
(442, '22', '58', 45, 5, 5, 1, NULL, '2023-01-12 15:15:38'),
(443, '22', '59', 45, 6, 6, 1, NULL, '2023-01-12 15:15:39'),
(444, '22', '60', 45, 7, 7, 1, NULL, '2023-01-12 15:15:39'),
(445, '22', '61', 45, 8, 8, 1, NULL, '2023-01-12 15:15:39'),
(446, '22', '60', 45, 9, 9, 1, NULL, '2023-01-12 15:15:39'),
(447, '22', '61', 45, 10, 10, 1, NULL, '2023-01-12 15:15:39'),
(448, '22', '60', 45, 11, 11, 1, NULL, '2023-01-12 15:15:39'),
(449, '22', '61', 45, 12, 12, 1, NULL, '2023-01-12 15:15:39'),
(450, '22', '62', 45, 13, 13, 1, NULL, '2023-01-12 15:15:39'),
(451, '22', '63', 45, 14, 14, 1, NULL, '2023-01-12 15:15:39'),
(452, '22', '62', 45, 15, 15, 1, NULL, '2023-01-12 15:15:39'),
(453, '22', '63', 45, 16, 16, 1, NULL, '2023-01-12 15:15:39'),
(454, '22', '62', 45, 17, 17, 1, NULL, '2023-01-12 15:15:39'),
(455, '22', '63', 45, 18, 18, 1, NULL, '2023-01-12 15:15:39'),
(456, '22', '64', 45, 19, 19, 1, NULL, '2023-01-12 15:15:39'),
(457, '22', '65', 45, 20, 20, 1, NULL, '2023-01-12 15:15:39'),
(458, '22', '64', 45, 21, 21, 1, NULL, '2023-01-12 15:15:39'),
(459, '22', '65', 45, 22, 22, 1, NULL, '2023-01-12 15:15:39'),
(460, '22', '64', 45, 23, 23, 1, NULL, '2023-01-12 15:15:39'),
(461, '22', '65', 45, 24, 24, 1, NULL, '2023-01-12 15:15:39'),
(462, '22', '66', 45, 25, 25, 1, NULL, '2023-01-12 15:15:39'),
(463, '22', '67', 45, 26, 26, 1, NULL, '2023-01-12 15:15:39'),
(464, '22', '66', 45, 27, 27, 1, NULL, '2023-01-12 15:15:39'),
(465, '22', '67', 45, 28, 28, 1, NULL, '2023-01-12 15:15:39'),
(466, '22', '66', 45, 29, 29, 1, NULL, '2023-01-12 15:15:39'),
(467, '22', '67', 45, 30, 30, 1, NULL, '2023-01-12 15:15:39'),
(468, '23', '1', 15, 1, 1, 1, NULL, '2023-01-12 15:21:02'),
(469, '23', '14', 15, 2, 2, 1, NULL, '2023-01-12 15:21:02'),
(470, '23', '1', 15, 3, 3, 1, NULL, '2023-01-12 15:21:02'),
(471, '23', '14', 15, 4, 4, 1, NULL, '2023-01-12 15:21:02'),
(472, '23', '1', 15, 5, 5, 1, NULL, '2023-01-12 15:21:02'),
(473, '23', '14', 15, 6, 6, 1, NULL, '2023-01-12 15:21:02'),
(474, '23', '15', 15, 7, 7, 1, NULL, '2023-01-12 15:21:02'),
(475, '23', '24', 15, 8, 8, 1, NULL, '2023-01-12 15:21:02'),
(476, '23', '15', 15, 9, 9, 1, NULL, '2023-01-12 15:21:02'),
(477, '23', '24', 15, 10, 10, 1, NULL, '2023-01-12 15:21:02'),
(478, '23', '15', 15, 11, 11, 1, NULL, '2023-01-12 15:21:02'),
(479, '23', '24', 15, 12, 12, 1, NULL, '2023-01-12 15:21:02'),
(480, '23', '72', 15, 13, 13, 1, NULL, '2023-01-12 15:21:02'),
(481, '23', '18', 15, 14, 14, 1, NULL, '2023-01-12 15:21:02'),
(482, '23', '72', 15, 15, 15, 1, NULL, '2023-01-12 15:21:02'),
(483, '23', '18', 15, 16, 16, 1, NULL, '2023-01-12 15:21:02'),
(484, '23', '72', 15, 17, 17, 1, NULL, '2023-01-12 15:21:02'),
(485, '23', '18', 15, 18, 18, 1, NULL, '2023-01-12 15:21:02'),
(486, '23', '19', 15, 19, 19, 1, NULL, '2023-01-12 15:21:02'),
(487, '23', '25', 15, 20, 20, 1, NULL, '2023-01-12 15:21:02'),
(488, '23', '19', 15, 21, 21, 1, NULL, '2023-01-12 15:21:02'),
(489, '23', '25', 15, 22, 22, 1, NULL, '2023-01-12 15:21:02'),
(490, '23', '19', 15, 23, 23, 1, NULL, '2023-01-12 15:21:02'),
(491, '23', '25', 15, 24, 24, 1, NULL, '2023-01-12 15:21:02'),
(492, '23', '1', 30, 1, 1, 1, NULL, '2023-01-12 15:21:19'),
(493, '23', '14', 30, 2, 2, 1, NULL, '2023-01-12 15:21:19'),
(494, '23', '1', 30, 3, 3, 1, NULL, '2023-01-12 15:21:19'),
(495, '23', '14', 30, 4, 4, 1, NULL, '2023-01-12 15:21:19'),
(496, '23', '1', 30, 5, 5, 1, NULL, '2023-01-12 15:21:19'),
(497, '23', '14', 30, 6, 6, 1, NULL, '2023-01-12 15:21:19'),
(498, '23', '15', 30, 7, 7, 1, NULL, '2023-01-12 15:21:19'),
(499, '23', '24', 30, 8, 8, 1, NULL, '2023-01-12 15:21:19'),
(500, '23', '15', 30, 9, 9, 1, NULL, '2023-01-12 15:21:19'),
(501, '23', '24', 30, 10, 10, 1, NULL, '2023-01-12 15:21:19'),
(502, '23', '15', 30, 11, 11, 1, NULL, '2023-01-12 15:21:19'),
(503, '23', '24', 30, 12, 12, 1, NULL, '2023-01-12 15:21:19'),
(504, '23', '72', 30, 13, 13, 1, NULL, '2023-01-12 15:21:19'),
(505, '23', '18', 30, 14, 14, 1, NULL, '2023-01-12 15:21:19'),
(506, '23', '72', 30, 15, 15, 1, NULL, '2023-01-12 15:21:19'),
(507, '23', '18', 30, 16, 16, 1, NULL, '2023-01-12 15:21:19'),
(508, '23', '72', 30, 17, 17, 1, NULL, '2023-01-12 15:21:19'),
(509, '23', '18', 30, 18, 18, 1, NULL, '2023-01-12 15:21:19'),
(510, '23', '19', 30, 19, 19, 1, NULL, '2023-01-12 15:21:19'),
(511, '23', '25', 30, 20, 20, 1, NULL, '2023-01-12 15:21:19'),
(512, '23', '19', 30, 21, 21, 1, NULL, '2023-01-12 15:21:19'),
(513, '23', '25', 30, 22, 22, 1, NULL, '2023-01-12 15:21:19'),
(514, '23', '19', 30, 23, 23, 1, NULL, '2023-01-12 15:21:19'),
(515, '23', '25', 30, 24, 24, 1, NULL, '2023-01-12 15:21:19'),
(516, '23', '1', 45, 1, 1, 1, NULL, '2023-01-12 15:21:39'),
(517, '23', '14', 45, 2, 2, 1, NULL, '2023-01-12 15:21:39'),
(518, '23', '1', 45, 3, 3, 1, NULL, '2023-01-12 15:21:39'),
(519, '23', '14', 45, 4, 4, 1, NULL, '2023-01-12 15:21:39'),
(520, '23', '1', 45, 5, 5, 1, NULL, '2023-01-12 15:21:39'),
(521, '23', '14', 45, 6, 6, 1, NULL, '2023-01-12 15:21:39'),
(522, '23', '15', 45, 7, 7, 1, NULL, '2023-01-12 15:21:39'),
(523, '23', '24', 45, 8, 8, 1, NULL, '2023-01-12 15:21:39'),
(524, '23', '15', 45, 9, 9, 1, NULL, '2023-01-12 15:21:39'),
(525, '23', '24', 45, 10, 10, 1, NULL, '2023-01-12 15:21:39'),
(526, '23', '15', 45, 11, 11, 1, NULL, '2023-01-12 15:21:39'),
(527, '23', '24', 45, 12, 12, 1, NULL, '2023-01-12 15:21:39'),
(528, '23', '72', 45, 13, 13, 1, NULL, '2023-01-12 15:21:39'),
(529, '23', '18', 45, 14, 14, 1, NULL, '2023-01-12 15:21:39'),
(530, '23', '72', 45, 15, 15, 1, NULL, '2023-01-12 15:21:39'),
(531, '23', '18', 45, 16, 16, 1, NULL, '2023-01-12 15:21:39'),
(532, '23', '72', 45, 17, 17, 1, NULL, '2023-01-12 15:21:39'),
(533, '23', '18', 45, 18, 18, 1, NULL, '2023-01-12 15:21:39'),
(534, '23', '19', 45, 19, 19, 1, NULL, '2023-01-12 15:21:39'),
(535, '23', '25', 45, 20, 20, 1, NULL, '2023-01-12 15:21:39'),
(536, '23', '19', 45, 21, 21, 1, NULL, '2023-01-12 15:21:39'),
(537, '23', '25', 45, 22, 22, 1, NULL, '2023-01-12 15:21:39'),
(538, '23', '19', 45, 23, 23, 1, NULL, '2023-01-12 15:21:39'),
(539, '23', '25', 45, 24, 24, 1, NULL, '2023-01-12 15:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` bigint NOT NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy_policy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `terms_condition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `email`, `logo`, `favicon`, `contact`, `website`, `description`, `tags`, `address`, `privacy_policy`, `terms_condition`, `created_at`) VALUES
(1, 'Poznic App', 'vickya819@gmail.com', '1650908763.png', '1650908763.png', 9713879633, 'http://www.poznic.com', 'Poznic App', 'Poznic App, Fitness, Exercise, workout', 'Sneh Nagar, Bhopal', '<h3 id=\"Is_A_Terms_And_Conditions_Agreement_Required\" style=\"margin-top: 25px; margin-bottom: 20px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">Is a Terms and Conditions Agreement Required?</h3><p style=\"margin-top: 25px; margin-bottom: 25px; width: 777px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">A Terms and Conditions&nbsp;<span style=\"font-weight: bolder;\">is not required</span>&nbsp;and&nbsp;<span style=\"font-weight: bolder;\">it\'s not mandatory by law</span>. Unlike Privacy Policies, which are required by laws such as the GDPR,&nbsp;<a href=\"https://termsfeed.com/blog/caloppa/\" style=\"outline: none;\">CalOPPA</a>&nbsp;and many others, there\'s no law or regulation on Terms and Conditions.</p><p style=\"margin-top: 25px; margin-bottom: 25px; width: 777px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">However, having a Terms and Conditions gives you the right to terminate the access of abusive users or to terminate the access to users who do not follow your rules and guidelines, as well as other desirable business benefits.</p><p style=\"margin-top: 25px; margin-bottom: 25px; width: 777px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">It\'s extremely important to have this agreement if you operate a SaaS app.</p><p style=\"margin-top: 25px; margin-bottom: 25px; width: 777px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">Here are a few examples of how this agreement can help you:</p><ul style=\"margin-bottom: 30px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\"><li style=\"margin-bottom: 20px;\">If users abuse your website or mobile app in any way, you can terminate their account. Your \"Termination\" clause can inform users that their accounts would be terminated if they abuse your service.</li><li style=\"margin-bottom: 20px;\">If users can post content on your website or mobile app (create content and share it on your platform), you can remove any content they created if it infringes copyright. Your Terms and Conditions will inform users that they can only create and/or share content they own rights to. Similarly, if users can register for an account and choose a username, you can inform users that they are not allowed to choose usernames that may infringe trademarks, i.e. usernames like&nbsp;<em>Google</em>,&nbsp;<em>Facebook</em>, and so on.</li><li style=\"margin-bottom: 20px;\">If you sell products or services, you could cancel specific orders if a product price is incorrect. Your Terms and Conditions can include a clause to inform users that certain orders, at your sole discretion, can be canceled if the products ordered have incorrect prices due to various errors.</li><li style=\"margin-bottom: 20px;\">And many more examples.</li></ul>', '<h3 id=\"Is_A_Terms_And_Conditions_Agreement_Required\" style=\"margin-top: 25px; margin-bottom: 20px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">Is a Terms and Conditions Agreement Required?</h3><p style=\"margin-top: 25px; margin-bottom: 25px; width: 777px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">A Terms and Conditions&nbsp;<span style=\"font-weight: bolder;\">is not required</span>&nbsp;and&nbsp;<span style=\"font-weight: bolder;\">it\'s not mandatory by law</span>. Unlike Privacy Policies, which are required by laws such as the GDPR,&nbsp;<a href=\"https://termsfeed.com/blog/caloppa/\" style=\"outline: none;\">CalOPPA</a>&nbsp;and many others, there\'s no law or regulation on Terms and Conditions.</p><p style=\"margin-top: 25px; margin-bottom: 25px; width: 777px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">However, having a Terms and Conditions gives you the right to terminate the access of abusive users or to terminate the access to users who do not follow your rules and guidelines, as well as other desirable business benefits.</p><p style=\"margin-top: 25px; margin-bottom: 25px; width: 777px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">It\'s extremely important to have this agreement if you operate a SaaS app.</p><p style=\"margin-top: 25px; margin-bottom: 25px; width: 777px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">Here are a few examples of how this agreement can help you:</p><ul style=\"margin-bottom: 30px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\"><li style=\"margin-bottom: 20px;\">If users abuse your website or mobile app in any way, you can terminate their account. Your \"Termination\" clause can inform users that their accounts would be terminated if they abuse your service.</li><li style=\"margin-bottom: 20px;\">If users can post content on your website or mobile app (create content and share it on your platform), you can remove any content they created if it infringes copyright. Your Terms and Conditions will inform users that they can only create and/or share content they own rights to. Similarly, if users can register for an account and choose a username, you can inform users that they are not allowed to choose usernames that may infringe trademarks, i.e. usernames like&nbsp;<em>Google</em>,&nbsp;<em>Facebook</em>, and so on.</li><li style=\"margin-bottom: 20px;\">If you sell products or services, you could cancel specific orders if a product price is incorrect. Your Terms and Conditions can include a clause to inform users that certain orders, at your sole discretion, can be canceled if the products ordered have incorrect prices due to various errors.</li><li style=\"margin-bottom: 20px;\">And many more examples.</li></ul>', '2021-10-02 07:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `splits`
--

CREATE TABLE `splits` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_days` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `configured_days` int DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `good_for` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `focus_area` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `breath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` int NOT NULL DEFAULT '1',
  `category_id` bigint DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `splits`
--

INSERT INTO `splits` (`id`, `title`, `slug`, `code`, `no_of_days`, `configured_days`, `image`, `level`, `video_link`, `good_for`, `type`, `focus_area`, `duration`, `instructions`, `breath`, `tags`, `visible`, `category_id`, `created_at`) VALUES
(1, 'Spiral Dynamics', 'spiral-dynamics', 'POZSP1', '2', 2, '1670249062.jpg', 'Intermediate,Advanced', NULL, 'functional-strength,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>This 2-day split works the full body on each day, with a focus on functional movement and spiral-based exercises.</li><li>Many of these exercises may be unfamiliar to you, so be sure to take the time to watch the videos and read the tips. The more you establish solid form early on, the more you’ll enjoy and benefit from these exercises.</li></ul>', '<ul><li>As you’ll work the entire body each day, I recommend doing both days consecutively, then taking a day off before repeating the split.</li><li>Repeat 6 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, 5, '2022-12-02 12:09:00'),
(2, 'Spiral Power', 'spiral-power', 'POZSP2', '2', 2, '1670249397.jpg', 'Advanced', NULL, 'functional-strength,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>This 2-day split works the full body on each day, with a focus on functional movement and spiral-based exercises.</li><li>Many of these exercises may be unfamiliar to you, so be sure to take the time to watch the videos and read the tips. The more you establish solid form early on, the more you’ll enjoy and benefit from these exercises.</li></ul>', '<ul><li>As you’ll work the entire body each day, I recommend doing both days consecutively, then taking a day off before repeating the split.</li><li>Repeat 6 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(3, 'Full Body Foundations', 'full-body-foundations', 'POZSP3', '3', 3, '1670249415.jpg', 'Beginner', NULL, 'building-mass,burning-fat', NULL, 'full-body', '10,20,30', '<ul><li>This split works the full body over the course of three days. Many of the exercises in this split are performed on the ground, so be sure to have a flat, smooth floor space available.</li></ul>', '<ul><li>Perform the three days consecutively, then take one day off before repeating.</li><li>Or perform the full split twice in a row before taking a rest day, but be sure to always take at least one day off each week.</li><li>If you are working out 4 or fewer days a week, you may want to choose a full body workout or a 2-day split instead. This is because better strength gains come from working out each muscle group roughly twice per week.</li><li>Repeat 4 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(4, 'The Fit Full Body', 'the-fit-full-body', 'POZSP4', '3', 3, '1670249444.jpg', 'Beginner,Intermediate', NULL, 'building-mass,burning-fat', NULL, 'full-body', '10,20,30', '<ul><li>This split works the full body over the course of three days. Many of the exercises in this split are performed on the ground, so be sure to have a flat, smooth floor space available.</li></ul>', '<ul><li>Perform the three days consecutively, then take one day off before repeating.</li><li>Or, perform the full split twice in a row before taking a rest day, but be sure to always take at least one day off each week.</li><li>If you are working out 4 or fewer days a week, you may want to choose a full body workout or a 2-day split instead. This is because better strength gains come from working out each muscle group roughly twice per week.</li><li>Repeat 4 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(5, 'Strong and Fit', 'strong-and-fit', 'POZSP5', '3', 3, '1670249563.jpg', 'Intermediate', NULL, 'building-mass,burning-fat', NULL, 'full-body', '10,20,30', '<ul><li>This split works the full body over the course of three days, and is great for both burning fat and building size and strength.</li><li>If your main focus is to burn fat, use the short rest periods between exercises to catch your breath, calm your mind, and prepare to dive right into the next set.</li><li>If your main focus is to build size and/or strength, feel free to tap the button to extend your rest period until you feel you can give 100% of your strength and effort to the next set.</li></ul>', '<ul><li>Perform the three days consecutively, then take one day off before repeating.</li><li>Or, perform the full split twice in a row before taking a rest day, but be sure to always take at least one day off each week.</li><li>If you are working out 4 or fewer days a week, you may want to choose a full body workout or a 2-day split instead. This is because better strength gains come from working out each muscle group roughly twice per week.</li><li>Repeat 4 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(6, 'Pro Power', 'pro-power', 'POZSP6', '3', 3, '1670249581.jpg', 'Intermediate,Advanced', NULL, 'building-mass,burning-fat', NULL, 'full-body', '10,20,30', '<ul><li>This split works the full body over the course of three days, and is well-rounded, including a solid dose of dynamic exercises, functional movements, and good old fashioned hardcore strength-building.</li><li>This split requires focus! Be sure to avoid distractions (stop checking Instagram between sets!) and put as much of your focus and awareness on your body during each and every rep.</li></ul>', '<ul><li>Perform the three days consecutively, then take one day off before repeating.</li><li>Or, perform the full split twice in a row before taking a rest day, but be sure to always take at least one day off each week.</li><li>If you are working out 4 or fewer days a week, you may want to choose a full body workout or a 2-day split instead. This is because better strength gains come from working out each muscle group roughly twice per week.</li><li>Repeat 4 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(7, 'Ultimate Full Body', 'ultimate-full-body', 'POZSP7', '3', 3, '1670249600.jpg', 'Advanced', NULL, 'building-mass,burning-fat', NULL, 'full-body', '10,20,30', '<ul><li>This split is called the Ultimate Full Body for a reason! It works the full body over the course of three very intense workouts, with a variety of challenges, including strength, explosive power, balance, and coordination.</li><li>If you find it difficult to do some of the exercises, stick with it! Even advanced fitness enthusiasts might need to practice some of these for quite some time before truly dialing them in.</li></ul>', '<ul><li>Perform the three days consecutively, then take one day off before repeating.</li><li>Or, perform the full split twice in a row before taking a rest day, but be sure to always take at least one day off each week.</li><li>If you are working out 4 or fewer days a week, you may want to choose a full body workout or a 2-day split instead. This is because better strength gains come from working out each muscle group roughly twice per week.</li><li>Repeat 4 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(8, 'Fit to Move', 'fit-to-move', 'POZSP8', '2', 2, '1670249627.jpg', 'Beginner', NULL, 'building-mass,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>This 2-day split works the upper body on day 1 and the lower body on day 2.</li><li>It focuses on classic foundational bodyweight exercises, making this a great split for beginners looking to start their fitness journey.</li></ul>', '<ul><li>Do both days of the split consecutively, take a rest day, then repeat.</li><li>You can also skip the rest day if you’re not sore, just be sure to always take at least one day off each week.</li><li>Repeat 6 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(9, 'The Vital Body', 'the-vital-body', 'POZSP9', '2', 2, '1670249652.jpg', 'Beginner,Intermediate', NULL, 'building-mass,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>This 2-day split works the upper body on day 1 and the lower body on day 2.</li><li>It introduces some small variations on classic foundational bodyweight exercises, which lay the groundwork for more complex variations down the road. This is a great chance to establish solid form on these exercises.</li></ul>', '<ul><li>Do both days of the split consecutively, take a rest day, then repeat.</li><li>You can also skip the rest day if you’re not sore, just be sure to always take at least one day off each week.</li><li>Repeat 6 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(10, 'Healthy Hero', 'healthy-hero', 'POZSP10', '2', 2, '1670249169.jpg', 'Intermediate', NULL, 'building-mass,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>This 2-day split works the upper body on day 1 and the lower body on day 2.</li><li>To get the most out of this split, focus on breath, form, and quality of movement. The more you put your awareness in your body and connect your breath to the movements, the more you’ll enjoy and benefit from them.</li></ul>', '<ul><li>Do both days of the split consecutively, take a rest day, then repeat.</li><li>You can also skip the rest day if you’re not sore, just be sure to always take at least one day off each week.</li><li>Repeat 6 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, 3, '2022-12-02 12:09:00'),
(11, 'Full Body Builder', 'full-body-builder', 'POZSP11', '2', 2, '1670249184.jpg', 'Intermediate,Advanced', NULL, 'building-mass,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>This 2-day split works the upper body on day 1 and the lower body on day 2.</li><li>It will help you develop both strength and balance. In order to successfully execute these exercises, be sure to avoid distractions, breathe calmly throughout, and… focus!</li></ul>', '<ul><li>Do both days of the split consecutively, take a rest day, then repeat.</li><li>You can also skip the rest day if you’re not sore, just be sure to always take at least one day off each week.</li><li>Repeat 6 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(12, 'Ultimate Agility', 'ultimate-agility', 'POZSP12', '2', 2, '1670249205.jpg', 'Advanced', NULL, 'building-mass,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>This dynamic 2-day split works the upper body on day 1 and the lower body on day 2.</li><li>It will challenge you on every level, and will help increase strength, flexibility, balance, power, and mobility. 95% of your energy will not be enough - be sure to give this one everything you’ve got!</li></ul>', '<ul><li>Do both days of the split consecutively, take a rest day, then repeat.</li><li>You can also skip the rest day if you’re not sore, just be sure to always take at least one day off each week.</li><li>Repeat 6 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(13, 'Low Impact Total Body', 'low-impact-total-body', 'POZSP13', '2', 2, '1670249255.jpg', 'Beginner', NULL, 'building-mass,burning-fat', NULL, 'full-body', '10,20,30', '<ul><li>This accessible, low impact 2-day split works the upper body on day 1 and the lower body on day 2.</li><li>It is appropriate for absolute beginners and anyone who wants to get a great full body workout without too much movement complexity or stress on the joints.</li><li>If you have knee trouble, perform the leg exercises only to a depth that feels safe and comfortable. As you build strength and flexibility, keep checking in - you may be surprised to find you can soon go deeper than you expected.</li></ul>', '<ul><li>Do both days of the split consecutively, take a rest day, then repeat.</li><li>You can also skip the rest day if you’re not sore, just be sure to always take at least one day off each week.</li><li>Repeat 6 cycles or more</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(14, 'Balance Foundations', 'balance-foundations', 'POZSP14', '2', 2, '1670249277.jpg', 'Beginner,Intermediate', NULL, 'functional-strength,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>With an emphasis on balance and stability, this 2-day split helps strengthen stabilizing muscles throughout the entire body, as well as increasing overall fitness. Many of the exercises here are also the foundational versions of more complex balance-based exercises you\'ll find in this app, making it a great way to prepare yourself for more advanced training.</li></ul>', '<ul><li>As this split works more on the smaller stabilizing muscles around the joints, you can safely perform it multiple times in a row, as long as you take at least one rest day per week.</li><li>If the muscles you’re about to work are still sore from the workout two days before, be sure to take an extra day of rest before repeating the split. For example, if you did the lower body yesterday and today your upper body is still sore, wait an extra day to be sure to maximize your gains and avoid overtraining.</li><li>Repeat 8 cycles or more.</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(15, 'Functional Foundations', 'functional-foundations', 'POZSP15', '2', 2, '1670249298.jpg', 'Beginner,Intermediate', NULL, 'functional-strength,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>As this split works more on the smaller stabilizing muscles around the joints, you can safely perform it multiple times in a row, as long as you take at least one rest day per week.</li><li>Get your whole body moving and prepared for action with this 2-day split, focused on mobility and flexibility. The workouts in this split include a hefty dose of spiral-based exercises, and train your body to work functionally, both in sports and in your daily life.</li></ul>', '<ul><li>If the muscles you’re about to work are still sore from the workout two days before, be sure to take an extra day of rest before repeating the split. For example, if you did the lower body yesterday and today your upper body is still sore, wait an extra day to be sure to maximize your gains and avoid overtraining.</li><li>Repeat 8 cycles or more.</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(16, 'Strength and Balance', 'strength-and-balance', 'POZSP16', '2', 2, '1670249316.jpg', 'Beginner,Intermediate', NULL, 'functional-strength,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>This 2-day split has a combined focus on building strength and improving balance and mobility, making it excellent for athletes, or anyone looking to improve their movement and overall ability to function in their daily life.</li></ul>', '<ul><li>As this split includes some intense muscle building exercises, I recommend doing both days consecutively, then taking a day off before repeating the split. If, on the other hand, you’re not feeling sore at the end of the second day, feel free to repeat the split up to 3 times in a row, always taking at least one rest day per week.</li><li>Repeat 8 cycles or more.</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(17, 'Functional Strength', 'functional-strength', 'POZSP17', '2', 2, '1670249331.jpg', 'Beginner,Intermediate', NULL, 'building-mass,functional-strength,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>This 2-day split, with a strong focus on combining strength and mobility, provides a great all-around full-body functional workout. Be sure to pay close attention to tips on execution and breath, as these workouts in particular offer much better benefits if performed with proper form.</li></ul>', '<ul><li>As this split includes some intense muscle building exercises, I recommend doing both days consecutively, then taking a day off before repeating the split. If, on the other hand, you’re not feeling sore at the end of the second day, feel free to repeat the split up to 3 times in a row, always taking at least one rest day per week.</li><li>Repeat 8 cycles or more.</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(18, 'Better Balance and Mobility', 'better-balance-and-mobility', 'POZSP18', '2', 2, '1670249352.jpg', 'Intermediate,Advanced', NULL, 'building-mass,functional-strength,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>The workouts in this rigorous 2-day split will prepare your body for dynamic movement in sports and every day life, with a solid combination of strength, balance, and mobility training.</li></ul>', '<ul><li>As this split includes some intense muscle building exercises, I recommend doing both days consecutively, then taking a day off before repeating the split. If, on the other hand, you’re not feeling sore at the end of the second day, feel free to repeat the split up to 3 times in a row, always taking at least one rest day per week.</li><li>Repeat 8 cycles or more.</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00'),
(19, 'Functional Power', 'functional-power', 'POZSP19', '2', 2, '1670249377.jpg', 'Intermediate,Advanced', NULL, 'building-mass,functional-strength,burning-fat', NULL, 'full-body', '15,45,30', '<ul><li>Build functional strength and explosive power with this fun and challenging 2-day split. Focusing on your breath in will help you recover quickly from the more muscularly demanding exercises, and will improve your balance and stability while performing them. Feel free to push yourself as hard as you want in these workouts… as long as you keep your jaw and neck relaxed!</li></ul>', '<ul><li>As this split includes some intense muscle building exercises, I recommend doing both days consecutively, then taking a day off before repeating the split. If, on the other hand, you’re not feeling sore at the end of the second day, feel free to repeat the split up to 3 times in a row, always taking at least one rest day per week.</li><li>Repeat 8 cycles or more.</li><li>With all workouts and splits, I recommend changing your routine every 4 - 6 weeks. After challenging your body in different ways, you can always benefit from revisiting routines you’ve enjoyed in the past.</li></ul>', NULL, 1, NULL, '2022-12-02 12:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `split_workouts`
--

CREATE TABLE `split_workouts` (
  `id` bigint UNSIGNED NOT NULL,
  `split_id` int UNSIGNED NOT NULL,
  `workout_id` int NOT NULL,
  `duration` int NOT NULL,
  `starting_day` int NOT NULL,
  `ending_day` int NOT NULL,
  `total_days` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `split_workouts`
--

INSERT INTO `split_workouts` (`id`, `split_id`, `workout_id`, `duration`, `starting_day`, `ending_day`, `total_days`, `created_at`) VALUES
(7, 10, 48, 15, 1, 1, 1, '2022-12-17 16:36:12'),
(8, 10, 53, 15, 2, 2, 1, '2022-12-17 16:36:12'),
(9, 10, 48, 45, 1, 1, 1, '2022-12-17 16:36:30'),
(10, 10, 53, 45, 2, 2, 1, '2022-12-17 16:36:30'),
(11, 10, 48, 30, 1, 1, 1, '2022-12-17 16:36:49'),
(12, 10, 53, 30, 2, 2, 1, '2022-12-17 16:36:49'),
(13, 11, 49, 15, 1, 1, 1, '2022-12-17 16:38:45'),
(14, 11, 54, 15, 2, 2, 1, '2022-12-17 16:38:45'),
(15, 11, 49, 45, 1, 1, 1, '2022-12-17 16:39:05'),
(16, 11, 54, 45, 2, 2, 1, '2022-12-17 16:39:05'),
(17, 11, 49, 30, 1, 1, 1, '2022-12-17 16:39:25'),
(18, 11, 54, 30, 2, 2, 1, '2022-12-17 16:39:25'),
(20, 12, 50, 15, 1, 1, 1, '2022-12-17 16:43:22'),
(21, 12, 55, 15, 2, 2, 1, '2022-12-17 16:43:22'),
(22, 12, 50, 45, 1, 1, 1, '2022-12-17 16:43:38'),
(23, 12, 55, 45, 2, 2, 1, '2022-12-17 16:43:38'),
(24, 12, 50, 30, 1, 1, 1, '2022-12-17 16:43:54'),
(25, 12, 55, 30, 2, 2, 1, '2022-12-17 16:43:54'),
(26, 13, 58, 10, 1, 1, 1, '2022-12-17 16:47:26'),
(27, 13, 59, 10, 2, 2, 1, '2022-12-17 16:47:26'),
(28, 13, 58, 20, 1, 1, 1, '2022-12-17 16:47:44'),
(29, 13, 59, 20, 2, 2, 1, '2022-12-17 16:47:44'),
(30, 13, 58, 30, 1, 1, 1, '2022-12-17 16:48:05'),
(31, 13, 59, 30, 2, 2, 1, '2022-12-17 16:48:05'),
(32, 14, 60, 15, 1, 1, 1, '2022-12-17 16:56:21'),
(33, 14, 61, 15, 2, 2, 1, '2022-12-17 16:56:21'),
(34, 14, 60, 45, 1, 1, 1, '2022-12-17 16:56:38'),
(35, 14, 61, 45, 2, 2, 1, '2022-12-17 16:56:38'),
(36, 14, 60, 30, 1, 1, 1, '2022-12-17 16:56:58'),
(37, 14, 61, 30, 2, 2, 1, '2022-12-17 16:56:58'),
(38, 15, 63, 15, 1, 1, 1, '2022-12-17 17:00:13'),
(39, 15, 62, 15, 2, 2, 1, '2022-12-17 17:00:13'),
(40, 15, 63, 45, 1, 1, 1, '2022-12-17 17:00:33'),
(41, 15, 62, 45, 2, 2, 1, '2022-12-17 17:00:33'),
(42, 15, 63, 30, 1, 1, 1, '2022-12-17 17:00:52'),
(43, 15, 62, 30, 2, 2, 1, '2022-12-17 17:00:52'),
(44, 16, 65, 15, 1, 1, 1, '2022-12-17 17:03:19'),
(45, 16, 64, 15, 2, 2, 1, '2022-12-17 17:03:19'),
(46, 16, 65, 45, 1, 1, 1, '2022-12-17 17:03:40'),
(47, 16, 64, 45, 2, 2, 1, '2022-12-17 17:03:40'),
(48, 16, 65, 30, 1, 1, 1, '2022-12-17 17:03:57'),
(49, 16, 64, 30, 2, 2, 1, '2022-12-17 17:03:57'),
(50, 17, 67, 15, 1, 1, 1, '2022-12-17 17:05:55'),
(51, 17, 66, 15, 2, 2, 1, '2022-12-17 17:05:55'),
(52, 17, 67, 45, 1, 1, 1, '2022-12-17 17:06:13'),
(53, 17, 66, 45, 2, 2, 1, '2022-12-17 17:06:13'),
(54, 17, 67, 30, 1, 1, 1, '2022-12-17 17:06:28'),
(55, 17, 66, 30, 2, 2, 1, '2022-12-17 17:06:28'),
(60, 19, 71, 15, 1, 1, 1, '2022-12-17 17:22:28'),
(61, 19, 70, 15, 2, 2, 1, '2022-12-17 17:22:28'),
(62, 19, 71, 45, 1, 1, 1, '2022-12-17 17:22:47'),
(63, 19, 70, 45, 2, 2, 1, '2022-12-17 17:22:47'),
(64, 19, 71, 30, 1, 1, 1, '2022-12-17 18:07:14'),
(65, 19, 70, 30, 2, 2, 1, '2022-12-17 18:07:14'),
(66, 2, 18, 15, 1, 1, 1, '2022-12-17 18:23:22'),
(67, 2, 19, 15, 2, 2, 1, '2022-12-17 18:23:22'),
(68, 2, 18, 45, 1, 1, 1, '2022-12-17 18:23:39'),
(69, 2, 19, 45, 2, 2, 1, '2022-12-17 18:23:39'),
(70, 2, 18, 30, 1, 1, 1, '2022-12-17 18:23:56'),
(71, 2, 19, 30, 2, 2, 1, '2022-12-17 18:23:56'),
(72, 3, 36, 10, 1, 1, 1, '2022-12-17 18:26:12'),
(73, 3, 31, 10, 2, 2, 1, '2022-12-17 18:26:12'),
(74, 3, 41, 10, 3, 3, 1, '2022-12-17 18:26:12'),
(75, 3, 36, 20, 1, 1, 1, '2022-12-17 18:26:32'),
(76, 3, 31, 20, 2, 2, 1, '2022-12-17 18:26:32'),
(77, 3, 41, 20, 3, 3, 1, '2022-12-17 18:26:32'),
(78, 3, 36, 30, 1, 1, 1, '2022-12-17 18:26:51'),
(79, 3, 31, 30, 2, 2, 1, '2022-12-17 18:26:51'),
(80, 3, 41, 30, 3, 3, 1, '2022-12-17 18:26:51'),
(81, 4, 37, 10, 1, 1, 1, '2022-12-17 18:29:16'),
(82, 4, 32, 10, 2, 2, 1, '2022-12-17 18:29:16'),
(83, 4, 42, 10, 3, 3, 1, '2022-12-17 18:29:16'),
(84, 4, 37, 20, 1, 1, 1, '2022-12-17 18:29:33'),
(85, 4, 32, 20, 2, 2, 1, '2022-12-17 18:29:33'),
(86, 4, 42, 20, 3, 3, 1, '2022-12-17 18:29:33'),
(87, 4, 37, 30, 1, 1, 1, '2022-12-17 18:29:52'),
(88, 4, 32, 30, 2, 2, 1, '2022-12-17 18:29:52'),
(89, 4, 42, 30, 3, 3, 1, '2022-12-17 18:29:52'),
(90, 5, 38, 10, 1, 1, 1, '2022-12-17 18:40:57'),
(91, 5, 33, 10, 2, 2, 1, '2022-12-17 18:40:57'),
(92, 5, 43, 10, 3, 3, 1, '2022-12-17 18:40:57'),
(93, 5, 38, 20, 1, 1, 1, '2022-12-17 18:41:13'),
(94, 5, 33, 20, 2, 2, 1, '2022-12-17 18:41:13'),
(95, 5, 43, 20, 3, 3, 1, '2022-12-17 18:41:13'),
(96, 5, 38, 30, 1, 1, 1, '2022-12-17 18:41:31'),
(97, 5, 33, 30, 2, 2, 1, '2022-12-17 18:41:31'),
(98, 5, 43, 30, 3, 3, 1, '2022-12-17 18:41:31'),
(99, 7, 40, 10, 1, 1, 1, '2022-12-17 18:49:42'),
(100, 7, 35, 10, 2, 2, 1, '2022-12-17 18:49:42'),
(101, 7, 45, 10, 3, 3, 1, '2022-12-17 18:49:42'),
(102, 7, 40, 20, 1, 1, 1, '2022-12-17 18:49:59'),
(103, 7, 35, 20, 2, 2, 1, '2022-12-17 18:49:59'),
(104, 7, 45, 20, 3, 3, 1, '2022-12-17 18:49:59'),
(105, 7, 40, 30, 1, 1, 1, '2022-12-17 18:50:22'),
(106, 7, 35, 30, 2, 2, 1, '2022-12-17 18:50:22'),
(107, 7, 45, 30, 3, 3, 1, '2022-12-17 18:50:22'),
(108, 8, 46, 15, 1, 1, 1, '2022-12-17 18:52:46'),
(109, 8, 51, 15, 2, 2, 1, '2022-12-17 18:52:46'),
(110, 8, 46, 45, 1, 1, 1, '2022-12-17 18:53:19'),
(111, 8, 51, 45, 2, 2, 1, '2022-12-17 18:53:19'),
(112, 8, 46, 30, 1, 1, 1, '2022-12-17 18:54:10'),
(113, 8, 51, 30, 2, 2, 1, '2022-12-17 18:54:10'),
(114, 9, 47, 15, 1, 1, 1, '2022-12-17 18:55:55'),
(115, 9, 52, 15, 2, 2, 1, '2022-12-17 18:55:55'),
(116, 9, 47, 45, 1, 1, 1, '2022-12-17 18:56:19'),
(117, 9, 52, 45, 2, 2, 1, '2022-12-17 18:56:19'),
(118, 9, 47, 30, 1, 1, 1, '2022-12-17 18:56:41'),
(119, 9, 52, 30, 2, 2, 1, '2022-12-17 18:56:41'),
(120, 18, 68, 30, 1, 2, 2, '2022-12-18 05:26:56'),
(122, 1, 14, 15, 1, 1, 1, '2022-12-18 06:34:54'),
(123, 1, 15, 15, 2, 2, 1, '2022-12-18 06:34:54'),
(124, 6, 39, 10, 1, 1, 1, '2022-12-18 06:44:00'),
(125, 6, 34, 10, 2, 2, 1, '2022-12-18 06:44:00'),
(126, 6, 44, 10, 3, 3, 1, '2022-12-18 06:44:00'),
(127, 1, 14, 30, 1, 1, 1, '2022-12-18 09:07:08'),
(128, 1, 15, 30, 2, 2, 1, '2022-12-18 09:07:08'),
(129, 1, 14, 45, 1, 1, 1, '2022-12-18 09:07:25'),
(130, 1, 15, 45, 2, 2, 1, '2022-12-18 09:07:25'),
(131, 6, 39, 20, 1, 1, 1, '2022-12-18 09:08:00'),
(132, 6, 34, 20, 2, 2, 1, '2022-12-18 09:08:00'),
(133, 6, 44, 20, 3, 3, 1, '2022-12-18 09:08:00'),
(134, 6, 39, 30, 1, 1, 1, '2022-12-18 09:08:20'),
(135, 6, 34, 30, 2, 2, 1, '2022-12-18 09:08:20'),
(136, 6, 44, 30, 3, 3, 1, '2022-12-18 09:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `streches`
--

CREATE TABLE `streches` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `based_on` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tip_video` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tip_video_thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reps` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `focus_area` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `specific_muscles` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `good_for` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `level` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fitness_goal` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onboarding_status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `email`, `mobile`, `image`, `gender`, `age`, `level`, `height`, `weight`, `fitness_goal`, `email_verified_at`, `type`, `password`, `remember_token`, `onboarding_status`, `created_at`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', '9713879633', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-01 18:43:36', NULL, '$2y$10$HRAin4ehc/cGE2pW35Zd1un3CcNhSfQ98p2e0mpU6f4FC8/QNH6NG', 'AsCjLTrIA68bA5CqfpaexX306GD6hEXiEdfEvFjgfj09YsqtKc9Np6KIV1jA', 0, '2021-10-02 07:26:14'),
(2, 'steve', 'customer', 'steve@d.niestudio.com', NULL, 'default-placeholder.png', 'Male', '20', 'Beginner', '167', '68', 'Build Muscles', NULL, 'normal', '$2y$10$.Eup.rpcw/CzCtS59Dz6/.inkBDK1Y3wJoOcB1kCQz1rZsrslyyxW', NULL, 1, '2022-11-30 12:00:32'),
(3, 'Daniel', 'customer', 'd@niestudio.com', NULL, 'default-placeholder.png', 'Prefer not to say', '20', 'Advanced', '167', '68', 'Back Health', NULL, 'normal', '$2y$10$L1jEG7TbF8zSiyJm/56NmeWldpQSzQqPwe3TjoPFcaLtRAkY8a/lG', NULL, 1, '2022-12-01 09:29:15'),
(4, 'Akansha Priya', 'customer', 'akansha.priya19@gmail.com', NULL, 'default-placeholder.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'normal', '$2y$10$UKAGyxed2pJHatoFxWmHceN9jLPfG.kEMgxGXx1EmRA3k0Sj.B4n2', NULL, 0, '2022-12-01 09:53:34'),
(7, 'amit', 'customer', 'dubey@poznic.com', NULL, 'default-placeholder.png', 'Male', '20', 'Beginner', '167', '68', 'Build Muscles', NULL, 'normal', '$2y$10$.lXUy0.35Tdo54tsg8HwAuQstROAAx0.vFjlWJeJRuPHeOVTVCBwe', NULL, 1, '2022-12-01 15:07:57'),
(14, 'Amit Dubey', 'customer', 'dubey2k22@gmail.com', NULL, NULL, 'Male', '20', 'Beginner', '167', '68', 'Burn Fat', '2022-12-01 16:38:22', 'social', NULL, NULL, 1, '2022-12-01 16:38:22'),
(16, 'test project', 'customer', 'testcgptproject@gmail.com', NULL, '1670909582.jpg', 'Female', '20', 'Intermediate', '167', '68', 'Functional Training', '2022-12-01 17:28:39', 'social', NULL, NULL, 1, '2022-12-01 17:28:39'),
(22, 'Poznic Training', 'customer', 'poznictraining@gmail.com', NULL, NULL, 'Male', '20', 'Advanced', '167', '68', 'Back Health', '2022-12-03 06:23:16', 'social', NULL, NULL, 1, '2022-12-03 06:23:16'),
(23, '', 'customer', 'manglik.shruti@gmail.com', NULL, NULL, 'Female', '36', 'Intermediate', '166', '73', 'Burn Fat', '2022-12-05 05:33:49', 'social', NULL, NULL, 1, '2022-12-05 05:33:49'),
(24, 'Colin Bush', 'customer', 'colinbush.81491@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-05 19:37:07', 'social', NULL, NULL, 0, '2022-12-05 19:37:07'),
(25, 'Candice Ford', 'customer', 'candiceford.63187@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-10 05:38:32', 'social', NULL, NULL, 0, '2022-12-10 05:38:32'),
(26, 'Jo Francis', 'customer', 'jofrancis.46707@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 20:44:23', 'social', NULL, NULL, 0, '2022-12-12 20:44:23'),
(27, 'Shawn Parker', 'customer', 'shawnparker.47302@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-14 00:41:05', 'social', NULL, NULL, 0, '2022-12-14 00:41:05'),
(28, 'asas', 'customer', 'asas@gmail.com', NULL, 'default-placeholder.png', NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-28 03:41:29', 'normal', '$2y$10$aA/oa/6myNaxBJMcnpCQkebNAXUh6a5SM.lUX19c7GXIHI4lIoWwi', NULL, 0, '2022-12-28 03:41:29'),
(29, 'chandan tiwari', 'customer', 'chandan8ty@gmail.com', NULL, NULL, 'Male', '21', 'Beginner', '184', '99', 'Burn Fat', '2022-12-29 18:21:06', 'social', NULL, NULL, 1, '2022-12-29 18:21:06'),
(30, 'Ankit', 'customer', 'ankit@poznic.com', NULL, 'default-placeholder.png', NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-02 17:40:05', 'normal', '$2y$10$RZD.q15AH.hc3a2foUKB0uqC9CVh9.F04nMCMjYf3GcQPVIFStncO', NULL, 0, '2023-01-02 17:40:05'),
(31, 'ankit', 'customer', 'amkit@poznic.com', NULL, 'default-placeholder.png', NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-02 17:41:06', 'normal', '$2y$10$MO8CSh1fFHJpC1im65UfKO.w7NkjCYYiRp1tfcbFAlMPCsqL2rvYm', NULL, 0, '2023-01-02 17:41:06'),
(32, 'dummy', 'customer', 'dummy@poznic.com', NULL, 'default-placeholder.png', 'Male', '20', 'Intermediate', '167', '68', 'Burn Fat', '2023-01-02 17:44:29', 'normal', '$2y$10$d5pn52VE7E9wfP0iMko0Gu2uWIjwTx3h70v.sg8y.UsIPSBo76G7K', NULL, 1, '2023-01-02 17:44:29'),
(33, 'Caleb Hudson', 'customer', 'calebhudson.71349@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-03 00:42:22', 'social', NULL, NULL, 0, '2023-01-03 00:42:22'),
(34, 'alalala', 'customer', 'djdjdjdjd@gmail.com', NULL, 'default-placeholder.png', 'Male', '20', 'Advanced', '167', '68', 'Functional Training', '2023-01-03 02:11:43', 'normal', '$2y$10$KGMuv5KFJMoCr2uJcMQ/uer6St13KypSWU0BEiou7GIjyy1l4RYpK', NULL, 1, '2023-01-03 02:11:43'),
(35, 'djsjsjdjs', 'customer', 'djsjshhs@gmail.com', NULL, 'default-placeholder.png', 'Prefer not to say', '20', 'Advanced', '167', '68', 'Back Health', '2023-01-03 19:51:02', 'normal', '$2y$10$uZFw0iNndM6FAVyvJl.ofeThPaELgowWxtR1sBeO//xNRr/thc1IS', NULL, 1, '2023-01-03 19:51:02'),
(36, 'amit', 'customer', 'amit@poznic.com', NULL, 'default-placeholder.png', NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-04 02:05:34', 'normal', '$2y$10$69DL3YOTqEjUGoKcbjiMAOR.T5skx/d.VK9Ms6eLhQi5Dd5j3Lrfy', NULL, 0, '2023-01-04 02:05:34'),
(37, 'hhcdr', 'customer', 'jhf@gmail.com', NULL, 'default-placeholder.png', 'Prefer not to say', '20', 'Advanced', '167', '68', 'Back Health', '2023-01-07 22:28:25', 'normal', '$2y$10$xw6rcWe3UFeJKccx26yEAOsPBn0lQr3.7ZO7J2BMs.tTLwLSt9EK6', NULL, 1, '2023-01-07 22:28:25'),
(38, 'aaaaa', 'customer', 'aaaaa@gmail.com', NULL, 'default-placeholder.png', 'Male', '20', 'Beginner', '167', '68', 'Build Muscles', '2023-01-10 00:22:43', 'normal', '$2y$10$ZH569AUUA.W1ER.koRCkJOL1Wo1LzTgjtSms4J37f8OhS3L9tZofK', NULL, 1, '2023-01-10 00:22:43'),
(39, 'nik', 'customer', 'jdjd@hfh.it', NULL, 'default-placeholder.png', 'Male', '22', 'Beginner', '175', '74', 'Build Muscles', '2023-01-16 16:26:08', 'normal', '$2y$10$FDnRBf0fEAp.2QkMRXEvFegIS/Zx9IpuJMG7LWq8pyKN1epyhRvrm', NULL, 1, '2023-01-16 16:26:08'),
(40, 'Karey Moffett', 'customer', 'kareymoffett.06086@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-08 08:38:58', 'social', NULL, NULL, 0, '2023-02-08 08:38:58'),
(42, '', 'customer', 'vickya819@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-12 07:53:16', 'social', NULL, NULL, 0, '2023-02-12 07:53:16'),
(43, 'david', 'customer', 'test@test.com', NULL, 'default-placeholder.png', 'Male', '20', 'Intermediate', '167', '68', 'Back Health', '2023-05-31 19:04:19', 'normal', '$2y$10$DG/Qw4m0VA7d/13neDyicO3ViIOpXlp7OB.qyNPtATzOSX9XOTy0C', NULL, 1, '2023-05-31 19:04:19'),
(44, 'genius', 'customer', 'geniustheatre@gmail.com', NULL, 'default-placeholder.png', 'Male', '20', 'Intermediate', '167', '68', 'Back Health', '2023-05-31 19:20:04', 'normal', '$2y$10$vlJpuL6fq0eTCepoe.2pI.jGhzruMFUvpotDt8H13wpxwzLJfAB7y', NULL, 1, '2023-05-31 19:20:04'),
(45, 'david', 'customer', 'davidamatz@gmail.com', NULL, 'default-placeholder.png', 'Male', '40', 'Intermediate', '178', '81', 'Functional Training', '2024-04-24 21:10:11', 'normal', '$2y$10$7QwBVl3vjOunZgk8wWDuPeuJJ43l00G3471UlB67fQjLKWe1B8nGu', NULL, 1, '2024-04-24 21:10:11');

-- --------------------------------------------------------

--
-- Table structure for table `users_plan`
--

CREATE TABLE `users_plan` (
  `id` bigint UNSIGNED NOT NULL,
  `plan_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `plan_start` date NOT NULL,
  `plan_end` date NOT NULL,
  `price` int NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancel_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_plan`
--

INSERT INTO `users_plan` (`id`, `plan_id`, `user_id`, `plan_start`, `plan_end`, `price`, `currency`, `status`, `cancel_reason`, `expiration_reason`, `transaction_id`, `type`, `store`, `created_at`) VALUES
(1, 'poznicapp_499_3m', 16, '2023-02-13', '2023-02-13', 1497, 'INR', 'Expired', 'BILLING_ERROR', 'BILLING_ERROR', 'GPA.3382-7876-8054-76993', 'EXPIRATION', 'PLAY_STORE', '2022-12-02 09:51:27'),
(2, 'poznicapp_599_1m', 3, '2024-06-17', '2024-06-17', 60, 'USD', 'Expired', 'UNSUBSCRIBE', 'UNKNOWN', '2000000340113166', 'EXPIRATION', 'APP_STORE', '2022-12-02 19:16:47'),
(3, 'poznicapp_399_12m', 2, '2022-12-03', '2022-12-03', 4788, 'INR', 'Active', NULL, NULL, 'GPA.3330-5795-9824-19567', 'INITIAL_PURCHASE', 'PLAY_STORE', '2022-12-03 17:45:50'),
(4, 'poznicapp_399_12m', 22, '2023-11-24', '2023-11-25', 60, 'USD', 'Expired', 'BILLING_ERROR', 'BILLING_ERROR', 'GPA.3398-7935-5667-87119', 'EXPIRATION', 'PLAY_STORE', '2022-12-12 18:53:34'),
(5, 'poznicapp_399_12m', 7, '2023-02-04', '2023-02-04', 4788, 'INR', 'Expired', 'UNSUBSCRIBE', 'UNSUBSCRIBE', 'GPA.3305-0784-3484-54571', 'EXPIRATION', 'PLAY_STORE', '2022-12-13 04:42:58'),
(6, 'poznicapp_399_12m', 37, '2023-01-08', '2023-01-08', 60, 'USD', 'Expired', 'BILLING_ERROR', 'BILLING_ERROR', 'GPA.3366-1162-4897-79963', 'EXPIRATION', 'PLAY_STORE', '2023-01-07 23:11:14'),
(7, 'poznicapp_399_12m', 38, '2023-01-13', '2023-01-13', 60, 'USD', 'Expired', 'BILLING_ERROR', 'BILLING_ERROR', 'GPA.3375-1983-8045-51580', 'EXPIRATION', 'PLAY_STORE', '2023-01-12 21:12:32'),
(8, 'poznicapp_599_1m', 45, '2024-04-24', '2024-04-24', 7, 'USD', 'Expired', 'UNSUBSCRIBE', 'UNKNOWN', '2000000581015364', 'EXPIRATION', 'APP_STORE', '2024-04-24 21:42:13');

-- --------------------------------------------------------

--
-- Table structure for table `user_favourite`
--

CREATE TABLE `user_favourite` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `exercise_id` int UNSIGNED DEFAULT NULL,
  `workout_id` int UNSIGNED DEFAULT NULL,
  `program_id` int UNSIGNED DEFAULT NULL,
  `split_id` int UNSIGNED DEFAULT NULL,
  `strech_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_favourite`
--

INSERT INTO `user_favourite` (`id`, `user_id`, `exercise_id`, `workout_id`, `program_id`, `split_id`, `strech_id`, `created_at`) VALUES
(1, 16, 1, NULL, NULL, NULL, NULL, '2022-12-03 15:13:23'),
(2, 16, 6, NULL, NULL, NULL, NULL, '2022-12-03 15:13:27'),
(5, 16, 2, NULL, NULL, NULL, NULL, '2022-12-04 16:11:17'),
(7, 16, NULL, NULL, NULL, 3, NULL, '2022-12-05 14:31:52'),
(8, 16, NULL, NULL, 6, NULL, NULL, '2022-12-05 14:32:18'),
(9, 16, NULL, NULL, NULL, 4, NULL, '2022-12-05 14:33:01'),
(10, 16, NULL, NULL, NULL, 10, NULL, '2022-12-05 14:33:09'),
(11, 16, NULL, 111, NULL, NULL, NULL, '2022-12-05 14:33:43'),
(12, 16, NULL, NULL, NULL, 5, NULL, '2023-01-02 18:28:33'),
(14, 37, NULL, NULL, NULL, 6, NULL, '2023-01-07 23:12:52'),
(15, 3, 29, NULL, NULL, NULL, NULL, '2024-06-17 01:15:46'),
(16, 3, 5, NULL, NULL, NULL, NULL, '2024-06-17 01:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_playlists`
--

CREATE TABLE `user_playlists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_playlists`
--

INSERT INTO `user_playlists` (`id`, `user_id`, `title`, `slug`, `created_at`) VALUES
(1, 22, 'test', 'test', '2022-12-03 06:35:43'),
(2, 16, 'test 1', 'test-1', '2022-12-09 01:50:41'),
(3, 16, 'test 2', 'test-2', '2022-12-09 01:51:00'),
(4, 7, 'test', 'test', '2022-12-10 18:00:50'),
(6, 22, 'test 2', 'test-2', '2022-12-28 03:38:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_progresses`
--

CREATE TABLE `user_progresses` (
  `id` bigint UNSIGNED NOT NULL,
  `subscription_id` int UNSIGNED NOT NULL,
  `workout_id` int UNSIGNED DEFAULT NULL,
  `day` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'FALSE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_progresses`
--

INSERT INTO `user_progresses` (`id`, `subscription_id`, `workout_id`, `day`, `date`, `status`, `created_at`) VALUES
(1, 3, 5, 1, '2023-01-03', 'TRUE', '2023-01-03 02:00:24'),
(2, 3, 5, 2, '2023-01-03', 'TRUE', '2023-01-03 02:05:53'),
(3, 9, 2, 1, '2023-01-12', 'TRUE', '2023-01-12 21:13:02'),
(4, 5, 1, 1, '2023-02-08', 'TRUE', '2023-02-08 08:50:38'),
(5, 13, 7, 1, '2023-05-30', 'TRUE', '2023-05-30 01:53:41'),
(6, 3, 5, 3, '2023-11-24', 'TRUE', '2023-11-24 20:53:09'),
(7, 3, 5, 4, '2023-11-24', 'TRUE', '2023-11-24 20:53:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_questions_answers`
--

CREATE TABLE `user_questions_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `question_id` int NOT NULL,
  `answer` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_recents`
--

CREATE TABLE `user_recents` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `exercise_id` int UNSIGNED DEFAULT NULL,
  `workout_id` int UNSIGNED DEFAULT NULL,
  `program_id` int UNSIGNED DEFAULT NULL,
  `split_id` int UNSIGNED DEFAULT NULL,
  `strech_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_recents`
--

INSERT INTO `user_recents` (`id`, `user_id`, `exercise_id`, `workout_id`, `program_id`, `split_id`, `strech_id`, `created_at`) VALUES
(1, 16, 3, NULL, NULL, NULL, NULL, '2022-12-02 09:51:07'),
(2, 16, 1, NULL, NULL, NULL, NULL, '2022-12-02 12:42:08'),
(3, 16, 15, NULL, NULL, NULL, NULL, '2022-12-02 12:42:16'),
(4, 16, 18, NULL, NULL, NULL, NULL, '2022-12-02 12:42:38'),
(5, 3, 1, NULL, NULL, NULL, NULL, '2022-12-02 19:14:01'),
(6, 3, 25, NULL, NULL, NULL, NULL, '2022-12-02 19:24:40'),
(7, 3, 4, NULL, NULL, NULL, NULL, '2022-12-02 23:11:24'),
(8, 3, 2, NULL, NULL, NULL, NULL, '2022-12-03 06:12:05'),
(9, 3, NULL, NULL, NULL, 1, NULL, '2022-12-03 06:14:50'),
(10, 22, NULL, NULL, NULL, 1, NULL, '2022-12-03 06:23:35'),
(11, 22, 1, NULL, NULL, NULL, NULL, '2022-12-03 06:27:40'),
(12, 22, 5, NULL, NULL, NULL, NULL, '2022-12-03 06:35:50'),
(13, 22, 4, NULL, NULL, NULL, NULL, '2022-12-03 06:35:58'),
(14, 22, 2, NULL, NULL, NULL, NULL, '2022-12-03 06:36:39'),
(15, 16, NULL, NULL, NULL, 1, NULL, '2022-12-03 13:09:32'),
(16, 16, 2, NULL, NULL, NULL, NULL, '2022-12-03 13:24:58'),
(17, 16, 7, NULL, NULL, NULL, NULL, '2022-12-03 13:27:09'),
(18, 16, 76, NULL, NULL, NULL, NULL, '2022-12-03 13:35:47'),
(19, 16, 6, NULL, NULL, NULL, NULL, '2022-12-03 15:13:26'),
(20, 14, NULL, NULL, NULL, 1, NULL, '2022-12-03 17:18:45'),
(21, 14, NULL, NULL, NULL, 2, NULL, '2022-12-03 17:19:12'),
(22, 14, NULL, NULL, NULL, 5, NULL, '2022-12-03 17:19:17'),
(23, 14, 1, NULL, NULL, NULL, NULL, '2022-12-03 17:22:05'),
(24, 16, NULL, NULL, NULL, 4, NULL, '2022-12-03 17:29:22'),
(25, 16, 10, NULL, NULL, NULL, NULL, '2022-12-03 17:32:18'),
(26, 23, 14, NULL, NULL, NULL, NULL, '2022-12-05 05:36:14'),
(27, 16, NULL, NULL, 5, NULL, NULL, '2022-12-05 12:44:13'),
(28, 16, NULL, NULL, NULL, 3, NULL, '2022-12-05 12:44:36'),
(29, 16, NULL, NULL, NULL, 2, NULL, '2022-12-05 12:52:30'),
(30, 16, NULL, NULL, NULL, 6, NULL, '2022-12-05 12:52:37'),
(31, 16, NULL, NULL, NULL, 8, NULL, '2022-12-05 12:52:41'),
(32, 16, NULL, NULL, NULL, 10, NULL, '2022-12-05 12:52:46'),
(33, 16, 9, NULL, NULL, NULL, NULL, '2022-12-05 14:30:52'),
(34, 16, NULL, NULL, 6, NULL, NULL, '2022-12-05 14:32:17'),
(35, 16, NULL, 111, NULL, NULL, NULL, '2022-12-05 14:33:41'),
(36, 16, NULL, NULL, NULL, 7, NULL, '2022-12-05 14:34:52'),
(37, 16, NULL, NULL, NULL, 13, NULL, '2022-12-05 14:34:57'),
(38, 16, NULL, NULL, NULL, 5, NULL, '2022-12-05 15:57:39'),
(39, 16, NULL, 110, NULL, NULL, NULL, '2022-12-05 19:16:19'),
(40, 16, NULL, NULL, 8, NULL, NULL, '2022-12-05 21:22:57'),
(41, 16, NULL, 123, NULL, NULL, NULL, '2022-12-06 18:09:30'),
(42, 16, NULL, 124, NULL, NULL, NULL, '2022-12-06 18:09:42'),
(43, 16, NULL, NULL, 7, NULL, NULL, '2022-12-09 01:49:30'),
(44, 16, 4, NULL, NULL, NULL, NULL, '2022-12-09 01:50:52'),
(45, 16, NULL, 3, NULL, NULL, NULL, '2022-12-09 01:58:46'),
(46, 16, 5, NULL, NULL, NULL, NULL, '2022-12-09 01:58:59'),
(47, 16, NULL, 1, NULL, NULL, NULL, '2022-12-09 09:45:30'),
(48, 16, NULL, 2, NULL, NULL, NULL, '2022-12-09 09:54:00'),
(49, 16, NULL, 4, NULL, NULL, NULL, '2022-12-10 13:12:28'),
(50, 7, 1, NULL, NULL, NULL, NULL, '2022-12-10 18:23:06'),
(51, 7, 2, NULL, NULL, NULL, NULL, '2022-12-10 18:23:10'),
(52, 7, 6, NULL, NULL, NULL, NULL, '2022-12-10 18:23:12'),
(53, 7, 3, NULL, NULL, NULL, NULL, '2022-12-10 18:29:22'),
(54, 7, NULL, NULL, 5, NULL, NULL, '2022-12-10 18:31:13'),
(55, 16, 11, NULL, NULL, NULL, NULL, '2022-12-12 02:51:02'),
(56, 22, 3, NULL, NULL, NULL, NULL, '2022-12-12 18:29:09'),
(57, 22, 6, NULL, NULL, NULL, NULL, '2022-12-12 18:29:20'),
(58, 22, NULL, NULL, NULL, 2, NULL, '2022-12-12 19:18:31'),
(59, 22, NULL, NULL, NULL, 3, NULL, '2022-12-12 19:22:31'),
(60, 22, NULL, 1, NULL, NULL, NULL, '2022-12-13 23:21:50'),
(61, 22, 25, NULL, NULL, NULL, NULL, '2022-12-13 23:34:35'),
(62, 22, 26, NULL, NULL, NULL, NULL, '2022-12-13 23:50:27'),
(63, 22, NULL, 2, NULL, NULL, NULL, '2022-12-14 00:27:32'),
(64, 22, NULL, NULL, 5, NULL, NULL, '2022-12-15 02:12:09'),
(65, 22, NULL, 3, NULL, NULL, NULL, '2022-12-16 02:26:29'),
(66, 7, NULL, NULL, NULL, 1, NULL, '2022-12-17 04:13:30'),
(67, 7, NULL, NULL, 6, NULL, NULL, '2022-12-17 04:26:22'),
(73, 16, NULL, 14, NULL, NULL, NULL, '2022-12-18 13:08:25'),
(74, 16, NULL, 36, NULL, NULL, NULL, '2022-12-18 13:08:36'),
(75, 16, NULL, 37, NULL, NULL, NULL, '2022-12-18 13:08:54'),
(77, 22, 8, NULL, NULL, NULL, NULL, '2022-12-19 20:56:46'),
(78, 22, NULL, 9, NULL, NULL, NULL, '2022-12-19 20:56:56'),
(80, 16, NULL, NULL, 14, NULL, NULL, '2022-12-21 14:40:06'),
(81, 16, NULL, NULL, 12, NULL, NULL, '2022-12-21 14:48:33'),
(82, 16, NULL, NULL, 13, NULL, NULL, '2022-12-21 14:48:49'),
(83, 16, NULL, NULL, 22, NULL, NULL, '2022-12-21 14:51:16'),
(84, 16, NULL, NULL, NULL, 12, NULL, '2022-12-27 20:13:58'),
(85, 22, NULL, NULL, NULL, 11, NULL, '2022-12-28 03:48:26'),
(86, 16, NULL, NULL, 11, NULL, NULL, '2023-01-02 13:33:54'),
(87, 16, NULL, 10, NULL, NULL, NULL, '2023-01-02 15:50:49'),
(91, 22, NULL, 14, NULL, NULL, NULL, '2023-01-03 01:09:18'),
(92, 22, NULL, 5, NULL, NULL, NULL, '2023-01-03 01:10:01'),
(93, 22, 7, NULL, NULL, NULL, NULL, '2023-01-03 01:18:17'),
(94, 22, 12, NULL, NULL, NULL, NULL, '2023-01-03 01:18:33'),
(95, 22, NULL, NULL, 13, NULL, NULL, '2023-01-03 01:20:30'),
(96, 22, NULL, NULL, 21, NULL, NULL, '2023-01-03 01:42:27'),
(97, 22, NULL, 10, NULL, NULL, NULL, '2023-01-03 01:42:42'),
(98, 22, NULL, NULL, 6, NULL, NULL, '2023-01-03 02:02:36'),
(99, 22, NULL, NULL, 7, NULL, NULL, '2023-01-03 02:02:50'),
(100, 22, NULL, NULL, 8, NULL, NULL, '2023-01-03 02:03:02'),
(101, 22, NULL, NULL, 14, NULL, NULL, '2023-01-03 02:06:46'),
(102, 3, NULL, NULL, 5, NULL, NULL, '2023-01-04 01:59:11'),
(103, 3, NULL, 1, NULL, NULL, NULL, '2023-01-04 02:00:46'),
(104, 37, NULL, NULL, 5, NULL, NULL, '2023-01-07 22:55:24'),
(105, 37, NULL, NULL, 6, NULL, NULL, '2023-01-07 22:55:59'),
(106, 37, NULL, NULL, 8, NULL, NULL, '2023-01-07 23:10:38'),
(107, 37, NULL, NULL, NULL, 2, NULL, '2023-01-07 23:10:49'),
(108, 37, NULL, 1, NULL, NULL, NULL, '2023-01-07 23:11:00'),
(109, 37, NULL, NULL, NULL, 3, NULL, '2023-01-07 23:13:55'),
(110, 22, NULL, NULL, 10, NULL, NULL, '2023-01-10 00:20:48'),
(111, 38, NULL, NULL, 5, NULL, NULL, '2023-01-10 00:23:03'),
(112, 38, NULL, NULL, NULL, 1, NULL, '2023-01-12 21:12:05'),
(113, 38, NULL, 14, NULL, NULL, NULL, '2023-01-12 21:12:40'),
(114, 38, NULL, NULL, NULL, 2, NULL, '2023-01-12 21:12:47'),
(115, 38, NULL, 18, NULL, NULL, NULL, '2023-01-12 21:12:51'),
(116, 38, NULL, NULL, NULL, 3, NULL, '2023-01-12 21:18:02'),
(117, 38, NULL, NULL, NULL, 7, NULL, '2023-01-12 21:18:23'),
(118, 38, NULL, 40, NULL, NULL, NULL, '2023-01-12 21:18:27'),
(119, 39, NULL, 1, NULL, NULL, NULL, '2023-01-16 16:28:19'),
(120, 7, NULL, 1, NULL, NULL, NULL, '2023-01-28 18:14:14'),
(121, 7, NULL, 14, NULL, NULL, NULL, '2023-02-04 14:47:24'),
(122, 7, NULL, 15, NULL, NULL, NULL, '2023-02-04 14:47:39'),
(123, 7, NULL, NULL, NULL, 2, NULL, '2023-02-04 14:47:59'),
(124, 7, NULL, 2, NULL, NULL, NULL, '2023-02-04 14:48:19'),
(125, 22, NULL, NULL, NULL, 9, NULL, '2023-02-08 08:46:57'),
(126, 22, NULL, NULL, NULL, 8, NULL, '2023-02-08 08:47:01'),
(127, 22, NULL, 46, NULL, NULL, NULL, '2023-02-08 08:47:10'),
(128, 22, NULL, NULL, NULL, 7, NULL, '2023-02-08 08:47:38'),
(129, 22, NULL, 40, NULL, NULL, NULL, '2023-02-08 08:47:42'),
(130, 22, NULL, 36, NULL, NULL, NULL, '2023-02-08 08:51:29'),
(131, 16, NULL, NULL, 19, NULL, NULL, '2023-02-08 16:14:42'),
(132, 22, NULL, NULL, NULL, 4, NULL, '2023-02-16 20:22:46'),
(133, 22, NULL, 37, NULL, NULL, NULL, '2023-02-16 20:23:06'),
(134, 22, 227, NULL, NULL, NULL, NULL, '2023-04-08 02:28:34'),
(135, 22, 232, NULL, NULL, NULL, NULL, '2023-04-08 02:28:54'),
(136, 3, NULL, NULL, 6, NULL, NULL, '2023-05-23 22:53:38'),
(137, 3, NULL, NULL, 9, NULL, NULL, '2023-05-23 22:53:46'),
(138, 3, NULL, NULL, NULL, 2, NULL, '2023-05-25 00:13:22'),
(139, 3, NULL, 2, NULL, NULL, NULL, '2023-05-30 01:04:21'),
(140, 22, 14, NULL, NULL, NULL, NULL, '2023-05-30 01:43:43'),
(141, 22, NULL, NULL, NULL, 6, NULL, '2023-05-30 01:53:03'),
(142, 22, NULL, 39, NULL, NULL, NULL, '2023-05-30 01:53:09'),
(143, 22, NULL, 47, NULL, NULL, NULL, '2023-05-30 01:55:08'),
(144, 43, NULL, 1, NULL, NULL, NULL, '2023-05-31 19:04:54'),
(145, 44, NULL, 1, NULL, NULL, NULL, '2023-05-31 19:20:19'),
(146, 3, NULL, 14, NULL, NULL, NULL, '2023-05-31 19:30:03'),
(147, 22, 249, NULL, NULL, NULL, NULL, '2023-08-23 18:27:47'),
(148, 22, 76, NULL, NULL, NULL, NULL, '2023-08-23 18:29:21'),
(149, 22, 18, NULL, NULL, NULL, NULL, '2023-08-23 18:33:06'),
(150, 22, NULL, 13, NULL, NULL, NULL, '2023-11-23 02:10:28'),
(151, 22, 59, NULL, NULL, NULL, NULL, '2023-11-23 02:12:51'),
(152, 22, NULL, NULL, 11, NULL, NULL, '2023-11-24 21:00:01'),
(153, 22, NULL, 26, NULL, NULL, NULL, '2023-11-24 21:00:06'),
(154, 23, NULL, 1, NULL, NULL, NULL, '2023-12-23 07:55:24'),
(155, 23, 1, NULL, NULL, NULL, NULL, '2023-12-23 07:55:57'),
(156, 45, 1, NULL, NULL, NULL, NULL, '2024-04-24 21:12:08'),
(157, 45, NULL, 1, NULL, NULL, NULL, '2024-04-24 21:12:21'),
(158, 3, 13, NULL, NULL, NULL, NULL, '2024-06-17 01:12:09'),
(159, 3, 29, NULL, NULL, NULL, NULL, '2024-06-17 01:14:41'),
(160, 3, 5, NULL, NULL, NULL, NULL, '2024-06-17 01:21:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_split_progresses`
--

CREATE TABLE `user_split_progresses` (
  `id` bigint NOT NULL,
  `progress_id` int UNSIGNED NOT NULL,
  `workout_id` int UNSIGNED NOT NULL,
  `day` int NOT NULL,
  `date` date NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'FALSE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_split_subscriptions`
--

CREATE TABLE `user_split_subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `subscription_no` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `split_id` int UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_days` int NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_split_subscriptions`
--

INSERT INTO `user_split_subscriptions` (`id`, `subscription_no`, `user_id`, `split_id`, `start_date`, `end_date`, `total_days`, `status`, `created_at`) VALUES
(1, 16202212053, 16, 3, '2022-12-05', '2022-12-08', 3, 'ACTIVE', '2022-12-05 14:31:54'),
(2, 16202212054, 16, 4, '2022-12-05', '2022-12-08', 3, 'ACTIVE', '2022-12-05 14:33:02'),
(3, 162022120510, 16, 10, '2022-12-05', '2022-12-07', 2, 'ACTIVE', '2022-12-05 14:33:10'),
(4, 16202212061, 16, 1, '2022-12-06', '2022-12-08', 2, 'ACTIVE', '2022-12-06 18:09:14'),
(5, 22202212121, 22, 1, '2022-12-12', '2022-12-14', 2, 'ACTIVE', '2022-12-12 19:18:21'),
(6, 22202212122, 22, 2, '2022-12-12', '2022-12-14', 2, 'ACTIVE', '2022-12-12 19:18:32'),
(7, 22202212123, 22, 3, '2022-12-12', '2022-12-15', 3, 'ACTIVE', '2022-12-12 19:22:32'),
(8, 38202301121, 38, 1, '2023-01-12', '2023-01-14', 2, 'ACTIVE', '2023-01-12 21:12:34'),
(9, 38202301122, 38, 2, '2023-01-12', '2023-01-14', 2, 'ACTIVE', '2023-01-12 21:12:48'),
(10, 38202301127, 38, 7, '2023-01-12', '2023-01-15', 3, 'ACTIVE', '2023-01-12 21:18:24'),
(11, 7202302041, 7, 1, '2023-02-04', '2023-02-06', 2, 'ACTIVE', '2023-02-04 14:45:20'),
(12, 22202302088, 22, 8, '2023-02-08', '2023-02-10', 2, 'ACTIVE', '2023-02-08 08:47:06'),
(13, 22202302087, 22, 7, '2023-02-08', '2023-02-11', 3, 'ACTIVE', '2023-02-08 08:47:39'),
(14, 22202302164, 22, 4, '2023-02-16', '2023-02-19', 3, 'ACTIVE', '2023-02-16 20:23:01'),
(15, 22202305306, 22, 6, '2023-05-30', '2023-06-02', 3, 'ACTIVE', '2023-05-30 01:53:05'),
(16, 22202305309, 22, 9, '2023-05-30', '2023-06-01', 2, 'ACTIVE', '2023-05-30 01:55:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `subscription_no` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `program_id` int UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_days` int NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `subscription_no`, `user_id`, `program_id`, `start_date`, `end_date`, `total_days`, `status`, `created_at`) VALUES
(1, 16202212055, 16, 5, '2022-12-05', '2022-12-17', 12, 'ACTIVE', '2022-12-05 14:31:40'),
(2, 16202212056, 16, 6, '2022-12-05', '2022-12-17', 12, 'ACTIVE', '2022-12-05 14:32:19'),
(3, 22202212165, 22, 5, '2022-12-16', '2022-12-28', 12, 'ACTIVE', '2022-12-16 02:26:49'),
(4, 162022122122, 16, 22, '2022-12-21', '2023-01-20', 30, 'ACTIVE', '2022-12-21 14:51:19'),
(5, 162022122113, 16, 13, '2022-12-21', '2023-01-08', 18, 'ACTIVE', '2022-12-21 14:51:48'),
(6, 16202301028, 16, 8, '2023-01-02', '2023-01-11', 9, 'ACTIVE', '2023-01-02 13:33:50'),
(7, 222023010313, 22, 13, '2023-01-03', '2023-01-21', 18, 'ACTIVE', '2023-01-03 01:20:38'),
(8, 22202301036, 22, 6, '2023-01-03', '2023-01-15', 12, 'ACTIVE', '2023-01-03 02:02:37'),
(9, 22202301037, 22, 7, '2023-01-03', '2023-01-11', 8, 'ACTIVE', '2023-01-03 02:02:51'),
(10, 22202301038, 22, 8, '2023-01-03', '2023-01-12', 9, 'ACTIVE', '2023-01-03 02:03:03'),
(11, 222023010314, 22, 14, '2023-01-03', '2023-01-30', 27, 'ACTIVE', '2023-01-03 02:07:34'),
(12, 162023011014, 16, 14, '2023-01-10', '2023-02-06', 27, 'ACTIVE', '2023-01-10 01:44:35'),
(13, 7202302045, 7, 5, '2023-02-04', '2023-02-16', 12, 'ACTIVE', '2023-02-04 14:48:06'),
(14, 7202302046, 7, 6, '2023-02-04', '2023-02-16', 12, 'ACTIVE', '2023-02-04 14:49:32'),
(15, 3202305275, 3, 5, '2023-05-27', '2023-06-08', 12, 'ACTIVE', '2023-05-27 13:08:50'),
(16, 3202305316, 3, 6, '2023-05-31', '2023-06-12', 12, 'ACTIVE', '2023-05-31 19:29:56'),
(17, 222023112310, 22, 10, '2023-11-23', '2023-11-29', 6, 'ACTIVE', '2023-11-23 02:04:52'),
(18, 222023112411, 22, 11, '2023-11-24', '2023-12-03', 9, 'ACTIVE', '2023-11-24 21:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` bigint DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `slug`, `url`, `thumbnail`, `type`, `order`, `description`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'The Acrobatic Body - Aamir Khan\'s Untold Transformation', 'the-acrobatic-body-aamir-khans-untold-transformation', 'https://www.youtube.com/watch?v=9dbSnkFmGek&t=71s&ab_channel=PoznicTraining', 'https://i.ytimg.com/vi/9dbSnkFmGek/hqdefault.jpg', 'youtube', 1, '<p>Bollywood megastar Aamir Khan is well known for the spectacular body transformations he’s undertaken for his roles in various films over the years. In 2008 he blew us away with his intense role and impressive physique in Ghajini, and more recently he left jaws gaping with his “Fat to Fit” transformation for Dangal. In \"The Acrobatic Body,\" join Aamir, Victor Acharya (the director of Dhoom 3), and trainer David Poznic for Aamir’s untold transformation for his hit film, Dhoom 3.</p><p><br></p><p>\"The Acrobatic Body\" is a tour through the two years of intense training it took for Aamir to transform into a professional acrobat for his role(s) in Dhoom 3. Aamir’s goal for Dhoom 3 was to not just get ripped, but to actually look, feel, and move like an acrobat. To reach this goal, he joined forces with a professional acrobat and personal trainer David Poznic. David led Aamir not only through intensive weight lifting regimes in the gym, but also trained him in handstands, acrobatics, parkour, juggling, and unicycling.&nbsp;</p><p><br></p><p>As you’ll see in \"The Acrobatic Body,\" even Aamir’s gym training for Dhoom 3 was geared completely toward building both the body and the movement style of a professional acrobat and circus artist. Drawing from over 15 years of international travels - coaching and performing in the realms of circus, dance, physical theatre, and martial arts - Poznic’s unique training style pushed Aamir to his limits and helped him to completely transform both his body and movement style to embody this once-in-a-lifetime (double!) role.</p>', NULL, '2022-12-07 15:15:05', '2022-12-07 15:32:46'),
(2, 'Top 3 Push-Up Tips', 'top-3-push-up-tips', 'https://www.youtube.com/watch?v=1MQRnyHoyFk', 'https://i.ytimg.com/vi/1MQRnyHoyFk/hqdefault.jpg', 'youtube', 2, '<p><span style=\"color: rgb(15, 15, 15); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgba(0, 0, 0, 0.05);\">In this video, we’ll show you the top 3 pushup tips that will help you perform a perfect push-up.</span></p><p><span style=\"color: rgb(15, 15, 15); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgba(0, 0, 0, 0.05);\">The push-up not only works your pecs (chest), triceps, front deltoids (shoulders), and core, but is also a great bodyweight workout you can do anywhere, anytime, with no equipment, to develop strength, size, and explosive power. Additionally, while we often think of push-ups as primarily working the chest and triceps, if you use proper form, it’s also one of the best exercises for six-packs out there!</span></p><p><span style=\"color: rgb(15, 15, 15); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgba(0, 0, 0, 0.05);\">In this video, we show you how to properly place and activate your hands, how to track your elbows, and how to keep proper alignment and core engagement through your entire body while executing the perfect push-up. This will not only allow you to perform push-ups with more strength and power but will also help you avoid low back or wrist pain by learning to stabilize your core and build strong wrists and forearms. </span></p><p><span style=\"color: rgb(15, 15, 15); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgba(0, 0, 0, 0.05);\">The perfect push-up comes in dozens of styles. This foundational video will set the stage for all the endless variations on the push-up that we’ll be exploring on this channel.</span><br></p>', NULL, '2022-12-07 15:16:32', '2022-12-07 15:32:54'),
(3, 'Torturing Aamir Khan', 'torturing-aamir-khan', 'https://www.youtube.com/watch?v=JRV8SGrKCio', 'https://i.ytimg.com/vi/JRV8SGrKCio/hqdefault.jpg', 'youtube', 3, '<p>In the Aamir Khan movies Dhoom 3 and PK, India’s favorite megastar once again surprised Bollywood with a stunning new look - the lean and shredded physique of a professional acrobat. In this video, you\'ll see the exercises (and insanely hard work!) behind the Aamir Khan transformation that helped Dhoom 3 become the highest-grossing Indian film in the history of Indian cinema at the time of its release.&nbsp;</p><p>&nbsp;</p><p>In Dhoom 3, Aamir Khan played a professional circus artist. While many other actors would have settled for just getting ripped and letting the body-doubles take care of the rest, Aamir proved once again that he deserves his incredible success, spending two years training with David Poznic for his role.&nbsp;</p><p>&nbsp;</p><p>Our training included weight lifting, acrobatics, running, parkour, swimming, juggling, and unicycling. Even our exercises in the gym were always based on the way professional acrobats train: rather than traditional gym exercises, we focused heavily on increasing stability challenges, intense core workouts, and dynamic movements that helped Aamir build the kind of strength, speed, and agility that would allow him to look, feel, and move like a professional acrobat.&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>The Aamir Khan songs in Dhoom 3 are, not surprisingly, an explosion of raw energy and power. In them we see not only Aamir\'s unique brand of charisma, but also a way of moving that can only be earned by months and months of hard work both in and out of the gym. Join us for this short video highlighting the Aamir Khan workout that helped these Aamir Khan movies become the legends they are today!</p>', NULL, '2022-12-07 15:17:46', '2022-12-07 15:33:03'),
(4, 'Pullups for Beginners', 'pullups-for-beginners', 'https://www.youtube.com/watch?v=dEjzFLHDngA', 'https://i.ytimg.com/vi/dEjzFLHDngA/hqdefault.jpg', 'youtube', 5, '<p>If you can\'t do a pull-up and want to learn how this video is for you. Learning how to do pull-ups can feel intimidating, but it doesn\'t have to!</p><p><span style=\"font-size: 1rem;\">In this video, we show you three simple bodyweight exercises that will prepare you to be able to do your first pull-up. Of course, if you can already do pull-ups, these are great exercises to improve pull-ups as well!</span></p><p><span style=\"font-size: 1rem;\">Pull-ups are one of the most powerful and effective bodyweight exercises that exist. They work your lats, biceps, traps, rhomboids, teres major, infraspinatus, pecs, erector spinae, and obliques! That\'s great news in terms of the effect they\'ll have on your body and your strength, but it also means you need to train these muscles to work together efficiently in order to get your first pull up.&nbsp;</span></p><p><span style=\"font-size: 1rem;\">The exercises in this video are simple, but they can have a huge effect on your functional strength, and if you do them a few minutes a day, a few times a week, you WILL be able to learn how to do your first pull up!</span></p>', NULL, '2022-12-07 15:27:31', '2022-12-07 15:33:21'),
(5, 'Aamir Khan on Being YOUR Best', 'aamir-khan-on-being-your-best', 'https://www.youtube.com/watch?v=VX3vvspgHNM&ab_channel=PoznicTraining', 'https://i.ytimg.com/vi/VX3vvspgHNM/hqdefault.jpg', 'youtube', 4, '<p>In this unpublished interview excerpt, Bollywood superstar Aamir Khan shares his personal definition of fitness. While fans often think of Aamir as \"Mr. Perfectionist,\" the truth is that his viewpoints on fitness and health are completely down to earth and achievable by anyone willing to dig in and work hard.</p><p><br></p><p>Aamir is certainly willing to do whatever it takes to build the body he needs for a role, but when it comes to his personal life and values, his no-nonsense focus on pushing yourself a little harder each day to reach your own goals is a refreshing break from the convoluted messages we hear daily from movies, \"influencers,\" and the fitness industry.</p>', NULL, '2022-12-07 15:29:19', '2022-12-07 15:33:13'),
(6, 'Aamir Khan’s Fat Loss Diet', 'aamir-khans-fat-loss-diet', 'https://www.youtube.com/watch?v=Qlm4sImDZzo', 'https://i.ytimg.com/vi/Qlm4sImDZzo/hqdefault.jpg', 'youtube', 6, '<p>I trained Aamir Khan for two years for his films Dhoom 3 and PK, and in this video, I share the fat loss diet I created for him during the final months leading up to his shirtless shoots for Dhoom 3. In the film, Aamir played a professional acrobat, so, rather than just building bulk, he wanted to sculpt a truly acrobatic body - lean, powerful, and agile.&nbsp;</p><p><span style=\"font-size: 1rem;\">So not only did we lift weights 5 or 6 days a week, but I also trained Aamir in parkour, acrobatics, handstands, juggling, Cyr Wheel, and juggling. But physical training alone was not enough to pull off another amazing Aamir Khan transformation. I also created different diets for Aamir during different phases of our training journey.&nbsp;</span></p><p><span style=\"font-size: 1rem;\">This diet was designed to take that Aamir Khan body that fans went crazy for in Ghajini to a whole different level - shredding off fat while preserving the muscle mass Aamir had worked so hard for. For this he needed a solid diet grounded in science, but also one that was flexible enough for his hectic lifestyle, and tasty enough to help him stay on track.</span></p>', NULL, '2022-12-07 15:32:33', '2022-12-07 15:37:01'),
(8, 'Do Carbs Make You Fat?', 'do-carbs-make-you-fat', 'https://www.youtube.com/watch?v=-wDX9eJAspk', 'https://i.ytimg.com/vi/-wDX9eJAspk/hqdefault.jpg', 'youtube', 7, '<p>Do carbs make you fat? Are carbs good for you? Are carbs bad for you? What are the best carbs for weight loss?&nbsp;&nbsp;</p><p>&nbsp;</p><p>If you\'re looking for the best way to lose weight, you\'ve probably been hearing a lot about \"good carbs\" vs. \"bad carbs,\" or \"complex carbs\" vs. \"simple carbs.\" Or you may even be convinced that carbs make you fat no matter what and should be avoided at all costs.</p><p>&nbsp;</p><p>In this video, we dive into the science behind the role of carbs for fat loss and muscle gain. We talk about what carbs actually are, how your body processes them, and, most importantly, how to get the right amount of the right kind of complex carbs for weight loss and of course for building muscle</p>', NULL, '2022-12-10 11:27:28', '2022-12-10 11:27:28'),
(9, 'Aamir Khan on Being YOUR Best', 'aamir-khan-on-being-your-best', 'https://www.youtube.com/watch?v=VX3vvspgHNM&ab_channel=PoznicTraining', 'https://i.ytimg.com/vi/VX3vvspgHNM/hqdefault.jpg', 'youtube', 8, '<p>In this unpublished interview excerpt, Bollywood superstar Aamir Khan shares his personal definition of fitness. While fans often think of Aamir as \"Mr. Perfectionist,\" the truth is that his viewpoints on fitness and health are completely down to earth and achievable by anyone willing to dig in and work hard.</p><p><br></p><p>Aamir is certainly willing to do whatever it takes to build the body he needs for a role, but when it comes to his personal life and values, his no-nonsense focus on pushing yourself a little harder each day to reach your own goals is a refreshing break from the convoluted messages we hear daily from movies, \"influencers,\" and the fitness industry.</p>', NULL, '2022-12-10 11:29:21', '2022-12-10 11:29:21'),
(10, 'Hollow Body Holds', 'hollow-body-holds', 'https://www.youtube.com/watch?v=scSfF_Dq2V0', 'https://i.ytimg.com/vi/scSfF_Dq2V0/hqdefault.jpg', 'youtube', 9, '<p>Whether you\'re looking for a core workout at home, lower back pain relief, a stronger handstand, or just want to chisel that six-pack or get your flat belly back for the new year, the hollow body hold is a great exercise you can do anywhere, at any time, with no gym.</p><p><span style=\"font-size: 1rem;\">While training Aamir Khan for his roles in Dhoom 3 and PK, we constantly performed exercises that rely on having a solid hollow body hold. Handstands, pushups, pullups, hollow swings, the list goes on and on. Developing functional core strength is crucial for weight lifting, sports, gymnastics, dance, and even fat loss.&nbsp;</span></p><p><span style=\"font-size: 1rem;\">The hollow body position is a true foundation of so many other bodyweight exercises, as well as a great way to work on core strength and stability.&nbsp;</span></p><p><span style=\"font-size: 1rem;\">Learning how to do a hollow body is simple, but it\'s important to follow a few guidelines to protect your neck and lower back, as well as to build a strong foundation that will allow you to actually integrate the hollow body hold into countless other abdominal exercises.&nbsp;</span></p><p><span style=\"font-size: 1rem;\">In this video, we\'ll walk you clearly through the entire progression, as well as share some tips for folks with neck pain, or those working toward a handstand. All you need is a spot on the floor, so let\'s dive right in!</span></p><div><br></div>', NULL, '2022-12-10 12:39:44', '2022-12-10 12:39:44'),
(11, 'Weights vs. Cardio for Fat Loss', 'weights-vs-cardio-for-fat-loss', 'https://www.youtube.com/watch?v=GX8kXLCpnJY', 'https://i.ytimg.com/vi/GX8kXLCpnJY/hqdefault.jpg', 'youtube', 10, '<p>Cardio vs. weights... If you want to burn fat, and you only have time for cardio or weight lifting, which should you choose?</p><p><span style=\"font-size: 1rem;\">Cardio vs. weights for fat loss is one of the most common questions that I\'ve come across over the years, though most often it seems to come in the form of the assumption that \"obviously\" cardio is the best way to burn fat fast.&nbsp; &nbsp;</span></p><p><span style=\"font-size: 1rem;\">In this video we explore the science behind this question, as well as various related topics, such as if you should perform cardio or weights first to lose weight, if you have time to do both. Whether you\'re looking for the best way to burn fat at the gym or trying to figure out how to budget your precious time working out at home, this video will provide clear information that will help you optimize your workout to burn fat without losing muscle.</span></p><div><br></div>', NULL, '2022-12-10 12:41:17', '2022-12-10 12:41:17');

-- --------------------------------------------------------

--
-- Table structure for table `warmup_workout`
--

CREATE TABLE `warmup_workout` (
  `id` bigint UNSIGNED NOT NULL,
  `exercise_id` int NOT NULL,
  `workout_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workouts`
--

CREATE TABLE `workouts` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `focus_area` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `good_for` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `calories_burned` int NOT NULL,
  `video_link` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` int NOT NULL DEFAULT '1',
  `category_id` bigint DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workouts`
--

INSERT INTO `workouts` (`id`, `code`, `title`, `slug`, `duration`, `instructions`, `description`, `type`, `focus_area`, `level`, `image`, `good_for`, `calories_burned`, `video_link`, `tags`, `visible`, `category_id`, `created_at`) VALUES
(1, 'POZWT1', 'Full Body Blaster', 'full-body-blaster', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Intermediate,Advanced', NULL, 'building-mass,burning-fat,fat-loss', 500, 'https://player.vimeo.com/external/654373244.hd.mp4?s=9d79b31641ea62ad8efeb53da0e9044a6ba65280&profile_id=175', NULL, 1, 2, '2022-12-07 17:21:24'),
(2, 'POZWT2', 'Push-Up Power', 'push-up-power', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'chest,triceps,core,shoulders', 'Intermediate,Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654779051.hd.mp4?s=eaf78cf9036592e756503e6f780559767c8950b2&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(3, 'POZWT3', 'Push-Up Power - Extended', 'push-up-power-extended', '15,45,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'core,shoulders,chest,triceps', 'Intermediate,Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654779051.hd.mp4?s=eaf78cf9036592e756503e6f780559767c8950b2&profile_id=175', NULL, 1, 2, '2022-12-07 17:21:24'),
(4, 'POZWT4', 'Undulating Push-Up Power', 'undulating-push-up-power', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'chest,triceps,core,shoulders', 'Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654779108.hd.mp4?s=b66351443c5b8d076878cb05ea8d33a2e20d276e&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(5, 'POZWT5', 'Undulating Push-Up Power - Extended', 'undulating-push-up-power-extended', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'chest,triceps,core,shoulders', 'Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654779108.hd.mp4?s=b66351443c5b8d076878cb05ea8d33a2e20d276e&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(6, 'POZWT6', 'Leg and Glute Foundations', 'leg-and-glute-foundations', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'legs,core,glutes', 'Beginner', NULL, 'building-mass', 500, 'https://player.vimeo.com/external/654373478.hd.mp4?s=8592763af347da659027b4716e4da46c0523d38c&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(7, 'POZWT7', 'Beyond Basic Legs', 'beyond-basic-legs', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'legs,core,glutes', 'Beginner,Intermediate', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654373450.hd.mp4?s=3cb262c6fca25bdbc96d5e2d61e3bc8a2b39c77d&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(8, 'POZWT8', 'Strong and Limber Lower Body', 'strong-and-limber-lower-body', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'legs,core,glutes', 'Intermediate', NULL, 'burning-fat,back-health', 500, 'https://player.vimeo.com/external/654373549.hd.mp4?s=987cdc849bd15ccdb394c36a8788156bd8a34944&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(9, 'POZWT9', 'Legs in Action', 'legs-in-action', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'legs,core,glutes', 'Intermediate,Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654373511.hd.mp4?s=7a01e79faa1058931a0c04e67a6a4bdd82a49f1d&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(10, 'POZWT10', 'Lower Body Power and Precision', 'lower-body-power-and-precision', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'legs,core,glutes', 'Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654373412.hd.mp4?s=6b5d209b203ce6a2d51d25cb6dc2d45b01ace058&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(11, 'POZWT11', 'Glute Bridge Foundations', 'glute-bridge-foundations', '7,15,20', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'glutes,legs,core', 'Beginner', NULL, 'building-mass,back-health', 500, 'https://player.vimeo.com/external/654373338.hd.mp4?s=f55aa9b846cf9ed63125fa71d98a1e8132c1c891&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(12, 'POZWT12', 'Glute Bridges in Motion', 'glute-bridges-in-motion', '7,15,20', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'glutes,legs,core', 'Intermediate', NULL, 'building-mass,back-health', 500, 'https://player.vimeo.com/external/654373374.hd.mp4?s=ecc19423c907d7ebafd64dcb1c3a499d6309dd1d&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(13, 'POZWT13', 'Glute Bridges Galore', 'glute-bridges-galore', '7,15,20', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'glutes,legs,core', 'Advanced', NULL, 'building-mass,back-health', 500, 'https://player.vimeo.com/external/654373301.hd.mp4?s=a538adb0514b91d49d6af5689022d373947beb92&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(14, 'POZWT14', 'InSpiral', 'inspiral', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Intermediate,Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654373689.hd.mp4?s=c94b1596ea19ee17031621f242991d92e00b7929&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(15, 'POZWT15', 'The Dynamic Body', 'the-dynamic-body', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Intermediate,Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654373689.hd.mp4?s=c94b1596ea19ee17031621f242991d92e00b7929&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(16, 'POZWT16', 'InSpiral - Extended', 'inspiral-extended', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Intermediate,Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:24'),
(17, 'POZWT17', 'The Dynamic Body - Extended', 'the-dynamic-body-extended', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Intermediate,Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654373723.hd.mp4?s=989b7181ffb9705f914a3cc7c448ec6b121a9c5d&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(18, 'POZWT18', 'Spiral Strength', 'spiral-strength', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654373579.hd.mp4?s=ca4b999643fe2e08133af8ce8b03c6d8c9eb8aaf&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(19, 'POZWT19', 'Spiral Power', 'spiral-power', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654373644.hd.mp4?s=6dc27e6997d26cb0f8aea7378046f3c45917cbf9&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(20, 'POZWT20', 'Spiral Strength - Extended', 'spiral-strength-extended', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654373579.hd.mp4?s=ca4b999643fe2e08133af8ce8b03c6d8c9eb8aaf&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:24'),
(21, 'POZWT21', 'Spiral Power - Extended', 'spiral-power-extended', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654373644.hd.mp4?s=6dc27e6997d26cb0f8aea7378046f3c45917cbf9&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(22, 'POZWT22', 'Balance and Stability Foundations', 'balance-and-stability-foundations', '20,40,60', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Beginner', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654373204.hd.mp4?s=4ce1f97590e09a106b6bc614c24d7b92f09f2302&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(23, 'POZWT23', 'Better Balance', 'better-balance', '20,40,60', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Intermediate', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654373143.hd.mp4?s=e3e3e41bb7392a4770cdaca60b194d0be913df4b&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(24, 'POZWT24', 'Steady and Ready', 'steady-and-ready', '20,40,60', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Intermediate,Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/654373048.hd.mp4?s=068283631c016cda890698ff4fefc60d63904a26&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(25, 'POZWT25', 'Balance Master', 'balance-master', '20,40,60', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Advanced', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/external/653702543.hd.mp4?s=f807969f464c15bbe922188d8c87743269ae07ca&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(26, 'POZWT26', 'Seven Minute Six Pack - Foundations', 'seven-minute-six-pack-foundations', '7', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'core', 'Beginner', NULL, 'burning-fat,back-health', 500, 'https://player.vimeo.com/external/653701751.hd.mp4?s=25fdd6c6a6da995c43c16172e00373a1a48d1974&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(27, 'POZWT27', 'Seven Minute Six Pack - Builder', 'seven-minute-six-pack-builder', '7', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'core', 'Beginner,Intermediate', NULL, 'burning-fat,back-health', 500, 'https://player.vimeo.com/external/653701650.hd.mp4?s=ba31a0ff6dd28e101356d5b6c1680c4b78c6179b&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(28, 'POZWT28', 'Seven Minute Six Pack - Maven', 'seven-minute-six-pack-maven', '7', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'core', 'Intermediate', NULL, 'burning-fat,back-health', 500, 'https://player.vimeo.com/external/653701650.hd.mp4?s=ba31a0ff6dd28e101356d5b6c1680c4b78c6179b&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(29, 'POZWT29', 'Seven Minute Six Pack - Crusher', 'seven-minute-six-pack-crusher', '7', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'core', 'Intermediate,Advanced', NULL, 'burning-fat,back-health', 500, 'https://player.vimeo.com/external/653701864.hd.mp4?s=0989a612d08ad4a53295aef188c497a0a55b1349&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(30, 'POZWT30', 'Seven Minute Six Pack - Master', 'seven-minute-six-pack-master', '7', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'core', 'Advanced', NULL, 'burning-fat,back-health', 500, 'https://player.vimeo.com/external/653701460.hd.mp4?s=f6cd14ba12c0881935062a1cc3cb00f6e5e70b3a&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(31, 'POZWT31', 'Back Foundations', 'back-foundations', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'back', 'Beginner', NULL, 'building-mass,back-health', 500, 'https://player.vimeo.com/external/653702180.hd.mp4?s=16c0373018a6dbb31b0122e1fef2dd1b47825352&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(32, 'POZWT32', 'Back in Balance', 'back-in-balance', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'back', 'Beginner,Intermediate', NULL, 'building-mass,back-health', 500, 'https://player.vimeo.com/external/653702074.hd.mp4?s=83c8f1537a717eaf29b5cac89af6a2843e700ef3&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(33, 'POZWT33', 'The Mighty Back', 'the-mighty-back', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'back,glutes', 'Intermediate', NULL, 'building-mass,back-health', 500, 'https://player.vimeo.com/external/653702430.hd.mp4?s=ceef525119be01100173ba17114aa10deaa42bbd&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(34, 'POZWT34', 'Back in Action', 'back-in-action', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'back,glutes', 'Intermediate,Advanced', NULL, 'building-mass,back-health', 500, 'https://player.vimeo.com/external/653702271.hd.mp4?s=51c705b6620eca4bcb8b37c9f3d10b45f8d5697e&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(35, 'POZWT35', 'Bullet Proof Back', 'bullet-proof-back', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'chest,triceps,core,shoulders', 'Advanced', NULL, 'building-mass,back-health', 500, 'https://player.vimeo.com/external/653701981.hd.mp4?s=3bc76f88dcd3d04450f408f25625a67b7598e176&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(36, 'POZWT36', 'Push Foundations', 'push-foundations', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'chest,triceps,core,shoulders', 'Beginner', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654374416.hd.mp4?s=4820f25f3ff60e60a4bf2f8aa17eeae2623db10e&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(37, 'POZWT37', 'Push Smart', 'push-smart', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'chest,triceps,core,shoulders', 'Beginner,Intermediate', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654374378.hd.mp4?s=ce23e7faf88897b3cb0e13451537edb51f529f84&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(38, 'POZWT38', 'The Chiseled Chest', 'the-chiseled-chest', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'chest,triceps,core,shoulders', 'Intermediate', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654779010.hd.mp4?s=0b3f2c51f4d012492e1afec7fe96543bfbc9f97e&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(39, 'POZWT39', 'Push Pro ', 'push-pro', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'chest,triceps,core,shoulders', 'Intermediate,Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654778968.hd.mp4?s=d57bfb66dbbc6606462fd740fddaeb06d2dd6f3b&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(40, 'POZWT40', 'Ultimate Push', 'ultimate-push', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'chest,triceps,core,shoulders', 'Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654374348.hd.mp4?s=1eded856e22203d58ad602f1d7a603fd6c3435d4&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(41, 'POZWT41', 'Leg Foundations', 'leg-foundations', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'glutes,legs', 'Beginner', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654373894.hd.mp4?s=d96354d338236f85005b43de929fd4148ac2b2bd&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(42, 'POZWT42', 'Legit Legs', 'legit-legs', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'glutes,legs', 'Beginner,Intermediate', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654373843.hd.mp4?s=d3c7e941bb2ecbe2bf70f7595d262292b35115bb&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(43, 'POZWT43', 'Leg Lift Off', 'leg-lift-off', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'glutes,legs', 'Intermediate', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654374004.hd.mp4?s=c7435d62e50c06bae008f968582c56829fd18a57&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(44, 'POZWT44', 'High Octane Legs', 'high-octane-legs', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'glutes,legs', 'Intermediate,Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654373931.hd.mp4?s=a15ede991b0e88fa4df26eb42f3e305b8f0d8ece&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(45, 'POZWT45', 'Supreme Legs', 'supreme-legs', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'glutes,legs', 'Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654373779.hd.mp4?s=ca627b380e20c825041a7f4f7c269ddc8db53d8c&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(46, 'POZWT46', 'Upper Body Foundations', 'upper-body-foundations', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'upper-body', 'Beginner', NULL, 'burning-fat,back-health', 500, 'https://player.vimeo.com/external/654779218.hd.mp4?s=63dbfd686fbc10acd99b4943e17bac04980a84c6&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(47, 'POZWT47', 'The Vital Upper Body', 'the-vital-upper-body', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'upper-body', 'Beginner,Intermediate', NULL, 'burning-fat,back-health', 500, 'https://player.vimeo.com/external/654779165.hd.mp4?s=b7a9500054dd215c1c1fe2facf6277267ad0331c&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(48, 'POZWT48', 'Upper Body Ace', 'upper-body-ace', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'upper-body', 'Intermediate', NULL, 'burning-fat,back-health', 500, 'https://player.vimeo.com/external/654779351.hd.mp4?s=7a1cd209cd51091e62f3169f3628aead5fc89f85&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(49, 'POZWT49', 'Upper Body Builder', 'upper-body-builder', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'upper-body', 'Intermediate,Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654779274.hd.mp4?s=4a2722c14aad99b25288e7f2b8bd9d3ea14533bc&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(50, 'POZWT50', 'Ultimate Upper Body', 'ultimate-upper-body', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'upper-body', 'Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/656417072.hd.mp4?s=3f428a1ffb74a30eabb19c0e65f32608ef85c1b5&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(51, 'POZWT51', 'Active Legs', 'active-legs', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'legs,glutes', 'Beginner', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/656416993.hd.mp4?s=b81b20202673429054dbcfafc73279d337474d90&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(52, 'POZWT52', 'Athletic Legs', 'athletic-legs', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'legs,glutes', 'Beginner,Intermediate', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654374104.hd.mp4?s=ee3cde53e0681a21ec4f4a77797c5e5fa0f76dee&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(53, 'POZWT53', 'Leg Hero', 'leg-hero', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'legs,glutes', 'Intermediate', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654374217.hd.mp4?s=4e973eb55943334033d3d64c2ac51205b426c0ec&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(54, 'POZWT54', 'One Leg at a Time', 'one-leg-at-a-time', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'legs,glutes', 'Intermediate,Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654374153.hd.mp4?s=4374a33747302df41d22a1279d94fb32484661b3&profile_id=175https://player.vimeo.com/external/654374153.hd.mp4?s=4374a33747302df41d22a1279d94fb32484661b3&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(55, 'POZWT55', 'Ultimate Legs', 'ultimate-legs', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'legs,glutes', 'Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/external/654374070.hd.mp4?s=ba8733741eb96605951ed2bf8db97a37e9e204a4&profile_id=175', NULL, 1, NULL, '2022-12-07 17:21:25'),
(56, 'POZWT56', 'Low Impact Full Body - Standing', 'low-impact-full-body-standing', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Beginner', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(57, 'POZWT57', 'Low Impact Full Body - Floor', 'low-impact-full-body-floor', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Beginner', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(58, 'POZWT58', 'Low Impact Lower Body', 'low-impact-lower-body', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'lower-body', 'Beginner', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(59, 'POZWT59', 'Low Impact Upper Body', 'low-impact-upper-body', '10,20,30', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'lower-body', 'Beginner', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(60, 'POZWT60', 'Lower Body Balance Foundations', 'lower-body-balance-foundations', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'lower-body', 'Beginner', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(61, 'POZWT61', 'Upper Body Balance Foundations', 'upper-body-balance-foundations', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'upper-body', 'Beginner,Intermediate', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(62, 'POZWT62', 'Functional Leg Foundations', 'functional-leg-foundations', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'lower-body', 'Beginner', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(63, 'POZWT63', 'Functional Upper Body Foundations', 'functional-upper-body-foundations', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'upper-body', 'Beginner,Intermediate', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(64, 'POZWT64', 'Lower Body Strength and Balance', 'lower-body-strength-and-balance', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'lower-body', 'Beginner,Intermediate', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(65, 'POZWT65', 'Upper Body Strength and Balance', 'upper-body-strength-and-balance', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'upper-body', 'Intermediate,Advanced', NULL, 'functional-strength,building-mass', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(66, 'POZWT66', 'Functional Leg Strength', 'functional-leg-strength', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'lower-body', 'Beginner,Intermediate', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(67, 'POZWT67', 'Functional Upper Body Strength', 'functional-upper-body-strength', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'upper-body', 'Beginner,Intermediate', NULL, 'functional-strength,building-mass', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(68, 'POZWT68', 'Lower Body Balance and Mobility', 'lower-body-balance-and-mobility', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'lower-body', 'Beginner,Intermediate', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(69, 'POZWT69', 'Upper Body Balance and Mobility', 'upper-body-balance-and-mobility', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'upper-body', 'Intermediate,Advanced', NULL, 'functional-strength,building-mass', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(70, 'POZWT70', 'Functional Leg Power', 'functional-leg-power', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'lower-body', 'Intermediate', NULL, 'functional-strength,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(71, 'POZWT71', 'Functional Upper Body Power', 'functional-upper-body-power', '20,40,60', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'upper-body', 'Intermediate,Advanced', NULL, 'functional-strength,building-mass', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25'),
(72, 'POZWT72', 'The Funky Full Body', 'the-funky-full-body', '15,30,45', '<ul><li>Test Instructions</li></ul>', NULL, 'workout', 'full-body', 'Intermediate,Advanced', NULL, 'building-mass,burning-fat', 500, 'https://player.vimeo.com/progressive_redirect/playback/600558591/rendition/1080p?loc=external&signature=1b90ae2bb6c00c026cc246cc140539116a1634a7ae47f984b766dfa8351c4035', NULL, 1, NULL, '2022-12-07 17:21:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `durations`
--
ALTER TABLE `durations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment_exercise`
--
ALTER TABLE `equipment_exercise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment_program`
--
ALTER TABLE `equipment_program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment_split`
--
ALTER TABLE `equipment_split`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment_streches`
--
ALTER TABLE `equipment_streches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment_workouts`
--
ALTER TABLE `equipment_workouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exercise_variations`
--
ALTER TABLE `exercise_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exercise_workout`
--
ALTER TABLE `exercise_workout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `focus_areas`
--
ALTER TABLE `focus_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `good_fors`
--
ALTER TABLE `good_fors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `muscles`
--
ALTER TABLE `muscles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlist_saved`
--
ALTER TABLE `playlist_saved`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poststrech_workout`
--
ALTER TABLE `poststrech_workout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_workout`
--
ALTER TABLE `program_workout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `splits`
--
ALTER TABLE `splits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `split_workouts`
--
ALTER TABLE `split_workouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `split_id` (`split_id`);

--
-- Indexes for table `streches`
--
ALTER TABLE `streches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_plan`
--
ALTER TABLE `users_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_favourite`
--
ALTER TABLE `user_favourite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_playlists`
--
ALTER TABLE `user_playlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_progresses`
--
ALTER TABLE `user_progresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_questions_answers`
--
ALTER TABLE `user_questions_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_recents`
--
ALTER TABLE `user_recents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_split_progresses`
--
ALTER TABLE `user_split_progresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_split_subscriptions`
--
ALTER TABLE `user_split_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warmup_workout`
--
ALTER TABLE `warmup_workout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `durations`
--
ALTER TABLE `durations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `equipments`
--
ALTER TABLE `equipments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `equipment_exercise`
--
ALTER TABLE `equipment_exercise`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT for table `equipment_program`
--
ALTER TABLE `equipment_program`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `equipment_split`
--
ALTER TABLE `equipment_split`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `equipment_streches`
--
ALTER TABLE `equipment_streches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `equipment_workouts`
--
ALTER TABLE `equipment_workouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `exercise_variations`
--
ALTER TABLE `exercise_variations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exercise_workout`
--
ALTER TABLE `exercise_workout`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1185;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `focus_areas`
--
ALTER TABLE `focus_areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `good_fors`
--
ALTER TABLE `good_fors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `muscles`
--
ALTER TABLE `muscles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nutrition`
--
ALTER TABLE `nutrition`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `playlist_saved`
--
ALTER TABLE `playlist_saved`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `poststrech_workout`
--
ALTER TABLE `poststrech_workout`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `program_workout`
--
ALTER TABLE `program_workout`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=540;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `splits`
--
ALTER TABLE `splits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `split_workouts`
--
ALTER TABLE `split_workouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `streches`
--
ALTER TABLE `streches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users_plan`
--
ALTER TABLE `users_plan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_favourite`
--
ALTER TABLE `user_favourite`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_playlists`
--
ALTER TABLE `user_playlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_progresses`
--
ALTER TABLE `user_progresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_questions_answers`
--
ALTER TABLE `user_questions_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_recents`
--
ALTER TABLE `user_recents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `user_split_progresses`
--
ALTER TABLE `user_split_progresses`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_split_subscriptions`
--
ALTER TABLE `user_split_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `warmup_workout`
--
ALTER TABLE `warmup_workout`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workouts`
--
ALTER TABLE `workouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
