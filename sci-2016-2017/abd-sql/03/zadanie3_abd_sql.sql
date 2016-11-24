-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Wrz 2016, 12:27
-- Wersja serwera: 10.1.13-MariaDB
-- Wersja PHP: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `zadanie3_abd_sql`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `ID_pracownik` int(2) NOT NULL,
  `Imie` varchar(7) DEFAULT NULL,
  `Nazwisko` varchar(9) DEFAULT NULL,
  `Stanowisko` varchar(10) DEFAULT NULL,
  `Miasto` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`ID_pracownik`, `Imie`, `Nazwisko`, `Stanowisko`, `Miasto`) VALUES
(1, 'Andrzej', 'Duży', 'urzędnik', 'Szczecin'),
(2, 'Marek', 'Mały', 'kierownik', 'Szczecin'),
(3, 'Ilona', 'Średnia', 'urzędnik', 'Szczecin'),
(4, 'Justyna', 'Chuda', 'księgowy', 'Szczecin'),
(5, 'Wacław', 'Miły', 'Stażysta', 'Warszawa'),
(6, 'Roman', 'Zły', 'Stażysta', 'Warszawa'),
(7, 'Andrzej', 'Bordowy', 'prezes', 'Warszawa'),
(8, 'Robert', 'Zielony', 'informatyk', 'Warszawa'),
(9, 'Andrzej', 'Złoty', 'kontroler', 'Szczecin'),
(10, 'Ilona', 'Fioletowa', 'informatyk', 'Szczecin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyplaty`
--

CREATE TABLE `wyplaty` (
  `ID_pracownik` int(2) NOT NULL,
  `Pensja` int(4) DEFAULT NULL,
  `Premia` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `wyplaty`
--

INSERT INTO `wyplaty` (`ID_pracownik`, `Pensja`, `Premia`) VALUES
(1, 2000, 400),
(2, 5000, 700),
(3, 2200, 430),
(4, 3500, 540),
(5, 1400, 120),
(6, 1400, 120),
(7, 9000, 850),
(8, 3400, 340),
(9, 2900, 330),
(10, 3400, 350);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zlecenia`
--

CREATE TABLE `zlecenia` (
  `Nr_zlecenia` int(2) NOT NULL,
  `ID_pracownik` int(2) DEFAULT NULL,
  `Kod` varchar(7) DEFAULT NULL,
  `Wartosc` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `zlecenia`
--

INSERT INTO `zlecenia` (`Nr_zlecenia`, `ID_pracownik`, `Kod`, `Wartosc`) VALUES
(7, 1, 'zlec007', '400'),
(8, 3, 'zlec008', '300'),
(9, 4, 'zlec009', '500'),
(10, 1, 'zlec010', '200'),
(11, 3, 'zlec011', '300'),
(12, 4, 'zlec012', '400'),
(13, 10, 'zlec013', '2300'),
(14, 9, '', ''),
(15, 8, '', ''),
(16, 5, 'zlec016', '400'),
(17, 5, 'zlec017', '350'),
(18, 6, 'zlec018', '2000'),
(19, 6, 'zlec019', '560'),
(20, 5, 'zlec020', '1200'),
(21, 1, '', ''),
(22, 3, 'zlec022', '560');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`ID_pracownik`),
  ADD KEY `ID_pracownik` (`ID_pracownik`);

--
-- Indexes for table `wyplaty`
--
ALTER TABLE `wyplaty`
  ADD PRIMARY KEY (`ID_pracownik`),
  ADD KEY `ID_pracownik` (`ID_pracownik`);

--
-- Indexes for table `zlecenia`
--
ALTER TABLE `zlecenia`
  ADD PRIMARY KEY (`Nr_zlecenia`),
  ADD KEY `Nr_zlecenia` (`Nr_zlecenia`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
