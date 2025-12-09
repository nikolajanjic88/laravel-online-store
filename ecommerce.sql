-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 09, 2025 at 02:50 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Chocolates', 'chocolates', NULL, '2025-12-04 13:39:50', 'active'),
(2, 'Liqueurs', 'liqueurs', NULL, '2025-12-04 13:59:13', 'active'),
(14, 'Toys & Games', 'toys-games', '2025-12-04 14:53:02', '2025-12-04 14:53:02', 'active'),
(15, 'Electronics', 'electronics', '2025-12-04 21:42:42', '2025-12-04 21:42:42', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE IF NOT EXISTS `category_product` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_category_id_foreign` (`category_id`),
  KEY `category_product_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(8, 1, 40, NULL, NULL),
(14, 1, 43, NULL, NULL),
(15, 1, 44, NULL, NULL),
(16, 1, 45, NULL, NULL),
(17, 1, 46, NULL, NULL),
(18, 2, 47, NULL, NULL),
(19, 2, 48, NULL, NULL),
(21, 14, 49, NULL, NULL),
(22, 14, 50, NULL, NULL),
(23, 14, 51, NULL, NULL),
(24, 14, 52, NULL, NULL),
(25, 15, 53, NULL, NULL),
(26, 15, 54, NULL, NULL),
(27, 15, 55, NULL, NULL),
(28, 15, 56, NULL, NULL),
(29, 2, 57, NULL, NULL),
(32, 14, 59, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `content`, `approved`, `created_at`, `updated_at`) VALUES
(14, 4, 52, 'Test', 1, '2025-12-08 14:44:11', '2025-12-08 14:44:11'),
(15, 9, 46, 'Mmmmmmmmmmmmmmmm', 1, '2025-12-09 11:19:35', '2025-12-09 11:19:35'),
(16, 9, 55, 'Vozim jugo i saljem sve pare kevi', 1, '2025-12-09 11:21:38', '2025-12-09 11:21:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_17_220220_create_products_table', 1),
(5, '2025_11_17_222022_create_categories_table', 1),
(6, '2025_11_17_233741_create_product_images_table', 1),
(7, '2025_11_17_233900_create_category_product_table', 1),
(8, '2025_11_18_144133_create_carts_table', 1),
(9, '2025_11_18_144151_create_cart_items_table', 1),
(10, '2025_11_18_144204_create_orders_table', 1),
(11, '2025_11_18_144415_create_order_items_table', 1),
(12, '2025_11_19_133107_add_is_admin_to_users_table', 2),
(13, '2025_11_20_164521_create_comments_table', 3),
(14, '2025_11_20_233924_add_is_featured_to_products_table', 4),
(15, '2025_11_27_125704_add_last_login_to_users_table', 5),
(16, '2025_11_28_154916_add_status_to_categories_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `status`, `payment_status`, `created_at`, `updated_at`) VALUES
(13, 4, 35.96, 'completed', 'success', '2025-12-04 14:10:28', '2025-12-08 13:58:55'),
(14, 4, 9.99, 'shipped', 'unpaid', '2025-12-04 14:11:32', '2025-12-08 14:20:00'),
(17, 4, 283.65, 'completed', 'success', '2025-12-04 21:54:40', '2025-12-08 17:24:18'),
(20, 6, 100.31, 'pending', 'unpaid', '2025-12-08 14:26:33', '2025-12-08 14:26:33'),
(21, 6, 115.89, 'pending', 'unpaid', '2025-12-08 14:27:15', '2025-12-08 14:27:15'),
(22, 7, 1126.89, 'completed', 'success', '2025-12-08 14:28:27', '2025-12-08 14:29:36'),
(23, 8, 372.81, 'completed', 'success', '2025-12-09 11:11:27', '2025-12-09 11:16:55'),
(24, 8, 136.33, 'completed', 'success', '2025-12-09 11:12:04', '2025-12-09 11:16:49'),
(25, 8, 744.92, 'completed', 'success', '2025-12-09 11:12:26', '2025-12-09 11:16:44'),
(26, 9, 537.82, 'shipped', 'unpaid', '2025-12-09 11:20:18', '2025-12-09 13:34:05');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(16, 13, 46, 3, 7.99, '2025-12-04 14:10:28', '2025-12-04 14:10:28'),
(17, 13, 43, 1, 11.99, '2025-12-04 14:10:28', '2025-12-04 14:10:28'),
(18, 14, 47, 1, 9.99, '2025-12-04 14:11:32', '2025-12-04 14:11:32'),
(28, 17, 40, 2, 7.99, '2025-12-04 21:54:40', '2025-12-04 21:54:40'),
(29, 17, 46, 3, 7.99, '2025-12-04 21:54:40', '2025-12-04 21:54:40'),
(30, 17, 45, 2, 24.99, '2025-12-04 21:54:40', '2025-12-04 21:54:40'),
(31, 17, 44, 1, 26.75, '2025-12-04 21:54:40', '2025-12-04 21:54:40'),
(32, 17, 43, 1, 11.99, '2025-12-04 21:54:40', '2025-12-04 21:54:40'),
(33, 17, 52, 1, 19.99, '2025-12-04 21:54:40', '2025-12-04 21:54:40'),
(34, 17, 53, 1, 134.99, '2025-12-04 21:54:40', '2025-12-04 21:54:40'),
(40, 20, 57, 6, 8.39, '2025-12-08 14:26:33', '2025-12-08 14:26:33'),
(41, 20, 47, 1, 9.99, '2025-12-08 14:26:33', '2025-12-08 14:26:33'),
(42, 20, 52, 2, 19.99, '2025-12-08 14:26:33', '2025-12-08 14:26:33'),
(43, 21, 43, 7, 11.99, '2025-12-08 14:27:15', '2025-12-08 14:27:15'),
(44, 21, 40, 4, 7.99, '2025-12-08 14:27:15', '2025-12-08 14:27:15'),
(45, 22, 48, 1, 24.99, '2025-12-08 14:28:27', '2025-12-08 14:28:27'),
(46, 22, 47, 1, 9.99, '2025-12-08 14:28:27', '2025-12-08 14:28:27'),
(47, 22, 54, 1, 69.99, '2025-12-08 14:28:27', '2025-12-08 14:28:27'),
(48, 22, 56, 2, 129.99, '2025-12-08 14:28:27', '2025-12-08 14:28:27'),
(49, 22, 53, 3, 134.99, '2025-12-08 14:28:27', '2025-12-08 14:28:27'),
(50, 22, 55, 1, 299.99, '2025-12-08 14:28:27', '2025-12-08 14:28:27'),
(51, 22, 50, 1, 26.99, '2025-12-08 14:28:27', '2025-12-08 14:28:27'),
(52, 22, 51, 1, 29.99, '2025-12-08 14:28:27', '2025-12-08 14:28:27'),
(53, 23, 48, 8, 24.99, '2025-12-09 11:11:27', '2025-12-09 11:11:27'),
(54, 23, 45, 5, 24.99, '2025-12-09 11:11:27', '2025-12-09 11:11:27'),
(55, 23, 46, 5, 7.99, '2025-12-09 11:11:27', '2025-12-09 11:11:27'),
(56, 23, 40, 1, 7.99, '2025-12-09 11:11:27', '2025-12-09 11:11:27'),
(57, 24, 46, 1, 7.99, '2025-12-09 11:12:04', '2025-12-09 11:12:04'),
(58, 24, 57, 1, 8.39, '2025-12-09 11:12:04', '2025-12-09 11:12:04'),
(59, 24, 47, 1, 9.99, '2025-12-09 11:12:04', '2025-12-09 11:12:04'),
(60, 24, 50, 1, 26.99, '2025-12-09 11:12:04', '2025-12-09 11:12:04'),
(61, 24, 52, 1, 19.99, '2025-12-09 11:12:04', '2025-12-09 11:12:04'),
(62, 24, 51, 1, 29.99, '2025-12-09 11:12:04', '2025-12-09 11:12:04'),
(63, 24, 49, 1, 32.99, '2025-12-09 11:12:04', '2025-12-09 11:12:04'),
(64, 25, 54, 1, 69.99, '2025-12-09 11:12:26', '2025-12-09 11:12:26'),
(65, 25, 56, 1, 129.99, '2025-12-09 11:12:26', '2025-12-09 11:12:26'),
(66, 25, 53, 1, 134.99, '2025-12-09 11:12:26', '2025-12-09 11:12:26'),
(67, 25, 55, 1, 299.99, '2025-12-09 11:12:26', '2025-12-09 11:12:26'),
(68, 25, 50, 1, 26.99, '2025-12-09 11:12:26', '2025-12-09 11:12:26'),
(69, 25, 51, 1, 29.99, '2025-12-09 11:12:26', '2025-12-09 11:12:26'),
(70, 25, 49, 1, 32.99, '2025-12-09 11:12:26', '2025-12-09 11:12:26'),
(71, 25, 52, 1, 19.99, '2025-12-09 11:12:26', '2025-12-09 11:12:26'),
(72, 26, 46, 6, 7.99, '2025-12-09 11:20:18', '2025-12-09 11:20:18'),
(73, 26, 43, 10, 11.99, '2025-12-09 11:20:18', '2025-12-09 11:20:18'),
(74, 26, 54, 1, 69.99, '2025-12-09 11:20:18', '2025-12-09 11:20:18'),
(75, 26, 55, 1, 299.99, '2025-12-09 11:20:18', '2025-12-09 11:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `is_featured`, `slug`, `created_at`, `updated_at`) VALUES
(40, 'Jack Daniel\'s Swiss Milk Chocolate Liqueur Bars - 100g Goldkenn Chocolate | Gourmet Whiskey Liquor Chocolates', 'Sugar, cocoa butter, cocoa mass, jack daniels tennessee whiskey 7%, whole MILK powder, skimmed MILK powder, butter fat (MILK), whey powder (MILK) emulsifier (rapeseed lecithin), natural vanilla extract. minimun cocoa: 37%.\r\nMay contain: Gluten, Peanuts, Soy, Tree nuts', 7.99, 0, 'jack-daniels-swiss-milk-chocolate-liqueur-bars-100g-goldkenn-chocolate-gourmet-whiskey-liquor-chocolates', '2025-12-04 00:42:33', '2025-12-04 13:52:24'),
(43, 'Ferrero Rocher Chocolate Hazelnut and Milk Chocolate Pralines, 24 Pieces, 300g', 'MILK Chocolate 30% [Sugar, Cocoa Butter, Cocoa Mass, Skimmed MILK Powder, Concentrated BUTTER, Emulsifier: Lecithins (SOYA), Vanillin), HAZELNUTS (28.5%), Sugar, Palm Oil, WHEAT Flour, Whey Powder (MILK), Fat-Reduced Cocoa, Emulsifier: Lecithins (SOYA), Raising Agent (Sodium Bicarbonate), Salt, Vanillin', 11.99, 1, 'ferrero-rocher-chocolate-hazelnut-and-milk-chocolate-pralines-24-pieces-300g', '2025-12-04 13:38:35', '2025-12-04 21:55:41'),
(44, 'Cadbury Dairy Milk Chocolate Gift Bar, The Classic Creamy Taste, Perfect for Sharing or Gifting, Extra-Large, 850 g', 'MILK**, Sugar, Cocoa Butter, Cocoa Mass, Vegetable Fats (Palm, Shea), Emulsifiers (E442, E476), Flavourings, **The equivalent of 426 ml of Fresh Liquid Milk in every 227 g of Milk Chocolate, Milk Solids 20 % minimum, actual 23 %, Cocoa Solids 20 % minimum, Contains Vegetable Fats in addition to Cocoa Butter', 26.75, 0, 'cadbury-dairy-milk-chocolate-gift-bar-the-classic-creamy-taste-perfect-for-sharing-or-gifting-extra-large-850-g', '2025-12-04 13:42:35', '2025-12-04 13:42:35'),
(45, 'Quality Street Strawberry Creams - Strawberry Quality Street | Dark Chocolate Gift Set | Strawberries & Cream Bouquet | Quality Stret Intrigue truffles 300g', 'Dark Chocolate, Sugar, Glucose Syrup, Cocoa Mass, Vegetable Fats (Palm, Shea, Coconut), Cocoa Butter, Butterfat (from Milk), Flavourings, Acid (Lactic Acid), Emulsifier (Lecithins), Dark Chocolates contains Vegetable Fats in addition to Cocoa Butter', 24.99, 0, 'quality-street-strawberry-creams-strawberry-quality-street-dark-chocolate-gift-set-strawberries-cream-bouquet-quality-stret-intrigue-truffles-christmas-gifts-for-her-him-men-women-300g', '2025-12-04 13:45:34', '2025-12-04 13:46:16'),
(46, 'E.Wedel Chocolate Gift | Happy Barrels Liqueur Chocolates Gift Box | Pack of 1 x 200g | Chocolate box with Alcoholic Filling | christmas chocolate', 'Happy Barrels Chocolate Gift - combination of a unique reciepe and a long tradition, this dessert, made with Wedel\'s chocolate and a thick alcohol filling, cannot help but lift your spirits.\r\nE.Wedel Chocolates Gift Box : Happy Barrels Dark Chocolate Barrells Filling, Pack of 1 x 200g , chocolate box', 7.99, 0, 'ewedel-chocolate-gift-happy-barrels-liqueur-chocolates-gift-box-pack-of-1-x-200g-chocolate-box-with-alcoholic-filling-christmas-chocolate', '2025-12-04 13:49:15', '2025-12-04 13:49:15'),
(47, 'ABTEY Casier Selection Chocolate Liqueurs 155g - Label 5® Whiskey, Cointreau®, St James® Rum & Bayet Cognac - 12 Assorted Chocolate Liqueurs Bottles in a Crate', 'Invert sugar syrup, sugar, cocoa paste, cocoa butter, alcohol, Cognac BAYET (1.73%), rum St James® (1.35%), Cointreau® (1.2%), Whisky Label 5® (1.15%), emulsifier: soya lecithin, vanilla extract. Cocoa min in chocolate: 51%. May contain hazelnuts and milk', 9.99, 1, 'abtey-casier-selection-chocolate-liqueurs-155g-label-5-whiskey-cointreau-st-james-rum-bayet-cognac-12-assorted-chocolate-liqueurs-bottles-in-a-crate', '2025-12-04 13:54:42', '2025-12-04 21:55:32'),
(48, 'Krupnik Salted Caramel Liqueur - Sweet and Salty Polish Creamy Liqueur Crafted from Cream, Milk and Vodka - Creamy Texture Caramel and a Touch of Salt, Perfect for Coffee and Desserts 16% ABV, 50cl', 'CREAMY AND INDULGENT: Krupnik Salted Caramel is a premium Polish liqueur made with natural ingredients including fresh milk, cream and vodka ,creating a unique creamy texture and delicious taste', 24.99, 0, 'krupnik-salted-caramel-liqueur-sweet-and-salty-polish-creamy-liqueur-crafted-from-cream-milk-and-vodka-creamy-texture-caramel-and-a-touch-of-salt-perfect-for-coffee-and-desserts-16-abv-50cl', '2025-12-04 13:58:14', '2025-12-04 13:58:14'),
(49, 'Wasgij Christmas Puzzle Advent Calendar 2025, Reindeer Rumpus! - Daily Puzzle Set, 24 Days of Puzzles, 54-Piece Brainteasing Adult Jigsaws -100% Recycled Cardboard Adults Jigsaw - Festive Countdown', 'WASGIJ CHRISTMAS COUNTDOWN: The 2025 Wasgij Advent Calendar features 24 puzzles of 54 pieces each. Behind every door is a new puzzle. Enjoy the suspense as you explore the snowy scenes and discover fun, festive surprises!\r\nSWITCH IT UP: Enjoy a different take on puzzling where you don\'t puzzle what you see, but instead you must puzzle what\'s below! Wasgij is perfect for puzzle enthusiasts, pros and novices alike.', 32.99, 0, 'wasgij-christmas-puzzle-advent-calendar-2025-reindeer-rumpus-daily-puzzle-set-24-days-of-puzzles-54-piece-brainteasing-adult-jigsaws-100-recycled-cardboard-adults-jigsaw-festive-countdown', '2025-12-04 14:52:25', '2025-12-04 14:53:11'),
(50, 'Silverlit Jiggo Interactive Dancing Pet Robot Toy for Kids with Remote Control, Sound and Touch Reactions | Colour Changing LED Face Shows Emotions | Includes Fun Mushake Game Mode | Ages 5 Plus', 'Your Playful Dancing Pet Friend: Meet JIGGO, the adorable remote-controlled pet full of life, laughter, and movement. With every shake, wiggle, and dance, JIGGO brings energy and fun to playtime, encouraging kids to move, interact, and laugh along with their new robotic buddy.\r\nTouch Activated Sounds and Reactions: Give JIGGO a gentle pat on the head to trigger cute sounds and playful responses. His lifelike reactions make every interaction personal and engaging, teaching children cause and effect while providing hours of joyful entertainment.', 26.99, 0, 'silverlit-jiggo-interactive-dancing-pet-robot-toy-for-kids-with-remote-control-sound-and-touch-reactions-colour-changing-led-face-shows-emotions-includes-fun-mushake-game-mode-ages-5-plus', '2025-12-04 14:54:32', '2025-12-04 14:54:32'),
(51, 'SilverLit 40CM Tall Huge Programme-A-Bot X, Large Gigantic Robot Kids Toy Interactive Walking, Gliding, Dancing Toy Robot 48 Commands, LED Facial Expressions and Sounds, Robots for Kids 5, 6, 7, 8', 'IT\'S AN INVASION OF THE GIGANTIC ROBOT! This programmable robot will be a top hit amongst your household, and even stands at 40cm tall\r\nCONTROL YOUR ROBOT - A robot like no other this Program A Bot X has the ability to be controlled in 3 completely different ways\r\nREMOTE CONTROL OR MOTION CONTROL - This robot is programmable with up to 48 unique commands (answering to you only!), use a fully functioning direct remote control to control his movements or use the motion control with a simple hand gesture', 29.99, 0, 'silverlit-40cm-tall-huge-programme-a-bot-x-large-gigantic-robot-kids-toy-interactive-walking-gliding-dancing-toy-robot-48-commands-led-facial-expressions-and-sounds-robots-for-kids-5-6-7-8', '2025-12-04 17:03:37', '2025-12-04 17:03:37'),
(52, 'SilverLit YCOO Robo Kombat Tornado, Interactive Robot Fighting Toy with 360° Spin & Super Tornado Punch, 2 Battle Modes AI & Multiplayer, Sound Effects, LED Power Belt, optimal for Kids 5+', '360° Spin and Super Tornado Punch: The Silverlit YCOO Robo Kombat Tornado brings robot fighting to new heights with its 360° spinning action and powerful super tornado punch; kids can activate the tornado punch when the robot’s power indicator beam turns red, delivering an epic punch combo that sends the robot spinning like a whirlwind', 19.99, 0, 'silverlit-ycoo-robo-kombat-tornado-interactive-robot-fighting-toy-with-360-spin-super-tornado-punch-2-battle-modes-ai-multiplayer-sound-effects-led-power-belt-optimal-for-kids-5', '2025-12-04 18:33:05', '2025-12-04 18:33:05'),
(53, 'Garmin Forerunner 55 GPS 42mm Running Smartwatch, Easy to use, Lightweight, Training Guidance, Safety & Tracking Features, Whitestone', 'Easy to use: Convenient and simple use. \r\nGood product with good quality. \r\nValue for money.', 134.99, 0, 'garmin-forerunner-55-gps-42mm-running-smartwatch-easy-to-use-lightweight-training-guidance-safety-tracking-features-whitestone', '2025-12-04 21:43:34', '2025-12-04 21:43:34'),
(54, 'AMAZFIT Bip 6 Smart Watch 46mm, 14 Day Battery, 1.97\" AMOLED Display, GPS & Free Maps, AI, Bluetooth Call & Text, Health, Fitness & Sleep Tracker, 140+ Workout Modes, 5 ATM Water-Resistance', 'Stylish Design, Vibrant Display: The lightweight aluminum build blends effortless style with workout durability, while the bright large 1.97\" AMOLED display keeps your data easy to read, even under bright sunlight\r\nAll-in-One Activity Tracking: The Amazfit Bip 6 fitness tracker watch offers 140+ workout modes, including HYROX Race, Strength Training, and personalized AI coaching, all with 50m water resistance', 69.99, 1, 'amazfit-bip-6-smart-watch-46mm-14-day-battery-197-amoled-display-gps-free-maps-ai-bluetooth-call-text-health-fitness-sleep-tracker-140-workout-modes-5-atm-water-resistance', '2025-12-04 21:45:49', '2025-12-04 21:55:23'),
(55, 'Sony WH-CH520 Wireless Bluetooth On-Ear Headphones, Lightweight Design, Up to 50hr Battery Life, Quick Charge, EQ, Clear Call Quality, iOS & Android - Black', 'INTRODUCING THE SONY WH-CH520: Enjoy superb sound for every song, in a style that suits you, Featuring our Digital Sound Enhancement Engine (DSEE), and so much more\r\nHIGH-QUALITY SOUND, TAILORED TO YOU: These Sony headphones feature DSEE technology to upscale every track, 360 Reality Audio, and a customisable 5 band EQ in the Sony | Sound Connect app', 299.99, 1, 'sony-wh-ch520-wireless-bluetooth-on-ear-headphones-lightweight-design-up-to-50hr-battery-life-quick-charge-eq-clear-call-quality-ios-android-black', '2025-12-04 21:48:03', '2025-12-04 21:55:14'),
(56, 'HONOR 400 Smart,5G Unlocked Mobile Phones,6.77-Inch 120Hz Eye Comfort Display,6350mAh Battery,50MP Ultra-clear Camera,Instant AI Button,4GB+256GB,5-star Drop Resistance,Dual SIM, Android 15,Black', '[6.77“ Ultra-Large Immersive Display] - Enjoy clear viewing on a big screen with a smooth 120Hz refresh rate — perfect for videos, browsing, and social media.\r\n[6350mAh Dual-Cell Battery] - Engineered to outlast, providing durability and performance for 5 years.Stay connected all day, and recharge quickly with 35W fast charging via USB-C.The typical battery capacity is 6500mAh, and the rated battery capacity is 6350mAh.', 129.99, 0, 'honor-400-smart5g-unlocked-mobile-phones677-inch-120hz-eye-comfort-display6350mah-battery50mp-ultra-clear-camerainstant-ai-button4gb256gb5-star-drop-resistancedual-sim-android-15black', '2025-12-04 21:58:25', '2025-12-04 21:58:25'),
(57, 'Fanta Orange 8 x 330 ml', 'Carbonated Water, Sugar, Orange Juice from Concentrate (3.7%), Citrus Fruit from Concentrate (1.3%), Citric Acid, Vegetable Extracts (Carrot, Pumpkin), Sweeteners (Acesulfame K, Sucralose), Preservative (Potassium Sorbate), Malic Acid, Acidity Regulator (Sodium Citrate), Stabiliser (Guar Gum), Natural Orange Flavourings with Other Natural Flavourings, Antioxidant (Ascorbic Acid)', 8.39, 0, 'fanta-orange-8-x-330-ml', '2025-12-04 22:01:22', '2025-12-04 22:01:22'),
(59, 'LEGO City F1 Driver with McLaren Race Car - Formula 1 Building Toy with a Racing Driver Minifigure - Small Birthday Gift Idea for 6+ Year Old Boys & Girls or Adult Motorsport Fans - 60442', 'LEGO F1 race car toy – Kids can dive into the excitement of high-speed racing with the LEGO City F1 Driver with McLaren Race Car building toy\r\nWhat’s in the box? – The LEGO F1 car playset includes everything kids need to build a McLaren F1 race car with a driver minifigure', 8.99, 0, 'lego-city-f1-driver-with-mclaren-race-car-formula-1-building-toy-with-a-racing-driver-minifigure-small-birthday-gift-idea-for-6-year-old-boys-girls-or-adult-motorsport-fans-60442', '2025-12-09 12:34:36', '2025-12-09 12:34:36');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `path`, `is_main`, `created_at`, `updated_at`) VALUES
(37, 40, 'products/p7xPngB9mv59Qpx1Ire1wEflt1HPcSaUo0Ip3Ss1.jpg', 1, '2025-12-04 00:42:33', '2025-12-04 13:52:24'),
(44, 43, 'products/YAcBNyHMtSQF7z38TPw8LmYdzWXSLCDRJdCjF4V9.jpg', 1, '2025-12-04 13:38:35', '2025-12-04 13:38:35'),
(45, 43, 'products/5U3YukxdLh6G1o9fvSeYvVY1wGd5HAlIojA35RGq.jpg', 0, '2025-12-04 13:38:46', '2025-12-04 13:38:46'),
(46, 43, 'products/YomDnpDHXg7dDabfcU7zIA1au7Ca2AL8JMEusrBQ.jpg', 0, '2025-12-04 13:38:53', '2025-12-04 13:38:53'),
(47, 43, 'products/3L3oeshzWlYRm40yArIDO8hPtwmdqGzoWsfo6sNt.jpg', 0, '2025-12-04 13:39:07', '2025-12-04 13:39:07'),
(48, 44, 'products/CWGPGhy9YXAVQmPBGxaVChmAp1wv1SILmTI2Wxm1.jpg', 1, '2025-12-04 13:42:35', '2025-12-04 13:42:35'),
(49, 44, 'products/ituyOczzq7HBoGkTER1uYwFM9sHHW845nNG3dzmg.jpg', 0, '2025-12-04 13:42:41', '2025-12-04 13:42:41'),
(50, 44, 'products/huaGZpIwNeEEFhFr5zYRTilaNgv7tij1OFaC7lRD.jpg', 0, '2025-12-04 13:42:46', '2025-12-04 13:42:46'),
(51, 44, 'products/SEOoBXUD9LijRTo3IEawLxnjUyly466zgg4C15ek.jpg', 0, '2025-12-04 13:42:53', '2025-12-04 13:42:53'),
(52, 45, 'products/hs1K2sdPniyEauChGA1e4JCXcuKRlppez44bzRDX.jpg', 1, '2025-12-04 13:45:34', '2025-12-04 13:45:34'),
(53, 45, 'products/diUWqOchwWI31lk9SmM5QurSm7vD7aKeC0ZgbgV8.jpg', 0, '2025-12-04 13:46:21', '2025-12-04 13:46:21'),
(54, 45, 'products/3VWajLGPhy2guFPB7YNpmqeXl7honFAcJtRPJ75F.jpg', 0, '2025-12-04 13:46:24', '2025-12-04 13:46:24'),
(55, 45, 'products/KGPdUx5C5T6gI7T3qwRaY1N6M9vKyDq1UkINkjPQ.jpg', 0, '2025-12-04 13:46:27', '2025-12-04 13:46:27'),
(56, 46, 'products/jgxMneGXRdI8Vww3eUui8NQNl8IajvzFAyE9w9BO.jpg', 1, '2025-12-04 13:49:15', '2025-12-04 13:49:15'),
(57, 46, 'products/2Ac8tJmEYjoprqvxBN6TtBphpEdT5qGx6DSknEmf.jpg', 0, '2025-12-04 13:49:28', '2025-12-04 13:49:28'),
(58, 46, 'products/bGb5bTq9PeyJV3ZLjV77v7Qe9K44mBQHswK0chnC.jpg', 0, '2025-12-04 13:49:32', '2025-12-04 13:49:32'),
(59, 46, 'products/7iz9xiB57nuFrbckdtYYGMipGoSuvWI2kYVOSohx.jpg', 0, '2025-12-04 13:49:38', '2025-12-04 13:49:38'),
(61, 40, 'products/QWoKjI2HM3n5RpWaslCqZElBja7F9qsCqvqmnJSe.jpg', 0, '2025-12-04 13:52:28', '2025-12-04 13:52:28'),
(62, 40, 'products/KQ2hdOm6sUxPXPQdWqau55XJ2YRrIKFIDATUUZ0p.jpg', 0, '2025-12-04 13:52:32', '2025-12-04 13:52:32'),
(63, 40, 'products/kMkN7JowEYboSICccrUMX8jR4FcG1jE0AZqTUFNR.jpg', 0, '2025-12-04 13:52:36', '2025-12-04 13:52:36'),
(64, 47, 'products/KGBoRIDIlw827M6NTjQes4dw6zTZYBTzGk1FUJcj.jpg', 1, '2025-12-04 13:54:42', '2025-12-04 13:54:42'),
(65, 47, 'products/Xu4ENnWcALWjfYRPUwAhLA2U82gSJm3XIKRIsRzn.jpg', 0, '2025-12-04 13:54:51', '2025-12-04 13:54:51'),
(66, 47, 'products/3cwkZELN2VwEVNogiVCzKoQ2Y58mQZwjOcMtN85Y.jpg', 0, '2025-12-04 13:54:54', '2025-12-04 13:54:54'),
(67, 47, 'products/7jxOsoA1Nq1pCUL1iQReqaL38ko2YrnLfjdearbu.jpg', 0, '2025-12-04 13:54:58', '2025-12-04 13:54:58'),
(68, 48, 'products/0JgCzeCpjQJOSVPJuHH9CFR7pDVGQJCJjpha1Rlt.jpg', 1, '2025-12-04 13:58:14', '2025-12-04 13:58:14'),
(69, 48, 'products/UImwydxCf3JlMn8CABk8u4JMhQjQncczOPuPqoTl.jpg', 0, '2025-12-04 13:58:23', '2025-12-04 13:58:23'),
(70, 48, 'products/ZdOjkCrPque6I9LnByQSv8PALLEDCeqxCdsQgr2W.jpg', 0, '2025-12-04 13:58:30', '2025-12-04 13:58:30'),
(71, 48, 'products/2YVgboqX15cZcHg9ylPdDwDB6A3BvHJjwnRbSmQK.jpg', 0, '2025-12-04 13:58:33', '2025-12-04 13:58:33'),
(72, 49, 'products/QZkE54ZNRINB09SZR6d6BSYBmsAJWjIMEbj7TpiL.jpg', 1, '2025-12-04 14:52:25', '2025-12-04 14:52:25'),
(73, 49, 'products/6FztLBY7BOeJIWK2O6ZimDhxyd5EavazlZkV4doK.jpg', 0, '2025-12-04 14:52:33', '2025-12-04 14:52:33'),
(74, 49, 'products/VkXF4McRHHyNSOttnfNHdw67h9e2Z4UUnsVJAo3S.jpg', 0, '2025-12-04 14:52:37', '2025-12-04 14:52:37'),
(75, 49, 'products/7zDryFiQQtpeVVDhbTsez6C2xetGpD66wdm1cjPa.jpg', 0, '2025-12-04 14:52:40', '2025-12-04 14:52:40'),
(76, 50, 'products/mwsCbUFPhgQsEoi2gDz6BCaigQUVUnxXiH0HRQvE.jpg', 1, '2025-12-04 14:54:32', '2025-12-04 14:54:32'),
(77, 50, 'products/oR6M75st18NvIDDoLQqZiAvqX3V0tLfo1AsfbTee.jpg', 0, '2025-12-04 14:54:40', '2025-12-04 14:54:40'),
(78, 50, 'products/GiHTnLgAMukyzsLWbDDYbQMo2VbyHfILauAyt7Op.jpg', 0, '2025-12-04 14:54:45', '2025-12-04 14:54:45'),
(79, 50, 'products/XShNxLgDqnOC7igvj9oR85Io0sy1lLFk2YDH5yGR.jpg', 0, '2025-12-04 14:54:48', '2025-12-04 14:54:48'),
(80, 51, 'products/MjSm98qQIeMDuJJbPxqNGJhu0SOhjaMSdkGdOHQP.jpg', 1, '2025-12-04 17:03:37', '2025-12-04 17:03:37'),
(81, 51, 'products/fJiZBVPWW1v5bamtgiR9Cmy0aFeBWerj24ZukWU4.jpg', 0, '2025-12-04 17:03:47', '2025-12-04 17:03:47'),
(82, 51, 'products/oxk2vZ2mZV6iboz5UG4TXKr2GWhrH6NOV9o8KiEm.jpg', 0, '2025-12-04 17:03:51', '2025-12-04 17:03:51'),
(83, 51, 'products/0Xfp5x28sqpOKklLDvWud3BKEqIkCfLthGpeTBMa.jpg', 0, '2025-12-04 17:03:53', '2025-12-04 17:03:53'),
(84, 52, 'products/PEmhq1vJ4kcqgi725XiAbBr6YqN4FcaA5LwopIjx.jpg', 1, '2025-12-04 18:33:05', '2025-12-04 18:33:05'),
(85, 52, 'products/kG4tQKkGJpPC9A4l2vBnXlasNFn2vsEPgiJ5Vv2t.jpg', 0, '2025-12-04 18:33:17', '2025-12-04 18:33:17'),
(86, 52, 'products/3ijnXKFwfIHGZPySmYqNDxw6tViwfaHv0h2rBTwO.jpg', 0, '2025-12-04 18:33:30', '2025-12-04 18:33:30'),
(87, 52, 'products/w2H9MpI0pv4EBpzElLQ6eo5LE2kFR1CgjON583GU.jpg', 0, '2025-12-04 18:33:35', '2025-12-04 18:33:35'),
(88, 53, 'products/RVZ1xHTqwqGoSo2wTKpxijmxvP3nE9BREYDIBh2N.jpg', 1, '2025-12-04 21:43:34', '2025-12-04 21:43:34'),
(89, 53, 'products/KzrNJlLzNW6mDE8fFIdAMTiyBYZEoQwV8IIywCT5.jpg', 0, '2025-12-04 21:43:40', '2025-12-04 21:43:40'),
(90, 54, 'products/OKatLkbVbTyiF1vMzBRvy3KP9z4cRfjGNbe79D97.jpg', 1, '2025-12-04 21:45:49', '2025-12-04 21:45:49'),
(91, 54, 'products/DjSiMugLZzFJjXQElGCIi5lHwKHHni5OoaTmmaTr.jpg', 0, '2025-12-04 21:45:54', '2025-12-04 21:45:54'),
(92, 54, 'products/sKvQsN1o04eQRO7R2gN5wy1wteDgS4QeORJxSIjv.jpg', 0, '2025-12-04 21:46:09', '2025-12-04 21:46:09'),
(93, 55, 'products/dBxJTEW2oRRon5i8Xan6HJthh3vaG4k3C23nX7Zc.jpg', 1, '2025-12-04 21:48:03', '2025-12-04 21:48:03'),
(94, 55, 'products/XW4AnnAuEh46j0V8yTirv1piSWJIx3CRnU1wXy2T.jpg', 0, '2025-12-04 21:48:09', '2025-12-04 21:48:09'),
(95, 55, 'products/63hG9Yb4iSZDlz31aYvRh4yrrAmNgVKmJkmX5tXA.jpg', 0, '2025-12-04 21:48:15', '2025-12-04 21:48:15'),
(96, 55, 'products/lSseyPx5YNF3ze0z9XtcKoMy3BIWLTZWGajkVHcn.jpg', 0, '2025-12-04 21:48:17', '2025-12-04 21:48:17'),
(97, 56, 'products/KLkp8NtWAnX1EWh6i8D5tIWNFbYGBJRKStnfhW5S.jpg', 1, '2025-12-04 21:58:25', '2025-12-04 21:58:25'),
(98, 56, 'products/ZjBVsv30t5cgtPrWqAcESsl2XdIPXoEJ4pmV0rZV.jpg', 0, '2025-12-04 21:58:32', '2025-12-04 21:58:32'),
(99, 56, 'products/M3KoHXPGhNTvym0sjAYv4JFiyBQaI3YAv15cTJl2.jpg', 0, '2025-12-04 21:58:34', '2025-12-04 21:58:34'),
(100, 56, 'products/U7A5zz4YQkVYLVOJ3qVQlZkjwfVtmKQHMtHWngMk.jpg', 0, '2025-12-04 21:58:37', '2025-12-04 21:58:37'),
(101, 57, 'products/4nmbAOK9AkWRgIRCu2qoihwvdgVD0A3ZhAdQpeQN.jpg', 1, '2025-12-04 22:01:22', '2025-12-04 22:01:22'),
(102, 57, 'products/hmt51Mn8662x39afh0h5xMa6h6XN08OLlM2pYDlF.jpg', 0, '2025-12-04 22:01:32', '2025-12-04 22:01:32'),
(103, 57, 'products/ztW4c6mICn6lKXEO0NxXXZjwxWRCc7aaOtuyEW8O.jpg', 0, '2025-12-04 22:01:35', '2025-12-04 22:01:35'),
(105, 59, 'products/sKYMk9mjX4Ii42J2zLF3Pa8SNHpwuVQJhNNzVaWH.jpg', 1, '2025-12-09 12:34:36', '2025-12-09 12:34:36'),
(106, 59, 'products/yDt2MkZoshOD2ZVswPhIBJKGwtswDsq3Ls4vLPH1.jpg', 0, '2025-12-09 12:34:44', '2025-12-09 12:34:44'),
(107, 59, 'products/3UByB7xpoP9wlZ9pkCWjv2I5dYZzhf0b9CpBsEG4.jpg', 0, '2025-12-09 12:34:48', '2025-12-09 12:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('11EyDCx8YinBhs6zErirk9rUo7mPcGOVIdCP2K0A', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVVd0bVowT3p5ZHJYblNnWm1GdGdFOGdZU1NoMVdoTEZydldaSlZ5byI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zY3JpcHQuanMiO3M6NToicm91dGUiO3M6MTM6InByb2R1Y3RzLnNob3ciO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=', 1765291678);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `last_login_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`, `last_login_at`) VALUES
(4, 'Nikola Janjic', 'nikola@gmail.com', NULL, '$2y$12$XWz8sCXt6nWZbJoDP9W/Be86cNu09WJYm1J1fCegHjsswqKMz.FC6', NULL, '2025-11-24 21:34:02', '2025-12-09 11:23:24', 1, '2025-12-09 11:23:24'),
(6, 'Test Testic', 'test@test.com', NULL, '$2y$12$Eof/JLVvx.lJ5rpxZ.XB8eEhjYQB0pG5aab90Hm9XRCS9EmEKEmIy', NULL, '2025-12-08 14:25:56', '2025-12-08 14:25:56', 0, NULL),
(7, 'Ronaldo Nazario da Lima', 'r9@gmail.com', NULL, '$2y$12$NUsMEHG6NrB23cZj4dUx7.MVvYIgOnHqbw7InXhO53b7hv6p5pDca', NULL, '2025-12-08 14:27:36', '2025-12-08 14:29:46', 0, '2025-12-08 14:29:46'),
(8, 'Michael Jordan', 'mj23goat@gmail.com', NULL, '$2y$12$jtjGrpdXbezYCBhsLklmnOLLa2FISviTI3mDAK0uhZJQxXYMFxUkm', NULL, '2025-12-09 11:10:26', '2025-12-09 11:10:26', 0, NULL),
(9, 'Garbiel Omar Batistuta', 'batistuta@gmail.com', NULL, '$2y$12$00u4X3xJGbtMBVzoBYhvoeMsdQ9KdcE7hTN6/nw8fds8dEyDmxVqq', NULL, '2025-12-09 11:19:26', '2025-12-09 11:19:26', 0, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
