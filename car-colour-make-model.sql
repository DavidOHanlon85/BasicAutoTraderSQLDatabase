-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 03, 2024 at 04:04 PM
-- Server version: 8.0.35
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car-colour-make-model`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int NOT NULL,
  `colour_id` int NOT NULL,
  `model_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `colour_id`, `model_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `colour`
--

CREATE TABLE `colour` (
  `colour_id` int NOT NULL,
  `colour` varchar(255) NOT NULL,
  `colour_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `colour`
--

INSERT INTO `colour` (`colour_id`, `colour`, `colour_description`) VALUES
(1, 'Green', '-'),
(2, 'Red', '-'),
(3, 'White', ''),
(4, 'Yellow', '');

-- --------------------------------------------------------

--
-- Table structure for table `make`
--

CREATE TABLE `make` (
  `make_id` int NOT NULL,
  `make` varchar(255) NOT NULL,
  `make_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `make`
--

INSERT INTO `make` (`make_id`, `make`, `make_description`) VALUES
(1, 'Aston Martin', ''),
(2, 'VW', '');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `model_id` int NOT NULL,
  `model` varchar(255) NOT NULL,
  `make_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`model_id`, `model`, `make_id`) VALUES
(1, 'DB9', 1),
(2, 'Vantage', 1),
(3, 'Caddy', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `FK_colour_colour_id` (`colour_id`),
  ADD KEY `FK_model_model_id` (`model_id`);

--
-- Indexes for table `colour`
--
ALTER TABLE `colour`
  ADD PRIMARY KEY (`colour_id`);

--
-- Indexes for table `make`
--
ALTER TABLE `make`
  ADD PRIMARY KEY (`make_id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `FK_make_make_id` (`make_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `colour`
--
ALTER TABLE `colour`
  MODIFY `colour_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `make`
--
ALTER TABLE `make`
  MODIFY `make_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `model_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `FK_colour_colour_id` FOREIGN KEY (`colour_id`) REFERENCES `colour` (`colour_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_model_model_id` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `FK_make_make_id` FOREIGN KEY (`make_id`) REFERENCES `make` (`make_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
