-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2024 at 08:53 PM
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
  `userName` varchar(32) NOT NULL,
  `password` text NOT NULL,
  `givenName` varchar(32) NOT NULL,
  `familyName` varchar(32) NOT NULL,
  `paymentInfo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `dishId` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `orderId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dishmenuingredient`
--

CREATE TABLE `dishmenuingredient` (
  `dishingredientId` int(11) NOT NULL,
  `dishId` int(11) NOT NULL,
  `menuingredientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `price` decimal(10,0) NOT NULL,
  `inStock` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `locationId` int(11) NOT NULL,
  `streetAddress` text NOT NULL,
  `coordinates` text NOT NULL,
  `openingTime` time NOT NULL,
  `ClosingTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `menuitem`
--

CREATE TABLE `menuitem` (
  `menuItemId` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `basePrice` decimal(10,0) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `date` date NOT NULL,
  `customerId` int(11) NOT NULL,
  `locationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`dishId`),
  ADD UNIQUE KEY `orderId` (`orderId`),
  ADD UNIQUE KEY `menuId` (`menuId`);

--
-- Indexes for table `dishmenuingredient`
--
ALTER TABLE `dishmenuingredient`
  ADD PRIMARY KEY (`dishingredientId`),
  ADD UNIQUE KEY `dishId` (`dishId`,`menuingredientId`),
  ADD KEY `menuingredientId` (`menuingredientId`);

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
  ADD UNIQUE KEY `menuItemId` (`menuItemId`),
  ADD KEY `ingredientId` (`ingredientId`);

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
  ADD UNIQUE KEY `customerId` (`customerId`),
  ADD UNIQUE KEY `locationId` (`locationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `dishId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dishmenuingredient`
--
ALTER TABLE `dishmenuingredient`
  MODIFY `dishingredientId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `ingredientId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `locationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menuingredient`
--
ALTER TABLE `menuingredient`
  MODIFY `menuIngredientId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `menuItemId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT;

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
