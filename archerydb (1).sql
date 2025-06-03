-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2025 at 08:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `archerydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `agecategory`
--

CREATE TABLE `agecategory` (
  `AgeCategoryID` int(11) NOT NULL,
  `AgeCategory` varchar(50) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agecategory`
--

INSERT INTO `agecategory` (`AgeCategoryID`, `AgeCategory`, `Description`) VALUES
(1, 'Open', 'All ages (default open category)'),
(2, '50+', 'Age 50 and over'),
(3, '60+', 'Age 60 and over'),
(4, '70+', 'Age 70 and over'),
(5, 'Under 21', 'Under 21 years old'),
(6, 'Under 18', 'Under 18 years old'),
(7, 'Under 16', 'Under 16 years old'),
(8, 'Under 14', 'Under 14 years old');

-- --------------------------------------------------------

--
-- Table structure for table `archer`
--

CREATE TABLE `archer` (
  `ArcherID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` enum('Male','Female') DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `CategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `archer`
--

INSERT INTO `archer` (`ArcherID`, `FirstName`, `LastName`, `Age`, `Gender`, `DOB`, `Address`, `CategoryID`) VALUES
(1, 'kjkjh', 'hjhj', 5, 'Male', '2025-05-21', '9978', 1),
(2, 'heu', 'huh', 65, 'Female', '2025-05-22', 'hjhj', 1),
(3, 'kjkjhfsdfsdf', 'klklklklklkl', NULL, '', '2025-05-06', NULL, 20),
(4, 'yallo', 'sello', NULL, '', '2025-05-20', NULL, 20),
(5, 'heu', 'wewe', NULL, '', '2025-05-22', NULL, 20);

-- --------------------------------------------------------

--
-- Table structure for table `arrowbyarrowscore`
--

CREATE TABLE `arrowbyarrowscore` (
  `ArrowScoreID` int(11) NOT NULL,
  `RangeNo` int(11) NOT NULL,
  `EndNo` int(11) NOT NULL,
  `Value` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `arrowbyarrowscore`
--

INSERT INTO `arrowbyarrowscore` (`ArrowScoreID`, `RangeNo`, `EndNo`, `Value`) VALUES
(0, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `DivisionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `ClassID`, `DivisionID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 1),
(7, 2, 2),
(8, 2, 3),
(9, 2, 4),
(10, 2, 5),
(11, 3, 1),
(12, 3, 2),
(13, 3, 3),
(14, 3, 4),
(15, 3, 5),
(16, 4, 1),
(17, 4, 2),
(18, 4, 3),
(19, 4, 4),
(20, 4, 5),
(21, 5, 1),
(22, 5, 2),
(23, 5, 3),
(24, 5, 4),
(25, 5, 5),
(26, 6, 1),
(27, 6, 2),
(28, 6, 3),
(29, 6, 4),
(30, 6, 5),
(31, 7, 1),
(32, 7, 2),
(33, 7, 3),
(34, 7, 4),
(35, 7, 5),
(36, 8, 1),
(37, 8, 2),
(38, 8, 3),
(39, 8, 4),
(40, 8, 5),
(41, 9, 1),
(42, 9, 2),
(43, 9, 3),
(44, 9, 4),
(45, 9, 5),
(46, 10, 1),
(47, 10, 2),
(48, 10, 3),
(49, 10, 4),
(50, 10, 5),
(51, 11, 1),
(52, 11, 2),
(53, 11, 3),
(54, 11, 4),
(55, 11, 5),
(56, 12, 1),
(57, 12, 2),
(58, 12, 3),
(59, 12, 4),
(60, 12, 5),
(61, 13, 1),
(62, 13, 2),
(63, 13, 3),
(64, 13, 4),
(65, 13, 5),
(66, 14, 1),
(67, 14, 2),
(68, 14, 3),
(69, 14, 4),
(70, 14, 5),
(71, 15, 1),
(72, 15, 2),
(73, 15, 3),
(74, 15, 4),
(75, 15, 5),
(76, 16, 1),
(77, 16, 2),
(78, 16, 3),
(79, 16, 4),
(80, 16, 5);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `ClassID` int(11) NOT NULL,
  `AgeCategoryID` int(11) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`ClassID`, `AgeCategoryID`, `Gender`) VALUES
(1, 1, 'Male'),
(2, 1, 'Female'),
(3, 2, 'Male'),
(4, 2, 'Female'),
(5, 3, 'Male'),
(6, 3, 'Female'),
(7, 4, 'Male'),
(8, 4, 'Female'),
(9, 5, 'Male'),
(10, 5, 'Female'),
(11, 6, 'Male'),
(12, 6, 'Female'),
(13, 7, 'Male'),
(14, 7, 'Female'),
(15, 8, 'Male'),
(16, 8, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `clubchampionship`
--

CREATE TABLE `clubchampionship` (
  `ChampionshipID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clubchampionship`
--

INSERT INTO `clubchampionship` (`ChampionshipID`, `Name`, `Description`) VALUES
(1, 'testchamp', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `competition`
--

CREATE TABLE `competition` (
  `CompetitionID` int(11) NOT NULL,
  `CompetitionName` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Date` date NOT NULL,
  `ChampionshipID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `competition`
--

INSERT INTO `competition` (`CompetitionID`, `CompetitionName`, `Description`, `Date`, `ChampionshipID`) VALUES
(5, 'archer', 'archer', '2025-05-29', 1),
(6, 'testing champ', 'sdsfsdfsdf', '2025-05-14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `DivisionID` int(11) NOT NULL,
  `EquipmentID` int(11) NOT NULL,
  `Description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`DivisionID`, `EquipmentID`, `Description`) VALUES
(1, 1, 'Recurve'),
(2, 2, 'Compound'),
(3, 3, 'Recurve Barebow'),
(4, 4, 'Compound Barebow'),
(5, 5, 'Longbow');

-- --------------------------------------------------------

--
-- Table structure for table `end`
--

CREATE TABLE `end` (
  `EndID` int(11) NOT NULL,
  `RangesID` int(11) NOT NULL,
  `SequenceNumber` int(11) NOT NULL,
  `TotalEndScore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `end`
--

INSERT INTO `end` (`EndID`, `RangesID`, `SequenceNumber`, `TotalEndScore`) VALUES
(61, 1, 1, 55),
(62, 1, 2, 48),
(63, 1, 3, 52),
(64, 2, 1, 60),
(65, 2, 2, 57),
(66, 3, 1, 65),
(67, 3, 2, 59),
(68, 4, 1, 70),
(69, 4, 2, 66),
(70, 5, 1, 50),
(71, 5, 2, 54),
(72, 6, 1, 62);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `EquipmentID` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`EquipmentID`, `Type`) VALUES
(1, 'Recurve'),
(2, 'Compound'),
(3, 'Recurve Barebow'),
(4, 'Compound Barebow'),
(5, 'Longbow');

-- --------------------------------------------------------

--
-- Table structure for table `ranges`
--

CREATE TABLE `ranges` (
  `RangesID` int(11) NOT NULL,
  `RoundID` int(11) NOT NULL,
  `Distance` int(11) NOT NULL,
  `NumberOfEnds` int(11) NOT NULL,
  `TargetFaceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ranges`
--

INSERT INTO `ranges` (`RangesID`, `RoundID`, `Distance`, `NumberOfEnds`, `TargetFaceID`) VALUES
(11, 1, 20, 6, 1),
(12, 1, 30, 4, 2),
(13, 2, 50, 12, 3),
(14, 2, 40, 8, 1),
(15, 3, 18, 6, 5),
(16, 3, 25, 6, 6),
(17, 4, 60, 12, 4),
(18, 4, 70, 8, 7),
(19, 5, 15, 4, 1),
(20, 5, 20, 6, 9),
(21, 1, 20, 6, 1),
(22, 1, 30, 4, 2),
(23, 2, 50, 12, 3),
(24, 2, 40, 8, 1),
(25, 3, 18, 6, 5),
(26, 3, 25, 6, 6),
(27, 1, 20, 6, 1),
(28, 1, 30, 4, 2),
(29, 2, 50, 12, 3),
(30, 2, 40, 8, 1),
(31, 3, 18, 6, 5),
(32, 3, 25, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `round`
--

CREATE TABLE `round` (
  `RoundID` int(11) NOT NULL,
  `RoundName` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `round`
--

INSERT INTO `round` (`RoundID`, `RoundName`, `Description`) VALUES
(1, 'round1', ''),
(2, 'test', ''),
(3, 'round test', 'Fiverr client #FO313BD6050C3'),
(4, 'Round 1', 'Description 1'),
(5, 'Round 2', 'Description 2'),
(6, 'Round 3', 'Description 3'),
(7, 'Round 4', 'Description 4'),
(8, 'Round 5', 'Description 5'),
(9, 'round testfddfdfj', 'ssdfdf'),
(10, 'm dfm smf', 'ndfsdbf');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `ScoreID` int(11) NOT NULL,
  `ArcherID` int(11) NOT NULL,
  `RoundID` int(11) NOT NULL,
  `CompetitionID` int(11) DEFAULT NULL,
  `Score` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `IsFinalized` tinyint(1) DEFAULT 0,
  `IsPractice` tinyint(1) DEFAULT 0,
  `ScoreApprovalStatus` enum('Pending','Approved','Rejected') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`ScoreID`, `ArcherID`, `RoundID`, `CompetitionID`, `Score`, `Date`, `Time`, `IsFinalized`, `IsPractice`, `ScoreApprovalStatus`) VALUES
(1, 1, 1, 5, 55, '2025-05-22', '14:31:00', 1, 0, 'Approved'),
(2, 2, 2, 5, 56, '2025-05-21', '14:30:00', 0, 0, 'Pending'),
(3, 1, 2, 5, 4545, '2025-05-20', '14:43:00', 0, 1, 'Pending'),
(4, 1, 2, 5, 5656, '2025-05-14', '14:00:00', 1, 1, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `stagingscore`
--

CREATE TABLE `stagingscore` (
  `StagingID` int(11) NOT NULL,
  `ArcherID` int(11) NOT NULL,
  `RoundID` int(11) NOT NULL,
  `Score` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `IsProcessed` tinyint(1) DEFAULT 0,
  `IsPracticeScore` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stagingscore`
--

INSERT INTO `stagingscore` (`StagingID`, `ArcherID`, `RoundID`, `Score`, `Date`, `Time`, `IsProcessed`, `IsPracticeScore`) VALUES
(1, 1, 3, 25, '2025-05-15', '22:40:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `targetface`
--

CREATE TABLE `targetface` (
  `TargetFaceID` int(11) NOT NULL,
  `Size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `targetface`
--

INSERT INTO `targetface` (`TargetFaceID`, `Size`) VALUES
(1, 40),
(2, 60),
(3, 80),
(4, 122),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agecategory`
--
ALTER TABLE `agecategory`
  ADD PRIMARY KEY (`AgeCategoryID`);

--
-- Indexes for table `archer`
--
ALTER TABLE `archer`
  ADD PRIMARY KEY (`ArcherID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `arrowbyarrowscore`
--
ALTER TABLE `arrowbyarrowscore`
  ADD PRIMARY KEY (`ArrowScoreID`,`RangeNo`,`EndNo`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `ClassID` (`ClassID`),
  ADD KEY `DivisionID` (`DivisionID`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`ClassID`),
  ADD KEY `AgeCategoryID` (`AgeCategoryID`);

--
-- Indexes for table `clubchampionship`
--
ALTER TABLE `clubchampionship`
  ADD PRIMARY KEY (`ChampionshipID`);

--
-- Indexes for table `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`CompetitionID`),
  ADD KEY `ChampionshipID` (`ChampionshipID`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`DivisionID`),
  ADD KEY `EquipmentID` (`EquipmentID`);

--
-- Indexes for table `end`
--
ALTER TABLE `end`
  ADD PRIMARY KEY (`EndID`),
  ADD KEY `RangesID` (`RangesID`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`EquipmentID`);

--
-- Indexes for table `ranges`
--
ALTER TABLE `ranges`
  ADD PRIMARY KEY (`RangesID`),
  ADD KEY `RoundID` (`RoundID`),
  ADD KEY `TargetFaceID` (`TargetFaceID`);

--
-- Indexes for table `round`
--
ALTER TABLE `round`
  ADD PRIMARY KEY (`RoundID`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`ScoreID`),
  ADD KEY `ArcherID` (`ArcherID`),
  ADD KEY `RoundID` (`RoundID`),
  ADD KEY `CompetitionID` (`CompetitionID`);

--
-- Indexes for table `stagingscore`
--
ALTER TABLE `stagingscore`
  ADD PRIMARY KEY (`StagingID`),
  ADD KEY `ArcherID` (`ArcherID`),
  ADD KEY `RoundID` (`RoundID`);

--
-- Indexes for table `targetface`
--
ALTER TABLE `targetface`
  ADD PRIMARY KEY (`TargetFaceID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agecategory`
--
ALTER TABLE `agecategory`
  MODIFY `AgeCategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `archer`
--
ALTER TABLE `archer`
  MODIFY `ArcherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `clubchampionship`
--
ALTER TABLE `clubchampionship`
  MODIFY `ChampionshipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `competition`
--
ALTER TABLE `competition`
  MODIFY `CompetitionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `DivisionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `end`
--
ALTER TABLE `end`
  MODIFY `EndID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `EquipmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ranges`
--
ALTER TABLE `ranges`
  MODIFY `RangesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `round`
--
ALTER TABLE `round`
  MODIFY `RoundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `ScoreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stagingscore`
--
ALTER TABLE `stagingscore`
  MODIFY `StagingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `targetface`
--
ALTER TABLE `targetface`
  MODIFY `TargetFaceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `archer`
--
ALTER TABLE `archer`
  ADD CONSTRAINT `archer_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`),
  ADD CONSTRAINT `category_ibfk_2` FOREIGN KEY (`DivisionID`) REFERENCES `division` (`DivisionID`);

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`AgeCategoryID`) REFERENCES `agecategory` (`AgeCategoryID`);

--
-- Constraints for table `competition`
--
ALTER TABLE `competition`
  ADD CONSTRAINT `competition_ibfk_1` FOREIGN KEY (`ChampionshipID`) REFERENCES `clubchampionship` (`ChampionshipID`);

--
-- Constraints for table `division`
--
ALTER TABLE `division`
  ADD CONSTRAINT `division_ibfk_1` FOREIGN KEY (`EquipmentID`) REFERENCES `equipment` (`EquipmentID`);

--
-- Constraints for table `end`
--
ALTER TABLE `end`
  ADD CONSTRAINT `end_ibfk_1` FOREIGN KEY (`RangesID`) REFERENCES `ranges` (`RangesID`);

--
-- Constraints for table `ranges`
--
ALTER TABLE `ranges`
  ADD CONSTRAINT `ranges_ibfk_1` FOREIGN KEY (`RoundID`) REFERENCES `round` (`RoundID`),
  ADD CONSTRAINT `ranges_ibfk_2` FOREIGN KEY (`TargetFaceID`) REFERENCES `targetface` (`TargetFaceID`);

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`ArcherID`) REFERENCES `archer` (`ArcherID`),
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`RoundID`) REFERENCES `round` (`RoundID`),
  ADD CONSTRAINT `score_ibfk_3` FOREIGN KEY (`CompetitionID`) REFERENCES `competition` (`CompetitionID`);

--
-- Constraints for table `stagingscore`
--
ALTER TABLE `stagingscore`
  ADD CONSTRAINT `stagingscore_ibfk_1` FOREIGN KEY (`ArcherID`) REFERENCES `archer` (`ArcherID`),
  ADD CONSTRAINT `stagingscore_ibfk_2` FOREIGN KEY (`RoundID`) REFERENCES `round` (`RoundID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
