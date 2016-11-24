-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 02 Lis 2016, 19:00
-- Wersja serwera: 10.1.9-MariaDB
-- Wersja PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `abd8`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `city`
--

CREATE TABLE `city` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `city`
--

INSERT INTO `city` (`Id`, `Name`) VALUES
(1, 'New York'),
(2, 'Warsaw'),
(3, 'London'),
(4, 'Paris'),
(5, 'Venice');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `department`
--

CREATE TABLE `department` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `ManagerId` int(11) DEFAULT NULL,
  `CityId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `department`
--

INSERT INTO `department` (`Id`, `Name`, `ManagerId`, `CityId`) VALUES
(1, 'IT', 5, 2),
(2, 'Accounting', 4, NULL),
(3, 'HR', 8, 2),
(4, 'Marketing', 3, 1),
(5, 'Controlling', 11, 3),
(6, 'Data Warehouse', 5, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `employee`
--

CREATE TABLE `employee` (
  `Id` int(11) NOT NULL,
  `FirstName` text COLLATE utf8_polish_ci NOT NULL,
  `SecondName` text COLLATE utf8_polish_ci,
  `LastName` text COLLATE utf8_polish_ci,
  `Gender` varchar(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Salary` decimal(6,2) DEFAULT NULL,
  `DepartmentId` int(11) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `RelieveDate` date DEFAULT NULL,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `employee`
--

INSERT INTO `employee` (`Id`, `FirstName`, `SecondName`, `LastName`, `Gender`, `BirthDate`, `Salary`, `DepartmentId`, `HireDate`, `RelieveDate`, `Active`) VALUES
(1, 'Mary', NULL, 'Smith', 'W', '1985-12-18', '2000.00', 1, '2011-05-06', NULL, 1),
(2, 'Paul', 'George', 'Johnson', 'M', '1990-01-13', '1500.00', 3, '2011-10-29', NULL, 1),
(3, 'Patricia', NULL, 'Wilson', 'W', '1995-05-28', '1000.00', 4, '2012-01-24', '2013-11-25', 0),
(4, 'Linda', 'Lisa', 'Brown', 'W', '1983-07-11', '2700.00', 2, '2012-06-15', NULL, 1),
(5, 'Johnatan', NULL, 'Davis', 'M', '1978-01-24', '1200.00', 1, '2013-01-15', NULL, 1),
(6, 'John', NULL, 'Miller', NULL, '1993-10-20', '2000.00', 4, '2013-03-27', '2014-10-06', 0),
(7, 'Elizabeth', 'Dorothy', 'Taylor', 'W', '1992-09-09', '2110.00', 1, '2013-05-01', NULL, 1),
(8, 'James', NULL, 'Wilson', 'M', '1978-03-19', '1000.00', 3, '2013-10-09', '2014-03-01', 1),
(9, 'Robert', NULL, 'Anderson', 'M', '1989-12-13', '2900.00', 2, '2013-12-20', '2014-05-05', 0),
(10, 'John', 'Mark', 'Smith', 'W', '1990-05-24', '2500.00', 1, '2014-01-24', NULL, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `formeremployee`
--

CREATE TABLE `formeremployee` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `SecondName` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `LastName` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `Gender` varchar(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Salary` decimal(6,2) DEFAULT NULL,
  `DepartmentId` int(11) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `RelieveDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `formeremployee`
--

INSERT INTO `formeremployee` (`Id`, `FirstName`, `SecondName`, `LastName`, `Gender`, `BirthDate`, `Salary`, `DepartmentId`, `HireDate`, `RelieveDate`) VALUES
(6, 'John', NULL, 'Miller', 'W', '1993-10-20', '2000.00', 4, '2013-03-27', '2014-10-06'),
(11, 'Ann', NULL, 'Pritchett', 'M', '1980-05-21', '2400.00', 6, '2014-01-05', '2015-02-01');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`CityId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`DepartmentId`);

--
-- Indexes for table `formeremployee`
--
ALTER TABLE `formeremployee`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`DepartmentId`),
  ADD KEY `DepartmentId` (`DepartmentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `city`
--
ALTER TABLE `city`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `department`
--
ALTER TABLE `department`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT dla tabeli `employee`
--
ALTER TABLE `employee`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT dla tabeli `formeremployee`
--
ALTER TABLE `formeremployee`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`CityId`) REFERENCES `city` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `formeremployee`
--
ALTER TABLE `formeremployee`
  ADD CONSTRAINT `formeremployee_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
