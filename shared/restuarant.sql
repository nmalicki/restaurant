-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2024 at 09:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` text NOT NULL,
  `givenName` varchar(32) NOT NULL,
  `familyName` varchar(32) NOT NULL,
  `paymentInfo` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `email`, `password`, `givenName`, `familyName`, `paymentInfo`) VALUES
(22, 'new@gmail.com', '$2y$10$4HjojfqVaZLdbcb7VTXygeIGjQ8gwN93iYtRc7aWfkE7QqVLxJpH.', 'Nathan', 'Malicki', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `dishId` int(11) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`dishId`, `price`, `quantity`, `orderId`, `menuId`) VALUES
(1, 12.99, 0, 1, 3),
(13, 99.99, 1, 5, 1),
(14, 99.99, 1, 7, 1),
(15, 99.99, 1, 7, 1),
(16, 99.99, 1, 7, 1),
(17, 99.99, 1, 8, 1),
(18, 99.99, 1, 9, 1),
(19, 99.99, 1, 9, 1),
(20, 99.99, 1, 10, 1),
(21, 99.99, 1, 11, 1),
(22, 99.99, 1, 12, 1),
(23, 10.00, 1, 12, 1),
(24, 10.00, 1, 12, 1),
(25, 10.00, 1, 12, 1),
(26, 10.00, 1, 12, 1),
(27, 10.00, 1, 12, 1),
(28, 10.00, 1, 12, 1),
(29, 10.00, 1, 12, 1),
(30, 10.00, 1, 12, 1),
(31, 10.00, 1, 12, 1),
(32, 10.00, 1, 12, 1),
(33, 10.00, 1, 12, 1),
(34, 10.00, 1, 12, 1),
(35, 10.00, 1, 12, 1),
(36, 10.00, 1, 12, 1),
(37, 10.00, 1, 12, 1),
(38, 10.00, 1, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dishmenuingredient`
--

CREATE TABLE `dishmenuingredient` (
  `dishingredientId` int(11) NOT NULL,
  `dishId` int(11) NOT NULL,
  `menuingredientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dishmenuingredient`
--

INSERT INTO `dishmenuingredient` (`dishingredientId`, `dishId`, `menuingredientId`) VALUES
(1, 1, 10),
(3, 34, 3),
(4, 34, 5),
(5, 35, 3),
(6, 35, 5),
(7, 36, 3),
(8, 36, 5),
(9, 37, 3),
(10, 37, 5),
(11, 38, 7),
(12, 38, 8);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeId` int(11) NOT NULL,
  `userName` varchar(32) NOT NULL,
  `password` text NOT NULL,
  `givenName` varchar(32) NOT NULL,
  `familyName` varchar(32) NOT NULL,
  `position` enum('chef','cashier') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `ingredientId` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `inStock` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`ingredientId`, `name`, `price`, `inStock`) VALUES
(1, 'Beef Patty', 1.99, 1),
(2, 'American Cheese', 0.25, 1),
(3, 'Hamburger Bun', 0.50, 1),
(4, 'White Bread', 0.10, 1),
(5, 'Butter', 0.05, 1),
(6, 'Shredded Parmesan Cheese', 1.50, 1),
(7, 'Pizza Sauce', 5.99, 1),
(8, 'Pizza Dough', 5.00, 1),
(9, 'Pepperoni', 0.50, 1),
(10, 'Chicken ', 3.99, 1),
(11, 'French Fries', 2.99, 1),
(12, 'Hot Dog', 2.99, 1),
(13, 'Hot Dog Bun', 0.50, 1),
(14, 'Ketchup', 0.00, 1),
(15, 'Mustard', 0.00, 1),
(16, 'Pickles', 0.50, 0),
(17, 'Onion', 0.15, 1),
(18, 'Macaroni', 1.99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `locationId` int(11) NOT NULL,
  `streetAddress` text NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `url` text NOT NULL,
  `openingTime` time NOT NULL,
  `closingTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locationId`, `streetAddress`, `latitude`, `longitude`, `url`, `openingTime`, `closingTime`) VALUES
(1, '19 Union St', 42.5835, -71.7972, '19+Union+St,+Fitchburg,+MA+01420/@42.5835418,-71.7971898,17z/data=!3m1!4b1!4m6!3m5!1s0x89e3e64ef4cf29e9:0xb0fbffec3fc1f574!8m2!3d42.5835379!4d-71.7946149!16s%2Fg%2F11sdnmlgr2?entry=ttu', '09:00:00', '21:00:00'),
(2, '580 Pearl St', 42.5886, -71.7914, '@42.5885696,-71.7914112,14z?entry=ttu', '09:00:00', '21:00:00'),
(3, '389 Highland St', 42.6086, -71.7596, '389+Highland+St,+Lunenburg,+MA+01462/@42.608601,-71.7595484,15z/data=!3m1!4b1!4m9!1m2!2m1!1sgoogle+maps+api+create+map!3m5!1s0x89e3e81784b254dd:0xf5137361de620481!8m2!3d42.6085867!4d-71.7410944!16s%2Fg%2F11c0_flq66?entry=ttu', '09:00:00', '21:00:00'),
(4, '158 Myrtle Ave', 42.587, -71.789, '158+Myrtle+Ave,+Fitchburg,+MA+01420/@42.5870086,-71.7890091,17.96z/data=!4m6!3m5!1s0x89e3e64b19048073:0x5c1611a1894d5a44!8m2!3d42.587305!4d-71.7894637!16s%2Fg%2F11c22kn45j?entry=ttu', '09:00:00', '21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `menuingredient`
--

CREATE TABLE `menuingredient` (
  `menuIngredientId` int(11) NOT NULL,
  `includedByDefault` tinyint(1) NOT NULL,
  `extraCharge` tinyint(1) NOT NULL,
  `menuItemId` int(11) NOT NULL,
  `ingredientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menuingredient`
--

INSERT INTO `menuingredient` (`menuIngredientId`, `includedByDefault`, `extraCharge`, `menuItemId`, `ingredientId`) VALUES
(3, 1, 0, 1, 1),
(5, 1, 0, 1, 3),
(6, 0, 0, 1, 2),
(7, 1, 0, 2, 4),
(8, 1, 0, 2, 2),
(10, 1, 0, 4, 8),
(11, 1, 0, 4, 7),
(12, 1, 0, 4, 6),
(13, 0, 1, 4, 9),
(14, 1, 0, 3, 10),
(15, 1, 0, 3, 11),
(16, 0, 0, 1, 14),
(17, 0, 0, 1, 15),
(18, 1, 0, 5, 12),
(19, 1, 0, 5, 13),
(20, 1, 0, 5, 14),
(21, 1, 0, 5, 15),
(23, 0, 0, 1, 16),
(24, 0, 0, 1, 17),
(25, 0, 0, 5, 17),
(26, 1, 0, 6, 18),
(27, 1, 0, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `menuitem`
--

CREATE TABLE `menuitem` (
  `menuItemId` int(11) NOT NULL,
  `menuItemName` varchar(32) NOT NULL,
  `basePrice` decimal(4,2) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menuitem`
--

INSERT INTO `menuitem` (`menuItemId`, `menuItemName`, `basePrice`, `description`) VALUES
(1, 'Hamburger', 4.99, 'Beef patty on a bun'),
(2, 'Grilled Cheese', 3.99, 'Bread and Cheese'),
(3, 'Chicken Tenders', 5.99, 'Crispy chicken tenders served with a side of fries.'),
(4, 'Pizza', 12.99, '18\" pizza made with fresh cheese, tomato, and hand-tossed dough.'),
(5, 'Hot Dog', 2.99, 'Hot Dog on a bun with your choice of toppings'),
(6, 'Mac and Cheese', 5.99, 'Elbow pasta with freshly grated cheese and breadcrumbs.');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `date` date NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `locationId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `date`, `ordered`, `completed`, `customerId`, `locationId`) VALUES
(1, '2024-04-22', 0, 0, 22, 1),
(3, '2024-04-28', 0, 0, 22, 1),
(5, '0000-00-00', 0, 0, NULL, NULL),
(7, '0000-00-00', 0, 0, NULL, NULL),
(8, '2024-04-28', 0, 0, NULL, NULL),
(9, '2024-04-28', 0, 0, NULL, NULL),
(10, '2024-04-28', 0, 0, NULL, NULL),
(11, '2024-04-28', 0, 0, NULL, NULL),
(12, '2024-04-28', 0, 0, 22, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`dishId`),
  ADD KEY `orderId` (`orderId`) USING BTREE,
  ADD KEY `menuId` (`menuId`) USING BTREE;

--
-- Indexes for table `dishmenuingredient`
--
ALTER TABLE `dishmenuingredient`
  ADD PRIMARY KEY (`dishingredientId`),
  ADD KEY `menuingredientId` (`menuingredientId`),
  ADD KEY `dishId` (`dishId`,`menuingredientId`) USING BTREE;

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeId`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ingredientId`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locationId`);

--
-- Indexes for table `menuingredient`
--
ALTER TABLE `menuingredient`
  ADD PRIMARY KEY (`menuIngredientId`),
  ADD UNIQUE KEY `menuId` (`menuItemId`,`ingredientId`),
  ADD KEY `ingredientId` (`ingredientId`),
  ADD KEY `menuItemId` (`menuItemId`) USING BTREE;

--
-- Indexes for table `menuitem`
--
ALTER TABLE `menuitem`
  ADD PRIMARY KEY (`menuItemId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `customerId` (`customerId`) USING BTREE,
  ADD KEY `locationId` (`locationId`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `dishId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `dishmenuingredient`
--
ALTER TABLE `dishmenuingredient`
  MODIFY `dishingredientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `ingredientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `locationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menuingredient`
--
ALTER TABLE `menuingredient`
  MODIFY `menuIngredientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `menuItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  ADD CONSTRAINT `dish_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menuitem` (`menuItemId`);

--
-- Constraints for table `dishmenuingredient`
--
ALTER TABLE `dishmenuingredient`
  ADD CONSTRAINT `dishmenuingredient_ibfk_1` FOREIGN KEY (`dishId`) REFERENCES `dish` (`dishId`),
  ADD CONSTRAINT `dishmenuingredient_ibfk_2` FOREIGN KEY (`menuingredientId`) REFERENCES `menuingredient` (`menuIngredientId`);

--
-- Constraints for table `menuingredient`
--
ALTER TABLE `menuingredient`
  ADD CONSTRAINT `menuingredient_ibfk_1` FOREIGN KEY (`menuItemId`) REFERENCES `menuitem` (`menuItemId`),
  ADD CONSTRAINT `menuingredient_ibfk_2` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient` (`ingredientId`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`locationId`) REFERENCES `location` (`locationId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
