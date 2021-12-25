-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 03, 2019 at 07:43 PM
-- Server version: 5.6.43-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
(1, 'Ayaz', '', 'admin@youthinkwewrap.com', '$2y$10$75HqRIbdTclXJQlmPdb4VOgR2vmWRiSxw99In8Q.k/AY35FG0e4ui', 'LpIVniecwb0vQxZNBTwmmnlvLhLgDZZwZqLPx299eBjYEfBJGp3dwIT5CrC0', '2017-06-05 03:02:35', '2018-01-09 15:51:40');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `cart` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `description`, `image`, `available`, `cart`, `created_at`, `updated_at`) VALUES
(1, 'Cakes', 'cakes', 'Cakes', '1-Category-Cakes.jpg', 1, 0, '0000-00-00 00:00:00', '2018-08-10 09:55:12'),
(2, 'Flowers', 'flowers', 'Flowers', '1-Category-Flower-Basket.jpg', 1, 0, '0000-00-00 00:00:00', '2017-11-01 10:56:31'),
(3, 'Gift Baskets', 'gift-baskets', 'Gift Baskets', '1-Category-Gift-Baskets.jpg', 1, 0, '0000-00-00 00:00:00', '2017-11-01 10:56:38'),
(4, 'Hand-made Cards', 'hand-made-baskets', 'Hand-made Cards', '1-Category-Cards.jpg', 1, 1, '0000-00-00 00:00:00', '2017-10-23 05:32:11'),
(5, 'Customized Mugs', 'customized-mugs', 'Customized Mugs', '1-Category-Mugs.jpg', 1, 1, '0000-00-00 00:00:00', '2017-10-23 05:31:45'),
(6, 'Cushions', 'cushions', 'Cushions', '1-Category-Cushions.jpg', 1, 1, '0000-00-00 00:00:00', '2017-10-23 05:31:14'),
(7, 'Frames', 'frames', 'Frames', '1-Category-Frames.jpg', 1, 1, '0000-00-00 00:00:00', '2017-10-23 05:30:48'),
(8, 'Stuffed Toys', 'stuffed-toys', 'Stuffed Toys', '1-Category-Toys.jpg', 1, 1, '0000-00-00 00:00:00', '2017-10-23 05:30:23'),
(9, 'Combo Deals', 'combo-deals', 'Combo Deals', '1-Category-Deals.jpg', 1, 0, '0000-00-00 00:00:00', '2017-12-28 08:37:33'),
(10, 'Chocolate Bouquets', 'chocolate-bouquets', 'Chocolate Bouquets', '1-Category-CB.jpg', 1, 0, '2017-10-10 00:00:00', '2017-11-01 10:56:08'),
(20, 'Packages', 'packages', 'none', '', 0, 0, '2017-12-11 00:00:00', '2017-12-21 05:08:26'),
(21, 'Perfumes', 'perfumes', 'Perfumes', NULL, 0, 1, '2017-12-28 08:40:46', '2017-12-28 08:40:46');

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

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `percent` tinyint(2) NOT NULL DEFAULT '0',
  `valid_till` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `percent`, `valid_till`, `created_at`, `updated_at`) VALUES
(1, 'mother', 10, '2018-05-06', '0000-00-00 00:00:00', '2018-05-02 19:36:49'),
(2, '10OFF', 10, '2017-12-22', '2017-12-18 10:20:32', '2017-12-18 10:20:32'),
(3, 'ESR', 10, '2018-02-20', '2018-01-23 07:00:42', '2018-01-23 07:00:42'),
(4, '15OFF', 15, '2018-04-24', '2018-04-20 09:44:33', '2018-04-20 09:44:33'),
(5, 'Anniversary', 15, '2018-04-24', '2018-04-21 08:21:42', '2018-04-21 08:21:42');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `user_id`, `name`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 38, 'Ayaz Ahmed', 'address', 'address 2', 'city', '', '12345', '', '1234567890', '', '2017-11-01 03:38:59', '2017-11-01 03:38:59'),
(2, 35, 'Ayaz', 'Main Road', NULL, 'Karachi', NULL, '12345', NULL, '923008210313', NULL, '2017-11-01 07:21:18', '2017-11-01 07:21:18'),
(3, 34, 'Ayz', 'dsvwe', 'dfvedv', 'dsved', '', 'csdv', '', '21651', 'test01@yahoo.com', '2017-11-01 08:26:22', '2017-12-20 16:00:07'),
(4, 41, 'Ayaz Ahmed', 'My Address', 'Line 2', 'Karachi', '', '75300', '', '03008210313', 'ahmed.ayaz@hotmail.com', '2017-12-11 06:35:15', '2017-12-11 06:35:51'),
(5, 39, 'Ayaz Arshed', 'Test', NULL, 'Lahore', '', '5400', '', '03354524728', 'ayazarshed94@gmail.com', '2017-12-12 15:03:28', '2017-12-12 15:03:28'),
(6, 43, 'Ayaz Arshed', 'A', NULL, 'A', '', 'A', '', 'A', 'ayazarshedofficial@gmail.com', '2017-12-13 18:11:08', '2017-12-13 18:11:08'),
(7, 51, 'Mahi khan', '86E airline society', NULL, 'Lahore', '', '54000', '', '03244911847', 'lovelymemories2017@gmail.com', '2017-12-18 20:50:34', '2017-12-18 20:50:34'),
(8, 59, 'Kanza Wasik', 'Mustafa Town', NULL, 'Lahore', '', '5400', '', '03214411285', '19-11010@formanite.fccollege.edu.pk', '2017-12-20 16:16:58', '2017-12-20 16:16:58'),
(9, 42, 'ayaz', 'main rashid minhas road', NULL, 'karachi', '', '75300', '', '03008210313', 'ayazahmedpm@gmail.com', '2017-12-20 16:21:21', '2017-12-20 16:21:21'),
(10, 61, 'Sidra mohsin', 'House #5 street 23/A ramgharh mujahidabad mughalpura lahore', NULL, 'Lahore', '', 'O42', '', '03354777731', 'sidra.ms92@gmail.com', '2017-12-20 20:53:52', '2017-12-20 20:53:52'),
(11, 55, 'Nameer Ahmed', 'Somewhere', NULL, 'Karachi', '', '75300', '', '03008210313', 'ahmed.ayaz@hotmail.com', '2017-12-21 05:04:53', '2017-12-21 05:55:19'),
(12, 62, 'Suneeba chattha', 'B 64 street 12 shahwali wah cantt', NULL, 'Wah cantt', '', '47010', '', '03348392752', 'suneebachattha@gmail.com', '2017-12-21 06:39:39', '2017-12-21 06:39:39'),
(13, 63, 'Soban', '256 A dha phase 6', NULL, 'Lahore', '', '5400', '', '03340777028', 'attiqabutt01@gmail.com', '2017-12-21 11:23:21', '2017-12-21 11:23:21'),
(14, 66, 'A', 'A', NULL, 'A', '', 'A', '', 'A', 'sociallianceservices@gmail.com', '2017-12-21 20:06:28', '2017-12-21 20:06:28'),
(15, 69, 'Azka Shahid', 'House no 71, Defence Raya, DHA Phase VI', NULL, 'Lahore', '', '54000', '', '03214039777', 'azkashahid13@gmail.com', '2017-12-26 06:01:35', '2017-12-26 06:01:35'),
(16, 71, 'Jannat junaid shami', '191 e2 wapda town', NULL, 'Lahore', '', '5400', '', '03038845383', 'jannatzafar@gmail.com', '2017-12-26 13:01:12', '2017-12-26 13:01:12'),
(17, 83, 'Fatima', 'House 11 street 1 sector A Askari 10', NULL, 'Lahore', '', '058', '', '03370438299', 'fatimafuad1110@yahoo.com', '2017-12-30 10:46:19', '2017-12-30 10:46:19'),
(18, 96, 'Nabiya', 'Al Hassan house House no 33A Block A lane 2 PAF colony zaraar shaheed road Lahore Cantt', NULL, 'Lahore', '', '54810', '', '03324843619', 'rozinajunaid6@gmail.com', '2018-01-10 12:22:25', '2018-01-10 12:22:25'),
(19, 105, 'Rabbia', 'House Number 7 block H4', NULL, 'Wapdatown Lahore', '', '0000', '', '07491693469', 'rabbia.sohail@hotmail.com', '2018-01-13 21:59:52', '2018-01-13 21:59:52'),
(20, 94, 'Maria Rasheed', 'University of Lahore', NULL, 'LAHORE', '', '05444', '', '03164986321', 'mariarasheed891@gmail.com', '2018-01-16 11:19:14', '2018-01-16 11:19:14'),
(21, 108, 'Ahmad', '108 new islamia park', 'Near poonch road', 'Lahore', '', '54000', '', '03311425485', 'dr_ahmad_123456@hotmail.com', '2018-01-17 13:06:35', '2018-01-17 13:15:31'),
(22, 113, 'Saud Toor', 'Cavalry ground near rahmaniya masjid street 6A house 5/2B', NULL, 'Lahore', '', '54000', '', '03211688338', 'saudtoor123@gmail.com', '2018-01-17 19:16:20', '2018-08-26 15:00:48'),
(23, 120, 'Fizza', 'House#5, Muhammad Ali St, Muslim Road, Sanda, Lahore', NULL, 'Lahore', '', '54000', '', '03362121402', 'fizzabatool47@yahoo.com', '2018-01-21 16:10:12', '2018-01-21 16:10:12'),
(24, 128, 'Juraij Asif', 'House#649 D, Sector D, DHA Phase 5, Lahore', NULL, 'Lahore', NULL, '54000', NULL, '0322-6953333', NULL, '2018-01-24 11:44:42', '2018-01-24 11:44:42'),
(25, 134, 'Nouman', 'House No.1 Street No. 47, Ittefaq Street, Nadeem Shaheed Road, Shabab Chowk Samnabad, Lahore', NULL, 'Lahore', '', '54000', '', '03330420421', 'nouman042@gmail.com', '2018-01-29 11:55:43', '2018-01-29 11:55:43'),
(26, 136, 'Ruba Mahmood', '234/1 Allama iqbal town', NULL, 'Lahore', '', '1234', '', '03012436200', 'zubaidsheikh32@gmail.com', '2018-01-29 16:30:03', '2018-01-29 16:30:03'),
(27, 60, 'Sonia', '208 A Block eme', NULL, 'Lahore', '', '0423', '', '03214608203', 'soniaasif69@yahoo.com', '2018-01-31 09:06:40', '2018-05-12 16:25:56'),
(28, 141, 'Abbas Zulqarnain', '198 - A Block Johar Town Lahore', NULL, 'Lahore', '', '54000', '', '03219444022', 'abbaszulqarnain@live.com', '2018-02-03 14:34:56', '2018-02-03 14:34:56'),
(29, 142, 'Munazza Rana', '72 Alice Street, Auburn', NULL, 'Sydney', '', '2144', '', '03067975749', 'rana.munazza@gmail.com', '2018-02-04 13:27:42', '2018-02-04 13:27:42'),
(30, 92, 'Manahil', 'main bazar house#126', 'street no 1, house no.229, danewal town vehari Vehari Punjab', 'BurewALa', '', '61100', '', '03483905123', 'manahilkhld@gmail.com', '2018-02-06 05:44:38', '2018-02-06 05:49:03'),
(31, 150, 'hira', 'nisbat road lahore', NULL, 'lahore', '', '54000', '', '03230413218', 'hiraijazbutt@yahoo.com', '2018-02-11 07:08:45', '2018-02-11 07:08:45'),
(32, 151, 'Dr.Hashaam Khalid', 'House number 9 block W peoples Colony Khanewal', NULL, 'Khanewal', '', NULL, '', '03155111876', 'aamirmalik623@yahoo.com', '2018-02-13 13:26:37', '2018-02-13 13:26:37'),
(33, 152, 'Rooqash Ali', 'Room 308 Farooq Hostel Link Mcleod Road Lahore', NULL, 'Lahore', '', '54000', '', '+923425947662', 'rakoosh_ali@hotmail.com', '2018-02-13 21:15:58', '2018-02-13 21:15:58'),
(34, 158, 'Aymen Zameer', 'C-13-17, Eden Value homes Multan Road', NULL, 'Lahore', '', '54400', '', '03244639946', 'aymen.zameer@gmail.com', '2018-03-04 14:09:01', '2018-03-04 14:09:01'),
(35, 161, 'Zia', 'Bahria orchards', NULL, 'Khobar', '', '11411', '', '00966597731626', 'semalik1415@gmail.com', '2018-03-14 18:55:42', '2018-03-14 19:05:58'),
(36, 164, 'Ayisha', 'House no 75 gulshan e jamiya Opposite to MP Check Post 2 Model Colony', NULL, 'Karachi', '', '75070', '', '+923323309503', 'ayishaansaar@gmail.com', '2018-03-24 09:03:25', '2018-03-24 09:03:25'),
(37, 174, 'Dr. Ammara aslam', 'Lahore general hospital', NULL, 'Lahore', '', NULL, '', '03320601484', 'farrukh_passion@yahoo.com', '2018-04-06 19:45:28', '2018-04-06 19:45:28'),
(38, 177, 'Fizza Naveed', '262 W- block, phase 3 DHA', NULL, 'Lahore', '', '54000', '', '03214885915', 'specific_person@hotmail.com', '2018-04-12 21:25:48', '2018-04-12 21:25:48'),
(39, 178, 'Rubina', '74A hajveri  housing scheme harbanspura', NULL, 'Lahore', '', '54810', '', '03074371789', 'l_aiba2001@hotmail.com', '2018-04-15 15:50:01', '2018-04-15 15:50:01'),
(40, 181, 'Zuha Malik', '3A, Defense Colony, Kharian Cantt', NULL, 'Kharian Cantt', '', '50700', '', '03215955338', 'ahmadalauddin@gmail.com', '2018-04-21 09:43:07', '2018-04-21 09:43:07'),
(41, 182, 'Sana Naviz', '117 E PIA Housing Society', NULL, 'Lahore', '', '54770', '', '00923314835165', 'sananaviz@hotmail.com', '2018-04-22 15:05:37', '2018-04-22 15:05:37'),
(42, 188, 'Maham Anwar', 'House no. 38 ,Rehman villas defence road lahore cantt', NULL, 'Lahore', '', '12345', '', '03244555781', 'mahamanwar143@gmail.com', '2018-05-01 10:22:51', '2018-05-01 10:22:51'),
(43, 207, 'Asjad Ahmad', 'BMCHS Road 18,Sharfabad,Karachi', NULL, 'Karachi', '', NULL, '', '03364214760', 'asjadahmad@live.com', '2018-05-13 05:46:20', '2018-05-13 05:46:20'),
(44, 211, 'Ammara Laeeq', '1017 Overseas-B Bahria Town', NULL, 'Lahore', '', NULL, '', '03334853540', 'ammaramalik@gmail.com', '2018-05-18 06:08:06', '2018-05-18 06:08:06'),
(45, 220, 'Muhammad Awais', 'House 5 mehmood homes samungli road quetta', NULL, 'Quetta', '', NULL, '', '03458311303', 'salmanfaiz85@yahoo.com', '2018-05-30 16:14:46', '2018-05-30 16:14:46'),
(46, 222, 'Raheel Ayaz', 'house # 900 street # 63 bazaz muhalla sadar bazar lahore cantt', NULL, 'Lahore', '', '54000', '', '03244815953', 'rahil.ayaz273@gmail.com', '2018-05-31 09:17:15', '2018-05-31 09:17:15'),
(47, 227, 'Sana Shabbir', '590 Raza block Allama Iqbal town', NULL, 'Lahore', '', '54570', '', '03249009452', 'sanashabbir191@gmail.com', '2018-06-13 11:13:20', '2018-06-13 11:13:20'),
(48, 228, 'Rabbab Naqvi', '711B fort villas, Defence', NULL, 'lahore', '', NULL, '', '03008454529', 'alifahnaqvi@hotmail.com', '2018-06-14 12:51:01', '2018-06-14 12:51:01'),
(49, 229, 'Nazziha', '151 chenab block Allama iqbal town', NULL, 'Lahore', '', NULL, '', '03364433009', 's_nazziha@hotmail.com', '2018-06-17 10:34:10', '2018-06-17 10:34:10'),
(50, 232, 'Javeria Zafar', '170-B (upper portion), Abdalians Society', NULL, 'Lahore', '', NULL, '', '03339666693', 'zafar.javeria@gmail.com', '2018-06-20 17:14:57', '2018-06-20 17:14:57'),
(51, 233, 'Mustafa Aslam', '446-H. phase 6 DHA', NULL, 'Lahore', '', '54810', '', '03333799547', 'mehrunnisaumer@gmail.com', '2018-06-21 11:16:40', '2018-06-21 11:16:40'),
(52, 236, 'Mahina Aleem', 'Alghani house, yaadgar  shuhada near Police Station Manawan batapur lahoe', NULL, 'Lahore', '', '53400', '', '03314747744', 'mahina_96@hotmail.com', '2018-06-24 21:50:48', '2018-06-24 21:55:05'),
(53, 239, 'Saima Aqib', '74-B street 3 phase 1 Ali view gardens', NULL, 'Lahore', '', '54000', '', '03228006925', 'saima_tariq883@yahoo.com', '2018-06-27 11:25:42', '2018-06-27 11:25:42'),
(54, 242, 'Meesha', '14 usman block fateh town okara', NULL, 'Okara', '', '56300', '', '03204054177', 'meesha.noman@gmail.com', '2018-07-03 20:41:07', '2018-07-03 20:41:07'),
(55, 262, 'Muhammad Imran Aftab', 'Lahore', NULL, 'Lahore', '', NULL, '', '03224392060', 'imrandmt@gmail.com', '2018-07-24 10:24:42', '2018-07-24 18:21:17'),
(56, 270, 'Asjad', 'Behind farhan Hotel house number (247 C)', NULL, 'Karachi', '', '75400', '', '03462709780', 'asjadadnan2014@gmail.com', '2018-08-01 21:07:05', '2018-08-02 18:23:38'),
(57, 273, 'Talib Cassoobhai', '5255 Guildwood Way, Unit 61', NULL, 'Mississauga', '', 'L5R 4A8', '', '4166592470', 'talib94@gmail.com', '2018-08-06 17:37:38', '2018-08-06 17:37:38'),
(58, 283, 'Waqar Ahmad', 'Block 6 Street 106', NULL, 'Farwaniya', '', '13106', '', '+96599400634', 'wahmad99400@gmail.com', '2018-08-13 13:26:43', '2018-08-13 13:26:43'),
(59, 291, 'aaa', 'aaaa', NULL, 'lahore', '', NULL, '', '0323456777', 'mehak_ali_leo@ymail.com', '2018-08-28 19:45:02', '2018-08-28 19:45:02'),
(60, 292, 'Hudakhalid', 'House#51street#4phase3 gulraiz housing scheme Rawalpindi', NULL, 'Rawalpindi', '', NULL, '', '03235554718', 'geminiblossom96@hotmail.com', '2018-08-31 08:28:10', '2018-08-31 08:28:10'),
(61, 315, 'fdas', 'sdf', NULL, 'asdf', '', NULL, '', '23423423', 'nabeel_syed1@hotmail.com', '2018-10-02 07:46:10', '2018-10-02 07:46:10'),
(62, 317, 'Iqra Iqbal', 'House #82/69muhala khalsa collage, main jaranwala road,faisalabad', NULL, 'Faisalabad', '', NULL, '', '03214783756', 'iiqraiiqbal18@gmail.com', '2018-10-15 14:10:24', '2018-10-15 14:10:24'),
(63, 325, 'Iqra Mashood', 'House No 97-V street 7 phase 2 defence.', NULL, 'Lahore', '', NULL, '', '03364028041', 'iqramashood28@gmail.com', '2018-10-18 17:54:40', '2018-10-18 17:54:40'),
(64, 337, 'Laiba', '74 A hajverI housing scheme harbanspura', NULL, 'Lahore', '', '54850', '', '03074371789', 'bosomfriend_29@hotmail.com', '2018-10-28 22:28:14', '2018-10-28 22:28:14'),
(65, 339, 'Fouzia Salman', 'Qusais 2 Villa 32 18 street Dubai', NULL, 'Dubai', NULL, 'Na', NULL, '00971558474753', NULL, '2018-10-31 02:48:40', '2018-10-31 02:48:40');

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
  `delivery_date` date DEFAULT NULL,
  `preferred_time` varchar(10) DEFAULT NULL,
  `delivery_charges` decimal(10,0) NOT NULL DEFAULT '0',
  `location` varchar(20) NOT NULL DEFAULT 'Lahore',
  `discount` decimal(10,0) NOT NULL DEFAULT '0',
  `order_amount` decimal(10,2) DEFAULT '0.00',
  `received` decimal(10,0) NOT NULL DEFAULT '0',
  `coupon` varchar(20) DEFAULT NULL,
  `instruction` text,
  `event` varchar(30) DEFAULT NULL,
  `basket_design` varchar(30) DEFAULT NULL,
  `package` varchar(30) DEFAULT NULL,
  `tags_handwritten` varchar(255) DEFAULT NULL,
  `tags_image` varchar(255) DEFAULT NULL,
  `color1` varchar(10) DEFAULT NULL,
  `color2` varchar(10) DEFAULT NULL,
  `delivery_method` varchar(30) DEFAULT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `order_notes` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_date`, `delivery_date`, `preferred_time`, `delivery_charges`, `location`, `discount`, `order_amount`, `received`, `coupon`, `instruction`, `event`, `basket_design`, `package`, `tags_handwritten`, `tags_image`, `color1`, `color2`, `delivery_method`, `payment_method`, `order_status`, `order_notes`, `created_at`, `updated_at`) VALUES
(39, 34, '2017-11-01', '2017-11-01', '', '200', 'Lahore', '0', '5400.00', '0', '', 'None', '0', '0', '0', '', '', '', '', '2', '3', 'Canceled', '.', '2017-11-01 08:42:04', '2017-12-20 16:02:27'),
(40, 34, '2017-11-01', '2017-11-01', '', '200', 'Lahore', '0', '9700.00', '4000', '', 'None', '0', '0', '0', '', '', '', '', '2', '3', 'Canceled', '.', '2017-11-01 09:41:44', '2017-12-20 16:02:17'),
(41, 43, '2017-12-11', '2017-12-11', '', '200', 'Lahore', '0', '500.00', '0', '', 'None', 'Special Event', 'Basket White', '76', NULL, '', '#ffffff', '#000000', 'YTWW', 'Bank Transfer', 'Canceled', '.', '2017-12-11 06:35:51', '2017-12-20 16:01:44'),
(42, 39, '2017-12-12', '2017-12-12', '', '200', 'Lahore', '0', '200.00', '0', '', 'None', 'Special Event', 'Basket White', '76', NULL, '', '#ffffff', '#000000', 'YTWW', 'Bank Transfer', 'Canceled', '.', '2017-12-12 15:03:28', '2017-12-20 16:01:23'),
(43, 39, '2017-12-12', '2017-12-12', '', '200', 'Lahore', '0', '9000.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', '.', '2017-12-12 15:08:27', '2017-12-20 16:01:14'),
(44, 39, '2017-12-12', '2017-12-12', '', '200', 'Lahore', '0', '4200.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', '.', '2017-12-12 15:33:23', '2017-12-20 16:01:03'),
(45, 39, '2017-12-12', '2017-12-12', '', '200', 'Lahore', '0', '200.00', '0', '', 'None', 'Special Event', 'Basket White', NULL, NULL, '', '#ffffff', '#000000', 'YTWW', 'Bank Transfer', 'Canceled', '.', '2017-12-12 15:35:36', '2017-12-20 16:00:53'),
(46, 43, '2017-12-13', '2017-12-14', NULL, '200', 'Lahore', '0', '1400.00', '2000', '', NULL, 'Special Event', 'Basket White', '76', NULL, '', '#ffffff', '#000000', 'YTWW', 'Bank Transfer', 'Canceled', 'Delivered', '2017-12-13 18:11:08', '2017-12-18 12:01:36'),
(47, 51, '2017-12-18', '2017-12-18', '', '200', 'Lahore', '0', '7500.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'Self', 'Bank Transfer', 'Canceled', 'Canceled by Client', '2017-12-18 20:50:34', '2017-12-19 12:11:38'),
(48, 34, '2017-12-20', '2017-12-20', '', '200', 'Lahore', '0', '4200.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Easy Paisa', 'Canceled', 'testing order', '2017-12-20 16:00:07', '2017-12-20 16:00:44'),
(49, 59, '2017-12-20', '2017-12-21', '1 pm', '200', 'Lahore', '0', '1950.00', '1775', '', 'Replace snickers with Kitkat as discussed\r\nTag 1: Happy 5 years and 4th Month of Anniversary Hubby\r\nTag 2: I\'m sorry baby and I love you so much', '0', '0', '0', '', '', '', '', 'YTWW', 'Easy Paisa', 'Delivered', 'Payment Received with 10% Off (Launch Code)\r\nOrder Assigned. \r\nOrder Delivered', '2017-12-20 16:16:58', '2017-12-21 10:03:10'),
(50, 34, '2017-12-20', '2017-12-21', '', '200', 'Lahore', '0', '1950.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', 'testing of Coupon code', '2017-12-20 16:20:28', '2017-12-20 16:21:22'),
(51, 42, '2017-12-20', '2017-12-25', '', '400', 'In Pakistan', '0', '1600.00', '0', '', 'test order', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', '.', '2017-12-20 16:21:21', '2017-12-20 17:10:39'),
(52, 42, '2017-12-20', '2017-12-23', '', '400', 'In Pakistan', '0', '1600.00', '0', '', 'test order with coupon amount 1200+4-- - 120 = 1480', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', '.', '2017-12-20 16:27:54', '2017-12-20 17:10:30'),
(53, 61, '2017-12-20', '2017-12-22', '10AM', '200', 'Lahore', '0', '2200.00', '2200', '', '\"Happy birthday Miaon\r\n22/12/17\"\r\nTo be written on card ...\" happy birthday Miaon\" to be written on cake... flowers should be fresh', '0', '0', '0', '', '', '', '', 'YTWW', 'Cash on Delivery', 'Delivered', 'Landmarks near Gourmet and Good luck \r\nDelivery time: 4 pm\r\nConfirmation Sent\r\nOrder Delivered', '2017-12-20 20:53:52', '2017-12-22 17:40:41'),
(54, 55, '2017-12-21', '2017-12-30', '12', '200', 'Lahore', '0', '1600.00', '0', '10OFF', 'just a test with coupon code total 1460', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', '.', '2017-12-21 05:04:53', '2017-12-21 15:44:50'),
(55, 55, '2017-12-21', '2017-12-30', '13', '200', 'Lahore', '0', '1600.00', '0', '10OFF', 'another one with complete basket', 'Special Event', 'Basket White', '77', 'none', '', '#ffffff', '#ff0000', 'YTWW', 'Bank Transfer', 'Canceled', '.', '2017-12-21 05:06:41', '2017-12-21 15:44:41'),
(56, 55, '2017-12-21', '2017-12-30', '12 pm', '200', 'Lahore', '150', '1550.00', '0', '10OFF', 'total 1550', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', '.', '2017-12-21 05:54:34', '2017-12-21 15:44:33'),
(57, 55, '2017-12-21', '2017-12-30', '5pm', '200', 'Lahore', '150', '3550.00', '0', '10OFF', 'total 1550 + package', 'Special Event', 'Basket White', '76', NULL, '', '#ffffff', '#000000', 'YTWW', 'Bank Transfer', 'Canceled', '.', '2017-12-21 05:55:19', '2017-12-21 15:44:25'),
(58, 62, '2017-12-21', '2018-01-01', '5 pm', '200', 'Lahore', '0', '2200.00', '2000', '', 'None', '0', '0', '0', '', '', '', '', 'Self', 'Bank Transfer', 'Delivered', '10% off applied. 2000 payment.\r\nOrder Delivered', '2017-12-21 06:39:39', '2018-01-16 08:09:54'),
(59, 34, '2017-12-21', '2017-12-21', '', '200', 'Lahore', '140', '1460.00', '0', '10OFF', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', 'test', '2017-12-21 06:59:58', '2017-12-21 07:00:22'),
(60, 63, '2017-12-21', '2018-01-14', '12AM', '200', 'Lahore', '100', '1100.00', '0', '10OFF', 'Please write \"HAPPY BIRTHDAY SUFU\" and please do not be late. Its a surprise.', '0', '0', '0', '', '', '', '', 'YTWW', 'Easy Paisa', 'Canceled', 'Order Assigned. Confirmation Sent\r\nPayment Reminder call done (11/1/2018)\r\nCanceled by client', '2017-12-21 11:23:21', '2018-01-16 08:09:39'),
(61, 66, '2017-12-21', '2017-12-28', NULL, '200', 'Lahore', '0', '2200.00', '0', '', NULL, 'Thank you', 'Basket White', '76', NULL, '', '#ffffff', '#000000', 'YTWW', 'Easy Paisa', 'Canceled', '.', '2017-12-21 20:06:28', '2017-12-21 20:08:04'),
(62, 69, '2017-12-26', '2017-12-26', '11:59', '200', 'Lahore', '0', '2950.00', '0', '10OFF', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', 'Canceled due to unavailability.', '2017-12-26 06:01:35', '2017-12-26 08:31:01'),
(63, 71, '2017-12-26', '2018-01-15', '02 p.m', '200', 'Lahore', '0', '2200.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Cash on Delivery', 'Canceled', 'Confirmation Sent\r\nOrder updated on sheet\r\nCustomer Canceled. (updated on sheet)', '2017-12-26 13:01:12', '2017-12-28 08:09:14'),
(64, 83, '2017-12-30', '2017-12-30', '', '200', 'Lahore', '0', '1950.00', '1950', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Delivered', 'Confirmation Sent.\r\nDelivery Date 31st Dec / 11 pm.\r\ntags mentioned on message.\r\nOrder delivered', '2017-12-30 10:46:19', '2017-12-31 17:54:00'),
(65, 96, '2018-01-10', '2018-01-10', '', '200', 'Lahore', '0', '1775.00', '1800', '', 'None', '0', '0', '0', '', '', '', '', 'Self', 'Cash on Delivery', 'Delivered', 'Assigned (Confirmation Sent)\r\nDelivered', '2018-01-10 12:22:25', '2018-01-16 08:09:24'),
(66, 105, '2018-01-13', '2018-01-13', '', '200', 'Lahore', '0', '2450.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Cash on Delivery', 'Canceled', 'Tester', '2018-01-13 21:59:52', '2018-01-16 08:09:07'),
(67, 105, '2018-01-13', '2018-01-31', '', '200', 'Lahore', '0', '1400.00', '0', '', 'None', 'Birthday', 'Basket White', NULL, 'Hi', '', 'Pink', NULL, 'YTWW', 'Cash on Delivery', 'Canceled', 'Tester', '2018-01-13 22:05:47', '2018-01-16 08:08:54'),
(68, 94, '2018-01-16', '2018-01-17', '10:30 pm', '200', 'Lahore', '0', '4550.00', '0', '', 'Mention \"HAPPY BIRTHDAY\" on a cake. sender name is only revealed to a receiver on request.', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Assigned', 'Confirmation Sent', '2018-01-16 11:19:14', '2018-01-16 12:04:05'),
(69, 108, '2018-01-17', '2018-01-21', '10pm', '200', 'Lahore', '0', '3150.00', '3150', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Delivered', 'Paypal details sent\r\nConfirmation Sent Via Whatsapp (UK Number)\r\nPayment Done.\r\n\r\nAssigned\r\n\r\nMessage to write on the card:\r\nAmnah I wish you a very Happy birthday from across the world\r\n\r\nMessage to write on the basket:\r\nBirthday hai...Aj tu kuch meetha kha le bhai', '2018-01-17 13:15:31', '2018-02-06 10:16:44'),
(70, 113, '2018-01-17', '2018-02-14', '12AM', '200', 'Lahore', '0', '2250.00', '0', '', 'Kindly don\'t mention the name of sender . I say it again Don\'t mention the name of the sender and make sure it is delivered on time at 12:00am and\r\n\r\nwrite the following things in the card :\r\n\r\nDear Sameer ( Iffu )\r\n\r\n          I am not going to write long paragraphs just wanted to say \" YOU MEAN THE WORLD TO ME \" . I love you.                       \r\n\r\n  from ( the person you know the best)', '0', '0', '0', '', '', '', '', 'YTWW', 'Easy Paisa', 'Canceled', 'Order Canceled', '2018-01-17 19:16:20', '2018-02-06 10:19:26'),
(71, 119, '2018-01-21', '2018-02-13', '11:30 PM', '200', 'Lahore', '0', '3250.00', '0', '', NULL, 'Special Event', 'Basket Oval', '77', 'Happy Valentines Day, Cutest J ever.', '', '#ff0000', '#ffffff', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-01-21 12:41:29', '2018-01-21 12:41:29'),
(72, 119, '2018-01-21', '2018-02-13', '11:30 PM', '200', 'Lahore', '0', '3250.00', '0', '', NULL, 'Special Event', 'Basket Oval', '77', 'Happy Valentines Day, Cutest J ever.', '', '#ff0000', '#ffffff', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-01-21 12:42:13', '2018-01-21 12:42:13'),
(73, 119, '2018-01-21', '2018-02-13', '11:30 PM', '200', 'Lahore', '0', '3250.00', '0', '', NULL, 'Special Event', 'Basket Oval', '77', 'Happy Valentines Day, Cutest J ever.', '', '#ff0000', '#ffffff', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-01-21 12:45:03', '2018-01-21 12:45:03'),
(74, 120, '2018-01-21', '2018-01-23', '12:00 am', '200', 'Lahore', '0', '3300.00', '0', '', 'Instruction:\r\nPlease deliver at 12:00-12:05 am\r\nMessage for Birthday guy:\r\n\"Since we can read each other\'s minds\r\nI don\'t need a creative message\r\nWishing you a wonderful birthday!\r\nTo make your day special, \r\nA little effort by your loved one...\"', '0', '0', '0', '', '', '', '', 'YTWW', 'Easy Paisa', 'Delivered', 'Order Delivered', '2018-01-21 16:10:12', '2018-01-23 12:59:32'),
(75, 134, '2018-01-29', '2018-02-14', '5 PM', '200', 'Lahore', '0', '3150.00', '0', '', 'if you guys can add a beautiful valentines day card with it.', 'Special Event', 'Basket Oval', NULL, 'Happy Valentines Day !', '', '#fd0000', '#000000', 'YTWW', 'Bank Transfer', 'Assigned', 'Confirmation Sent\r\nAdded in file', '2018-01-29 11:55:43', '2018-02-06 10:15:24'),
(76, 136, '2018-01-29', '2018-02-02', '2pm', '200', 'Lahore', '0', '2700.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Easy Paisa', 'Delivered', 'Confirmation Sent\r\nTeddy Changed due to no stock\r\nAdded in files.\r\nDelivered', '2018-01-29 16:30:03', '2018-02-06 10:09:50'),
(77, 60, '2018-01-31', '2018-02-13', '11pm', '200', 'Lahore', '0', '2250.00', '2380', '', 'It should be the perfect', 'Special Event', 'Basket White', '76', NULL, '', '#ff0000', '#0000ff', 'YTWW', 'Easy Paisa', 'Assigned', 'Confirmation Sent\r\nPayment Done', '2018-01-31 09:06:40', '2018-02-06 10:09:32'),
(78, 42, '2018-02-02', '2018-02-15', '', '200', 'Lahore', '0', '2700.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-02-02 05:38:14', '2018-02-02 05:38:14'),
(79, 42, '2018-02-02', '2018-02-23', '', '200', 'Lahore', '0', '2700.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-02-02 05:42:14', '2018-02-02 05:42:14'),
(80, 141, '2018-02-03', '2018-02-14', '6 PM', '200', 'Lahore', '0', '1700.00', '0', '', 'It should be packed well and the items in it should be fresh!!!!!', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Assigned', 'Confirmation Sent', '2018-02-03 14:34:56', '2018-02-06 10:23:03'),
(81, 142, '2018-02-04', '2018-02-04', '', '200', 'Lahore', '0', '2450.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-02-04 13:27:42', '2018-02-04 13:27:42'),
(82, 142, '2018-02-04', '2018-02-04', '', '200', 'Lahore', '0', '2450.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-02-04 13:28:32', '2018-02-04 13:28:32'),
(83, 142, '2018-02-04', '2018-02-14', '10am', '200', 'Lahore', '0', '2450.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Assigned', 'Confirmation Sent on FB Page name in urdu', '2018-02-04 15:21:14', '2018-02-06 10:13:18'),
(84, 92, '2018-02-06', '2018-02-09', '12 PM', '200', 'Lahore', '0', '4200.00', '0', '', 'Happy Chocolate Day Mahzib', 'Special Event', 'Basket White', '76', NULL, '', '#ffffff', '#000000', 'YTWW', 'Easy Paisa', 'Un-Assigned', '', '2018-02-06 05:49:03', '2018-02-06 05:49:03'),
(85, 92, '2018-02-06', '2018-02-09', '12 PM', '200', 'Lahore', '0', '2200.00', '0', '', 'Happy Chocolate day mahzib', '0', '0', '0', '', '', '', '', 'YTWW', 'Cash on Delivery', 'Un-Assigned', '', '2018-02-06 05:53:50', '2018-02-06 05:53:50'),
(86, 150, '2018-02-11', '2018-02-12', '12pm', '200', 'Lahore', '0', '2800.00', '2800', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Delivered', 'Confirmation Sent\r\nOrder Delivered', '2018-02-11 07:08:45', '2018-02-12 12:59:26'),
(87, 151, '2018-02-13', '2018-02-14', '1 PM', '200', 'Lahore', '0', '2200.00', '0', '', 'Kindly deliever it too Mayo Hospital internee girls hostel near emergency building.', '0', '0', '0', '', '', '', '', 'Self', 'Easy Paisa', 'Un-Assigned', '', '2018-02-13 13:26:37', '2018-02-13 13:26:37'),
(88, 152, '2018-02-13', '2018-02-14', '3 PM', '200', 'Lahore', '0', '3100.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-02-13 21:15:58', '2018-02-13 21:15:58'),
(89, 152, '2018-02-13', '2018-02-14', '3 PM', '200', 'Lahore', '0', '3300.00', '0', '', 'None', 'Birthday', 'Basket White', NULL, 'Happy Birthday Anaab!', '', '#ffffff', '#000000', 'YTWW', 'Bank Transfer', 'Delivered', 'Confirmed. \r\nAdded in files.\r\nDelivered', '2018-02-13 21:22:35', '2018-02-16 12:29:34'),
(90, 158, '2018-03-04', '2018-03-07', '4 PM', '200', 'Lahore', '0', '1800.00', '1800', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Delivered', 'Confirmation Sent\r\nAssigned\r\nOrder Delivered', '2018-03-04 14:09:01', '2018-03-07 11:43:19'),
(91, 161, '2018-03-14', '2018-03-14', '', '200', 'Lahore', '0', '5700.00', '0', '', 'Should be delivered by 12 am on 15 th march\r\nOr deliver it in the morning from 9 am till 2am,', 'Birthday', 'Basket White', '76', '', '', 'Black', 'Black', 'YTWW', 'Cash on Delivery', 'Canceled', 'Due to no Credit Card', '2018-03-14 18:55:42', '2018-03-14 19:23:43'),
(92, 164, '2018-03-24', '2018-03-24', '', '200', 'Lahore', '0', '3500.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', 'Late from our side in confirmation. Missed deadline.', '2018-03-24 09:03:25', '2018-03-26 08:40:39'),
(93, 174, '2018-04-06', '2018-04-07', '10 am', '200', 'Lahore', '0', '3250.00', '0', '', 'None', 'Birthday', 'Basket White', NULL, 'Happy birthday sastay :p', '', '#ffffff', '#00ffff', 'YTWW', 'Cash on Delivery', 'Delivered', 'Confirmation Sent', '2018-04-06 19:45:28', '2018-04-08 12:23:02'),
(94, 43, '2018-04-08', '2018-04-10', '', '200', 'Lahore', '0', '2200.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', 's', '2018-04-08 20:13:18', '2018-04-08 21:07:16'),
(95, 177, '2018-04-12', '2018-04-17', '10 AM', '200', 'Lahore', '0', '2450.00', '2450', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Delivered', 'Confirmation Sent with Payment details.\r\nDelivered', '2018-04-12 21:25:48', '2018-04-17 07:30:51'),
(96, 178, '2018-04-15', '2018-04-21', '1pm', '200', 'Lahore', '0', '2200.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Cash on Delivery', 'Canceled', 'Canceled by client', '2018-04-15 15:50:01', '2018-04-20 07:22:13'),
(97, 181, '2018-04-21', '2018-04-21', '6', '200', 'Lahore', '0', '4200.00', '0', '', 'Please don\'t let the chocolates melt', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', 'No response', '2018-04-21 09:43:07', '2018-04-23 11:12:47'),
(98, 182, '2018-04-22', '2018-04-28', '12 am', '200', 'Lahore', '353', '2197.50', '2198', 'Anniversary', 'Message on cake: Happy Birthday ZS', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Delivered', 'Total Payment: 2348 (midnight delivery charges 150)\r\nConfirmation and payment message sent.', '2018-04-22 15:05:37', '2018-04-28 18:09:03'),
(99, 188, '2018-05-01', '2018-05-13', '2pm', '200', 'Lahore', '0', '2400.00', '0', '', 'On card do write these lines please. \"Mom, I cannot thank you enough for what you have done me. You were always there when I needed you the most. To the world you might be a Mom, but to our family you are the World. Happy mothers day Maa!  Live long!  Ameen. \r\nFrom, your loving daughters. \"', '0', '0', '0', '', '', '', '', 'YTWW', 'Cash on Delivery', 'Assigned', 'Assigned on sheet. Confirmation Sent', '2018-05-01 10:22:51', '2018-05-02 12:11:43'),
(100, 60, '2018-05-12', '2018-05-12', '', '200', 'Lahore', '0', '1650.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Cash on Delivery', 'Canceled', 'duplicate order', '2018-05-12 16:25:56', '2018-05-12 20:02:01'),
(101, 60, '2018-05-12', '2018-05-13', '12am', '200', 'Lahore', '0', '1600.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Cash on Delivery', 'Canceled', 'duplicate order', '2018-05-12 16:29:53', '2018-05-12 20:01:51'),
(102, 207, '2018-05-13', '2018-05-13', '2 PM', '200', 'Lahore', '0', '2600.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Delivered', 'Confrimation sent\r\nAssigned on sheet', '2018-05-13 05:46:20', '2018-05-13 16:17:47'),
(103, 211, '2018-05-18', '2018-05-19', '6:30 pm', '200', 'Lahore', '0', '2150.00', '0', '', 'Please use light blue net for bouquet wrapping instead of white. Thanks.', '0', '0', '0', '', '', '', '', 'YTWW', 'Easy Paisa', 'Delivered', 'Confirmation sent\r\nAssigned on page\r\nOrder Delivered', '2018-05-18 06:08:06', '2018-05-21 06:51:07'),
(104, 220, '2018-05-30', '2018-05-30', '11 PM', '200', 'Lahore', '0', '2200.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'Self', 'Bank Transfer', 'Delivered', 'Confirmation Sent', '2018-05-30 16:14:45', '2018-05-31 09:06:28'),
(105, 222, '2018-05-31', '2018-06-08', '10', '200', 'Lahore', '0', '9700.00', '0', '', 'use black and red colors in packing  please', 'Birthday', 'Basket Golden', '77', 'Happy Birthday !!!', '', '#ffffff', '#000000', 'Self', 'Cash on Delivery', 'Delivered', 'Confirmation Sent on whatsapp\r\nexclude perfume. Fix hour delivery 7350.', '2018-05-31 09:17:15', '2018-06-08 16:57:06'),
(106, 227, '2018-06-13', '2018-06-16', '12 pm', '200', 'Lahore', '0', '4250.00', '0', '', 'Kindly deliver the package on Eid day 1', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Delivered', 'Confirmation Message done from Page. \r\nAssigned Paid and delivered', '2018-06-13 11:13:20', '2018-06-16 19:32:41'),
(107, 228, '2018-06-14', '2018-06-14', '9 pm', '200', 'Lahore', '0', '4650.00', '0', '', 'Writing on card:  Dear Uncle Congratulations\r\n                            They are lucky to have you \r\n                                Love STHN family \r\n                                   ( Ruby)', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Delivered', 'Assigned on sheet\r\ndelivered and Paid', '2018-06-14 12:51:01', '2018-06-16 19:32:28'),
(108, 229, '2018-06-17', '2018-06-17', '', '200', 'Lahore', '0', '1250.00', '0', '', 'Plz write \" Happy fathers day from Nazziha, Muhammad, zainab and Mariam\"\r\nThank you for being a loving dad', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Canceled', 'Confirmation Sent. Waiting for approval', '2018-06-17 10:34:10', '2018-06-20 08:48:13'),
(109, 232, '2018-06-20', '2018-06-20', '', '200', 'Lahore', '0', '2200.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Easy Paisa', 'Hold', 'Confirmation Message Sent\r\nNew Javeria contact 03334447794\r\nNo reply and number is off', '2018-06-20 17:14:57', '2018-06-21 17:39:25'),
(110, 233, '2018-06-21', '2018-06-21', '', '200', 'Lahore', '0', '1700.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'Self', 'Bank Transfer', 'Canceled', 'Confirmation Sent.\r\nCancelled due to late confirmation and less time to order delivery', '2018-06-21 11:16:40', '2018-06-21 17:43:51'),
(111, 236, '2018-06-24', '2018-06-26', '12 AM', '200', 'Lahore', '0', '2480.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Easy Paisa', 'Un-Assigned', '', '2018-06-24 21:50:48', '2018-06-24 21:50:48'),
(112, 236, '2018-06-24', '2018-06-26', '12 AM', '200', 'Lahore', '0', '2480.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Easy Paisa', 'Un-Assigned', '', '2018-06-24 21:50:58', '2018-06-24 21:50:58'),
(113, 236, '2018-06-24', '2018-06-26', '12 AM', '200', 'Lahore', '0', '2480.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Easy Paisa', 'Un-Assigned', '', '2018-06-24 21:55:05', '2018-06-24 21:55:05'),
(114, 239, '2018-06-27', '2018-06-28', '1 pm', '200', 'Lahore', '0', '2100.00', '0', '', 'I want the bouquet to be wrapped in blue net', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Delivered', 'Confirmation Sent\r\nAssigned on sheet\r\nDelivered', '2018-06-27 11:25:42', '2018-06-29 10:37:09'),
(115, 242, '2018-07-03', '2018-07-06', '', '200', 'Lahore', '0', '4200.00', '0', NULL, 'None', 'Birthday', 'Basket White', '76', 'Your Love', '', '#ff0000', '#000000', 'YTWW', 'Bank Transfer', 'Delivered', 'Confirmation Sent\r\nNo basket \r\nMidnight delivery (7th Birthday)', '2018-07-03 20:41:07', '2018-07-09 07:44:47'),
(116, 262, '2018-07-24', '2018-07-27', '10 AM', '200', 'Lahore', '0', '4500.00', '0', '', 'I am ordering this for my Sister\'s Birthday. So kindly packaging should be done accordingly.', 'Special Event', 'Basket White', '76', 'Happy Birthday Zobia. May Allah bring loooooooooooooooooooooooots of happiness in your life.\r\nFrom Imran & Nida', '', '#ffffff', '#000000', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-07-24 10:24:42', '2018-07-24 10:24:42'),
(117, 262, '2018-07-24', '2018-07-27', '11:30 PM', '200', 'Lahore', '0', '2500.00', '0', '', 'None', 'Birthday', 'Basket White', NULL, 'Happy Bday my little sister . Wishing a you a wonderful and memorable year  ahead of u. Missiiiiiing u <3', '', '#ffffff', '#000000', 'YTWW', 'Bank Transfer', 'Assigned', 'Confirmation Sent\r\nAssigned', '2018-07-24 18:21:17', '2018-07-24 18:49:05'),
(118, 262, '2018-07-24', '2018-07-27', '10 AM', '200', 'Lahore', '0', '2500.00', '0', '', 'None', 'Birthday', 'Basket White', NULL, 'Happy Birthday Zobia. May Allah fulfill your life with loooooooooooooooots of happiness.\r\nFrom Imran & Nida', '', '#ffaeae', '#000000', 'YTWW', 'Bank Transfer', 'Delivered', 'Confirmation Sent\r\nAssigned', '2018-07-24 18:28:21', '2018-07-31 14:19:25'),
(119, 270, '2018-08-01', '2018-08-02', '10PM', '400', 'In Pakistan', '0', '2900.00', '0', '', 'None', 'Special Event', 'Basket White', NULL, NULL, '', 'Pink', NULL, 'YTWW', 'Cash on Delivery', 'Un-Assigned', '', '2018-08-01 21:07:05', '2018-08-01 21:07:05'),
(120, 270, '2018-08-02', '2018-08-03', '4PM', '200', 'Lahore', '0', '4700.00', '0', '', 'None', 'Special Event', 'Basket White', '76', NULL, '', 'Pink', NULL, 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-08-02 18:20:53', '2018-08-02 18:20:53'),
(121, 270, '2018-08-02', '2018-08-03', '4PM', '200', 'Lahore', '0', '200.00', '0', '', NULL, 'Special Event', 'Basket White', NULL, NULL, '', 'Pink', NULL, 'YTWW', 'Cash on Delivery', 'Un-Assigned', '', '2018-08-02 18:23:38', '2018-08-02 18:23:38'),
(122, 270, '2018-08-03', '2018-08-03', '7Pm', '200', 'Lahore', '0', '4700.00', '0', '', 'None', 'Special Event', 'Basket White', '76', 'Ammi get well soon', '', 'Pink', NULL, 'YTWW', 'Cash on Delivery', 'Un-Assigned', 'Confirmation Sent with payment method to update', '2018-08-03 11:24:17', '2018-08-04 07:43:59'),
(123, 273, '2018-08-06', '2018-08-07', '4:30 pm', '200', 'Lahore', '0', '2900.00', '0', '', 'is it possible to pack everything into one cute packaging, it\'s our anniversary I want it to be special for her', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Delivered', 'Confirmation Sent\r\nOrder delivered', '2018-08-06 17:37:38', '2018-08-07 12:14:59'),
(124, 283, '2018-08-13', '2018-08-15', '11:50pm', '200', 'Lahore', '0', '1350.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-08-13 13:26:43', '2018-08-13 13:26:43'),
(125, 283, '2018-08-13', '2018-08-15', '11:50pm', '200', 'Lahore', '0', '1350.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Cash on Delivery', 'Canceled', 'Confirmation sent\r\nno response', '2018-08-13 14:09:31', '2018-08-17 14:45:02'),
(126, 113, '2018-08-26', '2018-09-02', '12 AM', '200', 'Lahore', '0', '6100.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-08-26 14:19:24', '2018-08-26 14:19:24'),
(127, 113, '2018-08-26', '2018-09-02', '10 AM', '200', 'Lahore', '0', '6400.00', '0', '', 'WRITE this on card :\r\n                                                  Happy Birthday \r\nand please make sure things are organized and well maintained .and kindly DONOT mention the senders name on any of the card or gift please .', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Assigned', 'Assigned \r\nConfirmation sent', '2018-08-26 15:00:48', '2018-08-30 08:50:23'),
(128, 291, '2018-08-28', '2018-08-31', '11:55', '200', 'Lahore', '0', '2200.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-08-28 19:45:02', '2018-08-28 19:45:02'),
(129, 292, '2018-08-31', '2018-09-03', '3pm', '200', 'Lahore', '0', '2250.00', '2550', '', NULL, 'Birthday', 'Basket White', '76', 'Happy birthday samm \r\nFrom huda', '', '#ffffff', '#b8b800', 'YTWW', 'Cash on Delivery', 'Delivered', 'Confirmation Sent\r\nPayment updated 2550\r\nWaiting for payment Confirmation', '2018-08-31 08:28:10', '2018-09-06 10:58:41'),
(130, 298, '2018-09-08', '2018-09-14', '12 AM', '200', 'Lahore', '0', '3200.00', '0', '', NULL, 'Birthday', 'Basket Oval', '77', 'Happy Birthday To My Beautiful Wife\r\nMay You Have Many More\r\nYou Are The Best Gift To Me From Allah', '', '#ff8040', '#ffff00', 'Self', 'Bank Transfer', 'Un-Assigned', '', '2018-09-08 14:37:23', '2018-09-08 14:37:23'),
(131, 298, '2018-09-08', '2018-09-14', '12 AM', '200', 'Lahore', '0', '3200.00', '0', '', NULL, 'Birthday', 'Basket Oval', '77', 'Happy Birthday To My Beautiful Wife\r\nMay You Have Many More\r\nYou Are The Best Gift To Me From Allah', '', '#ff8040', '#ffff00', 'Self', 'Bank Transfer', 'Un-Assigned', '', '2018-09-08 14:38:32', '2018-09-08 14:38:32'),
(132, 298, '2018-09-08', '2018-09-14', '12 AM', '200', 'Lahore', '0', '3200.00', '0', '', NULL, 'Birthday', 'Basket Oval', '77', 'Happy Birthday To My Beautiful Wife\r\nMay You Have Many More\r\nYou Are The Best Gift To Me From Allah', '', '#ff8040', '#ffff00', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-09-08 14:40:17', '2018-09-08 14:40:17'),
(133, 298, '2018-09-08', '2018-09-14', '12 AM', '200', 'Lahore', '0', '3200.00', '0', '', NULL, 'Birthday', 'Basket Oval', '77', 'Happy Birthday To My Beautiful Wife\r\nMay You Have Many More\r\nYou Are The Best Gift To Me From Allah', '', '#ff8040', '#ffff00', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-09-08 14:41:12', '2018-09-08 14:41:12'),
(134, 298, '2018-09-08', '2018-09-14', '12 AM', '200', 'Lahore', '0', '3300.00', '0', '', 'Theme Should be in Red Color and Hand Written Card Text Should Be\r\nHappy Birthday to my Beautiful Wife\r\nMay You Have Many More\r\nYou Are The Best Gift to Me From Allah', '0', '0', '0', '', '', '', '', 'YTWW', 'Bank Transfer', 'Un-Assigned', '', '2018-09-08 14:52:08', '2018-09-08 14:52:08'),
(135, 298, '2018-09-08', '2018-09-14', '12 AM', '200', 'Lahore', '0', '3300.00', '0', '', 'Theme Should be in Red Color and Hand Written Card Text Should Be\r\nHappy Birthday to my Beautiful Wife\r\nMay You Have Many More\r\nYou Are The Best Gift to Me From Allah', '0', '0', '0', '', '', '', '', 'Self', 'Bank Transfer', 'Un-Assigned', '', '2018-09-08 14:52:29', '2018-09-08 14:52:29'),
(136, 298, '2018-09-08', '2018-09-14', '12 AM', '200', 'Lahore', '0', '3300.00', '0', '', 'Theme Should be in Red Color and Hand Written Card Text Should Be\r\nHappy Birthday to my Beautiful Wife\r\nMay You Have Many More\r\nYou Are The Best Gift to Me From Allah', '0', '0', '0', '', '', '', '', 'Self', 'Cash on Delivery', 'Un-Assigned', '', '2018-09-08 14:52:48', '2018-09-08 14:52:48'),
(137, 298, '2018-09-08', '2018-09-14', '12 AM', '200', 'Lahore', '0', '3300.00', '0', '', 'Theme Should be in Red Color and Hand Written Card Text Should Be\r\nHappy Birthday to my Beautiful Wife\r\nMay You Have Many More\r\nYou Are The Best Gift to Me From Allah', '0', '0', '0', '', '', '', '', 'Self', 'Bank Transfer', 'Un-Assigned', '', '2018-09-08 14:52:56', '2018-09-08 14:52:56'),
(138, 315, '2018-10-02', '2018-10-03', '', '200', 'Lahore', '0', '3200.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'Self', 'Bank Transfer', 'Un-Assigned', '', '2018-10-02 07:46:10', '2018-10-02 07:46:10'),
(139, 317, '2018-10-15', '2018-10-16', '11:55pm', '200', 'Lahore', '0', '2250.00', '0', '', NULL, 'Birthday', 'Basket White', '76', NULL, '', '#ffffff', '#000000', 'YTWW', 'Easy Paisa', 'Un-Assigned', '', '2018-10-15 14:10:23', '2018-10-15 14:10:24'),
(140, 325, '2018-10-18', '2018-10-25', '5 PM', '200', 'Lahore', '0', '3200.00', '0', '', 'Keep the packing beautiful and elegeant.', 'Birthday', 'Basket White', '77', '1 Happy Birthday Meenu\r\n2 Te Amo\r\n3 Miss you\r\n4 Love you soul sister', '', '#000000', '#d12a2a', 'YTWW', 'Easy Paisa', 'Un-Assigned', '', '2018-10-18 17:54:40', '2018-10-18 17:54:40'),
(141, 337, '2018-10-28', '2018-10-28', '', '200', 'Lahore', '0', '2000.00', '0', '', 'None', '0', '0', '0', '', '', '', '', 'YTWW', 'Cash on Delivery', 'Un-Assigned', '', '2018-10-28 22:28:14', '2018-10-28 22:28:14');

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
(57, 39, 31, 1, '4000.00', '4000.00', '0.00', 0, '2017-11-01 08:42:04', '2017-11-01 08:42:04'),
(58, 39, 12, 1, '1200.00', '1200.00', '0.00', 0, '2017-11-01 08:42:04', '2017-11-01 08:42:04'),
(59, 40, 26, 1, '2350.00', '2350.00', '0.00', 0, '2017-11-01 09:41:44', '2017-11-01 09:41:44'),
(60, 40, 53, 1, '1150.00', '1150.00', '0.00', 0, '2017-11-01 09:41:44', '2017-11-01 09:41:44'),
(61, 40, 12, 5, '1200.00', '6000.00', '0.00', 0, '2017-11-01 09:41:44', '2017-11-01 09:41:44'),
(62, 41, 74, 1, '300.00', '300.00', '0.00', 0, '2017-12-11 06:35:51', '2017-12-11 06:35:51'),
(63, 41, 76, 1, '2000.00', '2000.00', '0.00', 0, '2017-12-11 06:35:51', '2017-12-11 06:35:51'),
(64, 42, 76, 1, '2000.00', '2000.00', '0.00', 0, '2017-12-12 15:03:28', '2017-12-12 15:03:28'),
(65, 43, 30, 1, '5000.00', '5000.00', '0.00', 0, '2017-12-12 15:08:27', '2017-12-12 15:08:27'),
(66, 43, 54, 1, '2850.00', '2850.00', '0.00', 0, '2017-12-12 15:08:27', '2017-12-12 15:08:27'),
(67, 43, 71, 1, '250.00', '250.00', '0.00', 0, '2017-12-12 15:08:27', '2017-12-12 15:08:27'),
(68, 43, 14, 1, '700.00', '700.00', '0.00', 0, '2017-12-12 15:08:27', '2017-12-12 15:08:27'),
(69, 44, 31, 1, '4000.00', '4000.00', '0.00', 0, '2017-12-12 15:33:23', '2017-12-12 15:33:23'),
(70, 46, 12, 1, '1200.00', '1200.00', '0.00', 0, '2017-12-13 18:11:08', '2017-12-13 18:11:08'),
(71, 46, 76, 1, '2000.00', '2000.00', '0.00', 0, '2017-12-13 18:11:08', '2017-12-13 18:11:08'),
(72, 47, 13, 1, '350.00', '350.00', '0.00', 0, '2017-12-18 20:50:34', '2017-12-18 20:50:34'),
(73, 47, 79, 1, '800.00', '800.00', '0.00', 0, '2017-12-18 20:50:34', '2017-12-18 20:50:34'),
(74, 47, 47, 1, '1150.00', '1150.00', '0.00', 0, '2017-12-18 20:50:34', '2017-12-18 20:50:34'),
(75, 47, 30, 1, '5000.00', '5000.00', '0.00', 0, '2017-12-18 20:50:34', '2017-12-18 20:50:34'),
(76, 48, 31, 1, '4000.00', '4000.00', '0.00', 0, '2017-12-20 16:00:07', '2017-12-20 16:00:07'),
(77, 49, 43, 1, '1750.00', '1750.00', '0.00', 0, '2017-12-20 16:16:58', '2017-12-20 16:16:58'),
(78, 50, 43, 1, '1750.00', '1750.00', '0.00', 0, '2017-12-20 16:20:28', '2017-12-20 16:20:28'),
(79, 51, 88, 1, '1200.00', '1200.00', '0.00', 0, '2017-12-20 16:21:21', '2017-12-20 16:21:21'),
(80, 52, 88, 1, '1200.00', '1200.00', '0.00', 0, '2017-12-20 16:27:54', '2017-12-20 16:27:54'),
(81, 53, 47, 1, '1150.00', '1150.00', '0.00', 0, '2017-12-20 20:53:52', '2017-12-20 20:53:52'),
(82, 53, 79, 1, '800.00', '800.00', '0.00', 0, '2017-12-20 20:53:52', '2017-12-20 20:53:52'),
(83, 53, 89, 1, '50.00', '50.00', '0.00', 0, '2017-12-20 20:53:52', '2017-12-20 20:53:52'),
(84, 54, 91, 1, '1400.00', '1400.00', '0.00', 0, '2017-12-21 05:04:53', '2017-12-21 05:04:53'),
(85, 55, 91, 1, '1400.00', '1400.00', '0.00', 0, '2017-12-21 05:06:41', '2017-12-21 05:06:41'),
(86, 55, 77, 1, '3000.00', '3000.00', '0.00', 0, '2017-12-21 05:06:41', '2017-12-21 05:06:41'),
(87, 56, 87, 1, '1500.00', '1500.00', '0.00', 0, '2017-12-21 05:54:34', '2017-12-21 05:54:34'),
(88, 57, 87, 1, '1500.00', '1500.00', '0.00', 0, '2017-12-21 05:55:19', '2017-12-21 05:55:19'),
(89, 57, 76, 1, '2000.00', '2000.00', '0.00', 0, '2017-12-21 05:55:19', '2017-12-21 05:55:19'),
(90, 58, 84, 1, '2000.00', '2000.00', '0.00', 0, '2017-12-21 06:39:39', '2017-12-21 06:39:39'),
(91, 59, 91, 1, '1400.00', '1400.00', '0.00', 0, '2017-12-21 06:59:58', '2017-12-21 06:59:58'),
(92, 60, 82, 1, '1000.00', '1000.00', '0.00', 0, '2017-12-21 11:23:21', '2017-12-21 11:23:21'),
(93, 61, 76, 1, '2000.00', '2000.00', '0.00', 0, '2017-12-21 20:06:28', '2017-12-21 20:06:28'),
(94, 62, 44, 1, '2750.00', '2750.00', '0.00', 0, '2017-12-26 06:01:35', '2017-12-26 06:01:35'),
(95, 63, 102, 1, '2000.00', '2000.00', '0.00', 0, '2017-12-26 13:01:12', '2017-12-26 13:01:12'),
(96, 64, 28, 1, '1750.00', '1750.00', '0.00', 0, '2017-12-30 10:46:19', '2017-12-30 10:46:19'),
(97, 65, 121, 1, '1575.00', '1575.00', '0.00', 0, '2018-01-10 12:22:25', '2018-01-10 12:22:25'),
(98, 66, 101, 1, '2250.00', '2250.00', '0.00', 0, '2018-01-13 21:59:52', '2018-01-13 21:59:52'),
(99, 67, 92, 1, '1200.00', '1200.00', '0.00', 0, '2018-01-13 22:05:47', '2018-01-13 22:05:47'),
(100, 68, 32, 1, '2350.00', '2350.00', '0.00', 0, '2018-01-16 11:19:14', '2018-01-16 11:19:14'),
(101, 68, 21, 1, '2000.00', '2000.00', '0.00', 0, '2018-01-16 11:19:14', '2018-01-16 11:19:14'),
(102, 69, 93, 1, '1600.00', '1600.00', '0.00', 0, '2018-01-17 13:15:31', '2018-01-17 13:15:31'),
(103, 69, 48, 1, '1050.00', '1050.00', '0.00', 0, '2018-01-17 13:15:31', '2018-01-17 13:15:31'),
(104, 69, 60, 1, '300.00', '300.00', '0.00', 0, '2018-01-17 13:15:31', '2018-01-17 13:15:31'),
(105, 70, 129, 1, '2000.00', '2000.00', '0.00', 0, '2018-01-17 19:16:20', '2018-01-17 19:16:20'),
(106, 70, 89, 1, '50.00', '50.00', '0.00', 0, '2018-01-17 19:16:20', '2018-01-17 19:16:20'),
(107, 71, 89, 1, '50.00', '50.00', '0.00', 0, '2018-01-21 12:41:29', '2018-01-21 12:41:29'),
(108, 71, 77, 1, '3000.00', '3000.00', '0.00', 0, '2018-01-21 12:41:29', '2018-01-21 12:41:29'),
(109, 72, 89, 1, '50.00', '50.00', '0.00', 0, '2018-01-21 12:42:13', '2018-01-21 12:42:13'),
(110, 72, 77, 1, '3000.00', '3000.00', '0.00', 0, '2018-01-21 12:42:13', '2018-01-21 12:42:13'),
(111, 73, 89, 1, '50.00', '50.00', '0.00', 0, '2018-01-21 12:45:03', '2018-01-21 12:45:03'),
(112, 73, 77, 1, '3000.00', '3000.00', '0.00', 0, '2018-01-21 12:45:03', '2018-01-21 12:45:03'),
(113, 74, 93, 1, '1600.00', '1600.00', '0.00', 0, '2018-01-21 16:10:12', '2018-01-21 16:10:12'),
(114, 74, 123, 1, '1500.00', '1500.00', '0.00', 0, '2018-01-21 16:10:12', '2018-01-21 16:10:12'),
(115, 75, 91, 1, '1400.00', '1400.00', '0.00', 0, '2018-01-29 11:55:43', '2018-01-29 11:55:43'),
(116, 75, 123, 1, '1500.00', '1500.00', '0.00', 0, '2018-01-29 11:55:43', '2018-01-29 11:55:43'),
(117, 75, 89, 1, '50.00', '50.00', '0.00', 0, '2018-01-29 11:55:43', '2018-01-29 11:55:43'),
(118, 76, 120, 1, '2500.00', '2500.00', '0.00', 0, '2018-01-29 16:30:03', '2018-01-29 16:30:03'),
(119, 77, 89, 1, '50.00', '50.00', '0.00', 0, '2018-01-31 09:06:40', '2018-01-31 09:06:40'),
(120, 77, 76, 1, '2000.00', '2000.00', '0.00', 0, '2018-01-31 09:06:40', '2018-01-31 09:06:40'),
(121, 78, 132, 1, '2500.00', '2500.00', '0.00', 0, '2018-02-02 05:38:14', '2018-02-02 05:38:14'),
(122, 79, 132, 1, '2500.00', '2500.00', '0.00', 0, '2018-02-02 05:42:14', '2018-02-02 05:42:14'),
(123, 80, 128, 1, '1500.00', '1500.00', '0.00', 0, '2018-02-03 14:34:56', '2018-02-03 14:34:56'),
(124, 81, 82, 1, '1100.00', '1100.00', '0.00', 0, '2018-02-04 13:27:42', '2018-02-04 13:27:42'),
(125, 81, 47, 1, '1150.00', '1150.00', '0.00', 0, '2018-02-04 13:27:42', '2018-02-04 13:27:42'),
(126, 82, 82, 1, '1100.00', '1100.00', '0.00', 0, '2018-02-04 13:28:32', '2018-02-04 13:28:32'),
(127, 82, 47, 1, '1150.00', '1150.00', '0.00', 0, '2018-02-04 13:28:32', '2018-02-04 13:28:32'),
(128, 83, 82, 1, '1100.00', '1100.00', '0.00', 0, '2018-02-04 15:21:14', '2018-02-04 15:21:14'),
(129, 83, 47, 1, '1150.00', '1150.00', '0.00', 0, '2018-02-04 15:21:14', '2018-02-04 15:21:14'),
(130, 84, 102, 1, '2000.00', '2000.00', '0.00', 0, '2018-02-06 05:49:03', '2018-02-06 05:49:03'),
(131, 84, 76, 1, '2000.00', '2000.00', '0.00', 0, '2018-02-06 05:49:03', '2018-02-06 05:49:03'),
(132, 85, 84, 1, '2000.00', '2000.00', '0.00', 0, '2018-02-06 05:53:50', '2018-02-06 05:53:50'),
(133, 86, 90, 1, '1250.00', '1250.00', '0.00', 0, '2018-02-11 07:08:45', '2018-02-11 07:08:45'),
(134, 86, 47, 1, '1150.00', '1150.00', '0.00', 0, '2018-02-11 07:08:45', '2018-02-11 07:08:45'),
(135, 86, 94, 1, '200.00', '200.00', '0.00', 0, '2018-02-11 07:08:45', '2018-02-11 07:08:45'),
(136, 87, 84, 1, '2000.00', '2000.00', '0.00', 0, '2018-02-13 13:26:37', '2018-02-13 13:26:37'),
(137, 88, 91, 1, '1400.00', '1400.00', '0.00', 0, '2018-02-13 21:15:58', '2018-02-13 21:15:58'),
(138, 88, 95, 1, '1500.00', '1500.00', '0.00', 0, '2018-02-13 21:15:58', '2018-02-13 21:15:58'),
(139, 89, 91, 1, '1400.00', '1400.00', '0.00', 0, '2018-02-13 21:22:35', '2018-02-13 21:22:35'),
(140, 89, 95, 1, '1500.00', '1500.00', '0.00', 0, '2018-02-13 21:22:35', '2018-02-13 21:22:35'),
(141, 89, 94, 1, '200.00', '200.00', '0.00', 0, '2018-02-13 21:22:35', '2018-02-13 21:22:35'),
(142, 90, 72, 1, '250.00', '250.00', '0.00', 0, '2018-03-04 14:09:01', '2018-03-04 14:09:01'),
(143, 90, 17, 1, '1350.00', '1350.00', '0.00', 0, '2018-03-04 14:09:01', '2018-03-04 14:09:01'),
(144, 91, 102, 1, '2000.00', '2000.00', '0.00', 0, '2018-03-14 18:55:42', '2018-03-14 18:55:42'),
(145, 91, 123, 1, '1500.00', '1500.00', '0.00', 0, '2018-03-14 18:55:42', '2018-03-14 18:55:42'),
(146, 91, 76, 1, '2000.00', '2000.00', '0.00', 0, '2018-03-14 18:55:42', '2018-03-14 18:55:42'),
(147, 92, 126, 1, '3000.00', '3000.00', '0.00', 0, '2018-03-24 09:03:25', '2018-03-24 09:03:25'),
(148, 92, 61, 1, '300.00', '300.00', '0.00', 0, '2018-03-24 09:03:25', '2018-03-24 09:03:25'),
(149, 93, 81, 1, '1050.00', '1050.00', '0.00', 0, '2018-04-06 19:45:28', '2018-04-06 19:45:28'),
(150, 93, 137, 1, '2000.00', '2000.00', '0.00', 0, '2018-04-06 19:45:28', '2018-04-06 19:45:28'),
(151, 94, 153, 1, '2000.00', '2000.00', '0.00', 0, '2018-04-08 20:13:18', '2018-04-08 20:13:18'),
(152, 95, 101, 1, '2250.00', '2250.00', '0.00', 0, '2018-04-12 21:25:48', '2018-04-12 21:25:48'),
(153, 96, 86, 1, '2000.00', '2000.00', '0.00', 0, '2018-04-15 15:50:01', '2018-04-15 15:50:01'),
(154, 97, 31, 1, '4000.00', '4000.00', '0.00', 0, '2018-04-21 09:43:07', '2018-04-21 09:43:07'),
(155, 98, 3, 1, '2350.00', '2350.00', '0.00', 0, '2018-04-22 15:05:37', '2018-04-22 15:05:37'),
(156, 99, 48, 1, '1150.00', '1150.00', '0.00', 0, '2018-05-01 10:22:51', '2018-05-01 10:22:51'),
(157, 99, 80, 1, '800.00', '800.00', '0.00', 0, '2018-05-01 10:22:51', '2018-05-01 10:22:51'),
(158, 99, 71, 1, '250.00', '250.00', '0.00', 0, '2018-05-01 10:22:51', '2018-05-01 10:22:51'),
(159, 100, 47, 1, '1200.00', '1200.00', '0.00', 0, '2018-05-12 16:25:56', '2018-05-12 16:25:56'),
(160, 100, 71, 1, '250.00', '250.00', '0.00', 0, '2018-05-12 16:25:56', '2018-05-12 16:25:56'),
(161, 101, 47, 1, '1200.00', '1200.00', '0.00', 0, '2018-05-12 16:29:53', '2018-05-12 16:29:53'),
(162, 101, 136, 1, '200.00', '200.00', '0.00', 0, '2018-05-12 16:29:53', '2018-05-12 16:29:53'),
(163, 102, 159, 1, '2150.00', '2150.00', '0.00', 0, '2018-05-13 05:46:20', '2018-05-13 05:46:20'),
(164, 102, 71, 1, '250.00', '250.00', '0.00', 0, '2018-05-13 05:46:20', '2018-05-13 05:46:20'),
(165, 103, 49, 1, '1950.00', '1950.00', '0.00', 0, '2018-05-18 06:08:06', '2018-05-18 06:08:06'),
(166, 104, 80, 1, '800.00', '800.00', '0.00', 0, '2018-05-30 16:14:45', '2018-05-30 16:14:45'),
(167, 104, 47, 1, '1200.00', '1200.00', '0.00', 0, '2018-05-30 16:14:45', '2018-05-30 16:14:45'),
(168, 105, 37, 1, '3500.00', '3500.00', '0.00', 0, '2018-05-31 09:17:15', '2018-05-31 09:17:15'),
(169, 105, 118, 1, '2500.00', '2500.00', '0.00', 0, '2018-05-31 09:17:15', '2018-05-31 09:17:15'),
(170, 105, 89, 1, '50.00', '50.00', '0.00', 0, '2018-05-31 09:17:15', '2018-05-31 09:17:15'),
(171, 105, 97, 1, '450.00', '450.00', '0.00', 0, '2018-05-31 09:17:15', '2018-05-31 09:17:15'),
(172, 105, 77, 1, '3000.00', '3000.00', '0.00', 0, '2018-05-31 09:17:15', '2018-05-31 09:17:15'),
(173, 106, 21, 1, '2000.00', '2000.00', '0.00', 0, '2018-06-13 11:13:20', '2018-06-13 11:13:20'),
(174, 106, 102, 1, '2000.00', '2000.00', '0.00', 0, '2018-06-13 11:13:20', '2018-06-13 11:13:20'),
(175, 106, 89, 1, '50.00', '50.00', '0.00', 0, '2018-06-13 11:13:20', '2018-06-13 11:13:20'),
(176, 107, 135, 1, '1900.00', '1900.00', '0.00', 0, '2018-06-14 12:51:01', '2018-06-14 12:51:01'),
(177, 107, 3, 1, '2350.00', '2350.00', '0.00', 0, '2018-06-14 12:51:01', '2018-06-14 12:51:01'),
(178, 107, 136, 1, '200.00', '200.00', '0.00', 0, '2018-06-14 12:51:01', '2018-06-14 12:51:01'),
(179, 108, 45, 1, '1050.00', '1050.00', '0.00', 0, '2018-06-17 10:34:10', '2018-06-17 10:34:10'),
(180, 109, 112, 1, '2000.00', '2000.00', '0.00', 0, '2018-06-20 17:14:57', '2018-06-20 17:14:57'),
(181, 110, 95, 1, '1500.00', '1500.00', '0.00', 0, '2018-06-21 11:16:40', '2018-06-21 11:16:40'),
(182, 111, 47, 1, '1200.00', '1200.00', '0.00', 0, '2018-06-24 21:50:48', '2018-06-24 21:50:48'),
(183, 111, 127, 1, '1080.00', '1080.00', '0.00', 0, '2018-06-24 21:50:48', '2018-06-24 21:50:48'),
(184, 112, 47, 1, '1200.00', '1200.00', '0.00', 0, '2018-06-24 21:50:58', '2018-06-24 21:50:58'),
(185, 112, 127, 1, '1080.00', '1080.00', '0.00', 0, '2018-06-24 21:50:58', '2018-06-24 21:50:58'),
(186, 113, 47, 1, '1200.00', '1200.00', '0.00', 0, '2018-06-24 21:55:05', '2018-06-24 21:55:05'),
(187, 113, 127, 1, '1080.00', '1080.00', '0.00', 0, '2018-06-24 21:55:05', '2018-06-24 21:55:05'),
(188, 114, 149, 1, '350.00', '350.00', '0.00', 0, '2018-06-27 11:25:42', '2018-06-27 11:25:42'),
(189, 114, 46, 1, '1200.00', '1200.00', '0.00', 0, '2018-06-27 11:25:42', '2018-06-27 11:25:42'),
(190, 114, 13, 1, '350.00', '350.00', '0.00', 0, '2018-06-27 11:25:42', '2018-06-27 11:25:42'),
(191, 115, 78, 1, '850.00', '850.00', '0.00', 0, '2018-07-03 20:41:07', '2018-07-03 20:41:07'),
(192, 115, 48, 1, '1150.00', '1150.00', '0.00', 0, '2018-07-03 20:41:07', '2018-07-03 20:41:07'),
(193, 115, 76, 1, '2000.00', '2000.00', '0.00', 0, '2018-07-03 20:41:07', '2018-07-03 20:41:07'),
(194, 116, 86, 1, '2000.00', '2000.00', '0.00', 0, '2018-07-24 10:24:42', '2018-07-24 10:24:42'),
(195, 116, 60, 1, '300.00', '300.00', '0.00', 0, '2018-07-24 10:24:42', '2018-07-24 10:24:42'),
(196, 116, 76, 1, '2000.00', '2000.00', '0.00', 0, '2018-07-24 10:24:42', '2018-07-24 10:24:42'),
(197, 117, 60, 1, '300.00', '300.00', '0.00', 0, '2018-07-24 18:21:17', '2018-07-24 18:21:17'),
(198, 117, 129, 1, '2000.00', '2000.00', '0.00', 0, '2018-07-24 18:21:17', '2018-07-24 18:21:17'),
(199, 118, 60, 1, '300.00', '300.00', '0.00', 0, '2018-07-24 18:28:21', '2018-07-24 18:28:21'),
(200, 118, 86, 1, '2000.00', '2000.00', '0.00', 0, '2018-07-24 18:28:21', '2018-07-24 18:28:21'),
(201, 119, 158, 1, '2500.00', '2500.00', '0.00', 0, '2018-08-01 21:07:05', '2018-08-01 21:07:05'),
(202, 120, 158, 1, '2500.00', '2500.00', '0.00', 0, '2018-08-02 18:20:53', '2018-08-02 18:20:53'),
(203, 120, 76, 1, '2000.00', '2000.00', '0.00', 0, '2018-08-02 18:20:53', '2018-08-02 18:20:53'),
(204, 122, 158, 1, '2500.00', '2500.00', '0.00', 0, '2018-08-03 11:24:17', '2018-08-03 11:24:17'),
(205, 122, 76, 1, '2000.00', '2000.00', '0.00', 0, '2018-08-03 11:24:17', '2018-08-03 11:24:17'),
(206, 123, 72, 1, '250.00', '250.00', '0.00', 0, '2018-08-06 17:37:38', '2018-08-06 17:37:38'),
(207, 123, 129, 1, '2000.00', '2000.00', '0.00', 0, '2018-08-06 17:37:38', '2018-08-06 17:37:38'),
(208, 123, 97, 1, '450.00', '450.00', '0.00', 0, '2018-08-06 17:37:38', '2018-08-06 17:37:38'),
(209, 124, 4, 1, '1150.00', '1150.00', '0.00', 0, '2018-08-13 13:26:43', '2018-08-13 13:26:43'),
(210, 125, 4, 1, '1150.00', '1150.00', '0.00', 0, '2018-08-13 14:09:31', '2018-08-13 14:09:31'),
(211, 126, 120, 1, '2500.00', '2500.00', '0.00', 0, '2018-08-26 14:19:24', '2018-08-26 14:19:24'),
(212, 126, 135, 1, '1900.00', '1900.00', '0.00', 0, '2018-08-26 14:19:24', '2018-08-26 14:19:24'),
(213, 126, 128, 1, '1500.00', '1500.00', '0.00', 0, '2018-08-26 14:19:24', '2018-08-26 14:19:24'),
(214, 127, 120, 1, '2500.00', '2500.00', '0.00', 0, '2018-08-26 15:00:48', '2018-08-26 15:00:48'),
(215, 127, 135, 1, '1900.00', '1900.00', '0.00', 0, '2018-08-26 15:00:48', '2018-08-26 15:00:48'),
(216, 127, 128, 1, '1500.00', '1500.00', '0.00', 0, '2018-08-26 15:00:48', '2018-08-26 15:00:48'),
(217, 127, 60, 1, '300.00', '300.00', '0.00', 0, '2018-08-26 15:00:48', '2018-08-26 15:00:48'),
(218, 128, 137, 1, '2000.00', '2000.00', '0.00', 0, '2018-08-28 19:45:02', '2018-08-28 19:45:02'),
(219, 129, 89, 1, '50.00', '50.00', '0.00', 0, '2018-08-31 08:28:10', '2018-08-31 08:28:10'),
(220, 129, 76, 1, '2000.00', '2000.00', '0.00', 0, '2018-08-31 08:28:10', '2018-08-31 08:28:10'),
(221, 130, 77, 1, '3000.00', '3000.00', '0.00', 0, '2018-09-08 14:37:23', '2018-09-08 14:37:23'),
(222, 131, 77, 1, '3000.00', '3000.00', '0.00', 0, '2018-09-08 14:38:32', '2018-09-08 14:38:32'),
(223, 132, 77, 1, '3000.00', '3000.00', '0.00', 0, '2018-09-08 14:40:17', '2018-09-08 14:40:17'),
(224, 133, 77, 1, '3000.00', '3000.00', '0.00', 0, '2018-09-08 14:41:12', '2018-09-08 14:41:12'),
(225, 134, 17, 1, '1350.00', '1350.00', '0.00', 0, '2018-09-08 14:52:08', '2018-09-08 14:52:08'),
(226, 134, 104, 1, '1750.00', '1750.00', '0.00', 0, '2018-09-08 14:52:08', '2018-09-08 14:52:08'),
(227, 135, 17, 1, '1350.00', '1350.00', '0.00', 0, '2018-09-08 14:52:29', '2018-09-08 14:52:29'),
(228, 135, 104, 1, '1750.00', '1750.00', '0.00', 0, '2018-09-08 14:52:29', '2018-09-08 14:52:29'),
(229, 136, 17, 1, '1350.00', '1350.00', '0.00', 0, '2018-09-08 14:52:48', '2018-09-08 14:52:48'),
(230, 136, 104, 1, '1750.00', '1750.00', '0.00', 0, '2018-09-08 14:52:48', '2018-09-08 14:52:48'),
(231, 137, 17, 1, '1350.00', '1350.00', '0.00', 0, '2018-09-08 14:52:56', '2018-09-08 14:52:56'),
(232, 137, 104, 1, '1750.00', '1750.00', '0.00', 0, '2018-09-08 14:52:56', '2018-09-08 14:52:56'),
(233, 138, 161, 1, '3000.00', '3000.00', '0.00', 0, '2018-10-02 07:46:10', '2018-10-02 07:46:10'),
(234, 139, 89, 1, '50.00', '50.00', '0.00', 0, '2018-10-15 14:10:23', '2018-10-15 14:10:23'),
(235, 139, 76, 1, '2000.00', '2000.00', '0.00', 0, '2018-10-15 14:10:24', '2018-10-15 14:10:24'),
(236, 140, 77, 1, '3000.00', '3000.00', '0.00', 0, '2018-10-18 17:54:40', '2018-10-18 17:54:40'),
(237, 141, 121, 1, '1800.00', '1800.00', '0.00', 0, '2018-10-28 22:28:14', '2018-10-28 22:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `title`, `meta_description`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'about-us', 'About Us', 'meta description', '<p>You Think We Wrap is a Gift Portal Service offering a variety of Unique Gifts at Doorstep to Surprise your loved ones anywhere in Pakistan.</p><p><br>We Started our Operations in April 2016 from Lahore. Our Success rate is 100% so far with 100% Customer Satisfaction and we stand here because of our Quality Products and Customer Satisfaction.<br><br>We believe in bringing smiles to your loved ones even if you are not nearby. We Surprise like you will do by yourself. We always take an extra step to make things Perfect.<br><br>Our Products have a wide range of variety starting from Customized Gift Baskets, Chocolate bouquets, Cakes, Flowers, Hand Made Cards, Customized Frames, Customized Cushions and Much more. <br><br><u><b>Why Us?</b></u><br><br>Our team is dedicated in providing Quality Service despite any facts. We believe and focus to earn Customers instead of anything else. We focus on each and every Order as if it is our own Family which needs to be surprised. That is why we Stand Different from Others. We Deliver Gifts 24/7 anywhere, anytime even if it is Midnight.<br></p>', 1, NULL, '2017-12-14 00:03:43'),
(2, 'how-it-works', 'How it works?', 'something', '<h1>How it works?</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget vehicula est. Aenean a felis nunc. Duis efficitur ligula ut mollis fermentum. Aliquam pharetra justo nec lacus mollis venenatis. Vestibulum in lorem blandit, aliquam eros a, sollicitudin diam. Morbi elementum tincidunt lectus id vestibulum. Praesent pellentesque sodales erat. Curabitur nulla felis, porta ut malesuada nec, dapibus eget sapien. Praesent sed ornare odio. Phasellus facilisis mauris sit amet nisi sagittis efficitur. Cras nec erat laoreet, rutrum metus sagittis, condimentum purus. Morbi leo nisi, laoreet eget rutrum et, congue ut purus.</p>\n\n<p>Curabitur tristique erat eget ipsum finibus, non pretium ipsum fringilla. Nam congue purus non ipsum ullamcorper luctus. Duis laoreet nec nisi in accumsan. Nunc eros lorem, malesuada id lacus nec, pulvinar luctus mauris. Etiam fringilla vitae purus a ultrices. Ut hendrerit, metus sit amet luctus hendrerit, diam mi tristique mauris, eget fermentum tortor tortor ut libero. Donec non turpis eu risus tincidunt lobortis. Nunc magna metus, porta id commodo ullamcorper, bibendum vel quam. Aliquam ultrices aliquam sapien vel aliquet. Vivamus ut massa tempus, lacinia urna id, auctor nibh. Vestibulum dapibus lacinia elit, ac rutrum mi vestibulum a. Suspendisse potenti. Sed pretium lectus sit amet felis facilisis accumsan. Ut ut ipsum rhoncus, condimentum dui finibus, accumsan ipsum.</p>\n\n<p>Mauris vel purus sapien. Integer pulvinar metus lorem. Morbi blandit tellus vitae mi scelerisque, a pellentesque eros imperdiet. Fusce pharetra non felis ut commodo. In semper laoreet enim egestas aliquet. Phasellus in justo sed quam varius venenatis sed ac felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n\n<p>Ut elementum dolor sit amet ipsum suscipit hendrerit. Donec convallis sed lacus id venenatis. Morbi enim nulla, accumsan id dui id, dictum vehicula tortor. In eu ante et dui elementum elementum et et eros. Pellentesque bibendum neque eget elit suscipit, in suscipit metus venenatis. Aliquam erat volutpat. Cras consectetur, ipsum id porttitor rhoncus, risus neque blandit elit, eget dignissim libero eros sed ipsum. Donec mollis nisl dolor, eget accumsan urna pellentesque id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae lobortis nulla, a suscipit enim. Suspendisse turpis massa, tempor ac rutrum id, feugiat finibus nisl. Aliquam iaculis feugiat sem quis eleifend. Donec molestie accumsan est vitae egestas. Nulla facilisi. Vivamus fermentum tincidunt volutpat.</p>\n\n<p>Etiam ex purus, imperdiet et augue vitae, pretium eleifend lacus. Aenean sagittis sapien mi, et pretium ante pharetra vel. Nullam sit amet nisi a diam elementum egestas. Cras a orci sed ligula vehicula iaculis eu eu orci. Aliquam ultricies, est ac rutrum feugiat, diam urna ornare purus, sed blandit dolor elit a magna. Donec imperdiet pulvinar dui aliquet lacinia. Nam lacinia semper nunc, non vehicula lectus laoreet nec.</p>', 1, '2017-01-26 08:29:10', '2017-01-26 08:29:10'),
(3, 'faqs', 'FAQs', 'something', '<h1>FAQ</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget vehicula est. Aenean a felis nunc. Duis efficitur ligula ut mollis fermentum. Aliquam pharetra justo nec lacus mollis venenatis. Vestibulum in lorem blandit, aliquam eros a, sollicitudin diam. Morbi elementum tincidunt lectus id vestibulum. Praesent pellentesque sodales erat. Curabitur nulla felis, porta ut malesuada nec, dapibus eget sapien. Praesent sed ornare odio. Phasellus facilisis mauris sit amet nisi sagittis efficitur. Cras nec erat laoreet, rutrum metus sagittis, condimentum purus. Morbi leo nisi, laoreet eget rutrum et, congue ut purus.</p>\r\n\r\n<p>Curabitur tristique erat eget ipsum finibus, non pretium ipsum fringilla. Nam congue purus non ipsum ullamcorper luctus. Duis laoreet nec nisi in accumsan. Nunc eros lorem, malesuada id lacus nec, pulvinar luctus mauris. Etiam fringilla vitae purus a ultrices. Ut hendrerit, metus sit amet luctus hendrerit, diam mi tristique mauris, eget fermentum tortor tortor ut libero. Donec non turpis eu risus tincidunt lobortis. Nunc magna metus, porta id commodo ullamcorper, bibendum vel quam. Aliquam ultrices aliquam sapien vel aliquet. Vivamus ut massa tempus, lacinia urna id, auctor nibh. Vestibulum dapibus lacinia elit, ac rutrum mi vestibulum a. Suspendisse potenti. Sed pretium lectus sit amet felis facilisis accumsan. Ut ut ipsum rhoncus, condimentum dui finibus, accumsan ipsum.</p>\r\n\r\n<p>Mauris vel purus sapien. Integer pulvinar metus lorem. Morbi blandit tellus vitae mi scelerisque, a pellentesque eros imperdiet. Fusce pharetra non felis ut commodo. In semper laoreet enim egestas aliquet. Phasellus in justo sed quam varius venenatis sed ac felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\r\n\r\n<p>Ut elementum dolor sit amet ipsum suscipit hendrerit. Donec convallis sed lacus id venenatis. Morbi enim nulla, accumsan id dui id, dictum vehicula tortor. In eu ante et dui elementum elementum et et eros. Pellentesque bibendum neque eget elit suscipit, in suscipit metus venenatis. Aliquam erat volutpat. Cras consectetur, ipsum id porttitor rhoncus, risus neque blandit elit, eget dignissim libero eros sed ipsum. Donec mollis nisl dolor, eget accumsan urna pellentesque id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae lobortis nulla, a suscipit enim. Suspendisse turpis massa, tempor ac rutrum id, feugiat finibus nisl. Aliquam iaculis feugiat sem quis eleifend. Donec molestie accumsan est vitae egestas. Nulla facilisi. Vivamus fermentum tincidunt volutpat.</p>\r\n\r\n<p>Etiam ex purus, imperdiet et augue vitae, pretium eleifend lacus. Aenean sagittis sapien mi, et pretium ante pharetra vel. Nullam sit amet nisi a diam elementum egestas. Cras a orci sed ligula vehicula iaculis eu eu orci. Aliquam ultricies, est ac rutrum feugiat, diam urna ornare purus, sed blandit dolor elit a magna. Donec imperdiet pulvinar dui aliquet lacinia. Nam lacinia semper nunc, non vehicula lectus laoreet nec.</p>', 1, '2017-01-26 08:31:55', '2017-12-17 16:46:40'),
(4, 'terms-conditions', 'Terms and Conditions', 'meta descriptions', '<p><font face=\"Times New Roman\"><font face=\"Arial Black\"><b>Terms and Conditions:</b></font><br></font></p><p><font face=\"Times New Roman\">1. Any Order having pending or incorrect address, phone number or any delivery details will be put on Hold and will not be proceed until Customer provide complete details.<br>2. You Think We Wrap does not book order with Anonymous details of Sender/receiver however we do offer deliveries without mentioning Sender name to receiver if mentioned on Order form instructions.<br>3. In case of any harassment or any such issues, we have the right to disclose Sender Name to Receivers.<br>4. Gift stuffing, flowers, wrappings may vary slightly in term of designing, due to availability of stock.<br>5. Message given by Sender for Greeting cards will be written exactly same to same.<br>6. Our regular Delivery time starts from 12 pm to 12 am. However we do Offer time specified deliveries. Extra charges apply.<br>7. If the product received is rotten or damaged, you need to take picture and inbox us on our Facebook Page (www.facebook.com/youthinkwewrap) along with Order Details. Else we will not be able to take action.<br>8. We use Original Pictures of everything, however due to unavailability of any product/colour/design, We have complete right to change it with any other product/colour. Rest assured it will be equal as quality and quantity. For example Colour of Flowers.<br>9. Orders with less then 48 hours cannot be refunded/replaced/changed.<br>10. We offer time specific delivers however delivery can be delayed due to uncertain conditions like law and order situation, Weather Conditions or any such issues.<br>11. We never call receiver unless we are at door, However if any issue arises during delivery we make calls to Senders and if not picked by Senders, we may call the Receiver.<br>12. Order payments need to be cleared with at least 3 days before Order delivery. For urgent orders, it needs to be completed within Same day before delivery when Order is placed. </font><br></p>', 1, NULL, '2017-12-17 16:46:16'),
(5, 'privacy-policy', 'Privacy Policy', '', '<h1>Privacy Policy</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget vehicula est. Aenean a felis nunc. Duis efficitur ligula ut mollis fermentum. Aliquam pharetra justo nec lacus mollis venenatis. Vestibulum in lorem blandit, aliquam eros a, sollicitudin diam. Morbi elementum tincidunt lectus id vestibulum. Praesent pellentesque sodales erat. Curabitur nulla felis, porta ut malesuada nec, dapibus eget sapien. Praesent sed ornare odio. Phasellus facilisis mauris sit amet nisi sagittis efficitur. Cras nec erat laoreet, rutrum metus sagittis, condimentum purus. Morbi leo nisi, laoreet eget rutrum et, congue ut purus.</p>\n\n<p>Curabitur tristique erat eget ipsum finibus, non pretium ipsum fringilla. Nam congue purus non ipsum ullamcorper luctus. Duis laoreet nec nisi in accumsan. Nunc eros lorem, malesuada id lacus nec, pulvinar luctus mauris. Etiam fringilla vitae purus a ultrices. Ut hendrerit, metus sit amet luctus hendrerit, diam mi tristique mauris, eget fermentum tortor tortor ut libero. Donec non turpis eu risus tincidunt lobortis. Nunc magna metus, porta id commodo ullamcorper, bibendum vel quam. Aliquam ultrices aliquam sapien vel aliquet. Vivamus ut massa tempus, lacinia urna id, auctor nibh. Vestibulum dapibus lacinia elit, ac rutrum mi vestibulum a. Suspendisse potenti. Sed pretium lectus sit amet felis facilisis accumsan. Ut ut ipsum rhoncus, condimentum dui finibus, accumsan ipsum.</p>\n\n<p>Mauris vel purus sapien. Integer pulvinar metus lorem. Morbi blandit tellus vitae mi scelerisque, a pellentesque eros imperdiet. Fusce pharetra non felis ut commodo. In semper laoreet enim egestas aliquet. Phasellus in justo sed quam varius venenatis sed ac felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n\n<p>Ut elementum dolor sit amet ipsum suscipit hendrerit. Donec convallis sed lacus id venenatis. Morbi enim nulla, accumsan id dui id, dictum vehicula tortor. In eu ante et dui elementum elementum et et eros. Pellentesque bibendum neque eget elit suscipit, in suscipit metus venenatis. Aliquam erat volutpat. Cras consectetur, ipsum id porttitor rhoncus, risus neque blandit elit, eget dignissim libero eros sed ipsum. Donec mollis nisl dolor, eget accumsan urna pellentesque id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae lobortis nulla, a suscipit enim. Suspendisse turpis massa, tempor ac rutrum id, feugiat finibus nisl. Aliquam iaculis feugiat sem quis eleifend. Donec molestie accumsan est vitae egestas. Nulla facilisi. Vivamus fermentum tincidunt volutpat.</p>\n\n<p>Etiam ex purus, imperdiet et augue vitae, pretium eleifend lacus. Aenean sagittis sapien mi, et pretium ante pharetra vel. Nullam sit amet nisi a diam elementum egestas. Cras a orci sed ligula vehicula iaculis eu eu orci. Aliquam ultricies, est ac rutrum feugiat, diam urna ornare purus, sed blandit dolor elit a magna. Donec imperdiet pulvinar dui aliquet lacinia. Nam lacinia semper nunc, non vehicula lectus laoreet nec.</p>', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('zarafgs@gmail.com', '$2y$10$IJuXziIihq4NpDN0ivt4gO3JtJNKqPWepTsHXIs7ShzWo/IpS2vsa', '2018-01-18 01:47:52');

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
  `category_id` int(11) NOT NULL,
  `regular_price` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `image1` varchar(255) NOT NULL DEFAULT '',
  `image2` varchar(255) NOT NULL DEFAULT '',
  `image3` varchar(255) NOT NULL DEFAULT '',
  `image4` varchar(255) NOT NULL DEFAULT '',
  `image5` varchar(255) NOT NULL DEFAULT '',
  `delivery` varchar(30) NOT NULL,
  `packaging` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `sku`, `slug`, `description`, `category_id`, `regular_price`, `price`, `available`, `image1`, `image2`, `image3`, `image4`, `image5`, `delivery`, `packaging`, `created_at`, `updated_at`) VALUES
(1, 'Multi Colour Bouquet', 'fb-03', 'Multi-colour-bouquet', 'A Mix Colour Gladiolus bouquet is something eyes want to catch', 2, '0.00', '1200.00', 1, '1-Multi_Colour_Glad_Flowers_2.jpg', '', '', '', '', 'Only Lahore', 1, '0000-00-00 00:00:00', '2018-01-17 15:23:18'),
(2, 'Caramel Fudge Cake (2lbs)', 'BC-04', 'caramel-fudge-cake', 'A perfect blend with Biscuits and Special Caramel Sauce which melts in your Mouth. A crunchy Side of Cakes for people you Love ;)', 1, '0.00', '2050.00', 1, '1-caramel-fudge-cake.jpg', '1-caramel-fudge-2.jpg', '1-caramel-fudge-cake-3.jpg', '', '', 'Only Lahore', 1, '0000-00-00 00:00:00', '2018-01-15 14:02:14'),
(3, 'Mars Signature Cake (2lb)', 'BC-21', 'mars-signature-cake', 'Our Signature cake having simple but elegant design with a Mars on it. A 4 layers cake. Best for all those who loves Mars Chocolate or even Chocolate cakes.', 1, '0.00', '2350.00', 1, '1-mars-signature-cake.jpg', '1-mars-signature-2.jpg', '', '', '', 'Only Lahore', 1, '0000-00-00 00:00:00', '2017-12-20 17:30:59'),
(4, 'Almond Dry Cake', 'BC-30', 'almond-dry-cake', 'A perfect classic Dry Cake with Almonds. A pleasure for all those who never likes cream cakes.', 1, '0.00', '1150.00', 1, '1-DC3.jpg', '1-DC2.jpg', '', '', '', 'Only Lahore', 3, '2017-06-13 08:57:50', '2017-12-20 17:29:06'),
(9, 'Kitkat Cake (2 lbs)', 'BC-12', 'kitkat-cake', 'Have a Break, with a Cake! Kitkat cake with multiple layers of Chocolate sponge and beautiful texture cake\r\n\r\nThis product would be delivered within 24 Hours', 1, '2100.00', '2000.00', 1, '1-kitkat-cake.jpg', '1-kitkat-cake01.jpg', '1-kitkat-cake-02.jpg', '', '', 'Only Lahore', 1, '2017-10-03 07:37:31', '2017-12-17 21:17:11'),
(10, 'Bounty Cake (2 lbs)', 'BC-02', 'bounty-cake', 'Coconut and Chocolate both are love. Our Bounty Cake with soft sponge and cream.', 1, '2150.00', '2050.00', 0, '1-13.jpg', '1-14.jpg', '', '', '', 'Only Lahore', 1, '2017-10-03 21:18:11', '2017-12-17 20:50:17'),
(11, 'Basket in Gold', 'Gb-07', 'basket-in-gold', 'A beautfully decorated basket stuffed with Mix edibles consisting mix chocolates i-e kitkat, snickers, mars, twix, bounty, kinder,bueno kinder etc with pringles, swiss rolls, imported biscuits/wafers etc.', 3, '0.00', '3000.00', 1, '1-Golden_Dryflowers_Basket.jpg', '', '', '', '', 'All over Pakistan', 3, '2017-10-03 21:33:23', '2017-12-17 21:25:01'),
(12, 'Minion Idiot Cushion', 'Minion Cushion', 'MC_Cushion', 'Minion cushion', 6, '1200.00', '1200.00', 1, '1-M - 02.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-03 21:35:45', '2017-10-03 21:35:45'),
(13, 'Birthday Pink Hearts Card', 'HC-17', 'birthday-pink-hearts-card', 'A perfect hand made card made carefully with lots of love. \r\n\r\nProduct may differ a bit as it is being made by human.', 4, '0.00', '350.00', 1, '1-Handmadecard.jpg', '', '', '', '', 'Only Lahore', 3, '2017-10-03 21:39:05', '2017-12-17 21:31:15'),
(14, 'Angry Mug', 'AM', 'Am', 'Angry mug', 5, '700.00', '700.00', 1, '', '', '', '', '', 'All Pakistan', 1, '2017-10-03 21:40:04', '2017-10-03 21:40:04'),
(15, 'Pooh bear (Medium)', 'ST-05', 'pooh-bear', 'Who needs introduction for Mr. Pooh. Love for Honey and Love for this cute bear is beyond anything.', 8, '0.00', '500.00', 0, '1-Pooh Bear.JPG', '', '', '', '', 'Only Lahore', 3, '2017-10-03 21:42:55', '2018-01-22 14:02:17'),
(16, 'Cake deal', 'CD-01', 'CD', 'fverfv', 9, '2000.00', '2000.00', 0, '1-Untitled-1.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-03 21:44:30', '2017-12-23 13:01:58'),
(17, 'Black Forest Cake (2lb)', 'BC-01', 'black-forest-cake', 'A perfect way to celebrate. A classic version with Modern taste and design yet Simple.', 1, '0.00', '1350.00', 1, '1-36.jpg', '1-37.jpg', '1-38.jpg', '', '', 'Only Lahore', 1, '2017-10-07 23:07:31', '2018-01-15 14:04:13'),
(18, 'Chocolate Fudge (2lb)', 'BC-06', 'chocolate-fudge-cake', 'Our Chocolate fudge needs no description. Only a die hard fan of Chocolates can understand it.', 1, '0.00', '2000.00', 1, '1-51.jpg', '1-2.jpg', '1-3.jpg', '', '', 'Only Lahore', 2, '2017-10-07 23:10:58', '2018-05-29 18:42:45'),
(19, 'Coffee Crunch Special (2 lbs)', 'BC-08', 'coffee-crunch-cake', 'Birthday of a Coffee Lover? Nothing beats it!', 1, '0.00', '1400.00', 1, '1-5.jpg', '1-4.jpg', '', '', '', 'Only Lahore', 1, '2017-10-07 23:12:28', '2018-04-19 14:38:56'),
(20, 'Blueberry Delight Cake (2 lbs)', 'BC-09', 'Blueberry-delight-cake', 'A cake with a touch of blueberries is heavily Healthy? right ;)', 1, '0.00', '1700.00', 1, '1-blueberry-delight-cake.jpg', '1-blueberry-delight-cake2.jpg', '1-blueberry-delight-cake.jpg', '', '', 'Only Lahore', 1, '2017-10-07 23:17:03', '2018-01-15 14:17:59'),
(21, 'Death By Chocolate Cake (2lb)', 'BC-10', 'death-by-chocolate-cake', 'One of our amazing cakes covering the famous Death By Chocolate cake', 1, '0.00', '2000.00', 1, '1-death-by-chocolate-cake.jpg', '1-death-by-chocolate-cake01.jpg', '', '', '', 'Only Lahore', 1, '2017-10-07 23:18:36', '2017-11-01 11:03:32'),
(22, 'Fruit Malba Cake (2lb)', 'BC-11', 'fruit-malba-cake', 'Love fruits? A cake with Mix fruits for a fruit lover. Who Said cakes are not healthy!', 1, '1400.00', '1400.00', 1, '1-fruit-malba-cake.jpg', '1-fruit-malba-cake01.jpg', '', '', '', 'Only Lahore', 1, '2017-10-07 23:20:17', '2017-11-01 00:20:59'),
(23, 'Oreo Vanilla Mothers Day Cake (2lb)', 'BC-13', 'oreo-vanilla-cake', 'Our one of the hot selling cake. No one can say a No to our Oreo vanilla Cake. Light and amazing.', 1, '0.00', '1400.00', 1, '1-Oreo new 2.jpg', '1-Oreo 3.jpg', '1-Oreo new.jpg', '', '', 'Only Lahore', 1, '2017-10-07 23:26:52', '2018-04-19 14:38:25'),
(24, 'Pineapple Cake (2lb)', 'BC-16', 'pineapple-cake', 'Classic cakes have Pineapples. Those who loves, a perfect treat.', 1, '1400.00', '1400.00', 1, '1-pineapple-cake.jpg', '1-pineapple-cake01.jpg', '', '', '', 'Only Lahore', 1, '2017-10-07 23:28:11', '2017-11-01 00:20:59'),
(25, 'Rainbow Cake (4 lb)', 'BC-17', 'rainbow-cake', 'Who said rainbow can be seen in sky only? You need to check this beauty and discover 6 different flavours in each layer.', 1, '3000.00', '2800.00', 0, '1-rainbow-cake.jpg', '1-rainbow-cake01.jpg', '', '', '', 'Only Lahore', 1, '2017-10-07 23:29:43', '2017-12-17 20:49:48'),
(26, 'Mothers Day Red Velvet Cake (2lb)', 'BC-18', 'red-velvet-cake', 'A perfect 4 layered cake with vanilla cream. It needs to better introduction then it makes the best combination with Love', 1, '2350.00', '2150.00', 1, '1-red velvet2.jpg', '1-red velvet.jpg', '', '', '', 'Only Lahore', 1, '2017-10-07 23:30:50', '2018-04-19 14:41:01'),
(27, 'Strawberry Delight (2lb)', 'BC-20', 'strawberry-delight-cake', 'A perfect cake for your Soulmate. Flavor of Strawberry with a combination of Vanilla is just the way to perfection.', 1, '0.00', '1700.00', 0, '1-strawberry delight cake.jpg', '1-strawberry delight cake2.jpg', '1-strawberry delight cake.jpg', '', '', 'Only Lahore', 1, '2017-10-07 23:32:36', '2018-06-08 16:57:57'),
(28, 'Mothers day special Basket', 'NY-01', 'mothers-day-special-basket', 'Send a gift worth every Penny. A perfect gift basket with 2 customized hand written tags because it\'s important to send some wishes to your loved ones.\r\n\r\n\r\nNote:\r\n- Basket will be further wrapped with net and inside is done with a cloth.\r\n- Delivery charges are exclusive\r\n- Deal is for Lahore Only\r\n- Valid till 2nd January, 2018\r\n- Deal can be order for any day in advance. \r\n- Minimum time required 24 hours.', 3, '0.00', '2350.00', 1, '1-New Year Deal2.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-08 19:57:44', '2018-09-24 12:17:14'),
(29, 'Multi Colour basket  (Perfume)', 'GB-01', 'Multi-colour-mix-edible-basket', 'A beautiful Basket with lots of edibles including mix chocolates, pringles, swiss rolls, imported biscuits and wafers. A basket sized 8x8.\r\n\r\nIt also includes a branded Perfume from J. (Male Or Female)', 3, '0.00', '4500.00', 1, '1-Mix_edible_basket.jpg', '1-mix-edible-basket01.jpg', '1-mix-edible-basket02.jpg', '', '', 'Only Lahore', 1, '2017-10-09 12:15:20', '2017-12-25 07:51:22'),
(30, 'Black and White Love Basket', 'GB-02', 'black-white-love-basket', 'A basket full of edibles (8x8) with a branded perfume for him/her. \r\n\r\nPerfume By JunaidJamshed.\r\nMix edibles including mix chocolates like kitkat snickers mars twix bounty kinder bueno etc with pringles swiss rolls, imported biscuits and wafers.', 3, '0.00', '5000.00', 1, '1-mix-edible-perfume-basket.jpg', '1-mix-edible-perfume-basket01.jpg', '1-mix-edible-perfume-basket02.jpg', '', '', 'Only Lahore', 1, '2017-10-09 12:20:03', '2017-12-17 21:28:15'),
(31, 'Mix Edible Gift Basket (Big)', 'GB-03', 'mix-edible-gift-basket-big', 'A 10x10 inch basket full of edibles including chocolates like kitkat snickers mars ferrero rocher etc especially designed for all those who love to eat lots of chocolates, imported cookies, pringles and such edibles.', 3, '0.00', '4000.00', 1, '1-Mix-edible-baskets(10x10).jpg', '1-Mix-edible-baskets(10x10)01.jpg', '', '', '', 'Only Lahore', 1, '2017-10-09 12:22:46', '2018-07-12 07:32:26'),
(32, 'Dairy Milk Cake Arrangement', 'CB-01', 'dairy-milk-cake-arrangement', 'Kuch meetha ho jaye on a special day. A chocolate Arrangements in cake style using lots of Dairy Milks\r\n\r\nIt consists of 11 Dairy Milks, topped with 30 small Dairy milks.', 10, '2500.00', '2350.00', 1, '1-dairy-milk-cake-arrangements.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-10 14:58:12', '2018-01-16 11:52:45'),
(33, 'Dairy Milk Vase Bouquet', 'CB-02', 'dairy-milk-vase-bouquet', '\"A beautiful vase makes chocolates more sweet. \r\nThis Chocolate bouquet have 12 Dairy Milks\"', 10, '0.00', '1200.00', 1, '1-dairy-milk-vase-bouquet.jpg', '1-dairy-milk-vase-bouquet01.jpg', '1-dairy-milk-vase-bouquet02.jpg', '', '', 'Only Lahore', 1, '2017-10-10 14:59:32', '2017-11-01 10:58:19'),
(34, 'Ferrero Love Bouquet', 'CB-03', 'ferrero-love-bouquet', 'Go for classy style. A classic Chocolate bouquet using 16 Ferrero Rochers.', 10, '0.00', '1500.00', 1, '1-ferrero-love-bouquet.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-10 15:00:16', '2017-11-01 10:56:53'),
(35, 'Ferrero teddy ring bouquet', 'CB-04', 'ferrero-teddy-ring-bouquet', 'Classic version in Modern style with cute little Teddy keyring. Using 16 ferrero Rochers', 10, '0.00', '1750.00', 1, '1-ferrero-teddy-ring-bouquet.jpg', '1-ferrero-teddy-ring-bouquet01.jpg', '1-ferrero-teddy-ring-bouquet02.jpg', '', '', 'Only Lahore', 1, '2017-10-10 15:01:14', '2017-11-01 10:56:47'),
(36, 'Kitkat Flat bouquet', 'CB-05', 'kitkat-flat-bouquet', 'have a break and love Kitkat. A beautiful version of flat chocolate Arrangements using 11 big kitkats', 10, '1500.00', '1500.00', 1, '1-kitkat-flat-bouquet.jpg', '1-kitkat-flat-bouquet01.jpg', '1-kitkat-flat-bouquet02.jpg', '', '', 'Only Lahore', 1, '2017-10-10 15:03:01', '2017-10-31 09:24:51'),
(37, 'Kitkat kiss surprise', 'CB-06', 'kitkat-kiss-surprise', 'Kitkats Kisses Dairy milks and twix. A beautiful and our hottest Chocolate Arrangement of all times.', 10, '3750.00', '3500.00', 1, '1-Kitkat-Kisses-Surprise.jpg', '1-kitkat-kisses-surprise01.jpg', '1-kitkat-kisses-surprise02.jpg', '', '', 'All over Pakistan', 1, '2017-10-10 15:06:40', '2017-11-01 10:55:51'),
(38, 'Kitkat tower bouquet', 'CB-07', 'kitkat-tower-bouquet', 'Make it a hill, An Arrangement which you love to gift someone.', 10, '2100.00', '1999.00', 1, '1-kitkat-tower-bouquet.jpg', '1-kitkat-tower-bouquet01.jpg', '', '', '', 'Only Lahore', 1, '2017-10-10 15:08:02', '2017-11-01 10:55:27'),
(39, 'Mars Flat bouquet', 'CB-08', 'mars-flat-bouquet', 'A flat tunnel of Mars chocolates using 10 pieces', 10, '0.00', '2250.00', 1, '1-mars-flat-bouquet.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-10 15:10:44', '2017-11-01 10:55:08'),
(40, 'Mars Stand Bouquet', 'CB-09', 'mars-stand-bouquet', 'Mars Stand with Pride. 10 Chocolates standing on a beautiful Wooden Basket.', 10, '2000.00', '2000.00', 1, '1-mars-stand-bouquet.jpg', '1-mars-stand-bouquet01.jpg', '1-mars-stand-bouquet02.jpg', '', '', 'Only Lahore', 1, '2017-10-10 15:12:43', '2017-10-31 09:24:51'),
(41, 'Mix choco bouquet', 'CB-10', 'Mix-choco-bouquet', 'Mix Chocolates Stand with Pride. 10 Chocolates standing on a beautiful Wooden Basket.', 10, '2150.00', '1950.00', 1, '1-mix-choco-bouquet.jpg', '1-mix-choco-bouquet01.jpg', '1-mix-choco-bouquet02.jpg', '', '', 'Only Lahore', 1, '2017-10-10 15:18:19', '2017-11-01 10:54:42'),
(42, 'Ferrero 24 bouquet', 'CB-11', 'Ferrero-24-bouquet', 'Our Best Seller of All times. It is not less then a flower bouquet or a Chocolate bouquet. It speaks it self consisting of 24 chocolates and decor', 10, '2000.00', '1800.00', 1, '1-ferrero 24 bouquett1.jpg', '1-ferrero 24 bouquett.jpg', '1-ferrero 24 bouquett1.jpg', '', '', 'All over Pakistan', 1, '2017-10-10 15:19:12', '2018-04-19 14:45:25'),
(43, 'Snickers Stand bouquet', 'CB-12', 'snickers-stand-bouquet', 'Snickers Stand with Pride. 10 Chocolates standing on a beautiful Wooden Basket.', 10, '2000.00', '1750.00', 1, '1-snickers-stand-bouquet.jpg', '1-snickers-stand-bouquet01.jpg', '', '', '', 'Only Lahore', 1, '2017-10-10 15:20:06', '2018-01-04 14:19:36'),
(44, 'Pleasure in Blue', 'FB-01', 'pleasure-in-blue', '\"Carefully perfected a bouquet in blue for the loved ones. This bouquet uses Lilies, chrysanthemum and beautiful gladiolus to make it worthy. \r\n\r\nThis bouquet can be delivered in 48 hours. \"', 2, '0.00', '3000.00', 1, '1-pleasure-in-blue.jpg', '1-pleasure-in-blue01.jpg', '1-pleasure-in-blue02.jpg', '', '', 'Only Lahore', 3, '2017-10-11 03:08:12', '2018-01-15 14:28:54'),
(45, 'Birthday Boy Bouquet', 'FB-02', 'birthday-boy-bouquet', '\"Sending Love to a guy? Nothing beats our Boy Special Bouquet consisting of blue and white Gladiolus.\r\n\r\nThis bouquet can be delivered same day. Availability of colour varies.\"', 2, '0.00', '1050.00', 0, '1-birthday-boy-bouquet.jpg', '1-birthday-boy-bouquet01.jpg', '1-birthday-boy-bouquet02.jpg', '', '', 'Only Lahore', 1, '2017-10-11 03:10:24', '2018-01-17 12:54:58'),
(46, 'Multi Colour Beauty', 'FB-03', 'multi-colour-beauty', '\"A beautiful bouquet consisting of multi colour Gladiolus flowers wrapped in white net. \r\n\r\nThis bouquet can be delivered same day. Availabiliy of colour varies\"', 2, '0.00', '1200.00', 1, '1-multi-colour-beauty01.jpg', '1-multi-colour-beauty.jpg', '', '', '', 'Only Lahore', 1, '2017-10-11 03:11:57', '2018-01-17 15:23:01'),
(47, 'Rose Mix Bouquet', 'Fb-04', 'rose-mix-bouquet', '\"Nothing beats Red roses. Our classic version of bouquet having red roses and white gladiolus.\r\n\r\n\r\nThis bouquet can be delivered on same day.\"', 2, '0.00', '1200.00', 1, '1-rose-mix-bouquet.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-11 03:12:35', '2018-04-19 14:18:16'),
(48, 'Mothers Special Bouquet', 'FB-05', 'mothers-special-bouquet', 'Want to keep it simple but amazing? Get our Pink and white gladiolus bouquet at doorstep to surprise her. \r\n\r\nThis bouquet can be delivered on same day.\"', 2, '0.00', '1150.00', 1, '1-birthday-girl-bouquet.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-11 03:13:24', '2018-04-19 14:13:51'),
(49, 'Expressions bouquet', 'fb-06', 'expressions-bouquet', '\"Our one of the hottest bouquets of all time, A version perfected with Purple imported chrysanthemum and White gladiolus flowers with lots of love.\r\n\r\nThis bouquet can be delivered within 24 hours. Colour Availablie varies.\"', 2, '0.00', '1950.00', 1, '1-expressions-bouquet.jpg', '1-expressions-bouquet01.jpg', '', '', '', 'Only Lahore', 1, '2017-10-11 03:14:32', '2017-11-01 11:00:09'),
(50, 'White Beauty', 'fb-07', 'white-beauty', 'Want to go straight up? We believe simple colour go best sometimes. Large bouquet of White Gladiolus with white net and a combinaton of ribbon.', 2, '0.00', '1250.00', 1, '1-white-beauty.jpg', '1-white-beauty01.jpg', '', '', '', 'Only Lahore', 1, '2017-10-11 03:15:30', '2018-04-19 14:18:47'),
(51, 'Celebrations Mix', 'Fb-08', 'celebrations-mix', '\"Multi Colour bouquet Consisting of Imported chrysanthemum with multi colour gladiolus, covered with white net. Sounds interesting.\r\n\r\nThis bouquet can be delivered within 24 hours. \"', 2, '2150.00', '2150.00', 1, '1-celebrations-mix.jpg', '1-celebrations-mix01.jpg', '', '', '', 'Only Lahore', 1, '2017-10-11 03:16:42', '2017-11-01 00:21:04'),
(52, 'Magical Love Bouquet', 'Fb-09', 'magical-love-bouquet', '\"Magical days are the special days and Special days need to be celebrated in special way. A perfect combination of White and blue gladioulus covering with Red roses which make it even more beautiful. It is a HUGE one. \r\n\r\nThis product can be delivered within 48 hours. \"', 2, '0.00', '4500.00', 1, '1-Magical-love-bouquet.jpg', '1-magical-love-bouquet01.jpg', '1-Magical-love-bouquet02.jpg', '', '', 'Only Lahore', 1, '2017-10-11 03:18:08', '2018-01-15 14:27:44'),
(53, 'Happy Bouquet', 'FB-10', 'happy-bouquet', 'Make your loved ones happy. A perfect Flower bouquet for the perfect day.', 2, '1150.00', '1150.00', 1, '1-happy-bouquet.jpg', '1-happy-bouquet01.jpg', '', '', '', 'Only Lahore', 1, '2017-10-11 03:19:21', '2017-11-01 00:21:04'),
(54, 'Chocolaty Fragrance Bouquet', 'FB-11', 'chocolaty-fragrance-bouquet', '\"Chocolates and flowers both are love. A Large bouquet of pink and white gladiolus combined with 10 mix chocolates and 3 hand written tags making it a perfect Combo Gift for someone special\r\n\r\nYou can mention your favourite colour theme and chocolates as per your liking in Special instructions box. \r\n\r\nThis bouquet can be delivered within 48 hours.\"', 2, '2750.00', '2500.00', 1, '1-chocolaty-frangrance-bouquet.jpg', '1-chocolaty-frangrance-bouquet02.jpg', '', '', '', 'Only Lahore', 1, '2017-10-11 03:20:31', '2018-04-19 14:17:42'),
(55, 'Wonderful Bouquet', 'FB-12', 'wonderful-bouquet', 'Wonderful occasions with Wonderful bouquet. Our take with White chrysanthemum, red and white gladioulus covered with love.', 2, '0.00', '1950.00', 1, '1-wonderful-bouquet-1.jpg', '1-wonderful-bouquet-2.jpg', '', '', '', 'Only Lahore', 1, '2017-10-11 03:21:06', '2017-11-01 10:59:29'),
(56, 'Pink hearts Teddy', 'ST-01', 'pink-hearts-teddy', 'A Cute loving Medium sized Teddy bear which surely bring love. We assure you it\'s a cutie pie.', 8, '0.00', '600.00', 1, '1-pink-hearts1.jpg', '1-pink-hearts.jpg', '', '', '', 'Only Lahore', 1, '2017-10-11 22:19:43', '2017-12-22 09:54:13'),
(57, 'White hearts Teddy', 'ST-02', 'white-hearts-teddy', 'A Cute loving Medium sized Teddy bear which surely bring love. We assure you it\'s a cutie pie.', 8, '0.00', '600.00', 0, '1-White-hearts.jpg', '1-white-hearts1.jpg', '', '', '', 'Only Lahore', 1, '2017-10-11 22:21:25', '2018-01-24 16:55:40'),
(58, 'White Love Teddy', 'ST-03', 'white-love-teddy', 'A Cute loving Medium sized Teddy bear which surely bring love. We assure you it\'s a cutie pie.', 8, '0.00', '600.00', 0, '1-white-love.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-11 22:22:04', '2018-03-27 13:47:00'),
(59, 'Pink Love Teddy', 'ST-04', 'pink-love-teddy', 'A Cute loving Medium sized Teddy bear which surely bring love. We assure you it\'s a cutie pie.', 8, '0.00', '600.00', 1, '1-Pink-love.jpg', '', '', '', '', 'Only Lahore', 3, '2017-10-11 22:22:38', '2017-12-22 09:54:33'),
(60, 'Birthday Balloon card', 'HC-01', 'birthday-balloon-card', 'A beautiful hand made card with Baloooons :D\r\n\r\nProduct may differ a bit due to hand made.', 4, '0.00', '300.00', 1, '1-Birthday-balloons-card.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-11 22:46:56', '2017-12-17 21:32:04'),
(61, 'Happy Birthday Card', 'HC-02', 'happy-birthday-card', 'acxsa', 4, '300.00', '300.00', 1, '1-Happy-Birthday-card.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-11 22:47:35', '2017-10-11 22:47:35'),
(62, 'Creative Card', 'HC-03', 'creative-card', 'dsc', 4, '600.00', '600.00', 1, '1-Creative-card.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-11 22:48:15', '2017-10-11 22:48:15'),
(63, 'Elephant Says Sorry Card', 'HC-04', 'elephant-says-sorry-card', 'dcew', 4, '350.00', '350.00', 1, '1-Elephant-says-sorry.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-11 22:48:48', '2017-10-11 22:48:48'),
(64, 'Emoji Sad Card', 'HC-05', 'emoji-sad-card', 'sc', 4, '300.00', '300.00', 1, '1-emoji-sad-card.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-11 22:49:19', '2017-10-11 22:49:19'),
(65, 'Flowers Mother Card', 'HC-06', 'flowers-mother-card', 'A beautiful art done on a Card which can make an occasion the best one.', 4, '0.00', '400.00', 1, '1-flowers-mother-card.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-11 22:50:08', '2018-04-24 13:27:58'),
(66, 'Gifts hand made Card', 'HC-07', 'gifts-handmade-card', 'dc', 4, '350.00', '350.00', 1, '1-Gifts-Handmade-Card.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-11 22:50:44', '2017-10-11 22:50:44'),
(67, 'Love Mom Card', 'HC-08', 'love-mom-card', 'Love your Mother? What can be better then a beautiful card to add with Flowers or Cake ;)', 4, '0.00', '350.00', 1, '1-Love-mom-card.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-11 22:51:16', '2018-04-24 13:26:59'),
(68, 'Lovers Heart Card', 'HC-09', 'lovers-heart-card', 'c', 4, '600.00', '600.00', 1, '1-Lovers-heart.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-11 22:51:49', '2017-10-11 22:51:49'),
(69, 'Mail Card', 'HC-10', 'mail-card', 'c', 4, '400.00', '400.00', 1, '1-mail-card.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-11 22:52:45', '2017-10-11 22:52:45'),
(70, 'Meow Sorry Card', 'HC-11', 'meow-sorry-card', 's', 4, '350.00', '350.00', 1, '1-meow-sorry-card.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-11 22:53:23', '2017-10-11 22:53:23'),
(71, 'Mom Number One Card', 'HC-12', 'mom-number-one-card', 'A beautiful card to add with Mothers Gift.', 4, '300.00', '250.00', 1, '1-mom-number-one.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-11 22:53:55', '2018-04-24 13:26:14'),
(72, 'Multi Colour Hearts Card', 'HC-13', 'multi-colour-hearts-card', 'A beautiful card for a beautiful person you know.', 4, '0.00', '250.00', 1, '1-Multi-colour-hearts-card.jpg', '', '', '', '', 'Only Lahore', 1, '2017-10-11 22:54:34', '2017-12-25 07:50:29'),
(73, 'Pink Emotions Card', 'HC-14', 'pink-emotions-card', 'd', 4, '600.00', '600.00', 1, '1-pink-emotions.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-11 22:55:04', '2017-10-11 22:55:04'),
(74, 'Sorry Card', 'HC-15', 'sorry-card', 'd', 4, '300.00', '300.00', 1, '1-sorry-card.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-11 22:55:34', '2017-10-11 22:55:34'),
(75, 'Tears Miss Card', 'HC-16', 'tears-miss-card', 'd', 4, '350.00', '350.00', 1, '1-tears-miss-card.jpg', '', '', '', '', 'All Pakistan', 1, '2017-10-11 22:56:05', '2017-10-11 22:56:05'),
(76, 'Regular Pacakge', '1001', 'regular-pacakges', 'A beautiful basket wrapped with net, Hand written tags, and Decor using Ribbons etc<br/> <strong>Basket Stuffing:</strong><br/> Kitkat, snickers, mars, twix, bounty, kinder, bueno, pringles, little hearts, swiss', 20, '2000.00', '2000.00', 0, '1-package_basic.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-11 06:26:45', '2017-12-11 06:26:45'),
(77, 'Premium Package', '1002', 'premium-package', 'Beautiful Basket wrapped using beads work, ribbons, hand written tags and velvet finishes.<br/> <strong>Basket Stuffing:</strong><br/> Hersheys, Toblerone, Rafaello, M&Ms, Dewberry biscuits, Kitkat snickers,<br/> mars, twix, bounty, kinder, bueno, pringles, little hearts, swiss rolls, tiffany wafers', 20, '3000.00', '3000.00', 0, '1-package_premium.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-11 06:28:11', '2017-12-11 06:28:11'),
(78, 'Black forest Cake 1lb', 'BC-23', 'black-forest-cake', 'A perfect way to celebrate. A classic version with Modern taste and design yet Simple.', 1, '0.00', '850.00', 1, '1-Black-Forest-Cake.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-17 20:43:23', '2018-01-15 14:15:09'),
(79, 'Oreo Cake Vanilla (1lb)', 'BC-24', 'oreo-cake-vanilla', 'Our one of the hot selling cake. No one can say a No to our Oreo vanilla Cake. Light and amazing.', 1, '0.00', '850.00', 1, '1-Oreo new.jpg', '1-Oreo new 2.jpg', '', '', '', 'Only Lahore', 3, '2017-12-17 20:44:52', '2018-01-15 14:15:46'),
(80, 'Pineapple Cake (1lb)', 'BC-28', 'pineapple-cake', 'Our one of the hot selling cake. No one can say a No to our Oreo vanilla Cake. Light and amazing.', 1, '0.00', '800.00', 1, '1-pineapple-cake.jpg', '1-pineapple-cake01.jpg', '', '', '', 'Only Lahore', 3, '2017-12-17 20:46:25', '2018-01-15 14:15:59'),
(81, 'Chocolate Fudge Cake (1lb)', 'BC-26', 'chocolate-fudge-cake', 'Our Chocolate fudge needs no description. Only a die hard fan of Chocolates can understand it!', 1, '0.00', '1050.00', 1, '1-1.jpg', '1-2.jpg', '', '', '', 'Only Lahore', 3, '2017-12-17 20:47:27', '2018-01-15 14:15:50'),
(82, 'Death By Chocolate Cake (1lb)', 'BC-27', 'death-by-chocolate', 'One of our amazing cakes covering the famous Death By Chocolate cake', 1, '0.00', '1100.00', 1, '1-death-by-chocolate-cake.jpg', '1-death-by-chocolate-cake01.jpg', '', '', '', 'Only Lahore', 3, '2017-12-17 20:48:31', '2018-02-04 09:36:53'),
(83, 'Ferrero Hearts Black Bouquet', 'CB-13', 'ferrero-hearts-black-bouquet', 'A creatively made bouquet using 16 ferrero rochers and 20 hearts chocolate to perfection with hand made card box.\r\n\r\nColour theme: Black and red', 10, '0.00', '2500.00', 1, '1-ferrrero-hearts-black-arrangement.jpg', '1-ferrrero-hearts-black-arrangement2.jpg', '', '', '', 'Only Lahore', 3, '2017-12-17 21:07:01', '2018-08-29 06:38:11'),
(84, 'Kitkat Dairy Cake Arrangement', 'CB-14', 'kitkat-dairy-cake-arrangement', 'Don\'t want a Cake? No issues take Our Chocolate Made Cake.\r\n\r\nUsing 11 kitkats and 200 g of  Dairy milks, We make one amazing piece of Chocolate Arrangement in cake style. \r\n\r\nCan be delivered Anywhere in Pakistan', 10, '0.00', '2000.00', 1, '1-kitkat-dairymilk-cake-arrangement.jpg', '1-kitkat-dairymilk-cake-arrangement2.jpg', '', '', '', 'All over Pakistan', 3, '2017-12-17 21:09:09', '2018-04-25 13:59:10'),
(85, 'Mix Choco Vase', 'CB-15', 'mix-choco-vase', '10 Mix chocolates placed in a beautiful coloured vase making it Perfect Chocolate bouquet.\r\n\r\nChocolates include  any 10 selection of Kitkat, snickers, mars, twix, bounty, bueno\r\n\r\nNote: Vase Colour varies depending on Stock.', 10, '0.00', '1750.00', 1, '1-mix-choco-vase.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-17 21:10:30', '2018-01-16 09:07:29'),
(86, 'Mothers Day Chocolate bouquet', 'CB-16', 'mothers-day-chocolate-bouquet', 'One of our newly Launched. A perfect to gift your Lovely Family. Either it is to Congratulate on New Born or to surprise your Loved ones. It uses 24 Ferrero Rochers making it special for Someone you Love.\r\n\r\nProduct May vary in design as it\'s done by Hand.', 10, '0.00', '2000.00', 1, '1-new-born-ferrero-bouquet.jpg', '1-new-born-ferrero-bouquet2.jpg', '', '', '', 'Only Lahore', 3, '2017-12-17 21:12:40', '2018-04-19 14:43:40'),
(87, 'Red Dairy Milk Bouquet', 'CB-17', 'red-dairymilk-bouquet', 'Kuch Metha Ho Jaye? Magar Khubsorat Andaaz mai. A unique way to give gift to someone.\r\n\r\nIt uses 20 Dairy Milks.', 10, '1750.00', '1500.00', 1, '1-red-dairymilk-bouquet.jpg', '1-red-dairymilk-bouquet2.jpg', '', '', '', 'Only Lahore', 3, '2017-12-17 21:14:28', '2017-12-17 21:14:28'),
(88, 'Yellow turns Gold Arrangement', 'CB-18', 'yellow-turns-gold-arrangement', 'Having Low Budget? No issues take our this very special ferrero rochers bouquet consisting of 10 ferrero rochers in a hand made card box.', 10, '0.00', '1200.00', 1, '1-yellow-turns-gold-arrangement.jpg', '1-yellow-turns-gold-arrangement2.jpg', '', '', '', 'Only Lahore', 3, '2017-12-17 21:15:47', '2017-12-17 21:15:47'),
(89, 'Singnature Mini Card (Red)', 'HC-18', 'signature-mini-card', 'A beautiful Laser cut mini card to add with any gifts.', 4, '0.00', '50.00', 1, '1-25530788_1740401029305330_1116216004_o(1).jpg', '1-25579024_1740400945972005_1896264534_o(1).jpg', '', '', '', 'All over Pakistan', 3, '2017-12-18 11:27:12', '2017-12-18 11:27:13'),
(90, 'Almond Roasted Dry Cake', 'BC-31', 'almond-roasted-dry-cake', 'Dry cake with Almond Roasted needs no introduction. Our version have a surprise of Chocolate chips on top ;)', 1, '0.00', '1250.00', 1, '1-DC4.jpg', '1-DC5.jpg', '', '', '', 'Only Lahore', 3, '2017-12-20 17:32:36', '2017-12-20 17:39:20'),
(91, 'Mix Dry Fruit Cake', 'BC-32', 'mix-dry-fruit-cake', 'Love Dry Fruits? You need a complete package in a cake. Try our amazing Mix dry fruit cake which shows itself how lovely it is.', 1, '0.00', '1400.00', 1, '1-DC7.jpg', '1-DC6.jpg', '', '', '', 'Only Lahore', 3, '2017-12-20 17:35:37', '2017-12-20 17:35:37'),
(92, 'Fruit Malba Cake', 'BC-33', 'fruit-malba-cake', 'One needs to take a slice of our Fruit Malba Cake with Chaiiii.', 1, '0.00', '1200.00', 1, '1-DC8.jpg', '1-DC9.jpg', '', '', '', 'Only Lahore', 3, '2017-12-20 17:37:46', '2017-12-20 17:37:46'),
(93, 'Mini Wooden Edible Basket', 'GB-11', 'mini-wooden-edible-basket', 'A beautiful mini Wooden Basket decorated in Purple with full of mix edibles including chocolates like kitkat snickers, mars, twix, bounty, kinder bueno etc with pringles and imported biscuit.\r\n\r\nDecor may vary depending on availability of same products.', 3, '0.00', '1600.00', 1, '1-18718602_1541012212585383_1364253074_n.jpg', '', '', '', '', 'All over Pakistan', 3, '2017-12-22 08:06:57', '2017-12-22 08:06:57'),
(94, 'Free Cake Handmade Card', 'HC-19', 'free-cake-card', 'Free Cake Card is a Hand Made card made especially for Birthdays. You don\'t need a better idea then asking for treat while giving gifts :D', 4, '0.00', '200.00', 1, '1-Free-Cake-Card.jpg', '', '', '', '', 'All over Pakistan', 3, '2017-12-22 08:10:21', '2017-12-22 08:52:08'),
(95, 'Blue Dreams (Mini Basket)', 'GB-12', 'blue-dreams-basket', '\"A beautiful Mini Mix edible Wooden basket with different edibles including:\r\n- Kitkat, snickers, mars, twix, bounty, kinder, bueno, pringles and imported biscuits.\r\n\r\nNote:\r\nProducts may vary depending on availability but quantity and quality remains same.', 3, '0.00', '1650.00', 1, '1-Blue-Dreams.jpg', '', '', '', '', 'All over Pakistan', 3, '2017-12-22 08:37:45', '2018-09-24 12:16:45'),
(96, 'White Heart Cushion', 'ST-06', 'white-heart-cushion', 'Spread Love with our Heart Cushions.', 8, '500.00', '450.00', 0, '1-white-heart-cushion.JPG', '', '', '', '', 'All over Pakistan', 3, '2017-12-22 09:31:55', '2018-08-10 09:47:18'),
(97, 'Pink Heart Cushion', 'ST-07', 'pink-heart-cushion', 'Spread Love with our Heart Cushions.', 8, '500.00', '450.00', 0, '1-pink-heart-cushion.JPG', '', '', '', '', 'All over Pakistan', 3, '2017-12-22 09:44:07', '2018-08-07 09:14:10'),
(98, 'Red Heart Cushion', 'ST-08', 'red-heart-cushion', 'Spread Love with our Heart Cushions.', 8, '500.00', '450.00', 0, '1-Red-heart-cushion.JPG', '', '', '', '', 'All over Pakistan', 3, '2017-12-22 09:44:25', '2018-01-24 16:55:11'),
(99, 'Pink mini cushion', 'ST-09', 'pink-mini-cushion', 'Spread Love with our mini Heart Cushions.', 8, '250.00', '200.00', 0, '1-pink-mini-cushion.JPG', '', '', '', '', 'All over Pakistan', 3, '2017-12-22 09:45:33', '2018-03-27 13:46:40'),
(100, 'Red Mini Cushion', 'ST-10', 'red-mini-cushion', 'Spread Love with our mini Heart Cushions.', 8, '250.00', '200.00', 0, '1-red-mini-cushion.JPG', '', '', '', '', 'All over Pakistan', 3, '2017-12-22 09:46:12', '2018-03-27 13:46:28'),
(101, 'Quaid Deal', 'D-01', 'Quaid-deal', 'It\'s a Quaid\'s Birthday and we are celebrating by offering one of our best deals. \r\nOrder any regular flowers (red roses and glads or mix glads) + Ferrero Rocher box for an amazing discounted price.\r\n\r\nThis deal is only available on ordering from Website', 9, '0.00', '2250.00', 1, '1-Deal.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-23 13:01:24', '2017-12-23 13:01:24'),
(102, 'Mix Edible Basket (8x8 Multi)', 'GB-13', 'mix-edible-basket-multi', 'A perfect gift in Low budget. Who doesn\'t like chocolates and amazing cookies/biscuits.\r\n\r\nThis Basket includes Mix chocolates, Pringles, Swiss rolls, imported cookies/biscuits and Wafers.\r\n\r\nProduct varies depending on stock availability. Normally it have: kitkat, snickers, mars, twix, bounty, kinder, bueno kinder, pringles, swiss rolls, 2 imported cookies, etc.', 3, '0.00', '2500.00', 1, '1-mix-edible-basket02.jpg', '1-Mix_edible_basket.jpg', '1-mix-edible-basket01.jpg', '', '', 'Only Lahore', 3, '2017-12-25 07:48:52', '2018-09-24 12:16:07'),
(103, 'White Border Frame (A3)', 'CF-01', 'white-border-frameA3', 'High Quality Frame with a Picture of your choice. \r\nSize of frame approx 13x18 inches\r\n\r\nBorders of 1 inch with a picture inside.\r\n\r\nSend your Pictures at youthinkwewrap@gmail.com once you receive Confirmation Message/Email/Call.', 7, '2250.00', '2000.00', 1, '1-photo-frame-white.jpg', '1-photo-frame-white.jpg', '', '', '', 'Only Lahore', 3, '2017-12-26 11:22:55', '2017-12-26 13:44:01'),
(104, 'Kitkat Stand Bouquet', 'CB-19', 'kitkat-stand-bouquet', 'A beautiful bouquet made on a Beautiful Basket with 10 Large Kitkats and a Hand Written tag for your Loved one. \r\n\r\nColour theme can be change other then Red to any as per your liking. Simply mention colour theme at Special Instructions box.', 10, '1950.00', '1750.00', 1, '1-kitkat-stand-bouquet.JPG', '1-kitkat-stand-bouquet2.JPG', '1-kitkat-stand-bouquet3.JPG', '', '', 'Only Lahore', 3, '2017-12-26 11:29:00', '2017-12-26 11:29:01'),
(105, 'Black Frame (A3)', 'CF-02', 'black-frame-A3', 'High Quality Frame with a Picture of your choice. \r\nSize of frame approx 13x18 inches\r\n\r\nBorders of 1 inch with a picture inside.\r\nWrapped Beautifully. \r\n\r\nSend your Pictures at youthinkwewrap@gmail.com once you receive Confirmation Message/Email/Call.', 7, '2250.00', '2000.00', 1, '1-photo-frame-black.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-26 14:30:21', '2017-12-26 14:30:21'),
(106, 'Dark Purple Frame (A3)', 'CF-03', 'dark-purple-frame-A3', 'High Quality Frame with a Picture of your choice. \r\nSize of frame approx 13x18 inches\r\n\r\nBorders of 1 inch with a picture inside.\r\nWrapped Beautifully. \r\n\r\nSend your Pictures at youthinkwewrap@gmail.com once you receive Confirmation Message/Email/Call.', 7, '2250.00', '2000.00', 1, '1-photo-frame-Darkpurple.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-26 14:30:57', '2017-12-26 14:30:57'),
(107, 'Dull Yellow Frame (A3)', 'CF-04', 'dull-yellow-frame-A3', 'High Quality Frame with a Picture of your choice. \r\nSize of frame approx 13x18 inches\r\n\r\nBorders of 1 inch with a picture inside.\r\nWrapped Beautifully. \r\n\r\nSend your Pictures at youthinkwewrap@gmail.com once you receive Confirmation Message/Email/Call.', 7, '2250.00', '2000.00', 1, '1-photo-frame-dullyellow.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-26 14:31:45', '2017-12-26 14:31:45'),
(108, 'Light Green Frame (A3)', 'CF-05', 'light-green-frame-A3', 'High Quality Frame with a Picture of your choice. \r\nSize of frame approx 13x18 inches\r\n\r\nBorders of 1 inch with a picture inside.\r\nWrapped Beautifully. \r\n\r\nSend your Pictures at youthinkwewrap@gmail.com once you receive Confirmation Message/Email/Call.', 7, '2250.00', '2000.00', 1, '1-photo-frame-lightgreen.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-26 14:32:46', '2017-12-26 14:32:46'),
(109, 'Light Purple Frame (A3)', 'CF-06', 'light-purple-frame-A3', 'High Quality Frame with a Picture of your choice. \r\nSize of frame approx 13x18 inches\r\n\r\nBorders of 1 inch with a picture inside.\r\nWrapped Beautifully. \r\n\r\nSend your Pictures at youthinkwewrap@gmail.com once you receive Confirmation Message/Email/Call.', 7, '2250.00', '2000.00', 1, '1-photo-frame-lightpurple.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-26 14:33:50', '2017-12-26 14:33:50'),
(110, 'Pink Frame (A3)', 'CF-08', 'pink-frame-A3', 'High Quality Frame with a Picture of your choice. \r\nSize of frame approx 13x18 inches\r\n\r\nBorders of 1 inch with a picture inside.\r\nWrapped Beautifully. \r\n\r\nSend your Pictures at youthinkwewrap@gmail.com once you receive Confirmation Message/Email/Call.', 7, '2250.00', '2000.00', 1, '1-photo-frame-pink.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-26 14:35:12', '2017-12-26 14:35:12'),
(111, 'Red Frame (A3)', 'CF-09', 'red-frame-A3', 'High Quality Frame with a Picture of your choice. \r\nSize of frame approx 13x18 inches\r\n\r\nBorders of 1 inch with a picture inside.\r\nWrapped Beautifully. \r\n\r\nSend your Pictures at youthinkwewrap@gmail.com once you receive Confirmation Message/Email/Call.', 7, '2250.00', '2000.00', 1, '1-photo-frame-Red.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-26 14:35:13', '2017-12-26 14:35:13'),
(112, 'Sharp Yellow Frame (A3)', 'CF-10', 'sharp-yellow-frame-A3', 'High Quality Frame with a Picture of your choice. \r\nSize of frame approx 13x18 inches\r\n\r\nBorders of 1 inch with a picture inside.\r\nWrapped Beautifully. \r\n\r\nSend your Pictures at youthinkwewrap@gmail.com once you receive Confirmation Message/Email/Call.', 7, '2250.00', '2000.00', 1, '1-photo-frame-sharpyellow.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-26 14:36:25', '2017-12-26 14:36:25'),
(113, 'Maroon Frame (A3)', 'CF-07', 'Maroon-frame-A3', 'High Quality Frame with a Picture of your choice. \r\nSize of frame approx 13x18 inches\r\n\r\nBorders of 1 inch with a picture inside.\r\nWrapped Beautifully. \r\n\r\nSend your Pictures at youthinkwewrap@gmail.com once you receive Confirmation Message/Email/Call.', 7, '2250.00', '2000.00', 1, '1-photo-frame-Maroon.jpg', '', '', '', '', 'Only Lahore', 3, '2017-12-26 14:36:42', '2017-12-26 14:36:42'),
(114, 'Blue Dry Fruit Tray (1kg+)', 'GB-14', 'blue-dry-fruit-tray', 'A beautiful dry fruit tray consisting of our Special Kajju, Badaam, Pista and Peanuts wrapped beautifully with a special coloured fur and simple decor.\r\n\r\nBest to gift someone who loves dry fruits.\r\n\r\nTopped with our Signature Mini card where you can have anything written for your loved ones.', 3, '0.00', '2750.00', 1, '1-blue-dry-fruit-tray.jpg', '1-blue-dry-fruit-tray1.jpg', '1-IMG_4245.JPG', '1-blue-dry-fruit-tray2.jpg', '', 'Only Lahore', 3, '2017-12-26 14:53:04', '2017-12-26 14:56:26'),
(115, 'Red Dry Fruit Tray', 'GB-15', 'red-dry-fruit-tray', 'A beautiful tray having 6 different type of dry fruits placed in a very amazing way. No better gift can be done for your Elders.\r\n\r\nSend some love with this beautiful Dry Fruit Tray\r\n\r\nWeighted: Approx 2kg', 3, '0.00', '3500.00', 1, '1-red dry fruit mix tray.jpg', '1-red dry fruit mix tray1.jpg', '1-red dry fruit mix tray2.jpg', '1-red dry fruit mix tray3.jpg', '', 'Only Lahore', 3, '2017-12-26 15:11:04', '2017-12-26 15:11:04'),
(116, 'Black Surprise Dry Fruit Tray', 'GB-16', 'black-surprise-dry-fruit-tray', 'One of our best dry fruit trays having 7 different dry fruits, amazingly placed with beautifully decorated tray. Who says no to such style trays?\r\n\r\nWeighted: Approx 2.5kg', 3, '0.00', '4250.00', 1, '1-black surprise fry fruit tray.jpg', '1-black surprise fry fruit tray1.jpg', '1-black surprise fry fruit tray2.jpg', '1-black surprise fry fruit tray3.jpg', '', 'Only Lahore', 3, '2017-12-26 15:15:29', '2017-12-26 15:15:30'),
(117, 'Zarar Perfume (Men)', 'PE-01', 'zarar-perfume-men', 'Perfume', 21, '0.00', '2500.00', 1, '1-Zarar.jpg', '', '', '', '', 'Only Lahore', 1, '2017-12-28 08:43:23', '2017-12-28 08:43:23'),
(118, 'White Musk by J. (Men)', 'PE-02', 'white-musk-men', 'Perfume', 21, '0.00', '2500.00', 1, '1-White Must.jpg', '', '', '', '', 'Only Lahore', 1, '2017-12-28 08:44:42', '2017-12-28 08:44:42'),
(119, 'Flora Perfume (Female)', 'PE-03', 'flora-perfume-female', 'perfume', 21, '0.00', '3000.00', 1, '1-Flora.jpg', '', '', '', '', 'Only Lahore', 1, '2017-12-28 08:46:00', '2017-12-28 08:46:00'),
(120, 'New Year Gift Basket (with Teddy bear)', 'NY-02', 'new-year-gift-basket-2', 'Send a gift worth every Penny. A perfect gift basket with 2 customized hand written tags because it\'s important to send some wishes to your loved ones.\r\n\r\n\r\nNote:\r\n- You can choose teddy bear OR heart Cushion\r\n- Basket will be further wrapped with net and inside is done with a cloth.\r\n- Delivery charges are exclusive\r\n- Deal is for Lahore Only\r\n- Valid till 2nd January, 2018\r\n- Deal can be order for any day in advance. \r\n- Minimum time required 24 hours.', 3, '0.00', '2800.00', 1, '1-New Year Deal.jpg', '', '', '', '', 'Only Lahore', 1, '2017-12-30 09:39:08', '2018-09-24 12:16:26'),
(121, 'Pink Treat Bouquet', 'CB-20', 'pink-treat-bouquet', 'A beautiful Ferrero Rochers Bouquet using 20 chocolates. It\'s a best gift to send to your loved ones, New born celebrations or to say thank you to your lovely Family & friends.\r\n\r\nColour can be customized in:\r\n- Pink\r\n- Blue\r\n- Red', 10, '0.00', '1800.00', 1, '1-Pink Treat Bouquet.jpg', '1-pink-treat-bouquet2-600-600.jpg', '', '', '', 'Only Lahore', 3, '2018-01-05 13:45:18', '2018-02-15 11:34:07'),
(122, 'Vanilla Crunch (2lb)', 'BC-20', 'vanilla-crunch-cake', 'A 4 layers signature cake topped with nuts making it perfect for all occasions. Want to surprise your elders or young generation, it\'s a perfect shot for all.', 1, '0.00', '2350.00', 1, '1-Vanilacrunch.jpg', '1-Vanilacrunch2.jpg', '', '', '', 'Only Lahore', 3, '2018-01-15 14:22:07', '2018-01-15 14:22:07'),
(123, 'Flower Basket (8x8 Imported Mix)', 'FB-13', 'flower-basket', 'Our Creation to give you a handy look on flowers. We did it awesomely. Our Signature basket with beautiful Mix flowers including chrysanthemum, gladiolus  and roses. \r\n\r\nWho could ask for any better then this.\r\n\r\nNote: Product can be differ in case of unavailability of same flowers in term of colours.', 2, '0.00', '1750.00', 1, '1-flower basket2.jpg', '1-flower basket4.jpg', '1-flower basket.jpg', '', '', 'Only Lahore', 3, '2018-01-15 17:49:22', '2018-04-23 13:16:42'),
(124, 'Alphabet Flower Box', 'FB-14', 'alphabet-flower-box', 'A bed of flowers making it almost the biggest of all by itself. Perfect if you want to surprise your lovely wife/ husband.\r\n\r\nUsing more then 600 roses and chrysanthemum we Made this box to perfection with a side of ribbon. \r\n\r\nYou can get any 2 Alphabets on it.', 2, '0.00', '15000.00', 1, '1-Alphabet Flower Box2.jpg', '1-Alphabet Flower Box.jpg', '1-Alphabet Flower Box3.jpg', '', '', 'Only Lahore', 3, '2018-01-15 17:53:11', '2018-08-03 10:39:43'),
(125, 'Imported Rose Ferrero bouquet', 'FB-15', 'imported-rose-ferrero-bouquet', 'Beautiful 12 imported roses picked one by one wrapped in a white Net with Baby\'s Breath. Oh who can miss those beautiful little ferrero rochers a total of 16 between these roses ;) \r\n\r\nWant to propose someone? surprise on his/her birthday or want to say sorry. It works for all', 2, '0.00', '4000.00', 1, '1-Imported rose ferrero bouquet2.jpg', '1-Imported rose ferrero bouquet.jpg', '1-Imported rose ferrero bouquet3.jpg', '', '', 'Only Lahore', 3, '2018-01-15 17:58:56', '2018-01-29 07:32:27'),
(126, 'Pleasure in Pink', 'FB-16', 'pleasure-in-pink', 'Beautiful bouquet using Mix flowers including Chrysanthemums, Baby\'s Breath, Gladiolus and of course Lilies in Pink theme.', 2, '0.00', '3000.00', 1, '1-pleasureinpink2.jpg', '1-pleasureinpink1.jpg', '1-pleasure-in-pinkk.jpg', '', '', 'Only Lahore', 3, '2018-01-15 18:10:07', '2018-01-15 18:10:08'),
(127, 'Black Ferrero Box', 'CB-21', 'black-ferroro-box', 'Low on budget then take our beautifully crafted box which includes 8 ferrero rochers in it. \r\n\r\nA small but beautiful gift to surprise your loved ones.', 10, '0.00', '1080.00', 1, '1-black box w.jpg', '1-black box w2.jpg', '', '', '', 'Only Lahore', 3, '2018-01-16 08:25:21', '2018-01-16 08:25:22'),
(128, 'Golden Egg Basket', 'CB-22', 'golden-egg-basket', 'A basket worth Chocolates. A beautiful simple arrangements which is worthy. Beautiful basket that holds 20 Ferrero rochers is a perfect thing to show love to someone who is special. \r\n\r\nDelivery anywhere in Lahore within 24 hours possible.', 10, '0.00', '1600.00', 1, '1-golden egg basket w.jpg', '1-golden egg basket w2.jpg', '', '', '', 'Only Lahore', 3, '2018-01-16 08:28:59', '2018-09-24 12:18:50'),
(129, 'Ferrero Rose Heart Box', 'CB-23', 'ferrero-rose-heart-box', 'Want to surprise your soulmate? What can be more better then a complete combo Package in 1 product. Chocolates + Roses + Heart Box = Perfect Box\r\n\r\nThis product includes 13 Ferrrero Rochers and 16 Roses in a Hand made Heart Box.\r\n\r\nA perfect gift for any occasion.', 10, '0.00', '2000.00', 1, '1-Ferrero hearts rose box w.jpg', '1-Ferrero hearts rose box1w.jpg', '1-Ferrero hearts rose box3w.jpg', '', '', 'Only Lahore', 3, '2018-01-16 08:31:36', '2018-01-16 08:31:36'),
(130, 'Kitkat Burj Khalifa', 'CB-24', 'kitkat-burj-khalifa', 'Burj Khalifa? As the name suggest it is a 7 Story Chocolate Arrangement making it perfect for all the beautiful people out there. \r\n\r\nIt includes total of 50 Chocolates made to perfection with decor in it. Name says it all.', 10, '0.00', '5500.00', 1, '1-Kitkat burj khalifa w2.jpg', '1-Kitkat burj khalifa w.jpg', '', '', '', 'Only Lahore', 3, '2018-01-16 08:37:20', '2018-01-16 08:37:20'),
(131, 'Dairy Milk Heights', 'CB-25', 'dairy-milks-heights', 'Our New Creation is a perfect gift for Chocolate Lovers. An arrangement using 31 chocolates make it a perfect gift for anyone.', 10, '0.00', '3700.00', 1, '1-Dairy Milk Heights w.jpg', '1-Dairy Milk Heights w2.jpg', '', '', '', 'Only Lahore', 3, '2018-01-16 08:48:10', '2018-01-16 08:48:10'),
(132, 'Love Hearts Arrangements', 'CD-10', 'love-hearts-arrangement', 'A beautiful Arrangement to surprise your loved ones with an option of 7 pictures on a heart shape style.\r\n\r\nIt can be a perfect piece of decoration in your loved one\'s bedroom.', 9, '0.00', '2500.00', 1, '1-Love hearts.jpg', '1-Love-hearts.jpg', '1-Love-hearts1.jpg', '', '', 'Only Lahore', 2, '2018-01-23 12:57:29', '2018-01-24 13:09:13'),
(133, 'Bounty Gold Arrangement', 'CB-26', 'bounty-gold-arrangement', 'A beautiful arrangement for those who loves bounties and Ferrero rochers. \r\n\r\nA popping 16 Bounty Chocolates with 10 Ferrero rochers and a Beauitful decor is for all.', 10, '0.00', '3000.00', 1, '1-WhatsApp Image 2018-01-25 at 4.21.14 PM.jpeg', '1-bounty-gold-arrangement3.jpg', '1-bounty-gold-arrangement2.jpg', '', '', 'Only Lahore', 3, '2018-01-25 11:23:48', '2018-01-25 11:23:49'),
(134, 'Pink Surprises Bouquet', 'FB-17', 'pink-surprises-bouquet', 'A Beautiful bouquet consisting of Pink and White Gladiolus with a touch of Pink roses. \r\n\r\nIt\'s an essence of beauty and can be delivered anywhere in Lahore.\r\n\r\nNote:\r\nColour of roses varies depending on availability. Alternative colours will be used in case of unavailability.', 2, '0.00', '1500.00', 1, '1-Pink-surprises-bouquet.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 12:12:57', '2018-03-27 12:12:57'),
(135, 'Rose Basket', 'FB-18', 'rose-basket', 'Our Signature Baskets turned into Flower Baskets. A Beautiful white basket full of Red roses (Around 28-30 stems) with a touch of Gypsophila.\r\n\r\nIts a Love Basket not just a flower basket ;)', 2, '2000.00', '1900.00', 1, '1-Rose-Basket1.jpg', '1-Rose-basket.jpg', '', '', '', 'Only Lahore', 3, '2018-03-27 12:16:11', '2018-04-19 14:15:44'),
(136, 'Signature Card', 'HC-20', 'signature-card', 'A fine cut card with ribbon for any occasion.', 4, '0.00', '200.00', 1, '1-Signature card.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 12:24:39', '2018-03-27 12:24:39'),
(137, 'New Born Ferrero Bouquet (blue)', 'CB-28', 'new-born-ferrero-bouquet-blue', 'A perfect to gift your Lovely Family. Either it is to Congratulate on New Born or to surprise your Loved ones. It uses 24 Ferrero Rochers making it special for Someone you Love. Product May vary in design as it\'s done by Hand.', 10, '0.00', '2000.00', 1, '1-new-born-ferrero-bouquet-blue.jpg', '1-new-born-ferrero-bouquet-blue1.jpg', '', '', '', 'Only Lahore', 3, '2018-03-27 13:00:01', '2018-03-27 13:00:01'),
(138, 'Purple Teddy Bouquet', 'CB-27', 'purple-teddy-bouquet', 'Want to gift something to a Child? whats more better then a Small teddy bear with amazing Chocolates. Order This for their Special days or make their normal days special.', 10, '0.00', '2000.00', 1, '1-Purple Teddy Bouquet.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:03:35', '2018-03-27 13:03:35'),
(139, 'Love Frame (blue)', 'CF-11', 'love-frame-blue', 'A beautiful gift for your Family. Nothing can beat then Good Memories.', 7, '0.00', '750.00', 1, '1-Love Frame (Blue).jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:31:22', '2018-03-27 13:34:07'),
(140, 'Love Frame (Pink)', 'CF-12', 'love-frame-pink', 'An amazing gift for your Family. Because nothing beats good Memories.', 7, '0.00', '750.00', 1, '1-Love Frame (Pink).jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:33:12', '2018-03-27 13:33:12'),
(141, 'Lovev Frame (White)', 'CF-13', 'love-frame-white', 'A beautiful gift for your Family. Nothing can beat then Good Memories.', 7, '0.00', '750.00', 1, '1-Love Frame (White).jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:34:45', '2018-03-27 13:34:45'),
(142, 'Heart Frame', 'CF-14', 'heart-frame', 'A beautiful frame which can hold 3 pictures is one of the best gifts you can give to soulmates.', 7, '0.00', '1750.00', 1, '1-Heart Frame.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:36:04', '2018-03-27 13:36:04'),
(143, 'Heart Eyes Emoji', 'ST=09', 'heart-eyes-emoji', 'Our Emoji Cushions are the best way to respond what you wanna say to your loved ones.', 8, '0.00', '650.00', 0, '1-Heart Eyes Emoji.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:37:44', '2018-05-28 11:01:01'),
(144, 'Kiss Emoji', 'ST-11', 'kiss-emoji', 'Our Emoji Cushions are the best way to respond what you wanna say to your loved ones.', 8, '0.00', '650.00', 0, '1-Kiss Emoji.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:38:23', '2018-05-28 11:00:45');
INSERT INTO `products` (`id`, `title`, `sku`, `slug`, `description`, `category_id`, `regular_price`, `price`, `available`, `image1`, `image2`, `image3`, `image4`, `image5`, `delivery`, `packaging`, `created_at`, `updated_at`) VALUES
(145, 'Side tongue Emoji', 'ST-12', 'side-tongue-emoji', 'Our Emoji Cushions are the best way to respond what you wanna say to your loved ones.', 8, '0.00', '650.00', 1, '1-Side Tongue Emoji.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:39:00', '2018-03-27 13:39:00'),
(146, 'One Eye Tongue Emoji', 'ST-13', 'One-Eye-Tongue-Emoji', 'Our Emoji Cushions are the best way to respond what you wanna say to your loved ones.', 8, '0.00', '650.00', 1, '1-One Eye Tongue Emoji.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:39:58', '2018-03-27 13:39:58'),
(147, 'Laugh Emoji', 'ST-14', 'laugh-emoji', 'Our Emoji Cushions are the best way to respond what you wanna say to your loved ones.', 8, '0.00', '650.00', 1, '1-Laugh Emoji.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:40:51', '2018-03-27 13:40:51'),
(148, 'Laugh with tears Emoji', 'ST-15', 'laugh-tear-emoji', 'Our Emoji Cushions are the best way to respond what you wanna say to your loved ones.', 8, '0.00', '650.00', 1, '1-laugh with drop emoji.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:41:43', '2018-03-27 13:41:43'),
(149, 'Purple Small teddy', 'ST-16', 'purple-small-teddy', 'A gift which will look amazing with a cake or flowers. Not to be missed one.', 8, '0.00', '350.00', 1, '1-purple small teddy.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:44:35', '2018-03-27 13:44:35'),
(150, 'Brown Small teddy', 'ST-17', 'brown-small-teddy', 'A gift which will look amazing with a cake or flowers. Not to be missed one.', 8, '0.00', '350.00', 1, '1-brown small teddyy.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:45:07', '2018-03-27 13:45:07'),
(151, 'White Small teddy', 'ST-18', 'white-small-teddy', 'A gift which will look amazing with a cake or flowers. Not to be missed one.', 8, '0.00', '400.00', 1, '1-white small teddy.jpg', '', '', '', '', 'Only Lahore', 3, '2018-03-27 13:45:41', '2018-03-27 13:45:41'),
(152, 'Coffee Crunch (1lb)', 'BC-07', 'coffee-crunch-1lb', 'Our One of the finest cakes if you love Coffee then no need to go somewhere else. Have this with tea or Celebrate your Loved ones birthday.', 1, '0.00', '850.00', 1, '1-5.jpg', '1-4.jpg', '', '', '', 'Only Lahore', 3, '2018-03-27 13:50:35', '2018-03-27 13:50:35'),
(153, 'Dairy Milk Cake (2lbs)', 'BC-09', 'dairy-milk-cake', 'Love for Chocolate is never ending? then go no where Our Cadbury Chocolate Cake is for all hardcore Chocolate lovers, Beautifully layered with Cadbury Surprise chunks all the way. No one can beat it ;)', 1, '0.00', '2000.00', 1, '1-Dairy-milk-cake.jpg', '1-Dairy-milk-cake1.jpg', '', '', '', 'Only Lahore', 3, '2018-03-27 13:55:17', '2018-03-27 13:55:17'),
(154, 'Kitkat Dairy Arrangement', 'CB-14-deal', 'kitkat-dairy-cake-arrangement', 'Don\'t want a Cake? No issues take Our Chocolate Made Cake.\r\n\r\nUsing 11 kitkats and 200 g of  Dairy milks, We make one amazing piece of Chocolate Arrangement in cake style. \r\n\r\nCan be delivered Anywhere in Pakistan', 9, '0.00', '2000.00', 0, '1-kitkat-dairymilk-cake-arrangement.jpg', '1-kitkat-dairymilk-cake-arrangement2.jpg', '', '', '', 'Only Lahore', 3, '2018-04-13 11:22:40', '2018-04-19 14:44:51'),
(155, 'Food Basket (Naan)', 'GB-17', 'food-basket-naan', 'Looking for some amazing hot food to be delivered in a beautiful gift basket? Then this is the best you can get. \r\n\r\nA beautiful Gift basket consists of 6 assorted naans and Nestle Raita Box is an absolute Good Food as a gift. \r\n\r\nNote: \r\n- You can get a Customized version with having any type of food. (For details get in touch with us on Facebook or whatsapp)\r\n1. www.facebook.com/youthinkwewrap\r\n2. Whatsapp/ sms/ call at: 0335 452 4728.', 3, '0.00', '2500.00', 1, '1-WhatsApp Image 2018-04-17 at 5.32.52 PM.jpeg', '', '', '', '', 'Only Lahore', 1, '2018-04-17 12:46:29', '2018-04-17 12:46:29'),
(156, 'Mother Beauty Care Basket', 'GB-18', 'mother-beauty-care-basket', 'A Beautiful basket having 10 different high quality Beauty Care Products in a Medium Basket with complete decor and net. Oh it also includes 2 Customized hand written tags ;) \r\n\r\nA Perfect shot for Her.', 3, '4750.00', '4200.00', 1, '1-Beauty-Care-Basket.jpeg', '', '', '', '', 'Only Lahore', 1, '2018-04-24 13:06:47', '2018-04-24 13:06:47'),
(157, 'I love you Cushion + Mug Deal', 'MD-05', 'love-you-cushion-mug-deal', 'Grab one of our amazing deals having 14x14 Printed Cushion + White Mug with an amazing I Love you Ammi Jaan Deal.', 9, '0.00', '2500.00', 1, '1-Post-104.png', '', '', '', '', 'Only Lahore', 1, '2018-04-24 14:41:59', '2018-04-24 14:41:59'),
(158, 'Ammi Tussi Great ho Cushion + Mug Deal', 'MD-07', 'Ammi-Tussi-Great-ho-Cushion-Mug-Deal', 'Grab one of our amazing deals having 14x14 Printed Cushion + White Mug with an amazing design Ammi Tussi Great Ho Deal.', 9, '0.00', '2500.00', 1, '1-CushionMug.jpg', '', '', '', '', 'Only Lahore', 1, '2018-04-24 14:45:47', '2018-04-24 14:45:47'),
(159, 'Mix Gladilous Bouquet + Ferrero Rocher Deal', 'MD-01', 'Mix-Gladilous-Bouquet-Ferrero-Rocher-Deal', 'Our Beautiful Mix Colour Gladilous (10+ stems mix colours) with imported Ferrero rochers is a perfect gift for everyone.', 9, '2250.00', '2150.00', 1, '1-Post-105.png', '', '', '', '', 'Only Lahore', 3, '2018-04-24 14:49:59', '2018-04-24 14:49:59'),
(160, 'Special Mix Basket', 'FB-19', 'special-mix-basket', 'A beautiful round style basket with a touch of imported Chrysanthemum, Beautiful Gladiolus, Gypsophila and Roses', 2, '2750.00', '2500.00', 1, '1-Special Mix Basket (600x600).jpg', '', '', '', '', 'Only Lahore', 1, '2018-05-02 13:37:09', '2018-05-02 13:37:09'),
(161, 'Vase Expressions Bouquet', 'FB-20', 'vase-expressions-bouquet', 'Flowers are just a perfect way to express your feelings and that said we work day and night to bring out something more beautiful every day. \r\n\r\nBringing to you Our First Glass Vase Flower Arrangements which can blow with amazing looks and beautiful arrangement.', 2, '0.00', '3000.00', 1, '1-Vase-Expressions-bouquet.jpg', '1-Vase Expressions bouquet1.jpg', '', '', '', 'Only Lahore', 3, '2018-06-06 09:32:56', '2018-06-06 09:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(48, 22, 1, '2017-10-25 01:41:30', '2017-10-25 01:41:30'),
(50, 24, 1, '2017-10-25 01:42:29', '2017-10-25 01:42:29'),
(60, 51, 2, '2017-10-25 01:48:35', '2017-10-25 01:48:35'),
(114, 55, 2, '2017-11-01 10:59:29', '2017-11-01 10:59:29'),
(127, 21, 1, '2017-11-01 11:03:32', '2017-11-01 11:03:32'),
(148, 25, 1, '2017-12-17 20:49:48', '2017-12-17 20:49:48'),
(149, 10, 1, '2017-12-17 20:50:17', '2017-12-17 20:50:17'),
(166, 87, 2, '2017-12-17 21:14:28', '2017-12-17 21:14:28'),
(167, 87, 3, '2017-12-17 21:14:28', '2017-12-17 21:14:28'),
(168, 87, 12, '2017-12-17 21:14:28', '2017-12-17 21:14:28'),
(169, 88, 1, '2017-12-17 21:15:47', '2017-12-17 21:15:47'),
(170, 88, 11, '2017-12-17 21:15:47', '2017-12-17 21:15:47'),
(215, 53, 2, '2017-12-17 21:23:02', '2017-12-17 21:23:02'),
(216, 53, 3, '2017-12-17 21:23:02', '2017-12-17 21:23:02'),
(217, 53, 11, '2017-12-17 21:23:02', '2017-12-17 21:23:02'),
(218, 53, 12, '2017-12-17 21:23:02', '2017-12-17 21:23:02'),
(219, 53, 14, '2017-12-17 21:23:02', '2017-12-17 21:23:02'),
(220, 53, 15, '2017-12-17 21:23:02', '2017-12-17 21:23:02'),
(221, 11, 2, '2017-12-17 21:25:01', '2017-12-17 21:25:01'),
(222, 11, 11, '2017-12-17 21:25:01', '2017-12-17 21:25:01'),
(223, 11, 12, '2017-12-17 21:25:01', '2017-12-17 21:25:01'),
(231, 30, 1, '2017-12-17 21:28:15', '2017-12-17 21:28:15'),
(232, 30, 2, '2017-12-17 21:28:15', '2017-12-17 21:28:15'),
(233, 30, 11, '2017-12-17 21:28:15', '2017-12-17 21:28:15'),
(234, 30, 14, '2017-12-17 21:28:15', '2017-12-17 21:28:15'),
(235, 30, 15, '2017-12-17 21:28:15', '2017-12-17 21:28:15'),
(246, 60, 11, '2017-12-17 21:32:04', '2017-12-17 21:32:04'),
(248, 89, 11, '2017-12-18 11:27:12', '2017-12-18 11:27:12'),
(249, 4, 1, '2017-12-20 17:29:06', '2017-12-20 17:29:06'),
(252, 91, 1, '2017-12-20 17:35:37', '2017-12-20 17:35:37'),
(253, 92, 1, '2017-12-20 17:37:46', '2017-12-20 17:37:46'),
(254, 90, 1, '2017-12-20 17:39:20', '2017-12-20 17:39:20'),
(255, 93, 2, '2017-12-22 08:06:57', '2017-12-22 08:06:57'),
(256, 93, 3, '2017-12-22 08:06:57', '2017-12-22 08:06:57'),
(257, 93, 12, '2017-12-22 08:06:57', '2017-12-22 08:06:57'),
(258, 93, 15, '2017-12-22 08:06:57', '2017-12-22 08:06:57'),
(275, 94, 11, '2017-12-22 08:52:08', '2017-12-22 08:52:08'),
(283, 56, 12, '2017-12-22 09:54:13', '2017-12-22 09:54:13'),
(284, 56, 14, '2017-12-22 09:54:13', '2017-12-22 09:54:13'),
(285, 101, 1, '2017-12-23 13:01:24', '2017-12-23 13:01:24'),
(286, 101, 2, '2017-12-23 13:01:24', '2017-12-23 13:01:24'),
(290, 29, 2, '2017-12-25 07:51:22', '2017-12-25 07:51:22'),
(291, 29, 3, '2017-12-25 07:51:22', '2017-12-25 07:51:22'),
(292, 29, 11, '2017-12-25 07:51:22', '2017-12-25 07:51:22'),
(293, 29, 12, '2017-12-25 07:51:22', '2017-12-25 07:51:22'),
(294, 29, 14, '2017-12-25 07:51:22', '2017-12-25 07:51:22'),
(295, 29, 15, '2017-12-25 07:51:22', '2017-12-25 07:51:22'),
(304, 114, 17, '2017-12-26 14:56:25', '2017-12-26 14:56:25'),
(305, 115, 17, '2017-12-26 15:11:04', '2017-12-26 15:11:04'),
(306, 116, 17, '2017-12-26 15:15:29', '2017-12-26 15:15:29'),
(315, 2, 11, '2018-01-15 14:02:14', '2018-01-15 14:02:14'),
(316, 2, 18, '2018-01-15 14:02:14', '2018-01-15 14:02:14'),
(317, 9, 1, '2018-01-15 14:03:38', '2018-01-15 14:03:38'),
(318, 9, 2, '2018-01-15 14:03:38', '2018-01-15 14:03:38'),
(319, 9, 11, '2018-01-15 14:03:38', '2018-01-15 14:03:38'),
(320, 9, 12, '2018-01-15 14:03:38', '2018-01-15 14:03:38'),
(321, 9, 14, '2018-01-15 14:03:38', '2018-01-15 14:03:38'),
(322, 9, 15, '2018-01-15 14:03:38', '2018-01-15 14:03:38'),
(323, 9, 16, '2018-01-15 14:03:38', '2018-01-15 14:03:38'),
(324, 9, 18, '2018-01-15 14:03:38', '2018-01-15 14:03:38'),
(325, 17, 1, '2018-01-15 14:04:13', '2018-01-15 14:04:13'),
(326, 17, 18, '2018-01-15 14:04:13', '2018-01-15 14:04:13'),
(347, 78, 3, '2018-01-15 14:15:09', '2018-01-15 14:15:09'),
(348, 78, 11, '2018-01-15 14:15:09', '2018-01-15 14:15:09'),
(349, 78, 18, '2018-01-15 14:15:09', '2018-01-15 14:15:09'),
(350, 79, 3, '2018-01-15 14:15:46', '2018-01-15 14:15:46'),
(351, 79, 11, '2018-01-15 14:15:46', '2018-01-15 14:15:46'),
(352, 79, 18, '2018-01-15 14:15:46', '2018-01-15 14:15:46'),
(353, 81, 1, '2018-01-15 14:15:50', '2018-01-15 14:15:50'),
(354, 81, 2, '2018-01-15 14:15:50', '2018-01-15 14:15:50'),
(355, 81, 3, '2018-01-15 14:15:50', '2018-01-15 14:15:50'),
(356, 81, 11, '2018-01-15 14:15:50', '2018-01-15 14:15:50'),
(357, 81, 16, '2018-01-15 14:15:50', '2018-01-15 14:15:50'),
(358, 81, 18, '2018-01-15 14:15:50', '2018-01-15 14:15:50'),
(359, 80, 2, '2018-01-15 14:15:59', '2018-01-15 14:15:59'),
(360, 80, 11, '2018-01-15 14:15:59', '2018-01-15 14:15:59'),
(361, 20, 1, '2018-01-15 14:17:58', '2018-01-15 14:17:58'),
(362, 20, 18, '2018-01-15 14:17:58', '2018-01-15 14:17:58'),
(363, 3, 11, '2018-01-15 14:19:24', '2018-01-15 14:19:24'),
(364, 3, 18, '2018-01-15 14:19:24', '2018-01-15 14:19:24'),
(365, 122, 18, '2018-01-15 14:22:07', '2018-01-15 14:22:07'),
(366, 52, 2, '2018-01-15 14:27:44', '2018-01-15 14:27:44'),
(367, 52, 18, '2018-01-15 14:27:44', '2018-01-15 14:27:44'),
(384, 49, 2, '2018-01-15 14:29:33', '2018-01-15 14:29:33'),
(385, 49, 18, '2018-01-15 14:29:33', '2018-01-15 14:29:33'),
(410, 127, 18, '2018-01-16 08:25:21', '2018-01-16 08:25:21'),
(416, 131, 18, '2018-01-16 08:48:10', '2018-01-16 08:48:10'),
(417, 130, 18, '2018-01-16 08:50:07', '2018-01-16 08:50:07'),
(418, 85, 16, '2018-01-16 09:07:29', '2018-01-16 09:07:29'),
(419, 85, 18, '2018-01-16 09:07:29', '2018-01-16 09:07:29'),
(420, 104, 11, '2018-01-16 09:07:57', '2018-01-16 09:07:57'),
(421, 104, 16, '2018-01-16 09:07:57', '2018-01-16 09:07:57'),
(422, 104, 18, '2018-01-16 09:07:57', '2018-01-16 09:07:57'),
(423, 45, 1, '2018-01-17 12:54:58', '2018-01-17 12:54:58'),
(424, 45, 2, '2018-01-17 12:54:58', '2018-01-17 12:54:58'),
(425, 45, 3, '2018-01-17 12:54:58', '2018-01-17 12:54:58'),
(426, 45, 11, '2018-01-17 12:54:58', '2018-01-17 12:54:58'),
(427, 46, 1, '2018-01-17 15:23:01', '2018-01-17 15:23:01'),
(428, 46, 2, '2018-01-17 15:23:01', '2018-01-17 15:23:01'),
(429, 46, 3, '2018-01-17 15:23:01', '2018-01-17 15:23:01'),
(430, 46, 11, '2018-01-17 15:23:01', '2018-01-17 15:23:01'),
(431, 46, 12, '2018-01-17 15:23:01', '2018-01-17 15:23:01'),
(432, 46, 13, '2018-01-17 15:23:01', '2018-01-17 15:23:01'),
(433, 46, 15, '2018-01-17 15:23:01', '2018-01-17 15:23:01'),
(434, 46, 18, '2018-01-17 15:23:01', '2018-01-17 15:23:01'),
(435, 1, 1, '2018-01-17 15:23:18', '2018-01-17 15:23:18'),
(436, 1, 2, '2018-01-17 15:23:18', '2018-01-17 15:23:18'),
(437, 1, 3, '2018-01-17 15:23:18', '2018-01-17 15:23:18'),
(438, 1, 11, '2018-01-17 15:23:18', '2018-01-17 15:23:18'),
(439, 1, 12, '2018-01-17 15:23:18', '2018-01-17 15:23:18'),
(440, 1, 14, '2018-01-17 15:23:18', '2018-01-17 15:23:18'),
(441, 1, 15, '2018-01-17 15:23:18', '2018-01-17 15:23:18'),
(442, 1, 16, '2018-01-17 15:23:18', '2018-01-17 15:23:18'),
(443, 15, 11, '2018-01-22 14:02:17', '2018-01-22 14:02:17'),
(445, 132, 18, '2018-01-24 13:09:13', '2018-01-24 13:09:13'),
(446, 133, 11, '2018-01-25 11:23:48', '2018-01-25 11:23:48'),
(447, 133, 18, '2018-01-25 11:23:48', '2018-01-25 11:23:48'),
(448, 125, 14, '2018-01-29 07:32:27', '2018-01-29 07:32:27'),
(449, 125, 15, '2018-01-29 07:32:27', '2018-01-29 07:32:27'),
(450, 125, 18, '2018-01-29 07:32:27', '2018-01-29 07:32:27'),
(451, 82, 11, '2018-02-04 09:36:53', '2018-02-04 09:36:53'),
(452, 121, 11, '2018-02-15 11:34:07', '2018-02-15 11:34:07'),
(453, 121, 14, '2018-02-15 11:34:07', '2018-02-15 11:34:07'),
(454, 121, 15, '2018-02-15 11:34:07', '2018-02-15 11:34:07'),
(467, 136, 3, '2018-03-27 12:24:39', '2018-03-27 12:24:39'),
(468, 136, 11, '2018-03-27 12:24:39', '2018-03-27 12:24:39'),
(469, 136, 12, '2018-03-27 12:24:39', '2018-03-27 12:24:39'),
(470, 137, 11, '2018-03-27 13:00:01', '2018-03-27 13:00:01'),
(471, 138, 11, '2018-03-27 13:03:35', '2018-03-27 13:03:35'),
(473, 140, 12, '2018-03-27 13:33:12', '2018-03-27 13:33:12'),
(474, 140, 14, '2018-03-27 13:33:12', '2018-03-27 13:33:12'),
(475, 139, 14, '2018-03-27 13:34:07', '2018-03-27 13:34:07'),
(476, 141, 12, '2018-03-27 13:34:45', '2018-03-27 13:34:45'),
(477, 141, 14, '2018-03-27 13:34:45', '2018-03-27 13:34:45'),
(478, 142, 12, '2018-03-27 13:36:04', '2018-03-27 13:36:04'),
(479, 142, 14, '2018-03-27 13:36:04', '2018-03-27 13:36:04'),
(486, 145, 3, '2018-03-27 13:39:00', '2018-03-27 13:39:00'),
(487, 147, 3, '2018-03-27 13:40:51', '2018-03-27 13:40:51'),
(488, 147, 11, '2018-03-27 13:40:51', '2018-03-27 13:40:51'),
(489, 148, 3, '2018-03-27 13:41:43', '2018-03-27 13:41:43'),
(490, 148, 11, '2018-03-27 13:41:43', '2018-03-27 13:41:43'),
(491, 149, 11, '2018-03-27 13:44:35', '2018-03-27 13:44:35'),
(493, 153, 11, '2018-03-27 13:55:17', '2018-03-27 13:55:17'),
(494, 153, 12, '2018-03-27 13:55:17', '2018-03-27 13:55:17'),
(495, 153, 14, '2018-03-27 13:55:17', '2018-03-27 13:55:17'),
(504, 155, 11, '2018-04-17 12:46:29', '2018-04-17 12:46:29'),
(505, 155, 16, '2018-04-17 12:46:29', '2018-04-17 12:46:29'),
(514, 48, 2, '2018-04-19 14:13:51', '2018-04-19 14:13:51'),
(515, 48, 3, '2018-04-19 14:13:51', '2018-04-19 14:13:51'),
(516, 48, 11, '2018-04-19 14:13:51', '2018-04-19 14:13:51'),
(517, 48, 12, '2018-04-19 14:13:51', '2018-04-19 14:13:51'),
(518, 48, 14, '2018-04-19 14:13:51', '2018-04-19 14:13:51'),
(519, 48, 19, '2018-04-19 14:13:51', '2018-04-19 14:13:51'),
(520, 135, 3, '2018-04-19 14:15:44', '2018-04-19 14:15:44'),
(521, 135, 11, '2018-04-19 14:15:44', '2018-04-19 14:15:44'),
(522, 135, 12, '2018-04-19 14:15:44', '2018-04-19 14:15:44'),
(523, 135, 14, '2018-04-19 14:15:44', '2018-04-19 14:15:44'),
(524, 135, 15, '2018-04-19 14:15:44', '2018-04-19 14:15:44'),
(525, 135, 16, '2018-04-19 14:15:44', '2018-04-19 14:15:44'),
(526, 135, 19, '2018-04-19 14:15:44', '2018-04-19 14:15:44'),
(527, 126, 12, '2018-04-19 14:16:09', '2018-04-19 14:16:09'),
(528, 126, 14, '2018-04-19 14:16:09', '2018-04-19 14:16:09'),
(529, 126, 18, '2018-04-19 14:16:09', '2018-04-19 14:16:09'),
(530, 126, 19, '2018-04-19 14:16:09', '2018-04-19 14:16:09'),
(531, 134, 3, '2018-04-19 14:16:22', '2018-04-19 14:16:22'),
(532, 134, 11, '2018-04-19 14:16:22', '2018-04-19 14:16:22'),
(533, 134, 14, '2018-04-19 14:16:22', '2018-04-19 14:16:22'),
(534, 134, 15, '2018-04-19 14:16:22', '2018-04-19 14:16:22'),
(535, 134, 16, '2018-04-19 14:16:22', '2018-04-19 14:16:22'),
(536, 134, 19, '2018-04-19 14:16:22', '2018-04-19 14:16:22'),
(540, 54, 2, '2018-04-19 14:17:48', '2018-04-19 14:17:48'),
(541, 54, 18, '2018-04-19 14:17:48', '2018-04-19 14:17:48'),
(542, 54, 19, '2018-04-19 14:17:48', '2018-04-19 14:17:48'),
(543, 47, 1, '2018-04-19 14:18:16', '2018-04-19 14:18:16'),
(544, 47, 2, '2018-04-19 14:18:16', '2018-04-19 14:18:16'),
(545, 47, 3, '2018-04-19 14:18:16', '2018-04-19 14:18:16'),
(546, 47, 11, '2018-04-19 14:18:16', '2018-04-19 14:18:16'),
(547, 47, 14, '2018-04-19 14:18:16', '2018-04-19 14:18:16'),
(548, 47, 15, '2018-04-19 14:18:16', '2018-04-19 14:18:16'),
(549, 47, 16, '2018-04-19 14:18:16', '2018-04-19 14:18:16'),
(550, 47, 18, '2018-04-19 14:18:16', '2018-04-19 14:18:16'),
(551, 47, 19, '2018-04-19 14:18:16', '2018-04-19 14:18:16'),
(555, 23, 15, '2018-04-19 14:38:25', '2018-04-19 14:38:25'),
(556, 23, 16, '2018-04-19 14:38:25', '2018-04-19 14:38:25'),
(557, 23, 19, '2018-04-19 14:38:25', '2018-04-19 14:38:25'),
(558, 152, 3, '2018-04-19 14:38:45', '2018-04-19 14:38:45'),
(559, 152, 19, '2018-04-19 14:38:45', '2018-04-19 14:38:45'),
(560, 19, 19, '2018-04-19 14:38:56', '2018-04-19 14:38:56'),
(568, 26, 1, '2018-04-19 14:41:01', '2018-04-19 14:41:01'),
(569, 26, 2, '2018-04-19 14:41:01', '2018-04-19 14:41:01'),
(570, 26, 11, '2018-04-19 14:41:01', '2018-04-19 14:41:01'),
(571, 26, 12, '2018-04-19 14:41:01', '2018-04-19 14:41:01'),
(572, 26, 14, '2018-04-19 14:41:01', '2018-04-19 14:41:01'),
(573, 26, 15, '2018-04-19 14:41:01', '2018-04-19 14:41:01'),
(574, 26, 19, '2018-04-19 14:41:01', '2018-04-19 14:41:01'),
(575, 129, 12, '2018-04-19 14:42:45', '2018-04-19 14:42:45'),
(576, 129, 14, '2018-04-19 14:42:45', '2018-04-19 14:42:45'),
(577, 129, 18, '2018-04-19 14:42:45', '2018-04-19 14:42:45'),
(578, 129, 19, '2018-04-19 14:42:45', '2018-04-19 14:42:45'),
(579, 86, 1, '2018-04-19 14:43:40', '2018-04-19 14:43:40'),
(580, 86, 2, '2018-04-19 14:43:40', '2018-04-19 14:43:40'),
(581, 86, 11, '2018-04-19 14:43:40', '2018-04-19 14:43:40'),
(582, 86, 12, '2018-04-19 14:43:40', '2018-04-19 14:43:40'),
(583, 86, 14, '2018-04-19 14:43:40', '2018-04-19 14:43:40'),
(584, 86, 15, '2018-04-19 14:43:40', '2018-04-19 14:43:40'),
(585, 86, 16, '2018-04-19 14:43:40', '2018-04-19 14:43:40'),
(586, 86, 19, '2018-04-19 14:43:40', '2018-04-19 14:43:40'),
(589, 42, 15, '2018-04-19 14:45:25', '2018-04-19 14:45:25'),
(590, 42, 16, '2018-04-19 14:45:25', '2018-04-19 14:45:25'),
(591, 42, 19, '2018-04-19 14:45:25', '2018-04-19 14:45:25'),
(594, 123, 3, '2018-04-23 13:16:42', '2018-04-23 13:16:42'),
(595, 123, 14, '2018-04-23 13:16:42', '2018-04-23 13:16:42'),
(596, 123, 19, '2018-04-23 13:16:42', '2018-04-23 13:16:42'),
(597, 156, 13, '2018-04-24 13:06:47', '2018-04-24 13:06:47'),
(598, 156, 19, '2018-04-24 13:06:47', '2018-04-24 13:06:47'),
(599, 71, 19, '2018-04-24 13:26:14', '2018-04-24 13:26:14'),
(600, 13, 12, '2018-04-24 13:28:30', '2018-04-24 13:28:30'),
(601, 13, 15, '2018-04-24 13:28:30', '2018-04-24 13:28:30'),
(602, 13, 19, '2018-04-24 13:28:30', '2018-04-24 13:28:30'),
(603, 67, 19, '2018-04-24 13:28:44', '2018-04-24 13:28:44'),
(604, 65, 19, '2018-04-24 13:28:59', '2018-04-24 13:28:59'),
(605, 72, 19, '2018-04-24 13:29:29', '2018-04-24 13:29:29'),
(606, 157, 19, '2018-04-24 14:41:59', '2018-04-24 14:41:59'),
(607, 158, 19, '2018-04-24 14:45:47', '2018-04-24 14:45:47'),
(608, 159, 11, '2018-04-24 14:49:59', '2018-04-24 14:49:59'),
(609, 159, 13, '2018-04-24 14:49:59', '2018-04-24 14:49:59'),
(610, 159, 19, '2018-04-24 14:49:59', '2018-04-24 14:49:59'),
(611, 84, 1, '2018-04-25 13:59:10', '2018-04-25 13:59:10'),
(612, 84, 2, '2018-04-25 13:59:10', '2018-04-25 13:59:10'),
(613, 84, 11, '2018-04-25 13:59:10', '2018-04-25 13:59:10'),
(614, 84, 13, '2018-04-25 13:59:10', '2018-04-25 13:59:10'),
(615, 84, 15, '2018-04-25 13:59:10', '2018-04-25 13:59:10'),
(616, 84, 16, '2018-04-25 13:59:10', '2018-04-25 13:59:10'),
(617, 84, 18, '2018-04-25 13:59:10', '2018-04-25 13:59:10'),
(618, 84, 19, '2018-04-25 13:59:10', '2018-04-25 13:59:10'),
(619, 154, 1, '2018-04-25 14:00:07', '2018-04-25 14:00:07'),
(620, 50, 19, '2018-04-29 18:09:35', '2018-04-29 18:09:35'),
(621, 160, 14, '2018-05-02 13:37:09', '2018-05-02 13:37:09'),
(622, 160, 19, '2018-05-02 13:37:09', '2018-05-02 13:37:09'),
(623, 144, 11, '2018-05-28 11:00:45', '2018-05-28 11:00:45'),
(624, 144, 12, '2018-05-28 11:00:45', '2018-05-28 11:00:45'),
(625, 144, 14, '2018-05-28 11:00:45', '2018-05-28 11:00:45'),
(626, 143, 12, '2018-05-28 11:01:01', '2018-05-28 11:01:01'),
(627, 143, 14, '2018-05-28 11:01:01', '2018-05-28 11:01:01'),
(628, 143, 16, '2018-05-28 11:01:01', '2018-05-28 11:01:01'),
(633, 18, 1, '2018-05-29 18:42:45', '2018-05-29 18:42:45'),
(634, 18, 18, '2018-05-29 18:42:45', '2018-05-29 18:42:45'),
(635, 161, 11, '2018-06-06 09:32:56', '2018-06-06 09:32:56'),
(636, 161, 12, '2018-06-06 09:32:56', '2018-06-06 09:32:56'),
(637, 161, 14, '2018-06-06 09:32:56', '2018-06-06 09:32:56'),
(638, 27, 18, '2018-06-08 16:57:57', '2018-06-08 16:57:57'),
(639, 31, 2, '2018-07-12 07:32:26', '2018-07-12 07:32:26'),
(640, 31, 11, '2018-07-12 07:32:26', '2018-07-12 07:32:26'),
(641, 31, 15, '2018-07-12 07:32:26', '2018-07-12 07:32:26'),
(642, 31, 16, '2018-07-12 07:32:26', '2018-07-12 07:32:26'),
(643, 124, 11, '2018-08-03 10:39:43', '2018-08-03 10:39:43'),
(644, 124, 12, '2018-08-03 10:39:43', '2018-08-03 10:39:43'),
(645, 124, 14, '2018-08-03 10:39:43', '2018-08-03 10:39:43'),
(646, 124, 18, '2018-08-03 10:39:43', '2018-08-03 10:39:43'),
(647, 96, 11, '2018-08-10 09:47:18', '2018-08-10 09:47:18'),
(648, 83, 2, '2018-08-29 06:38:11', '2018-08-29 06:38:11'),
(649, 83, 15, '2018-08-29 06:38:11', '2018-08-29 06:38:11'),
(650, 83, 16, '2018-08-29 06:38:11', '2018-08-29 06:38:11'),
(651, 102, 11, '2018-09-24 12:16:07', '2018-09-24 12:16:07'),
(652, 102, 12, '2018-09-24 12:16:07', '2018-09-24 12:16:07'),
(653, 102, 15, '2018-09-24 12:16:07', '2018-09-24 12:16:07'),
(654, 120, 2, '2018-09-24 12:16:26', '2018-09-24 12:16:26'),
(655, 95, 3, '2018-09-24 12:16:45', '2018-09-24 12:16:45'),
(656, 95, 11, '2018-09-24 12:16:45', '2018-09-24 12:16:45'),
(657, 28, 2, '2018-09-24 12:17:14', '2018-09-24 12:17:14'),
(658, 28, 19, '2018-09-24 12:17:14', '2018-09-24 12:17:14'),
(659, 128, 16, '2018-09-24 12:18:50', '2018-09-24 12:18:50'),
(660, 128, 19, '2018-09-24 12:18:50', '2018-09-24 12:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `receiver_addresses`
--

CREATE TABLE `receiver_addresses` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `country` varchar(30) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receiver_addresses`
--

INSERT INTO `receiver_addresses` (`id`, `order_id`, `name`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 36, 'Ayaz Ahmed', 'address', 'address 2', 'city', '', '12345', '', '1234567890', '', '2017-11-01 03:38:59', '2017-11-01 03:38:59'),
(2, 37, 'Ayz', 'dsvwe', 'dfvedv', 'dsved', '', 'csdv', '', '21651', '', '2017-11-01 08:26:22', '2017-11-01 08:26:22'),
(3, 38, 'Ayz', 'dsvwe', 'dfvedv', 'dsved', '', 'csdv', '', '21651', '', '2017-11-01 08:33:48', '2017-11-01 08:33:48'),
(4, 39, 'Ayz', 'dsvwe', 'dfvedv', 'dsved', '', 'csdv', '', '21651', '', '2017-11-01 08:42:04', '2017-11-01 08:42:04'),
(5, 40, 'Ayz', 'dsvwe', 'dfvedv', 'dsved', '', 'csdv', '', '21651', '', '2017-11-01 09:41:44', '2017-11-01 09:41:44'),
(6, 41, 'Ayaz Ahmed', 'My Address', NULL, 'Karachi', '', '75300', '', '03008210313', '', '2017-12-11 06:35:51', '2017-12-11 06:35:51'),
(7, 42, 'Ayaz Arshed', 'Test', NULL, 'Lahore', '', '5400', '', '03354524728', '', '2017-12-12 15:03:28', '2017-12-12 15:03:28'),
(8, 43, 'Ayaz Arshed', 'Test', NULL, 'Lahore', '', '5400', '', '03354524728', '', '2017-12-12 15:08:27', '2017-12-12 15:08:27'),
(9, 44, 'Ayaz Arshed', 'Test', NULL, 'Lahore', '', '5400', '', '03354524728', '', '2017-12-12 15:33:23', '2017-12-12 15:33:23'),
(10, 45, 'Ayaz Arshed', 'Test', NULL, 'Lahore', '', '5400', '', '03354524728', '', '2017-12-12 15:35:36', '2017-12-12 15:35:36'),
(11, 46, 'Ali', 'Ali', NULL, 'Ali', '', 'Ali', '', 'Ali', '', '2017-12-13 18:11:08', '2017-12-13 18:11:08'),
(12, 47, 'Zain ahmed', '86E airline society', NULL, 'Lahore', '', '54000', '', '03484854', '', '2017-12-18 20:50:34', '2017-12-18 20:50:34'),
(13, 48, 'A', 'A', NULL, 'A', '', 'A', '', 'A', '', '2017-12-20 16:00:07', '2017-12-20 16:00:07'),
(14, 49, 'Syeda Wasiq Shah', 'House Number 48, Block A, PIA Society', NULL, 'Lahore', '', '54000', '', '03214041538, 03218026977', '', '2017-12-20 16:16:58', '2017-12-20 16:16:58'),
(15, 50, 'A', 'a', NULL, 'A', '', 'A', '', 's', '', '2017-12-20 16:20:28', '2017-12-20 16:20:28'),
(16, 51, 'mian faizan', 'askari 1', NULL, 'lahore', '', '12345', '', '03334081234', '', '2017-12-20 16:21:21', '2017-12-20 16:21:21'),
(17, 52, 'mian faizan', 'askari 1', NULL, 'lahore', '', '12345', '', '03334081234', '', '2017-12-20 16:27:54', '2017-12-20 16:27:54'),
(18, 53, 'SYED ZIAD ALI', 'House #5 street#23/A ramgharh mujahidabad mughalpura lahore', NULL, 'Lahore', '', '042', '', '03454817944', '', '2017-12-20 20:53:52', '2017-12-20 20:53:52'),
(19, 54, 'Mian Faizan', 'Askari 1', NULL, 'Lahore', '', '12345', '', '03334083492', '', '2017-12-21 05:04:53', '2017-12-21 05:04:53'),
(20, 55, 'Mian Faizan', 'Askari 1', NULL, 'Lahore', '', '12345', '', '03334083492', '', '2017-12-21 05:06:41', '2017-12-21 05:06:41'),
(21, 56, 'Nameer Ahmed', 'Somewhere', NULL, 'Karachi', '', '75300', '', '11111111111', '', '2017-12-21 05:54:34', '2017-12-21 05:54:34'),
(22, 57, 'Nameer Ahmed', 'Somewhere', NULL, 'Karachi', '', '75300', '', '3001212212', '', '2017-12-21 05:55:19', '2017-12-21 05:55:19'),
(23, 58, 'Muneeba chattha', 'House no 61 G street 4 ex park view phase 8 DHA lahore', NULL, 'Lahore', '', '54000', '', '03217479396', '', '2017-12-21 06:39:39', '2017-12-21 06:39:39'),
(24, 59, 'A', 'A', NULL, 'S', '', 'S', '', 'S', '', '2017-12-21 06:59:58', '2017-12-21 06:59:58'),
(25, 60, 'SOBAN KHAN', 'House 287, sector D, street 12, Askari 10, Lahore.', NULL, 'Lahore', '', '5400', '', '+923234296533', '', '2017-12-21 11:23:21', '2017-12-21 11:23:21'),
(26, 61, 'A', 'a', NULL, 'a', '', 'a', '', 'a', '', '2017-12-21 20:06:28', '2017-12-21 20:06:28'),
(27, 62, 'Jamil Goheer', 'House no 71, Defence Raya, DHA Phase VI', NULL, 'Lahore', '', '54000', '', '03214039777', '', '2017-12-26 06:01:35', '2017-12-26 06:01:35'),
(28, 63, 'Jannat junaid', '191 e2 wapda town', NULL, 'Lahore', '', '5400', '', '03038845383', '', '2017-12-26 13:01:12', '2017-12-26 13:01:12'),
(29, 64, 'Annie', '572-a f-2 Johar town lahore', NULL, 'Lahore', '', '058', '', '03234360849', '', '2017-12-30 10:46:19', '2017-12-30 10:46:19'),
(30, 65, 'Nabiya', 'Al Hassan house House no 33A block a lane 2 PAF colony zaraar shaheed road Lahore Cantt', NULL, 'Lahore', '', '54810', '', '03324843619', '', '2018-01-10 12:22:25', '2018-01-10 12:22:25'),
(31, 66, 'Rabbia', 'House Number 7 block H4', NULL, 'Lahore', '', '00000', '', '0749693469', '', '2018-01-13 21:59:52', '2018-01-13 21:59:52'),
(32, 67, 'Rabbia', 'House Number 7 block H4', NULL, 'Lahore', '', '0000', '', '07491693469', '', '2018-01-13 22:05:47', '2018-01-13 22:05:47'),
(33, 68, 'Ali Hassan', '98 AA DHA PHASE 4, LAHORE CANTT', NULL, 'LAHORE', '', '05444', '', '03431452948', '', '2018-01-16 11:19:14', '2018-01-16 11:19:14'),
(34, 69, 'Amnah', 'House 562, street 18, block GG, phase 4, DHA', NULL, 'Lahore', '', '54000', '', '03312322854', '', '2018-01-17 13:15:31', '2018-01-17 13:15:31'),
(35, 70, 'Sameer Haider', 'DHA phase 2 sector T street 8 house number 85', NULL, 'Lahore', '', '54000', '', '03229253575', '', '2018-01-17 19:16:20', '2018-01-17 19:16:20'),
(36, 74, 'Umair Ali', 'House no. 13, Street no: 3, Aary Wali Gali, near Shezan Factory, Ring Road, Lahore', NULL, 'Lahore', '', '54000', '', '03227374287', '', '2018-01-21 16:10:12', '2018-01-21 16:10:12'),
(37, 75, 'Hina', 'House No.1 Street No. 47, Ittefaq Street, Nadeem Shaheed Road, Shabab Chowk Samnabad, Lahore', NULL, 'Lahore', '', '54000', '', '03330420421', '', '2018-01-29 11:55:43', '2018-01-29 11:55:43'),
(38, 76, 'Nashra Rashid', '705-Block F, Johar town', NULL, 'Lahore', '', '1234', '', '03012436200', '', '2018-01-29 16:30:03', '2018-01-29 16:30:03'),
(39, 77, 'Zaib jutt', 'Style & style ladies tailor,jinah street main bazar saeed park shahdra lahore', NULL, 'Lahore', '', '0423', '', '03234337179    03216534599   03134435264', '', '2018-01-31 09:06:40', '2018-01-31 09:06:40'),
(40, 79, 'faizan', 'askari 1', NULL, 'lahore', '', NULL, '', '03334081234', '', '2018-02-02 05:42:14', '2018-02-02 05:42:14'),
(41, 80, 'Tabinda Khurshid', '11 B Railway Officers Colony, Lahore Cantt', NULL, 'Lahore', '', '54000', '', '03036097213', '', '2018-02-03 14:34:56', '2018-02-03 14:34:56'),
(42, 83, 'Rana Ahmed Arslan Manj', 'Plot No 68/69-B Sector C, Service Road, Bahria Town', NULL, 'Lahore', '', NULL, '', '0304092189 / 03214060412', '', '2018-02-04 15:21:14', '2018-02-04 15:21:14'),
(43, 84, 'Mahzib', 'street no 1, house no.229, danewal town vehari Vehari Punjab', NULL, 'Burewala', '', '61199', '', '03483905123', '', '2018-02-06 05:49:03', '2018-02-06 05:49:03'),
(44, 85, 'Mahzib Afzal', 'street no 1, house no.229, danewal town vehari Vehari Punjab', NULL, 'vehari', '', '61100', '', '03018096014', '', '2018-02-06 05:53:50', '2018-02-06 05:53:50'),
(45, 86, 'Hafiz Khawaja Umair', 'credit department office no FB 4 first floor 4 usman block new garden town lahore', NULL, 'lahore', '', '54000', '', '03314069874,  03211441176', '', '2018-02-11 07:08:45', '2018-02-11 07:08:45'),
(46, 87, 'Dr.Afra Ahmad', 'Mayo Hospital. Girls internee Hostel near mayo emergency building opp gate number 2 mayo hospital', NULL, 'Lahore', '', NULL, '', '03326641854.... or  03212482898', '', '2018-02-13 13:26:37', '2018-02-13 13:26:37'),
(47, 88, 'Anaab Fatima', 'Fatima Jinnah Girls Hostel Waris Road Lahore', NULL, 'Lahore', '', '54099', '', '+923415998701', '', '2018-02-13 21:15:58', '2018-02-13 21:15:58'),
(48, 89, 'Anaab Fatima', 'Fatima Jinnah Girls Hostel Waris Road Lahore', NULL, 'Lahore', '', '54099', '', '+923415998701', '', '2018-02-13 21:22:35', '2018-02-13 21:22:35'),
(49, 90, 'Moaz Mudassir', 'House no 221, 3-C-1 Township, Lahore', NULL, 'Lahore', '', '54400', '', '03370470076', '', '2018-03-04 14:09:01', '2018-03-04 14:09:01'),
(50, 91, 'Zia', 'Bahria orchards', NULL, 'Lahore', '', NULL, '', '00923004457411', '', '2018-03-14 18:55:42', '2018-03-14 18:55:42'),
(51, 92, 'Sikander khan', 'House no 82 abu baker block new garden town lahore', NULL, 'Lahore', '', '54000', '', '+923214356506', '', '2018-03-24 09:03:25', '2018-03-24 09:03:25'),
(52, 93, 'Dr.muneeb arshad', 'Lahore general hospital', NULL, 'Lahore', '', NULL, '', '03237404052', '', '2018-04-06 19:45:28', '2018-04-06 19:45:28'),
(53, 94, 'd', 'f', NULL, 'd', '', 'd', '', 'd', '', '2018-04-08 20:13:18', '2018-04-08 20:13:18'),
(54, 95, 'Shazia', '93 A Iqbal Avenue Phase 3 Canal Bank road Lahore', NULL, 'Lahore', '', '54000', '', '03224681262', '', '2018-04-12 21:25:48', '2018-04-12 21:25:48'),
(55, 96, 'Laiba shakeel', '74A Hajveri housing scheme harbanspura', NULL, 'Lahore', '', '54810', '', '03244229992', '', '2018-04-15 15:50:01', '2018-04-15 15:50:01'),
(56, 97, 'Saadia', 'H#182 F2 Wapda Town', NULL, 'Lahore', '', '54000', '', '+92 305 4003894', '', '2018-04-21 09:43:07', '2018-04-21 09:43:07'),
(57, 98, 'Zuhair Shabbir', '117 E PIA Housing Society', NULL, 'Lahore', '', '54770', '', '00923434199373, 00923134549538, 00923314835165,', '', '2018-04-22 15:05:37', '2018-04-22 15:05:37'),
(58, 99, 'Nighat Afza', 'House no 38, rehman villas defence road lahore cantt', NULL, 'Lahore', '', '12345', '', '03244555781', '', '2018-05-01 10:22:51', '2018-05-01 10:22:51'),
(59, 100, 'Mrs Asif', '208 A block DHA EME Society,Thokar niaz baig,lahore', NULL, 'Lahore', '', '0424', '', '03214608203', '', '2018-05-12 16:25:56', '2018-05-12 16:25:56'),
(60, 101, 'Mrs Asif', '208 A block DHA EME Society,Thokar niaz baig,lahore', NULL, 'Lahore', '', '0423', '', '03214608203', '', '2018-05-12 16:29:53', '2018-05-12 16:29:53'),
(61, 102, 'Rubina Ahmad', 'H#2,St#3,Amratsary Mohallah,Mughalpura,Lahore', NULL, 'Lahore', '', NULL, '', '03334214760', '', '2018-05-13 05:46:20', '2018-05-13 05:46:20'),
(62, 103, 'Ayesha Mohtashim', '42/1 Sector-M, Phase-1, DHA', NULL, 'Lahore', '', NULL, '', '03214090212', '', '2018-05-18 06:08:06', '2018-05-18 06:08:06'),
(63, 104, 'Mrs.Awais', 'House no104A butt street #32 new islamia park opposite MashaAllah general store samanabad lahorr', NULL, 'Lahore', '', '54000', '', '0313-4774658', '', '2018-05-30 16:14:46', '2018-05-30 16:14:46'),
(64, 105, 'Raheel Ayaz', 'house # 900 street # 63 bazaz muhalla sadar bazar lahore cantt', NULL, 'Lahore', '', '54000', '', '03244815953', '', '2018-05-31 09:17:15', '2018-05-31 09:17:15'),
(65, 106, 'Saba Furqan', 'House no E-53-A-1 street no 2 super town Lahore Cantt', NULL, 'Lahore', '', '54750', '', '03364172073', '', '2018-06-13 11:13:20', '2018-06-13 11:13:20'),
(66, 107, 'Zia Rizvi', '154 Link Alludian road , lahore Cantt', NULL, 'Lahore', '', NULL, '', '03008484911', '', '2018-06-14 12:51:01', '2018-06-14 12:51:01'),
(67, 108, 'AKHLAQ Gillani', '50-A askari x airport road lahore', NULL, 'Lahore', '', NULL, '', '0300 4643830', '', '2018-06-17 10:34:10', '2018-06-17 10:34:10'),
(68, 109, 'Waqas Bajwa', '202-Z, DHA, Phase 3', NULL, 'Lahore', '', NULL, '', '03339666693', '', '2018-06-20 17:14:57', '2018-06-20 17:14:57'),
(69, 110, 'Mueez Ansari', '83-P, Phase 1, Dha lahore', NULL, 'Lahore', '', '54810', '', '03366009991', '', '2018-06-21 11:16:40', '2018-06-21 11:16:40'),
(70, 114, 'Aaqib Ali', '63 MB 3rd floor, phase 6 DHA', NULL, 'Lahore', '', '54000', '', '0322849', '', '2018-06-27 11:25:42', '2018-06-27 11:25:42'),
(71, 115, 'Muhammad Ehtisham raza', '37-E pak arab housing society ferozepur road lahore', NULL, 'Lahore', '', '54600', '', '03339190202', '', '2018-07-03 20:41:07', '2018-07-03 20:41:07'),
(72, 116, 'Tahir Mehmood', 'H # 10, Siraj Pura Shalimar Town Lahore - Behind Al Mustafa Masjid', NULL, 'Lahore', '', NULL, '', '03331248774, 03215904547', '', '2018-07-24 10:24:42', '2018-07-24 10:24:42'),
(73, 117, 'Muhammad Akhtar Javed Khan', 'House No 182-B, Canal City, Multan Road Lahore - Next to EME Society', NULL, 'Lahore', '', NULL, '', '00923218856303', '', '2018-07-24 18:21:17', '2018-07-24 18:21:17'),
(74, 118, 'Tahir Mehmooda', 'H # 10, Siraj Pura Shalimar Town Lahore - Behind Al Mustafa Masjid', NULL, 'Lahore', '', NULL, '', '0333 1248774, 0321 5904547', '', '2018-07-24 18:28:21', '2018-07-24 18:28:21'),
(75, 119, 'Asjad', 'Behind farhan Hotel house number 247 C)', NULL, 'Karachi', '', '75400', '', '+92 333 3689897', '', '2018-08-01 21:07:05', '2018-08-01 21:07:05'),
(76, 120, 'Asjad', 'Behind farhan Hotel house number (247 C)', NULL, 'Karachi', '', '75400', '', '3462709780', '', '2018-08-02 18:20:53', '2018-08-02 18:20:53'),
(77, 121, 'Asjad', 'Behind farhan Hotel house number (247 C)', NULL, 'Karachi', '', '75400', '', '03462709780', '', '2018-08-02 18:23:38', '2018-08-02 18:23:38'),
(78, 122, 'Ammar', 'Behind farhan Hotel house number (247 C)', NULL, 'Karachi', '', '75400', '', '03462709780', '', '2018-08-03 11:24:17', '2018-08-03 11:24:17'),
(79, 123, 'Khadija Hussain', 'Lahore, Block-U, DHA Phase-2., House no 44,sector U,street1,phase 2, DHA CINEMA', NULL, 'lahore', '', '54000', '', '03434854833', '', '2018-08-06 17:37:38', '2018-08-06 17:37:38'),
(80, 124, 'Asad Sagheer', 'Street 127, house 7, Imam Jafir street Ichra', NULL, 'Lahore', '', NULL, '', '0321-7574281, 0345-4058438, 0346-4343432', '', '2018-08-13 13:26:43', '2018-08-13 13:26:43'),
(81, 125, 'Asad Sagheer', 'Street 127, house 7, Imam Jafir street Ichra', NULL, 'Lahore', '', NULL, '', '0321-7574281, 0345-4058438, 0346-4343432', '', '2018-08-13 14:09:31', '2018-08-13 14:09:31'),
(82, 126, 'sameer', 'dha phase 5', NULL, 'lahore', '', '5400', '', '03211688338', '', '2018-08-26 14:19:24', '2018-08-26 14:19:24'),
(83, 127, 'Sameer Haider', 'DHA phase 8 Street : 2/1 Block G house number 161-G', NULL, 'Lahore', '', '5400', '', '03229253575', '', '2018-08-26 15:00:48', '2018-08-26 15:00:48'),
(84, 128, 'aaa', 'agjj', NULL, 'lahore', '', NULL, '', '03324556765', '', '2018-08-28 19:45:02', '2018-08-28 19:45:02'),
(85, 129, 'Hudakhalid', 'House#51street#4phase3gulraizhousingschemwrawalpindi', NULL, 'Rawalpindi', '', NULL, '', '03235554718', '', '2018-08-31 08:28:10', '2018-08-31 08:28:10'),
(86, 138, 'sdf', 'sdfa', NULL, 'asdf', '', NULL, '', '2332423234', '', '2018-10-02 07:46:10', '2018-10-02 07:46:10'),
(87, 139, 'Shuja Nadeem', 'Model Town Moh.Faisalabad Gali No 17 ... Batala bilding Gujranwala', NULL, 'Gujranwala', '', NULL, '', '03016148987', '', '2018-10-15 14:10:24', '2018-10-15 14:10:24'),
(88, 140, 'Maheen Akram', 'House 17-D,Naval housing society, F-11/1', NULL, 'Islamabad', '', NULL, '', '03335284341, 03364028041, +92 336 5172829', '', '2018-10-18 17:54:40', '2018-10-18 17:54:40'),
(89, 141, 'Laiba', '74 A hajverI housing scheme harbanspura', NULL, 'Lahore', '', '54850', '', '03244229992', '', '2018-10-28 22:28:14', '2018-10-28 22:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `main_offer` varchar(255) NOT NULL,
  `small_offer_1` varchar(255) NOT NULL,
  `small_offer_2` varchar(255) NOT NULL,
  `category_offer` varchar(255) NOT NULL,
  `main_link` varchar(100) NOT NULL,
  `small_link_1` varchar(100) NOT NULL,
  `small_link_2` varchar(100) NOT NULL,
  `category_link` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `main_offer`, `small_offer_1`, `small_offer_2`, `category_offer`, `main_link`, `small_link_1`, `small_link_2`, `category_link`, `created_at`, `updated_at`) VALUES
(1, '1-Mothersdaydeal.png', '1-5.png', '1-7.png', '1-6.png', 'http://youthinkwewrap.com/tag/mothers-day', 'http://youthinkwewrap.com/tag/same-day-delivery', 'http://youthinkwewrap.com/tag/special-offers', 'http://youthinkwewrap.com/tag/new-year', '0000-00-00 00:00:00', '2018-04-19 14:11:50');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Christmas', 'christmas', '0000-00-00 00:00:00', '2017-12-11 06:38:18'),
(2, 'New Year', 'new-year', '0000-00-00 00:00:00', '2017-12-11 06:38:30'),
(3, 'Same Day Delivery', 'same-day-delivery', '0000-00-00 00:00:00', '2017-12-11 06:38:49'),
(11, 'Birthday', 'birthday', '2017-12-13 20:54:48', '2017-12-17 09:49:10'),
(12, 'anniversary', 'anniversary', '2017-12-13 20:55:22', '2017-12-13 20:55:22'),
(13, 'Special Offers', 'special-offers', '2017-12-13 21:02:00', '2017-12-13 21:02:00'),
(14, 'Engagement and Wedding', 'engagement-wedding', '2017-12-17 09:47:31', '2017-12-17 09:47:31'),
(15, 'Congratulations', 'congratulations', '2017-12-17 09:48:28', '2017-12-17 09:48:28'),
(16, 'Thank you & Sorry', 'thank-you-sorry', '2017-12-17 09:48:48', '2017-12-17 09:48:48'),
(17, 'Seasonal', 'seasonal', '2017-12-17 09:49:26', '2017-12-17 09:49:26'),
(18, 'Valentines', 'Valentines', '2018-01-15 13:52:27', '2018-01-15 13:52:27'),
(19, 'Mothers Day', 'mothers-day', '2018-04-19 14:10:52', '2018-04-19 14:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `person` varchar(100) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `person`, `details`, `created_at`, `updated_at`) VALUES
(1, 'Ubaid Ur Rehman', 'Amazing experience!! Requested same delivery from abroad and the order went through smoothly. I sent a cake and flower bouquet + birthday card to my sister in Lahore. Great service and on time Delivery.', '0000-00-00 00:00:00', '2017-12-25 07:37:48'),
(2, 'Ayesha Yasin', 'Your services are just Love.It really feels awesome while sitting abroad and surprise your loved ones. I really dont know how to express my gratitude. I have been wasting my time and money on different websites from the past 6 years. I am really really glad that i found you.', '0000-00-00 00:00:00', '2017-12-25 07:36:54'),
(3, 'Roha Wamiq', 'I can\'t thank enough to the team to make it worth it for my mother n for whole family #You_think_we_wrap is the best choice one could make!!! From flowers to cake n card n the punctuality everything was on point.', '0000-00-00 00:00:00', '2017-10-31 09:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `status`, `verified`, `email_token`, `provider`, `provider_id`, `created_at`, `updated_at`) VALUES
(34, 'Ayaz', 'test01@yahoo.com', '$2y$10$ZL1F/FY3fE7goRjY1iCqMugRcyTM5n01LUdI9iKRI5pXjIHYx1mRC', 'VUpCBZqGscI2vuii1NCGl1Ptv2sDhCCx1E1c3gNJmzYqWaJbVdm0MBoZUMQO', 0, 0, NULL, NULL, NULL, '2017-06-05 03:02:35', '2017-06-05 03:02:35'),
(37, 'EileenSlart', 'eileenheard@edu-paper.com', '$2y$10$LqPNt7KObqKsaMMaNDqSYOzR29XRl3zkOAfGJlXHboDowwm2EJlZa', NULL, 0, 0, NULL, NULL, NULL, '2017-10-06 13:40:23', '2017-10-06 13:40:23'),
(39, 'Ayaz Arshed', 'ayazarshed94@gmail.com', '$2y$10$6nmkivhe38fqQiveY6/F0OCXOgY/SF1IGG3fmehhuasGiMBSyPh66', 'GChbanstE3BFXUs5EiMx8R8QEgpbTrgldbZxbZSnn3ZVCmWCwlZxX6e4f1rG', 0, 0, NULL, NULL, NULL, '2017-11-15 03:14:52', '2017-12-08 14:31:28'),
(40, 'Tazeem Ashraf', 'tazeem.ashraf26@gmail.com', '$2y$10$lh0S2P.7Ysf2gxRxs1r2C.aoYuloQ1y70RUw8K.iR99lg5fkSaOUi', NULL, 0, 0, NULL, NULL, NULL, '2017-11-23 15:11:30', '2017-11-23 15:11:30'),
(42, 'Ayaz Ahmed', 'ayazahmedpm@gmail.com', NULL, 'eJtG7m1niRMluBZhx2JrIUBV8TXgJDor43ppnjZvEFfrX9eR2g0etKSqhduK', 0, 0, NULL, NULL, NULL, '2017-12-04 12:10:31', '2017-12-04 12:10:31'),
(43, 'Ayaz Arshed', 'ayazarshedofficial@gmail.com', NULL, 'SQ5XgK6Sqv07uFLm0iVZ4m6JGispw026Cotxq3bYSG8uUWDSZNHlPWoa9LZT', 0, 0, NULL, NULL, NULL, '2017-12-04 13:30:56', '2017-12-04 13:30:56'),
(45, 'Nabil Ashraf', 'mnab_4@yahoo.com', NULL, 'RDsxJFm317CuQly6FobWXmxZ90nwHh8lfOE2vJHlkvaSsfKoYW9jtoLB0omP', 0, 0, NULL, NULL, NULL, '2017-12-07 14:49:28', '2017-12-07 14:49:28'),
(50, 'Mujahid Rashid', 'mujahid.rashid29@gmail.com', '$2y$10$XGcHsR3JXZDbmLzClA6QGetDalW9sE/MKKqKiLQqJYjJqlD21FnFa', NULL, 0, 0, 'l8jfdbjIoO', '', '', '2017-12-19 00:03:23', '2017-12-19 00:03:23'),
(51, 'Mahi khan', 'lovelymemories2017@gmail.com', '$2y$10$7j3b1W3xDw8l9E53vhXZD.qIAsABTjzZo0Ikn7mVdHYJah./y12Ha', NULL, 0, 0, 'GpefxV7OE3', '', '', '2017-12-19 03:45:18', '2017-12-19 03:45:18'),
(55, 'Ayaz Ahmed', 'ahmed.ayaz@hotmail.com', NULL, 'A7eve7eMEB9Iliqj5NeOMIvH2Q9bUbBBnTa56nRqfR6rtdXRE6QyaPNoeoat', 1, 0, NULL, 'facebook', '1442308685799737', '2017-12-19 12:11:40', '2017-12-19 12:11:40'),
(56, 'Team Online', 'teamonlinepk@gmail.com', NULL, 'xvuBetRRa46T14IA14kFUh1lx1zN877V02ZBgwO9nKr92HU3KsQ45wE5Scgt', 1, 0, NULL, 'google', '102001912318309223383', '2017-12-19 20:30:51', '2017-12-19 20:30:51'),
(57, 'Ayaz Ahmed', 'aalogic@gmail.com', NULL, 'c1pEjnxmh4QbqJhV97KlBTILfcTGJxPy1eahjJUnJ4V9OGnrXQTPlqVwnLYo', 1, 0, NULL, 'google', '105588084250428419318', '2017-12-19 20:34:09', '2017-12-19 20:34:09'),
(58, 'Maria Majid', 'mariamajid@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10154919688676035', '2017-12-20 01:41:39', '2017-12-20 01:41:39'),
(59, 'Kanza Shahid', '19-11010@formanite.fccollege.edu.pk', NULL, 'ED7skzFTtUupv4Qm03B5kKnsbBJL6KIwNbl0WEZasqLEvt9KpMmXdnBN0jEC', 1, 1, NULL, 'google', '115312481281467485392', '2017-12-20 22:45:57', '2017-12-20 23:01:54'),
(60, 'Sonia', 'soniaasif69@yahoo.com', '$2y$10$Z61lV872FwRIeLCJ5khpeuv.4Xc3bvr77aplko70V18kn7cOP3kwC', 'tSiXpcw2GSsLgR14iR0rbdBsI3ClDzz4KAeWo4AjoVL1wxGKtrVo20iLFBHA', 1, 1, 'irTLy1s6kP', '', '', '2017-12-20 23:03:14', '2017-12-20 23:10:05'),
(61, 'Sidra Mohsin', 'sidra.ms92@gmail.com', NULL, NULL, 1, 1, NULL, 'google', '113236917696098464371', '2017-12-21 03:43:10', '2017-12-21 13:31:21'),
(62, 'Suneeba Chattha', 'suneebachattha@gmail.com', NULL, NULL, 1, 1, NULL, 'google', '116490757672065600783', '2017-12-21 13:36:20', '2017-12-22 03:09:12'),
(63, 'Attiqa', 'attiqabutt01@gmail.com', '$2y$10$vJz7JL1NENVPmXx1ar2fye36RZmobmNvxJW8rXF47ZdhSIP58Rlvu', NULL, 1, 1, NULL, '', '', '2017-12-21 16:20:39', '2017-12-22 13:08:06'),
(64, 'Mian Faizan', 'midniteswami@gmail.com', NULL, 'F5rSTLoXy6ispIKHvV7RbBvVPTWlqbvMHd18mH3NI3k0mH9YilNPY3ZtxAWq', 1, 0, NULL, 'facebook', '10155517552389915', '2017-12-21 17:44:17', '2017-12-21 17:44:17'),
(65, 'muhammad faizan', 'mianfaizanxgp@gmail.com', NULL, 'maOs42AP2dS0M2kPKq1S6SCAtfv4Db1fkbff8fDZrTMSc3E4a4hQ6HbK2ePT', 1, 0, NULL, 'google', '105514335367858858631', '2017-12-21 17:44:47', '2017-12-21 17:44:47'),
(66, 'Socialliance', 'sociallianceservices@gmail.com', '$2y$10$0vVsguCX/UtRiYDGZGBDQO9pagWmCGGzWtL1W6tbfeElSYz/21A7u', NULL, 0, 0, 'nz6ns7zABc', '', '', '2017-12-22 03:05:26', '2017-12-22 03:05:26'),
(67, 'Maria', 'polkadots_18@yahoo.com', '$2y$10$NrCnjfQKILJ4JG..Kw5RP.fJ2IBDZ/crYIuIfnrZZzKTgw0bid3Gi', 'BD5LmHszC0N7qF9iOvc6382Nl1tM8I87BX8vE5OZkKw7nHGuJIlVs9scCN3t', 1, 1, NULL, '', '', '2017-12-24 01:57:20', '2017-12-25 14:00:06'),
(68, 'aqsa', 'aqsailyas34@gmail.com', '$2y$10$oZ8rbSMQpPSOfykbJ/OoP.KXc/4CpStfKmTXQc2bs8pHyelo6JIky', NULL, 1, 1, 'cXPtEp8Y8n', '', '', '2017-12-24 15:57:07', '2017-12-25 13:59:56'),
(69, 'Azka Shahid', 'azkashahid13@gmail.com', '$2y$10$StXqNLCXyXxZmK7VwhVtm.OjZ/PKOZ27jqYocstJ4D8qi9zqPQ5le', NULL, 0, 1, NULL, '', '', '2017-12-26 12:56:28', '2017-12-26 12:57:41'),
(70, 'Misbah', '20-10897@formanite.fccollege.edu.pk', '$2y$10$r6ZXsQvJ3sMmbM1mTR.wiulYbkHRb7KZ3QefvPciuVDNadLkedM.u', 'IaRHJGPLEFupT1PnJIRxD6EaMgMKeFttz4L6OoNqet1YxUOu4uNMT0YeE2mv', 0, 1, NULL, '', '', '2017-12-26 15:40:20', '2017-12-26 15:41:45'),
(71, 'Jannat Junaid Shami', 'jannatzafar@gmail.com', NULL, NULL, 1, 1, NULL, 'facebook', '1623522384375295', '2017-12-26 18:40:05', '2017-12-27 00:28:25'),
(72, 'gull noor', 'gullnoor9@gmail.com', NULL, NULL, 1, 1, NULL, 'google', '118259383570740005259', '2017-12-26 18:48:56', '2017-12-27 00:28:19'),
(73, 'Sara Javaid', 'sarajavaid19@gmail.com', NULL, NULL, 1, 1, NULL, 'google', '108404801645300101294', '2017-12-26 23:31:12', '2017-12-27 00:28:15'),
(74, 'Annam', 'annamirfaan@gmail.com', '$2y$10$3P5tD5gf9hwCVm42OQNJ2u.wdfSaaEZnbz2WmVsqTCO4DuMD12Iii', NULL, 0, 0, 'fjYMZzSYd8', '', '', '2017-12-27 02:06:15', '2017-12-27 02:06:15'),
(75, 'Nimra Riaz', 'nimra.riaz023@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '112977407386372413638', '2017-12-28 02:37:18', '2017-12-28 02:37:18'),
(76, 'Sumbal Azam', 'sumbalazam12@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '101629388210963145102', '2017-12-28 12:14:47', '2017-12-28 12:14:47'),
(77, 'laiza tahir', 'tahirlaiza@gmail.com', '$2y$10$T78aRTAiEMzqa/alZjY6XeWXZ/pnc.hgjdyT0xHtYr8tlc/BSTlCW', NULL, 0, 1, NULL, '', '', '2017-12-28 19:57:21', '2017-12-28 20:00:03'),
(78, 'Zainab Ahmad', 'ahmadzainab321@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '113459766309324037336', '2017-12-28 21:14:23', '2017-12-28 21:14:23'),
(79, 'Iqra Zafar', 'iqrazafar67@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '103748696057761661908', '2017-12-29 02:28:31', '2017-12-29 02:28:31'),
(80, 'Esha', 'eshawaseem_butt@hotmail.com', '$2y$10$ZqZbWt9Rm63EcYwInB4n3uhkhhTn/y128tdMFK6orb36iRgnYAhcO', 'cBeSaEoZLup4qFHM9QulNNTaLxao1hBtVLENf2MEbMuMgiiGB571PVJvKlBR', 0, 1, NULL, '', '', '2017-12-30 03:28:11', '2017-12-30 03:30:07'),
(81, 'Nesha Makik', 'ashimalik.am786@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '105196417286178111236', '2017-12-30 12:26:55', '2017-12-30 12:26:55'),
(82, 'Hammad Khalid', 'hammadkhalidch@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '113963871736338040025', '2017-12-30 16:52:58', '2017-12-30 16:52:58'),
(83, 'Fatima Fuad', 'fatimafuad1110@yahoo.com', '$2y$10$MRFGswAFUkPkEutB7Z9rnOPKH3ZDYywCTnr3gJSvg0rEhmMHpFWYC', NULL, 0, 1, NULL, '', '', '2017-12-30 17:28:59', '2017-12-31 12:21:02'),
(84, 'Aliya Latif', 'aliya.latif@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '109804690828513450026', '2017-12-31 00:17:35', '2017-12-31 00:17:35'),
(85, 'Amina', 'criticalsmile@hotmail.com', '$2y$10$KoeZ0UV.LZNi5HVEGsMdAeroPkQYaq6betw0XNeT4M8MyQEE2ebOq', NULL, 0, 0, 'US5fVnF9s3', '', '', '2017-12-31 06:11:16', '2017-12-31 06:11:16'),
(86, 'Zara Atif', 'zara.atif.za@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '111264582115738629624', '2017-12-31 11:45:44', '2017-12-31 11:45:44'),
(87, 'Eizza Naeem', 'eizzanaeem24@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '101998231052508660524', '2017-12-31 18:40:10', '2017-12-31 18:40:10'),
(88, 'Zaynab', 'zainabijaz38@gmail.com', '$2y$10$9ol8MZ7BwY47eT7mx2AoW.g9VGIip8QLh5wgD1Y7pka..8Fgxis06', NULL, 0, 1, NULL, '', '', '2018-01-02 23:51:51', '2018-01-02 23:53:59'),
(89, 'Hafsa Butt', 'hafsabutt10@yahoo.com', '$2y$10$bYhXYNFsQJNKwV4gB4eJS.JgqtUKHrgc2Zlf.GyhEo.Q0Vz.lx3h2', NULL, 0, 0, 'bYMfGiqDZ6', '', '', '2018-01-03 13:25:27', '2018-01-03 13:25:27'),
(90, 'Zirva Zahid', 'zirvazahid5@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '114304653107519033585', '2018-01-06 13:50:50', '2018-01-06 13:50:50'),
(91, 'Ayesha Ahmed', 'aa5939623@gmail.com', '$2y$10$DrzGqmeS7W6sgkFlxEOJh.snddFvKb206pjOatVVoQ1p0jAEb575K', NULL, 0, 1, NULL, '', '', '2018-01-07 04:22:40', '2018-01-07 04:24:16'),
(92, 'Manahil Khalid', 'manahilkhld@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '114303524057695124550', '2018-01-09 02:29:48', '2018-01-09 02:29:48'),
(93, 'シ ヘール', 'its_hira@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10156893600112506', '2018-01-10 02:12:25', '2018-01-10 02:12:25'),
(94, 'Maria R', 'mariarasheed891@gmail.com', '$2y$10$uz2F5zmzW4mFb/oNU01esOX9ARzuSS3Che/2LdONg/nhhkIG92GzS', 'YLxEk5ooGnThqJDBQokoerRB0UNlH70LvKpvlMmUC5ua5M9sKaL4Ab2XpQnq', 0, 1, NULL, '', '', '2018-01-10 03:07:05', '2018-01-10 12:21:34'),
(95, 'Maira Amir', 'sakura5360@gmail.com', '$2y$10$oOj3aDRLyZdCeQtyaBkfKOVVXgEJUk1EtFbFfr/vtNWLSn/a61Nae', NULL, 0, 0, 'ShKuwmzsxw', '', '', '2018-01-10 03:11:54', '2018-01-10 03:11:54'),
(96, 'Nabiya', 'rozinajunaid6@gmail.com', '$2y$10$se01sP4smgyTRTZ/BBTmX.Lpv41RY7Iyj7qOByzrv7rYOQqRiTyPy', NULL, 0, 0, 'dYDwN6yfkP', '', '', '2018-01-10 19:11:43', '2018-01-10 19:11:43'),
(97, 'Anniee Sheikh', 'any.shake@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10215411331744296', '2018-01-10 22:35:39', '2018-01-10 22:36:39'),
(98, 'Rija Farooq', 'farooqreejah82@gmail.com', '$2y$10$BiFtf283xfjTQccPsmBGcuHr45268BzooU/9qTFppSPcBtQoCN/mi', 'rbrp6iV3PR5sCvgTPYJReK2jezHEmUIpbtMgUaQOB77m8YdKlc5j45xfFLrB', 0, 1, NULL, '', '', '2018-01-10 22:40:02', '2018-01-10 22:41:25'),
(99, 'Sehr', 'harryjerry28@hotmail.com', '$2y$10$1U6dF87tHr3xWAGYmnNqo.qEoXqvfdc7RtViRiwAStwHRVILsx7Fy', NULL, 0, 1, NULL, '', '', '2018-01-11 12:05:53', '2018-01-11 12:07:04'),
(100, 'tehreem rana', 'tehreemrana3131@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '111053112221568903295', '2018-01-11 17:51:32', '2018-01-11 17:51:32'),
(101, 'Sana Kanwal', 'ms.kanwal20@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '554565258243607', '2018-01-11 17:58:59', '2018-01-11 17:58:59'),
(102, 'Muhammad Bin Sohail', 'muhammadbinsohail07@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '111169639964742736809', '2018-01-11 18:47:24', '2018-01-11 18:47:24'),
(103, 'Mahreen Mufti', 'mahreenmufti@hotmail.com', '$2y$10$AVklBqXvFqQrm21Eb1mpuO83YaNGSTX2eHz9IY3URI2uW7E1wba6W', '2LenHhNad9mBFvn1Nl936YqKBtLKp0wOFY67VKBu8zk2wr4TpIJ182ei3wPA', 0, 0, 'RZcCfVoI0Z', '', '', '2018-01-12 21:43:48', '2018-01-12 21:43:48'),
(104, 'Roshanae Ali', 'roshanae.ali@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '113293972273135936433', '2018-01-12 23:34:06', '2018-01-12 23:34:06'),
(105, 'Rabbia', 'rabbia.sohail@hotmail.com', '$2y$10$iB4KKQIRWY2UmV811S2hsebzW.VxfhXyhbeVBFktwOUNAswgt.i9O', NULL, 0, 0, 'sRo6eMszqc', '', '', '2018-01-14 04:53:14', '2018-01-14 04:53:14'),
(106, 'Hajrah Afzal', 'hajrahafzal89@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '536966043332936', '2018-01-14 17:07:06', '2018-01-14 17:07:06'),
(107, 'zainab shahzad', 'zainigee26@gmail.com', '$2y$10$1ThNcpZBCTKF1WirguKLCOh4Z1RwstECWX/.4bQBH55iaAwhpRzZW', NULL, 0, 1, NULL, '', '', '2018-01-14 23:26:00', '2018-01-14 23:30:36'),
(108, 'Ahmad Azhar', 'dr_ahmad_123456@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10155412042672496', '2018-01-15 06:02:25', '2018-01-15 06:02:25'),
(109, 'Fatima Khan', 'fatima.khan2682@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '113535300906981839089', '2018-01-16 01:27:38', '2018-01-16 01:27:38'),
(110, 'Hina Cheema', 'hinacheema46@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '149699382356488', '2018-01-17 01:25:05', '2018-01-17 01:25:05'),
(111, 'Silver Aquarius', 'batoolfizza@rocketmail.com', NULL, 'ZYNRoFxDqN6WwLLLzvnzRUKQAVQOn2IJJ2KolNnOSzjv5fEc4AzPQ281OI3r', 1, 0, NULL, 'facebook', '1537298099720980', '2018-01-17 12:25:10', '2018-01-17 12:25:10'),
(112, 'Ayesha Nabeel', 'ayeshamalik570@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '898716693622636', '2018-01-17 22:05:28', '2018-01-17 22:05:28'),
(113, 'Saud Toor', 'saudtoor123@gmail.com', '$2y$10$EL.4qfNoPBrOHwIbVlk.7ONfT0VOiBN1GQR3hpyfpBys9qqem4/Ie', 'YfGYwBdXLnFc6cPF22fmXMOOQhdMiJczm1STLlFw5ge4RsCOGi9VpTNt2zsG', 1, 0, NULL, 'google', '108022722029934788176', '2018-01-17 23:43:40', '2018-08-26 21:54:46'),
(114, 'Zahra', 'zarafgs@gmail.com', '$2y$10$5qTiQ4k8HgMteHFX9NuLJOZtxg8AU4OIdOgvZgWSebTI17s8FKeFG', NULL, 1, 1, NULL, '', '', '2018-01-18 01:42:20', '2018-01-18 16:57:08'),
(115, 'Fatimah Zuhair', 'fatimazuhair44@gmail.com', NULL, 'rt5BZekXree52wGM6MSREkH0WjeDDGj9yT6e9ce5dayaRGOvGg806It1j1xd', 1, 0, NULL, 'facebook', '1304074013072091', '2018-01-19 19:07:33', '2018-01-19 19:07:33'),
(116, 'ramsha shakeel', 'ramshashakeel57@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '116848462078581799860', '2018-01-20 13:35:43', '2018-01-20 13:35:43'),
(117, 'sana rana', 'sanarana326@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '113529765635375942941', '2018-01-20 20:31:06', '2018-01-20 20:31:06'),
(118, 'babuu bacha', 'babuubacha@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '110371217013918591087', '2018-01-20 21:50:10', '2018-01-20 21:50:10'),
(119, 'Basit ZIa', 'basit_zia111@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '10213420314935723', '2018-01-21 18:41:11', '2018-01-21 18:41:11'),
(120, 'Fizza Batool', 'fizzabatool47@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1722985661079409', '2018-01-21 19:23:18', '2018-01-21 19:23:18'),
(121, 'Mahrukh Nauman', 'mahrukh_nauman@hotmail.com', '$2y$10$FdzGJTYLY2oWrGGROb7ADOss82bhd2JbCfQAeT/.LgPOeIi1wGoSy', 'yCrFn5cPXIpey5yrLv3bcqiODiaEt415hSjFl5VH6qVh4DBxUqNUzWB9l3VH', 0, 0, 'nOhA9NB0iJ', '', '', '2018-01-21 20:15:53', '2018-01-21 20:15:53'),
(122, 'Sundas Jamil', 'sundasjamil1994@gmail.com', '$2y$10$g3ch58iG5WTTaqSADm8mQelZ5mr6Tk2SxTVp41TbAHAeeC6smB4Wu', '3J6StKdRzPijYcPhyhFVLs7uopD6EVQusizhITwpUlnCh2qYhqanpaf82pG2', 1, 0, NULL, 'facebook', '2039457466098416', '2018-01-22 12:37:56', '2018-01-22 13:22:16'),
(123, 'Sundas Jamil', 'sundasjamil199@gmail.com', '$2y$10$yZ.74/rpy3a/mQMNMRFOI..MHj7v8/UrdsC8p.EAMJj4dn6FFEe3e', NULL, 0, 0, 'kWTaoYLGfo', '', '', '2018-01-22 13:45:05', '2018-01-22 13:45:05'),
(124, 'Sarah Anwaar', 'sarah_butt99@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1592880934137830', '2018-01-23 05:48:21', '2018-01-23 05:48:21'),
(125, 'Syed Arslan', 'creasoftsolution@gmail.com', '$2y$10$MwA7ykz1g5dQVCF7efnD6u/OSx6882BZEFadQIZ6pRpXSKQeMBPii', 'Nig4zfxzoqp1qc6qFqZ7jdzuTlplAV2eFi0NCet2FjOdct9vK1ifHPeyHy86', 1, 1, 'MHUJBnN0Vt', '', '', '2018-01-23 14:17:31', '2018-01-23 14:43:57'),
(126, 'Momal Binte Akram', 'momalakram96@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1173300026137348', '2018-01-23 18:40:01', '2018-01-23 18:40:01'),
(127, 'Maria sufyan', 'mariazafar1111@gmail.com', '$2y$10$6UlcWwjilmbYfk3fY4mR/O3shXXfrrerpemu5IMUBVFz7suSKIg1S', NULL, 0, 0, 'gR050ND79m', '', '', '2018-01-24 06:03:31', '2018-01-24 06:03:31'),
(128, 'Juraij Asif', 'juraijasif0@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '110149700294563457687', '2018-01-24 18:43:04', '2018-01-24 18:43:04'),
(129, 'Maryam Shahjahan', 'maryamnaseerahmed@gmail.com', '$2y$10$eEriNlbSoErLdsHnYy/gtebgIZWfTIlndyC7zyZKYrJ9n4no5bGq2', NULL, 0, 0, '6YeOkX0EnN', '', '', '2018-01-25 00:12:35', '2018-01-25 00:12:35'),
(130, 'Saad Zia', 'marketing@roomifoods.pk', '$2y$10$6BX9gDtEvszQdrfllYJ.bOCDyaMXrVv8bksGclH5rStqP3xwr/clW', NULL, 0, 1, NULL, '', '', '2018-01-26 02:16:43', '2018-01-26 02:21:35'),
(131, 'Ahmed Anwer', 'ahmed.anwer56@gmail.com', '$2y$10$qCKUnXa.moSDPixMEgGjwuSmDyznnfRL1zwhI68xUUHyVhG0v5PGy', NULL, 0, 0, 'zuh1MIR01x', '', '', '2018-01-26 15:21:40', '2018-01-26 15:21:40'),
(132, 'arinda hanook', 'beya.hanook@gmail.com', '$2y$10$gwCHPxdOuKQ7p2DwYW1go.l63.YHTEx7h.6.YI5Ec0sPNYD1Jpb7W', NULL, 0, 0, 'R2axkriPyh', '', '', '2018-01-27 18:55:10', '2018-01-27 18:55:10'),
(133, 'Hasnain Butt', 'krazzykool3@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '116300031782850776393', '2018-01-29 14:48:33', '2018-01-29 14:48:33'),
(134, 'Malik Nouman', 'nouman042@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '111179136168121350002', '2018-01-29 18:46:35', '2018-01-29 18:46:35'),
(135, 'Shahzaib Chuhan', 'shahzaib_chuhan007@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1679990748690081', '2018-01-29 21:06:20', '2018-01-29 21:06:20'),
(136, 'Zubaid Sheikh', 'zubaidsheikh32@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '117698330105540314701', '2018-01-29 23:09:27', '2018-01-29 23:09:27'),
(137, 'Anum Mehmood', 'anummehmood69@yahoo.com', NULL, 'CRhLktvGbtzENqDD12DSfePUOxYh3IFIXcaRwIU9DcfK9rVPI2gYdbdoh9RK', 1, 0, NULL, 'facebook', '1977631959142471', '2018-01-30 18:34:43', '2018-01-30 18:34:43'),
(138, 'RTJ RTJ', 'raotj1@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '110313771187510670597', '2018-01-31 02:37:51', '2018-01-31 02:37:51'),
(139, 'Maryum Ali', 'maryumaliakhtar99@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '100661148537379664742', '2018-02-02 18:12:47', '2018-02-02 18:12:47'),
(140, 'Muhammad Fayyaz', 'mab.fayyaz@gmail.com', '$2y$10$MN43kgaqJzG4f87tL3.L0OkDQWRK1MTgmGOfbO2qoKibDAiHAMyI.', NULL, 0, 1, NULL, '', '', '2018-02-03 07:57:16', '2018-02-03 08:16:47'),
(141, 'Abbas Zulqarnain', 'abbaszulqarnain@live.com', NULL, 'wopbpBuV80RdueoMTjStjiEOPkc3g3lkKncKZL4HrepeANU2YRGIDBZYsFTs', 1, 0, NULL, 'facebook', '1505976099524328', '2018-02-03 21:32:31', '2018-02-03 21:32:31'),
(142, 'Munazza Rana', 'rana.munazza@gmail.com', '$2y$10$IC0vYNyCviQhGaMhoBcdme9Iu54iAeWubbmViG/30sLWmPzRb6W1S', NULL, 0, 0, '8jRKgc93nR', '', '', '2018-02-04 20:12:29', '2018-02-04 20:12:29'),
(143, 'Mahnoor Haroon', 'momnoor82@gmail.com', '$2y$10$xbUtpKxcIELi3vrwn9IJ4umvER2GWW8udwXK56RN1FuFG3W5ZLvAq', NULL, 0, 0, 'xgg9lXrTTo', '', '', '2018-02-05 04:15:27', '2018-02-05 04:15:27'),
(144, 'Saba Masood', 'sabamasood93@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '102798466674508677430', '2018-02-06 12:46:36', '2018-02-06 12:46:36'),
(145, 'Anum Shaukat', 'anumshaukat551@gmail.com', NULL, 'K4vO5AecqJimMaXfGcZLn05X4xFKwlJhoR92fEgoJIS8bbjZgTgMyFwBxEQf', 1, 0, NULL, 'google', '100454796418950825444', '2018-02-06 16:54:05', '2018-02-06 16:54:05'),
(146, 'wahab javed', 'wahabjaved1223@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '116690354348177918247', '2018-02-08 04:06:02', '2018-02-08 04:06:02'),
(147, 'Ehtisham Dogar', 'ehtishamdogar11@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '115128225772360601470', '2018-02-09 15:41:18', '2018-02-09 15:41:18'),
(148, 'Zunaira Aftab', 'zuniaraaftab@gmail.com', '$2y$10$jH3bsF/iooTzz93mZWqDBe2rpmLpjRmf6XajRJ79dMSYiWrfkpfF2', '5XwSndUI7mzFNVdy7Zre71OvgURJFNQnbLC32qM7pAL2jk2FqAZiwly1uUQV', 0, 1, NULL, '', '', '2018-02-09 15:45:10', '2018-02-09 15:50:30'),
(149, 'Hanzia Asim', 'hanziaasim93@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '109893683261397208040', '2018-02-10 15:40:29', '2018-02-10 15:40:29'),
(150, 'hira', 'hiraijazbutt@yahoo.com', '$2y$10$NhM8N/1kdBA0PdocHRGlG.mgBs4ZEXg03lmNb2rXtFln4ztNKBmna', NULL, 0, 1, NULL, '', '', '2018-02-11 02:01:10', '2018-02-11 02:03:55'),
(151, 'Hashaam Khalid', 'aamirmalik623@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1895878243786956', '2018-02-13 20:17:32', '2018-02-13 20:17:32'),
(152, 'Rooqash Ali', 'rakoosh_ali@hotmail.com', '$2y$10$HgUWuy2IqBZBFLluzrY6v.BZZprWE/7KBwbsN2B/N.5rXd7iOQF/u', NULL, 1, 0, NULL, 'facebook', '1578116758974990', '2018-02-14 04:09:06', '2018-02-14 04:17:15'),
(153, 'Shanawar Khan', 'shanawar778@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1955747381411652', '2018-02-15 17:28:29', '2018-02-15 17:28:29'),
(154, 'Abeer Aziz', 'dr.abeer.aziz.90@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '114660521578153587158', '2018-02-20 22:39:37', '2018-02-20 22:39:37'),
(155, 'Umer Sheikh', 'sheikhumer15@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '102912653182138939246', '2018-02-21 00:16:17', '2018-02-21 00:16:17'),
(156, 'Sana Rehan', 'sanarmb11@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '107342652911747154364', '2018-02-21 15:24:36', '2018-02-21 15:24:36'),
(157, 'Kinza', 'drkinza30@gmail.com', '$2y$10$a2zjfiV7iT0YwoHCz9qLXeEFCfMxsHgg79JXgqzhahq1lyzbp2wIq', NULL, 0, 0, 'jORfNiUVym', '', '', '2018-02-25 23:51:33', '2018-02-25 23:51:33'),
(158, 'Aymen Zameer', 'aymen.zameer@gmail.com', NULL, '1iJpj1PWMgTs8FVEUPIYP1ylvHwFJpiQg6ZPlw2sxczqrzxP6QYefu1rxo0I', 1, 0, NULL, 'google', '115333982107747572465', '2018-03-04 21:05:22', '2018-03-04 21:05:22'),
(159, 'jawaria Munir', 'faisaljia10@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '116903582836796784953', '2018-03-05 01:11:56', '2018-03-05 01:11:56'),
(160, 'ifra tanveer', 'ifratanveer@gmail.com', '$2y$10$pPHLZgJQgW1ilwuF6lkHlO0OA7M8X8wrzgUhb6CaOWBunDjEYLdem', '5EPadrW6PtYq2djZC4IA3vjdbDEgD9BUQA5b8kaKwMs5ZwEJlaocnCKTCcnx', 0, 0, 'QarV2X6z4g', '', '', '2018-03-14 18:43:23', '2018-03-14 18:43:23'),
(161, 'Sumaiyyah Malik', 'semalik1415@gmail.com', NULL, 'PpS4WrOpuYYgckwaxGDwHjykSUSNexeqUwfuSLvnAXquYbhNLXBYuL69SEBw', 1, 0, NULL, 'google', '110032880066334245417', '2018-03-15 01:29:26', '2018-03-15 01:29:26'),
(163, 'UK T', 'umamakhantareen@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '105684413263706438894', '2018-03-18 17:09:25', '2018-03-18 17:09:25'),
(164, 'Ayesha', 'ayishaansaar@gmail.com', '$2y$10$6Sjd31J4/Lh2yHE1AuiWdeYMRem4F5nhfW4vKlxulC3atS505L77e', 'ktBlRybVN4zv2e6TUvD6JfzHqYGrLVWK6lfMOlK1BitbLnAnMwa9gM0Luxq1', 0, 0, 'XX1DFdUvsU', '', '', '2018-03-24 15:57:57', '2018-03-24 15:57:57'),
(165, 'Madi Arshed', 'angel_urz@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '772553582949954', '2018-03-26 19:11:17', '2018-03-26 19:11:17'),
(166, 'Muhammad Mohsin Amir', 'm.mohsin567@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1542816212483527', '2018-03-26 23:42:37', '2018-03-26 23:42:37'),
(167, 'Muhammad Asad Usman Yousafzai', 'masadusman2@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10155914732021140', '2018-03-26 23:45:53', '2018-03-26 23:45:53'),
(168, 'Tooba Nasir', 'tooba_tahir@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10212827208529597', '2018-03-26 23:53:02', '2018-03-26 23:53:02'),
(169, 'Syed Zeshan Ali', 'zeshan.jszee@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1528145450644941', '2018-04-01 12:28:17', '2018-04-01 12:28:17'),
(170, 'Zara Khan', 'heartofqueen16@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1652083828238699', '2018-04-01 14:39:46', '2018-04-01 14:39:46'),
(171, 'Hira Adeel', 'hirameer53@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '955364544632046', '2018-04-03 14:52:17', '2018-04-03 14:52:17'),
(172, 'saba andleeb', 'sabaandleeb007@gmail.com', '$2y$10$Vy9FK5CczNXBdAD/vZNohu0J6lNktuLhZWnumXWig4av.z4vnV1m.', 'X9OWLDfrmPWNWM72EaBSbDlkxlYfT8wTgBpARIQdBVCge742mnOO8ogxEAuu', 0, 1, NULL, '', '', '2018-04-04 19:07:37', '2018-04-05 14:07:38'),
(173, 'amber razzaq', 'amber7_razzaq10@hotmail.com', NULL, NULL, 1, 0, NULL, 'google', '100668230201162509528', '2018-04-06 18:14:54', '2018-04-06 18:14:54'),
(174, 'Farrukh Ahmad', 'farrukh_passion@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '2018633251484629', '2018-04-07 02:36:31', '2018-04-07 02:36:31'),
(175, 'Fatima Ali', 'imishaal67@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '126557028195243', '2018-04-09 21:16:49', '2018-04-09 21:16:49'),
(176, 'Shingol Ghega', 'shingol.ghega@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '436749883447750', '2018-04-11 20:36:36', '2018-04-11 20:36:36'),
(177, 'Raza Rana', 'specific_person@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10156039885155211', '2018-04-13 04:21:16', '2018-04-13 04:21:16'),
(178, 'laiba shakeel', 'l_aiba2001@hotmail.com', '$2y$10$7E1k/5H3oY8i9tAjWwdCjO/HQM2wCKZlIEE5UPxaND3BbJlCiESc.', '5WMh3KGVuqhrqrxQjsAoB3JqsvnqjRApc0BgM10UruH4jMmRAvtYVfF4cW9c', 0, 1, NULL, '', '', '2018-04-15 11:52:53', '2018-04-15 12:02:00'),
(179, 'Anam Khalid', 'afi_kzs@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '10204527897915472', '2018-04-17 11:02:11', '2018-04-17 11:02:11'),
(180, 'Talha Beg', 'tab007@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10160241735095481', '2018-04-19 17:09:58', '2018-04-19 17:09:58'),
(181, 'Ahmad Alauddin', 'ahmadalauddin@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '111197169921714236100', '2018-04-21 15:05:59', '2018-04-21 15:05:59'),
(182, 'Sana Naviz', 'sananaviz@hotmail.com', '$2y$10$22yNhsry7y.Q3ieGNAmR5.ZOZ7ohyhB8NgFXgGbzdTWYXBPM5gl0C', 'M1wrNyPIFD7E0GXoT8cLGYNDb3CcWJneWUrSeVxBtYJHzlizz479xBiCITdb', 0, 1, NULL, '', '', '2018-04-21 19:16:18', '2018-04-21 19:17:57'),
(183, 'Sadaf amjad', 'sadamj20@gmail.com', '$2y$10$H.iHxNcLi3BhzrfaNoFncuTpE8qNSKpmAoba8cnzbALYpcHHQbK3K', 'IOZ0pQhHBInYWMAxbB1jUhrPm1nbFPnc9XkP2KjC7wN34orSw33Nvd31avGG', 0, 0, 'mNqtAxtADP', '', '', '2018-04-22 04:22:12', '2018-04-22 04:22:12'),
(184, 'Kinza Bukhari', 'kinzabukhari07@gmail.com', '$2y$10$91sDUlC4sk2lp.BlI2yM1ei5b/h6cdo4etbJgWPIITr0X3/vSIpjy', NULL, 1, 0, NULL, 'facebook', '10157498471057516', '2018-04-27 18:57:17', '2018-04-27 18:58:49'),
(185, 'Mahnoor Asif', 'mahamasif7793@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2061471430547110', '2018-04-29 22:41:45', '2018-04-29 22:41:45'),
(186, 'Yogi sardar', 'yogi.sardar1234@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '110097623187023127168', '2018-04-29 23:23:45', '2018-04-29 23:23:45'),
(187, 'Saira Salman', 'pinkipink730@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10212530505440059', '2018-04-30 02:45:02', '2018-04-30 02:45:02'),
(188, 'Maham Anwar', 'mahamanwar143@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10216135648807112', '2018-05-01 17:19:19', '2018-05-01 17:19:19'),
(189, 'She E ZA', 'sheza_majeed@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1834771720157619', '2018-05-03 12:41:35', '2018-05-03 12:41:35'),
(190, 'Fozia Asghar', 'foziaaasghar@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1834270109959071', '2018-05-03 23:43:36', '2018-05-03 23:43:36'),
(191, 'Hiba Majid', 'hibamajid876@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '178508306301729', '2018-05-04 18:03:24', '2018-05-04 18:03:24'),
(192, 'Farheen Arif', 'farheen_arif22@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1333329813433279', '2018-05-05 22:33:33', '2018-05-05 22:33:33'),
(193, 'Amna Shamim', 'shamimamna3@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '109713993383715778337', '2018-05-05 23:13:42', '2018-05-05 23:13:42'),
(194, 'Salman Ahmed Alvi', 'salman.ahmed76@gmail.com', '$2y$10$EJLUzYJNYrT0Wcn8sQguxu.N1QlxU.nnSbtQW5ByO8AVICH9Xzg4K', NULL, 0, 1, NULL, '', '', '2018-05-06 03:00:48', '2018-05-06 03:06:08'),
(195, 'Awais Tasnim', 'awais_tasneem99@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '10204551541666346', '2018-05-06 15:49:33', '2018-05-06 15:49:33'),
(196, 'Amna Ahwar', 'amnatanveer111@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1820728044897724', '2018-05-06 16:21:32', '2018-05-06 16:21:32'),
(197, 'Shiza Zahid', 'shiza_muskan@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2276524372374311', '2018-05-07 03:37:28', '2018-05-07 03:37:28'),
(198, 'Rabia Qamar', 'rabia_liaqat@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10156823972970656', '2018-05-08 02:18:58', '2018-05-08 02:18:58'),
(199, 'Karamat Ullah', 'engr.karamat@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '10216288928914124', '2018-05-08 04:21:16', '2018-05-08 04:21:16'),
(200, 'Saira Darshan', 'saira.darshan@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2180265678884705', '2018-05-09 01:39:32', '2018-05-09 01:39:32'),
(201, 'Aniqa Maroof Khan', 'aneeka_214@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1858743924183992', '2018-05-09 14:10:57', '2018-05-09 14:10:57'),
(202, 'Ahmad Wamiq', 'ahmadwamiq27@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '102685440294298489227', '2018-05-11 22:35:57', '2018-05-11 22:35:57'),
(203, 'Fiza Noor', 'nisanoor357@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1766319720127787', '2018-05-12 02:12:40', '2018-05-12 02:12:40'),
(204, 'Nadia Tharani', 'nadu_4@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10155869963931107', '2018-05-12 18:03:31', '2018-05-12 18:03:31'),
(205, 'Rabia Sarwar', 'glowingthumbelina@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1883220751968611', '2018-05-12 18:22:45', '2018-05-12 18:22:45'),
(206, 'Rubab Sheikh', 'shizak2001@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '235363110567911', '2018-05-13 04:26:30', '2018-05-13 04:26:30'),
(207, 'Asjad Ahmad', 'asjadahmad@live.com', NULL, NULL, 1, 0, NULL, 'facebook', '10208963813692589', '2018-05-13 12:44:36', '2018-05-13 12:44:36'),
(208, 'Shama Muhammad Hanif', 'shamatd22@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1792421560844534', '2018-05-17 22:38:36', '2018-05-17 22:38:36'),
(209, 'Zara Sajid', 'zarasajid2@live.com', NULL, NULL, 1, 0, NULL, 'facebook', '10156273065779631', '2018-05-18 03:02:34', '2018-05-18 03:02:34'),
(210, 'Somia Ateeb', 'somiaateeb@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '117679469239609588302', '2018-05-18 03:16:55', '2018-05-18 03:16:55'),
(211, 'Ammara Laeeq', 'ammaramalik@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10155484028460840', '2018-05-18 12:59:08', '2018-05-18 12:59:08'),
(212, 'Hafiza Iram', 'iramh300@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '117541949360075316000', '2018-05-18 15:35:52', '2018-05-18 15:35:52'),
(213, 'Syeda Khadija Hussaini', 's_khadija96@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10210880068149656', '2018-05-18 17:11:23', '2018-05-18 17:11:23'),
(214, 'Mehr Een', 'mehreensakhi@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '935873576592200', '2018-05-18 19:47:39', '2018-05-18 19:47:39'),
(215, 'Ashu Fazal', 'aishafazal147@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '207800646695292', '2018-05-19 18:44:59', '2018-05-19 18:44:59'),
(216, 'Noor ul Eman', 'ayubayesha53@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '102512661963838796138', '2018-05-21 20:56:49', '2018-05-21 20:56:49'),
(217, 'Ruby khan', 'iman.khan2213@gmail.com', '$2y$10$v.7MtacU13oOQPfUI9VvyegQ4Qc1xLxPT3X3o4xDe730Ac10igszS', NULL, 0, 1, NULL, '', '', '2018-05-22 00:43:13', '2018-05-22 00:54:35'),
(218, 'Hunny Bunch', 're3m_princ3ss@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2227277427290161', '2018-05-25 23:56:09', '2018-05-25 23:56:09'),
(219, 'Nosheen Memon', 'nwahid89@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1006312016201658', '2018-05-30 13:31:07', '2018-05-30 13:31:07'),
(220, 'Salman Faiz', 'salmanfaiz85@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '10211663094273236', '2018-05-30 23:05:37', '2018-05-30 23:05:37'),
(221, 'Pashmina Iftikhar', 'pashii42@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1713057022111319', '2018-05-31 01:55:27', '2018-05-31 01:55:27'),
(222, 'Rahil Ayaz', 'rahil.ayaz273@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '111006947761674543876', '2018-05-31 15:53:13', '2018-05-31 15:53:13'),
(223, 'Mahrukh Anees', 'mahu.anees22@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '106580293481430462244', '2018-06-06 06:07:55', '2018-06-06 06:07:55'),
(224, 'Amna Atif', 'ana_magic@yahoo.com', '$2y$10$maYgKpjNDud0psdvnWbx/ef2vWmFQgG74rMJMVuDfaILFXzGK01oS', NULL, 1, 0, NULL, 'facebook', '1987472944618063', '2018-06-09 16:02:16', '2018-06-09 16:04:08'),
(225, 'rawaan rana', 'ranarawaan@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '107697208199047017114', '2018-06-10 15:43:49', '2018-06-10 15:43:49'),
(226, 'Mehak Naqvi', 'mehak-121@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1667478596684492', '2018-06-11 05:46:22', '2018-06-11 05:46:22'),
(227, 'Sana Shabbir', 'sanashabbir191@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '115170665517120753080', '2018-06-13 17:48:39', '2018-06-13 17:48:39'),
(228, 'Alifah Naqvi', 'alifahnaqvi@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2093570240919584', '2018-06-14 19:45:47', '2018-06-14 19:45:47'),
(229, 'Nazziha Akhlaq', 's_nazziha@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10157490105334746', '2018-06-17 17:30:39', '2018-06-17 17:30:39'),
(230, 'Huma Awan', 'humaiqbal23@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1722941487822210', '2018-06-18 23:02:05', '2018-06-18 23:02:05'),
(231, 'Risha Fayyaz', 'risha.f7@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '101996131647680586937', '2018-06-20 15:14:40', '2018-06-20 15:14:40'),
(232, 'Javeria Zafar', 'zafar.javeria@gmail.com', '$2y$10$.V.O8kpBbW8KATL4atEBBeN4UHospL/SHnx2goXp3Q8UMjVRuSEjK', 'Dc45OMU5Mrw4XcLmpamBiJqFgEpltw2jb39InYAktjTo43Ny0OAAgIRkU11D', 0, 1, NULL, '', '', '2018-06-21 00:07:45', '2018-06-21 00:16:31'),
(233, 'Mehrunnisa', 'mehrunnisaumer@gmail.com', '$2y$10$7fgMVHLHnY2PF1K2lfxBd.wwL/rBrD1TTwcf08si5cHhb.W.TIGHC', NULL, 0, 0, 't7oNm9TzTL', '', '', '2018-06-21 00:32:43', '2018-06-21 00:32:43'),
(234, 'Faheem Ullah', 'faheemullah888@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1308489169285274', '2018-06-22 13:45:52', '2018-06-22 13:45:52'),
(235, 'Menahil Imran', 'menahilimran@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1342986109179652', '2018-06-23 07:58:42', '2018-06-23 07:58:42'),
(236, 'Mahina Aleem', 'mahina_96@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2117763794932731', '2018-06-25 04:42:44', '2018-06-25 04:42:44'),
(237, 'Mahina Aleem', 'mahinaaleem@gmail.com', '$2y$10$Vnkv7hzozO35OQVQ7xdom.3sfu8/lvNP3JDrS1MaZz6qcP/yJqJpu', NULL, 0, 0, '9eBm6hbAAz', '', '', '2018-06-25 13:49:08', '2018-06-25 13:49:08'),
(238, 'Ameena Hayat Khan', 'uxkhan@live.com', NULL, NULL, 1, 0, NULL, 'facebook', '2260495100642370', '2018-06-26 17:06:09', '2018-06-26 17:06:09'),
(239, 'Aamaa Aqib', 'saima_tariq883@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '960587320785843', '2018-06-27 18:17:08', '2018-06-27 18:17:08'),
(240, 'Mahrukh A.zubair', 'mahrukh6021@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '107977747053762516115', '2018-07-01 19:53:21', '2018-07-01 19:53:21'),
(241, 'Bint E Hawa', 'fizzah.sharjeel@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '174336426757957', '2018-07-01 22:11:43', '2018-07-01 22:11:43'),
(242, 'Meesha Nauman', 'meesha.noman@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2136642553286317', '2018-07-04 03:22:22', '2018-07-04 03:22:22'),
(243, 'Tyba Ibrahim', 'tybadolly92@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '959249717587767', '2018-07-05 17:17:05', '2018-07-05 17:17:05'),
(244, 'Fatima Silman', 'fatimasilman_1994@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10156385030751655', '2018-07-05 20:22:30', '2018-07-05 20:22:30'),
(245, 'Hasan Bilal Khan', 'hasanbilalkhan@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10216110575495664', '2018-07-05 23:47:56', '2018-07-05 23:47:56'),
(246, 'Adeenah Sohail', 'princessadeena37@gmail.com', NULL, '1yAqOXDAaLhLgAQsa9kkwa0aVEUpInZvl837NLFYqZ0b1C4Z2hyyAPQDqPDu', 1, 0, NULL, 'facebook', '2115823001969590', '2018-07-06 17:23:43', '2018-07-06 17:23:43'),
(247, 'Omer Ahmed', 'omerahmed619@hotmail.com', NULL, 'VTQu3WR3NAaHQrlY8fnTMfxgCUnfnRqVl5sK9UWTVCEl0BZTn7tkxvo9Rpig', 1, 0, NULL, 'facebook', '10215079943144155', '2018-07-07 08:28:49', '2018-07-07 08:28:49'),
(248, 'Rayyan Ahmed', 'Rayyan112011@gmail.com', '$2y$10$uy1huDuAfHO.o5Zd2/iCae4QSfUMGTgkIifHspyGJNP2UfBChHHva', 'aIZEOGrZw00cbmTs1mUQXwng7viURuBbPXVrRDlomsn1LnHljPamM6A8dvVn', 0, 1, NULL, '', '', '2018-07-08 11:32:45', '2018-07-16 08:06:32'),
(249, 'Attiya Zeeshan', 'attiya224@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2224843414199057', '2018-07-08 16:40:53', '2018-07-08 16:40:53'),
(250, 'Usman Ijaz', 'usmanijaz.malik@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10212177952187089', '2018-07-08 23:32:01', '2018-07-08 23:32:01'),
(251, 'Merab Shahid', 'merab.shahid11@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '100406065105941105527', '2018-07-10 00:03:10', '2018-07-10 00:03:10'),
(252, 'Zainab Zahid Khawaja', 'khawaja.zainab@gmail.com', '$2y$10$U.GTU6Q14OOUe1u7nEcKP.G0bnJe3MDyxKJp4UpBTuGflK1o3aRJO', NULL, 0, 1, NULL, '', '', '2018-07-10 19:36:02', '2018-07-10 20:16:03'),
(253, 'Duaa Nasir', 'duaa-shahzad-123@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2585149205044048', '2018-07-10 19:55:45', '2018-07-10 19:55:45'),
(254, 'Laiba Iqbal', 'laiba7@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1857101217716533', '2018-07-11 01:16:27', '2018-07-11 01:16:27'),
(255, 'Abdullah Masood', 'voldemort267@yahoo.com', NULL, 'A1LDPVE354JrgXNV02y3dBwqKTTkCYcxAIFhSNryj0MOYsBMHyqdr6x6kmiN', 1, 0, NULL, 'facebook', '10211382388172089', '2018-07-11 07:06:29', '2018-07-11 07:06:29'),
(256, 'Aqsa Ali', 'aksamubashar@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2044722878893380', '2018-07-16 12:38:12', '2018-07-16 12:38:12'),
(257, 'Naukhaiz Sheikh', 'nts2296@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1915777005153024', '2018-07-19 20:27:03', '2018-07-19 20:27:03'),
(258, 'Shani Yousaf Rajput', 'shani-yousaf1@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2005671212825244', '2018-07-19 22:13:22', '2018-07-19 22:13:22'),
(259, 'nida nasir', 'nida617260@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '110899928351019289683', '2018-07-22 02:02:04', '2018-07-22 02:02:04'),
(260, 'Aruj Khan', 'aroojkhan_777@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1638277069616882', '2018-07-22 16:34:16', '2018-07-22 16:34:16'),
(261, 'Sara Qureshi', 'sara.qureshi2050@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1630256160416237', '2018-07-23 19:56:05', '2018-07-23 19:56:05'),
(262, 'Muhammad Imran Aftab', 'imrandmt@gmail.com', '$2y$10$mn.qSsSsAcPxH9lSQqI.luB8h21q/4lCvFYfvL3ftRRSFWk3l/dH6', NULL, 1, 0, NULL, 'facebook', '2208807332467305', '2018-07-24 01:34:14', '2018-07-24 17:26:21'),
(263, 'Lyba Xheikh', 'laibaikram597@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1980135548891724', '2018-07-24 01:47:36', '2018-07-24 01:47:36'),
(264, 'Marhaba Nemat', 'marhabanemat@gmail.com', '$2y$10$UDwY/z73Ira2qZiShkneq.NTyvpdqTJvaenSBFKX41P.GQYRj48NS', NULL, 0, 1, NULL, '', '', '2018-07-28 04:25:43', '2018-07-28 04:27:11'),
(265, 'Sidra Ahmad', 'ahmad.sidra99@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1106295526194271', '2018-07-29 18:38:00', '2018-07-29 18:38:00'),
(266, 'Wania Rana', 'deepdesire94@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1802241606522851', '2018-07-30 15:20:35', '2018-07-30 15:20:35'),
(267, 'Amna Khalid', 'dramnakhalid1@gmail.com', '$2y$10$Q1u9I11jPsFEjFcX3CnKtOdpnF3EqrUDnBBb.F/F3yT5Wsx157PGe', 'cyOD1ugZtAPJllKTQUnCCJOFJZ2nUKaJvv8n4UmURsXQOzUASfkt6RlgvMlG', 0, 1, NULL, '', '', '2018-07-30 22:00:17', '2018-07-30 22:01:37'),
(268, 'Haider Syed Maqsood', 'shani_999@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10155777577166045', '2018-07-31 01:02:16', '2018-07-31 01:02:16'),
(269, 'Masooma Ijaz', 'bc040400200@vu.edu.pk', NULL, NULL, 1, 0, NULL, 'facebook', '1986349461389645', '2018-07-31 02:40:12', '2018-07-31 02:40:12'),
(270, 'Asjad Adnan', 'asjadadnan2014@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2138338426424566', '2018-08-02 04:03:13', '2018-08-02 04:03:13'),
(271, 'Mehraiz Khan', 'mehraizkhan1993@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1734684536630013', '2018-08-03 16:13:46', '2018-08-03 16:13:46'),
(272, 'Fatima Hanif', 'fati.raja75@gmail.com', NULL, '3BAHNw1F3ar2z96UPj91DmlTfzSEsdAvrzACvR0n5Va5nxSVFkoICTCq2AjY', 1, 0, NULL, 'google', '118169141821106621779', '2018-08-05 20:50:49', '2018-08-05 20:50:49'),
(273, 'Talib Cassoobhai', 'talib94@gmail.com', NULL, 'VvLpj9PzUFIRnpPRJZE3gZyuCrl5VE2do8NK7byQqGfQNt0d7NAJ1ccbQY9p', 1, 0, NULL, 'google', '101690783964334630040', '2018-08-07 00:07:18', '2018-08-07 00:07:18'),
(274, 'Sania Ashraf', 'ashraf_sania@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1938686152877797', '2018-08-07 00:14:38', '2018-08-07 00:14:38'),
(275, 'Asfia Khan', 'asfia.tabassum.khan@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1023173187860527', '2018-08-08 19:24:26', '2018-08-08 19:24:26'),
(276, 'Khadeeja Arif', 'dija_sweety99@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1034805023354197', '2018-08-09 02:43:19', '2018-08-09 02:43:19'),
(277, 'Muhammad Sohaib Majeed', 'sohaib.majeed39@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '105645167328884031038', '2018-08-10 22:15:15', '2018-08-10 22:15:15'),
(278, 'Zainab Awan', 'gonegirl852@gmail.com', NULL, 'QMX3YVAnBDuwIOzksgFox0xY4SHK9cUo0WH1ipTYI23oxZ3pd1xyaaEZ0SOw', 1, 0, NULL, 'facebook', '513079322476177', '2018-08-11 03:44:32', '2018-08-11 03:44:32'),
(279, 'Momina Asif', 'asifmomina82@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '101434035060138825349', '2018-08-11 20:52:47', '2018-08-11 20:52:47'),
(280, 'Nabeela Zamaan', 'nabeela.zamaan@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '105789517682515872494', '2018-08-12 19:54:50', '2018-08-12 19:54:50'),
(281, 'Sehrish Kanwal', 'sehrishkanwal12@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1010452592466745', '2018-08-13 06:42:46', '2018-08-13 06:42:46'),
(282, 'Ayesha Latif', 'ayeshalatif122@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '112335696350733694900', '2018-08-13 12:57:10', '2018-08-13 12:57:10'),
(283, 'Waqar Ahmad', 'wahmad99400@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '106091967061598030434', '2018-08-13 20:21:30', '2018-08-13 20:21:30'),
(284, 'Zunaira Zaheer Malik', 'zunairazaheermalik@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2109501752638199', '2018-08-16 06:40:47', '2018-08-16 06:40:47'),
(285, 'Ume Laila Mohsin', 'umelaila@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10155443563205855', '2018-08-18 14:01:00', '2018-08-18 14:01:00'),
(286, 'Saniya Hashmi', 'saniyahashmi09@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '106963341592402825134', '2018-08-19 04:39:33', '2018-08-19 04:39:33'),
(287, 'Zara Ali', 'sanazara098@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '256508608316715', '2018-08-21 15:36:43', '2018-08-21 15:36:43'),
(288, 'Rida Iftikhar', 'ridaiftikhar4@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '114334174339527465454', '2018-08-23 23:34:41', '2018-08-23 23:34:41'),
(289, 'Fatima Rajput', 'fairy_kool95@live.com', NULL, 'TUWJLbkyxJKMguv6sBbVhvhPHPaPzps7ONB106viRLm8yGORBhE7i2GIS35q', 1, 0, NULL, 'facebook', '1686528411458088', '2018-08-25 04:56:00', '2018-08-25 04:56:00'),
(290, 'ajer atiq', 'ajeratiq212@gmail.com', '$2y$10$.rvm7Ady2lZRLedFpIZZNedY3d.SQg2rBTcRJagP4oK3QNa5PwM.G', 'GordKrT8NuDgce9pskVMvB9PlP5bCjAOnLP6NkUoSlaip6iMHVtyiGWvSn7t', 0, 1, NULL, '', '', '2018-08-28 21:45:02', '2018-08-28 21:50:18'),
(291, 'Mehak Ali', 'mehak_ali_leo@ymail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2083296995021837', '2018-08-29 02:43:39', '2018-08-29 02:43:39'),
(292, 'Huda Khalid', 'geminiblossom96@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2298856120350297', '2018-08-31 15:05:21', '2018-08-31 15:05:21'),
(293, 'Hadia Eman', 'hadiamirza03@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1947961518838139', '2018-09-01 16:50:24', '2018-09-01 16:50:24'),
(294, 'Laaibaah Tariq', 'laibatariq101@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1845191838906276', '2018-09-03 05:31:34', '2018-09-03 05:31:34'),
(295, 'Umer Baig', 'umer.baig@hotmail.com', '$2y$10$1zJNelu214AfOe11F7eGM.P4EVLHswa0Ib27wMnwuNUgG7DTEDRsu', NULL, 0, 0, '71dhM1mSxB', '', '', '2018-09-04 02:32:40', '2018-09-04 02:32:40'),
(296, 'Muhammad Omer', 'omi.production4@gmail.com', '$2y$10$eNfanxvSVCG3yrR2PI0XLexhI9cvsCgxqy5xKu8DnxYjHDjgOLqXG', NULL, 0, 1, NULL, '', '', '2018-09-04 04:19:43', '2018-09-04 14:35:10'),
(297, 'Asma Yahya', 'asma-zia@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10156474162230218', '2018-09-04 09:22:25', '2018-09-04 09:22:25'),
(298, 'Haider Ali Qureshi', 'qhaiderali43@yahoo.com', '$2y$10$XkdoudM9Z3umR.CwAlvlteXyRjk6VaYDphKR0ds5b5MyXjNp6Buxq', 'nHUP2GujLyKBkJmuvY40ulG2foYIUNtPNFc9MgzX6h6QhdFuVDyo7Kzfd8Vb', 0, 0, 'hjGZnqdmEh', '', '', '2018-09-08 21:27:00', '2018-09-08 21:27:00'),
(299, 'Amal S Ali', 'amalshoaib44@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10160923031015154', '2018-09-08 22:58:20', '2018-09-08 22:58:20'),
(300, 'Janita Asif', 'janita.asif@mail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2222018298123207', '2018-09-09 04:59:04', '2018-09-09 04:59:04'),
(301, 'Naima Ali', 'nishaalikhan850@yahoo.com', NULL, NULL, 1, 0, NULL, 'facebook', '1375842575902333', '2018-09-13 05:44:13', '2018-09-13 05:44:13'),
(302, 'minahil tanveer', 'minahiltanveer19@gmail.com', '$2y$10$XIZDynOmOSUVLZR8b/0q3uUE/3qI8GWgdUWbFlJPFgJrTwx1om.WK', NULL, 0, 1, NULL, '', '', '2018-09-16 15:36:59', '2018-09-16 15:44:38'),
(303, 'Sidra khan', 'sehral_khan@yahoo.com', '$2y$10$FEiMOiACIsqwq0NrHWSXsugjoJuIb4IjCwMpjNHhbSjuMKx.KvUuO', NULL, 0, 1, NULL, '', '', '2018-09-18 03:47:50', '2018-09-18 04:02:42'),
(304, 'Mahnoor Musharraf', 'mahnoormusharraf16@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '104303614278617863843', '2018-09-20 15:13:01', '2018-09-20 15:13:01'),
(305, 'Bushra Ata', 'bushxata@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2232820720287307', '2018-09-21 10:20:15', '2018-09-21 10:20:15'),
(306, 'Amima Usman', 'amimausman@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '1975878139159608', '2018-09-21 17:19:16', '2018-09-21 17:19:16'),
(307, 'Aima Choudary', 'erzachh@yahoo.com', NULL, 'z6pg6Z6TnE7yy3wb7Dzutaz6fIqg3frbkAlYa6A69Lidi3rdZqT3K70EWSkV', 1, 0, NULL, 'facebook', '351422565404937', '2018-09-21 23:36:58', '2018-09-21 23:36:58'),
(308, 'Ali Javaid', 'sweetali96@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '113334225836137378034', '2018-09-22 18:31:29', '2018-09-22 18:31:29'),
(309, 'Janita Asif', 'janitaasif123@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '101559993045668025700', '2018-09-22 22:44:56', '2018-09-22 22:44:56'),
(310, 'Sarah Zaidi', 'haidersarah@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10157835423594196', '2018-09-25 16:43:02', '2018-09-25 16:43:02'),
(311, 'Esshal Fatima', 'esshal.fatima111@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '334183757328001', '2018-09-27 22:53:25', '2018-09-27 22:53:25'),
(312, 'hira omer', 'hira8688@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '108079228593595678487', '2018-10-01 14:19:11', '2018-10-01 14:19:11'),
(313, 'زینب قریشی', 'zainabq@rocketmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '697771173916999', '2018-10-01 18:41:36', '2018-10-01 18:41:36'),
(314, 'Hira Ansari', 'hira.ansari28@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '665362207184102', '2018-10-01 19:18:29', '2018-10-01 19:18:29'),
(315, 'Nabeel Siraj', 'nabeel_syed1@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2132764883414134', '2018-10-02 14:45:14', '2018-10-02 14:45:14'),
(316, 'Raheel Zahid', 'rahi.60@hotmail.com', '$2y$10$jwuUIc/YspZK0LcBeyz9ou9MXzAsN7IeyFWG/ogT4MYpzN/ZuYB0a', NULL, 0, 0, 'bzfA689Sjs', '', '', '2018-10-03 14:04:20', '2018-10-03 14:04:20'),
(317, 'Ikra Iqbal', 'iiqraiiqbal18@gmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '2282827038605189', '2018-10-03 18:04:32', '2018-10-03 18:04:32'),
(318, 'Madiha Mujahid', 'madiha.mujahid88@hotmail.com', NULL, NULL, 1, 0, NULL, 'facebook', '10160879216915414', '2018-10-04 12:25:51', '2018-10-04 12:25:51'),
(319, 'maria ahmad', 'ahmadmaria697@gmail.com', '$2y$10$12pKYcJlNtfdlDhHf16V2.10oQzzZSN540KJa8oxr3.RxXIMmXTgm', 'O4268Jbel5srE0ctY311WOpiP6US1Q0ilqjmel7BuAmc33eVbBVUHcJdMkWz', 0, 1, NULL, '', '', '2018-10-16 23:37:04', '2018-10-16 23:38:21'),
(320, 'Rizwan Associates', 'r.associateslhr@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '117993406440752901680', '2018-10-17 15:47:45', '2018-10-17 15:47:45'),
(321, 'Shahid Malik', 'shahidali_52@hotmail.com', '$2y$10$qZP0OmsiV2FIMnPff80YBugpnQjMzQ.Dd/s4Q3lFdtMc4KZSTtIaO', NULL, 0, 1, NULL, '', '', '2018-10-17 18:33:59', '2018-10-17 18:35:33'),
(322, 'Anne Sajjad', 'ruokneaa@hotmail.com', '$2y$10$XvLEBGluyDgbl7aCnjh9jegCAPly1D8xKEYvvUK32zHXn2MPbdA6S', NULL, 0, 1, NULL, '', '', '2018-10-17 21:12:32', '2018-10-17 21:14:06'),
(323, 'khadija fayyaz', 'khadijafayyaz1@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '108173242156800959987', '2018-10-17 22:00:26', '2018-10-17 22:00:26'),
(324, 'Hafsa Butt', 'hafsa.butt.71@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '108620980354752250737', '2018-10-18 16:21:33', '2018-10-18 16:21:33'),
(325, 'Iqra Mashood', 'iqramashood28@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '116460088091619197567', '2018-10-19 00:38:43', '2018-10-19 00:38:43'),
(326, 'amna Waqas', 'a.akmel@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '114958679369720336586', '2018-10-19 02:36:59', '2018-10-19 02:36:59'),
(327, 'Hitler', 'dropbox706@yahoo.com', '$2y$10$D7SbUVWUVyY9POJ5k.pg6eE2P7CHt/0qCqbYFJ9BqZRKiEZX2o6CC', NULL, 0, 0, '7prWunqLvm', '', '', '2018-10-21 15:14:24', '2018-10-21 15:14:24'),
(328, 'Hitler', 'microsoft177@yahoo.com', '$2y$10$PMaPf5FYHxASyIPQfGo5Me1ltHJ/MKa4OOoZqtqFqT2vEXTnex2g.', NULL, 0, 0, 'HA6fQQD86I', '', '', '2018-10-21 15:22:08', '2018-10-21 15:22:08'),
(329, 'Hitler', 'pari_wish23@yahoo.com', '$2y$10$RBLhnCm79laft1Y.4L1DvOwqpIf/VfUqMbgIO3yxwgVpUTI/22cnK', NULL, 0, 0, 'RTJsAQHibe', '', '', '2018-10-21 15:22:58', '2018-10-21 15:22:58'),
(330, 'Amal Khattak', 'amalk2799@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '102226237562757738094', '2018-10-22 14:40:04', '2018-10-22 14:40:04'),
(331, 'Neha', 'nehaasif56@yahoo.com', '$2y$10$1WltVq8TQJ.ITn8FOuW6eevN2kIexV7qaYVb1EcPu8na6TSFexCbG', NULL, 0, 0, 'eXwNymyuoL', '', '', '2018-10-22 16:54:29', '2018-10-22 16:54:29'),
(332, 'Hania iqbal', 'haniaiqbal80@gmail.com', '$2y$10$nDVH.sM9wdaZ6StPGSjWDO.V.vhjpYYVE.a7KqXTx7BNgAV8zE336', NULL, 0, 0, 'HAV3vQ63Aw', '', '', '2018-10-23 15:06:16', '2018-10-23 15:06:16'),
(333, 'Baber', 'baber.javed@square63.com', '$2y$10$/tYoVZzi7xTwJCCfKyaX9eoiDwylNgmI1DI/778VpNgIwPKQoF78m', 'FB0raHTBEg2Y8URb9VuSrZrUO9SmvecK2faVjVoS7yQFjJ2wRLWrv23hR8kZ', 0, 1, NULL, '', '', '2018-10-25 19:12:26', '2018-10-25 19:13:42'),
(334, 'izza fatima', 'ezafatima.princess@gmail.com', '$2y$10$Mrv3UgVnIqWDLBobN35QaeR6JjHLEs36NptcYButy0gfXhnRGy9Yu', 'YoaB0k8kmpHiFaLAB562dIyinTm9gGzXYd4C0WRwmHozyGxT07tbSuiYQ5O5', 0, 1, NULL, '', '', '2018-10-26 00:02:42', '2018-10-26 00:05:57'),
(335, 'Adeel Shoukat', 'chaudhary.adeelshoukat@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '102026537986746754236', '2018-10-27 04:49:02', '2018-10-27 04:49:02'),
(336, 'Mehreen', 'wackygem@hotmail.com', '$2y$10$KbuvVlZnTB9XcUAznOtNu.7DFHIDGN.h.JCfk3LuUiOKQBR3FdzXG', NULL, 0, 1, NULL, '', '', '2018-10-29 02:17:35', '2018-10-29 02:19:40');
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `status`, `verified`, `email_token`, `provider`, `provider_id`, `created_at`, `updated_at`) VALUES
(337, 'Laiba shakeel', 'bosomfriend_29@hotmail.com', '$2y$10$nklk3.K./iM8oGbKyZUZZOxpFQMdsgMlVja5WWjlJmE88S7xf81JW', NULL, 0, 0, 'ZJhJBIJBcu', '', '', '2018-10-29 05:22:29', '2018-10-29 05:22:29'),
(338, 'Amna', 'amnachowhan.7@gmail.com', '$2y$10$hy850oJFTkkZ9y2TRB2KSeHtl/uglUnDm/6Csjd0Zm7/FU0o7jPty', NULL, 0, 1, NULL, '', '', '2018-10-30 19:06:38', '2018-10-30 19:07:58'),
(339, 'Sf', 'sfforevr@yahoo.com', '$2y$10$787k3HWF5fJ8PNJN9R.woumCFH7SLyJL5cA0N5wG3.ePaVa.OVGqm', 'NkdOxDHyJG6fEeFyc1Vf9N3qBWiItfBE3srZsUipDWY4V39e23T1Z6vbjxrq', 0, 0, 'JhfYArwCqK', '', '', '2018-10-31 09:42:17', '2018-10-31 09:42:17'),
(340, 'Anum naeem', 'anumnaeem28@gmail.com', '$2y$10$ESPREDOoOO.bLoNgI6f3NuwBWISRT5mHUf4KhE5LArtVRJ4eVGZ0O', NULL, 0, 0, 'cN41PLMtvC', '', '', '2018-10-31 14:31:50', '2018-10-31 14:31:50'),
(341, 'Fizza Ali', 'fizza.ali.grammarian@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '110919420267868470991', '2018-10-31 19:31:03', '2018-10-31 19:31:03'),
(342, 'Rabia Sajjad', 'rabiasajjad258@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '104428370702745630897', '2018-11-01 17:36:19', '2018-11-01 17:36:19'),
(343, 'Maryam Sohail', 'maryam.sohail76@gmail.com', NULL, NULL, 1, 0, NULL, 'google', '109582608493557761298', '2018-11-01 23:30:19', '2018-11-01 23:30:19'),
(344, 'Maryam', 'maryamkhalid19075@gmail.com', '$2y$10$VxryD912O563.tjq5XYQ7e6SFsJr4cT4UgwWdVoIrbLUqQS5gg7R6', NULL, 0, 0, 'tdCSYkHI5m', '', '', '2018-11-04 04:41:48', '2018-11-04 04:41:48');

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
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_tag` (`product_id`,`tag_id`);

--
-- Indexes for table `receiver_addresses`
--
ALTER TABLE `receiver_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `order_baskets`
--
ALTER TABLE `order_baskets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=661;

--
-- AUTO_INCREMENT for table `receiver_addresses`
--
ALTER TABLE `receiver_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
