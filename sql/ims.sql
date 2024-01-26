-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 26, 2024 at 03:26 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ims`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_18_061022_create_tbl_stores_table', 1),
(6, '2024_01_18_061342_create_tbl_product_request_table', 1),
(7, '2024_01_18_083604_create_tbl_brgy_table', 2),
(8, '2024_01_18_083811_create_tbl_address_table', 3),
(9, '2024_01_18_213524_create_tbl_store_adr_table', 4),
(10, '2024_01_18_214236_create_tbl_logs_table', 5),
(11, '2024_01_20_013508_create_tbl_product_table', 6),
(12, '2024_01_21_172626_create_tbl_employee_table', 7),
(13, '2024_01_24_154758_create_tbl_stor_product_table', 8),
(15, '2024_01_24_234959_create_tbl_product_travel_table', 9),
(16, '2024_01_25_054553_create_tbl_reports_table', 10),
(17, '2024_01_26_010106_create_tbl_branch_to_branch_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(7, 'App\\Models\\User', 1, 'admin@gmail.com_Admin', '1f18409c3eea24df9ba6688eade830c6211f73493df291e8f6fc94e9f17f2a64', '[\"server:admin\"]', '2024-01-25 19:16:01', '2024-01-23 03:37:52', '2024-01-25 19:16:01'),
(8, 'App\\Models\\User', 8, 'sisi@mailinator.com_User', '51678fc8a32ceb62c4b9933afcb1597e7560ac07eca374445601e2f91fb2f766', '[\"server:manager\"]', '2024-01-25 19:13:50', '2024-01-25 04:54:01', '2024-01-25 19:13:50'),
(9, 'App\\Models\\User', 10, 'cepyru@mailinator.com_User', '9b5edb437da942579bf47cbb0cdbd714dbede9778b894551b8df54bfd16f2930', '[\"server:manager\"]', '2024-01-25 19:18:00', '2024-01-25 19:16:56', '2024-01-25 19:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_address`
--

DROP TABLE IF EXISTS `tbl_address`;
CREATE TABLE IF NOT EXISTS `tbl_address` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zipcode` int(20) NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `streets` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_adr_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_adr_fk` (`user_adr_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_address`
--

INSERT INTO `tbl_address` (`id`, `zipcode`, `city`, `streets`, `region`, `province`, `user_adr_fk`, `created_at`, `updated_at`) VALUES
(3, 2321, 'tedet', 'byvulem', 'mujyqil', 'duxanipybu', 8, '2024-01-18 01:24:34', '2024-01-18 01:24:34'),
(4, 2323, 'lyvywahy', 'ralan', 'bobaqod', 'narygit', 9, '2024-01-18 01:25:44', '2024-01-18 01:25:44'),
(5, 232, 'zokeze', 'rinuhus', 'daxymaj', 'bysavij', 10, '2024-01-18 01:26:04', '2024-01-18 01:26:04'),
(6, 2345, 'faquzubat', 'typon', 'honum', 'hasiqajal', 11, '2024-01-18 02:18:27', '2024-01-18 02:18:27'),
(7, 2112, 'fizonorib', 'rihamaji', 'wiwuka', 'bazenoto', 12, '2024-01-18 17:54:32', '2024-01-18 17:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_branch_to_branch`
--

DROP TABLE IF EXISTS `tbl_branch_to_branch`;
CREATE TABLE IF NOT EXISTS `tbl_branch_to_branch` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `product_fk` bigint(20) UNSIGNED NOT NULL,
  `from_store_fk` bigint(20) UNSIGNED NOT NULL,
  `to_store_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_branch_to_branch_product_fk_foreign` (`product_fk`),
  KEY `tbl_branch_to_branch_from_store_fk_foreign` (`from_store_fk`),
  KEY `tbl_branch_to_branch_to_store_fk_foreign` (`to_store_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_branch_to_branch`
--

INSERT INTO `tbl_branch_to_branch` (`id`, `quantity`, `status`, `product_fk`, `from_store_fk`, `to_store_fk`, `created_at`, `updated_at`) VALUES
(1, 10, 2, 1, 1, 2, '2024-01-25 17:32:20', '2024-01-25 17:32:20'),
(2, 9, 2, 2, 1, 3, '2024-01-25 17:32:58', '2024-01-25 17:32:58'),
(3, 8, 2, 3, 1, 2, '2024-01-25 19:07:43', '2024-01-25 19:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brgy`
--

DROP TABLE IF EXISTS `tbl_brgy`;
CREATE TABLE IF NOT EXISTS `tbl_brgy` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brgy_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_brgy_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_brgy_user_brgy_fk_foreign` (`user_brgy_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_brgy`
--

INSERT INTO `tbl_brgy` (`id`, `brgy_name`, `user_brgy_fk`, `created_at`, `updated_at`) VALUES
(7, 'ruboxubula', 8, '2024-01-18 01:24:34', '2024-01-18 01:24:34'),
(8, 'caqodi', 9, '2024-01-18 01:25:44', '2024-01-18 01:25:44'),
(9, 'xuwahurym', 10, '2024-01-18 01:26:04', '2024-01-18 01:26:04'),
(10, 'zevexinej', 11, '2024-01-18 02:18:27', '2024-01-18 02:18:27'),
(11, 'fecuviloz', 12, '2024-01-18 17:54:32', '2024-01-18 17:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

DROP TABLE IF EXISTS `tbl_employee`;
CREATE TABLE IF NOT EXISTS `tbl_employee` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT '0' COMMENT '3=employee, 4 = Driver',
  `store_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_employee_store_fk_foreign` (`store_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`id`, `employee`, `email`, `role`, `store_fk`, `created_at`, `updated_at`) VALUES
(1, 'Michael Labon', 'labon@gmail.com', 4, 1, '2024-01-25 04:55:13', '2024-01-25 04:55:13'),
(2, 'Shiela May', 'may@gmail.com', 3, 1, '2024-01-25 04:55:43', '2024-01-25 04:55:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

DROP TABLE IF EXISTS `tbl_logs`;
CREATE TABLE IF NOT EXISTS `tbl_logs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_logs_user_fk_foreign` (`user_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`id`, `desc`, `user_fk`, `created_at`, `updated_at`) VALUES
(1, 'Create Store Hannah Fisher', 1, '2024-01-18 13:51:37', '2024-01-18 13:51:37'),
(2, 'Create Store Leilani Dudley', 1, '2024-01-18 13:55:01', '2024-01-18 13:55:01'),
(3, 'Register Employee qahoj@mailinator.com', 10, '2024-01-21 10:07:15', '2024-01-21 10:07:15'),
(4, 'Register Employee John Lester', 10, '2024-01-21 10:09:04', '2024-01-21 10:09:04'),
(5, 'Distribute Item Electricfan To Hannah Fisher', 1, '2024-01-24 08:03:10', '2024-01-24 08:03:10'),
(6, 'Distribute Item Electricfan To Hannah Fisher', 1, '2024-01-24 08:07:58', '2024-01-24 08:07:58'),
(7, 'Distribute Item Electricfan To Hannah Fisher', 1, '2024-01-24 08:08:43', '2024-01-24 08:08:43'),
(8, 'Distribute Item Electricfan To Hannah Fisher', 1, '2024-01-24 08:08:58', '2024-01-24 08:08:58'),
(9, 'Distribute Item Electricfan To Hannah Fisher 13', 1, '2024-01-24 16:20:50', '2024-01-24 16:20:50'),
(10, 'Distribute Item Electricfan To Leilani Dudley 3', 1, '2024-01-24 16:37:33', '2024-01-24 16:37:33'),
(11, 'Distribute Item Electricfan To Hannah Fisher 1', 1, '2024-01-24 16:39:41', '2024-01-24 16:39:41'),
(12, 'Create Store Butuan Branch', 1, '2024-01-25 04:49:29', '2024-01-25 04:49:29'),
(13, 'Create Store Bayugan City', 1, '2024-01-25 04:50:56', '2024-01-25 04:50:56'),
(14, 'Create Store Cabadbaran City', 1, '2024-01-25 04:51:48', '2024-01-25 04:51:48'),
(15, 'Register Employee Michael Labon', 8, '2024-01-25 04:55:13', '2024-01-25 04:55:13'),
(16, 'Register Employee Shiela May', 8, '2024-01-25 04:55:43', '2024-01-25 04:55:43'),
(17, 'Distribute Item Electricfan To Butuan Branch 20', 1, '2024-01-25 05:07:28', '2024-01-25 05:07:28'),
(18, 'Distribute Item Yvonne Bradley To Butuan Branch 14', 1, '2024-01-25 05:11:00', '2024-01-25 05:11:00'),
(19, 'Distribute Item Refrigerator To Butuan Branch 13', 1, '2024-01-25 18:56:26', '2024-01-25 18:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE IF NOT EXISTS `tbl_product` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_num` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` bigint(20) NOT NULL,
  `price` double(20,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `product`, `brand`, `model`, `image`, `description`, `serial_num`, `quantity`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Electricfan Power', 'Pensonic', 'FA4#35G', 'Uploads/Files/2513da7f8fb72d7e70d5a3a889a8e44f.jpg', 'Good Product', '#52346F3124', 30, 14000.00, 1, '2024-01-25 05:00:41', '2024-01-25 19:01:28'),
(2, 'Yvonne Bradley', 'Powers', 'India Brew', 'Uploads/Files/a288482e681464ebc2ae2839ca2429ba.jpeg', 'Velit dignissimos ul', '#1358AD32', 37, 21000.00, 1, '2024-01-25 05:06:07', '2024-01-25 05:11:00'),
(3, 'Refrigerator', 'Pensonic', 'Sample', 'Uploads/Files/eec58487b5ba23e825844480212185c7.jpg', 'Good Quality', 'F3215412', 2, 25000.00, 1, '2024-01-25 18:53:28', '2024-01-25 18:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_travel`
--

DROP TABLE IF EXISTS `tbl_product_travel`;
CREATE TABLE IF NOT EXISTS `tbl_product_travel` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `type_of_request` tinyint(4) NOT NULL DEFAULT '0',
  `product_fk` bigint(20) UNSIGNED NOT NULL,
  `store_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_product_travel_product_fk_foreign` (`product_fk`),
  KEY `tbl_product_travel_store_fk_foreign` (`store_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_product_travel`
--

INSERT INTO `tbl_product_travel` (`id`, `description`, `quantity`, `status`, `type_of_request`, `product_fk`, `store_fk`, `created_at`, `updated_at`) VALUES
(1, 'Please Sell ko ani', 20, 1, 2, 1, 1, '2024-01-25 05:07:28', '2024-01-25 05:14:58'),
(2, 'Good Product', 14, 1, 2, 2, 1, '2024-01-25 05:11:00', '2024-01-25 05:19:18'),
(3, 'Paki sell ko ani', 13, 1, 2, 3, 1, '2024-01-25 18:56:26', '2024-01-25 19:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reports`
--

DROP TABLE IF EXISTS `tbl_reports`;
CREATE TABLE IF NOT EXISTS `tbl_reports` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status_report` tinyint(4) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_fk` bigint(20) UNSIGNED NOT NULL,
  `store_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_reports_product_fk_foreign` (`product_fk`),
  KEY `tbl_reports_store_fk_foreign` (`store_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stores`
--

DROP TABLE IF EXISTS `tbl_stores`;
CREATE TABLE IF NOT EXISTS `tbl_stores` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_fk` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_stores_user_fk_foreign` (`user_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_stores`
--

INSERT INTO `tbl_stores` (`id`, `store_name`, `image`, `user_fk`, `created_at`, `updated_at`) VALUES
(1, 'Butuan Branch', NULL, 8, '2024-01-25 04:49:29', '2024-01-25 04:53:14'),
(2, 'Bayugan City', NULL, 10, '2024-01-25 04:50:56', '2024-01-25 19:15:50'),
(3, 'Cabadbaran City', NULL, NULL, '2024-01-25 04:51:48', '2024-01-25 04:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store_adr`
--

DROP TABLE IF EXISTS `tbl_store_adr`;
CREATE TABLE IF NOT EXISTS `tbl_store_adr` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `streets` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brgy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_store_adr_store_fk_foreign` (`store_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_store_adr`
--

INSERT INTO `tbl_store_adr` (`id`, `region`, `province`, `city`, `streets`, `brgy`, `zipcode`, `store_fk`, `created_at`, `updated_at`) VALUES
(1, 'Region 13', 'Agusan Del Norte', 'Butuan City', 'Baan Km3', 'Baan', '8600', 1, '2024-01-25 04:49:29', '2024-01-25 04:49:29'),
(2, 'Region 10', 'Bayugan', 'Bayugan City', 'Bayugan', 'Bayugan', '8000', 2, '2024-01-25 04:50:56', '2024-01-25 04:50:56'),
(3, 'Region 7', 'Agusan Del Sur', 'Butuan City', 'Cabadbaran City', 'Cabadbaran City', '8100', 3, '2024-01-25 04:51:48', '2024-01-25 04:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stor_product`
--

DROP TABLE IF EXISTS `tbl_stor_product`;
CREATE TABLE IF NOT EXISTS `tbl_stor_product` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_fk` bigint(20) UNSIGNED NOT NULL,
  `product_fk` bigint(20) UNSIGNED NOT NULL,
  `pcs` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_stor_product_store_fk_foreign` (`store_fk`),
  KEY `tbl_stor_product_product_fk_foreign` (`product_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_stor_product`
--

INSERT INTO `tbl_stor_product` (`id`, `store_fk`, `product_fk`, `pcs`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 1, '2024-01-25 05:14:58', '2024-01-25 17:32:20'),
(2, 1, 2, 5, 1, '2024-01-25 05:19:18', '2024-01-25 17:32:58'),
(3, 1, 3, 5, 1, '2024-01-25 19:00:11', '2024-01-25 19:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `username`, `secret`, `role`, `status`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'Admin', 'Admin', 'hackfb123', 1, 1, 'admin@gmail.com', NULL, '$2y$10$qsFKTQZmw6Fx.7teuFIwMuxdqPYb7gbdOHVJcNNdPNRl7vo1LLHAq', NULL, NULL, NULL),
(8, 'wemusi', 'loburegozy', 'xytykef', 'gexitoquro', 'gexitoquro', 2, 1, 'sisi@mailinator.com', NULL, '$2y$10$zJCHIrXz/EWxahAtYc3He.en1uZztqLk6uwpB0EuqvyKhyS3EF5DO', NULL, '2024-01-18 01:24:34', '2024-01-18 17:25:41'),
(9, 'zatavu', 'hokahedy', 'qimynutyk', 'zehyjamoca', 'zehyjamoca', 3, 1, 'fihopunem@mailinator.com', NULL, '$2y$10$x4paMzh9kJ5m0IgOXWcFWOi1EQpHPfMOrsJNFs34sAP6WuvpZu2i2', NULL, '2024-01-18 01:25:44', '2024-01-18 01:25:44'),
(10, 'nucicyx', 'cinarop', 'mytezoco', 'citezohy', 'citezohy', 2, 1, 'cepyru@mailinator.com', NULL, '$2y$10$0qbwF4Qmlwvj/YL9DqbzAOWdt/I5fEyUlPeNdn.ZdrvDijnHR9Qa2', NULL, '2024-01-18 01:26:04', '2024-01-18 02:19:16'),
(11, 'fawajuxa', 'wasumi', 'najikoh', 'kabira', 'kabira', 3, 1, 'limububobi@mailinator.com', NULL, '$2y$10$c3cMlIHso21txkcGusSXNuzkoZQ5oMgGqd0erKULxtnOYOwm7jS/K', NULL, '2024-01-18 02:18:27', '2024-01-18 02:18:27'),
(12, 'zyxak', 'xapyvigoze', 'vyvor', 'nuvuxa', 'nuvuxa', 2, 0, 'xuwaqo@mailinator.com', NULL, '$2y$10$pSD5u4hYDwYp17XgtPBMLewzTJ0jIXCJDPmPKmHt7uBzOEamSAMMe', NULL, '2024-01-18 17:54:32', '2024-01-18 17:54:42');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD CONSTRAINT `tbl_address_ibfk_1` FOREIGN KEY (`user_adr_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_branch_to_branch`
--
ALTER TABLE `tbl_branch_to_branch`
  ADD CONSTRAINT `tbl_branch_to_branch_from_store_fk_foreign` FOREIGN KEY (`from_store_fk`) REFERENCES `tbl_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_branch_to_branch_product_fk_foreign` FOREIGN KEY (`product_fk`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_branch_to_branch_to_store_fk_foreign` FOREIGN KEY (`to_store_fk`) REFERENCES `tbl_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_brgy`
--
ALTER TABLE `tbl_brgy`
  ADD CONSTRAINT `tbl_brgy_user_brgy_fk_foreign` FOREIGN KEY (`user_brgy_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD CONSTRAINT `tbl_employee_store_fk_foreign` FOREIGN KEY (`store_fk`) REFERENCES `tbl_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD CONSTRAINT `tbl_logs_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_product_travel`
--
ALTER TABLE `tbl_product_travel`
  ADD CONSTRAINT `tbl_product_travel_product_fk_foreign` FOREIGN KEY (`product_fk`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_product_travel_store_fk_foreign` FOREIGN KEY (`store_fk`) REFERENCES `tbl_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  ADD CONSTRAINT `tbl_reports_product_fk_foreign` FOREIGN KEY (`product_fk`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_reports_store_fk_foreign` FOREIGN KEY (`store_fk`) REFERENCES `tbl_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_stores`
--
ALTER TABLE `tbl_stores`
  ADD CONSTRAINT `tbl_stores_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_store_adr`
--
ALTER TABLE `tbl_store_adr`
  ADD CONSTRAINT `tbl_store_adr_store_fk_foreign` FOREIGN KEY (`store_fk`) REFERENCES `tbl_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_stor_product`
--
ALTER TABLE `tbl_stor_product`
  ADD CONSTRAINT `tbl_stor_product_product_fk_foreign` FOREIGN KEY (`product_fk`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_stor_product_store_fk_foreign` FOREIGN KEY (`store_fk`) REFERENCES `tbl_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
