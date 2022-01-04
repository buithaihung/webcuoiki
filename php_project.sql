-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 03, 2022 at 11:30 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET SESSION time_zone = '+7:00';

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(250) NOT NULL,
  `admin_email` text NOT NULL,
  `admin_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_cost` decimal(6,2) NOT NULL,
  `order_status` varchar(100) NOT NULL DEFAULT 'on_hold',
  `user_id` int(11) NOT NULL,
  `user_phone` int(11) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_cost`, `order_status`, `user_id`, `user_phone`, `user_city`, `user_address`, `order_date`) VALUES
(10, '160.00', 'paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 06:27:45'),
(11, '200.00', 'not paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 06:33:08'),
(12, '200.00', 'not paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 06:34:37'),
(13, '800.00', 'not paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 06:36:36'),
(14, '800.00', 'not paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 06:43:56'),
(15, '800.00', 'not paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 06:45:20'),
(16, '800.00', 'not paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 06:45:30'),
(17, '800.00', 'not paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 06:50:24'),
(18, '155.00', 'paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 07:15:27'),
(19, '200.00', 'paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 07:19:50'),
(20, '200.00', 'not paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 07:24:27'),
(21, '200.00', 'not paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 07:24:36'),
(22, '200.00', 'not paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 07:25:59'),
(23, '560.00', 'not paid', 2, 123456789, 'Ha Noi', 'Ha Noi', '2022-01-03 09:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `product_id`, `product_name`, `product_image`, `product_price`, `product_quantity`, `user_id`, `order_date`) VALUES
(2, 9, '3', 'Black Bag', 'featured3.jpeg', '200.00', 3, 1, '2022-01-02 20:25:56'),
(3, 9, '2', 'Green Bag', 'featured2.jpeg', '160.00', 2, 1, '2022-01-02 20:25:56'),
(4, 10, '2', 'Green Bag', 'featured2.jpeg', '160.00', 1, 2, '2022-01-03 06:27:45'),
(5, 11, '3', 'Black Bag', 'featured3.jpeg', '200.00', 1, 2, '2022-01-03 06:33:08'),
(6, 12, '3', 'Black Bag', 'featured3.jpeg', '200.00', 1, 2, '2022-01-03 06:34:37'),
(7, 13, '3', 'Black Bag', 'featured3.jpeg', '200.00', 4, 2, '2022-01-03 06:36:36'),
(8, 14, '3', 'Black Bag', 'featured3.jpeg', '200.00', 4, 2, '2022-01-03 06:43:56'),
(9, 15, '3', 'Black Bag', 'featured3.jpeg', '200.00', 4, 2, '2022-01-03 06:45:20'),
(10, 16, '3', 'Black Bag', 'featured3.jpeg', '200.00', 4, 2, '2022-01-03 06:45:30'),
(11, 17, '3', 'Black Bag', 'featured3.jpeg', '200.00', 4, 2, '2022-01-03 06:50:24'),
(12, 18, '1', 'White Shoes', 'featured1.jpeg', '155.00', 1, 2, '2022-01-03 07:15:27'),
(13, 19, '3', 'Black Bag', 'featured3.jpeg', '200.00', 1, 2, '2022-01-03 07:19:50'),
(14, 20, '3', 'Black Bag', 'featured3.jpeg', '200.00', 1, 2, '2022-01-03 07:24:27'),
(15, 21, '3', 'Black Bag', 'featured3.jpeg', '200.00', 1, 2, '2022-01-03 07:24:36'),
(16, 22, '3', 'Black Bag', 'featured3.jpeg', '200.00', 1, 2, '2022-01-03 07:25:59'),
(17, 23, '3', 'Black Bag', 'featured3.jpeg', '200.00', 2, 2, '2022-01-03 09:17:33'),
(18, 23, '2', 'Green Bag', 'featured2.jpeg', '160.00', 1, 2, '2022-01-03 09:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(250) NOT NULL,
  `payment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `user_id`, `transaction_id`, `payment_date`) VALUES
(1, 18, 2, '2', '0000-00-00 00:00:00'),
(2, 19, 2, '57', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_category` varchar(100) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_image2` varchar(255) NOT NULL,
  `product_image3` varchar(255) NOT NULL,
  `product_image4` varchar(255) NOT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `product_special_offer` int(2) NOT NULL,
  `product_color` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_category`, `product_description`, `product_image`, `product_image2`, `product_image3`, `product_image4`, `product_price`, `product_special_offer`, `product_color`) VALUES
(2, 'Green Bag', 'bags', 'awesome green bag', 'featured2.jpeg', 'featured2.jpeg', 'featured2.jpeg', 'featured2.jpeg', '160.00', 0, 'green'),
(3, 'Black Bag', 'bags', 'awesome black bag', 'featured3.jpeg', 'featured3.jpeg', 'featured3.jpeg', 'featured3.jpeg', '200.00', 0, 'black'),
(4, 'Blue Bag', 'bags', 'awesome blue bag', 'featured4.jpeg', 'featured4.jpeg', 'featured4.jpeg', 'featured4.jpeg', '180.00', 0, 'blue'),
(5, 'Black coat', 'coats', 'Black coat for men', 'clothes1.jpeg', 'clothes1.jpeg', 'clothes1.jpeg', 'clothes1.jpeg', '150.00', 0, 'black'),
(6, 'Blue coat', 'coats', 'awesome blue coat', 'clothes2.jpeg', 'clothes2.jpeg', 'clothes2.jpeg', 'clothes2.jpeg', '190.00', 0, 'blue'),
(7, 'Apple watch', 'watches', 'awesome black watches', 'watch4.jpeg', 'watch4.jpeg', 'watch4.jpeg', 'watch4.jpeg', '400.00', 0, 'back'),
(8, 'Garmin watches', 'watches', 'awesome watches', 'watch3.jpeg', 'watch3.jpeg', 'watch3.jpeg', 'watch3.jpeg', '300.00', 0, 'black'),
(9, 'Apple watch', 'watches', 'awesome white watches', 'watch2.jpeg', 'watch2.jpeg', 'watch2.jpeg', 'watch2.jpeg', '440.00', 0, 'white'),
(10, 'Garmin watches', 'watches', 'awesome purple coat', 'watch1.jpeg', 'watch1.jpeg', 'watch1.jpeg', 'watch1.jpeg', '300.00', 0, 'purple'),
(11, 'Sport Shoes', 'shoes', 'awesome shoes', 'shoes1.jpeg', 'shoes1.jpeg', 'shoes1.jpeg', 'shoes1.jpeg', '155.00', 0, 'purple'),
(12, 'Sport Shoes', 'shoes', 'awesome shoes', 'shoes2.jpeg', 'shoes2.jpeg', 'shoes2.jpeg', 'shoes2.jpeg', '155.00', 0, 'white'),
(13, 'Sport Shoes', 'shoes', 'awesome shoes', 'shoes3.jpeg', 'shoes3.jpeg', 'shoes3.jpeg', 'shoes3.jpeg', '155.00', 0, 'yellow'),
(14, 'Sport Shoes', 'shoes', 'awesom shoes', 'shoes4.jpeg', 'shoes4.jpeg', 'shoes4.jpeg', 'shoes4.jpeg', '155.00', 0, 'black'),
(15, 'Nice coat', 'coats', 'awesome coat', 'clothes3.jpeg', 'clothes3.jpeg', 'clothes3.jpeg', 'clothes3.jpeg', '190.00', 0, 'black'),
(16, 'Blue coat', 'coats', 'awesome blue coat', 'clothes4.jpeg', 'clothes4.jpeg', 'clothes4.jpeg', 'clothes4.jpeg', '190.00', 0, 'blue');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'ddevtk', 'duong@gmail.com', '8243064ac87b85382184ddc37fa4b97f'),
(2, 'Nguyen Tu', 'tu@gmail.com', '25d55ad283aa400af464c76d713c07ad');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UX_Constraint` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
