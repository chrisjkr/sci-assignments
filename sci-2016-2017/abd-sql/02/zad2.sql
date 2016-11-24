-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Wrz 2016, 14:48
-- Wersja serwera: 5.6.26
-- Wersja PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `zad2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adresy`
--

CREATE TABLE IF NOT EXISTS `adresy` (
  `adres_id` int(11) NOT NULL,
  `adres_ulica` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_miejscowosc` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_klient_id` int(11) DEFAULT NULL,
  `adres_typ` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `adresy`
--

INSERT INTO `adresy` (`adres_id`, `adres_ulica`, `adres_miejscowosc`, `adres_klient_id`, `adres_typ`) VALUES
(1, 'Małopolska', 'Szczecin', 1, 1),
(2, 'Mazurska', 'Szczecin ', 1, 2),
(3, 'Szczecińska', 'Gryfino', 2, 1),
(4, 'Dolna', 'Police', 3, 1),
(5, 'Zileona', 'Stargard', 4, 1),
(6, 'Morska', 'Wolin', 5, 1),
(7, 'Mazowiecka', 'Szczecin', 7, 1),
(8, 'Gwarna', 'Szczecin ', 5, 2),
(9, 'Poznańska', 'Gryfino', 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE IF NOT EXISTS `klienci` (
  `klient_id` int(11) NOT NULL,
  `klient_imie` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `klient_data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`klient_id`, `klient_imie`, `klient_data`) VALUES
(1, 'Krzysztof', '2010-12-12 00:00:00'),
(2, 'Adam', '2011-11-13 00:00:00'),
(3, 'Arkadiusz', '2012-10-14 00:00:00'),
(4, 'Marek', '2012-09-15 00:00:00'),
(5, 'Anna', '2013-08-16 00:00:00'),
(6, 'Matylda', '2014-07-17 00:00:00'),
(7, 'Michał', '2003-12-11 00:00:00'),
(8, 'Demetriusz', '2001-12-11 00:00:00'),
(9, 'Monitor', '2002-12-11 00:00:00');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `adresy`
--
ALTER TABLE `adresy`
  ADD PRIMARY KEY (`adres_id`);

--
-- Indexes for table `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`klient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `adresy`
--
ALTER TABLE `adresy`
  MODIFY `adres_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
