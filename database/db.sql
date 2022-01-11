-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 11, 2022 at 06:17 AM
-- Server version: 5.7.32
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retrocub_shotshifter_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `application_setting`
--

CREATE TABLE `application_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_file` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `application_setting`
--

INSERT INTO `application_setting` (`id`, `identifier`, `meta_key`, `value`, `is_file`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'application_setting', 'favicon', 'images/favicon.png', 1, '2021-11-23 12:47:44', NULL, NULL),
(4, 'application_setting', 'application_name', 'Shot Shifter', 0, '2022-01-11 06:02:41', NULL, NULL),
(5, 'application_setting', 'logo', '/storage/application_setting/pCmqd6NhWkhrHkLmVAkQcsWgOT3Jlctl5NGU952g.png', 1, '2022-01-11 06:02:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `breaks`
--

CREATE TABLE `breaks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `scene_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `breaks`
--

INSERT INTO `breaks` (`id`, `user_id`, `scene_id`, `name`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 25, 'B1', '164123413161d33ed36ea3d', '1', '2022-01-03 18:22:11', '2022-01-03 18:25:53', '2022-01-03 18:25:53'),
(2, 4, 25, 'B2', '164123413961d33edbb4b03', '1', '2022-01-03 18:22:19', '2022-01-03 18:25:24', '2022-01-03 18:25:24'),
(3, 4, 22, 'B3', '164123415061d33ee6b8a77', '1', '2022-01-03 18:22:30', '2022-01-03 18:25:34', '2022-01-03 18:25:34'),
(4, 4, 24, 'B4', '164123417061d33efa4c998', '1', '2022-01-03 18:22:50', '2022-01-03 18:25:29', '2022-01-03 18:25:29'),
(5, 5, 28, 'Hh', '164123893861d3519abc256', '1', '2022-01-03 19:42:18', '2022-01-03 19:42:18', NULL),
(6, 5, 35, 'H', '164126909861d3c76a7db68', '1', '2022-01-04 04:04:58', '2022-01-04 04:09:16', '2022-01-04 04:09:16'),
(7, 6, 42, 'Zexe', '164128057361d3f43d7d237', '1', '2022-01-04 07:16:13', '2022-01-04 07:16:27', '2022-01-04 07:16:27'),
(8, 6, 40, 'Hhu3txt', '164128076461d3f4fc203e6', '1', '2022-01-04 07:19:24', '2022-01-04 09:50:05', '2022-01-04 09:50:05'),
(9, 6, 40, 'Hhu3txt', '164128077261d3f5040fc1f', '1', '2022-01-04 07:19:32', '2022-01-04 09:54:52', '2022-01-04 09:54:52'),
(10, 7, 50, 'Ugu', '164128373661d4009839d47', '1', '2022-01-04 08:08:56', '2022-01-04 08:10:05', '2022-01-04 08:10:05'),
(11, 4, 71, 'vg', '164136417661d53ad0266ac', '1', '2022-01-05 06:29:36', '2022-01-05 06:46:23', '2022-01-05 06:46:23'),
(12, 4, 71, 'vg', '164136417661d53ad06530a', '1', '2022-01-05 06:29:36', '2022-01-05 06:46:26', '2022-01-05 06:46:26'),
(13, 4, 71, 'vg', '164136417761d53ad1bc3d2', '1', '2022-01-05 06:29:37', '2022-01-05 06:46:28', '2022-01-05 06:46:28'),
(14, 4, 71, 'vg', '164136419061d53adec221d', '1', '2022-01-05 06:29:50', '2022-01-05 06:30:12', '2022-01-05 06:30:12'),
(15, 4, 71, 'vg', '164136419061d53adec8ffc', '1', '2022-01-05 06:29:50', '2022-01-05 06:30:11', '2022-01-05 06:30:11'),
(16, 4, 71, 'vg', '164136421761d53af92329f', '1', '2022-01-05 06:30:17', '2022-01-05 06:50:12', '2022-01-05 06:50:12'),
(17, 4, 71, 'vg', '164136422161d53afd20fa0', '1', '2022-01-05 06:30:21', '2022-01-05 06:49:01', '2022-01-05 06:49:01'),
(18, 4, 71, 'vg', '164136422261d53afecf172', '1', '2022-01-05 06:30:22', '2022-01-05 06:49:02', '2022-01-05 06:49:02'),
(19, 4, 71, 'vg', '164136422361d53affaa5b5', '1', '2022-01-05 06:30:23', '2022-01-05 06:50:17', '2022-01-05 06:50:17'),
(20, 4, 71, 'vg', '164136422461d53b0032bfb', '1', '2022-01-05 06:30:24', '2022-01-05 06:50:18', '2022-01-05 06:50:18'),
(21, 5, 36, 'Chch', '164136475461d53d1237ce9', '1', '2022-01-05 06:39:14', '2022-01-05 06:43:10', '2022-01-05 06:43:10'),
(22, 5, 36, 'Chch', '164136499861d53e0671f17', '1', '2022-01-05 06:43:18', '2022-01-05 06:43:24', '2022-01-05 06:43:24'),
(23, 5, 36, 'Chch', '164136500261d53e0a1ae10', '1', '2022-01-05 06:43:22', '2022-01-05 06:43:30', '2022-01-05 06:43:30'),
(24, 5, 36, 'Chch', '164136501561d53e17124bb', '1', '2022-01-05 06:43:35', '2022-01-05 06:46:50', '2022-01-05 06:46:50'),
(25, 4, 71, 'ggcgc', '164136517961d53ebb02d57', '1', '2022-01-05 06:46:19', '2022-01-05 06:54:49', '2022-01-05 06:54:49'),
(26, 4, 71, 'ggcgc', '164136517961d53ebb37b14', '1', '2022-01-05 06:46:19', '2022-01-05 07:01:43', '2022-01-05 07:01:43'),
(27, 4, 71, 'ggcgc', '164136517961d53ebb4fd1e', '1', '2022-01-05 06:46:19', '2022-01-05 07:04:06', '2022-01-05 07:04:06'),
(28, 4, 71, 'ggcgc', '164136517961d53ebb9592b', '1', '2022-01-05 06:46:19', '2022-01-05 07:04:08', '2022-01-05 07:04:08'),
(29, 5, 36, 'Cvv', '164136522361d53ee790c3b', '1', '2022-01-05 06:47:03', '2022-01-05 06:47:16', '2022-01-05 06:47:16'),
(30, 5, 36, 'Cvv', '164136522861d53eec3ec0e', '1', '2022-01-05 06:47:08', '2022-01-05 06:47:19', '2022-01-05 06:47:19'),
(31, 5, 36, 'Cvv', '164136523361d53ef1a7a3d', '1', '2022-01-05 06:47:13', '2022-01-05 06:47:20', '2022-01-05 06:47:20'),
(32, 5, 29, 'Fg', '164136548961d53ff19567f', '1', '2022-01-05 06:51:29', '2022-01-05 06:51:29', NULL),
(33, 6, 66, 'Ft', '164136551461d5400a09b43', '1', '2022-01-05 06:51:54', '2022-01-05 06:52:23', '2022-01-05 06:52:23'),
(34, 6, 66, 'Ft', '164136551961d5400f7ef4b', '1', '2022-01-05 06:51:59', '2022-01-05 06:52:18', '2022-01-05 06:52:18'),
(35, 6, 66, 'Ft', '164136552461d54014582ce', '1', '2022-01-05 06:52:04', '2022-01-05 06:52:18', '2022-01-05 06:52:18'),
(36, 6, 66, 'Ft', '164136552561d540150245d', '1', '2022-01-05 06:52:05', '2022-01-05 06:52:21', '2022-01-05 06:52:21'),
(37, 6, 66, 'Ft', '164136552861d540181df06', '1', '2022-01-05 06:52:08', '2022-01-05 06:52:20', '2022-01-05 06:52:20'),
(38, 6, 66, 'Ft', '164136552861d5401833f14', '1', '2022-01-05 06:52:08', '2022-01-05 06:52:20', '2022-01-05 06:52:20'),
(39, 6, 66, 'Ft', '164136555561d540336557a', '1', '2022-01-05 06:52:35', '2022-01-05 06:53:10', '2022-01-05 06:53:10'),
(40, 6, 66, 'Ft', '164136555861d54036d8c6a', '1', '2022-01-05 06:52:38', '2022-01-05 06:53:11', '2022-01-05 06:53:11'),
(41, 6, 66, 'Ft', '164136555961d54037b90cb', '1', '2022-01-05 06:52:39', '2022-01-05 06:53:21', '2022-01-05 06:53:21'),
(42, 6, 66, 'Ft', '164136556161d540399fdfc', '1', '2022-01-05 06:52:41', '2022-01-05 06:53:11', '2022-01-05 06:53:11'),
(43, 6, 66, 'Ft', '164136556161d54039ccc94', '1', '2022-01-05 06:52:41', '2022-01-05 06:53:16', '2022-01-05 06:53:16'),
(44, 6, 66, 'Ft', '164136563261d540809285c', '1', '2022-01-05 06:53:52', '2022-01-05 06:54:08', '2022-01-05 06:54:08'),
(45, 6, 66, 'Ft', '164136563661d54084b45e6', '1', '2022-01-05 06:53:56', '2022-01-05 06:54:10', '2022-01-05 06:54:10'),
(46, 6, 66, 'Ft', '164136563761d5408578c76', '1', '2022-01-05 06:53:57', '2022-01-05 08:17:29', '2022-01-05 08:17:29'),
(47, 6, 66, 'Ft', '164136564061d540884f60c', '1', '2022-01-05 06:54:00', '2022-01-05 06:54:13', '2022-01-05 06:54:13'),
(48, 6, 66, 'Ft', '164136564061d5408875ac9', '1', '2022-01-05 06:54:00', '2022-01-05 06:54:12', '2022-01-05 06:54:12'),
(49, 6, 66, 'Ft', '164136564461d5408c18e5c', '1', '2022-01-05 06:54:04', '2022-01-05 08:17:34', '2022-01-05 08:17:34'),
(50, 6, 66, 'Ft', '164136564461d5408c2f979', '1', '2022-01-05 06:54:04', '2022-01-05 08:17:37', '2022-01-05 08:17:37'),
(51, 2, 15, 'Sadas', '164136586161d54165eac07', '1', '2022-01-05 06:57:41', '2022-01-05 07:39:57', '2022-01-05 07:39:57'),
(52, 2, 15, 'Sadas', '164136586261d54166824c3', '1', '2022-01-05 06:57:42', '2022-01-05 07:39:57', '2022-01-05 07:39:57'),
(53, 2, 15, 'Sadas', '164136586261d54166d00ad', '1', '2022-01-05 06:57:42', '2022-01-05 06:58:01', '2022-01-05 06:58:01'),
(54, 2, 15, 'Sadas', '164136586761d5416b56d3b', '1', '2022-01-05 06:57:47', '2022-01-05 06:58:01', '2022-01-05 06:58:01'),
(55, 2, 15, 'Sadas', '164136586761d5416bd13f5', '1', '2022-01-05 06:57:47', '2022-01-05 07:40:05', '2022-01-05 07:40:05'),
(56, 2, 15, 'Sadas', '164136586861d5416cb25dd', '1', '2022-01-05 06:57:48', '2022-01-05 07:40:01', '2022-01-05 07:40:01'),
(57, 2, 15, 'Sadas', '164136587361d54171951c1', '1', '2022-01-05 06:57:53', '2022-01-05 07:39:59', '2022-01-05 07:39:59'),
(58, 2, 15, 'Sadas', '164136587461d541725f6eb', '1', '2022-01-05 06:57:54', '2022-01-05 07:39:59', '2022-01-05 07:39:59'),
(59, 4, 23, 'xhhx', '164136592561d541a5406de', '1', '2022-01-05 06:58:45', '2022-01-05 06:58:48', '2022-01-05 06:58:48'),
(60, 4, 23, 'xhhx', '164136592561d541a552d99', '1', '2022-01-05 06:58:45', '2022-01-05 06:59:04', '2022-01-05 06:59:04'),
(61, 4, 23, 'xhhx', '164136592561d541a586df4', '1', '2022-01-05 06:58:45', '2022-01-05 06:59:06', '2022-01-05 06:59:06'),
(62, 4, 23, 'xhhx', '164136592561d541a5d2f16', '1', '2022-01-05 06:58:45', '2022-01-05 06:59:10', '2022-01-05 06:59:10'),
(63, 5, 29, 'Fg', '164136648961d543d954faa', '1', '2022-01-05 07:08:09', '2022-01-05 07:08:09', NULL),
(64, 5, 29, 'Fg', '164136649761d543e1e7024', '1', '2022-01-05 07:08:17', '2022-01-05 07:08:17', NULL),
(65, 5, 29, 'Fg', '164136650461d543e84d1b6', '1', '2022-01-05 07:08:24', '2022-01-05 07:08:24', NULL),
(66, 5, 76, 'G', '164136652161d543f99f62b', '1', '2022-01-05 07:08:41', '2022-01-05 07:08:57', '2022-01-05 07:08:57'),
(67, 5, 76, 'G', '164136653061d54402c5e90', '1', '2022-01-05 07:08:50', '2022-01-05 07:08:59', '2022-01-05 07:08:59'),
(68, 5, 76, 'G', '164136653461d54406c0e2e', '1', '2022-01-05 07:08:54', '2022-01-05 07:08:59', '2022-01-05 07:08:59'),
(69, 5, 76, 'G', '164136654461d5441015b1d', '1', '2022-01-05 07:09:04', '2022-01-05 07:09:19', '2022-01-05 07:09:19'),
(70, 5, 76, 'G', '164136654761d5441381647', '1', '2022-01-05 07:09:07', '2022-01-05 07:09:27', '2022-01-05 07:09:27'),
(71, 5, 76, 'G', '164136655161d54417a4f5a', '1', '2022-01-05 07:09:11', '2022-01-05 07:09:22', '2022-01-05 07:09:22'),
(72, 5, 76, 'G', '164136655661d5441c6b420', '1', '2022-01-05 07:09:16', '2022-01-05 07:09:20', '2022-01-05 07:09:20'),
(73, 2, 15, 'Rewrew', '164136876261d54cbacee44', '1', '2022-01-05 07:46:02', '2022-01-05 07:48:24', '2022-01-05 07:48:24'),
(74, 2, 15, 'Rewrew', '164136876361d54cbb22060', '1', '2022-01-05 07:46:03', '2022-01-05 07:49:20', '2022-01-05 07:49:20'),
(75, 2, 15, 'Rewrew', '164136876361d54cbb79c74', '1', '2022-01-05 07:46:03', '2022-01-05 07:53:38', '2022-01-05 07:53:38'),
(76, 2, 15, 'Rewrew', '164136876361d54cbbc6869', '1', '2022-01-05 07:46:03', '2022-01-05 07:54:04', '2022-01-05 07:54:04'),
(77, 2, 15, 'Rewrew', '164136876961d54cc140088', '1', '2022-01-05 07:46:09', '2022-01-05 07:54:05', '2022-01-05 07:54:05'),
(78, 2, 15, 'Rewrew', '164136876961d54cc1e1b33', '1', '2022-01-05 07:46:09', '2022-01-05 07:54:06', '2022-01-05 07:54:06'),
(79, 2, 15, 'Sdasd', '164136927261d54eb89773f', '1', '2022-01-05 07:54:32', '2022-01-05 07:54:55', '2022-01-05 07:54:55'),
(80, 2, 15, 'Sdasd', '164136927261d54eb8cb697', '1', '2022-01-05 07:54:32', '2022-01-05 07:55:04', '2022-01-05 07:55:04'),
(81, 2, 15, 'Sdasd', '164136927361d54eb922233', '1', '2022-01-05 07:54:33', '2022-01-05 08:01:22', '2022-01-05 08:01:22'),
(82, 2, 15, 'Sdasd', '164136927361d54eb97bf38', '1', '2022-01-05 07:54:33', '2022-01-05 08:03:53', '2022-01-05 08:03:53'),
(83, 2, 15, 'Sdasd', '164136928061d54ec0c65db', '1', '2022-01-05 07:54:40', '2022-01-05 08:02:49', '2022-01-05 08:02:49'),
(84, 2, 15, 'Sdasd', '164136928061d54ec0c669b', '1', '2022-01-05 07:54:40', '2022-01-05 08:03:58', '2022-01-05 08:03:58'),
(85, 2, 15, 'Sdasd', '164136928561d54ec53d2ac', '1', '2022-01-05 07:54:45', '2022-01-05 08:02:52', '2022-01-05 08:02:52'),
(86, 2, 15, 'Sdasd', '164136928561d54ec55a854', '1', '2022-01-05 07:54:45', '2022-01-05 08:09:19', '2022-01-05 08:09:19'),
(87, 2, 15, 'Fffff', '164136974661d550920320c', '1', '2022-01-05 08:02:26', '2022-01-05 08:04:02', '2022-01-05 08:04:02'),
(88, 2, 15, 'Fffff', '164136974661d5509231cc6', '1', '2022-01-05 08:02:26', '2022-01-05 08:02:42', '2022-01-05 08:02:42'),
(89, 2, 15, 'Fffff', '164136974661d5509275cfe', '1', '2022-01-05 08:02:26', '2022-01-05 08:02:38', '2022-01-05 08:02:38'),
(90, 2, 14, 'Lop', '164136979061d550beed57d', '1', '2022-01-05 08:03:10', '2022-01-05 08:03:30', '2022-01-05 08:03:30'),
(91, 2, 57, 'Lop', '164136979961d550c70e934', '1', '2022-01-05 08:03:19', '2022-01-05 08:03:34', '2022-01-05 08:03:34'),
(92, 2, 57, 'Lop', '164136980061d550c88ff18', '1', '2022-01-05 08:03:20', '2022-01-05 08:03:40', '2022-01-05 08:03:40'),
(93, 2, 57, 'Lop', '164136980161d550c92d4e5', '1', '2022-01-05 08:03:21', '2022-01-05 08:12:35', '2022-01-05 08:12:35'),
(94, 2, 57, 'Lop', '164137016661d5523664b36', '1', '2022-01-05 08:09:26', '2022-01-05 08:09:26', NULL),
(95, 2, 57, 'Lop', '164137016661d5523688c98', '1', '2022-01-05 08:09:26', '2022-01-05 08:09:26', NULL),
(96, 2, 57, 'Lop', '164137016661d55236ea48b', '1', '2022-01-05 08:09:26', '2022-01-05 08:09:26', NULL),
(97, 2, 14, 'Ssdas', '164137020461d5525cba110', '1', '2022-01-05 08:10:04', '2022-01-05 08:11:53', '2022-01-05 08:11:53'),
(98, 2, 14, 'Ssdas', '164137020561d5525d07aef', '1', '2022-01-05 08:10:05', '2022-01-05 08:10:21', '2022-01-05 08:10:21'),
(99, 2, 14, 'Ssdas', '164137020561d5525d8184a', '1', '2022-01-05 08:10:05', '2022-01-05 08:11:10', '2022-01-05 08:11:10'),
(100, 2, 14, 'Ssdas', '164137021361d55265c0e94', '1', '2022-01-05 08:10:13', '2022-01-05 08:10:29', '2022-01-05 08:10:29'),
(101, 2, 14, 'Ssdas', '164137021361d55265e27de', '1', '2022-01-05 08:10:13', '2022-01-05 08:11:19', '2022-01-05 08:11:19'),
(102, 2, 14, 'Ssdas', '164137021461d552662057b', '1', '2022-01-05 08:10:14', '2022-01-05 08:11:58', '2022-01-05 08:11:58'),
(103, 6, 68, 'Cggg', '164137070661d55452ebede', '1', '2022-01-05 08:18:26', '2022-01-05 08:22:46', '2022-01-05 08:22:46'),
(104, 6, 68, 'Cggg', '164137070761d554532611d', '1', '2022-01-05 08:18:27', '2022-01-05 08:22:51', '2022-01-05 08:22:51'),
(105, 6, 68, 'Cggg', '164137070761d55453396be', '1', '2022-01-05 08:18:27', '2022-01-05 08:36:33', '2022-01-05 08:36:33'),
(106, 6, 66, 'Xdt', '164137098461d555687688c', '1', '2022-01-05 08:23:04', '2022-01-05 08:24:48', '2022-01-05 08:24:48'),
(107, 6, 66, 'Zded', '164137104861d555a8b2c38', '1', '2022-01-05 08:24:08', '2022-01-05 08:24:08', NULL),
(108, 6, 66, 'Zded', '164137105261d555accdcfd', '1', '2022-01-05 08:24:12', '2022-01-05 08:24:41', '2022-01-05 08:24:41'),
(109, 6, 66, 'Zded,d28hx1e8hxe1d7de', '164137105961d555b38fbdc', '1', '2022-01-05 08:24:19', '2022-01-05 08:24:25', '2022-01-05 08:24:25'),
(110, 6, 67, 'Oooo', '164137111261d555e86f83b', '1', '2022-01-05 08:25:12', '2022-01-05 08:25:12', NULL),
(111, 6, 67, 'Oooo', '164137111761d555ed1a167', '1', '2022-01-05 08:25:17', '2022-01-05 08:25:37', '2022-01-05 08:25:37'),
(112, 6, 67, 'Oooo1d9ge97d9du', '164137112461d555f4b31d5', '1', '2022-01-05 08:25:24', '2022-01-05 08:25:24', NULL),
(113, 6, 67, 'Oooo1d9ge97d927ge27gd2ugd238du', '164137112961d555f9d0008', '1', '2022-01-05 08:25:29', '2022-01-05 08:25:41', '2022-01-05 08:25:41'),
(114, 2, 83, 'Dsfds', '164137137861d556f2d2eb5', '1', '2022-01-05 08:29:38', '2022-01-05 08:32:00', '2022-01-05 08:32:00'),
(115, 2, 83, 'Dsfds', '164137137961d556f3bc914', '1', '2022-01-05 08:29:39', '2022-01-05 08:31:39', '2022-01-05 08:31:39'),
(116, 2, 84, 'Dsfds', '164137138861d556fcdca7a', '1', '2022-01-05 08:29:48', '2022-01-05 08:30:27', '2022-01-05 08:30:27'),
(117, 2, 84, 'Dsfds', '164137140061d557084d55e', '1', '2022-01-05 08:30:00', '2022-01-05 08:30:31', '2022-01-05 08:30:31'),
(118, 2, 84, 'Dsfds', '164137140161d5570927ab6', '1', '2022-01-05 08:30:01', '2022-01-05 08:30:37', '2022-01-05 08:30:37'),
(119, 2, 85, 'Ffffff', '164137145261d5573c224e4', '1', '2022-01-05 08:30:52', '2022-01-05 08:30:52', NULL),
(120, 2, 83, 'Ccccc', '164137146961d5574dc8849', '1', '2022-01-05 08:31:09', '2022-01-05 08:32:22', '2022-01-05 08:32:22'),
(121, 2, 83, 'Ccccc', '164137155961d557a718ce6', '1', '2022-01-05 08:32:39', '2022-01-05 08:34:03', '2022-01-05 08:34:03'),
(122, 2, 83, 'Ccccc', '164137156061d557a806de2', '1', '2022-01-05 08:32:40', '2022-01-05 08:32:40', NULL),
(123, 2, 83, 'Hhhh', '164137156761d557af3482b', '1', '2022-01-05 08:32:47', '2022-01-05 08:32:47', NULL),
(124, 2, 83, 'Hhhh', '164137156861d557b01316f', '1', '2022-01-05 08:32:48', '2022-01-05 08:32:48', NULL),
(125, 2, 83, 'Gggggg', '164137157761d557b94258b', '1', '2022-01-05 08:32:57', '2022-01-05 08:32:57', NULL),
(126, 2, 83, 'Qwerrr', '164137161061d557daec8dc', '1', '2022-01-05 08:33:30', '2022-01-05 08:33:39', '2022-01-05 08:33:39'),
(127, 2, 86, 'Qwerrr', '164137162861d557ec0018c', '1', '2022-01-05 08:33:48', '2022-01-05 08:33:56', '2022-01-05 08:33:56'),
(128, 6, 69, 'F32tb3t', '164137181161d558a30ae54', '1', '2022-01-05 08:36:51', '2022-01-05 08:37:50', '2022-01-05 08:37:50'),
(129, 6, 68, 'F32tb3t', '164137181961d558ab95b7a', '1', '2022-01-05 08:36:59', '2022-01-05 08:37:12', '2022-01-05 08:37:12'),
(130, 6, 68, 'F32tb3t', '164137182461d558b0f2766', '1', '2022-01-05 08:37:04', '2022-01-05 08:37:47', '2022-01-05 08:37:47'),
(131, 6, 68, 'F32tb3t', '164137187761d558e5e768e', '1', '2022-01-05 08:37:57', '2022-01-05 08:50:38', '2022-01-05 08:50:38'),
(132, 6, 68, 'F32tb3t', '164137188161d558e96f6a7', '1', '2022-01-05 08:38:01', '2022-01-05 09:55:16', '2022-01-05 09:55:16'),
(133, 6, 68, 'F32tb3t', '164137188461d558ec2095f', '1', '2022-01-05 08:38:04', '2022-01-05 08:38:12', '2022-01-05 08:38:12'),
(134, 6, 68, 'F32tb3t', '164137188761d558ef6804c', '1', '2022-01-05 08:38:07', '2022-01-05 09:55:24', '2022-01-05 09:55:24'),
(135, 4, 24, 'hdhd', '164137241161d55afba046c', '1', '2022-01-05 08:46:51', '2022-01-05 08:46:57', '2022-01-05 08:46:57'),
(136, 4, 24, 'hdhd', '164137241161d55afbb643e', '1', '2022-01-05 08:46:51', '2022-01-05 08:46:57', '2022-01-05 08:46:57'),
(137, 4, 24, 'hdhd', '164137241161d55afbed01d', '1', '2022-01-05 08:46:51', '2022-01-05 08:46:59', '2022-01-05 08:46:59'),
(138, 4, 24, 'hdhd', '164137241261d55afc35170', '1', '2022-01-05 08:46:52', '2022-01-05 08:47:00', '2022-01-05 08:47:00'),
(139, 4, 24, 'hdhd', '164137242961d55b0d99423', '1', '2022-01-05 08:47:09', '2022-01-05 08:47:30', '2022-01-05 08:47:30'),
(140, 4, 24, 'hdhd', '164137242961d55b0ddf3e8', '1', '2022-01-05 08:47:09', '2022-01-05 08:47:30', '2022-01-05 08:47:30'),
(141, 4, 24, 'hdhd', '164137243061d55b0e1c000', '1', '2022-01-05 08:47:10', '2022-01-05 08:47:30', '2022-01-05 08:47:30'),
(142, 4, 24, 'hdhd', '164137243061d55b0e7c162', '1', '2022-01-05 08:47:10', '2022-01-05 08:47:35', '2022-01-05 08:47:35'),
(143, 4, 24, 'hdhd', '164137243361d55b11e46d5', '1', '2022-01-05 08:47:13', '2022-01-05 08:47:32', '2022-01-05 08:47:32'),
(144, 4, 24, 'hdhd', '164137243461d55b1236127', '1', '2022-01-05 08:47:14', '2022-01-05 08:47:33', '2022-01-05 08:47:33'),
(145, 4, 24, 'hdhd', '164137243461d55b127c416', '1', '2022-01-05 08:47:14', '2022-01-05 08:47:38', '2022-01-05 08:47:38'),
(146, 4, 24, 'hdhd', '164137250061d55b5401cc1', '1', '2022-01-05 08:48:20', '2022-01-05 09:03:58', '2022-01-05 09:03:58'),
(147, 4, 24, 'hdhd', '164137250061d55b542e1e5', '1', '2022-01-05 08:48:20', '2022-01-05 09:19:10', '2022-01-05 09:19:10'),
(148, 4, 24, 'hdhd', '164137250061d55b547763c', '1', '2022-01-05 08:48:20', '2022-01-05 11:12:04', '2022-01-05 11:12:04'),
(149, 4, 24, 'hdhd', '164137250061d55b54c9df7', '1', '2022-01-05 08:48:20', '2022-01-05 08:48:20', NULL),
(150, 6, 68, 'Qqq', '164137265361d55bed04906', '1', '2022-01-05 08:50:53', '2022-01-05 08:50:53', NULL),
(151, 6, 69, 'Tdtd', '164137656961d56b3999f6a', '1', '2022-01-05 09:56:09', '2022-01-05 09:56:09', NULL),
(152, 6, 69, 'Tdtd', '164137657661d56b40bc1a0', '1', '2022-01-05 09:56:16', '2022-01-05 09:56:23', '2022-01-05 09:56:23'),
(153, 6, 68, 'Tdtdxtuxur', '164137659561d56b53dc9ca', '1', '2022-01-05 09:56:35', '2022-01-05 09:56:35', NULL),
(154, 6, 89, 'Sjsj', '164137672461d56bd491d3f', '1', '2022-01-05 09:58:44', '2022-01-05 09:59:05', '2022-01-05 09:59:05'),
(155, 6, 89, 'Sjsj', '164137673561d56bdfa7a90', '1', '2022-01-05 09:58:55', '2022-01-05 10:00:03', '2022-01-05 10:00:03'),
(156, 6, 89, 'Sjsj', '164137681761d56c31603c0', '1', '2022-01-05 10:00:17', '2022-01-05 10:03:01', '2022-01-05 10:03:01'),
(157, 6, 88, 'Sjsj', '164137682661d56c3a4023a', '1', '2022-01-05 10:00:26', '2022-01-05 10:00:45', '2022-01-05 10:00:45'),
(158, 6, 88, 'Sjsj', '164137683161d56c3f5db86', '1', '2022-01-05 10:00:31', '2022-01-05 10:16:29', '2022-01-05 10:16:29'),
(159, 6, 90, 'Sjsj', '164137683961d56c479337c', '1', '2022-01-05 10:00:39', '2022-01-05 10:00:52', '2022-01-05 10:00:52'),
(160, 6, 89, 'Sdas', '164137709761d56d491cf47', '1', '2022-01-05 10:04:57', '2022-01-05 10:16:34', '2022-01-05 10:16:34'),
(161, 6, 89, 'Sdas', '164137709861d56d4a2d58a', '1', '2022-01-05 10:04:58', '2022-01-05 10:16:39', '2022-01-05 10:16:39'),
(162, 6, 89, 'Sdas', '164137710361d56d4fc8026', '1', '2022-01-05 10:05:03', '2022-01-05 10:16:01', '2022-01-05 10:16:01'),
(163, 6, 89, 'Sdasdddddddd', '164137710961d56d5577e62', '1', '2022-01-05 10:05:09', '2022-01-05 10:23:18', '2022-01-05 10:23:18'),
(164, 9, 92, 'Dhdh', '164137731661d56e2455af1', '1', '2022-01-05 10:08:36', '2022-01-05 10:08:36', NULL),
(165, 9, 92, 'Dhdh', '164137732261d56e2a5a135', '1', '2022-01-05 10:08:42', '2022-01-05 10:08:48', '2022-01-05 10:08:48'),
(166, 6, 89, 'Sdasdddddddd', '164137798161d570bd96a12', '1', '2022-01-05 10:19:41', '2022-01-05 10:29:56', '2022-01-05 10:29:56'),
(167, 6, 88, 'Xrzr', '164137821061d571a2abd8c', '1', '2022-01-05 10:23:30', '2022-01-05 10:33:21', '2022-01-05 10:33:21'),
(168, 6, 98, 'Ssysyzzz', '164137836461d5723c71e10', '1', '2022-01-05 10:26:04', '2022-01-05 10:27:15', '2022-01-05 10:27:15'),
(169, 6, 98, 'Ssysyzzz', '164137836861d5724064c9a', '1', '2022-01-05 10:26:08', '2022-01-05 10:46:33', '2022-01-05 10:46:33'),
(170, 6, 98, 'Ssysyzzz', '164137836961d57241d3482', '1', '2022-01-05 10:26:09', '2022-01-05 10:27:19', '2022-01-05 10:27:19'),
(171, 6, 98, 'Xxx', '164137837961d5724b64929', '1', '2022-01-05 10:26:19', '2022-01-05 11:18:57', '2022-01-05 11:18:57'),
(172, 6, 98, 'Xxx', '164137838061d5724cc56db', '1', '2022-01-05 10:26:20', '2022-01-05 10:26:20', NULL),
(173, 6, 98, 'Xxx', '164137838561d572513b81f', '1', '2022-01-05 10:26:25', '2022-01-05 10:26:25', NULL),
(174, 6, 98, 'Xxx', '164137838861d57254d0f1d', '1', '2022-01-05 10:26:28', '2022-01-05 10:26:28', NULL),
(175, 6, 98, 'Xxx', '164137839261d57258765ed', '1', '2022-01-05 10:26:32', '2022-01-05 11:19:04', '2022-01-05 11:19:04'),
(176, 6, 98, 'Xxx', '164137839661d5725c6ad31', '1', '2022-01-05 10:26:36', '2022-01-05 10:26:36', NULL),
(177, 6, 98, 'Xxx', '164137839761d5725dd16dc', '1', '2022-01-05 10:26:37', '2022-01-05 10:26:37', NULL),
(178, 6, 98, 'Kkk', '164137840561d57265241e0', '1', '2022-01-05 10:26:45', '2022-01-05 10:26:45', NULL),
(179, 6, 98, 'Kkkdd', '164137840961d5726941c55', '1', '2022-01-05 10:26:49', '2022-01-05 10:46:41', '2022-01-05 10:46:41'),
(180, 6, 98, 'Kkkdd', '164137841061d5726a9d495', '1', '2022-01-05 10:26:50', '2022-01-05 10:26:50', NULL),
(181, 6, 88, 'Govi', '164137852261d572dabdb14', '1', '2022-01-05 10:28:42', '2022-01-05 10:33:24', '2022-01-05 10:33:24'),
(182, 6, 88, 'Goviffd', '164137853361d572e5acbed', '1', '2022-01-05 10:28:53', '2022-01-05 10:28:53', NULL),
(183, 6, 90, 'Fyf6', '164137876461d573cc51941', '1', '2022-01-05 10:32:44', '2022-01-05 10:32:44', NULL),
(184, 6, 88, 'Eusi', '164137902361d574cf888ea', '1', '2022-01-05 10:37:03', '2022-01-05 10:37:03', NULL),
(185, 6, 88, 'Eusi', '164137902761d574d3d3362', '1', '2022-01-05 10:37:07', '2022-01-05 10:52:04', '2022-01-05 10:52:04'),
(186, 6, 88, 'Eusigg', '164137933561d576073a5ef', '1', '2022-01-05 10:42:15', '2022-01-05 10:42:15', NULL),
(187, 4, 23, 'Bdhdh', '164138161761d57ef11a083', '1', '2022-01-05 11:20:17', '2022-01-05 11:23:32', '2022-01-05 11:23:32'),
(188, 4, 23, 'Bdhdh', '164138162461d57ef86da22', '1', '2022-01-05 11:20:24', '2022-01-05 11:20:24', NULL),
(189, 4, 71, 'Chvu', '164138193061d5802abcd1c', '1', '2022-01-05 11:25:30', '2022-01-06 14:18:00', '2022-01-06 14:18:00'),
(190, 4, 107, 'Bzbz', '164147832561d6f8b5689b9', '1', '2022-01-06 14:12:05', '2022-01-06 14:12:05', NULL),
(191, 4, 81, 'Hh', '164147865561d6f9ff270fd', '1', '2022-01-06 14:17:35', '2022-01-06 14:17:35', NULL),
(192, 4, 81, 'Hh', '164147899361d6fb5127da7', '1', '2022-01-06 14:23:13', '2022-01-06 14:23:13', NULL),
(193, 4, 71, 'Hh', '164147900661d6fb5e88ac4', '1', '2022-01-06 14:23:26', '2022-01-06 14:23:26', NULL),
(194, 6, 146, 'Gggg', '164155239761d81a0dedca9', '1', '2022-01-07 10:46:37', '2022-01-07 11:04:16', '2022-01-07 11:04:16'),
(195, 6, 146, 'Gggg', '164155239861d81a0ed9090', '1', '2022-01-07 10:46:38', '2022-01-07 10:46:43', '2022-01-07 10:46:43');

-- --------------------------------------------------------

--
-- Table structure for table `cms_modules`
--

CREATE TABLE `cms_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fa fa-list',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sort_order` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_modules`
--

INSERT INTO `cms_modules` (`id`, `parent_id`, `name`, `route_name`, `icon`, `status`, `sort_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Cms Roles Management', 'cms-roles-management.index', 'fa fa-key', '1', 1.00, '2021-11-23 12:47:44', NULL, NULL),
(2, 0, 'Cms Users Management', 'cms-users-management.index', 'fa fa-users', '1', 2.00, '2021-11-23 12:47:44', NULL, NULL),
(3, 0, 'Application Setting', 'admin.application-setting', 'fa fa-cog', '1', 3.00, '2021-11-23 12:47:44', NULL, NULL),
(4, 0, 'Users Management', 'app-users.index', 'fa fa-users', '1', 4.00, '2021-11-23 12:47:44', NULL, NULL),
(5, 0, 'Content Management', 'content-management.index', 'fa fa-tasks', '1', 5.00, '2021-11-23 12:47:44', NULL, NULL),
(6, 0, 'FAQ`s', 'faq.index', 'fa fa-question-circle-o', '1', 6.00, '2021-11-23 12:47:44', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_module_permissions`
--

CREATE TABLE `cms_module_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cms_role_id` bigint(20) UNSIGNED NOT NULL,
  `cms_module_id` bigint(20) UNSIGNED NOT NULL,
  `is_add` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_view` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_update` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_delete` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_module_permissions`
--

INSERT INTO `cms_module_permissions` (`id`, `cms_role_id`, `cms_module_id`, `is_add`, `is_view`, `is_update`, `is_delete`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, '0', '0', '0', '0', '2022-01-11 06:01:05', NULL, NULL),
(2, 2, 2, '0', '0', '0', '0', '2022-01-11 06:01:05', NULL, NULL),
(3, 2, 3, '0', '0', '0', '0', '2022-01-11 06:01:05', NULL, NULL),
(4, 2, 4, '0', '1', '1', '1', '2022-01-11 06:01:05', NULL, NULL),
(5, 2, 5, '1', '1', '1', '1', '2022-01-11 06:01:05', NULL, NULL),
(6, 2, 6, '0', '0', '0', '0', '2022-01-11 06:01:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_roles`
--

CREATE TABLE `cms_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_super_admin` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_roles`
--

INSERT INTO `cms_roles` (`id`, `name`, `slug`, `is_super_admin`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'super-admin', '1', '2021-11-23 12:47:44', NULL, NULL),
(2, 'ShotShifter', 'shotshifter', '0', '2022-01-11 06:01:05', '2022-01-11 06:01:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cms_role_id` bigint(20) UNSIGNED NOT NULL,
  `user_ref_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `cms_role_id`, `user_ref_id`, `name`, `username`, `slug`, `email`, `mobile_no`, `password`, `image_url`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 'RetroCube', 'retrocube', 'retrocube', 'admin@retrocube.com', '1-8882051816', '$2y$10$.t/gWtdgcplQ3yQTFxz60egYXXcsIspFv3uhiPrVmbfWvQAn6md0y', NULL, '1', NULL, '2021-11-23 12:47:44', NULL, NULL),
(2, 2, 0, 'shotshifter', 'shotshifter', 'shotshifter', 'admin@shotshifter.com', '1-1112223210', '$2y$10$QDSvAPQzgIwi3z4ikrZ85O.lwzUAzHKsPK3yq/bl3JPptweIO5P4G', '/storage/cms_users/lUwGchgMgeCgjLjpsarctX58FWFiyskvDIvoJwk0.png', '1', NULL, '2022-01-11 06:02:29', '2022-01-11 06:02:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_widgets`
--

CREATE TABLE `cms_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `div_column_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_type` enum('small_box','line_chart','bar_chat','pie_chart','map_chart') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_widgets`
--

INSERT INTO `cms_widgets` (`id`, `title`, `description`, `icon`, `color`, `div_column_class`, `link`, `widget_type`, `sql`, `config`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Total User', NULL, 'icon-user', '#4b71fa', 'col-md-3', '#', 'small_box', 'Select count(*) from users where deleted_at is null limit 1', '', '1', NULL, NULL, NULL),
(2, 'Total Shotlist', NULL, 'fa fa-camera-retro', '#7bcb4d', 'col-md-3', '#', 'small_box', 'Select count(*) from shot_list where deleted_at is null limit 1', '', '1', NULL, NULL, NULL),
(3, 'Total Scene', NULL, 'fa fa-video-camera', '#4b71fa', 'col-md-3', '#', 'small_box', 'Select count(*) from scenes where deleted_at is null limit 1', '', '1', NULL, NULL, NULL),
(4, 'Total Break', NULL, 'fa fa-tasks', '#7bcb4d ', 'col-md-3', '#', 'small_box', 'Select count(*) from breaks where deleted_at is null limit 1', '', '1', NULL, NULL, NULL),
(5, 'Users', NULL, 'icon-user', '#fff', 'col-md-12', '/admin/app-users', 'line_chart', 'SELECT count(id) AS value, MONTHNAME(created_at) as label FROM users group by MONTH(created_at) order by MONTH(created_at) asc', '', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_widget_role`
--

CREATE TABLE `cms_widget_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cms_widget_id` bigint(20) UNSIGNED NOT NULL,
  `cms_role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_widget_role`
--

INSERT INTO `cms_widget_role` (`id`, `cms_widget_id`, `cms_role_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, NULL, NULL, NULL),
(2, 2, 2, NULL, NULL, NULL),
(3, 3, 2, NULL, NULL, NULL),
(4, 4, 2, NULL, NULL, NULL),
(5, 5, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `content_management`
--

CREATE TABLE `content_management` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_management`
--

INSERT INTO `content_management` (`id`, `title`, `slug`, `content`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Terms Condition', 'terms-condition', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-11 15:01:25', NULL, NULL),
(2, 'Privacy Policy', 'privacy-policy', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-11 15:01:25', NULL, NULL),
(3, 'About Us', 'about-us', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-11 15:01:25', NULL, NULL),
(4, 'About Us', 'help', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-11 15:01:25', '2022-01-11 06:06:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `slug`, `question`, `answer`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '619ce2f10c150619ce2f10c152', 'How to change the language', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-17 15:45:47', NULL, NULL),
(2, '619ce2f10c154619ce2f10c155', 'How to restore your chat history', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-17 15:51:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wildcard` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `identifier`, `subject`, `body`, `wildcard`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'forgot-password', 'Forgot Password Confirmation', '<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\r\n    <tr>\r\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\r\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n                <tr>\r\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :</p>\r\n                        <p><a href=\"[LINK]\">Reset Password</a></p>\r\n                        <br>\r\n                        <br>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n', '[USERNAME],[LINK],[YEAR],[APP_NAME]', '2021-11-23 12:47:44', NULL, NULL),
(2, 'user_registration', 'Welcome to [APP_NAME]', '<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\r\n    <tr>\r\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\r\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n                <tr>\r\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Your account has been created successfully. First, you need to confirm your account. Just click the below link</p>\r\n                        <p><a href=\"[LINK]\">Verify Now</a></p>\r\n                        <br>\r\n                        <br>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n', '[USERNAME],[LINK],[YEAR],[APP_NAME]', '2021-11-23 12:47:44', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` int(11) NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail_url` text COLLATE utf8mb4_unicode_ci,
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `media_type` enum('public','private') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `meta` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2021_03_05_000000_create_cms_roles_table', 1),
(3, '2021_03_05_172240_create_cms_users_table', 1),
(4, '2021_03_05_174918_create_cms_modules_table', 1),
(5, '2021_03_05_175415_create_cms_module_permissions_table', 1),
(6, '2021_03_06_185651_create_mail_templates_table', 1),
(7, '2021_03_08_191839_create_reset_password_table', 1),
(8, '2021_03_13_121206_create_application_setting_table', 1),
(9, '2021_04_20_200223_create_user_groups_table', 1),
(10, '2021_04_20_200451_create_users_table', 1),
(11, '2021_04_20_202053_create_user_api_token_table', 1),
(12, '2021_06_04_181436_create_notification_table', 1),
(13, '2021_06_06_130550_create_notification_setting_table', 1),
(14, '2021_08_29_105840_create_jobs_table', 1),
(15, '2021_09_07_154417_create_cms_widgets_table', 1),
(16, '2021_09_07_161059_create_cms_widget_role_table', 1),
(17, '2021_09_08_081135_create_content_management_table', 1),
(18, '2021_09_08_082346_create_faqs_table', 1),
(19, '2021_09_20_180624_create_media_table', 1),
(20, '2021_10_05_172625_user_follow', 1),
(21, '2021_10_12_155219_post', 1),
(22, '2021_10_12_161817_post_tagged_user', 1),
(23, '2021_10_12_162512_post_media', 1),
(24, '2021_10_12_163704_post_like', 1),
(25, '2021_10_12_164023_reactions', 1),
(26, '2021_10_12_164452_post_comments', 1),
(27, '2021_10_12_164953_post_share', 1),
(28, '2021_10_12_165719_post_report', 1),
(29, '2021_10_13_165453_feeling_activity', 1),
(30, '2021_11_24_081654_create_shot_list_table', 2),
(31, '2021_11_24_081858_create_scenes_table', 2),
(32, '2021_11_24_081933_create_breaks_table', 2),
(33, '2021_11_24_081958_create_user_share_table', 2),
(34, '2021_11_24_082347_create_user_member_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actor_id` int(11) NOT NULL,
  `actor_type` enum('users','cms_users') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users',
  `target_id` int(11) NOT NULL,
  `target_type` enum('users','cms_users') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users',
  `reference_id` int(11) NOT NULL,
  `reference_module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_redirect_link` text COLLATE utf8mb4_unicode_ci,
  `is_read` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_view` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scenes`
--

CREATE TABLE `scenes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shot_list_id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `angle` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lens` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_external` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sun_time` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8mb4_unicode_ci,
  `location_pin` text COLLATE utf8mb4_unicode_ci,
  `cast` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wardrobe` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `props` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speed` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sound` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timepicker` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grip` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lines_dialogue_english` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lines_dialogue_foreign` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `camera` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_complete` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT NULL,
  `scene_no` int(11) NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scenes`
--

INSERT INTO `scenes` (`id`, `shot_list_id`, `size`, `title`, `slug`, `image_url`, `description`, `angle`, `lens`, `internal_external`, `sun_time`, `location`, `location_pin`, `cast`, `wardrobe`, `props`, `action`, `speed`, `sound`, `timepicker`, `grip`, `lines_dialogue_english`, `lines_dialogue_foreign`, `camera`, `is_complete`, `sort_order`, `scene_no`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 'Add Title', '164120509161d2cd638a4e1', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 0, '1', '2022-01-03 10:18:11', '2022-01-03 10:18:38', NULL),
(2, 1, NULL, 'Add Title', '164120509361d2cd65ec27b', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-03 10:18:13', '2022-01-03 10:18:47', NULL),
(3, 1, NULL, 'Add Title', '164120509661d2cd6811f3c', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 3, 0, '1', '2022-01-03 10:18:16', '2022-01-03 10:18:16', NULL),
(4, 1, NULL, 'Add Title', '164120509761d2cd69d0d6f', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 4, 0, '1', '2022-01-03 10:18:17', '2022-01-03 10:18:51', NULL),
(5, 1, NULL, 'Add Title', '164120509961d2cd6b60ff1', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, 0, '1', '2022-01-03 10:18:19', '2022-01-03 10:18:19', NULL),
(6, 2, NULL, 'Add Title', '164120515261d2cda043e08', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 0, '1', '2022-01-03 10:19:12', '2022-01-03 10:19:32', NULL),
(7, 2, NULL, 'Add Title', '164120515661d2cda48268d', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, 0, '1', '2022-01-03 10:19:16', '2022-01-03 10:19:16', NULL),
(8, 2, NULL, 'Add Title', '164120515861d2cda6b9937', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 3, 0, '1', '2022-01-03 10:19:18', '2022-01-03 10:19:18', NULL),
(9, 2, NULL, 'Add Title', '164120516061d2cda8790ba', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 4, 0, '1', '2022-01-03 10:19:20', '2022-01-03 10:19:38', NULL),
(10, 2, NULL, 'Add Title', '164120516261d2cdaa02eb7', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, 0, '1', '2022-01-03 10:19:22', '2022-01-03 10:19:22', NULL),
(11, 3, NULL, 'Add Title', '164120520461d2cdd4772f8', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 0, '1', '2022-01-03 10:20:04', '2022-01-03 10:20:25', NULL),
(12, 3, NULL, 'Add Title', '164120520761d2cdd72d022', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-03 10:20:07', '2022-01-03 10:20:21', NULL),
(13, 3, NULL, 'Add Title', '164120520861d2cdd8cf2b9', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 3, 0, '1', '2022-01-03 10:20:08', '2022-01-03 10:20:16', NULL),
(14, 4, NULL, 'Add Title', '164120534061d2ce5c7b5e3', 'scene/Jy5PVe6dmrdvcbxPO5B88r6rET4Zcn7IBMOd3fsi.jpg', 'Dds', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 0, '1', '2022-01-03 10:22:20', '2022-01-03 10:25:57', NULL),
(15, 4, NULL, 'Add Title', '164120534461d2ce60907fa', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-03 10:22:24', '2022-01-03 10:22:38', NULL),
(16, 4, NULL, 'Add Title', '164120534661d2ce62ad13b', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 3, 0, '1', '2022-01-03 10:22:26', '2022-01-03 10:22:42', NULL),
(17, 4, NULL, 'Add Title', '164120534961d2ce656bcd2', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 4, 0, '1', '2022-01-03 10:22:29', '2022-01-03 10:22:47', NULL),
(18, 5, NULL, 'Add Title', '164120630461d2d2208abad', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, '1', '2022-01-03 10:38:24', '2022-01-03 10:38:24', NULL),
(19, 5, NULL, 'Add Title', '164120630661d2d2220e3a1', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-03 10:38:26', '2022-01-03 10:38:35', NULL),
(20, 5, NULL, 'Add Title', '164120630861d2d22439791', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 3, 0, '1', '2022-01-03 10:38:28', '2022-01-03 10:38:39', NULL),
(21, 5, NULL, 'Add Title', '164120631061d2d22613ddd', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 4, 0, '1', '2022-01-03 10:38:30', '2022-01-03 10:38:30', NULL),
(22, 6, 'Extreme Closeup', '1', '164123402561d33e690c4b7', 'scene/1E237bBjmbxCKC2FJYOk86dZdtXHs9GyhSL2wrqr.jpg', 'Add Descriptiongghbfgbdbxbx', 'Neutral', 'Lens1', 'Internal', 'Noon', 'Amsterdam, Netherlands', NULL, '1', '1', '1', '1', 'Normal Speed', 'Sync Sound', '11:35 PM', 'Gimbal', '1', '1', 'A', '1', 2, 0, '1', '2022-01-03 18:20:25', '2022-01-05 11:13:15', '2022-01-05 11:13:15'),
(23, 6, NULL, 'Add Title', '164123402761d33e6b6d821', 'scene/nl5IgxJtMlcoblg57bXgrZWYgV4BQ2WSZDKoYlDE.jpg', 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, 0, '1', '2022-01-03 18:20:27', '2022-01-06 14:25:22', NULL),
(24, 6, NULL, 'Add Title', '164123402861d33e6cdf994', NULL, '1vhhhhfdvgh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, 0, '1', '2022-01-03 18:20:28', '2022-01-05 11:13:06', '2022-01-05 11:13:06'),
(25, 6, NULL, 'Add Title', '164123403061d33e6e88c40', 'scene/hQmK0WzfPdQzcwLBAmwLyo0ezkNpLdOMQDbhiRfJ.jpg', '1yhgdrh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-03 18:20:30', '2022-01-05 15:29:06', NULL),
(26, 6, NULL, 'Add Title', '164123403261d33e703d652', 'scene/7IIpCf9h2cbq7Z8GWsj5QTdICuamobq1SE6m8q4q.jpg', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', -8, 0, '1', '2022-01-03 18:20:32', '2022-01-05 11:14:05', NULL),
(27, 7, NULL, 'Add Title', '164123881061d3511a354ab', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 3, 0, '1', '2022-01-03 19:40:10', '2022-01-03 19:40:10', NULL),
(28, 7, NULL, 'Add Title', '164123882161d3512554dc8', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, '1', '2022-01-03 19:40:21', '2022-01-03 19:42:47', '2022-01-03 19:42:47'),
(29, 7, NULL, 'Add Title', '164123883461d35132a61b0', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, '1', '2022-01-03 19:40:34', '2022-01-05 06:51:52', '2022-01-05 06:51:52'),
(30, 8, NULL, 'Add Title', '164126850661d3c51a48096', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-04 03:55:06', '2022-01-04 06:12:11', NULL),
(31, 8, NULL, 'Add Title', '164126850961d3c51d21422', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 6, 0, '1', '2022-01-04 03:55:09', '2022-01-04 06:52:50', NULL),
(32, 8, NULL, 'Add Title', '164126851261d3c5201d16c', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 4, 0, '1', '2022-01-04 03:55:12', '2022-01-04 05:17:12', NULL),
(33, 8, NULL, 'Add Title', '164126851461d3c5226aa25', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 7, 0, '1', '2022-01-04 03:55:14', '2022-01-04 05:58:17', NULL),
(34, 8, NULL, 'Add Title', '164126851761d3c525ba26e', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 7, 0, '1', '2022-01-04 03:55:17', '2022-01-04 07:08:35', NULL),
(35, 9, NULL, 'Add Title', '164126904061d3c730c13e8', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 0, '1', '2022-01-04 04:04:00', '2022-01-04 04:05:39', NULL),
(36, 9, NULL, 'Add Title', '164126910861d3c77470df4', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 3, 0, '1', '2022-01-04 04:05:08', '2022-01-05 06:41:23', NULL),
(37, 9, 'null', 'Add Title', '164126910961d3c775f206e', 'scene/Wpt8WQtrzHdFHYGs7644pTMIjtwk1TjXRmfcfSOt.jpg', '123', 'null', 'null', 'null', 'null', 'null', NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', NULL, NULL, 'null', '0', 2, 0, '1', '2022-01-04 04:05:09', '2022-01-05 06:44:13', NULL),
(38, 8, NULL, 'Add Title', '164128012561d3f27d706d4', NULL, 'Xxxd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 3, 0, '1', '2022-01-04 07:08:45', '2022-01-04 07:11:43', NULL),
(39, 8, NULL, 'Add Title', '164128012761d3f27f0fb91', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 5, 0, '1', '2022-01-04 07:08:47', '2022-01-04 10:09:15', NULL),
(40, 8, NULL, 'Add Title', '164128012861d3f280a7518', NULL, 'Add DescriptionfuZg17g1e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 0, '1', '2022-01-04 07:08:48', '2022-01-04 07:18:56', NULL),
(41, 10, NULL, 'Add Title', '164128047961d3f3dfecdc1', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 3, 0, '1', '2022-01-04 07:14:39', '2022-01-04 07:14:39', NULL),
(42, 10, 'null', 'Add Title', '164128048261d3f3e28753e', 'scene/08LHTKfnASHPIKKBTifNyKkvfOVZ5SyQa9Udy9LM.jpg', 'Add Descriptionskskskek', 'null', 'null', 'null', 'null', 'null', NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', 'Cgcu', 'Viv', 'null', '0', 1, 0, '1', '2022-01-04 07:14:42', '2022-01-05 10:35:06', NULL),
(43, 10, NULL, 'Add Title', '164128048461d3f3e406a72', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 3, 0, '1', '2022-01-04 07:14:44', '2022-01-04 07:15:05', NULL),
(44, 10, NULL, 'Add Title', '164128048561d3f3e5351a5', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 3, 0, '1', '2022-01-04 07:14:45', '2022-01-04 07:14:45', NULL),
(45, 10, NULL, 'Add Title', '164128048561d3f3e5b7477', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 7, 0, '1', '2022-01-04 07:14:45', '2022-01-04 07:14:45', NULL),
(46, 10, NULL, 'Add Title', '164128048661d3f3e6682b2', NULL, 'Klkk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 8, 0, '1', '2022-01-04 07:14:46', '2022-01-04 07:15:22', NULL),
(47, 10, NULL, 'Add Title', '164128048761d3f3e702694', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 5, 0, '1', '2022-01-04 07:14:47', '2022-01-04 07:25:25', NULL),
(48, 10, NULL, 'Add Title', '164128048761d3f3e77d52e', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 6, 0, '1', '2022-01-04 07:14:47', '2022-01-04 07:14:47', NULL),
(49, 11, NULL, 'Add Title', '164128126861d3f6f44fa0b', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 7, 0, '1', '2022-01-04 07:27:48', '2022-01-04 07:40:39', NULL),
(50, 11, NULL, 'Add Title', '164128127161d3f6f721480', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 0, '1', '2022-01-04 07:27:51', '2022-01-04 08:07:40', NULL),
(51, 11, NULL, 'Add Title', '164128127161d3f6f7aaf0f', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 3, 0, '1', '2022-01-04 07:27:51', '2022-01-04 07:40:00', NULL),
(52, 11, NULL, 'Add Title', '164128127361d3f6f96e099', NULL, 'Yt7t7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-04 07:27:53', '2022-01-04 07:32:40', NULL),
(53, 11, NULL, 'Add Title', '164128127661d3f6fc451a4', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 3, 0, '1', '2022-01-04 07:27:56', '2022-01-04 08:08:42', NULL),
(54, 11, NULL, 'Add Title', '164128127961d3f6ff618ed', NULL, 'Add Descriptioniydi5a74', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 4, 0, '1', '2022-01-04 07:27:59', '2022-01-04 08:09:56', NULL),
(55, 11, NULL, 'Add Title', '164128128061d3f7000f802', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 7, 0, '1', '2022-01-04 07:28:00', '2022-01-04 07:31:20', NULL),
(56, 4, NULL, 'Add Title', '164128397061d4018243c22', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 5, 0, '1', '2022-01-04 08:12:50', '2022-01-04 08:13:11', NULL),
(57, 4, NULL, 'Add Title', '164128397261d401846c1c4', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 6, 0, '1', '2022-01-04 08:12:52', '2022-01-05 08:28:41', NULL),
(58, 4, NULL, 'Add Title', '164128397461d4018677b9a', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 7, 0, '1', '2022-01-04 08:12:54', '2022-01-05 04:16:46', NULL),
(59, 12, NULL, 'Add Title', '164128434661d402fa9970c', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, '1', '2022-01-04 08:19:06', '2022-01-04 08:19:06', NULL),
(60, 12, NULL, 'Add Title', '164128434861d402fcc1aff', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 4, 0, '1', '2022-01-04 08:19:08', '2022-01-04 08:19:08', NULL),
(61, 12, NULL, 'Add Title', '164128435061d402feae0c9', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 0, '1', '2022-01-04 08:19:10', '2022-01-04 08:21:19', NULL),
(62, 12, NULL, 'Add Title', '164128435261d4030062ed4', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, 0, '1', '2022-01-04 08:19:12', '2022-01-04 08:19:12', NULL),
(63, 12, NULL, 'Add Title', '164128435461d4030205500', NULL, 'Okaysnsus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-04 08:19:14', '2022-01-04 08:21:05', NULL),
(64, 12, NULL, 'Add Title', '164128435561d40303d8ff9', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 6, 0, '1', '2022-01-04 08:19:15', '2022-01-04 08:20:16', NULL),
(65, 8, NULL, 'Add Title', '164129710761d434d34ab78', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 8, 0, '1', '2022-01-04 11:51:47', '2022-01-04 11:52:10', NULL),
(66, 13, NULL, 'Add Title', '164135680961d51e097f922', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-05 04:26:49', '2022-01-05 08:35:36', '2022-01-05 08:35:36'),
(67, 13, 'null', 'Add Title', '164135681161d51e0b9a6f0', 'scene/7dP6bZVmbQ3pl2w2hjA9M1zomWICiFxH446pTHcS.jpg', 'Add Description', 'null', 'null', 'null', 'null', 'null', NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', NULL, NULL, 'null', '0', 1, 0, '1', '2022-01-05 04:26:51', '2022-01-05 08:35:24', '2022-01-05 08:35:24'),
(68, 13, NULL, 'Add Title', '164135681361d51e0d911da', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 0, '1', '2022-01-05 04:26:53', '2022-01-05 08:24:33', NULL),
(69, 13, NULL, 'Add Title', '164135681561d51e0f26550', 'scene/Tvtpk6E5Q4vI4TMSdS4QeAzpqOEL6nYZAPe8tdUu.jpg', 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 4, 0, '1', '2022-01-05 04:26:55', '2022-01-05 09:55:52', NULL),
(70, 13, NULL, 'Add Title', '164135681661d51e10e9e2d', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 5, 0, '1', '2022-01-05 04:26:56', '2022-01-05 04:27:11', NULL),
(71, 14, NULL, 'Add Title', '164136416461d53ac4512da', NULL, '5353bzbzbzbzbzzh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 4, 0, '1', '2022-01-05 06:29:24', '2022-01-05 09:21:08', NULL),
(72, 6, NULL, 'Add Title', '164136427061d53b2e50b1c', 'scene/mBPJTD5En7i4yXl180yWjvdKFdaG2MJ5MJUcNCnh.jpg', 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', -1, 0, '1', '2022-01-05 06:31:10', '2022-01-06 14:25:04', NULL),
(73, 6, NULL, 'Add Title', '164136427261d53b300a1bd', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 6, 0, '1', '2022-01-05 06:31:12', '2022-01-05 09:18:27', NULL),
(74, 9, NULL, 'Add Title', '164136520461d53ed496332', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 4, 0, '1', '2022-01-05 06:46:44', '2022-01-05 06:46:44', NULL),
(75, 7, NULL, 'Add Title', '164136616561d54295695b0', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 4, 0, '1', '2022-01-05 07:02:45', '2022-01-05 07:02:45', NULL),
(76, 7, NULL, 'Add Title', '164136616761d542973bb3f', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, 0, '1', '2022-01-05 07:02:47', '2022-01-05 07:02:47', NULL),
(77, 7, NULL, 'Add Title', '164136616861d54298ceceb', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 6, 0, '1', '2022-01-05 07:02:48', '2022-01-05 07:02:48', NULL),
(78, 7, NULL, 'Add Title', '164136617061d5429a72d3a', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 7, 0, '1', '2022-01-05 07:02:50', '2022-01-05 07:02:50', NULL),
(79, 14, NULL, 'Add Title', '164136630961d54325495d2', NULL, 'Add Descriptionuxbbxbxbx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', -3, 0, '1', '2022-01-05 07:05:09', '2022-01-05 09:19:34', NULL),
(80, 14, NULL, 'Add Title', '164136631061d54326e8a28', NULL, 'w', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, '1', '2022-01-05 07:05:10', '2022-01-05 09:19:24', NULL),
(81, 14, NULL, 'Add Title', '164136631261d543283bc2b', NULL, 'dbbdhdbxbzbzbzbbzbzb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, '1', '2022-01-05 07:05:12', '2022-01-06 14:24:05', '2022-01-06 14:24:05'),
(82, 15, NULL, 'Add Title', '164137135961d556df4fad3', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 0, '1', '2022-01-05 08:29:19', '2022-01-05 08:31:17', NULL),
(83, 15, NULL, 'Add Title', '164137136261d556e203224', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-05 08:29:22', '2022-01-05 08:31:23', NULL),
(84, 15, NULL, 'Add Title', '164137136461d556e44bbb1', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 3, 0, '1', '2022-01-05 08:29:24', '2022-01-05 08:31:27', NULL),
(85, 15, NULL, 'Add Title', '164137136661d556e6af2b7', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 4, 0, '1', '2022-01-05 08:29:26', '2022-01-05 08:31:32', NULL),
(86, 15, NULL, 'Add Title', '164137154761d5579bce045', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, 0, '1', '2022-01-05 08:32:27', '2022-01-05 08:32:27', NULL),
(87, 13, NULL, 'Add Title', '164137179861d558968c24d', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 6, 0, '1', '2022-01-05 08:36:38', '2022-01-05 09:55:10', NULL),
(88, 16, NULL, 'Add Title', '164137665561d56b8f174ec', 'scene/FwqFMU1oYEUskJEre3Itd6tDRk9MUmER6thbquLy.jpg', 'Add Descriptiondstv2ux2guxge2xuexx 3c3FCB3irbcir3c 3c3r cir2j2gf 3rfj 2rifbrfrf RJ RIF rjf u d fhr8hrhrc\nTvt3v3t3t', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 0, '1', '2022-01-05 09:57:35', '2022-01-06 05:46:54', NULL),
(89, 16, NULL, 'Add Title', '164137665761d56b915eb7a', 'scene/27AKVsmlP1kI0kciM2reTltOwxdQ7klnn93TL6lM.jpg', 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 3, 0, '1', '2022-01-05 09:57:37', '2022-01-05 10:30:11', '2022-01-05 10:30:11'),
(90, 16, 'Extreme Closeup', 'Add Title', '164137667661d56ba449bcc', 'scene/F0BbggcTnGSVAZ8Kq6izIWrqL5eq1LrqBjES4Ytf.jpg', 'Add Description', 'null', 'null', 'null', 'null', 'null', NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', NULL, NULL, 'null', '1', 0, 0, '1', '2022-01-05 09:57:56', '2022-01-05 10:35:52', '2022-01-05 10:35:52'),
(91, 17, NULL, 'Add Title', '164137728361d56e03c3b2e', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, '1', '2022-01-05 10:08:03', '2022-01-05 10:08:03', NULL),
(92, 17, NULL, 'Add Title', '164137728761d56e072567a', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-05 10:08:07', '2022-01-05 10:08:25', NULL),
(93, 17, NULL, 'Add Title', '164137728961d56e09ee77e', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 3, 0, '1', '2022-01-05 10:08:09', '2022-01-05 10:08:09', NULL),
(94, 17, NULL, 'Add Title', '164137729361d56e0d1b47b', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 4, 0, '1', '2022-01-05 10:08:13', '2022-01-05 10:08:13', NULL),
(95, 16, NULL, 'Add Title', '164137798761d570c3be64e', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 4, 0, '1', '2022-01-05 10:19:47', '2022-01-05 10:20:07', NULL),
(96, 16, NULL, 'Add Title', '164137799061d570c65d71d', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 5, 0, '1', '2022-01-05 10:19:50', '2022-01-05 10:28:27', NULL),
(97, 18, NULL, 'Add Title', '164137830661d5720270f93', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 0, '1', '2022-01-05 10:25:06', '2022-01-05 10:27:35', NULL),
(98, 18, NULL, 'Add Title', '164137830761d57203e9d65', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, 0, '1', '2022-01-05 10:25:07', '2022-01-05 10:25:54', NULL),
(99, 18, NULL, 'Add Title', '164137830961d572058b4c6', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 3, 0, '1', '2022-01-05 10:25:09', '2022-01-05 10:27:49', NULL),
(100, 18, NULL, 'Add Title', '164137831161d572070e0c6', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 4, 0, '1', '2022-01-05 10:25:11', '2022-01-05 10:25:42', NULL),
(101, 18, NULL, 'Add Title', '164137831261d57208cf3bb', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 5, 0, '1', '2022-01-05 10:25:12', '2022-01-05 10:25:47', NULL),
(102, 18, NULL, 'Add Title', '164137831461d5720ace7f2', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 6, 0, '1', '2022-01-05 10:25:14', '2022-01-05 10:46:54', NULL),
(103, 16, NULL, 'Add Title', '164137856161d57301871ef', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 6, 0, '1', '2022-01-05 10:29:21', '2022-01-05 10:32:50', NULL),
(104, 16, NULL, 'Add Title', '164137875061d573be61059', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 7, 0, '1', '2022-01-05 10:32:30', '2022-01-05 10:32:53', NULL),
(105, 19, NULL, 'Add Title', '164138196561d5804db61e6', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, 0, '1', '2022-01-05 11:26:05', '2022-01-05 11:26:05', NULL),
(106, 19, NULL, 'Add Title', '164138196761d5804f55cd0', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 5, 0, '1', '2022-01-05 11:26:07', '2022-01-05 11:26:26', NULL),
(107, 19, NULL, 'Add Title', '164138196861d58050beea8', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 7, 0, '1', '2022-01-05 11:26:08', '2022-01-06 14:14:17', NULL),
(108, 19, NULL, 'Add Title', '164138196961d58051f280c', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, '1', '2022-01-05 11:26:09', '2022-01-05 11:26:09', NULL),
(109, 19, NULL, 'Add Title', '164138197161d580537bf13', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, '1', '2022-01-05 11:26:11', '2022-01-05 11:26:11', NULL),
(110, 19, NULL, 'Add Title', '164138197361d580554d69d', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, '1', '2022-01-05 11:26:13', '2022-01-05 11:26:13', NULL),
(111, 20, NULL, 'Add Title', '164145154761d6901b8d60e', NULL, 'Add Descriptiondjsjje', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 3, 0, '1', '2022-01-06 06:45:47', '2022-01-06 06:45:55', NULL),
(112, 20, NULL, 'Add Title', '164145154961d6901d4b0a4', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, 0, '1', '2022-01-06 06:45:49', '2022-01-06 06:45:49', NULL),
(113, 20, NULL, 'Add Title', '164145155061d6901ecfee6', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', -1, 0, '1', '2022-01-06 06:45:50', '2022-01-06 06:45:50', NULL),
(114, 20, NULL, 'Add Title', '164145155261d6902067ec6', NULL, 'firstttdh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 4, 0, '1', '2022-01-06 06:45:52', '2022-01-06 07:00:38', NULL),
(115, 20, NULL, 'Add Title', '164145463061d69c26df156', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, 0, '1', '2022-01-06 07:37:10', '2022-01-06 07:37:10', NULL),
(116, 21, NULL, 'Add Title', '164149001161d7265be95e9', 'scene/8QDan7Ih4Ca2WQJThpIsO0dxlPBvmT1P3LZ4qbmi.jpg', 'Close up of woman at the Creek', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, '1', '2022-01-06 17:26:51', '2022-01-06 17:29:40', NULL),
(117, 21, NULL, 'Add Title', '164149024361d727439b918', 'scene/fiJGWObj4TtJUiMFuM9hNpI2Syair2KOrK4bn3Mw.jpg', 'Wide of woman at creek', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, 2, '1', '2022-01-06 17:30:43', '2022-01-06 17:31:39', NULL),
(118, 21, NULL, 'Add Title', '164149030861d72784d67e7', 'scene/CScaYPXYhctbnLuqUat30czLiVIPj7eQCwxBCf0m.jpg', 'Omar walks towards camera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 3, 3, '1', '2022-01-06 17:31:48', '2022-01-06 17:32:53', NULL),
(119, 21, NULL, 'Add Title', '164149069861d7290a743b3', 'scene/XvqmmyCUraBH7bO4uN8crEpNdFBUMxtIzDcEeqhD.jpg', 'Emirati man writes note on food box.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 7, 4, '1', '2022-01-06 17:38:18', '2022-01-06 17:40:20', NULL),
(120, 21, NULL, 'Add Title', '164149082461d72988327da', 'scene/gqXBancj92fqRWL73QWDpFWHHaLoHEBnJTFl5BX8.jpg', 'We see the face of the Emirati man writing the note', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 8, 5, '1', '2022-01-06 17:40:24', '2022-01-06 17:41:25', NULL),
(121, 21, NULL, 'Add Title', '164149089561d729cf94f88', 'scene/NfAHlMW6ciQ0I0RAfoPD49pxw08GsLf0yfuu1R0z.jpg', 'We see a young Emirati man walking away from camera as the camera follows him down where we can seean ambulance in the background so the audiences know it is a hospital.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 9, 6, '1', '2022-01-06 17:41:35', '2022-01-06 17:43:25', NULL),
(122, 21, NULL, 'Add Title', '164149102761d72a53db361', 'scene/PIdsDVoYtVlunVKDIRRaqrzo6V2KkPQBJw6BLV4Y.jpg', 'We cut to closeup shot of young man now walking in a hospital.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 10, 7, '1', '2022-01-06 17:43:47', '2022-01-06 17:44:46', NULL),
(123, 21, NULL, 'Add Title', '164149109161d72a9320221', 'scene/vgUxYz3H4YvD7m6KouTXix5yObBGt3R9zmazy1B7.jpg', 'We see the young mans face to realize he is a POD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 11, 8, '1', '2022-01-06 17:44:51', '2022-01-06 17:45:47', NULL),
(124, 21, NULL, 'Add Title', '164149115061d72acee0625', 'scene/gzNCuynzNGIWTxyGHAeND2cXpfXGVKzxdD5m5oTt.jpg', 'Cut to a park location where we meet Aysha', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 12, 9, '1', '2022-01-06 17:45:50', '2022-01-06 17:46:47', NULL),
(125, 21, NULL, 'Add Title', '164149122161d72b159dbea', 'scene/hPdkZnpaj3Cybnn6DnNvSO54QSLa7yQSgHG6EXAU.jpg', 'Aysha walks up to older woman ans greets her.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 13, 10, '1', '2022-01-06 17:47:01', '2022-01-06 17:48:08', NULL),
(126, 21, NULL, 'Add Title', '164149131261d72b7092940', 'scene/C3dGrLu87o0jar6pgCAcXSSKk5CBDGaZDI3bC8FK.jpg', 'Aysha and samira walk together', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 14, 11, '1', '2022-01-06 17:48:32', '2022-01-06 17:49:23', NULL),
(127, 21, NULL, 'Add Title', '164149131661d72b747e808', 'scene/yDqlTCmXORYXwRRo6xEKYgcmhYPaAT9XymW9XFSd.jpg', 'Doner is working late', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 16, 12, '1', '2022-01-06 17:48:36', '2022-01-06 17:54:35', NULL),
(128, 21, NULL, 'Add Title', '164149143061d72be6adaef', 'scene/dmzpLS9uDKhW18n1Qy8MtbNWHyAmLKoDWbyNX2dg.jpg', 'Doner makes payment on computer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 17, 13, '1', '2022-01-06 17:50:30', '2022-01-06 17:55:10', NULL),
(129, 21, NULL, 'Add Title', '164149147761d72c1502dc5', 'scene/z4hu7wLzcy7nkwcvb8sT9L2Oi2ctf01HlHGqzNbe.jpg', 'Previous Emirati man is now carrying box down stairs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 18, 14, '1', '2022-01-06 17:51:17', '2022-01-06 17:56:02', NULL),
(130, 21, NULL, 'Add Title', '164149148461d72c1cf3a93', 'scene/vg6GJ2DEIoIGDWZTogDUYUpnhrWfAogDa4eCy0XB.jpg', 'Emirati man givea box to Philippino woman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 19, 15, '1', '2022-01-06 17:51:24', '2022-01-06 17:56:49', NULL),
(131, 21, NULL, 'Add Title', '164149157761d72c794f405', 'scene/21WqNglgHxiYf7KjrNx9azFXYAbm98bT3z5YqioR.jpg', 'Phillipino couple enjoy the food', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 19, 16, '1', '2022-01-06 17:52:57', '2022-01-06 17:57:16', NULL),
(132, 21, NULL, 'Add Title', '164149160561d72c958fc88', 'scene/89jysA7Tl4eEUnZcDh3l5iznRAcFtot8zyWRiZzE.jpg', 'The couple hug', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 20, 17, '1', '2022-01-06 17:53:25', '2022-01-06 17:57:39', NULL),
(133, 21, NULL, 'Add Title', '164149187861d72da64aa5f', 'scene/mt9TGUH1iCFI8c9WqW409lbF48NynfmB8tADyCWG.jpg', 'Omar in brain storming session', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 4, 18, '1', '2022-01-06 17:57:58', '2022-01-06 17:58:48', NULL),
(134, 21, NULL, 'Add Title', '164149195361d72df13bc58', 'scene/anjGbaiQkngzYUCuVIycZLPUBkWPARnbaGXustRO.jpg', 'We see omar on a pitch with zayed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, 19, '1', '2022-01-06 17:59:13', '2022-01-06 18:00:03', NULL),
(135, 21, NULL, 'Add Title', '164149198061d72e0c33f66', 'scene/LA4LF14SRacfnwe0BGx4N2KfYBQTpZOoDgzTxX9J.jpg', 'Zayed scores a goal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 6, 20, '1', '2022-01-06 17:59:40', '2022-01-06 18:04:41', NULL),
(136, 25, NULL, 'Add Title', '164153587761d7d98562a3d', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, '1', '2022-01-07 06:11:17', '2022-01-07 06:11:17', NULL),
(137, 24, NULL, 'Add Title', '164153591461d7d9aa22525', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, '1', '2022-01-07 06:11:54', '2022-01-07 06:11:54', NULL),
(138, 23, NULL, 'Add Title', '164153593861d7d9c27e2ac', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, '1', '2022-01-07 06:12:18', '2022-01-07 06:12:18', NULL),
(139, 22, NULL, 'Add Title', '164153608461d7da544ca03', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, '1', '2022-01-07 06:14:44', '2022-01-07 06:14:44', NULL),
(140, 26, 'null', 'Dasdas', '164153612061d7da78af3b0', 'scene/6768mcN66NCwjhlmOWcfjEoU4bEcYfef6gWXYB0J.jpg', 'Add Description', 'null', 'null', 'null', 'null', 'null', NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', NULL, NULL, 'null', '0', 1, 1, '1', '2022-01-07 06:15:20', '2022-01-07 06:17:20', '2022-01-07 06:17:20'),
(141, 27, NULL, 'Add Title', '164153614661d7da92b636c', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, '1', '2022-01-07 06:15:46', '2022-01-07 06:15:46', NULL),
(142, 28, NULL, 'Add Title', '164153616861d7daa86f83e', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, '1', '2022-01-07 06:16:08', '2022-01-07 06:16:08', NULL),
(143, 26, NULL, 'Add Title', '164153624561d7daf5de6ab', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, '1', '2022-01-07 06:17:25', '2022-01-07 06:17:25', NULL),
(144, 29, NULL, 'Add Title', '164153627861d7db1605622', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, '1', '2022-01-07 06:17:58', '2022-01-07 06:17:58', NULL),
(145, 30, NULL, 'Add Title', '164153631561d7db3be05a8', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, 1, '1', '2022-01-07 06:18:35', '2022-01-07 06:18:57', NULL),
(146, 31, 'null', 'Add Title', '164153682361d7dd37bb17f', 'scene/Gpbx2TEQSGwlyBm08RPla2S9aZYQGITOEm02NptR.jpg', 'Add Description', 'null', 'null', 'null', 'Noon', 'null', NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', NULL, NULL, 'null', '1', 1, 1, '1', '2022-01-07 06:27:03', '2022-01-07 11:05:58', NULL),
(147, 32, NULL, 'Add Title', '164154073061d7ec7acac00', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, '1', '2022-01-07 07:32:10', '2022-01-07 07:32:10', NULL),
(148, 33, NULL, 'Add Title', '164154929761d80df1caf35', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, '1', '2022-01-07 09:54:57', '2022-01-07 10:59:59', '2022-01-07 10:59:59'),
(149, 33, NULL, 'Add Title', '164155323261d81d50cd0f8', NULL, 'Pehli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, 1, '1', '2022-01-07 11:00:32', '2022-01-07 11:12:19', NULL),
(150, 33, NULL, 'Add Title', '164155323561d81d53a1aa8', NULL, 'Dusreu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 3, 2, '1', '2022-01-07 11:00:35', '2022-01-07 11:12:28', NULL),
(151, 33, NULL, 'Add Title', '164155323661d81d54525bf', NULL, 'Teesri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 3, '1', '2022-01-07 11:00:36', '2022-01-07 11:12:35', NULL),
(152, 31, NULL, 'Add Title', '164155358061d81eacd686a', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, 2, '1', '2022-01-07 11:06:20', '2022-01-07 11:06:20', NULL),
(153, 34, NULL, 'Add Title', '164155364961d81ef15848b', NULL, 'First', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 4, 1, '1', '2022-01-07 11:07:29', '2022-01-07 11:10:48', NULL),
(154, 34, NULL, 'Add Title', '164155374761d81f534f410', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 6, 2, '1', '2022-01-07 11:09:07', '2022-01-07 11:09:07', NULL),
(155, 34, NULL, 'Add Title', '164155375061d81f5667943', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 3, '1', '2022-01-07 11:09:10', '2022-01-07 11:09:10', NULL),
(156, 34, NULL, 'Add Title', '164155375261d81f58565b4', NULL, 'M8t 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 4, '1', '2022-01-07 11:09:12', '2022-01-07 11:14:46', NULL),
(157, 35, 'Extreme Closeup', 'Add Title', '164173221361dad87542906', 'scene/8isPR3Na9GbwIHn8160zuKvpNb9rlZ6fYtW7tPdj.jpg', 'Close up on Paulina hand sketching', 'Neutral', 'Lens2', 'Internal', 'Sunrise', 'Silicon Oasis, Dubai,UAE - Dubai - United Arab Emirates', NULL, 'Paulina', 'Look 1', 'Paper, pencil, desk, art studio set up', NULL, 'Normal Speed', 'MOS (No Sound)', 'null', 'Easy RIG', NULL, NULL, 'null', '0', 1, 1, '1', '2022-01-09 12:43:33', '2022-01-09 18:58:04', NULL),
(158, 35, 'Closeup', 'Add Title', '164173277561dadaa7a4bbd', 'scene/VDLNQ5NPhPDVpOTZ8sjxYLCfWFQ0t3aXsgSibVG4.jpg', 'We see paulinas face to meet her while she sketches.', 'null', 'null', 'null', 'null', 'null', NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', NULL, NULL, 'null', '0', 2, 2, '1', '2022-01-09 12:52:55', '2022-01-09 18:59:47', NULL),
(159, 35, 'Medium Wide', 'Add Title', '164173349361dadd75578f1', 'scene/5Mv8BeQa7plEd5VuOvglZeJayybt1wIwfqcADYlS.jpg', 'Wide shot to establish Paulina in her studio', 'Neutral', 'Lens2', 'Internal', 'Morning', 'Silicon Oasis, Dubai,UAE - Dubai - United Arab Emirates', NULL, 'Paulina', 'Look 1', NULL, NULL, 'null', 'MOS (No Sound)', '6:57 AM', 'Handheld', NULL, NULL, 'A', '0', 3, 3, '1', '2022-01-09 13:04:53', '2022-01-10 06:57:21', NULL),
(160, 35, NULL, 'Add Title', '164173358661daddd2977b2', 'scene/qTxVpgeJiM6wFx24g8c322vBxqqFTivl4yII90IE.jpg', 'OTS of Paulina to show her sketch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 4, 4, '1', '2022-01-09 13:06:26', '2022-01-09 16:27:20', NULL),
(161, 35, NULL, 'Add Title', '164173361061daddeaa45ad', 'scene/4xgrt3NkB0tTaYK3JjEOMdsZdqP0zDFuMT6pSiMP.jpg', 'Close up of paint in water', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, 5, '1', '2022-01-09 13:06:50', '2022-01-09 16:27:51', NULL),
(162, 35, NULL, 'Add Title', '164173363961dade07c7f67', 'scene/qgFlAkeF2d8rZAbDeaFTbAkKjGeAgMkiATgOCVEg.jpg', 'Close up of Paulina\'s hand painting', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 6, 6, '1', '2022-01-09 13:07:19', '2022-01-09 16:28:31', NULL),
(163, 35, NULL, 'Add Title', '164173367861dade2e4e353', 'scene/EtiKKKX0c3cTUBtnmiqYBYauoOsUDsjy9sgJ7psw.jpg', 'Close up of paulina face as she paints', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 7, 7, '1', '2022-01-09 13:07:58', '2022-01-09 16:28:55', NULL),
(164, 35, NULL, 'Add Title', '164174574661db0d52a79e1', 'scene/WN8tIKiiMf7QjQ57EL3GsGVAGun3Rs22KwpQ3920.jpg', 'Close up of paulinas hand puttin the finishing touches to a moodboard.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 8, 8, '1', '2022-01-09 16:29:06', '2022-01-09 16:41:57', NULL),
(165, 35, NULL, 'Add Title', '164174576161db0d611113e', 'scene/BMwa6q1BNr2z6gHLR1Vh9dEwzFLYvPnqrZZR4Ifg.jpg', 'OTS of full shot of moldboard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 9, 9, '1', '2022-01-09 16:29:21', '2022-01-09 16:42:25', NULL),
(166, 35, NULL, 'Add Title', '164174578761db0d7baef16', 'scene/oYd7UzHNXdJ8Q9gRPrbfb5oRXNYHyZ0KWmkTx9Aw.jpg', 'Close up of Tom openin the drawer that contains leather.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 10, 10, '1', '2022-01-09 16:29:47', '2022-01-09 16:43:16', NULL),
(167, 35, NULL, 'Add Title', '164174582161db0d9d4d75d', 'scene/CuEjICHM9idc4zjjyaZNAc8OPsO5oevuSC0Bleiz.jpg', 'Wide shot to show Tom with all of the leather', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 11, 11, '1', '2022-01-09 16:30:21', '2022-01-09 16:43:51', NULL),
(168, 35, NULL, 'Add Title', '164174584561db0db54cee9', 'scene/iRPsNwXOsnRUs9dLutXnf3tDTbnBitJ63u2IjTHv.jpg', 'Close up of Toms hands putting leather on the table', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 12, 12, '1', '2022-01-09 16:30:45', '2022-01-09 16:45:46', NULL),
(169, 35, NULL, 'Add Title', '164174586361db0dc7e857a', 'scene/bjEiELI4kPWvBV34Tjq1i59BoWIGM6N8UhLpgOOp.jpg', 'Close up of Toms face as he works', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 13, 13, '1', '2022-01-09 16:31:03', '2022-01-09 16:46:10', NULL),
(170, 35, NULL, 'Add Title', '164174589361db0de5dd9e8', 'scene/KFpfOxExFYEnmNivl3NVfNEbk2VhIwmPoFG6badY.jpg', 'Wide of Tom in his workshop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 14, 14, '1', '2022-01-09 16:31:33', '2022-01-09 16:46:33', NULL),
(171, 35, NULL, 'Add Title', '164174592961db0e0986303', 'scene/JySqE5YsPGGEBRZJz0fsaGBVOMgfhC1yHSjkJOMg.jpg', 'ECU of toms hands polishing the unfinished metal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 15, 15, '1', '2022-01-09 16:32:09', '2022-01-09 16:47:28', NULL),
(172, 35, NULL, 'Add Title', '164174594961db0e1d6d018', 'scene/eyDRSwLOW8jzoTudJP6SOEPVGMyEf46Mg3yl5S3J.jpg', 'Close up of Toms face as he polishes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 16, 16, '1', '2022-01-09 16:32:29', '2022-01-09 16:47:55', NULL),
(173, 35, NULL, 'Add Title', '164174605461db0e865a01f', 'scene/9lmzGJBm9Cy55toCV6Vi1zNZc9aU3szwCxnPl4Jf.jpg', 'ECU of plate being lowered into solution.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 17, 17, '1', '2022-01-09 16:34:14', '2022-01-09 16:48:59', NULL),
(174, 35, NULL, 'Add Title', '164174607761db0e9d79928', 'scene/sEBbwQuZVp17e6aGnDJ1TdFaCEXGlPIoJ1Gl32xT.jpg', 'Cu of tom inspecting the finished product', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 18, 18, '1', '2022-01-09 16:34:37', '2022-01-09 16:50:08', NULL),
(175, 35, NULL, 'Add Title', '164174610661db0eba3ed43', 'scene/L3LDLmUibEY7QR7QFI3zvR00kKptnfMg6mJxy9WO.jpg', 'Paulina inspecting the finished product with magnifier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 19, 19, '1', '2022-01-09 16:35:06', '2022-01-09 16:50:39', NULL),
(176, 35, NULL, 'Add Title', '164174623361db0f3913658', 'scene/5TiDkMRZY64Q1H8kgsZMZhprEanaFPE9x1yAx8XS.jpg', 'Low angle shot of paulina with camera under the glass table. Of her arranging stones.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 20, 20, '1', '2022-01-09 16:37:13', '2022-01-09 18:58:58', '2022-01-09 18:58:58'),
(177, 35, NULL, 'Add Title', '164174625161db0f4b40fe6', 'scene/usnf1yuG1otV2iCvO3QD0u6B0dRZmZimbRCSL7sp.jpg', 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 21, 21, '1', '2022-01-09 16:37:31', '2022-01-09 16:37:50', NULL),
(178, 35, NULL, 'Add Title', '164174627261db0f60f2756', 'scene/n8ztAZHdzI4ZObwvhDv7aZVYyBhsUfvzq0j7LO2Y.jpg', 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 22, 22, '1', '2022-01-09 16:37:52', '2022-01-09 16:38:06', NULL),
(179, 35, NULL, 'Add Title', '164174629561db0f772a00b', 'scene/st2yiE17EGLVVZg68nQhDLhn1A5OeibNQ0dg02DJ.jpg', 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 23, 23, '1', '2022-01-09 16:38:15', '2022-01-09 16:38:35', NULL),
(180, 35, NULL, 'Add Title', '164174632961db0f992bd63', NULL, 'Hello', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 24, 24, '1', '2022-01-09 16:38:49', '2022-01-09 16:38:59', NULL);
INSERT INTO `scenes` (`id`, `shot_list_id`, `size`, `title`, `slug`, `image_url`, `description`, `angle`, `lens`, `internal_external`, `sun_time`, `location`, `location_pin`, `cast`, `wardrobe`, `props`, `action`, `speed`, `sound`, `timepicker`, `grip`, `lines_dialogue_english`, `lines_dialogue_foreign`, `camera`, `is_complete`, `sort_order`, `scene_no`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(181, 35, NULL, 'Add Title', '164174636261db0fba85335', 'scene/bRjoJ63BLlnDAXUxH8dhh6cBbxOTZbXPbyYH2m9f.jpg', 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 25, 25, '1', '2022-01-09 16:39:22', '2022-01-09 16:39:40', NULL),
(182, 35, NULL, 'Add Title', '164174710261db129e49d01', NULL, 'Beautiful assembly of scales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 26, 26, '1', '2022-01-09 16:51:42', '2022-01-09 16:52:12', NULL),
(183, 35, NULL, 'Add Title', '164174777361db153d8292e', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 27, 27, '1', '2022-01-09 17:02:53', '2022-01-09 17:02:53', NULL),
(184, 35, NULL, 'Add Title', '164174777661db1540088eb', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 28, 28, '1', '2022-01-09 17:02:56', '2022-01-09 17:03:24', '2022-01-09 17:03:24'),
(185, 35, NULL, 'Add Title', '164175263261db283867de0', 'scene/8x2lQAnrDwhrKp3bq6piGmWKPxMiq5geLSYzVbcu.jpg', 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 28, 28, '1', '2022-01-09 18:23:52', '2022-01-09 18:24:08', NULL),
(186, 35, NULL, 'Add Title', '164175265161db284ba3b36', NULL, 'Add Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 29, 29, '1', '2022-01-09 18:24:11', '2022-01-09 18:58:51', '2022-01-09 18:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `shot_list`
--

CREATE TABLE `shot_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_lock` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_pin` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `total_scene` int(11) NOT NULL DEFAULT '0',
  `total_completed_scene` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shot_list`
--

INSERT INTO `shot_list` (`id`, `user_id`, `name`, `slug`, `image_url`, `description`, `is_lock`, `is_pin`, `sort_order`, `status`, `total_scene`, `total_completed_scene`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Sdsa', '164120508761d2cd5f7f61d', 'shot_list/N9XzjiD2tXTCDV51TLudyQJHWUMkQ8Vi3581kJ08.jpg', 'Asdas', '1', '0', NULL, '1', 5, 3, '2022-01-03 10:18:07', '2022-01-03 10:18:22', NULL),
(2, 1, 'Ddddd', '164120514661d2cd9a8ef17', 'shot_list/x68JMCsY8dzFWwZoP5C36NjhZ7OY6lT7lZRCpzt2.jpg', 'Ddddd', '1', '0', NULL, '1', 5, 2, '2022-01-03 10:19:06', '2022-01-03 10:19:27', NULL),
(3, 1, 'Dsds', '164120520061d2cdd0826ac', 'shot_list/GU84a06KXB3csNiFjpvjaL0sJTBSPDOm6gRIdgZA.jpg', 'Sadas', '1', '0', NULL, '1', 3, 3, '2022-01-03 10:20:00', '2022-01-03 10:20:11', NULL),
(4, 2, 'Sdsad', '164120533161d2ce53d1fbd', 'shot_list/6pPr5CAsoJPybN7aYxqyiUegYOajvzftMO3EaR78.jpg', 'Sadasd', '1', '0', NULL, '1', 7, 7, '2022-01-03 10:22:11', '2022-01-04 08:13:06', NULL),
(5, 3, 'Ff', '164120630161d2d21d812af', 'shot_list/PIj9ts9Navg52Mq2Eb0G2VFKT4k93i1D1GBw8HbU.jpg', 'Ff', '1', '0', NULL, '1', 4, 2, '2022-01-03 10:38:21', '2022-01-03 10:38:31', NULL),
(6, 4, 'Henry List', '164123402061d33e6412730', 'shot_list/R7G6DoPWSQ2YXkuvQk96bEp2RJjD5cid5nxU2Fpg.jpg', 'List', '0', '0', NULL, '1', 5, 4, '2022-01-03 18:20:20', '2022-01-06 14:24:47', NULL),
(7, 5, 'List 2', '164123868361d3509b9f116', 'shot_list/HzQD0fStwHlVWh0uucAVX3wl7pZQsoNNJIUPgXFh.jpg', 'List', '1', '1', NULL, '1', 5, 0, '2022-01-03 19:38:03', '2022-01-05 07:11:09', NULL),
(8, 6, 'Ggg7', '164126850061d3c514696f3', 'shot_list/581aR3OspP9N5GiOy9HTKTWaty98pt5oMkXECE8g.jpg', 'Tt7', '0', '0', NULL, '1', 9, 9, '2022-01-04 03:55:00', '2022-01-07 06:06:34', '2022-01-07 06:06:34'),
(9, 5, 'Aa', '164126901761d3c719844d9', 'shot_list/FVpsOJ0eRQfPdvP00mfGOBvAKf6q3bNsUS1ediXZ.jpg', 'Aa', '1', '0', NULL, '1', 4, 2, '2022-01-04 04:03:37', '2022-01-05 06:46:54', NULL),
(10, 6, 'T7t7', '164128047661d3f3dc8d52a', 'shot_list/oxWdPDTZZf87U0PeCJeeiFZynoEkxkj3qLGkKhzX.jpg', '7t7', '0', '0', NULL, '1', 8, 3, '2022-01-04 07:14:36', '2022-01-07 06:04:13', '2022-01-07 06:04:13'),
(11, 7, 'Trr', '164128126561d3f6f1e0417', 'shot_list/EpKWuPSRI9L2KbaLQWnWOWRQEq7O4VJjLHK1urMz.jpg', '55', '1', '0', NULL, '1', 7, 7, '2022-01-04 07:27:45', '2022-01-04 08:09:52', NULL),
(12, 8, 'Nnnn', '164128434361d402f7b03e6', 'shot_list/VkjYcLaU3cksd8PM3bKpUp6Su9SxEcmiXfki5zxh.jpg', 'Nnn', '0', '0', NULL, '1', 6, 3, '2022-01-04 08:19:03', '2022-01-04 08:31:05', NULL),
(13, 6, 'Nn', '164135680561d51e059fe64', 'shot_list/tzpanCrGfaUjgcUWsYJJAjzp0hcTKe1D8hLMKMFa.jpg', 'Nn', '0', '0', NULL, '1', 4, 5, '2022-01-05 04:26:45', '2022-01-07 06:02:06', '2022-01-07 06:02:06'),
(14, 4, 'aa', '164136416161d53ac17cdb8', 'shot_list/fOIiuycWzfRx5HxC4lQt9r1vZ6WQxdZE6wPPznop.jpg', 'aa', '1', '0', NULL, '1', 3, 0, '2022-01-05 06:29:21', '2022-01-06 14:24:15', NULL),
(15, 2, 'Dsfsdf', '164137135461d556da76d93', 'shot_list/Q0JAekWzCVaN4eGKV9Z8ngU7zC8OUy4UqNXklXym.jpg', 'Dfsdf', '1', '0', NULL, '1', 5, 4, '2022-01-05 08:29:14', '2022-01-05 08:33:18', NULL),
(16, 6, 'D55d', '164137664861d56b886a8c3', 'shot_list/bJVQuxJpmPW80A16fZTHVKhKXQTcHivxnQfHPmaY.jpg', '6f6', '0', '1', NULL, '1', 5, 7, '2022-01-05 09:57:28', '2022-01-07 06:15:02', '2022-01-07 06:15:02'),
(17, 9, 'H8e2r8h', '164137727861d56dfee3e42', 'shot_list/tC9rCcWa6psYRmkM2a89SdXx0pyTB25P2gQkmBvU.jpg', 'Tt', '1', '0', NULL, '1', 4, 1, '2022-01-05 10:07:58', '2022-01-05 10:08:16', NULL),
(18, 6, 'Ffj', '164137830361d571ff9776a', 'shot_list/FIPqRjYcTHDBQFwG7FkYHNK7Fp49dtqbU8PK5toh.jpg', 'Djd', '1', '0', NULL, '1', 6, 6, '2022-01-05 10:25:03', '2022-01-06 08:01:49', '2022-01-06 08:01:49'),
(19, 4, 'Yfyf', '164138196261d5804a69966', 'shot_list/H4uLkQg4yXCFfeaVkI07BwwxVO4uX0BO6Rceb3eS.jpg', 'Cyyc', '1', '1', NULL, '1', 6, 2, '2022-01-05 11:26:02', '2022-01-06 14:15:17', NULL),
(20, 11, 'Djd', '164145154561d6901964385', 'shot_list/nyTJVDjhdKRCzPVPhx0zyqFag71vvomIzxgmaON7.jpg', 'Geyw', '0', '0', NULL, '1', 5, 0, '2022-01-06 06:45:45', '2022-01-06 07:00:30', NULL),
(21, 13, 'Maan - 50th', '164148997861d7263a76576', 'shot_list/n1zpMm36raShO53RP3uaG2syuII4MBfbPfaav6Ta.jpg', '50th National Day Film', '0', '0', NULL, '1', 20, 1, '2022-01-06 17:26:18', '2022-01-09 19:16:03', NULL),
(22, 6, 'Fdsfd', '164153547861d7d7f64200a', 'shot_list/1NuH9rEZGi5VkReCUZ3UiNcokTi5PCzeHXs6xudC.jpg', 'Fdsf', '0', '0', NULL, '1', 1, 0, '2022-01-07 06:04:38', '2022-01-07 06:14:50', '2022-01-07 06:14:50'),
(23, 6, 'Ssss', '164153563061d7d88eb0f42', 'shot_list/V7ZAwqaGMoxNzMUUnGajytMiS332VkPi0m2NEPAl.jpg', 'Asa', '0', '0', NULL, '1', 1, 0, '2022-01-07 06:07:10', '2022-01-07 06:12:26', '2022-01-07 06:12:26'),
(24, 6, 'Wewewq', '164153565461d7d8a60c9d1', 'shot_list/WhC4q9hsevc9gAUfYx9DtqYC1vzupweXD6LEvXaD.jpg', 'Ewqewqe', '0', '0', NULL, '1', 1, 0, '2022-01-07 06:07:34', '2022-01-07 06:11:59', '2022-01-07 06:11:59'),
(25, 6, 'Dsadasd', '164153568261d7d8c24b8ac', 'shot_list/uMXzTzUrEeGfsEtiXLnH5kX5Bu4lkf0YgcJ4Inwi.jpg', 'Sadsad', '0', '0', NULL, '1', 1, 0, '2022-01-07 06:08:02', '2022-01-07 06:11:22', '2022-01-07 06:11:22'),
(26, 6, 'Sdasda', '164153611661d7da74bbe5c', 'shot_list/7t08g1BNLvyTIza6jpDD3dtrZ8q9CaLn731freRz.jpg', 'Dasdasd', '0', '0', NULL, '1', 1, 0, '2022-01-07 06:15:16', '2022-01-07 06:17:30', '2022-01-07 06:17:30'),
(27, 6, 'Sdasdasd', '164153614261d7da8ebab6e', 'shot_list/wLOxvqhy3moLCPsWknlGJT3c77Y0Vm3uODffIyBu.jpg', 'Sadsad', '0', '0', NULL, '1', 1, 0, '2022-01-07 06:15:42', '2022-01-07 06:16:19', '2022-01-07 06:16:19'),
(28, 6, 'Bbbb', '164153616261d7daa2366b2', 'shot_list/phJHZwdh1E106j7tTrStWZD0eAhbs9n1ZWSuAvmq.jpg', 'Dsd', '0', '0', NULL, '1', 1, 0, '2022-01-07 06:16:02', '2022-01-07 06:17:39', '2022-01-07 06:17:39'),
(29, 6, 'Sdasd', '164153627361d7db114e3f9', 'shot_list/u2ZenxfBu38ES5wuqyxvy5gGLxoDqmDabRtfQcZU.jpg', 'Sads', '1', '0', NULL, '1', 1, 0, '2022-01-07 06:17:53', '2022-01-07 06:18:19', '2022-01-07 06:18:19'),
(30, 6, 'Sdsad', '164153631161d7db3740bc4', 'shot_list/zjTcHkYjMeIPkywHTZCLiRfcEmoI6ztNbgwGuA8C.jpg', 'Sadsa', '1', '0', NULL, '1', 1, 1, '2022-01-07 06:18:31', '2022-01-07 06:19:02', '2022-01-07 06:19:02'),
(31, 6, 'Dddqwqw', '164153682061d7dd341b095', 'shot_list/GpFA19wNflNF0cDxlUVtVbsarC5XBHkWY1rC15kS.jpg', 'D5d5', '0', '0', NULL, '1', 2, 1, '2022-01-07 06:27:00', '2022-01-07 11:04:58', NULL),
(32, 14, 'Guug', '164153866261d7e466c1f45', 'shot_list/mwHJIWlKAodwuQweptB7T0F6V59sj0RECunLj8xU.jpg', 'G7t', '0', '0', NULL, '1', 1, 0, '2022-01-07 06:57:42', '2022-01-07 07:32:35', '2022-01-07 07:32:35'),
(33, 14, '555', '164154929161d80deb90fae', 'shot_list/3Z8cTyKH2y6Fw7IV3ZLfHYod8gJ3G9VJYK8gxUXc.jpg', 'D3d4s2sy28sy2', '0', '0', NULL, '1', 3, 0, '2022-01-07 09:54:51', '2022-01-07 11:03:46', NULL),
(34, 6, 'New shot My', '164155363961d81ee7ac214', 'shot_list/0AsWVJx8kG2ojO9TqjkRecMOGEwys2CgTw0MEV3o.jpg', 'My new shot', '0', '0', NULL, '1', 4, 1, '2022-01-07 11:07:19', '2022-01-07 11:52:08', NULL),
(35, 13, 'Givori \"Artists\"', '164173214461dad830094c1', 'shot_list/X9ce3cUpnU7sbuOfXc2EQVLZuT1Cykjy8byf0O6K.jpg', 'Conent film for Givori', '1', '0', NULL, '1', 27, 0, '2022-01-09 12:42:24', '2022-01-10 06:58:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `is_email_verify` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email_verify_at` datetime DEFAULT NULL,
  `is_mobile_verify` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile_verify_at` datetime DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile_otp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_otp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_setting` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_group_id`, `name`, `username`, `slug`, `email`, `mobile_no`, `password`, `image_url`, `status`, `is_email_verify`, `email_verify_at`, `is_mobile_verify`, `mobile_verify_at`, `country`, `city`, `state`, `zipcode`, `address`, `latitude`, `longitude`, `online_status`, `mobile_otp`, `email_otp`, `notification_setting`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Weqw', 'weqw', 'weqw', 'Weqw@gmail.com', '+92-3122222222', '$2y$10$h29srjH/cHwKRXJWt.grg.vO0BHJz9DnvYNtzWGwEADQR.9o4lOBy', 'users/TC1iMHOgfgsTjOWqZ5ZyvGizdi4pG8rOmqLkwhez.jpg', '1', '0', NULL, '1', '2022-01-03 10:17:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-03 10:17:49', '2022-01-03 10:17:55', NULL),
(2, 1, 'Dddd', 'dddd', 'dddd', 'Dddd@gmail.com', '+92-3134444222', '$2y$10$mD3kjLRm.WHhGTkvAmrDBeNR4TEJZPXw1fkeCxZgWoFG3hjDT7.cS', 'users/6hmQX8TVoFqezrOutufoZjQ0nGqJfly1MEvkKkiI.jpg', '1', '0', NULL, '1', '2022-01-03 10:21:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-03 10:21:51', '2022-01-03 10:21:59', NULL),
(3, 1, 'Xxx', 'xxx', 'xxx', 'Xxx@gmail.com', '+92-3145780963', '$2y$10$C6ydYS56B.5zBposJVemg.n0jvrvrVaBFvlBb3bLzLR0YEhH/set2', 'users/mIGU7dYqUYqXZi5nzkXrb8jupDlmnCH93BeZ5NRz.jpg', '1', '0', NULL, '1', '2022-01-03 10:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-03 10:37:59', '2022-01-03 10:38:08', NULL),
(4, 1, 'Henry', 'henry', 'henry', 'Henry@yopmail.com', '+1-8004444444', '$2y$10$Zniwl6ybkxUYNXXBtsfcA.sWnmfh9nx9Mszd3E6ysnHDT3vwsTtae', 'users/9refbmDuxpGD1aYDh1S0s1YH3GHb6ZXUwEbfHUof.jpg', '1', '0', NULL, '1', '2022-01-03 18:19:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-03 18:18:53', '2022-01-03 18:19:01', NULL),
(5, 1, 'Alex', 'alex', 'alex', 'Alex@yopmail.com', '+1-8007894561', '$2y$10$yP/rhplWKoOMWI8qzrMjROhtd8rhZmvjjcHiSN68FR4tdEGORPLIa', 'users/dl7FKuSHoo6BmrWOlue901EpXnRf4QMpVLm3VnQF.jpg', '1', '0', NULL, '1', '2022-01-03 18:39:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-03 18:38:22', '2022-01-03 18:39:42', NULL),
(6, 1, 'Terry', 'terry', 'terry', 'Ttt@gmail.com', '+92-3154785236', '$2y$10$jSeDimdO1TBSq.uw69P84.rZuCXvrR7oUp.w3voMO5U9z0FYkDe3e', 'users/mJl1q1HSsiUiPHt4Vqr7gAeaPGJHfY2BWBywhZYu.jpg', '1', '0', NULL, '1', '2022-01-04 03:54:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-04 03:54:40', '2022-01-04 03:54:45', NULL),
(7, 1, 'Killl', 'killl', 'killl', 'Kkkh@gmail.com', '+92-3154627845', '$2y$10$PzfEJaKoGfD/Yjw9y4jMqeT.VsIgHKFati0Z/UUSMj412he4M13q2', 'users/mRZcMTMvNAbZnFuEWPO2M2SU6upFPGcVUDLwHgRA.jpg', '1', '0', NULL, '1', '2022-01-04 07:27:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-04 07:27:25', '2022-01-04 07:27:29', NULL),
(8, 1, 'Clear', 'clear', 'clear', 'Clear@gmail.com', '+92-3152645784', '$2y$10$jpxm7PTiRva8VzY5J5vCROzpkOdf5qn4XlCLamGnVq8wDApmNgCjm', 'users/Gi4y8dD2pM9cZEYlZONGJSA1No47cO0Dy49mpCsp.jpg', '1', '0', NULL, '1', '2022-01-04 08:18:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-04 08:18:45', '2022-01-04 08:18:50', NULL),
(9, 1, 'Shhwx', 'shhwx', 'shhwx', 'Zwz@gmail.com', '+92-3122222315', '$2y$10$A8fp7lKqSP0tbzOLxkf3w.eg.GpzCBmUDLAazHH/bqq7QffQpscBy', 'users/CX8Wfd453wsQDUvNLwyWmJGXr3R0cXO462Ki49do.jpg', '1', '0', NULL, '1', '2022-01-05 10:07:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-05 10:06:56', '2022-01-05 10:07:34', NULL),
(10, 1, 'FOX', 'fox', 'fox', 'fox@yopmail.com', '+1-8007777777', '$2y$10$bvLt1AAaEAPl6Zha1B2.PeYAqdWbCG1CRPNBpmaOz0.DSWWvexI8K', 'users/zTf6mVehCHzSfUd8gegHDBDK9jzYpOgVS3C5Yt7U.jpg', '1', '0', NULL, '1', '2022-01-05 15:38:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', NULL, '2022-01-05 15:33:27', '2022-01-05 15:39:36', NULL),
(11, 1, 'Hhhh', 'hhhh', 'hhhh', 'Hh@gmail.com', '+92-3128284020', '$2y$10$45VlLuJYC7yi5ZDY3kZbnOqhZllUshGLrjJPrhRneVTd6fZqTWT42', 'users/sxVIgBnmnXgftGWuxhJM0hdi57bXoHSm8d316o3S.jpg', '1', '0', NULL, '1', '2022-01-06 06:42:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-06 06:42:45', '2022-01-06 06:42:50', NULL),
(12, 1, 'Sssss', 'sssss', 'sssss', 'Abc@gmail.com', '+92-3152915941', '$2y$10$Z5qb4gyuiIlnvbDuJRjXNuhkBPofG1j58ShLC69txhf77HExBJYBC', 'users/uj6UWvLl8159X6uXYZZgZjWIR0yWCyPN6mAQ0qhM.jpg', '1', '0', NULL, '1', '2022-01-06 11:17:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-06 11:17:14', '2022-01-06 11:17:22', NULL),
(13, 1, 'Ahmed Abdulqader', 'ahmed-aq', 'ahmed-aq', 'Ahmed@ahmedaq.com', '+971-506944544', '$2y$10$4EhKj7NkkiPuVvP3uCGob.P6M4M2tywIgcllg7qezrlg00ptqlkci', 'users/wLrGZS1WOVtklTCOwtIOLpS9FBHFbkxXVhlS8NTT.jpg', '1', '0', NULL, '1', '2022-01-06 17:19:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', NULL, '2022-01-06 17:12:19', '2022-01-09 19:12:30', NULL),
(14, 1, 'Jumaj', 'jumaj', 'jumaj', 'Jj@gmail.com', '+92-3122252635', '$2y$10$u7Bk...OxSawt.CYF/187.lrg2/9y3dN9PE8LOXt09Dh.m.FCfFHS', 'users/9w3zvOVRndVea8DOWAXR5wPwQKcMtiAlLNnUxBsf.jpg', '1', '0', NULL, '1', '2022-01-07 06:55:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-07 06:55:17', '2022-01-07 06:55:23', NULL),
(15, 1, 'Amir', 'amir', 'amir', 'Amir@gmail.com', '+1-5139732589', '$2y$10$UdrwqH7TX40HH4/AEYJ9VOpqI29iPAz9QE0lgDNZMN.o8bkMfOcYW', 'users/pMJrHhmMeK8kBt8gNsyN0qfYHzRJqFjQYAUMYpKc.jpg', '1', '0', NULL, '1', '2022-01-10 07:47:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '2022-01-10 07:47:10', '2022-01-10 07:47:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_api_token`
--

CREATE TABLE `user_api_token` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `udid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci,
  `platform_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `platform_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_api_token`
--

INSERT INTO `user_api_token` (`id`, `user_id`, `api_token`, `refresh_token`, `udid`, `device_type`, `device_token`, `platform_type`, `platform_id`, `ip_address`, `user_agent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '6a39c6586ef1393867ce67019112bea25ead0239f62e6f2090317df4e3af3b83', '7f910091e04692d226d70e261d6462066d5f6ef413aaac88692c37d8c11b3c7d', 'api.Pd*!(5675', 'android', '1234567890', 'custom', NULL, '110.93.250.194', 'shot_shifter/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-01-03 10:17:49', NULL, NULL),
(2, 2, 'ec303cb2e394fc4a411c3039f6fd3d41f7813d81906cf4370a31c56ae32dea7f', '99422905bed027a8d6da1bf22e9a2c325426fa5cf87772da5488d4d745c52b46', 'api.Pd*!(5675', 'android', '1234567890', 'custom', NULL, '110.93.250.194', 'shot_shifter/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-01-03 10:21:51', NULL, NULL),
(3, 3, 'dbe02acb87e08eb19c947082648173bb96015eba9a255a2009521685ee7ce891', '6a24797b6eb0179d98f8100f063f0f7d40196f7b31ae006029346bda22891cc8', 'api.Pd*!(5675', 'android', '1234567890', 'custom', NULL, '124.29.238.131', 'shot_shifter/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-03 10:37:59', NULL, NULL),
(4, 4, '322cac0c66e42f91df826fc5c2ec2648755df2bc0ce3c0c5862b1de4d22e6119', 'b78dd1612b0120b09dd93512cc1773ac251d7205cc1ff6e1a2cc7c92bffa7a61', 'api.Pd*!(5675', NULL, NULL, 'custom', NULL, '124.29.238.131', 'okhttp/4.9.1', '2022-01-05 11:19:58', '2022-01-05 11:19:58', NULL),
(5, 5, '39e01a91eac9e7445fe6d6c512cea0f2e8f4a936aeb63fa98adb4fbb6d1d6859', 'f17abdc5029a3c42ac3ce40b59bbc2e3869c836ffa7a3655dd42fc046e0a3590', 'api.Pd*!(5675', NULL, NULL, 'custom', NULL, '124.29.238.131', 'okhttp/4.9.1', '2022-01-05 06:34:50', '2022-01-05 06:34:50', NULL),
(6, 6, 'fcc697184b6d3e0c2684b7eb490e1c666bea516a6f74308501bd0ccf26424266', 'ab7b22009dfc9c99592c16960f37e760fb37c8061527bd7e9240177e6e376265', 'api.Pd*!(5675', NULL, NULL, 'custom', NULL, '192.140.145.242', 'okhttp/4.9.1', '2022-01-10 07:48:03', '2022-01-10 07:48:03', NULL),
(7, 7, 'a8824a072f3f8bec040f9c9a4d15f6125f96165ab35d7ad9f09733b28f334b1b', 'd4bd67640e4ed241dbad9d88225d115f38ab22564dd2c012d49807e73c7d048e', 'api.Pd*!(5675', 'android', '1234567890', 'custom', NULL, '124.29.238.131', 'okhttp/4.9.1', '2022-01-04 07:27:25', NULL, NULL),
(8, 8, '72f3d7236139f19a84da6d7edbfe151db6193fb2aecc2d2484e9ba6c20e5b688', '8b99350106e1c6208e1de2df95b99433afec95f99cc325b17b1b799804dc8acb', 'api.Pd*!(5675', 'android', '1234567890', 'custom', NULL, '124.29.238.131', 'okhttp/4.9.1', '2022-01-04 08:18:45', NULL, NULL),
(9, 9, '42e8dc6f5f2c6f071ae4893f529fbe10f7504393f1fd3b46d4aebe65a093bd8a', 'e2dac9043abe39a179b29c9d96136a0d3bce086554a2ec5bb7e929045f977665', 'api.Pd*!(5675', NULL, NULL, 'custom', NULL, '124.29.238.131', 'okhttp/4.9.1', '2022-01-05 10:07:26', '2022-01-05 10:07:26', NULL),
(11, 10, 'b907f56aead594189a91941f11721cf3da5dc2c560e3f4be7e18c5a03fc00dc2', 'b1e0bf1a1b94b74722471888c6c898d58bd3d56ff2e9b3274e9a2e6e988c1577', 'api.Pd*!(5675', NULL, NULL, 'custom', NULL, '124.29.238.131', 'shot_shifter/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-05 15:38:41', '2022-01-05 15:38:41', NULL),
(12, 11, '904ba9fe219540db2f304bc50ec43cbfbb3526565cf16e1a3b3fd2a3c76634e4', '2cc46f6d2976d6a7ca0b985153ee3701b0992cc2cc3c2c4079ec3bda89287ad6', 'api.Pd*!(5675', 'android', '1234567890', 'custom', NULL, '124.29.238.131', 'okhttp/4.9.1', '2022-01-06 06:42:45', NULL, NULL),
(13, 12, '4fa8409765a54f1b724339ab73c569070e568330d67e0d927fe62aee8a272a5a', '3452f34f23e782cef638f0cf5086cdc38fef00c28ba3d740fb27aa27bfd31223', 'api.Pd*!(5675', 'android', '1234567890', 'custom', NULL, '110.93.250.194', 'shot_shifter/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-01-06 11:17:14', NULL, NULL),
(14, 13, 'e9b5885080df896a77341d4f97d90d5e3c3e5b164c1e168ccb1c8c1e634670bd', '9f9aacb080b9c2edb841c73b313cf351ce5d7857fc66fb3d66bace7bed1ac4ab', 'api.Pd*!(5675', NULL, NULL, 'custom', NULL, '92.97.176.39', 'okhttp/4.9.1', '2022-01-09 11:49:36', '2022-01-09 11:49:36', NULL),
(15, 14, '0401c132a5266329fa4158831ca8df6fe1f32f927aff5e5ec039f7d1d6aec6a9', 'c1e7921abcd8a8530d16716b6eda588a435dcd142501d3377a3c14eb57588355', 'api.Pd*!(5675', 'android', '1234567890', 'custom', NULL, '124.29.238.131', 'okhttp/4.9.1', '2022-01-07 06:55:17', NULL, NULL),
(16, 15, 'e51b509dbfc39068a9b19cb07a708e21f07f2a45118ed3f5ee505a0626524049', '7f3427600a92c5b6b01d8966e53e54e77d4dc87c8d3305e7724b80b2ac4c135b', 'api.Pd*!(5675', 'android', '1234567890', 'custom', NULL, '192.140.145.242', 'okhttp/4.9.1', '2022-01-10 07:47:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'App User', 'app-user', '1', '2021-11-23 12:47:44', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_member`
--

CREATE TABLE `user_member` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `actor_id` bigint(20) UNSIGNED NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_member`
--

INSERT INTO `user_member` (`id`, `actor_id`, `target_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(30, 14, 11, '2022-01-07 08:05:06', NULL, NULL),
(31, 14, 14, '2022-01-07 08:05:06', NULL, NULL),
(240, 15, 11, '2022-01-10 07:47:40', NULL, NULL),
(241, 15, 14, '2022-01-10 07:47:40', NULL, NULL),
(242, 15, 15, '2022-01-10 07:47:40', NULL, NULL),
(504, 6, 11, '2022-01-10 11:32:15', NULL, NULL),
(505, 6, 14, '2022-01-10 11:32:15', NULL, NULL),
(506, 6, 15, '2022-01-10 11:32:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_member_shotlist`
--

CREATE TABLE `user_member_shotlist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shot_list_id` bigint(20) UNSIGNED NOT NULL,
  `actor_id` bigint(20) UNSIGNED NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_share`
--

CREATE TABLE `user_share` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `actor_id` bigint(20) UNSIGNED NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `shot_list_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application_setting`
--
ALTER TABLE `application_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `breaks`
--
ALTER TABLE `breaks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `breaks_slug_unique` (`slug`),
  ADD KEY `breaks_user_id_foreign` (`user_id`),
  ADD KEY `breaks_scene_id_foreign` (`scene_id`);

--
-- Indexes for table `cms_modules`
--
ALTER TABLE `cms_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_modules_name_unique` (`name`),
  ADD UNIQUE KEY `cms_modules_route_name_unique` (`route_name`);

--
-- Indexes for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_module_permissions_cms_role_id_foreign` (`cms_role_id`),
  ADD KEY `cms_module_permissions_cms_module_id_foreign` (`cms_module_id`);

--
-- Indexes for table `cms_roles`
--
ALTER TABLE `cms_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_users_username_unique` (`username`),
  ADD UNIQUE KEY `cms_users_slug_unique` (`slug`),
  ADD UNIQUE KEY `cms_users_email_unique` (`email`),
  ADD UNIQUE KEY `cms_users_mobile_no_unique` (`mobile_no`),
  ADD KEY `cms_users_cms_role_id_foreign` (`cms_role_id`);

--
-- Indexes for table `cms_widgets`
--
ALTER TABLE `cms_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_widgets_widget_type_index` (`widget_type`);

--
-- Indexes for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_widget_role_cms_widget_id_foreign` (`cms_widget_id`),
  ADD KEY `cms_widget_role_cms_role_id_foreign` (`cms_role_id`);

--
-- Indexes for table `content_management`
--
ALTER TABLE `content_management`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_management_slug_index` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_slug_index` (`slug`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail_templates_identifier_unique` (`identifier`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_module_module_id_index` (`module`,`module_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_unique_id_identifier_target_id_index` (`unique_id`,`identifier`,`target_id`);

--
-- Indexes for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_setting_user_id_index` (`user_id`);

--
-- Indexes for table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scenes`
--
ALTER TABLE `scenes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `scenes_slug_unique` (`slug`),
  ADD KEY `scenes_shot_list_id_foreign` (`shot_list_id`);

--
-- Indexes for table `shot_list`
--
ALTER TABLE `shot_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shot_list_slug_unique` (`slug`),
  ADD KEY `shot_list_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_slug_unique` (`slug`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_no_unique` (`mobile_no`),
  ADD KEY `index1` (`user_group_id`,`slug`,`email`,`mobile_no`,`is_email_verify`,`status`);

--
-- Indexes for table `user_api_token`
--
ALTER TABLE `user_api_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_api_token_api_token_unique` (`api_token`),
  ADD UNIQUE KEY `user_api_token_refresh_token_unique` (`refresh_token`),
  ADD KEY `user_api_token_user_id_foreign` (`user_id`),
  ADD KEY `user_api_token_api_token_index` (`api_token`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_member`
--
ALTER TABLE `user_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_member_actor_id_foreign` (`actor_id`),
  ADD KEY `user_member_target_id_foreign` (`target_id`);

--
-- Indexes for table `user_member_shotlist`
--
ALTER TABLE `user_member_shotlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_member_shotlist_shot_list_id_foreign` (`shot_list_id`),
  ADD KEY `user_member_shotlist_actor_id_foreign` (`actor_id`),
  ADD KEY `user_member_shotlist_target_id_foreign` (`target_id`);

--
-- Indexes for table `user_share`
--
ALTER TABLE `user_share`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_share_actor_id_foreign` (`actor_id`),
  ADD KEY `user_share_target_id_foreign` (`target_id`),
  ADD KEY `user_share_shot_list_id_foreign` (`shot_list_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application_setting`
--
ALTER TABLE `application_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `breaks`
--
ALTER TABLE `breaks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `cms_modules`
--
ALTER TABLE `cms_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cms_roles`
--
ALTER TABLE `cms_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_widgets`
--
ALTER TABLE `cms_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `content_management`
--
ALTER TABLE `content_management`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scenes`
--
ALTER TABLE `scenes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `shot_list`
--
ALTER TABLE `shot_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_api_token`
--
ALTER TABLE `user_api_token`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_member`
--
ALTER TABLE `user_member`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=507;

--
-- AUTO_INCREMENT for table `user_member_shotlist`
--
ALTER TABLE `user_member_shotlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_share`
--
ALTER TABLE `user_share`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `breaks`
--
ALTER TABLE `breaks`
  ADD CONSTRAINT `breaks_scene_id_foreign` FOREIGN KEY (`scene_id`) REFERENCES `scenes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `breaks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  ADD CONSTRAINT `cms_module_permissions_cms_module_id_foreign` FOREIGN KEY (`cms_module_id`) REFERENCES `cms_modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_module_permissions_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD CONSTRAINT `cms_users_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  ADD CONSTRAINT `cms_widget_role_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_widget_role_cms_widget_id_foreign` FOREIGN KEY (`cms_widget_id`) REFERENCES `cms_widgets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD CONSTRAINT `notification_setting_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `scenes`
--
ALTER TABLE `scenes`
  ADD CONSTRAINT `scenes_shot_list_id_foreign` FOREIGN KEY (`shot_list_id`) REFERENCES `shot_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shot_list`
--
ALTER TABLE `shot_list`
  ADD CONSTRAINT `shot_list_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_api_token`
--
ALTER TABLE `user_api_token`
  ADD CONSTRAINT `user_api_token_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_member`
--
ALTER TABLE `user_member`
  ADD CONSTRAINT `user_member_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_member_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_member_shotlist`
--
ALTER TABLE `user_member_shotlist`
  ADD CONSTRAINT `user_member_shotlist_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_member_shotlist_shot_list_id_foreign` FOREIGN KEY (`shot_list_id`) REFERENCES `shot_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_member_shotlist_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_share`
--
ALTER TABLE `user_share`
  ADD CONSTRAINT `user_share_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_share_shot_list_id_foreign` FOREIGN KEY (`shot_list_id`) REFERENCES `shot_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_share_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
