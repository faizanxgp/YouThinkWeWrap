-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2017 at 11:29 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ytww`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `job_title` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `job_title`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ayaz', '', 'test11@yahoo.com', '$2y$10$ZL1F/FY3fE7goRjY1iCqMugRcyTM5n01LUdI9iKRI5pXjIHYx1mRC', 'TFd94njL3p3l7k2MToU5Qsxumztt379odaHwxQRoy4F0KzO7gDksVM84BsIx', '2017-06-05 03:02:35', '2017-06-05 03:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Category 1', 'category-1', 'Description of Category 1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Category 2', 'category-2', 'Test Category 2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Cat 5', 'safdasdf', 'sadfasfasfdasfd', '', '0000-00-00 00:00:00', '2017-06-13 10:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, 4, '2017-06-13 09:56:48', '2017-06-13 09:56:48'),
(10, 2, 3, '2017-06-13 09:57:00', '2017-06-13 09:57:00'),
(11, 5, 3, '2017-06-13 09:57:00', '2017-06-13 09:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `country` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `user_id`, `name`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 34, 'aa', 'bb', 'cc', 'dd', '', 'ee', '', '009230012323223', '', '2017-06-20 09:12:38', '2017-06-20 09:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `order_amount` decimal(10,2) NOT NULL,
  `coupon` varchar(20) NOT NULL,
  `instruction` text NOT NULL,
  `event` int(11) NOT NULL,
  `basket_design` int(11) NOT NULL,
  `package` int(11) NOT NULL,
  `tags_handwritten` varchar(255) NOT NULL,
  `tags_image` varchar(255) NOT NULL,
  `color1` varchar(10) NOT NULL,
  `color2` varchar(10) NOT NULL,
  `delivery_method` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `order_status` varchar(10) NOT NULL,
  `order_notes` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_date`, `delivery_date`, `order_amount`, `coupon`, `instruction`, `event`, `basket_design`, `package`, `tags_handwritten`, `tags_image`, `color1`, `color2`, `delivery_method`, `payment_method`, `order_status`, `order_notes`, `created_at`, `updated_at`) VALUES
(1, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:02:56', '2017-06-20 09:02:56'),
(2, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:04:07', '2017-06-20 09:04:07'),
(3, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:05:40', '2017-06-20 09:05:40'),
(4, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:05:57', '2017-06-20 09:05:57'),
(5, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:06:12', '2017-06-20 09:06:12'),
(6, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:07:24', '2017-06-20 09:07:24'),
(7, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:09:07', '2017-06-20 09:09:07'),
(8, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:09:32', '2017-06-20 09:09:32'),
(9, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:09:59', '2017-06-20 09:09:59'),
(10, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:10:18', '2017-06-20 09:10:18'),
(11, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:10:36', '2017-06-20 09:10:36'),
(12, 34, '2017-06-20', '2017-06-20', '0.00', '', 'None', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:11:24', '2017-06-20 09:11:24'),
(13, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:12:37', '2017-06-20 09:12:37'),
(14, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:13:03', '2017-06-20 09:13:03'),
(15, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:14:07', '2017-06-20 09:14:07'),
(16, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:14:27', '2017-06-20 09:14:27'),
(17, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:16:14', '2017-06-20 09:16:14'),
(18, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:16:54', '2017-06-20 09:16:54'),
(19, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:18:56', '2017-06-20 09:18:56'),
(20, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:19:09', '2017-06-20 09:19:09'),
(21, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:20:09', '2017-06-20 09:20:09'),
(22, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:20:34', '2017-06-20 09:20:34'),
(23, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:23:27', '2017-06-20 09:23:27'),
(24, 34, '2017-06-20', '2017-06-20', '0.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:24:57', '2017-06-20 09:24:57'),
(25, 34, '2017-06-20', '2017-06-20', '488.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:26:35', '2017-06-20 09:26:35'),
(26, 34, '2017-06-20', '2017-06-20', '488.00', '', 'Soemthin here', 0, 0, 0, '', '', '', '', 2, 3, 'Received', '', '2017-06-20 09:28:35', '2017-06-20 09:28:35'),
(27, 34, '2017-06-20', '2017-06-20', '488.00', '', 'None', 3, 3, 1, 'sdfasdfasdf', '', '#ffffff', '#000000', 2, 2, 'Received', '', '2017-06-20 09:55:00', '2017-06-20 09:55:00'),
(28, 34, '2017-06-20', '2017-06-20', '488.00', '', 'None', 3, 3, 1, 'sdfasdfasdf', '', '#ffffff', '#000000', 2, 2, 'Received', 'notes', '2017-06-20 09:56:09', '2017-06-21 08:16:39');

-- --------------------------------------------------------

--
-- Table structure for table `order_baskets`
--

CREATE TABLE `order_baskets` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `in_basket` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `qty`, `rate`, `amount`, `discount`, `in_basket`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:06:12', '2017-06-20 09:06:12'),
(2, 6, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:07:24', '2017-06-20 09:07:24'),
(3, 7, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:09:07', '2017-06-20 09:09:07'),
(4, 8, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:09:32', '2017-06-20 09:09:32'),
(5, 9, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:09:59', '2017-06-20 09:09:59'),
(6, 10, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:10:19', '2017-06-20 09:10:19'),
(7, 11, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:10:36', '2017-06-20 09:10:36'),
(8, 12, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:11:24', '2017-06-20 09:11:24'),
(9, 13, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:12:37', '2017-06-20 09:12:37'),
(10, 13, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:12:38', '2017-06-20 09:12:38'),
(11, 14, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:13:03', '2017-06-20 09:13:03'),
(12, 14, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:13:03', '2017-06-20 09:13:03'),
(13, 15, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:14:07', '2017-06-20 09:14:07'),
(14, 15, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:14:07', '2017-06-20 09:14:07'),
(15, 16, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:14:27', '2017-06-20 09:14:27'),
(16, 16, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:14:27', '2017-06-20 09:14:27'),
(17, 17, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:16:14', '2017-06-20 09:16:14'),
(18, 17, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:16:14', '2017-06-20 09:16:14'),
(19, 18, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:16:54', '2017-06-20 09:16:54'),
(20, 18, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:16:54', '2017-06-20 09:16:54'),
(21, 19, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:18:56', '2017-06-20 09:18:56'),
(22, 19, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:18:56', '2017-06-20 09:18:56'),
(23, 20, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:19:09', '2017-06-20 09:19:09'),
(24, 20, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:19:09', '2017-06-20 09:19:09'),
(25, 21, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:20:09', '2017-06-20 09:20:09'),
(26, 21, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:20:09', '2017-06-20 09:20:09'),
(27, 22, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:20:34', '2017-06-20 09:20:34'),
(28, 22, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:20:34', '2017-06-20 09:20:34'),
(29, 23, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:23:27', '2017-06-20 09:23:27'),
(30, 23, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:23:27', '2017-06-20 09:23:27'),
(31, 24, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:24:57', '2017-06-20 09:24:57'),
(32, 24, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:24:57', '2017-06-20 09:24:57'),
(33, 25, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:26:35', '2017-06-20 09:26:35'),
(34, 25, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:26:35', '2017-06-20 09:26:35'),
(35, 26, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:28:35', '2017-06-20 09:28:35'),
(36, 26, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:28:35', '2017-06-20 09:28:35'),
(37, 27, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:55:00', '2017-06-20 09:55:00'),
(38, 27, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:55:00', '2017-06-20 09:55:00'),
(39, 28, 1, 1, '90.00', '90.00', '0.00', 1, '2017-06-20 09:56:09', '2017-06-20 09:56:09'),
(40, 28, 2, 2, '199.00', '398.00', '0.00', 1, '2017-06-20 09:56:09', '2017-06-20 09:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `regular_price` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `image1` varchar(255) NOT NULL DEFAULT '',
  `image2` varchar(255) NOT NULL DEFAULT '',
  `image3` varchar(255) NOT NULL DEFAULT '',
  `image4` varchar(255) NOT NULL DEFAULT '',
  `image5` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `sku`, `slug`, `description`, `regular_price`, `price`, `available`, `image1`, `image2`, `image3`, `image4`, `image5`, `created_at`, `updated_at`) VALUES
(1, 'Product 1', 'product-1', 'product-1', 'Test product', '100.00', '90.00', 1, '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Product 2', 'product-2', 'product-2', 'Test Product 2', '200.00', '199.00', 1, '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Product 3 ', 'product-3', 'product-3', 'Test Product 3', '300.00', '299.00', 1, '', '', '', '', '', '0000-00-00 00:00:00', '2017-06-13 08:08:25'),
(4, 'Product 4', 'sku', 'slug', 'description', '100.00', '99.00', 1, '', '', '', '', '', '2017-06-13 08:57:50', '2017-06-13 08:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `receiver_addresses`
--

CREATE TABLE `receiver_addresses` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `country` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receiver_addresses`
--

INSERT INTO `receiver_addresses` (`id`, `order_id`, `name`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 16, 'FF', 'GG', 'HH', 'II', '', 'JJ', '', '009230012323223', '', '2017-06-20 09:14:27', '2017-06-20 09:14:27'),
(2, 24, 'FF', 'GG', 'HH', 'II', '', 'JJ', '', '009230012323223', '', '2017-06-20 09:24:57', '2017-06-20 09:24:57'),
(3, 25, 'FF', 'GG', 'HH', 'II', '', 'JJ', '', '009230012323223', '', '2017-06-20 09:26:35', '2017-06-20 09:26:35'),
(4, 26, 'FF', 'GG', 'HH', 'II', '', 'JJ', '', '009230012323223', '', '2017-06-20 09:28:35', '2017-06-20 09:28:35'),
(5, 28, 'aa', 'bb', 'cc', 'dd', '', 'ee', '', '009230012323223', '', '2017-06-20 09:56:09', '2017-06-20 09:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(34, 'Ayaz', 'test01@yahoo.com', '$2y$10$ZL1F/FY3fE7goRjY1iCqMugRcyTM5n01LUdI9iKRI5pXjIHYx1mRC', 'PP7idsIwWCkKwiN4SZJdiGiLaCytqsgYSvWyNQblctv8T24YrZAGkyNeYigC', '2017-06-05 03:02:35', '2017-06-05 03:02:35'),
(35, 'Ayaz Ahmed', 'admin@yahoo.com', '$2y$10$nbtHecSU5JHko5HkCI2/teG0ZJgbkIoW000Geer.on2HTHnWfvBti', NULL, '2017-06-06 03:05:25', '2017-06-06 03:05:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_product` (`category_id`,`product_id`) USING BTREE;

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_baskets`
--
ALTER TABLE `order_baskets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receiver_addresses`
--
ALTER TABLE `receiver_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `order_baskets`
--
ALTER TABLE `order_baskets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `receiver_addresses`
--
ALTER TABLE `receiver_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
