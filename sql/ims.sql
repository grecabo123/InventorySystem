-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 01, 2024 at 01:51 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(17, 'App\\Models\\User', 1, 'admin@gmail.com_Admin', 'bdc1e39ffa3f64bf34e0f540e05285c9476cde6fb271d26fbb1955258de32542', '[\"server:admin\"]', '2024-02-01 05:43:22', '2024-01-31 06:35:24', '2024-02-01 05:43:22'),
(18, 'App\\Models\\User', 15, 'corufocaba@mailinator.com_User', '5d523fc234869ed14c30225435432a526e2b5d8721ba3ced971ff0a5ed6c9228', '[\"server:manager\"]', '2024-02-01 05:42:40', '2024-01-31 06:42:40', '2024-02-01 05:42:40'),
(19, 'App\\Models\\User', 16, 'gerald@gmail.com_User', '703e5e201903c7a64ef332879487642de883ae1d759114dcde82801d05cdcc7c', '[\"server:manager\"]', '2024-02-01 05:42:34', '2024-02-01 05:32:30', '2024-02-01 05:42:34');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_address`
--

INSERT INTO `tbl_address` (`id`, `zipcode`, `city`, `streets`, `region`, `province`, `user_adr_fk`, `created_at`, `updated_at`) VALUES
(1, 8600, 'Butuan City', 'P-27 Baan Km3', 'nytomapu', 'dozys', 15, '2024-01-31 06:39:46', '2024-02-01 03:30:45'),
(2, 6000, 'Cebu City', 'Cebu City', 'Region 10', 'Cebu City', 16, '2024-02-01 05:25:06', '2024-02-01 05:25:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_branch_to_branch`
--

INSERT INTO `tbl_branch_to_branch` (`id`, `quantity`, `status`, `product_fk`, `from_store_fk`, `to_store_fk`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, 1, 2, '2024-02-01 05:39:35', '2024-02-01 05:41:32'),
(2, 5, 1, 6, 1, 2, '2024-02-01 05:39:41', '2024-02-01 05:41:36'),
(3, 5, 1, 5, 1, 2, '2024-02-01 05:39:46', '2024-02-01 05:41:41'),
(4, 1, 1, 3, 1, 2, '2024-02-01 05:39:54', '2024-02-01 05:42:20'),
(5, 1, 1, 2, 1, 2, '2024-02-01 05:40:04', '2024-02-01 05:42:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_brgy`
--

INSERT INTO `tbl_brgy` (`id`, `brgy_name`, `user_brgy_fk`, `created_at`, `updated_at`) VALUES
(1, 'Baan Km3', 15, '2024-01-31 06:39:46', '2024-02-01 03:30:45'),
(2, 'Basak', 16, '2024-02-01 05:25:06', '2024-02-01 05:25:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_customer_info`
--

INSERT INTO `tbl_customer_info` (`id`, `tbl_transaction`, `customer_name`, `customer_address`, `description`, `created_at`, `updated_at`) VALUES
(1, 3, 'vgbhnj', 'cvgbhnjm', 'cvgbhjmk', '2024-01-31 21:11:00', '2024-01-31 21:11:00'),
(2, 5, 'Chester Loyd', 'Davao City', 'He wants this product', '2024-02-01 05:36:26', '2024-02-01 05:36:26');

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
(1, 'Xavior Bugtong', 'tfgyhuji@gmail.com', 4, 1, '2024-01-31 18:54:04', '2024-01-31 18:54:04'),
(2, 'John Michael', 'john_12@gmail.com', 4, 2, '2024-02-01 05:33:10', '2024-02-01 05:33:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`id`, `desc`, `user_fk`, `created_at`, `updated_at`) VALUES
(1, 'Create Store Xerxes Dillon', 1, '2024-01-31 06:39:28', '2024-01-31 06:39:28'),
(2, 'Register Employee Xavior Bugtong', 15, '2024-01-31 18:54:04', '2024-01-31 18:54:04'),
(3, 'Distribute Item Kermit Drake To Xerxes Dillon 10', 1, '2024-01-31 18:54:13', '2024-01-31 18:54:13'),
(4, 'Customer  tybhnj Bought Kermit Drake  1 PC', 15, '2024-01-31 19:21:01', '2024-01-31 19:21:01'),
(5, 'Create Store Jaime Joyner', 1, '2024-01-31 19:54:12', '2024-01-31 19:54:12'),
(6, 'Customer  vgbhnj Bought Kermit Drake  2 PCS', 15, '2024-01-31 21:06:51', '2024-01-31 21:06:51'),
(7, 'Customer  vgbhnj Bought Kermit Drake  2 PCS', 15, '2024-01-31 21:11:00', '2024-01-31 21:11:00'),
(8, 'Account Updated corufocaba@mailinator.com', 1, '2024-02-01 05:24:01', '2024-02-01 05:24:01'),
(9, 'Create Store Claver Branch', 1, '2024-02-01 05:27:45', '2024-02-01 05:27:45'),
(10, 'Distribute Item Dell Laptop To Butuan City 5', 1, '2024-02-01 05:29:11', '2024-02-01 05:29:11'),
(11, 'Distribute Item G4M 15 Active DSP Speaker To Butuan City 8', 1, '2024-02-01 05:29:17', '2024-02-01 05:29:17'),
(12, 'Distribute Item Hanabishi Buildmate Electric Fan To Butuan City 3', 1, '2024-02-01 05:29:21', '2024-02-01 05:29:21'),
(13, 'Distribute Item Mackie Thump215 To Butuan City 13', 1, '2024-02-01 05:29:32', '2024-02-01 05:29:32'),
(14, 'Distribute Item Sonos Roam To Butuan City 9', 1, '2024-02-01 05:29:41', '2024-02-01 05:29:41'),
(15, 'Distribute Item TCL UHD 50P635 50-INCH To Butuan City 2', 1, '2024-02-01 05:30:02', '2024-02-01 05:30:02'),
(16, 'Distribute Item Dell Laptop To Bayugan City 5', 1, '2024-02-01 05:30:52', '2024-02-01 05:30:52'),
(17, 'Distribute Item Hanabishi Buildmate Electric Fan To Bayugan City 3', 1, '2024-02-01 05:30:56', '2024-02-01 05:30:56'),
(18, 'Distribute Item Samsung Refrigerator To Bayugan City 4', 1, '2024-02-01 05:31:05', '2024-02-01 05:31:05'),
(19, 'Distribute Item Sonos Roam To Bayugan City 8', 1, '2024-02-01 05:31:11', '2024-02-01 05:31:11'),
(20, 'Register Employee John Michael', 16, '2024-02-01 05:33:10', '2024-02-01 05:33:10'),
(21, 'Customer  Chester Loyd Bought Dell Laptop  1 PC', 15, '2024-02-01 05:36:26', '2024-02-01 05:36:26');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `product`, `brand`, `model`, `image`, `description`, `serial_num`, `quantity`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kermit Drake', 'Quentin Wooten', '2010', 'Uploads/Files/92c19393cc6e8f959b98c23009944294.jpg', 'Voluptas facilis deb', '654321234', 0, 12130.00, 1, '2024-01-31 06:39:10', '2024-02-01 04:40:20'),
(2, 'Hanabishi Buildmate Electric Fan', 'Hanabishi', '2011', 'Uploads/Files/469b7d48928d8ae6ee3c4043bc2a29c3.jpg', 'One highlighted feature of the said brand is the number of blades. Since having only three blades for an electric fan is typical, it still offers strong wind with a power consumption of 80W. Lastly, it has a radius that gives you a significant circular movement.', '6320134613', 4, 1420.00, 1, '2024-02-01 04:19:13', '2024-02-01 05:30:56'),
(3, 'TCL UHD 50P635 50-INCH', 'Smart Screen', '2022', 'Uploads/Files/de439af0bc9a6c1f6f0bd28352486cb8.png', 'An internet enabled TV which connects to your favourite streaming platforms for endless enjoyment of your favourite content', '5353621563', 4, 14290.00, 1, '2024-02-01 04:26:50', '2024-02-01 05:30:02'),
(4, 'Samsung Refrigerator', 'Samsung', '2024', 'Uploads/Files/f35a3a53d18cbaf2f95e7eea4b1321ec.png', 'Samsung has long been known for making high quality electronics and appliances, and it’s one of the best refrigerator brands in 2024 because of the smarts its refrigerator lineup offers. Samsung’s smart features include Family Hub, which lets you see inside the refrigerator, manage your family’s calendars, and stream music on a display on the refrigerator door.', '6231235213', 6, 42899.00, 1, '2024-02-01 04:32:18', '2024-02-01 05:31:05'),
(5, 'G4M 15 Active DSP Speaker', 'G4M', '2023', 'Uploads/Files/a84962f9e2ac41ebc094fa3f2672bb06.jpg', 'This brand specialise in high-quality products designed for intermediate and professional musicians, producers, and engineers. And the range of offerings is broad, including guitars, basses, amplifiers, keyboards, pianos, microphones, and outboard gear.', '92632137321', 2, 15500.00, 1, '2024-02-01 04:34:51', '2024-02-01 05:29:17'),
(6, 'Mackie Thump215', 'Mackie', '1988', 'Uploads/Files/9c1e0843fbf18ebe46e9b73c6e24eb58.jpg', 'Mackie Thump215 15″ Active PA Speaker is a new version of their flagship speaker, offering a 1400W Class D amplifier and a maximum sound output of 129 dB SPL. There’s also DSP in the form of the Feedback Eliminator and Music Ducking modes.', '7342543274', 7, 8499.00, 1, '2024-02-01 04:36:44', '2024-02-01 05:29:32'),
(7, 'Sonos Roam', 'Sony', '2022', 'Uploads/Files/e72fdf1a2ae3eb239c97c5c403d35f14.png', 'Sonos Roam delivers powerful sound for a small box, a rugged design that can take a tumble, excellent connectivity features (including Wi-Fi as well as Bluetooth) and even smart home control.', '532643257', 8, 3849.00, 1, '2024-02-01 04:39:27', '2024-02-01 05:31:10'),
(8, 'Dell Laptop', 'Dell', '203421', 'Uploads/Files/b078683f4d080b282341abc226e6d678.jpeg', 'XPS models, which do everything to a high standard. They have the latest high-resolution screens, connections, and software, as well as innovative materials. The XPS 13 is no exception, now with two versions. One, the XPS 13 9315', '126421465', 5, 20000.00, 1, '2024-02-01 04:45:00', '2024-02-01 05:30:52');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_product_travel`
--

INSERT INTO `tbl_product_travel` (`id`, `description`, `quantity`, `status`, `type_of_request`, `product_fk`, `store_fk`, `created_at`, `updated_at`) VALUES
(1, NULL, 10, 1, 2, 1, 1, '2024-01-31 18:54:13', '2024-01-31 18:54:31'),
(2, NULL, 5, 1, 2, 8, 1, '2024-02-01 05:29:11', '2024-02-01 05:34:10'),
(3, NULL, 8, 1, 2, 5, 1, '2024-02-01 05:29:17', '2024-02-01 05:34:32'),
(4, NULL, 3, 1, 2, 2, 1, '2024-02-01 05:29:21', '2024-02-01 05:34:16'),
(5, NULL, 13, 1, 2, 6, 1, '2024-02-01 05:29:32', '2024-02-01 05:34:36'),
(6, NULL, 9, 1, 2, 7, 1, '2024-02-01 05:29:41', '2024-02-01 05:34:38'),
(7, NULL, 2, 1, 2, 3, 1, '2024-02-01 05:30:02', '2024-02-01 05:34:41'),
(8, NULL, 5, 2, 2, 8, 2, '2024-02-01 05:30:52', '2024-02-01 05:30:52'),
(9, NULL, 3, 2, 2, 2, 2, '2024-02-01 05:30:56', '2024-02-01 05:30:56'),
(10, NULL, 4, 2, 2, 4, 2, '2024-02-01 05:31:05', '2024-02-01 05:31:05'),
(11, NULL, 8, 2, 2, 7, 2, '2024-02-01 05:31:11', '2024-02-01 05:31:11');

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
(1, 'Butuan City', NULL, 15, '2024-01-31 06:39:28', '2024-02-01 05:22:47'),
(2, 'Bayugan City', NULL, 16, '2024-01-31 19:54:12', '2024-02-01 05:25:24'),
(3, 'Claver Branch', NULL, NULL, '2024-02-01 05:27:45', '2024-02-01 05:27:45');

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
(1, 'Myra Wilson', 'Agusan Del Norte', 'Butuan City', 'Remedios Holder', 'Wynne Griffin', '8600', 1, '2024-01-31 06:39:28', '2024-02-01 05:22:47'),
(2, 'George Decker', 'Agusan del Sur', 'Bayugan City', 'Danielle Dillard', 'Kieran Albert', '9011', 2, '2024-01-31 19:54:12', '2024-02-01 05:26:15'),
(3, 'Davao', 'Davao Del Sur', 'Davao City', 'Davao', 'Davao', '8000', 3, '2024-02-01 05:27:45', '2024-02-01 05:27:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_stor_product`
--

INSERT INTO `tbl_stor_product` (`id`, `store_fk`, `product_fk`, `pcs`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 1, '2024-01-31 18:54:31', '2024-02-01 05:39:35'),
(2, 1, 8, 3, 1, '2024-02-01 05:34:10', '2024-02-01 05:36:26'),
(3, 1, 2, 2, 1, '2024-02-01 05:34:16', '2024-02-01 05:40:04'),
(4, 1, 5, 3, 1, '2024-02-01 05:34:32', '2024-02-01 05:39:46'),
(5, 1, 6, 8, 1, '2024-02-01 05:34:36', '2024-02-01 05:39:41'),
(6, 1, 7, 9, 1, '2024-02-01 05:34:38', '2024-02-01 05:34:38'),
(7, 1, 3, 1, 1, '2024-02-01 05:34:41', '2024-02-01 05:39:54'),
(8, 2, 1, 3, 1, '2024-02-01 05:41:32', '2024-02-01 05:41:32'),
(9, 2, 6, 5, 1, '2024-02-01 05:41:36', '2024-02-01 05:41:36'),
(10, 2, 5, 5, 1, '2024-02-01 05:41:41', '2024-02-01 05:41:41'),
(11, 2, 3, 1, 1, '2024-02-01 05:42:20', '2024-02-01 05:42:20'),
(12, 2, 2, 1, 1, '2024-02-01 05:42:23', '2024-02-01 05:42:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_transaction`
--

INSERT INTO `tbl_transaction` (`id`, `invoice_id`, `product_name`, `product_brand`, `product_model`, `product_serial`, `quantity`, `price_product`, `total_price`, `store_fk`, `created_at`, `updated_at`) VALUES
(1, '020124-7079520', 'Kermit Drake', 'Quentin Wooten', 'Herman Trevino', '654321234', 1, 12130.00, 12130.00, 1, '2024-01-31 19:21:01', '2024-01-31 19:21:01'),
(2, '020124-5733987', 'Kermit Drake', 'Quentin Wooten', 'Herman Trevino', '654321234', 2, 12130.00, 24260.00, 1, '2024-01-31 21:06:51', '2024-01-31 21:06:51'),
(3, '020124-6672979', 'Kermit Drake', 'Quentin Wooten', 'Herman Trevino', '654321234', 2, 12130.00, 24260.00, 1, '2024-01-31 21:11:00', '2024-01-31 21:11:00'),
(4, '020124-8136138', 'Dell Laptop', 'Dell', '203421', '126421465', 1, 20000.00, 20000.00, 1, '2024-02-01 05:36:09', '2024-02-01 05:36:09'),
(5, '020124-5548859', 'Dell Laptop', 'Dell', '203421', '126421465', 1, 20000.00, 20000.00, 1, '2024-02-01 05:36:26', '2024-02-01 05:36:26');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(14, 'Milky', NULL, 'Cute', 'milky_12', 'milky_12', 2, 1, 'milky@gmail.com', NULL, '$2y$10$mwW2r4pIu1BR2yx1e5Ujke6fyMma4T0L0m8kQQbVyPvmb3lezO/Vq', NULL, '2024-01-31 05:47:33', '2024-01-31 05:47:33'),
(15, 'John Carl', NULL, 'lasagna', 'qwerty_12', 'qatihij', 2, 1, 'corufocaba@mailinator.com', NULL, '$2y$10$1ntPyNgJGqa0UJgdnbsc9eL8E3Nd7i6S7IQ8YBotOBLgblZfOGvpC', NULL, '2024-01-31 06:39:46', '2024-02-01 05:24:01'),
(16, 'Gerald', NULL, 'Pajudas', 'gerald_12', 'gerald_12', 2, 1, 'gerald@gmail.com', NULL, '$2y$10$xmG0Xyy1.Lnw0.tj8djsf.EccTpLmrvhnIdzNBJ8MGbx0tpJeC/cS', NULL, '2024-02-01 05:25:06', '2024-02-01 05:25:06');

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
