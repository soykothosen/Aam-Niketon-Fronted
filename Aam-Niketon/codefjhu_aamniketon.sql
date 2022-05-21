-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2022 at 01:21 AM
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
(38, 11),
(39, 10),
(40, 11);

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

--
-- Dumping data for table `'15_cart'`
--

INSERT INTO `'15_cart'` (`id`, `product_id`) VALUES
(1, 5),
(2, 10);

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
  `pay_money` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `all_order`
--

INSERT INTO `all_order` (`order_id`, `order_details`, `total_price`, `status`, `note`, `cus_id`, `date`, `payment_number`, `pay_money`) VALUES
(38, '[{\"product_id\":5,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":1080,\"quantity\":\"5\"}]', 5400, 'create order', NULL, 15, 'Fri May 20 2022 22:48:02 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(39, '[{\"product_id\":5,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":1080,\"quantity\":\"1\"},{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"3\"}]', 3960, 'Confirm Order', '  অর্ডার গ্রহণ করলাম', 15, 'Fri May 20 2022 22:48:27 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(40, '[{\"product_id\":5,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":1080,\"quantity\":\"1\"},{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 2040, 'create order', NULL, 15, 'Fri May 20 2022 22:55:12 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(41, '[{\"product_id\":5,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":1080,\"quantity\":\"1\"},{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 2040, 'create order', NULL, 15, 'Fri May 20 2022 22:56:17 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(42, '[{\"product_id\":5,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":1080,\"quantity\":\"1\"},{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 2040, 'create order', NULL, 15, 'Fri May 20 2022 22:58:03 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(43, '[{\"product_id\":5,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":1080,\"quantity\":\"1\"},{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 2040, 'create order', NULL, 15, 'Fri May 20 2022 22:59:01 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(44, '[{\"product_id\":5,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":1080,\"quantity\":\"1\"},{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 2040, 'create order', NULL, 15, 'Fri May 20 2022 22:59:22 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(45, '[{\"product_id\":5,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":1080,\"quantity\":\"1\"},{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 2040, 'Delivered', '  ', 15, 'Fri May 20 2022 23:00:51 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(46, '[{\"product_id\":5,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":1080,\"quantity\":\"1\"},{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 2040, 'create order', NULL, 15, 'Fri May 20 2022 23:06:56 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(53, '[{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 960, 'create order', NULL, 13, 'Sat May 21 2022 00:09:25 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(54, '[{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 960, 'create order', NULL, 13, 'Sat May 21 2022 00:10:53 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(55, '[{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 960, 'create order', NULL, 13, 'Sat May 21 2022 00:10:56 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(56, '[{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 960, 'create order', NULL, 13, 'Sat May 21 2022 00:10:58 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(58, '[{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 960, 'Payment Received', '  6000 টাকা পেমেন্ট রিসিভ করা হয়েছে।', 13, 'Sat May 21 2022 00:15:14 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(59, '[{\"product_id\":11,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 960, 'create order', NULL, 13, 'Sat May 21 2022 03:38:22 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(60, '[{\"product_id\":11,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"3\"}]', 2880, 'create order', NULL, 13, 'Sat May 21 2022 03:42:12 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(61, '[{\"product_id\":11,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 960, 'create order', NULL, 13, 'Sat May 21 2022 04:17:22 GMT+0600 (Bangladesh Standard Time)', NULL, NULL),
(62, '[{\"product_id\":10,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"},{\"product_id\":11,\"product_name\":\"ফজলি আম ( ১২ কেজি প্যাকেট ) \",\"price\":960,\"quantity\":\"1\"}]', 1920, 'create order', NULL, 13, 'Sat May 21 2022 05:07:57 GMT+0600 (Bangladesh Standard Time)', NULL, NULL);

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
(3, ' রাজশাহীর  আম');

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
(15, 'Soykot Hosen', '01784286876', '123456', 'http://localhost:8081/img/cusImage/270219601_1187745394966537_8283460270275740624_n.jpg', 'Male', 'soykot.ruet.cse@gmail.com', '2022-05-19', 'বালিয়াপুকুর, রাজশাহী');

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
(10, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/course-photo.png', 1200, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 3, NULL, 'Yes'),
(11, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/course-photo.png', 1200, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 3, NULL, 'Yes'),
(19, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/cover-pic.png', 100, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 3, NULL, 'Yes');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `precessing`
--
ALTER TABLE `precessing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
