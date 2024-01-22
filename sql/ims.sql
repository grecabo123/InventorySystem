-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 22, 2024 at 02:45 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(12, '2024_01_21_172626_create_tbl_employee_table', 7);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'admin@gmail.com_Admin', '779c81dadfcdbe38d630176b327a5c35540b6051152fe414ee92e06458c5dd97', '[\"server:admin\"]', '2024-01-17 22:33:19', '2024-01-17 22:27:12', '2024-01-17 22:33:19'),
(2, 'App\\Models\\User', 1, 'admin@gmail.com_Admin', '9e3b1f1b7b3960272881386ec6c1aabf1091d8233c581bb7d92deb17d97328bc', '[\"server:admin\"]', '2024-01-21 18:25:30', '2024-01-18 01:15:59', '2024-01-21 18:25:30'),
(3, 'App\\Models\\User', 10, 'cepyru@mailinator.com_User', '82629478d4acd8b174e3d6382df458505f350fd6f93ac25d43ad7bafb0e76460', '[\"server:manager\"]', '2024-01-21 17:52:40', '2024-01-20 18:39:08', '2024-01-21 17:52:40');

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
  `role` int(11) NOT NULL DEFAULT '0',
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
(1, 'qahoj@mailinator.com', 'fizoq@mailinator.com', 4, 3, '2024-01-21 10:07:15', '2024-01-21 10:07:15'),
(2, 'John Lester', 'jyzova@mailinator.com', 3, 3, '2024-01-21 10:09:04', '2024-01-21 10:09:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`id`, `desc`, `user_fk`, `created_at`, `updated_at`) VALUES
(1, 'Create Store Hannah Fisher', 1, '2024-01-18 13:51:37', '2024-01-18 13:51:37'),
(2, 'Create Store Leilani Dudley', 1, '2024-01-18 13:55:01', '2024-01-18 13:55:01'),
(3, 'Register Employee qahoj@mailinator.com', 10, '2024-01-21 10:07:15', '2024-01-21 10:07:15'),
(4, 'Register Employee John Lester', 10, '2024-01-21 10:09:04', '2024-01-21 10:09:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `product`, `brand`, `model`, `image`, `description`, `serial_num`, `quantity`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Electricfan', 'Camel', 'ES-9535T', 'Uploads/Files/c6c28e619941ed92f1dd4bc5c8467504.jpg', 'Voluptas est alias', '30961299', 30, 23100.00, 1, '2024-01-20 06:41:58', '2024-01-20 17:40:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_request`
--

DROP TABLE IF EXISTS `tbl_product_request`;
CREATE TABLE IF NOT EXISTS `tbl_product_request` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_of_request` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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
(2, 'Hannah Fisher', NULL, 12, '2024-01-18 13:51:37', '2024-01-19 07:43:11'),
(3, 'Leilani Dudley', NULL, 10, '2024-01-18 13:55:01', '2024-01-19 07:43:31');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_store_adr`
--

INSERT INTO `tbl_store_adr` (`id`, `region`, `province`, `city`, `streets`, `brgy`, `zipcode`, `store_fk`, `created_at`, `updated_at`) VALUES
(1, 'Cassidy Fischer', 'Farrah Coleman', 'Luke Shepherd', 'Cameron Graham', 'Amity Farmer', '231', 2, '2024-01-18 13:51:37', '2024-01-18 13:51:37'),
(2, 'Fulton French', 'Madeson Conrad', 'Vaughan Terry', 'Azalia Juarez', 'Montana Ochoa', 'Barry Robinson', 3, '2024-01-18 13:55:01', '2024-01-18 13:55:01');

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
-- Constraints for table `tbl_stores`
--
ALTER TABLE `tbl_stores`
  ADD CONSTRAINT `tbl_stores_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_store_adr`
--
ALTER TABLE `tbl_store_adr`
  ADD CONSTRAINT `tbl_store_adr_store_fk_foreign` FOREIGN KEY (`store_fk`) REFERENCES `tbl_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
