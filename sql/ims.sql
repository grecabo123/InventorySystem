-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 31, 2024 at 02:33 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(17, '2024_01_26_010106_create_tbl_branch_to_branch_table', 11),
(19, '2024_01_27_075542_create_tbl_customer_info_table', 13),
(21, '2024_01_27_075618_create_tbl_transaction_table', 14);

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_info`
--

DROP TABLE IF EXISTS `tbl_customer_info`;
CREATE TABLE IF NOT EXISTS `tbl_customer_info` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tbl_transaction` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_customer_info_tbl_transaction_foreign` (`tbl_transaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

DROP TABLE IF EXISTS `tbl_transaction`;
CREATE TABLE IF NOT EXISTS `tbl_transaction` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_serial` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `price_product` double(20,2) NOT NULL,
  `total_price` double(20,2) NOT NULL,
  `store_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_transaction_store_fk_foreign` (`store_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `username`, `secret`, `role`, `status`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'Admin', 'Admin', 'hackfb123', 1, 1, 'admin@gmail.com', NULL, '$2y$10$qsFKTQZmw6Fx.7teuFIwMuxdqPYb7gbdOHVJcNNdPNRl7vo1LLHAq', NULL, NULL, NULL),
(8, 'wemusi', 'loburegozy', 'xytykef', 'gexitoquro', 'gexitoquro', 2, 1, 'sisi@mailinator.com', NULL, '$2y$10$zJCHIrXz/EWxahAtYc3He.en1uZztqLk6uwpB0EuqvyKhyS3EF5DO', NULL, '2024-01-18 01:24:34', '2024-01-18 17:25:41'),
(9, 'zatavu', 'hokahedy', 'qimynutyk', 'zehyjamoca', 'zehyjamoca', 3, 1, 'fihopunem@mailinator.com', NULL, '$2y$10$x4paMzh9kJ5m0IgOXWcFWOi1EQpHPfMOrsJNFs34sAP6WuvpZu2i2', NULL, '2024-01-18 01:25:44', '2024-01-18 01:25:44'),
(10, 'nucicyx', 'cinarop', 'mytezoco', 'citezohy', 'citezohy', 2, 1, 'cepyru@mailinator.com', NULL, '$2y$10$0qbwF4Qmlwvj/YL9DqbzAOWdt/I5fEyUlPeNdn.ZdrvDijnHR9Qa2', NULL, '2024-01-18 01:26:04', '2024-01-18 02:19:16'),
(11, 'fawajuxa', 'wasumi', 'najikoh', 'kabira', 'kabira', 3, 1, 'limububobi@mailinator.com', NULL, '$2y$10$c3cMlIHso21txkcGusSXNuzkoZQ5oMgGqd0erKULxtnOYOwm7jS/K', NULL, '2024-01-18 02:18:27', '2024-01-18 02:18:27'),
(12, 'zyxak', 'xapyvigoze', 'vyvor', 'nuvuxa', 'nuvuxa', 2, 0, 'xuwaqo@mailinator.com', NULL, '$2y$10$pSD5u4hYDwYp17XgtPBMLewzTJ0jIXCJDPmPKmHt7uBzOEamSAMMe', NULL, '2024-01-18 17:54:32', '2024-01-18 17:54:42'),
(13, 'Jee', NULL, 'Lawengko', 'jee_12', 'jee_12', 2, 1, 'jee@gmail.com', NULL, '$2y$10$k2OEOskI/HM9jVKzjA9.keQdkATY6u6glBbMZKqztwrfSsNneVlqO', NULL, '2024-01-31 05:30:28', '2024-01-31 05:30:28'),
(14, 'Milky', NULL, 'Cute', 'milky_12', 'milky_12', 2, 1, 'milky@gmail.com', NULL, '$2y$10$mwW2r4pIu1BR2yx1e5Ujke6fyMma4T0L0m8kQQbVyPvmb3lezO/Vq', NULL, '2024-01-31 05:47:33', '2024-01-31 05:47:33');

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
-- Constraints for table `tbl_customer_info`
--
ALTER TABLE `tbl_customer_info`
  ADD CONSTRAINT `tbl_customer_info_tbl_transaction_foreign` FOREIGN KEY (`tbl_transaction`) REFERENCES `tbl_transaction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Constraints for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD CONSTRAINT `tbl_transaction_store_fk_foreign` FOREIGN KEY (`store_fk`) REFERENCES `tbl_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
