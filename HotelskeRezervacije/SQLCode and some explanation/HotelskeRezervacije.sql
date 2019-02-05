-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2019 at 08:19 PM
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
  `Naziv` varchar(30) NOT NULL,
  `Drzava` varchar(30) NOT NULL,
  `Grad` varchar(30) NOT NULL,
  `Adresa` varchar(30) NOT NULL,
  `BrojZvezdica` smallint(30) NOT NULL,
  `Fotografija` longblob NOT NULL,
  `Opis` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `Poeni` int(30) NOT NULL,
  `PostanskiBroj` varchar(10) NOT NULL,
  `RolaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `klijenti`
--

INSERT INTO `klijenti` (`Id`, `Ime`, `Prezime`, `KIme`, `Sifra`, `Email`, `Telefon`, `Adresa`, `Grad`, `Drzava`, `Poeni`, `PostanskiBroj`, `RolaID`) VALUES
(143, 'Neko', 'Nesto', 'admin', 'admin', 'admin', 'admin@gmail.com', '06666666', 'Neka', 'Tanzanija', 9100, '1111', 2);

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
  ADD KEY `RolaID` (`RolaID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `klijenti`
--
ALTER TABLE `klijenti`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `klijenti`
--
ALTER TABLE `klijenti`
  ADD CONSTRAINT `klijenti_ibfk_2` FOREIGN KEY (`RolaID`) REFERENCES `role` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `BrisanjeNeplacenihRezervacija` ON SCHEDULE EVERY 1 HOUR STARTS '2019-02-05 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO delete from rezervacije where statusrezervacije = 0$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
