-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2018 at 06:01 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelskerezervacije`
--

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `Id` int(11) NOT NULL,
  `Naziv` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`Id`, `Naziv`) VALUES
(1, 'Nemacki');

-- --------------------------------------------------------

--
-- Table structure for table `klijenti`
--

CREATE TABLE `klijenti` (
  `Id` int(11) NOT NULL,
  `Ime` varchar(30) NOT NULL,
  `Prezime` varchar(30) NOT NULL,
  `KIme` varchar(30) NOT NULL,
  `Sifra` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Telefon` varchar(50) NOT NULL,
  `Adresa` varchar(50) NOT NULL,
  `Grad` varchar(30) NOT NULL,
  `Drzava` varchar(30) NOT NULL,
  `Poeni` varchar(30) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `PostanskiBroj` varchar(10) NOT NULL,
  `RolaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `klijenti`
--

INSERT INTO `klijenti` (`Id`, `Ime`, `Prezime`, `KIme`, `Sifra`, `Email`, `Telefon`, `Adresa`, `Grad`, `Drzava`, `Poeni`, `HotelID`, `PostanskiBroj`, `RolaID`) VALUES
(118, 'Bice Zemlja', '', 'Amerika', 'Engleskas', 'ilhandeveloper@gmail.com', '+3826815514', 'Savnicka 26', 'Belgrade', 'Srbija', '0.0', 1, '512132', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Id` int(11) NOT NULL,
  `Naziv` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Id`, `Naziv`) VALUES
(1, 'Klijent'),
(2, 'Administrator'),
(3, 'Menadžer hotela');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `Id` int(11) NOT NULL,
  `Ime` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`Id`, `Ime`) VALUES
(2, 'djesi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `klijenti`
--
ALTER TABLE `klijenti`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `KIme` (`KIme`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `HotelID` (`HotelID`),
  ADD KEY `RolaID` (`RolaID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `klijenti`
--
ALTER TABLE `klijenti`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `klijenti`
--
ALTER TABLE `klijenti`
  ADD CONSTRAINT `klijenti_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `klijenti_ibfk_2` FOREIGN KEY (`RolaID`) REFERENCES `role` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
