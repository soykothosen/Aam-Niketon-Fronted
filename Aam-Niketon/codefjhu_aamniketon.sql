-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2022 at 06:44 AM
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
(20, 5),
(21, 6),
(22, 5),
(23, 6),
(24, 6),
(25, 6);

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
  `promo_code` varchar(50) NOT NULL,
  `final_price` int(11) NOT NULL,
  `date` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `order_details` varchar(300) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `cus_id` int(11) NOT NULL,
  `promo_code` varchar(50) DEFAULT NULL,
  `final_price` int(11) NOT NULL,
  `date` varchar(30) NOT NULL,
  `payment_number` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(3, 'দেশ সেরা রাজশাহীর আম'),
(4, 'খলিশা ফুলের মধু');

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
(14, 'Soykot Hosen', '01710598673', '123456', 'http://localhost:8081/img/cusImage/Soykot-1.png', 'Male', 'soykot.ruet.cse@gmail.com', '2022-05-18', 'বগুড়া');

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
(5, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/product-img.png', 1200, 10, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 3, NULL, 'Yes'),
(6, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/product-img.png', 1200, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 4, NULL, 'Yes'),
(7, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/product-img.png', 1200, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 4, NULL, 'No'),
(8, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/course-photo.png', 1200, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 3, NULL, 'No'),
(9, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/course-photo.png', 1200, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 3, NULL, 'No'),
(10, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/course-photo.png', 1200, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 3, NULL, 'Yes'),
(11, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/course-photo.png', 1200, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 3, NULL, 'Yes'),
(12, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/course-photo.png', 1200, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 4, NULL, 'Yes'),
(13, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/course-photo.png', 1200, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 4, NULL, 'Yes'),
(14, 'ফজলি আম ( ১২ কেজি প্যাকেট ) ', 'http://localhost:8081/img/productImage/course-photo.png', 1200, 20, 'নিজেদের বাগান থেকে চলে যাবে আপনার বাসায়', 4, NULL, 'Yes');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `'13_order'`
--
ALTER TABLE `'13_order'`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `all_cart`
--
ALTER TABLE `all_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `all_order`
--
ALTER TABLE `all_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
