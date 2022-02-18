-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2022 at 05:56 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restro`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ct_id` int(11) NOT NULL,
  `ct_name` varchar(50) NOT NULL,
  `ct_order` int(11) NOT NULL,
  `ct_status` int(11) NOT NULL DEFAULT 0,
  `ct_addedon` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `cp_id` int(11) NOT NULL,
  `cp_code` varchar(50) NOT NULL,
  `cp_value` int(11) NOT NULL,
  `cp_cart_min` int(11) NOT NULL,
  `cp_expiry` date NOT NULL,
  `cp_status` int(11) NOT NULL DEFAULT 0,
  `cp_addedon` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy`
--

CREATE TABLE `delivery_boy` (
  `dl_id` int(11) NOT NULL,
  `dl_name` varchar(50) NOT NULL,
  `dl_mob` int(11) NOT NULL,
  `dl_status` int(11) NOT NULL DEFAULT 0,
  `dl_addedon` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dish_detail`
--

CREATE TABLE `dish_detail` (
  `dd_id` int(11) NOT NULL,
  `dd_dish` int(11) NOT NULL,
  `dd_portion` varchar(100) NOT NULL,
  `dd_offerprice` float DEFAULT NULL,
  `dd_price` float NOT NULL,
  `dd_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dish_master`
--

CREATE TABLE `dish_master` (
  `dm_id` int(11) NOT NULL,
  `ct_id` int(11) NOT NULL,
  `dm_name` varchar(100) NOT NULL,
  `dm_description` varchar(100) DEFAULT NULL,
  `dm_type` varchar(10) NOT NULL,
  `dm_image` varchar(100) NOT NULL,
  `dm_status` int(11) NOT NULL DEFAULT 0,
  `dm_addedon` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `lo_id` int(11) NOT NULL,
  `lo_name` varchar(30) NOT NULL,
  `lo_status` int(11) NOT NULL DEFAULT 0,
  `lo_deliverycharge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `od_id` int(11) NOT NULL,
  `om_id` int(11) NOT NULL,
  `dd_id` int(11) NOT NULL,
  `od_price` float NOT NULL,
  `od_quantity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE `order_master` (
  `om_id` int(11) NOT NULL,
  `om_u_id` int(11) NOT NULL,
  `om_total_price` float NOT NULL,
  `om_deliveryboy_id` int(11) DEFAULT NULL,
  `om_payment_mode` varchar(50) NOT NULL DEFAULT 'COD',
  `om_payment_status` int(11) NOT NULL,
  `om_order_status` int(11) NOT NULL,
  `om_cancelled` int(11) NOT NULL DEFAULT 0,
  `om_added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `u_email` varchar(25) NOT NULL,
  `u_pwd` varchar(25) NOT NULL,
  `u_phone` int(11) NOT NULL,
  `u_type` int(11) NOT NULL,
  `u_home_address` varchar(200) NOT NULL,
  `u_office_address` varchar(200) DEFAULT NULL,
  `u_status` int(11) NOT NULL DEFAULT 0,
  `u_addedon` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ct_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`cp_id`);

--
-- Indexes for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD PRIMARY KEY (`dl_id`);

--
-- Indexes for table `dish_detail`
--
ALTER TABLE `dish_detail`
  ADD PRIMARY KEY (`dd_id`);

--
-- Indexes for table `dish_master`
--
ALTER TABLE `dish_master`
  ADD PRIMARY KEY (`dm_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`od_id`);

--
-- Indexes for table `order_master`
--
ALTER TABLE `order_master`
  ADD PRIMARY KEY (`om_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ct_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `cp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  MODIFY `dl_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dish_detail`
--
ALTER TABLE `dish_detail`
  MODIFY `dd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dish_master`
--
ALTER TABLE `dish_master`
  MODIFY `dm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_master`
--
ALTER TABLE `order_master`
  MODIFY `om_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
