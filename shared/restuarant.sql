-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 05:09 PM
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
(22, 'new@gmail.com', '$2y$10$4HjojfqVaZLdbcb7VTXygeIGjQ8gwN93iYtRc7aWfkE7QqVLxJpH.', 'Nathan', 'Malicki', 210212123),
(23, 'Quinnd538@gmail.com', '$2y$10$fJcGmcjuAOoissiiHBmpf.ey6ebI8N3//DNxyFP7N8U7DFN4o5iS.', 'Quinn', 'Dullea', 0),
(24, 'another@gmail.com', '$2y$10$j3ZtERTAR34A0zNFIaN.NOCN773JpeFL5SM40ZVFT4Ym1ExXh6NmC', 'Test', 'Test', 0),
(25, 'anothernew@gmail.com', '$2y$10$qXJViAm5t3aU8LLwBrd29eKEjPD3DqKQAxEGZz1enH3jyHRAYCOAu', 'Test2', 'test2', 0),
(26, 'testanother@gmail.com', '$2y$10$QjS7emoiBlC1phnPXroSTOmQ54BbiAdQbN8bO6yImrlobOpZpv/42', 'Test3', 'test', 0),
(28, 'test4@gmail.comm', '$2y$10$/rXG6pCwiy/gSameTeW/1et0HxFOMceI8ESA/0DpH1/HNaLT.xUHq', 'Test4', 'Test', 0),
(30, 'test5@gmail.com', '$2y$10$czQAep4uysiAgeAkVpOcROuizVcT5LDbhBuyWoEpJj5nu5vZipFSK', 'Test5', 'test', 0),
(31, 'test6@gmail.com', '$2y$10$daZ547Nbvnp9pKGZix39rOFgnAK9Apqb.9K5wT0i5OsiNR0jB2xBK', 'Test6', 'test2', 0),
(32, 'another7@gmail.com', '$2y$10$c9hNwE.5IE5TgP1Htnpmmu7a0D.F8q7tR8uGGpGsH1kxCei0vtzNC', 'Test7', 'test5', 0);

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
(38, 10.00, 1, 12, 2),
(39, 10.00, 1, 13, 2),
(41, 10.00, 5, 13, 1),
(42, 10.00, 1, 13, 2),
(43, 10.00, 1, 13, 3),
(44, 10.00, 1, 13, 3),
(45, 10.00, 1, 13, 5),
(46, 10.00, 1, 13, 3),
(47, 10.00, 1, 13, 4),
(48, 10.00, 1, 13, 1),
(49, 10.00, 1, 13, 1),
(50, 10.00, 1, 13, 5),
(51, 10.00, 1, 14, 1),
(52, 10.00, 1, 14, 2),
(53, 10.00, 1, 14, 2),
(54, 10.00, 1, 14, 1),
(55, 10.00, 1, 14, 1),
(71, 10.00, 1, 22, 1),
(72, 10.00, 1, 24, 1),
(78, 4.99, 1, 25, 1),
(79, 3.99, 1, 26, 2),
(80, 5.99, 1, 27, 3),
(81, 4.99, 1, 28, 1),
(82, 3.99, 1, 28, 2),
(83, 2.99, 1, 28, 5),
(84, 3.99, 1, 29, 2),
(85, 5.99, 1, 29, 3),
(86, 12.99, 1, 29, 4),
(87, 14.49, 1, 29, 4),
(88, 4.99, 1, 30, 1),
(89, 4.99, 1, 31, 1),
(90, 4.99, 1, 32, 1),
(91, 4.99, 1, 33, 1),
(92, 4.99, 1, 34, 1),
(93, 4.99, 1, 35, 1),
(94, 4.99, 1, 36, 1),
(96, 4.99, 1, 37, 1),
(97, 4.99, 1, 38, 1),
(98, 4.99, 1, 39, 1),
(99, 4.99, 1, 40, 1),
(100, 4.99, 1, 40, 1),
(101, 4.99, 1, 41, 1),
(102, 3.99, 1, 42, 2),
(103, 5.99, 3, 42, 6),
(106, 4.99, 1, 43, 1),
(108, 4.99, 1, 44, 1),
(109, 4.99, 1, 45, 1),
(110, 4.99, 1, 46, 1),
(111, 4.99, 1, 47, 1),
(112, 4.99, 1, 48, 1),
(113, 4.99, 1, 49, 1),
(114, 4.99, 1, 50, 1),
(115, 4.99, 1, 51, 1),
(116, 3.99, 1, 52, 2),
(117, 5.99, 1, 52, 3),
(118, 2.99, 1, 53, 5),
(119, 4.99, 1, 54, 1),
(120, 5.99, 1, 54, 3),
(121, 4.99, 1, 55, 1),
(122, 3.99, 1, 56, 2),
(123, 12.99, 1, 56, 4),
(129, 4.99, 1, 57, 1),
(130, 3.99, 1, 57, 2),
(131, 4.99, 1, 58, 1),
(132, 4.99, 1, 59, 1),
(133, 2.99, 1, 60, 5),
(134, 4.99, 1, 61, 1),
(135, 4.99, 1, 62, 1),
(136, 4.99, 1, 64, 1),
(137, 4.99, 1, 65, 1),
(138, 4.99, 1, 66, 1),
(139, 4.99, 1, 67, 1),
(140, 2.99, 1, 68, 5),
(141, 4.99, 1, 69, 1),
(142, 4.99, 1, 70, 1),
(143, 3.99, 1, 70, 2),
(144, 4.99, 1, 71, 1),
(145, 5.99, 1, 71, 3),
(146, 2.99, 1, 72, 5),
(147, 12.99, 1, 72, 4),
(148, 2.99, 1, 73, 5),
(149, 12.99, 1, 73, 4),
(150, 3.99, 4, 74, 2),
(151, 5.99, 3, 75, 3),
(152, 14.49, 1, 75, 4),
(153, 2.99, 5, 76, 5),
(154, 4.99, 1, 76, 1),
(155, 5.99, 1, 77, 6),
(156, 12.99, 1, 77, 4),
(157, 2.99, 5, 77, 5),
(158, 2.99, 5, 77, 5),
(159, 4.99, 1, 80, 1),
(160, 3.99, 2, 80, 2),
(161, 4.99, 2, 82, 1),
(162, 3.99, 2, 82, 2),
(163, 3.99, 2, 82, 2),
(164, 3.99, 2, 82, 2),
(165, 14.97, 3, 82, 1),
(166, 11.98, 2, 84, 3),
(167, 38.97, 3, 84, 4),
(168, 9.98, 2, 85, 1),
(169, 3.99, 1, 85, 2),
(170, 7.98, 2, 86, 2),
(171, 8.97, 3, 86, 5),
(172, 14.97, 3, 87, 1),
(173, 11.97, 3, 87, 2),
(174, 9.98, 2, 88, 1),
(175, 11.98, 2, 88, 6),
(176, 9.98, 2, 89, 1),
(177, 11.98, 2, 89, 6),
(178, 11.98, 2, 90, 6),
(179, 11.98, 2, 90, 3),
(180, 9.98, 2, 90, 1),
(181, 11.98, 2, 90, 3),
(182, 7.98, 2, 91, 2),
(183, 7.98, 2, 91, 2),
(184, 9.98, 2, 92, 1),
(185, 11.98, 2, 92, 6),
(186, 9.98, 2, 93, 1),
(187, 12.99, 1, 93, 4),
(188, 7.98, 2, 94, 2),
(189, 5.99, 1, 94, 6),
(190, 7.98, 2, 94, 2),
(191, 7.98, 2, 95, 2),
(192, 5.99, 1, 95, 3),
(193, 3.99, 1, 96, 2),
(194, 9.98, 2, 97, 1),
(195, 12.99, 1, 97, 4),
(196, 4.99, 1, 98, 1),
(197, 2.99, 1, 98, 5),
(198, 7.98, 2, 99, 2),
(199, 5.98, 2, 99, 5),
(200, 4.99, 1, 100, 1),
(201, 5.99, 1, 100, 3),
(202, 3.99, 1, 101, 2),
(203, 9.98, 2, 102, 1),
(204, 5.98, 2, 102, 5),
(205, 4.99, 1, 103, 1),
(206, 7.98, 2, 104, 2),
(207, 2.99, 1, 104, 5),
(208, 5.99, 1, 105, 7),
(209, 4.99, 1, 108, 1),
(210, 4.99, 1, 109, 1),
(211, 3.99, 1, 110, 2),
(212, 4.99, 1, 113, 1),
(214, 7.98, 2, 114, 2),
(215, 3.99, 1, 114, 2),
(216, 9.98, 1, 115, 1),
(217, 3.99, 1, 115, 2),
(218, 5.98, 2, 116, 5),
(219, 7.98, 2, 116, 2),
(220, 4.99, 1, 117, 1),
(221, 5.99, 1, 117, 6),
(222, 4.99, 1, 118, 1),
(223, 5.99, 1, 118, 3),
(224, 4.99, 1, 119, 1),
(225, 5.99, 1, 119, 3),
(227, 5.99, 1, 120, 3);

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
(12, 38, 8),
(13, 39, 7),
(14, 39, 8),
(19, 41, 3),
(18, 41, 5),
(21, 42, 7),
(20, 42, 8),
(22, 43, 14),
(23, 43, 15),
(24, 44, 14),
(25, 44, 15),
(26, 45, 18),
(28, 45, 19),
(27, 45, 20),
(29, 45, 21),
(30, 46, 14),
(31, 46, 15),
(33, 47, 10),
(34, 47, 11),
(32, 47, 12),
(35, 48, 3),
(36, 48, 5),
(37, 49, 3),
(38, 49, 5),
(39, 50, 18),
(41, 50, 19),
(40, 50, 20),
(42, 50, 21),
(43, 51, 3),
(44, 51, 5),
(46, 52, 7),
(45, 52, 8),
(48, 53, 7),
(47, 53, 8),
(49, 54, 3),
(50, 54, 5),
(51, 55, 3),
(52, 55, 5),
(53, 55, 17),
(54, 55, 24),
(55, 71, 3),
(56, 71, 5),
(57, 72, 3),
(58, 72, 5),
(59, 78, 3),
(60, 78, 5),
(62, 79, 7),
(61, 79, 8),
(63, 80, 14),
(64, 80, 15),
(65, 81, 3),
(66, 81, 5),
(68, 82, 7),
(67, 82, 8),
(69, 83, 18),
(71, 83, 19),
(70, 83, 20),
(72, 83, 21),
(74, 84, 7),
(73, 84, 8),
(75, 85, 14),
(76, 85, 15),
(78, 86, 10),
(79, 86, 11),
(77, 86, 12),
(80, 86, 13),
(82, 87, 10),
(83, 87, 11),
(81, 87, 12),
(84, 87, 13),
(85, 88, 3),
(86, 88, 5),
(87, 89, 3),
(88, 89, 5),
(89, 90, 3),
(90, 90, 5),
(91, 91, 3),
(92, 91, 5),
(93, 92, 3),
(94, 92, 5),
(95, 93, 3),
(96, 93, 5),
(97, 94, 3),
(98, 94, 5),
(99, 96, 3),
(100, 96, 5),
(101, 97, 3),
(102, 97, 5),
(103, 98, 3),
(104, 98, 5),
(105, 99, 3),
(106, 99, 5),
(107, 100, 3),
(108, 100, 5),
(109, 101, 3),
(110, 101, 5),
(111, 102, 7),
(112, 103, 26),
(113, 103, 27),
(114, 106, 3),
(115, 106, 5),
(116, 108, 3),
(117, 108, 5),
(118, 109, 3),
(119, 109, 5),
(120, 110, 3),
(121, 110, 5),
(122, 111, 3),
(123, 111, 5),
(124, 112, 3),
(125, 112, 5),
(126, 113, 3),
(127, 113, 5),
(128, 114, 3),
(129, 114, 5),
(130, 115, 3),
(131, 115, 5),
(133, 116, 7),
(132, 116, 8),
(134, 117, 14),
(135, 117, 15),
(137, 118, 18),
(139, 118, 19),
(138, 118, 20),
(136, 118, 21),
(140, 119, 3),
(141, 119, 5),
(142, 120, 14),
(143, 121, 3),
(144, 121, 5),
(145, 122, 7),
(146, 122, 8),
(149, 123, 10),
(147, 123, 11),
(148, 123, 12),
(150, 129, 3),
(151, 129, 5),
(152, 130, 7),
(153, 130, 8),
(154, 131, 3),
(155, 131, 5),
(156, 132, 3),
(157, 132, 5),
(160, 133, 18),
(158, 133, 19),
(161, 133, 20),
(159, 133, 21),
(162, 134, 3),
(163, 134, 5),
(164, 135, 3),
(165, 135, 5),
(166, 136, 3),
(167, 136, 5),
(168, 137, 3),
(169, 137, 5),
(170, 138, 3),
(171, 138, 5),
(172, 139, 3),
(173, 139, 5),
(176, 140, 18),
(174, 140, 19),
(177, 140, 20),
(175, 140, 21),
(178, 141, 3),
(179, 141, 5),
(180, 142, 3),
(181, 142, 5),
(182, 143, 7),
(183, 143, 8),
(184, 144, 3),
(185, 144, 5),
(187, 145, 14),
(186, 145, 15),
(190, 146, 18),
(188, 146, 19),
(191, 146, 20),
(189, 146, 21),
(194, 147, 10),
(192, 147, 11),
(193, 147, 12),
(197, 148, 18),
(195, 148, 19),
(198, 148, 20),
(196, 148, 21),
(201, 149, 10),
(199, 149, 11),
(200, 149, 12),
(202, 150, 7),
(203, 150, 8),
(204, 151, 15),
(207, 152, 10),
(205, 152, 11),
(206, 152, 12),
(208, 152, 13),
(209, 153, 18),
(211, 153, 19),
(210, 153, 20),
(212, 153, 21),
(213, 154, 3),
(214, 154, 5),
(216, 155, 26),
(215, 155, 27),
(217, 156, 12),
(218, 157, 18),
(220, 157, 19),
(219, 157, 20),
(221, 157, 21),
(222, 158, 18),
(224, 158, 19),
(223, 158, 20),
(225, 159, 3),
(226, 159, 5),
(227, 160, 7),
(228, 160, 8),
(229, 161, 3),
(230, 161, 5),
(231, 162, 7),
(232, 162, 7),
(233, 163, 7),
(234, 163, 7),
(235, 164, 7),
(236, 164, 8),
(237, 165, 3),
(238, 165, 5),
(240, 166, 14),
(239, 166, 15),
(243, 167, 10),
(241, 167, 11),
(242, 167, 12),
(244, 168, 3),
(245, 168, 5),
(246, 169, 7),
(247, 169, 8),
(248, 170, 7),
(249, 170, 8),
(252, 171, 18),
(250, 171, 19),
(253, 171, 20),
(251, 171, 21),
(254, 172, 3),
(255, 172, 5),
(256, 173, 7),
(257, 173, 8),
(258, 174, 3),
(259, 174, 5),
(260, 175, 26),
(261, 175, 27),
(262, 176, 3),
(263, 176, 5),
(264, 177, 26),
(265, 177, 27),
(266, 178, 26),
(267, 178, 27),
(269, 179, 14),
(268, 179, 15),
(270, 180, 3),
(271, 180, 5),
(273, 181, 14),
(272, 181, 15),
(274, 182, 7),
(275, 182, 8),
(276, 183, 7),
(277, 183, 8),
(278, 184, 3),
(279, 184, 5),
(280, 185, 26),
(281, 185, 27),
(282, 186, 3),
(283, 186, 5),
(286, 187, 10),
(284, 187, 11),
(285, 187, 12),
(287, 188, 7),
(288, 188, 8),
(289, 189, 26),
(290, 189, 27),
(291, 190, 7),
(292, 190, 8),
(293, 191, 7),
(294, 191, 8),
(296, 192, 14),
(295, 192, 15),
(297, 193, 7),
(298, 193, 8),
(299, 194, 3),
(300, 194, 5),
(303, 195, 10),
(301, 195, 11),
(302, 195, 12),
(304, 196, 3),
(305, 196, 5),
(308, 197, 18),
(306, 197, 19),
(309, 197, 20),
(307, 197, 21),
(310, 198, 7),
(311, 198, 8),
(314, 199, 18),
(312, 199, 19),
(315, 199, 20),
(313, 199, 21),
(316, 200, 3),
(317, 200, 5),
(319, 201, 14),
(318, 201, 15),
(320, 202, 7),
(321, 202, 8),
(322, 203, 3),
(323, 203, 5),
(326, 204, 18),
(324, 204, 19),
(327, 204, 20),
(325, 204, 21),
(328, 205, 3),
(329, 205, 5),
(330, 206, 7),
(331, 206, 8),
(334, 207, 18),
(332, 207, 19),
(335, 207, 20),
(333, 207, 21),
(338, 208, 28),
(340, 208, 29),
(336, 208, 30),
(337, 208, 31),
(339, 208, 33),
(342, 209, 3),
(343, 209, 5),
(345, 209, 6),
(341, 209, 34),
(344, 209, 35),
(347, 210, 3),
(348, 210, 5),
(350, 210, 6),
(346, 210, 34),
(349, 210, 35),
(352, 211, 7),
(351, 211, 8),
(354, 212, 3),
(355, 212, 5),
(357, 212, 6),
(353, 212, 34),
(356, 212, 35),
(364, 214, 7),
(363, 214, 8),
(366, 215, 7),
(365, 215, 8),
(368, 216, 3),
(369, 216, 5),
(371, 216, 6),
(367, 216, 34),
(370, 216, 35),
(373, 217, 7),
(372, 217, 8),
(374, 218, 18),
(376, 218, 19),
(375, 218, 20),
(377, 218, 21),
(379, 219, 7),
(378, 219, 8),
(381, 220, 3),
(382, 220, 5),
(384, 220, 6),
(380, 220, 34),
(383, 220, 35),
(386, 221, 26),
(385, 221, 27),
(388, 222, 3),
(389, 222, 5),
(391, 222, 6),
(387, 222, 34),
(390, 222, 35),
(392, 223, 14),
(393, 223, 15),
(395, 224, 3),
(396, 224, 5),
(398, 224, 6),
(394, 224, 34),
(397, 224, 35),
(399, 225, 14),
(400, 225, 15),
(406, 227, 14),
(407, 227, 15);

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
(9, 'Pepperoni', 1.50, 1),
(10, 'Chicken ', 3.99, 1),
(11, 'French Fries', 2.99, 1),
(12, 'Hot Dog', 2.99, 1),
(13, 'Hot Dog Bun', 0.50, 1),
(14, 'Ketchup', 0.00, 1),
(15, 'Mustard', 0.00, 1),
(16, 'Pickles', 0.50, 0),
(17, 'Onion', 0.15, 1),
(18, 'Macaroni', 1.99, 1),
(19, 'Lettuce', 0.25, 1),
(20, 'Tomato', 0.25, 1);

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
(6, 1, 0, 1, 2),
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
(27, 1, 0, 6, 6),
(28, 1, 0, 7, 10),
(29, 1, 0, 7, 3),
(30, 1, 0, 7, 11),
(31, 1, 0, 7, 19),
(32, 0, 0, 7, 16),
(33, 1, 0, 7, 20),
(34, 1, 0, 1, 19),
(35, 1, 0, 1, 20);

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
(6, 'Mac and Cheese', 5.99, 'Elbow pasta with freshly grated cheese and breadcrumbs.'),
(7, 'Chicken Sandwich', 5.99, 'Crispy Chicken Patty on a bun');

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
(12, '2024-04-28', 0, 0, 22, NULL),
(13, '2024-04-29', 0, 0, NULL, NULL),
(14, '2024-04-29', 0, 0, NULL, NULL),
(15, '2024-04-29', 0, 0, NULL, 1),
(16, '2024-04-29', 0, 0, NULL, 2),
(17, '2024-04-29', 0, 0, 22, NULL),
(18, '2024-04-29', 0, 0, 22, NULL),
(19, '2024-04-29', 0, 0, 22, NULL),
(20, '2024-04-29', 0, 0, 22, NULL),
(21, '2024-04-29', 0, 0, 22, 1),
(22, '2024-04-29', 0, 0, NULL, NULL),
(23, '2024-04-29', 0, 0, 22, NULL),
(24, '2024-04-29', 0, 0, NULL, 2),
(25, '2024-04-29', 0, 0, NULL, NULL),
(26, '2024-04-29', 0, 0, NULL, NULL),
(27, '2024-04-29', 0, 0, NULL, NULL),
(28, '2024-04-29', 0, 0, NULL, 2),
(29, '2024-04-29', 0, 0, NULL, NULL),
(30, '2024-04-29', 0, 0, NULL, 1),
(31, '2024-04-29', 0, 0, NULL, 1),
(32, '2024-04-29', 0, 0, NULL, 1),
(33, '2024-04-29', 0, 0, NULL, 1),
(34, '2024-04-29', 0, 0, NULL, 1),
(35, '2024-04-29', 0, 0, NULL, 1),
(36, '2024-04-29', 0, 0, NULL, 1),
(37, '2024-04-29', 0, 0, NULL, 1),
(38, '2024-04-29', 0, 0, NULL, 1),
(39, '2024-04-29', 0, 0, NULL, NULL),
(40, '2024-04-29', 0, 0, 22, 1),
(41, '2024-04-29', 0, 0, 22, 2),
(42, '2024-04-29', 0, 0, 22, 2),
(43, '2024-04-29', 0, 0, NULL, 1),
(44, '2024-04-29', 0, 0, NULL, 1),
(45, '2024-04-29', 0, 0, NULL, 1),
(46, '2024-04-29', 0, 0, NULL, 1),
(47, '2024-04-29', 0, 0, NULL, NULL),
(48, '2024-04-29', 0, 0, NULL, NULL),
(49, '2024-04-29', 0, 0, NULL, NULL),
(50, '2024-04-29', 0, 0, NULL, 2),
(51, '2024-04-29', 0, 0, NULL, 2),
(52, '2024-04-29', 0, 0, NULL, 2),
(53, '2024-04-29', 1, 0, NULL, 2),
(54, '2024-04-29', 1, 0, NULL, 2),
(55, '2024-04-29', 1, 0, NULL, 2),
(56, '2024-04-29', 1, 0, 22, 1),
(57, '2024-04-29', 1, 0, NULL, 2),
(58, '2024-04-29', 1, 0, NULL, 4),
(59, '2024-04-29', 1, 0, NULL, 4),
(60, '2024-04-29', 1, 0, NULL, 3),
(61, '2024-04-29', 1, 0, NULL, 3),
(62, '2024-04-29', 0, 0, NULL, 3),
(63, '2024-04-29', 0, 0, NULL, NULL),
(64, '2024-04-29', 1, 0, NULL, 1),
(65, '2024-04-29', 1, 0, NULL, 1),
(66, '2024-04-29', 1, 0, NULL, 1),
(67, '2024-04-29', 1, 0, NULL, 1),
(68, '2024-04-29', 1, 0, NULL, 1),
(69, '2024-04-29', 1, 0, NULL, 1),
(70, '2024-04-29', 1, 0, NULL, 1),
(71, '2024-04-29', 1, 0, NULL, 1),
(72, '2024-04-29', 1, 0, NULL, 1),
(73, '2024-04-29', 1, 0, NULL, 1),
(74, '2024-04-29', 1, 0, NULL, 1),
(75, '2024-04-29', 1, 0, NULL, 1),
(76, '2024-04-30', 1, 0, NULL, 3),
(77, '2024-04-30', 1, 0, NULL, 3),
(78, '2024-04-30', 0, 0, NULL, 2),
(79, '2024-04-30', 0, 0, NULL, 2),
(80, '2024-04-30', 0, 0, NULL, NULL),
(81, '2024-04-30', 0, 0, NULL, NULL),
(82, '2024-04-30', 0, 0, NULL, NULL),
(83, '2024-04-30', 0, 0, NULL, NULL),
(84, '2024-04-30', 1, 0, NULL, 2),
(85, '2024-04-30', 1, 0, NULL, 2),
(86, '2024-04-30', 1, 0, NULL, 2),
(87, '2024-04-30', 1, 0, NULL, 2),
(88, '2024-04-30', 1, 0, NULL, 2),
(89, '2024-04-30', 1, 0, NULL, 2),
(90, '2024-04-30', 1, 0, NULL, 2),
(91, '2024-04-30', 1, 0, NULL, 2),
(92, '2024-04-30', 1, 0, NULL, 2),
(93, '2024-04-30', 1, 0, NULL, 2),
(94, '2024-04-30', 1, 0, NULL, 2),
(95, '2024-04-30', 1, 0, NULL, 2),
(96, '2024-04-30', 1, 0, NULL, 2),
(97, '2024-04-30', 1, 0, NULL, 2),
(98, '2024-04-30', 1, 0, NULL, 2),
(99, '2024-04-30', 1, 0, NULL, 2),
(100, '2024-04-30', 1, 0, NULL, 2),
(101, '2024-04-30', 1, 0, NULL, 2),
(102, '2024-04-30', 1, 0, NULL, 2),
(103, '2024-04-30', 1, 0, NULL, 2),
(104, '2024-04-30', 1, 0, NULL, 2),
(105, '2024-04-30', 1, 0, NULL, 3),
(106, '2024-04-30', 0, 0, NULL, 1),
(107, '2024-04-30', 0, 0, NULL, 4),
(108, '2024-04-30', 1, 0, NULL, 1),
(109, '2024-04-30', 1, 0, NULL, 1),
(110, '2024-04-30', 1, 0, NULL, 2),
(111, '2024-04-30', 0, 0, NULL, NULL),
(112, '2024-04-30', 0, 0, NULL, NULL),
(113, '2024-04-30', 1, 0, 32, 1),
(114, '2024-04-30', 0, 0, NULL, 2),
(115, '2024-04-30', 1, 0, NULL, 1),
(116, '2024-04-30', 1, 0, NULL, 1),
(117, '2024-04-30', 1, 0, NULL, 1),
(118, '2024-04-30', 1, 0, NULL, 1),
(119, '2024-04-30', 1, 0, NULL, 1),
(120, '2024-04-30', 1, 0, NULL, 1);

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
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `dishId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `dishmenuingredient`
--
ALTER TABLE `dishmenuingredient`
  MODIFY `dishingredientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=408;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `ingredientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `locationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menuingredient`
--
ALTER TABLE `menuingredient`
  MODIFY `menuIngredientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `menuItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

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
