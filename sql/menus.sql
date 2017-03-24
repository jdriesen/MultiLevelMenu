-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2016 at 11:44 AM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `sequence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `name`, `sequence`) VALUES
(1, 0, 'Level 1', 1),
(2, 1, 'Level 1.1', 1),
(3, 2, 'Level 1.1.1', 1),
(4, 3, 'Level 1.1.1.1', 1),
(5, 3, 'Level 1.1.1.2', 2),
(6, 1, 'Level 1.2', 2),
(7, 6, 'Level 1.2.1', 1),
(8, 0, 'Level 2', 2),
(9, 0, 'Level 3', 3),
(10, 9, 'Level 3.1', 1),
(11, 9, 'Level 3.2', 2),
(12, 11, 'Level 3.2.1', 1),
(13, 6, 'Level 1.2.3', 3),
(14, 6, 'Level 1.2.2', 2),
(15, 0, 'Level 5', 5),
(16, 0, 'Level 4', 4),
(17, 8, 'Level 2.3', 3),
(18, 8, 'Level 2.2', 2),
(19, 8, 'Level 2.1', 1),
(20, 14, 'Level 1.2.2.1', 1),
(21, 14, 'Level 1.2.2.3', 3),
(22, 14, 'Level 1.2.2.4', 4),
(23, 14, 'Level 1.2.2.2', 2),
(24, 21, 'Level 1.2.2.3.2', 2),
(25, 21, 'Level 1.2.2.3.1', 1),
(26, 21, 'Level 1.2.2.3.3', 3),
(27, 15, 'Level 5.1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;