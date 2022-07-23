-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2022 at 11:40 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codefjhu_aamniketon`
--

-- --------------------------------------------------------

--
-- Table structure for table `'13_cart'`
--

CREATE TABLE `'13_cart'` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `'13_cart'`
--

INSERT INTO `'13_cart'` (`id`, `product_id`) VALUES
(69, 22);

-- --------------------------------------------------------

--
-- Table structure for table `'13_order'`
--

CREATE TABLE `'13_order'` (
  `id` int(11) NOT NULL,
  `order_details` varchar(500) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `note` varchar(500) NOT NULL,
  `all_order_id` int(11) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `'15_cart'`
--

CREATE TABLE `'15_cart'` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `'15_order'`
--

CREATE TABLE `'15_order'` (
  `id` int(11) NOT NULL,
  `order_details` varchar(500) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `note` varchar(500) NOT NULL,
  `all_order_id` int(11) NOT NULL,
  `promo_code` varchar(50) NOT NULL,
  `final_price` int(11) NOT NULL,
  `date` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `'16_cart'`
--

CREATE TABLE `'16_cart'` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `'16_order'`
--

CREATE TABLE `'16_order'` (
  `id` int(11) NOT NULL,
  `order_details` varchar(500) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `note` varchar(500) NOT NULL,
  `all_order_id` int(11) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `id` int(11) NOT NULL,
  `mobile_num` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`id`, `mobile_num`, `password`, `type`) VALUES
(1, '01784286885', '123456', 'super admin');

-- --------------------------------------------------------

--
-- Table structure for table `all_cart`
--

CREATE TABLE `all_cart` (
  `id` int(11) NOT NULL,
  `details` varchar(500) NOT NULL,
  `total_price` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `all_order`
--

CREATE TABLE `all_order` (
  `order_id` int(11) NOT NULL,
  `order_details` varchar(500) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `cus_id` int(11) NOT NULL,
  `date` varchar(100) NOT NULL,
  `payment_number` varchar(50) DEFAULT NULL,
  `pay_money` int(11) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `all_order`
--

INSERT INTO `all_order` (`order_id`, `order_details`, `total_price`, `status`, `note`, `cus_id`, `date`, `payment_number`, `pay_money`, `transaction_id`) VALUES
(94, '[{\"product_id\":22,\"product_name\":\"ajkk\",\"price\":87,\"quantity\":\"1\"}]', 87, 'Picked', '  ', 13, 'Sun May 22 2022 07:47:00 GMT+0600 (Bangladesh Standard Time)', NULL, NULL, NULL),
(96, '[{\"product_id\":22,\"product_name\":\"ajkk\",\"price\":87,\"quantity\":\"3\"}]', 261, 'Confirmed', '  ', 16, 'Sun May 22 2022 08:20:44 GMT+0600 (Bangladesh Standard Time)', NULL, NULL, NULL),
(99, '[{\"product_id\":22,\"product_name\":\"ajkk\",\"price\":87,\"quantity\":\"1\"}]', 87, 'create order', NULL, 16, 'Sun May 22 2022 08:50:26 GMT+0600 (Bangladesh Standard Time)', NULL, NULL, NULL),
(100, '[{\"product_id\":22,\"product_name\":\"ajkk\",\"price\":87,\"quantity\":\"5\"},{\"product_id\":23,\"product_name\":\"lichu\",\"price\":8,\"quantity\":\"3\"},{\"product_id\":22,\"product_name\":\"ajkk\",\"price\":87,\"quantity\":\"5\"}]', 894, 'create order', NULL, 16, 'Sun May 22 2022 09:57:25 GMT+0600 (Bangladesh Standard Time)', '01784256866', 894, '3456789C'),
(101, '[{\"product_id\":22,\"product_name\":\"ajkk\",\"price\":87,\"quantity\":\"3\"},{\"product_id\":22,\"product_name\":\"ajkk\",\"price\":87,\"quantity\":\"3\"},{\"product_id\":23,\"product_name\":\"lichu\",\"price\":8,\"quantity\":\"3\"}]', 546, 'create order', NULL, 13, 'Sun May 22 2022 10:03:30 GMT+0600 (Bangladesh Standard Time)', '01784256866', 546, '3456789C'),
(102, '[{\"product_id\":22,\"product_name\":\"ajkk\",\"price\":87,\"quantity\":\"1\"}]', 87, 'create order', NULL, 13, 'Sun May 22 2022 12:25:16 GMT+0600 (Bangladesh Standard Time)', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(3, ' রাজশাহীর  আম'),
(12, 'সরিষার তেল');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile_num` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `pic_url` varchar(200) DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `date_of_birth` varchar(50) DEFAULT NULL,
  `shipping_address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`user_id`, `name`, `mobile_num`, `password`, `pic_url`, `gender`, `email_address`, `date_of_birth`, `shipping_address`) VALUES
(13, 'Soykot Hosen', '01784286885', '123456', 'http://localhost:8081/img/cusImage/Soykot-3.jpg', 'Male', 'soykot.ruet.cse@gmail.com', '2022-05-17', 'বালিয়াপুকুর, রাজশাহী'),
(14, 'Sokot Hosen', '01710598673', '123456', 'http://localhost:8081/img/cusImage/Soykot-1.png', 'g', 'e', 'h', 's'),
(15, 'Soykot Hosen', '01784286876', '123456', 'http://localhost:8081/img/cusImage/270219601_1187745394966537_8283460270275740624_n.jpg', 'Male', 'soykot.ruet.cse@gmail.com', '2022-05-19', 'বালিয়াপুকুর, রাজশাহী'),
(16, 'Soykot Hosenj', '01701009661', '123456', NULL, 'Male', 'soykot.ruet.cse@gmail.com', '', 'dfgh');

-- --------------------------------------------------------

--
-- Table structure for table `precessing`
--

CREATE TABLE `precessing` (
  `id` int(11) NOT NULL,
  `process_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `precessing`
--

INSERT INTO `precessing` (`id`, `process_name`) VALUES
(1, 'Confirmed'),
(2, 'Payment Received'),
(3, 'Picked'),
(4, 'Shipped'),
(5, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_image_url` varchar(200) NOT NULL,
  `main_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `short_des` varchar(300) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `feature` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_image_url`, `main_price`, `discount`, `short_des`, `category_id`, `sub_category_id`, `feature`) VALUES
(22, 'ajkk', 'http://localhost:8081/img/productImage/cover-pic.png', 100, 13, 'sfdggg', 3, NULL, 'Yes'),
(23, 'lichu', 'http://localhost:8081/img/productImage/cover-pic.png', 10, 13, 'rt', 12, NULL, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `sessiontbl`
--

CREATE TABLE `sessiontbl` (
  `sesssion_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessiontbl`
--

INSERT INTO `sessiontbl` (`sesssion_id`, `expires`, `data`) VALUES
('1cZ280_nkZPaGKXbyC34Ckqm55b6x0ld', 1653221457, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('7EIdqqGOqVs8dssASeiklqsPcBsI6KOc', 1653212472, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('ATEngDGbL1rqeDtRREVs0UhjOYsuACkH', 1653212435, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('XYzorHx7uAikpzUtmVKikVKDWu2Tpdf4', 1653221465, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('cfySRdemladJXxFivJzjy4OiUlncIsD6', 1653212498, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('cmh_nbfTkgc0L6PokgqrXY9s1QImkF2r', 1653205333, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"user_id\":13,\"admin_id\":1}'),
('f8Te8N6vK26JbX4b5c8py8zMx-1IxPPv', 1653212410, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('l8-scW294XFX50zE65zIhCqZM2isBAwx', 1653212477, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `sub_category_name` varchar(200) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `'13_cart'`
--
ALTER TABLE `'13_cart'`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `'13_order'`
--
ALTER TABLE `'13_order'`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `'15_cart'`
--
ALTER TABLE `'15_cart'`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `'15_order'`
--
ALTER TABLE `'15_order'`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `'16_cart'`
--
ALTER TABLE `'16_cart'`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `'16_order'`
--
ALTER TABLE `'16_order'`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_cart`
--
ALTER TABLE `all_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_order`
--
ALTER TABLE `all_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `precessing`
--
ALTER TABLE `precessing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessiontbl`
--
ALTER TABLE `sessiontbl`
  ADD PRIMARY KEY (`sesssion_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `'13_cart'`
--
ALTER TABLE `'13_cart'`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `'13_order'`
--
ALTER TABLE `'13_order'`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `'15_cart'`
--
ALTER TABLE `'15_cart'`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `'15_order'`
--
ALTER TABLE `'15_order'`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `'16_cart'`
--
ALTER TABLE `'16_cart'`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `'16_order'`
--
ALTER TABLE `'16_order'`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `all_cart`
--
ALTER TABLE `all_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `all_order`
--
ALTER TABLE `all_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `precessing`
--
ALTER TABLE `precessing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
