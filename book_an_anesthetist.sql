-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2020 at 08:30 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book an anesthetist`
--

-- --------------------------------------------------------

--
-- Table structure for table `anesthetist`
--

CREATE TABLE `anesthetist` (
  `anesthetistID` int(100) NOT NULL,
  `name` varchar(11) NOT NULL,
  `surname` varchar(11) NOT NULL,
  `disciplinaryID` int(11) NOT NULL,
  `yearOfExperience` int(11) NOT NULL,
  `areaID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `provID` int(100) NOT NULL,
  `areaID` varchar(100) NOT NULL,
  `areaName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking table`
--

CREATE TABLE `booking table` (
  `bookingID` int(100) NOT NULL,
  `reqID` int(100) NOT NULL,
  `reqTime` datetime NOT NULL,
  `reqMedicalPractitioner` varchar(100) NOT NULL,
  `reqHospital` int(100) NOT NULL,
  `anesthetistID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disciplinary`
--

CREATE TABLE `disciplinary` (
  `discID` varchar(100) NOT NULL,
  `discName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospitalID` varchar(100) NOT NULL,
  `hospiName` varchar(100) NOT NULL,
  `areaID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `usernameID` varchar(100) NOT NULL,
  `password` int(10) NOT NULL,
  `anesthetistID` varchar(100) NOT NULL,
  `medicalPractitionerID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medical practitioner`
--

CREATE TABLE `medical practitioner` (
  `medicalPractitionerID` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `speciality` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `provID` varchar(100) NOT NULL,
  `provName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `speciality`
--

CREATE TABLE `speciality` (
  `specialityID` varchar(100) NOT NULL,
  `specialityName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anesthetist`
--
ALTER TABLE `anesthetist`
  ADD PRIMARY KEY (`anesthetistID`),
  ADD UNIQUE KEY `areaID` (`areaID`),
  ADD UNIQUE KEY `areaID_2` (`areaID`),
  ADD KEY `disciplinaryID` (`disciplinaryID`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`areaID`),
  ADD UNIQUE KEY `areaIndex` (`provID`);

--
-- Indexes for table `booking table`
--
ALTER TABLE `booking table`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `anesthetistID` (`anesthetistID`),
  ADD KEY `reqID` (`reqID`),
  ADD KEY `reqHospital` (`reqHospital`);

--
-- Indexes for table `disciplinary`
--
ALTER TABLE `disciplinary`
  ADD PRIMARY KEY (`discID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospitalID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`usernameID`);

--
-- Indexes for table `medical practitioner`
--
ALTER TABLE `medical practitioner`
  ADD PRIMARY KEY (`medicalPractitionerID`),
  ADD KEY `speciality` (`speciality`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`provID`);

--
-- Indexes for table `speciality`
--
ALTER TABLE `speciality`
  ADD PRIMARY KEY (`specialityID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anesthetist`
--
ALTER TABLE `anesthetist`
  MODIFY `anesthetistID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking table`
--
ALTER TABLE `booking table`
  MODIFY `bookingID` int(100) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anesthetist`
--
ALTER TABLE `anesthetist`
  ADD CONSTRAINT `anesthetist_ibfk_1` FOREIGN KEY (`areaID`) REFERENCES `anesthetist` (`anesthetistID`),
  ADD CONSTRAINT `anesthetist_ibfk_2` FOREIGN KEY (`disciplinaryID`) REFERENCES `anesthetist` (`anesthetistID`);

--
-- Constraints for table `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `area_ibfk_1` FOREIGN KEY (`provID`) REFERENCES `anesthetist` (`anesthetistID`);

--
-- Constraints for table `booking table`
--
ALTER TABLE `booking table`
  ADD CONSTRAINT `booking table_ibfk_1` FOREIGN KEY (`anesthetistID`) REFERENCES `booking table` (`bookingID`),
  ADD CONSTRAINT `booking table_ibfk_2` FOREIGN KEY (`reqID`) REFERENCES `booking table` (`bookingID`),
  ADD CONSTRAINT `booking table_ibfk_3` FOREIGN KEY (`reqHospital`) REFERENCES `booking table` (`bookingID`);

--
-- Constraints for table `medical practitioner`
--
ALTER TABLE `medical practitioner`
  ADD CONSTRAINT `medical practitioner_ibfk_1` FOREIGN KEY (`speciality`) REFERENCES `medical practitioner` (`medicalPractitionerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
