-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 05 Paź 2016, 08:24
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `twarzoksiazka`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE IF NOT EXISTS `firma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` text COLLATE utf8_polish_ci NOT NULL,
  `ulica` text COLLATE utf8_polish_ci,
  `numer` text COLLATE utf8_polish_ci,
  `kodPoczt` text COLLATE utf8_polish_ci,
  `idMiasta` int(11),
  `dataZatr` date,
  `liczbaPracow` int(11) NOT NULL,
  `przychod` int(11) NOT NULL,
  `aktywny` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`idMiasta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `comments`
--
INSERT INTO `firma` (`id`, `nazwa`, `ulica`, `numer`, `kodPoczt`, `idMiasta`, `dataZatr`, `liczbaPracow`, `przychod`, `aktywny`) VALUES
(1,'Casio','Akacjowa','10','56-621',5,'1993-03-18',1000,145000,1),
(2,'Kawasaki','Brzozowa','12/5','69-586',3,'2001-05-25',530,596000,1),
(3,'Prada','Holenderska','18B','59-100',4,'1982-03-17',1350,120000,1),
(4,'Nokia','Trójkątna','16/9','68-487',5,'2005-08-19',800,65000,1),
(5,'Tesco','Lipowa','56','36-895',2,'2008-12-12',450,89000,1),
(6,'Shell','Niedźwiedzia','12','47-895',3,'1999-10-30',1100,19000,1),
(7,'Pepsi','Hłaski','84','56-156',NULL,'2011-05-13',790,300000,1),
(8,'Lenovo Group','Grecka','129','69-895',4,'2008-01-19',900,78000,0),
(9,'Kyocera','NULL','15/85','54-785',2,'1999-01-24',1500,12000,1),
(10,'Motorola','Lotnicza','12B/5','78-695',5,NULL,2000,36000,1),
(11,'Xerox','Topolowa','13','56-469',1,'2004-09-09',1700,69000,1),
(12,'Phillips','Słowiańska','54','65-916',NULL,'2000-09-28',850,80000,1),
(13,'Red Hat','Brzozowa','1','54-608',1,'1998-08-31',290,29000,1),
(14,'Skanska','Lotnicza','17A/8','63-896',4,'2010-02-14',670,47000,0),
(15,'Vodafone','Rodziewiczówny','26','75-962',3,NULL,800,19000,1),
(16,'Yamaha','Kolista','53','75-647',3,'1980-07-14',1350,299000,1),
(17,'Twitter','Sosnowa','18/6','68-954',5,'2013-01-15',1900,48000,1);

-- --------------------------------------------------------