-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2022 at 09:18 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scrabble`
--
CREATE DATABASE IF NOT EXISTS `scrabble` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `scrabble`;

-- --------------------------------------------------------

--
-- Table structure for table `game`
--
-- Creation: Mar 11, 2022 at 01:38 PM
--

CREATE TABLE `game` (
  `gameID` int(11) UNSIGNED NOT NULL,
  `winner` int(11) UNSIGNED NOT NULL,
  `loser` int(11) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `game`:
--   `loser`
--       `member` -> `memberID`
--   `winner`
--       `member` -> `memberID`
--

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`gameID`, `winner`, `loser`, `location`) VALUES
(1, 2, 1, 'Leeds'),
(2, 1, 3, 'Bradford');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--
-- Creation: Mar 11, 2022 at 01:50 PM
-- Last update: Mar 18, 2022 at 08:16 PM
--

CREATE TABLE `member` (
  `memberID` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `address` varchar(255) NOT NULL,
  `dateJoined` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `member`:
--

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberID`, `name`, `dob`, `phone`, `email`, `address`, `dateJoined`) VALUES
(1, 'Laura Clark', '2002-09-09', '01274565656', 'laura2@outlook.com', '4120 Freidrich Ln.', '2020-01-02'),
(2, 'Sara Jane', '1999-02-02', '01274565656', 'sjane2@outlook.com', '4120 Freidrich Ln.', '2020-02-02'),
(3, 'Alice Smith', '1997-02-03', '01274565656', 'smith182@outlook.com', '4120 Freidrich Ln.', '2020-02-02'),
(4, 'an smith', '1971-07-18', '746714444', 'ann@outlook.com', '123 circle lane', '0000-00-00'),
(5, 'an smith', '2020-06-10', '746714444', 'ann@outlook.com', '123 circle lane', '0000-00-00'),
(6, 'Ola Newman', '1955-04-29', '0746714454', 'ola@outlook.com', '123 squire lane', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--
-- Creation: Mar 11, 2022 at 01:46 PM
--

CREATE TABLE `scores` (
  `scoreID` int(10) UNSIGNED NOT NULL,
  `memberID` int(10) UNSIGNED NOT NULL,
  `gameID` int(11) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `scores`:
--   `gameID`
--       `game` -> `gameID`
--   `memberID`
--       `member` -> `memberID`
--

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`scoreID`, `memberID`, `gameID`, `score`) VALUES
(1, 2, 1, 10),
(2, 1, 1, 8),
(3, 1, 2, 20),
(4, 3, 2, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`gameID`),
  ADD KEY `winner` (`winner`),
  ADD KEY `loser` (`loser`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`memberID`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`scoreID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `gameID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `memberID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `scoreID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `loser` FOREIGN KEY (`loser`) REFERENCES `member` (`memberID`),
  ADD CONSTRAINT `winner` FOREIGN KEY (`winner`) REFERENCES `member` (`memberID`);

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `gameID` FOREIGN KEY (`gameID`) REFERENCES `game` (`gameID`),
  ADD CONSTRAINT `memberID` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
