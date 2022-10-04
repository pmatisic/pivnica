-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 21, 2022 at 09:51 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktivacijski_kodovi`
--

CREATE TABLE `aktivacijski_kodovi` (
  `id_aktivacijski_kod` int(11) NOT NULL,
  `vrijednost` varchar(255) NOT NULL,
  `datum_kreiranja` datetime NOT NULL,
  `id_korisnik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aktivacijski_kodovi`
--

INSERT INTO `aktivacijski_kodovi` (`id_aktivacijski_kod`, `vrijednost`, `datum_kreiranja`, `id_korisnik`) VALUES
(25, 'a3f28fd9176ec4e8b1a267e1b59c278eda34f7c7', '2022-06-15 09:07:23', 15);

-- --------------------------------------------------------

--
-- Table structure for table `cjenik`
--

CREATE TABLE `cjenik` (
  `id_cjenik` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `korisnik_id_korisnik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cjenik`
--

INSERT INTO `cjenik` (`id_cjenik`, `naziv`, `korisnik_id_korisnik`) VALUES
(1, 'Cjenik 1', 4);

-- --------------------------------------------------------

--
-- Table structure for table `dnevnik`
--

CREATE TABLE `dnevnik` (
  `id_dnevnik` int(11) NOT NULL,
  `id_korisnik` int(11) NOT NULL,
  `id_tip_zapisa` int(11) NOT NULL,
  `zapis` text NOT NULL,
  `datum` datetime NOT NULL,
  `preglednik` varchar(45) DEFAULT NULL,
  `adresa` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dnevnik`
--

INSERT INTO `dnevnik` (`id_dnevnik`, `id_korisnik`, `id_tip_zapisa`, `zapis`, `datum`, `preglednik`, `adresa`) VALUES
(30, 12, 7, 'aktivacija.php', '2022-06-10 08:35:10', 'Windows Google Chrome', '::1'),
(31, 12, 1, 'prijava.php', '2022-06-10 08:36:44', 'Windows Google Chrome', '::1'),
(32, 12, 3, 'insert into korisnik', '2022-06-10 08:39:35', 'Windows Google Chrome', '::1'),
(33, 12, 3, 'insert into aktivacijski_kodovi', '2022-06-10 08:39:35', 'Windows Google Chrome', '::1'),
(34, 13, 7, 'aktivacija.php', '2022-06-10 08:40:50', 'Windows Google Chrome', '::1'),
(35, 13, 1, 'prijava.php', '2022-06-10 08:40:59', 'Windows Google Chrome', '::1'),
(36, 13, 1, 'prijava.php', '2022-06-10 21:04:59', 'Windows Google Chrome', '::1'),
(37, 13, 5, 'prijava.php', '2022-06-13 07:55:02', 'Windows Google Chrome', '::1'),
(38, 13, 5, 'prijava.php', '2022-06-13 07:55:28', 'Windows Google Chrome', '::1'),
(39, 13, 5, 'prijava.php', '2022-06-13 07:55:33', 'Windows Google Chrome', '::1'),
(40, 14, 7, 'aktivacija.php', '2022-06-13 07:57:02', 'Windows Google Chrome', '::1'),
(41, 14, 1, 'prijava.php', '2022-06-13 07:57:24', 'Windows Google Chrome', '::1'),
(42, 1, 5, 'prijava.php', '2022-06-13 08:21:51', 'Windows Google Chrome', '::1'),
(43, 1, 5, 'prijava.php', '2022-06-13 08:21:57', 'Windows Google Chrome', '::1'),
(44, 1, 5, 'prijava.php', '2022-06-13 08:22:05', 'Windows Google Chrome', '::1'),
(45, 1, 5, 'prijava.php', '2022-06-13 08:22:29', 'Windows Google Chrome', '::1'),
(46, 1, 6, 'zaboravljenaLozinka.php', '2022-06-15 09:13:44', 'Windows Google Chrome', '::1'),
(47, 1, 6, 'zaboravljenaLozinka.php', '2022-06-15 09:14:57', 'Windows Google Chrome', '::1'),
(48, 16, 7, 'aktivacija.php', '2022-06-15 09:19:43', 'Windows Google Chrome', '::1'),
(49, 16, 1, 'prijava.php', '2022-06-15 09:19:49', 'Windows Google Chrome', '::1'),
(50, 16, 4, 'index.php', '2022-06-15 09:19:49', 'Windows Google Chrome', '::1'),
(51, 16, 2, 'odjava.php', '2022-06-15 09:19:56', 'Windows Google Chrome', '::1'),
(52, 1, 5, 'prijava.php', '2022-06-15 09:20:05', 'Windows Google Chrome', '::1'),
(53, 16, 1, 'prijava.php', '2022-06-15 09:22:06', 'Windows Google Chrome', '::1'),
(54, 16, 4, 'index.php', '2022-06-15 09:22:06', 'Windows Google Chrome', '::1'),
(55, 16, 2, 'odjava.php', '2022-06-15 09:22:08', 'Windows Google Chrome', '::1'),
(56, 1, 5, 'prijava.php', '2022-06-15 09:22:28', 'Windows Google Chrome', '::1'),
(57, 1, 1, 'prijava.php', '2022-06-15 09:22:51', 'Windows Google Chrome', '::1'),
(58, 1, 4, 'index.php', '2022-06-15 09:22:51', 'Windows Google Chrome', '::1'),
(59, 1, 4, 'index.php', '2022-06-15 09:23:02', 'Windows Google Chrome', '::1'),
(60, 1, 4, 'index.php', '2022-06-15 09:23:06', 'Windows Google Chrome', '::1'),
(61, 1, 4, 'index.php', '2022-06-15 09:23:09', 'Windows Google Chrome', '::1'),
(62, 1, 2, 'odjava.php', '2022-06-15 09:23:20', 'Windows Google Chrome', '::1'),
(63, 1, 5, 'prijava.php', '2022-06-16 08:04:16', 'Windows Google Chrome', '::1'),
(64, 1, 6, 'zaboravljenaLozinka.php', '2022-06-16 08:05:37', 'Windows Google Chrome', '::1'),
(65, 1, 1, 'prijava.php', '2022-06-16 08:05:55', 'Windows Google Chrome', '::1'),
(66, 1, 4, 'index.php', '2022-06-16 08:05:55', 'Windows Google Chrome', '::1'),
(67, 1, 4, 'index.php', '2022-06-16 08:06:13', 'Windows Google Chrome', '::1'),
(68, 1, 2, 'odjava.php', '2022-06-16 08:06:56', 'Windows Google Chrome', '::1'),
(69, 1, 1, 'prijava.php', '2022-06-16 08:07:06', 'Windows Google Chrome', '::1'),
(70, 1, 4, 'index.php', '2022-06-16 08:07:06', 'Windows Google Chrome', '::1'),
(71, 1, 2, 'odjava.php', '2022-06-16 08:07:09', 'Windows Google Chrome', '::1'),
(72, 2, 5, 'prijava.php', '2022-06-16 08:07:37', 'Windows Google Chrome', '::1'),
(73, 2, 5, 'prijava.php', '2022-06-16 08:08:02', 'Windows Google Chrome', '::1'),
(74, 1, 1, 'prijava.php', '2022-06-16 08:08:21', 'Windows Google Chrome', '::1'),
(75, 1, 4, 'index.php', '2022-06-16 08:08:21', 'Windows Google Chrome', '::1'),
(76, 1, 2, 'odjava.php', '2022-06-16 08:08:25', 'Windows Google Chrome', '::1'),
(77, 16, 1, 'prijava.php', '2022-06-16 08:08:40', 'Windows Google Chrome', '::1'),
(78, 16, 4, 'index.php', '2022-06-16 08:08:41', 'Windows Google Chrome', '::1'),
(79, 16, 2, 'odjava.php', '2022-06-16 08:08:42', 'Windows Google Chrome', '::1'),
(80, 16, 1, 'prijava.php', '2022-06-16 08:08:48', 'Windows Google Chrome', '::1'),
(81, 16, 4, 'index.php', '2022-06-16 08:08:48', 'Windows Google Chrome', '::1'),
(82, 16, 2, 'odjava.php', '2022-06-16 08:08:49', 'Windows Google Chrome', '::1'),
(83, 16, 1, 'prijava.php', '2022-06-16 08:08:57', 'Windows Google Chrome', '::1'),
(84, 16, 4, 'index.php', '2022-06-16 08:08:57', 'Windows Google Chrome', '::1'),
(85, 16, 2, 'odjava.php', '2022-06-16 08:08:59', 'Windows Google Chrome', '::1'),
(86, 16, 1, 'prijava.php', '2022-06-16 08:09:03', 'Windows Google Chrome', '::1'),
(87, 16, 4, 'index.php', '2022-06-16 08:09:03', 'Windows Google Chrome', '::1'),
(88, 16, 2, 'odjava.php', '2022-06-16 08:09:05', 'Windows Google Chrome', '::1'),
(89, 16, 1, 'prijava.php', '2022-06-16 08:09:15', 'Windows Google Chrome', '::1'),
(90, 16, 4, 'index.php', '2022-06-16 08:09:15', 'Windows Google Chrome', '::1'),
(91, 16, 2, 'odjava.php', '2022-06-16 08:09:16', 'Windows Google Chrome', '::1'),
(92, 16, 6, 'zaboravljenaLozinka.php', '2022-06-16 08:09:45', 'Windows Google Chrome', '::1'),
(93, 16, 1, 'prijava.php', '2022-06-16 08:09:58', 'Windows Google Chrome', '::1'),
(94, 16, 4, 'index.php', '2022-06-16 08:09:58', 'Windows Google Chrome', '::1'),
(95, 16, 2, 'odjava.php', '2022-06-16 08:09:59', 'Windows Google Chrome', '::1'),
(96, 16, 1, 'prijava.php', '2022-06-16 08:10:05', 'Windows Google Chrome', '::1'),
(97, 16, 4, 'index.php', '2022-06-16 08:10:05', 'Windows Google Chrome', '::1'),
(98, 16, 2, 'odjava.php', '2022-06-16 08:10:07', 'Windows Google Chrome', '::1'),
(99, 16, 1, 'prijava.php', '2022-06-16 08:10:17', 'Windows Google Chrome', '::1'),
(100, 16, 4, 'index.php', '2022-06-16 08:10:17', 'Windows Google Chrome', '::1'),
(101, 16, 4, 'index.php', '2022-06-16 08:10:20', 'Windows Google Chrome', '::1'),
(102, 16, 4, 'index.php', '2022-06-16 08:10:23', 'Windows Google Chrome', '::1'),
(103, 16, 2, 'odjava.php', '2022-06-16 08:10:30', 'Windows Google Chrome', '::1'),
(104, 1, 1, 'prijava.php', '2022-06-16 08:11:12', 'Windows Google Chrome', '::1'),
(105, 1, 4, 'index.php', '2022-06-16 08:11:12', 'Windows Google Chrome', '::1'),
(106, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-16 08:11:17', 'Windows Google Chrome', '::1'),
(107, 1, 3, 'update korisnik', '2022-06-16 08:11:20', 'Windows Google Chrome', '::1'),
(108, 1, 2, 'odjava.php', '2022-06-16 08:58:59', 'Windows Google Chrome', '::1'),
(109, 1, 1, 'prijava.php', '2022-06-16 18:48:29', 'Windows Google Chrome', '::1'),
(110, 1, 4, 'index.php', '2022-06-16 18:48:29', 'Windows Google Chrome', '::1'),
(111, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-16 18:48:32', 'Windows Google Chrome', '::1'),
(112, 1, 3, 'update korisnik', '2022-06-16 18:48:36', 'Windows Google Chrome', '::1'),
(113, 1, 3, 'update korisnik', '2022-06-16 18:48:38', 'Windows Google Chrome', '::1'),
(114, 1, 3, 'update korisnik', '2022-06-16 18:49:00', 'Windows Google Chrome', '::1'),
(115, 1, 3, 'update korisnik', '2022-06-16 18:49:04', 'Windows Google Chrome', '::1'),
(116, 1, 4, 'konfiguracijaSustava.php', '2022-06-16 18:49:23', 'Windows Google Chrome', '::1'),
(117, 1, 4, 'konfiguracijaSustava.php', '2022-06-16 18:49:33', 'Windows Google Chrome', '::1'),
(118, 1, 3, 'update konfiguracija_sustava', '2022-06-16 18:49:33', 'Windows Google Chrome', '::1'),
(119, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-16 18:49:40', 'Windows Google Chrome', '::1'),
(120, 1, 4, 'konfiguracijaSustava.php', '2022-06-16 18:49:44', 'Windows Google Chrome', '::1'),
(121, 1, 4, 'dnevnikRada.php', '2022-06-16 18:49:53', 'Windows Google Chrome', '::1'),
(122, 1, 4, 'moderatoriUstanova.php', '2022-06-16 18:50:14', 'Windows Google Chrome', '::1'),
(123, 1, 4, 'moderatoriUstanova.php', '2022-06-16 18:53:57', 'Windows Google Chrome', '::1'),
(124, 1, 4, 'moderatoriUstanova.php', '2022-06-16 18:54:35', 'Windows Google Chrome', '::1'),
(125, 1, 4, 'moderatoriUstanova.php', '2022-06-16 18:54:43', 'Windows Google Chrome', '::1'),
(126, 1, 3, 'insert into moderator', '2022-06-16 18:54:43', 'Windows Google Chrome', '::1'),
(127, 1, 4, 'moderatoriUstanova.php', '2022-06-16 18:55:50', 'Windows Google Chrome', '::1'),
(128, 1, 3, 'insert into moderator', '2022-06-16 18:55:50', 'Windows Google Chrome', '::1'),
(129, 1, 4, 'moderatoriUstanova.php', '2022-06-16 18:56:59', 'Windows Google Chrome', '::1'),
(130, 1, 4, 'index.php', '2022-06-16 18:57:10', 'Windows Google Chrome', '::1'),
(131, 1, 4, 'index.php', '2022-06-16 19:16:43', 'Windows Google Chrome', '::1'),
(132, 1, 4, 'index.php', '2022-06-16 19:16:48', 'Windows Google Chrome', '::1'),
(133, 1, 2, 'odjava.php', '2022-06-16 19:16:56', 'Windows Google Chrome', '::1'),
(134, 1, 1, 'prijava.php', '2022-06-17 00:36:20', 'Windows Google Chrome', '::1'),
(135, 1, 4, 'index.php', '2022-06-17 00:36:20', 'Windows Google Chrome', '::1'),
(136, 1, 4, 'index.php', '2022-06-17 00:36:27', 'Windows Google Chrome', '::1'),
(137, 1, 4, 'index.php', '2022-06-17 00:36:29', 'Windows Google Chrome', '::1'),
(138, 1, 4, 'index.php', '2022-06-17 00:36:31', 'Windows Google Chrome', '::1'),
(139, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-17 00:36:35', 'Windows Google Chrome', '::1'),
(140, 1, 4, 'konfiguracijaSustava.php', '2022-06-17 00:36:40', 'Windows Google Chrome', '::1'),
(141, 1, 4, 'konfiguracijaSustava.php', '2022-06-17 00:36:47', 'Windows Google Chrome', '::1'),
(142, 1, 4, 'dnevnikRada.php', '2022-06-17 00:36:48', 'Windows Google Chrome', '::1'),
(143, 1, 4, 'index.php', '2022-06-17 00:37:22', 'Windows Google Chrome', '::1'),
(144, 1, 4, 'index.php', '2022-06-17 00:37:28', 'Windows Google Chrome', '::1'),
(145, 1, 4, 'index.php', '2022-06-17 00:37:42', 'Windows Google Chrome', '::1'),
(146, 1, 4, 'index.php', '2022-06-17 00:37:46', 'Windows Google Chrome', '::1'),
(147, 1, 2, 'odjava.php', '2022-06-17 00:37:57', 'Windows Google Chrome', '::1'),
(148, 1, 1, 'prijava.php', '2022-06-17 07:26:55', 'Windows Google Chrome', '::1'),
(149, 1, 4, 'index.php', '2022-06-17 07:26:56', 'Windows Google Chrome', '::1'),
(150, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:26:59', 'Windows Google Chrome', '::1'),
(151, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:27:50', 'Windows Google Chrome', '::1'),
(152, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:28:42', 'Windows Google Chrome', '::1'),
(153, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:34:45', 'Windows Google Chrome', '::1'),
(154, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:34:46', 'Windows Google Chrome', '::1'),
(155, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:34:54', 'Windows Google Chrome', '::1'),
(156, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:35:41', 'Windows Google Chrome', '::1'),
(157, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:46:12', 'Windows Google Chrome', '::1'),
(158, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:46:51', 'Windows Google Chrome', '::1'),
(159, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:48:54', 'Windows Google Chrome', '::1'),
(160, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:49:07', 'Windows Google Chrome', '::1'),
(161, 1, 3, 'insert into pivnica', '2022-06-17 07:49:07', 'Windows Google Chrome', '::1'),
(162, 1, 4, 'kreirajPivnicu.php', '2022-06-17 07:49:11', 'Windows Google Chrome', '::1'),
(163, 1, 4, 'kreirajPivnicu.php', '2022-06-17 08:04:49', 'Windows Google Chrome', '::1'),
(164, 1, 4, 'kreirajPivnicu.php', '2022-06-17 08:05:17', 'Windows Google Chrome', '::1'),
(165, 1, 4, 'kreirajPivnicu.php', '2022-06-17 08:06:16', 'Windows Google Chrome', '::1'),
(166, 1, 4, 'kreirajPivnicu.php', '2022-06-17 08:07:05', 'Windows Google Chrome', '::1'),
(167, 1, 4, 'kreirajPivnicu.php', '2022-06-17 08:09:05', 'Windows Google Chrome', '::1'),
(168, 1, 4, 'kreirajPivnicu.php', '2022-06-17 08:09:08', 'Windows Google Chrome', '::1'),
(169, 1, 4, 'kreirajPivnicu.php', '2022-06-17 08:10:13', 'Windows Google Chrome', '::1'),
(170, 1, 4, 'kreirajPivnicu.php', '2022-06-17 08:10:17', 'Windows Google Chrome', '::1'),
(171, 1, 4, 'index.php', '2022-06-17 08:10:19', 'Windows Google Chrome', '::1'),
(172, 1, 4, 'index.php', '2022-06-17 08:10:23', 'Windows Google Chrome', '::1'),
(173, 1, 4, 'konfiguracijaSustava.php', '2022-06-17 08:10:29', 'Windows Google Chrome', '::1'),
(174, 1, 4, 'dnevnikRada.php', '2022-06-17 08:10:32', 'Windows Google Chrome', '::1'),
(175, 1, 4, 'dnevnikRada.php', '2022-06-17 08:10:36', 'Windows Google Chrome', '::1'),
(176, 1, 4, 'dnevnikRada.php', '2022-06-17 08:10:42', 'Windows Google Chrome', '::1'),
(177, 1, 4, 'dnevnikRada.php', '2022-06-17 08:10:46', 'Windows Google Chrome', '::1'),
(178, 1, 4, 'dnevnikRada.php', '2022-06-17 08:10:52', 'Windows Google Chrome', '::1'),
(179, 1, 2, 'odjava.php', '2022-06-17 08:17:12', 'Windows Google Chrome', '::1'),
(180, 2, 5, 'prijava.php', '2022-06-17 08:18:27', 'Windows Google Chrome', '::1'),
(181, 2, 5, 'prijava.php', '2022-06-17 08:19:39', 'Windows Google Chrome', '::1'),
(182, 2, 5, 'prijava.php', '2022-06-17 08:19:46', 'Windows Google Chrome', '::1'),
(183, 1, 1, 'prijava.php', '2022-06-17 08:20:06', 'Windows Google Chrome', '::1'),
(184, 1, 4, 'index.php', '2022-06-17 08:20:06', 'Windows Google Chrome', '::1'),
(185, 1, 2, 'odjava.php', '2022-06-17 08:20:11', 'Windows Google Chrome', '::1'),
(186, 1, 1, 'prijava.php', '2022-06-17 08:20:15', 'Windows Google Chrome', '::1'),
(187, 1, 4, 'index.php', '2022-06-17 08:20:15', 'Windows Google Chrome', '::1'),
(188, 2, 5, 'prijava.php', '2022-06-17 08:21:26', 'Windows Google Chrome', '::1'),
(189, 2, 5, 'prijava.php', '2022-06-17 08:21:28', 'Windows Google Chrome', '::1'),
(190, 16, 6, 'zaboravljenaLozinka.php', '2022-06-17 08:23:33', 'Windows Google Chrome', '::1'),
(191, 16, 1, 'prijava.php', '2022-06-17 08:23:52', 'Windows Google Chrome', '::1'),
(192, 16, 4, 'index.php', '2022-06-17 08:23:52', 'Windows Google Chrome', '::1'),
(193, 16, 4, 'index.php', '2022-06-17 08:23:56', 'Windows Google Chrome', '::1'),
(194, 16, 4, 'index.php', '2022-06-17 08:23:58', 'Windows Google Chrome', '::1'),
(195, 16, 4, 'index.php', '2022-06-17 08:24:01', 'Windows Google Chrome', '::1'),
(196, 16, 4, 'index.php', '2022-06-17 08:24:03', 'Windows Google Chrome', '::1'),
(197, 16, 2, 'odjava.php', '2022-06-17 08:24:07', 'Windows Google Chrome', '::1'),
(198, 1, 1, 'prijava.php', '2022-06-17 08:24:17', 'Windows Google Chrome', '::1'),
(199, 1, 4, 'index.php', '2022-06-17 08:24:17', 'Windows Google Chrome', '::1'),
(200, 1, 4, 'dnevnikRada.php', '2022-06-17 08:24:22', 'Windows Google Chrome', '::1'),
(201, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-17 08:24:26', 'Windows Google Chrome', '::1'),
(202, 1, 3, 'update korisnik', '2022-06-17 08:24:29', 'Windows Google Chrome', '::1'),
(203, 1, 3, 'update korisnik', '2022-06-17 08:24:29', 'Windows Google Chrome', '::1'),
(204, 1, 2, 'odjava.php', '2022-06-17 08:24:34', 'Windows Google Chrome', '::1'),
(205, 2, 5, 'prijava.php', '2022-06-17 08:24:46', 'Windows Google Chrome', '::1'),
(206, 1, 1, 'prijava.php', '2022-06-17 08:25:09', 'Windows Google Chrome', '::1'),
(207, 1, 4, 'index.php', '2022-06-17 08:25:09', 'Windows Google Chrome', '::1'),
(208, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-17 08:25:12', 'Windows Google Chrome', '::1'),
(209, 1, 3, 'update korisnik', '2022-06-17 08:25:13', 'Windows Google Chrome', '::1'),
(210, 1, 2, 'odjava.php', '2022-06-17 08:25:16', 'Windows Google Chrome', '::1'),
(211, 2, 5, 'prijava.php', '2022-06-17 08:25:32', 'Windows Google Chrome', '::1'),
(212, 1, 1, 'prijava.php', '2022-06-17 08:25:59', 'Windows Google Chrome', '::1'),
(213, 1, 4, 'index.php', '2022-06-17 08:25:59', 'Windows Google Chrome', '::1'),
(214, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-17 08:26:02', 'Windows Google Chrome', '::1'),
(215, 1, 3, 'update korisnik', '2022-06-17 08:26:03', 'Windows Google Chrome', '::1'),
(216, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-17 08:26:05', 'Windows Google Chrome', '::1'),
(217, 1, 2, 'odjava.php', '2022-06-17 08:26:07', 'Windows Google Chrome', '::1'),
(218, 2, 5, 'prijava.php', '2022-06-17 08:26:21', 'Windows Google Chrome', '::1'),
(219, 2, 5, 'prijava.php', '2022-06-17 08:26:51', 'Windows Google Chrome', '::1'),
(220, 2, 5, 'prijava.php', '2022-06-17 08:26:54', 'Windows Google Chrome', '::1'),
(221, 2, 5, 'prijava.php', '2022-06-17 08:29:19', 'Windows Google Chrome', '::1'),
(222, 2, 5, 'prijava.php', '2022-06-17 08:29:26', 'Windows Google Chrome', '::1'),
(223, 1, 1, 'prijava.php', '2022-06-17 08:31:17', 'Windows Google Chrome', '::1'),
(224, 1, 4, 'index.php', '2022-06-17 08:31:17', 'Windows Google Chrome', '::1'),
(225, 1, 2, 'odjava.php', '2022-06-17 08:31:19', 'Windows Google Chrome', '::1'),
(226, 2, 5, 'prijava.php', '2022-06-17 08:31:33', 'Windows Google Chrome', '::1'),
(227, 2, 5, 'prijava.php', '2022-06-17 08:31:53', 'Windows Google Chrome', '::1'),
(228, 2, 5, 'prijava.php', '2022-06-17 08:36:41', 'Windows Google Chrome', '::1'),
(229, 1, 1, 'prijava.php', '2022-06-17 08:38:15', 'Windows Google Chrome', '::1'),
(230, 1, 4, 'index.php', '2022-06-17 08:38:15', 'Windows Google Chrome', '::1'),
(231, 1, 2, 'odjava.php', '2022-06-17 08:38:21', 'Windows Google Chrome', '::1'),
(232, 16, 1, 'prijava.php', '2022-06-17 08:39:16', 'Windows Google Chrome', '::1'),
(233, 16, 4, 'index.php', '2022-06-17 08:39:16', 'Windows Google Chrome', '::1'),
(234, 16, 2, 'odjava.php', '2022-06-17 08:39:22', 'Windows Google Chrome', '::1'),
(235, 2, 5, 'prijava.php', '2022-06-17 08:39:42', 'Windows Google Chrome', '::1'),
(236, 6, 5, 'prijava.php', '2022-06-17 08:40:40', 'Windows Google Chrome', '::1'),
(237, 16, 1, 'prijava.php', '2022-06-17 08:41:54', 'Windows Google Chrome', '::1'),
(238, 16, 4, 'index.php', '2022-06-17 08:41:54', 'Windows Google Chrome', '::1'),
(239, 16, 4, 'index.php', '2022-06-17 08:41:58', 'Windows Google Chrome', '::1'),
(240, 16, 2, 'odjava.php', '2022-06-17 08:41:59', 'Windows Google Chrome', '::1'),
(241, 16, 1, 'prijava.php', '2022-06-17 08:42:10', 'Windows Google Chrome', '::1'),
(242, 16, 4, 'index.php', '2022-06-17 08:42:10', 'Windows Google Chrome', '::1'),
(243, 16, 2, 'odjava.php', '2022-06-17 08:42:12', 'Windows Google Chrome', '::1'),
(244, 2, 6, 'zaboravljenaLozinka.php', '2022-06-17 08:44:44', 'Windows Google Chrome', '::1'),
(245, 2, 1, 'prijava.php', '2022-06-17 08:44:55', 'Windows Google Chrome', '::1'),
(246, 2, 4, 'index.php', '2022-06-17 08:44:55', 'Windows Google Chrome', '::1'),
(247, 2, 4, 'index.php', '2022-06-17 08:45:01', 'Windows Google Chrome', '::1'),
(248, 2, 4, 'index.php', '2022-06-17 08:45:02', 'Windows Google Chrome', '::1'),
(249, 2, 2, 'odjava.php', '2022-06-17 08:45:03', 'Windows Google Chrome', '::1'),
(250, 1, 1, 'prijava.php', '2022-06-17 08:45:38', 'Windows Google Chrome', '::1'),
(251, 1, 4, 'index.php', '2022-06-17 08:45:38', 'Windows Google Chrome', '::1'),
(252, 1, 2, 'odjava.php', '2022-06-17 08:45:40', 'Windows Google Chrome', '::1'),
(253, 16, 1, 'prijava.php', '2022-06-17 08:45:53', 'Windows Google Chrome', '::1'),
(254, 16, 4, 'index.php', '2022-06-17 08:45:53', 'Windows Google Chrome', '::1'),
(255, 16, 2, 'odjava.php', '2022-06-17 08:45:56', 'Windows Google Chrome', '::1'),
(256, 1, 1, 'prijava.php', '2022-06-17 08:56:23', 'Windows Google Chrome', '::1'),
(257, 1, 4, 'index.php', '2022-06-17 08:56:23', 'Windows Google Chrome', '::1'),
(258, 1, 4, 'dnevnikRada.php', '2022-06-17 08:56:25', 'Windows Google Chrome', '::1'),
(259, 1, 4, 'dnevnikRada.php', '2022-06-17 08:58:04', 'Windows Google Chrome', '::1'),
(260, 1, 4, 'dnevnikRada.php', '2022-06-17 08:58:05', 'Windows Google Chrome', '::1'),
(261, 1, 4, 'moderatoriPivnica.php', '2022-06-17 08:58:09', 'Windows Google Chrome', '::1'),
(262, 1, 4, 'moderatoriPivnica.php', '2022-06-17 08:58:19', 'Windows Google Chrome', '::1'),
(263, 1, 3, 'insert into moderator', '2022-06-17 08:58:19', 'Windows Google Chrome', '::1'),
(264, 1, 4, 'index.php', '2022-06-17 09:11:54', 'Windows Google Chrome', '::1'),
(265, 1, 2, 'odjava.php', '2022-06-17 09:11:57', 'Windows Google Chrome', '::1'),
(266, 1, 1, 'prijava.php', '2022-06-18 22:41:48', 'Windows Google Chrome', '::1'),
(267, 1, 4, 'index.php', '2022-06-18 22:41:48', 'Windows Google Chrome', '::1'),
(268, 1, 4, 'index.php', '2022-06-18 22:41:52', 'Windows Google Chrome', '::1'),
(269, 1, 4, 'kreirajPivnicu.php', '2022-06-18 22:41:54', 'Windows Google Chrome', '::1'),
(270, 1, 4, 'kreirajPivnicu.php', '2022-06-18 22:42:53', 'Windows Google Chrome', '::1'),
(271, 1, 4, 'kreirajPivnicu.php', '2022-06-18 22:43:33', 'Windows Google Chrome', '::1'),
(272, 1, 4, 'kreirajPivnicu.php', '2022-06-18 22:44:16', 'Windows Google Chrome', '::1'),
(273, 1, 4, 'kreirajPivnicu.php', '2022-06-18 22:46:21', 'Windows Google Chrome', '::1'),
(274, 1, 4, 'kreirajPivnicu.php', '2022-06-18 22:47:27', 'Windows Google Chrome', '::1'),
(275, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:04:13', 'Windows Google Chrome', '::1'),
(276, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:18:14', 'Windows Google Chrome', '::1'),
(277, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:20:20', 'Windows Google Chrome', '::1'),
(278, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:20:40', 'Windows Google Chrome', '::1'),
(279, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:23:36', 'Windows Google Chrome', '::1'),
(280, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:24:57', 'Windows Google Chrome', '::1'),
(281, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:25:04', 'Windows Google Chrome', '::1'),
(282, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:25:28', 'Windows Google Chrome', '::1'),
(283, 1, 3, 'insert into pivnica', '2022-06-18 23:25:28', 'Windows Google Chrome', '::1'),
(284, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:25:52', 'Windows Google Chrome', '::1'),
(285, 1, 3, 'insert into pivnica', '2022-06-18 23:25:52', 'Windows Google Chrome', '::1'),
(286, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:25:58', 'Windows Google Chrome', '::1'),
(287, 1, 3, 'insert into pivnica', '2022-06-18 23:25:58', 'Windows Google Chrome', '::1'),
(288, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:31:34', 'Windows Google Chrome', '::1'),
(289, 1, 3, 'insert into pivnica', '2022-06-18 23:31:34', 'Windows Google Chrome', '::1'),
(290, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:31:37', 'Windows Google Chrome', '::1'),
(291, 1, 3, 'insert into pivnica', '2022-06-18 23:31:37', 'Windows Google Chrome', '::1'),
(292, 1, 4, 'index.php', '2022-06-18 23:31:38', 'Windows Google Chrome', '::1'),
(293, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:31:42', 'Windows Google Chrome', '::1'),
(294, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:32:14', 'Windows Google Chrome', '::1'),
(295, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:33:50', 'Windows Google Chrome', '::1'),
(296, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:37:05', 'Windows Google Chrome', '::1'),
(297, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:38:10', 'Windows Google Chrome', '::1'),
(298, 1, 4, 'moderatoriPivnica.php', '2022-06-18 23:40:23', 'Windows Google Chrome', '::1'),
(299, 1, 4, 'moderatoriPivnica.php', '2022-06-18 23:42:42', 'Windows Google Chrome', '::1'),
(300, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:42:48', 'Windows Google Chrome', '::1'),
(301, 1, 4, 'moderatoriPivnica.php', '2022-06-18 23:42:50', 'Windows Google Chrome', '::1'),
(302, 1, 4, 'moderatoriPivnica.php', '2022-06-18 23:42:55', 'Windows Google Chrome', '::1'),
(303, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-18 23:42:58', 'Windows Google Chrome', '::1'),
(304, 1, 4, 'konfiguracijaSustava.php', '2022-06-18 23:43:00', 'Windows Google Chrome', '::1'),
(305, 1, 4, 'dnevnikRada.php', '2022-06-18 23:43:03', 'Windows Google Chrome', '::1'),
(306, 1, 4, 'dnevnikRada.php', '2022-06-18 23:43:12', 'Windows Google Chrome', '::1'),
(307, 1, 4, 'index.php', '2022-06-18 23:45:49', 'Windows Google Chrome', '::1'),
(308, 1, 4, 'moderatoriPivnica.php', '2022-06-18 23:45:57', 'Windows Google Chrome', '::1'),
(309, 1, 4, 'kreirajPivnicu.php', '2022-06-18 23:54:45', 'Windows Google Chrome', '::1'),
(310, 1, 4, 'kreirajPivnicu.php', '2022-06-19 00:18:11', 'Windows Google Chrome', '::1'),
(311, 1, 4, 'index.php', '2022-06-19 02:06:04', 'Windows Google Chrome', '::1'),
(312, 1, 4, 'kreirajPivnicu.php', '2022-06-19 02:06:06', 'Windows Google Chrome', '::1'),
(313, 1, 4, 'moderatoriPivnica.php', '2022-06-19 02:06:09', 'Windows Google Chrome', '::1'),
(314, 1, 4, 'moderatoriPivnica.php', '2022-06-19 02:06:13', 'Windows Google Chrome', '::1'),
(315, 1, 4, 'moderatoriPivnica.php', '2022-06-19 02:06:16', 'Windows Google Chrome', '::1'),
(316, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-19 02:06:18', 'Windows Google Chrome', '::1'),
(317, 1, 4, 'konfiguracijaSustava.php', '2022-06-19 02:06:21', 'Windows Google Chrome', '::1'),
(318, 1, 4, 'dnevnikRada.php', '2022-06-19 02:06:28', 'Windows Google Chrome', '::1'),
(319, 1, 4, 'index.php', '2022-06-19 02:06:53', 'Windows Google Chrome', '::1'),
(320, 1, 4, 'index.php', '2022-06-19 02:06:55', 'Windows Google Chrome', '::1'),
(321, 1, 4, 'index.php', '2022-06-19 02:07:02', 'Windows Google Chrome', '::1'),
(322, 1, 4, 'index.php', '2022-06-19 02:07:04', 'Windows Google Chrome', '::1'),
(323, 1, 4, 'index.php', '2022-06-19 02:07:06', 'Windows Google Chrome', '::1'),
(324, 1, 4, 'index.php', '2022-06-19 02:07:09', 'Windows Google Chrome', '::1'),
(325, 1, 4, 'index.php', '2022-06-19 02:07:11', 'Windows Google Chrome', '::1'),
(326, 1, 4, 'index.php', '2022-06-19 02:07:14', 'Windows Google Chrome', '::1'),
(327, 1, 4, 'index.php', '2022-06-19 02:07:16', 'Windows Google Chrome', '::1'),
(328, 1, 4, 'index.php', '2022-06-19 02:07:20', 'Windows Google Chrome', '::1'),
(329, 1, 4, 'index.php', '2022-06-19 02:07:21', 'Windows Google Chrome', '::1'),
(330, 1, 4, 'index.php', '2022-06-19 02:07:24', 'Windows Google Chrome', '::1'),
(331, 1, 4, 'index.php', '2022-06-19 02:07:33', 'Windows Google Chrome', '::1'),
(332, 1, 6, 'zaboravljenaLozinka.php', '2022-06-19 08:41:44', 'Windows Google Chrome', '::1'),
(333, 1, 1, 'prijava.php', '2022-06-19 08:42:18', 'Windows Google Chrome', '::1'),
(334, 1, 4, 'index.php', '2022-06-19 08:42:18', 'Windows Google Chrome', '::1'),
(335, 1, 4, 'index.php', '2022-06-19 08:42:30', 'Windows Google Chrome', '::1'),
(336, 1, 4, 'kreirajPivnicu.php', '2022-06-19 08:42:33', 'Windows Google Chrome', '::1'),
(337, 1, 4, 'kreirajPivnicu.php', '2022-06-19 08:42:42', 'Windows Google Chrome', '::1'),
(338, 1, 4, 'kreirajPivnicu.php', '2022-06-19 08:42:47', 'Windows Google Chrome', '::1'),
(339, 1, 4, 'kreirajPivnicu.php', '2022-06-19 08:43:23', 'Windows Google Chrome', '::1'),
(340, 1, 2, 'odjava.php', '2022-06-19 08:57:52', 'Windows Google Chrome', '::1'),
(341, 1, 1, 'prijava.php', '2022-06-19 09:38:59', 'Windows Google Chrome', '::1'),
(342, 1, 4, 'index.php', '2022-06-19 09:38:59', 'Windows Google Chrome', '::1'),
(343, 1, 4, 'konfiguracijaSustava.php', '2022-06-19 09:39:02', 'Windows Google Chrome', '::1'),
(344, 1, 4, 'dnevnikRada.php', '2022-06-19 09:39:28', 'Windows Google Chrome', '::1'),
(345, 1, 4, 'konfiguracijaSustava.php', '2022-06-19 09:44:41', 'Windows Google Chrome', '::1'),
(346, 1, 4, 'konfiguracijaSustava.php', '2022-06-19 09:44:50', 'Windows Google Chrome', '::1'),
(347, 1, 3, 'update konfiguracija_sustava', '2022-06-19 11:44:50', 'Windows Google Chrome', '::1'),
(348, 1, 2, 'odjava.php', '2022-06-19 11:46:56', 'Windows Google Chrome', '::1'),
(349, 1, 1, 'prijava.php', '2022-06-19 11:47:15', 'Windows Google Chrome', '::1'),
(350, 1, 4, 'index.php', '2022-06-19 11:47:15', 'Windows Google Chrome', '::1'),
(351, 1, 4, 'konfiguracijaSustava.php', '2022-06-19 11:47:18', 'Windows Google Chrome', '::1'),
(352, 1, 4, 'konfiguracijaSustava.php', '2022-06-19 11:47:25', 'Windows Google Chrome', '::1'),
(353, 1, 3, 'update konfiguracija_sustava', '2022-06-26 04:47:25', 'Windows Google Chrome', '::1'),
(354, 1, 4, 'index.php', '2022-06-26 04:48:14', 'Windows Google Chrome', '::1'),
(355, 1, 2, 'odjava.php', '2022-06-26 04:48:14', 'Windows Google Chrome', '::1'),
(356, 1, 1, 'prijava.php', '2022-06-26 17:14:18', 'Windows Google Chrome', '::1'),
(357, 1, 4, 'index.php', '2022-06-26 17:14:18', 'Windows Google Chrome', '::1'),
(358, 1, 4, 'index.php', '2022-06-26 17:14:21', 'Windows Google Chrome', '::1'),
(359, 1, 4, 'kreirajPivnicu.php', '2022-06-26 17:14:23', 'Windows Google Chrome', '::1'),
(360, 1, 4, 'kreirajPivnicu.php', '2022-06-26 17:14:48', 'Windows Google Chrome', '::1'),
(361, 1, 4, 'kreirajPivnicu.php', '2022-06-26 17:15:37', 'Windows Google Chrome', '::1'),
(362, 1, 4, 'moderatoriPivnica.php', '2022-06-26 17:15:59', 'Windows Google Chrome', '::1'),
(363, 1, 4, 'moderatoriPivnica.php', '2022-06-26 17:16:15', 'Windows Google Chrome', '::1'),
(364, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-26 17:16:18', 'Windows Google Chrome', '::1'),
(365, 1, 3, 'update korisnik', '2022-06-26 17:16:22', 'Windows Google Chrome', '::1'),
(366, 1, 4, 'konfiguracijaSustava.php', '2022-06-26 17:16:33', 'Windows Google Chrome', '::1'),
(367, 1, 4, 'dnevnikRada.php', '2022-06-26 17:16:40', 'Windows Google Chrome', '::1'),
(368, 1, 4, 'dnevnikRada.php', '2022-06-26 17:16:47', 'Windows Google Chrome', '::1'),
(369, 1, 4, 'index.php', '2022-06-26 17:16:50', 'Windows Google Chrome', '::1'),
(370, 1, 2, 'odjava.php', '2022-06-26 19:47:04', 'Windows Google Chrome', '::1'),
(371, 1, 1, 'prijava.php', '2022-06-26 19:47:10', 'Windows Google Chrome', '::1'),
(372, 1, 4, 'index.php', '2022-06-26 19:47:10', 'Windows Google Chrome', '::1'),
(373, 1, 4, 'index.php', '2022-06-26 20:06:02', 'Windows Google Chrome', '::1'),
(374, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-26 20:06:05', 'Windows Google Chrome', '::1'),
(375, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-26 20:14:03', 'Windows Google Chrome', '::1'),
(376, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-26 20:14:22', 'Windows Google Chrome', '::1'),
(377, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-26 20:14:43', 'Windows Google Chrome', '::1'),
(378, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-26 20:15:14', 'Windows Google Chrome', '::1'),
(379, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-26 20:15:17', 'Windows Google Chrome', '::1'),
(380, 1, 3, 'insert into zemlja_porijekla', '2022-06-26 20:15:17', 'Windows Google Chrome', '::1'),
(381, 1, 4, 'index.php', '2022-06-26 20:41:59', 'Windows Google Chrome', '::1'),
(382, 1, 4, 'kreirajPivnicu.php', '2022-06-26 20:42:01', 'Windows Google Chrome', '::1'),
(383, 1, 4, 'moderatoriPivnica.php', '2022-06-26 20:42:03', 'Windows Google Chrome', '::1'),
(384, 1, 4, 'index.php', '2022-06-26 20:42:06', 'Windows Google Chrome', '::1'),
(385, 1, 4, 'kreirajPivnicu.php', '2022-06-26 20:42:08', 'Windows Google Chrome', '::1'),
(386, 1, 4, 'moderatoriPivnica.php', '2022-06-26 20:42:10', 'Windows Google Chrome', '::1'),
(387, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-26 20:42:14', 'Windows Google Chrome', '::1'),
(388, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-26 20:42:22', 'Windows Google Chrome', '::1'),
(389, 1, 4, 'konfiguracijaSustava.php', '2022-06-26 20:42:25', 'Windows Google Chrome', '::1'),
(390, 1, 4, 'konfiguracijaSustava.php', '2022-06-26 20:42:29', 'Windows Google Chrome', '::1'),
(391, 1, 4, 'dnevnikRada.php', '2022-06-26 20:42:50', 'Windows Google Chrome', '::1'),
(392, 1, 4, 'index.php', '2022-06-26 20:43:18', 'Windows Google Chrome', '::1'),
(393, 1, 4, 'kreirajPivnicu.php', '2022-06-26 20:43:21', 'Windows Google Chrome', '::1'),
(394, 1, 4, 'moderatoriPivnica.php', '2022-06-26 20:43:41', 'Windows Google Chrome', '::1'),
(395, 1, 4, 'index.php', '2022-06-26 20:45:07', 'Windows Google Chrome', '::1'),
(396, 1, 4, 'index.php', '2022-06-26 20:45:12', 'Windows Google Chrome', '::1'),
(397, 1, 4, 'index.php', '2022-06-26 20:45:13', 'Windows Google Chrome', '::1'),
(398, 1, 4, 'index.php', '2022-06-26 20:45:14', 'Windows Google Chrome', '::1'),
(399, 1, 4, 'index.php', '2022-06-26 20:45:14', 'Windows Google Chrome', '::1'),
(400, 1, 4, 'index.php', '2022-06-26 20:45:15', 'Windows Google Chrome', '::1'),
(401, 1, 4, 'index.php', '2022-06-26 20:45:16', 'Windows Google Chrome', '::1'),
(402, 1, 4, 'index.php', '2022-06-26 20:45:34', 'Windows Google Chrome', '::1'),
(403, 1, 4, 'kreirajPivnicu.php', '2022-06-26 20:45:35', 'Windows Google Chrome', '::1'),
(404, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-26 20:45:39', 'Windows Google Chrome', '::1'),
(405, 1, 4, 'kreirajPivnicu.php', '2022-06-26 20:46:10', 'Windows Google Chrome', '::1'),
(406, 1, 4, 'kreirajPivnicu.php', '2022-06-26 22:48:02', 'Windows Google Chrome', '::1'),
(407, 1, 2, 'odjava.php', '2022-06-26 22:48:02', 'Windows Google Chrome', '::1'),
(408, 1, 1, 'prijava.php', '2022-06-26 22:48:16', 'Windows Google Chrome', '::1'),
(409, 1, 4, 'index.php', '2022-06-26 22:48:16', 'Windows Google Chrome', '::1'),
(410, 1, 2, 'odjava.php', '2022-06-26 23:08:09', 'Windows Google Chrome', '::1'),
(411, 2, 1, 'prijava.php', '2022-06-26 23:08:33', 'Windows Google Chrome', '::1'),
(412, 2, 4, 'index.php', '2022-06-26 23:08:33', 'Windows Google Chrome', '::1'),
(413, 2, 4, 'index.php', '2022-06-26 23:08:37', 'Windows Google Chrome', '::1'),
(414, 2, 4, 'index.php', '2022-06-26 23:08:40', 'Windows Google Chrome', '::1'),
(415, 2, 2, 'odjava.php', '2022-06-26 23:23:50', 'Windows Google Chrome', '::1'),
(416, 1, 1, 'prijava.php', '2022-06-26 23:24:06', 'Windows Google Chrome', '::1'),
(417, 1, 4, 'index.php', '2022-06-26 23:24:06', 'Windows Google Chrome', '::1'),
(418, 1, 4, 'index.php', '2022-06-26 23:24:08', 'Windows Google Chrome', '::1'),
(419, 1, 4, 'kreirajPivnicu.php', '2022-06-26 23:24:11', 'Windows Google Chrome', '::1'),
(420, 1, 4, 'kreirajPivnicu.php', '2022-06-26 23:24:44', 'Windows Google Chrome', '::1'),
(421, 1, 4, 'kreirajPivnicu.php', '2022-06-26 23:25:53', 'Windows Google Chrome', '::1'),
(422, 1, 2, 'odjava.php', '2022-06-26 23:32:08', 'Windows Google Chrome', '::1'),
(423, 1, 1, 'prijava.php', '2022-06-26 23:34:18', 'Windows Google Chrome', '::1'),
(424, 1, 4, 'index.php', '2022-06-26 23:34:18', 'Windows Google Chrome', '::1'),
(425, 1, 4, 'moderatoriPivnica.php', '2022-06-26 23:34:27', 'Windows Google Chrome', '::1'),
(426, 1, 4, 'moderatoriPivnica.php', '2022-06-26 23:36:04', 'Windows Google Chrome', '::1'),
(427, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-26 23:36:14', 'Windows Google Chrome', '::1'),
(428, 1, 4, 'moderatoriPivnica.php', '2022-06-26 23:36:27', 'Windows Google Chrome', '::1'),
(429, 1, 4, 'moderatoriPivnica.php', '2022-06-26 23:36:36', 'Windows Google Chrome', '::1'),
(430, 1, 4, 'moderatoriPivnica.php', '2022-06-26 23:36:43', 'Windows Google Chrome', '::1'),
(431, 1, 4, 'dnevnikRada.php', '2022-06-26 23:36:44', 'Windows Google Chrome', '::1'),
(432, 1, 4, 'kreirajPivnicu.php', '2022-06-26 23:37:04', 'Windows Google Chrome', '::1'),
(433, 1, 4, 'index.php', '2022-06-26 23:38:09', 'Windows Google Chrome', '::1'),
(434, 1, 4, 'kreirajPivnicu.php', '2022-06-26 23:38:12', 'Windows Google Chrome', '::1'),
(435, 1, 4, 'moderatoriPivnica.php', '2022-06-26 23:38:16', 'Windows Google Chrome', '::1'),
(436, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-26 23:38:23', 'Windows Google Chrome', '::1'),
(437, 1, 4, 'dnevnikRada.php', '2022-06-26 23:38:29', 'Windows Google Chrome', '::1'),
(438, 1, 4, 'index.php', '2022-06-26 23:38:58', 'Windows Google Chrome', '::1'),
(439, 1, 4, 'kreirajPivnicu.php', '2022-06-26 23:39:00', 'Windows Google Chrome', '::1'),
(440, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:25:58', 'Windows Google Chrome', '::1'),
(441, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:26:57', 'Windows Google Chrome', '::1'),
(442, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:28:28', 'Windows Google Chrome', '::1'),
(443, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:32:05', 'Windows Google Chrome', '::1'),
(444, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:34:08', 'Windows Google Chrome', '::1'),
(445, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:36:30', 'Windows Google Chrome', '::1'),
(446, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:39:32', 'Windows Google Chrome', '::1'),
(447, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:41:12', 'Windows Google Chrome', '::1'),
(448, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:42:10', 'Windows Google Chrome', '::1'),
(449, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:42:53', 'Windows Google Chrome', '::1'),
(450, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:44:18', 'Windows Google Chrome', '::1'),
(451, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:44:55', 'Windows Google Chrome', '::1'),
(452, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:46:12', 'Windows Google Chrome', '::1'),
(453, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:49:14', 'Windows Google Chrome', '::1'),
(454, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:52:54', 'Windows Google Chrome', '::1'),
(455, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:57:30', 'Windows Google Chrome', '::1'),
(456, 1, 4, 'kreirajPivnicu.php', '2022-06-27 00:59:28', 'Windows Google Chrome', '::1'),
(457, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:06:24', 'Windows Google Chrome', '::1'),
(458, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:07:02', 'Windows Google Chrome', '::1'),
(459, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:07:41', 'Windows Google Chrome', '::1'),
(460, 1, 4, 'index.php', '2022-06-27 01:08:10', 'Windows Google Chrome', '::1'),
(461, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:08:15', 'Windows Google Chrome', '::1'),
(462, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:09:38', 'Windows Google Chrome', '::1'),
(463, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:09:54', 'Windows Google Chrome', '::1'),
(464, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:11:59', 'Windows Google Chrome', '::1'),
(465, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:13:39', 'Windows Google Chrome', '::1'),
(466, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:13:57', 'Windows Google Chrome', '::1'),
(467, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:13:59', 'Windows Google Chrome', '::1'),
(468, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:14:01', 'Windows Google Chrome', '::1'),
(469, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:14:41', 'Windows Google Chrome', '::1'),
(470, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:15:02', 'Windows Google Chrome', '::1'),
(471, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:15:23', 'Windows Google Chrome', '::1'),
(472, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:16:09', 'Windows Google Chrome', '::1'),
(473, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:16:37', 'Windows Google Chrome', '::1'),
(474, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:16:47', 'Windows Google Chrome', '::1'),
(475, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:18:27', 'Windows Google Chrome', '::1'),
(476, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:18:42', 'Windows Google Chrome', '::1'),
(477, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:19:40', 'Windows Google Chrome', '::1'),
(478, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:20:54', 'Windows Google Chrome', '::1'),
(479, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:23:04', 'Windows Google Chrome', '::1'),
(480, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:23:44', 'Windows Google Chrome', '::1'),
(481, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:23:58', 'Windows Google Chrome', '::1'),
(482, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:24:10', 'Windows Google Chrome', '::1'),
(483, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:24:24', 'Windows Google Chrome', '::1'),
(484, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:24:34', 'Windows Google Chrome', '::1'),
(485, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:25:06', 'Windows Google Chrome', '::1'),
(486, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:25:14', 'Windows Google Chrome', '::1'),
(487, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:25:22', 'Windows Google Chrome', '::1'),
(488, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:25:34', 'Windows Google Chrome', '::1'),
(489, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:25:42', 'Windows Google Chrome', '::1'),
(490, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:25:49', 'Windows Google Chrome', '::1'),
(491, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:25:55', 'Windows Google Chrome', '::1'),
(492, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:26:11', 'Windows Google Chrome', '::1'),
(493, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:26:20', 'Windows Google Chrome', '::1'),
(494, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:26:27', 'Windows Google Chrome', '::1'),
(495, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:26:49', 'Windows Google Chrome', '::1'),
(496, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:26:58', 'Windows Google Chrome', '::1'),
(497, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:04', 'Windows Google Chrome', '::1'),
(498, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:31', 'Windows Google Chrome', '::1'),
(499, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:34', 'Windows Google Chrome', '::1'),
(500, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:37', 'Windows Google Chrome', '::1'),
(501, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:39', 'Windows Google Chrome', '::1'),
(502, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:41', 'Windows Google Chrome', '::1'),
(503, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:44', 'Windows Google Chrome', '::1'),
(504, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:47', 'Windows Google Chrome', '::1'),
(505, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:49', 'Windows Google Chrome', '::1'),
(506, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:50', 'Windows Google Chrome', '::1'),
(507, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:52', 'Windows Google Chrome', '::1'),
(508, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:53', 'Windows Google Chrome', '::1'),
(509, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:54', 'Windows Google Chrome', '::1'),
(510, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:55', 'Windows Google Chrome', '::1'),
(511, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:55', 'Windows Google Chrome', '::1'),
(512, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:27:56', 'Windows Google Chrome', '::1'),
(513, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:28:05', 'Windows Google Chrome', '::1'),
(514, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:28:12', 'Windows Google Chrome', '::1'),
(515, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:28:18', 'Windows Google Chrome', '::1'),
(516, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:28:26', 'Windows Google Chrome', '::1'),
(517, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:28:36', 'Windows Google Chrome', '::1'),
(518, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:28:41', 'Windows Google Chrome', '::1'),
(519, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:28:48', 'Windows Google Chrome', '::1'),
(520, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:28:53', 'Windows Google Chrome', '::1'),
(521, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:29:02', 'Windows Google Chrome', '::1'),
(522, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:29:13', 'Windows Google Chrome', '::1'),
(523, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:29:29', 'Windows Google Chrome', '::1'),
(524, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:29:38', 'Windows Google Chrome', '::1'),
(525, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:29:44', 'Windows Google Chrome', '::1'),
(526, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:30:03', 'Windows Google Chrome', '::1'),
(527, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:30:11', 'Windows Google Chrome', '::1'),
(528, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:30:19', 'Windows Google Chrome', '::1'),
(529, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:30:27', 'Windows Google Chrome', '::1'),
(530, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:30:33', 'Windows Google Chrome', '::1'),
(531, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:30:39', 'Windows Google Chrome', '::1'),
(532, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:30:45', 'Windows Google Chrome', '::1'),
(533, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:31:01', 'Windows Google Chrome', '::1'),
(534, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:31:08', 'Windows Google Chrome', '::1'),
(535, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:31:21', 'Windows Google Chrome', '::1'),
(536, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:31:29', 'Windows Google Chrome', '::1'),
(537, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:31:34', 'Windows Google Chrome', '::1'),
(538, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:31:41', 'Windows Google Chrome', '::1'),
(539, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:31:52', 'Windows Google Chrome', '::1'),
(540, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:32:03', 'Windows Google Chrome', '::1'),
(541, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:32:15', 'Windows Google Chrome', '::1'),
(542, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:32:21', 'Windows Google Chrome', '::1'),
(543, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:32:28', 'Windows Google Chrome', '::1'),
(544, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:32:35', 'Windows Google Chrome', '::1'),
(545, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:32:41', 'Windows Google Chrome', '::1'),
(546, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:32:47', 'Windows Google Chrome', '::1'),
(547, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:32:57', 'Windows Google Chrome', '::1'),
(548, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:33:08', 'Windows Google Chrome', '::1'),
(549, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:33:14', 'Windows Google Chrome', '::1'),
(550, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:33:20', 'Windows Google Chrome', '::1'),
(551, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:34:05', 'Windows Google Chrome', '::1'),
(552, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:34:18', 'Windows Google Chrome', '::1'),
(553, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:34:26', 'Windows Google Chrome', '::1'),
(554, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:36:51', 'Windows Google Chrome', '::1'),
(555, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:40:37', 'Windows Google Chrome', '::1'),
(556, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:48:40', 'Windows Google Chrome', '::1'),
(557, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:49:32', 'Windows Google Chrome', '::1'),
(558, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:49:50', 'Windows Google Chrome', '::1'),
(559, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:50:53', 'Windows Google Chrome', '::1'),
(560, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:51:01', 'Windows Google Chrome', '::1'),
(561, 1, 4, 'kreirajPivnicu.php', '2022-06-27 01:51:51', 'Windows Google Chrome', '::1'),
(562, 1, 4, 'index.php', '2022-06-27 02:21:05', 'Windows Google Chrome', '::1'),
(563, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:21:07', 'Windows Google Chrome', '::1'),
(564, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:21:24', 'Windows Google Chrome', '::1'),
(565, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:22:11', 'Windows Google Chrome', '::1'),
(566, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:24:13', 'Windows Google Chrome', '::1'),
(567, 1, 4, 'index.php', '2022-06-27 02:31:35', 'Windows Google Chrome', '::1'),
(568, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:31:37', 'Windows Google Chrome', '::1'),
(569, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:31:55', 'Windows Google Chrome', '::1'),
(570, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:32:18', 'Windows Google Chrome', '::1'),
(571, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:32:47', 'Windows Google Chrome', '::1'),
(572, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:33:19', 'Windows Google Chrome', '::1'),
(573, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:33:28', 'Windows Google Chrome', '::1'),
(574, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:33:37', 'Windows Google Chrome', '::1'),
(575, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:33:44', 'Windows Google Chrome', '::1'),
(576, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:33:50', 'Windows Google Chrome', '::1'),
(577, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:34:00', 'Windows Google Chrome', '::1'),
(578, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:34:52', 'Windows Google Chrome', '::1'),
(579, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:35:09', 'Windows Google Chrome', '::1'),
(580, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:35:19', 'Windows Google Chrome', '::1'),
(581, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:35:41', 'Windows Google Chrome', '::1'),
(582, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:36:24', 'Windows Google Chrome', '::1'),
(583, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:36:47', 'Windows Google Chrome', '::1'),
(584, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:38:35', 'Windows Google Chrome', '::1'),
(585, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:38:46', 'Windows Google Chrome', '::1'),
(586, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:38:54', 'Windows Google Chrome', '::1'),
(587, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:39:04', 'Windows Google Chrome', '::1'),
(588, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:40:10', 'Windows Google Chrome', '::1'),
(589, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:40:35', 'Windows Google Chrome', '::1'),
(590, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:40:46', 'Windows Google Chrome', '::1'),
(591, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:40:54', 'Windows Google Chrome', '::1'),
(592, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:41:05', 'Windows Google Chrome', '::1'),
(593, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:41:16', 'Windows Google Chrome', '::1'),
(594, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:41:41', 'Windows Google Chrome', '::1'),
(595, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:41:49', 'Windows Google Chrome', '::1'),
(596, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:41:55', 'Windows Google Chrome', '::1'),
(597, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:43:28', 'Windows Google Chrome', '::1'),
(598, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:43:43', 'Windows Google Chrome', '::1'),
(599, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:43:50', 'Windows Google Chrome', '::1'),
(600, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:44:09', 'Windows Google Chrome', '::1'),
(601, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:44:17', 'Windows Google Chrome', '::1'),
(602, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:45:11', 'Windows Google Chrome', '::1'),
(603, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:45:15', 'Windows Google Chrome', '::1'),
(604, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:45:17', 'Windows Google Chrome', '::1'),
(605, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:45:24', 'Windows Google Chrome', '::1'),
(606, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:45:39', 'Windows Google Chrome', '::1'),
(607, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:45:49', 'Windows Google Chrome', '::1'),
(608, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:45:58', 'Windows Google Chrome', '::1'),
(609, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:46:03', 'Windows Google Chrome', '::1'),
(610, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:46:09', 'Windows Google Chrome', '::1'),
(611, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:46:21', 'Windows Google Chrome', '::1'),
(612, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:46:24', 'Windows Google Chrome', '::1');
INSERT INTO `dnevnik` (`id_dnevnik`, `id_korisnik`, `id_tip_zapisa`, `zapis`, `datum`, `preglednik`, `adresa`) VALUES
(613, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:47:35', 'Windows Google Chrome', '::1'),
(614, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:47:46', 'Windows Google Chrome', '::1'),
(615, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:48:03', 'Windows Google Chrome', '::1'),
(616, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:48:19', 'Windows Google Chrome', '::1'),
(617, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:49:49', 'Windows Google Chrome', '::1'),
(618, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:50:08', 'Windows Google Chrome', '::1'),
(619, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:50:47', 'Windows Google Chrome', '::1'),
(620, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:50:59', 'Windows Google Chrome', '::1'),
(621, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:51:07', 'Windows Google Chrome', '::1'),
(622, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:51:21', 'Windows Google Chrome', '::1'),
(623, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:51:47', 'Windows Google Chrome', '::1'),
(624, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:51:49', 'Windows Google Chrome', '::1'),
(625, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:52:20', 'Windows Google Chrome', '::1'),
(626, 1, 3, 'insert into pivnica', '2022-06-27 02:52:20', 'Windows Google Chrome', '::1'),
(627, 1, 4, 'moderatoriPivnica.php', '2022-06-27 02:53:48', 'Windows Google Chrome', '::1'),
(628, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:53:53', 'Windows Google Chrome', '::1'),
(629, 1, 4, 'index.php', '2022-06-27 02:53:58', 'Windows Google Chrome', '::1'),
(630, 1, 4, 'kreirajPivnicu.php', '2022-06-27 02:54:00', 'Windows Google Chrome', '::1'),
(631, 1, 4, 'moderatoriPivnica.php', '2022-06-27 02:54:02', 'Windows Google Chrome', '::1'),
(632, 1, 4, 'moderatoriPivnica.php', '2022-06-27 02:54:14', 'Windows Google Chrome', '::1'),
(633, 1, 3, 'insert into moderator', '2022-06-27 02:54:14', 'Windows Google Chrome', '::1'),
(634, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-27 02:54:21', 'Windows Google Chrome', '::1'),
(635, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-27 02:56:13', 'Windows Google Chrome', '::1'),
(636, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-27 02:56:21', 'Windows Google Chrome', '::1'),
(637, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-27 02:56:34', 'Windows Google Chrome', '::1'),
(638, 1, 4, 'konfiguracijaSustava.php', '2022-06-27 02:57:51', 'Windows Google Chrome', '::1'),
(639, 1, 4, 'konfiguracijaSustava.php', '2022-06-27 02:57:59', 'Windows Google Chrome', '::1'),
(640, 1, 4, 'konfiguracijaSustava.php', '2022-06-27 02:58:09', 'Windows Google Chrome', '::1'),
(641, 1, 3, 'update konfiguracija_sustava', '2022-06-20 03:58:09', 'Windows Google Chrome', '::1'),
(642, 1, 4, 'kreirajPivnicu.php', '2022-06-20 03:58:42', 'Windows Google Chrome', '::1'),
(643, 1, 4, 'moderatoriPivnica.php', '2022-06-20 03:58:45', 'Windows Google Chrome', '::1'),
(644, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 03:58:59', 'Windows Google Chrome', '::1'),
(645, 1, 4, 'kreirajPivnicu.php', '2022-06-20 03:59:02', 'Windows Google Chrome', '::1'),
(646, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-20 03:59:08', 'Windows Google Chrome', '::1'),
(647, 1, 4, 'konfiguracijaSustava.php', '2022-06-20 03:59:16', 'Windows Google Chrome', '::1'),
(648, 1, 4, 'dnevnikRada.php', '2022-06-20 03:59:19', 'Windows Google Chrome', '::1'),
(649, 1, 4, 'kreirajPivnicu.php', '2022-06-20 04:00:38', 'Windows Google Chrome', '::1'),
(650, 1, 4, 'moderatoriPivnica.php', '2022-06-20 04:00:42', 'Windows Google Chrome', '::1'),
(651, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 04:00:45', 'Windows Google Chrome', '::1'),
(652, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-20 04:00:48', 'Windows Google Chrome', '::1'),
(653, 1, 4, 'dnevnikRada.php', '2022-06-20 04:00:53', 'Windows Google Chrome', '::1'),
(654, 1, 4, 'dnevnikRada.php', '2022-06-20 04:04:58', 'Windows Google Chrome', '::1'),
(655, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 04:12:30', 'Windows Google Chrome', '::1'),
(656, 1, 2, 'odjava.php', '2022-06-20 04:13:09', 'Windows Google Chrome', '::1'),
(657, 2, 1, 'prijava.php', '2022-06-20 04:13:22', 'Windows Google Chrome', '::1'),
(658, 2, 4, 'index.php', '2022-06-20 04:13:22', 'Windows Google Chrome', '::1'),
(659, 2, 4, 'index.php', '2022-06-20 04:13:24', 'Windows Google Chrome', '::1'),
(660, 2, 4, 'index.php', '2022-06-20 04:43:07', 'Windows Google Chrome', '::1'),
(661, 2, 4, 'kreirajPivo.php', '2022-06-20 04:43:09', 'Windows Google Chrome', '::1'),
(662, 2, 4, 'kreirajPivo.php', '2022-06-20 04:44:41', 'Windows Google Chrome', '::1'),
(663, 2, 4, 'kreirajPivo.php', '2022-06-20 04:51:54', 'Windows Google Chrome', '::1'),
(664, 2, 4, 'index.php', '2022-06-20 04:53:23', 'Windows Google Chrome', '::1'),
(665, 2, 4, 'kreirajPivo.php', '2022-06-20 04:53:25', 'Windows Google Chrome', '::1'),
(666, 2, 4, 'kreirajPivo.php', '2022-06-20 04:54:16', 'Windows Google Chrome', '::1'),
(667, 2, 4, 'galerijaSlika.php', '2022-06-20 05:09:25', 'Windows Google Chrome', '::1'),
(668, 2, 4, 'galerijaSlika.php', '2022-06-20 05:09:58', 'Windows Google Chrome', '::1'),
(669, 2, 4, 'galerijaSlika.php', '2022-06-20 05:09:59', 'Windows Google Chrome', '::1'),
(670, 2, 4, 'galerijaSlika.php', '2022-06-20 05:10:02', 'Windows Google Chrome', '::1'),
(671, 2, 4, 'galerijaSlika.php', '2022-06-20 05:10:27', 'Windows Google Chrome', '::1'),
(672, 2, 4, 'galerijaSlika.php', '2022-06-20 05:10:29', 'Windows Google Chrome', '::1'),
(673, 2, 4, 'galerijaSlika.php', '2022-06-20 05:11:11', 'Windows Google Chrome', '::1'),
(674, 2, 4, 'kreirajPivo.php', '2022-06-20 05:11:22', 'Windows Google Chrome', '::1'),
(675, 2, 4, 'kreirajPivo.php', '2022-06-20 05:12:53', 'Windows Google Chrome', '::1'),
(676, 2, 4, 'index.php', '2022-06-20 05:26:36', 'Windows Google Chrome', '::1'),
(677, 2, 4, 'kreirajPivo.php', '2022-06-20 05:27:41', 'Windows Google Chrome', '::1'),
(678, 2, 4, 'kreirajPivo.php', '2022-06-20 05:27:46', 'Windows Google Chrome', '::1'),
(679, 2, 4, 'index.php', '2022-06-20 05:28:14', 'Windows Google Chrome', '::1'),
(680, 2, 4, 'kreirajPivo.php', '2022-06-20 05:28:16', 'Windows Google Chrome', '::1'),
(681, 2, 4, 'index.php', '2022-06-20 05:42:36', 'Windows Google Chrome', '::1'),
(682, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 05:42:48', 'Windows Google Chrome', '::1'),
(683, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 06:02:27', 'Windows Google Chrome', '::1'),
(684, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 06:03:22', 'Windows Google Chrome', '::1'),
(685, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 06:13:52', 'Windows Google Chrome', '::1'),
(686, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 06:17:44', 'Windows Google Chrome', '::1'),
(687, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 06:18:34', 'Windows Google Chrome', '::1'),
(688, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 06:23:35', 'Windows Google Chrome', '::1'),
(689, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 06:23:48', 'Windows Google Chrome', '::1'),
(690, 2, 3, 'update pivo', '2022-06-20 06:23:48', 'Windows Google Chrome', '::1'),
(691, 2, 4, 'kreirajPivo.php', '2022-06-20 06:23:54', 'Windows Google Chrome', '::1'),
(692, 2, 4, 'kreirajPivo.php', '2022-06-20 06:24:35', 'Windows Google Chrome', '::1'),
(693, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 06:25:00', 'Windows Google Chrome', '::1'),
(694, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 06:25:03', 'Windows Google Chrome', '::1'),
(695, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 06:25:13', 'Windows Google Chrome', '::1'),
(696, 2, 3, 'update pivo', '2022-06-20 06:25:13', 'Windows Google Chrome', '::1'),
(697, 2, 4, 'pivoZemljaPorijekla.php', '2022-06-20 06:25:33', 'Windows Google Chrome', '::1'),
(698, 2, 3, 'update pivo', '2022-06-20 06:25:33', 'Windows Google Chrome', '::1'),
(699, 2, 2, 'odjava.php', '2022-06-20 06:55:29', 'Windows Google Chrome', '::1'),
(700, 1, 1, 'prijava.php', '2022-06-20 06:55:45', 'Windows Google Chrome', '::1'),
(701, 1, 4, 'index.php', '2022-06-20 06:55:45', 'Windows Google Chrome', '::1'),
(702, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 06:55:50', 'Windows Google Chrome', '::1'),
(703, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 06:57:59', 'Windows Google Chrome', '::1'),
(704, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 06:58:08', 'Windows Google Chrome', '::1'),
(705, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 07:10:11', 'Windows Google Chrome', '::1'),
(706, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 07:10:22', 'Windows Google Chrome', '::1'),
(707, 1, 3, 'insert into zemlja_porijekla', '2022-06-20 07:10:22', 'Windows Google Chrome', '::1'),
(708, 1, 3, 'update pivo', '2022-06-20 07:10:22', 'Windows Google Chrome', '::1'),
(709, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 07:10:35', 'Windows Google Chrome', '::1'),
(710, 1, 3, 'insert into zemlja_porijekla', '2022-06-20 07:10:35', 'Windows Google Chrome', '::1'),
(711, 1, 3, 'update pivo', '2022-06-20 07:10:35', 'Windows Google Chrome', '::1'),
(712, 1, 4, 'index.php', '2022-06-20 07:11:28', 'Windows Google Chrome', '::1'),
(713, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:11:33', 'Windows Google Chrome', '::1'),
(714, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 07:13:35', 'Windows Google Chrome', '::1'),
(715, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 07:21:24', 'Windows Google Chrome', '::1'),
(716, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:21:27', 'Windows Google Chrome', '::1'),
(717, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:22:29', 'Windows Google Chrome', '::1'),
(718, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:23:03', 'Windows Google Chrome', '::1'),
(719, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:23:43', 'Windows Google Chrome', '::1'),
(720, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:24:02', 'Windows Google Chrome', '::1'),
(721, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:26:12', 'Windows Google Chrome', '::1'),
(722, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:26:18', 'Windows Google Chrome', '::1'),
(723, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:26:50', 'Windows Google Chrome', '::1'),
(724, 1, 3, 'insert into pivnica', '2022-06-20 07:26:50', 'Windows Google Chrome', '::1'),
(725, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:27:00', 'Windows Google Chrome', '::1'),
(726, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:27:40', 'Windows Google Chrome', '::1'),
(727, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:27:58', 'Windows Google Chrome', '::1'),
(728, 1, 3, 'insert into pivnica', '2022-06-20 07:27:58', 'Windows Google Chrome', '::1'),
(729, 1, 3, 'update pivo', '2022-06-20 07:27:58', 'Windows Google Chrome', '::1'),
(730, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 07:28:28', 'Windows Google Chrome', '::1'),
(731, 1, 4, 'kreirajPivnicu.php', '2022-06-20 07:28:32', 'Windows Google Chrome', '::1'),
(732, 1, 4, 'moderatoriPivnica.php', '2022-06-20 07:32:33', 'Linux Google Chrome', '::1'),
(733, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 07:32:36', 'Linux Google Chrome', '::1'),
(734, 1, 4, 'konfiguracijaSustava.php', '2022-06-20 07:32:41', 'Linux Google Chrome', '::1'),
(735, 1, 4, 'dnevnikRada.php', '2022-06-20 07:32:44', 'Linux Google Chrome', '::1'),
(736, 1, 4, 'dnevnikRada.php', '2022-06-20 07:32:56', 'Linux Google Chrome', '::1'),
(737, 1, 4, 'index.php', '2022-06-20 07:32:57', 'Linux Google Chrome', '::1'),
(738, 1, 4, 'index.php', '2022-06-20 07:33:01', 'Linux Google Chrome', '::1'),
(739, 1, 4, 'kreirajPivo.php', '2022-06-20 07:33:04', 'Linux Google Chrome', '::1'),
(740, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-20 07:33:15', 'Linux Google Chrome', '::1'),
(741, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-20 07:33:27', 'Linux Google Chrome', '::1'),
(742, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-20 07:33:31', 'Linux Google Chrome', '::1'),
(743, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-20 07:33:40', 'Windows Google Chrome', '::1'),
(744, 1, 1, 'prijava.php', '2022-06-20 14:26:43', 'Windows Google Chrome', '::1'),
(745, 1, 4, 'index.php', '2022-06-20 14:26:43', 'Windows Google Chrome', '::1'),
(746, 1, 4, 'index.php', '2022-06-20 14:26:47', 'Windows Google Chrome', '::1'),
(747, 1, 4, 'kreirajPivnicu.php', '2022-06-20 14:30:10', 'Windows Google Chrome', '::1'),
(748, 1, 4, 'moderatoriPivnica.php', '2022-06-20 14:30:33', 'Windows Google Chrome', '::1'),
(749, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 14:30:36', 'Windows Google Chrome', '::1'),
(750, 1, 4, 'kreirajZemljuPorijekla.php', '2022-06-20 14:30:50', 'Windows Google Chrome', '::1'),
(751, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-20 14:30:52', 'Windows Google Chrome', '::1'),
(752, 1, 4, 'konfiguracijaSustava.php', '2022-06-20 14:30:55', 'Windows Google Chrome', '::1'),
(753, 1, 4, 'dnevnikRada.php', '2022-06-20 14:31:08', 'Windows Google Chrome', '::1'),
(754, 1, 4, 'index.php', '2022-06-20 14:31:20', 'Windows Google Chrome', '::1'),
(755, 1, 4, 'index.php', '2022-06-20 14:31:21', 'Windows Google Chrome', '::1'),
(756, 1, 4, 'index.php', '2022-06-20 14:31:24', 'Windows Google Chrome', '::1'),
(757, 1, 4, 'kreirajPivo.php', '2022-06-20 14:31:26', 'Windows Google Chrome', '::1'),
(758, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-20 14:31:37', 'Windows Google Chrome', '::1'),
(759, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-20 14:31:43', 'Windows Google Chrome', '::1'),
(760, 1, 4, 'index.php', '2022-06-20 14:31:49', 'Windows Google Chrome', '::1'),
(761, 1, 4, 'index.php', '2022-06-20 14:32:00', 'Windows Google Chrome', '::1'),
(762, 1, 4, 'index.php', '2022-06-20 14:32:59', 'Windows Google Chrome', '::1'),
(763, 1, 4, 'kreirajPivo.php', '2022-06-20 14:45:00', 'Windows Google Chrome', '::1'),
(764, 1, 4, 'kreirajPivo.php', '2022-06-20 14:45:59', 'Windows Google Chrome', '::1'),
(765, 1, 4, 'kreirajPivo.php', '2022-06-20 15:29:57', 'Windows Google Chrome', '::1'),
(766, 1, 4, 'kreirajPivo.php', '2022-06-20 15:30:32', 'Windows Google Chrome', '::1'),
(767, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 15:30:34', 'Windows Google Chrome', '::1'),
(768, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 15:33:21', 'Windows Google Chrome', '::1'),
(769, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 15:36:09', 'Windows Google Chrome', '::1'),
(770, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 15:37:56', 'Windows Google Chrome', '::1'),
(771, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 15:39:13', 'Windows Google Chrome', '::1'),
(772, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 15:42:14', 'Windows Google Chrome', '::1'),
(773, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 15:49:16', 'Windows Google Chrome', '::1'),
(774, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 15:50:00', 'Windows Google Chrome', '::1'),
(775, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 15:50:57', 'Windows Google Chrome', '::1'),
(776, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 15:51:26', 'Windows Google Chrome', '::1'),
(777, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 16:01:57', 'Windows Google Chrome', '::1'),
(778, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 16:05:04', 'Windows Google Chrome', '::1'),
(779, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 16:07:03', 'Windows Google Chrome', '::1'),
(780, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-20 16:07:26', 'Windows Google Chrome', '::1'),
(781, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 16:07:28', 'Windows Google Chrome', '::1'),
(782, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 16:09:40', 'Windows Google Chrome', '::1'),
(783, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 16:09:43', 'Windows Google Chrome', '::1'),
(784, 1, 4, 'index.php', '2022-06-20 16:09:57', 'Windows Google Chrome', '::1'),
(785, 1, 4, 'index.php', '2022-06-20 17:01:19', 'Windows Google Chrome', '::1'),
(786, 1, 4, 'index.php', '2022-06-20 17:13:35', 'Windows Google Chrome', '::1'),
(787, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:13:37', 'Windows Google Chrome', '::1'),
(788, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:16:04', 'Windows Google Chrome', '::1'),
(789, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:16:28', 'Windows Google Chrome', '::1'),
(790, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:17:00', 'Windows Google Chrome', '::1'),
(791, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:18:45', 'Windows Google Chrome', '::1'),
(792, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:19:02', 'Windows Google Chrome', '::1'),
(793, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:28:05', 'Windows Google Chrome', '::1'),
(794, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:30:06', 'Windows Google Chrome', '::1'),
(795, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:42:14', 'Windows Google Chrome', '::1'),
(796, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:44:19', 'Windows Google Chrome', '::1'),
(797, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:46:53', 'Windows Google Chrome', '::1'),
(798, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:47:30', 'Windows Google Chrome', '::1'),
(799, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:49:17', 'Windows Google Chrome', '::1'),
(800, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:50:05', 'Windows Google Chrome', '::1'),
(801, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:50:55', 'Windows Google Chrome', '::1'),
(802, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:51:06', 'Windows Google Chrome', '::1'),
(803, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:52:30', 'Windows Google Chrome', '::1'),
(804, 1, 4, 'statistikaNovosti.php', '2022-06-20 17:52:48', 'Windows Google Chrome', '::1'),
(805, 1, 4, 'statistikaNovosti.php', '2022-06-20 19:53:42', 'Windows Google Chrome', '::1'),
(806, 1, 2, 'odjava.php', '2022-06-20 19:53:42', 'Windows Google Chrome', '::1'),
(807, 1, 1, 'prijava.php', '2022-06-20 19:54:31', 'Windows Google Chrome', '::1'),
(808, 1, 4, 'index.php', '2022-06-20 19:54:31', 'Windows Google Chrome', '::1'),
(809, 1, 4, 'index.php', '2022-06-20 19:54:35', 'Windows Google Chrome', '::1'),
(810, 1, 4, 'index.php', '2022-06-20 19:55:02', 'Windows Google Chrome', '::1'),
(811, 1, 4, 'statistikaNovosti.php', '2022-06-20 19:55:05', 'Windows Google Chrome', '::1'),
(812, 1, 4, 'statistikaNovosti.php', '2022-06-20 19:58:53', 'Windows Google Chrome', '::1'),
(813, 1, 4, 'moderatoriPivnica.php', '2022-06-20 19:58:56', 'Windows Google Chrome', '::1'),
(814, 1, 4, 'kreirajPivnicu.php', '2022-06-20 19:58:58', 'Windows Google Chrome', '::1'),
(815, 1, 4, 'kreirajPivnicu.php', '2022-06-20 19:59:14', 'Windows Google Chrome', '::1'),
(816, 1, 4, 'kreirajPivnicu.php', '2022-06-20 19:59:18', 'Windows Google Chrome', '::1'),
(817, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-20 19:59:22', 'Windows Google Chrome', '::1'),
(818, 1, 4, 'konfiguracijaSustava.php', '2022-06-20 19:59:26', 'Windows Google Chrome', '::1'),
(819, 1, 4, 'dnevnikRada.php', '2022-06-20 19:59:31', 'Windows Google Chrome', '::1'),
(820, 1, 4, 'index.php', '2022-06-20 19:59:44', 'Windows Google Chrome', '::1'),
(821, 1, 4, 'dnevnikRada.php', '2022-06-20 19:59:45', 'Windows Google Chrome', '::1'),
(822, 1, 4, 'index.php', '2022-06-20 20:08:14', 'Windows Google Chrome', '::1'),
(823, 1, 4, 'statistikaNovosti.php', '2022-06-20 20:08:16', 'Windows Google Chrome', '::1'),
(824, 1, 4, 'statistikaNovosti.php', '2022-06-20 20:10:34', 'Windows Google Chrome', '::1'),
(825, 1, 2, 'odjava.php', '2022-06-20 20:11:06', 'Windows Google Chrome', '::1'),
(826, 1, 1, 'prijava.php', '2022-06-20 20:14:45', 'Windows Google Chrome', '::1'),
(827, 1, 4, 'index.php', '2022-06-20 20:14:45', 'Windows Google Chrome', '::1'),
(828, 1, 4, 'dnevnikRada.php', '2022-06-20 20:16:23', 'Windows Google Chrome', '::1'),
(829, 1, 2, 'odjava.php', '2022-06-20 20:18:17', 'Windows Google Chrome', '::1'),
(830, 1, 1, 'prijava.php', '2022-06-20 20:37:58', 'Windows Google Chrome', '::1'),
(831, 1, 4, 'index.php', '2022-06-20 20:37:59', 'Windows Google Chrome', '::1'),
(832, 1, 4, 'kreirajPivnicu.php', '2022-06-20 20:38:11', 'Windows Google Chrome', '::1'),
(833, 1, 4, 'index.php', '2022-06-20 20:41:11', 'Windows Google Chrome', '::1'),
(834, 1, 4, 'pivnica.php', '2022-06-20 20:41:13', 'Windows Google Chrome', '::1'),
(835, 1, 4, 'pivo.php', '2022-06-20 20:47:13', 'Windows Google Chrome', '::1'),
(836, 1, 4, 'pivnica.php', '2022-06-20 20:47:41', 'Windows Google Chrome', '::1'),
(837, 1, 4, 'index.php', '2022-06-20 20:49:53', 'Windows Google Chrome', '::1'),
(838, 1, 4, 'pivo.php', '2022-06-20 20:49:55', 'Windows Google Chrome', '::1'),
(839, 1, 4, 'pivo.php', '2022-06-20 21:15:18', 'Windows Google Chrome', '::1'),
(840, 1, 2, 'odjava.php', '2022-06-20 21:15:20', 'Windows Google Chrome', '::1'),
(841, 1, 1, 'prijava.php', '2022-06-20 21:16:38', 'Windows Google Chrome', '::1'),
(842, 1, 4, 'index.php', '2022-06-20 21:16:38', 'Windows Google Chrome', '::1'),
(843, 1, 4, 'index.php', '2022-06-20 21:16:41', 'Windows Google Chrome', '::1'),
(844, 1, 4, 'pivnica.php', '2022-06-20 21:16:42', 'Windows Google Chrome', '::1'),
(845, 1, 4, 'moderatoriPivnica.php', '2022-06-20 21:16:49', 'Windows Google Chrome', '::1'),
(846, 1, 4, 'moderatoriPivnica.php', '2022-06-20 21:16:53', 'Windows Google Chrome', '::1'),
(847, 1, 4, 'moderatoriPivnica.php', '2022-06-20 21:17:26', 'Windows Google Chrome', '::1'),
(848, 1, 4, 'pivnica.php', '2022-06-20 21:17:28', 'Windows Google Chrome', '::1'),
(849, 1, 4, 'moderatoriPivnica.php', '2022-06-20 21:17:30', 'Windows Google Chrome', '::1'),
(850, 1, 4, 'zemljaPorijekla.php', '2022-06-20 21:17:33', 'Windows Google Chrome', '::1'),
(851, 1, 4, 'zemljaPorijekla.php', '2022-06-20 21:17:45', 'Windows Google Chrome', '::1'),
(852, 1, 4, 'zemljaPorijekla.php', '2022-06-20 21:17:47', 'Windows Google Chrome', '::1'),
(853, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-20 21:17:55', 'Windows Google Chrome', '::1'),
(854, 1, 4, 'konfiguracijaSustava.php', '2022-06-20 21:18:01', 'Windows Google Chrome', '::1'),
(855, 1, 4, 'dnevnikRada.php', '2022-06-20 21:18:08', 'Windows Google Chrome', '::1'),
(856, 1, 4, 'dnevnikRada.php', '2022-06-20 21:18:28', 'Windows Google Chrome', '::1'),
(857, 1, 4, 'index.php', '2022-06-20 21:19:53', 'Windows Google Chrome', '::1'),
(858, 1, 4, 'pivo.php', '2022-06-20 21:19:55', 'Windows Google Chrome', '::1'),
(859, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-20 21:20:03', 'Windows Google Chrome', '::1'),
(860, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-20 21:20:06', 'Windows Google Chrome', '::1'),
(861, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-20 21:20:09', 'Windows Google Chrome', '::1'),
(862, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 21:20:10', 'Windows Google Chrome', '::1'),
(863, 1, 4, 'index.php', '2022-06-20 21:20:22', 'Windows Google Chrome', '::1'),
(864, 1, 4, 'index.php', '2022-06-20 21:20:24', 'Windows Google Chrome', '::1'),
(865, 1, 4, 'index.php', '2022-06-20 21:20:28', 'Windows Google Chrome', '::1'),
(866, 1, 4, 'index.php', '2022-06-20 21:20:30', 'Windows Google Chrome', '::1'),
(867, 1, 4, 'index.php', '2022-06-20 21:20:33', 'Windows Google Chrome', '::1'),
(868, 1, 4, 'statistikaNovosti.php', '2022-06-20 21:20:34', 'Windows Google Chrome', '::1'),
(869, 1, 4, 'index.php', '2022-06-20 21:20:42', 'Windows Google Chrome', '::1'),
(870, 1, 4, 'index.php', '2022-06-20 21:20:46', 'Windows Google Chrome', '::1'),
(871, 1, 2, 'odjava.php', '2022-06-20 21:25:07', 'Windows Google Chrome', '::1'),
(872, 1, 1, 'prijava.php', '2022-06-20 21:25:48', 'Windows Google Chrome', '::1'),
(873, 1, 4, 'index.php', '2022-06-20 21:25:48', 'Windows Google Chrome', '::1'),
(874, 1, 4, 'pivnica.php', '2022-06-20 21:25:53', 'Windows Google Chrome', '::1'),
(875, 1, 4, 'moderatoriPivnica.php', '2022-06-20 21:26:09', 'Windows Google Chrome', '::1'),
(876, 1, 4, 'zemljaPorijekla.php', '2022-06-20 21:26:11', 'Windows Google Chrome', '::1'),
(877, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-20 21:26:16', 'Windows Google Chrome', '::1'),
(878, 1, 4, 'pivnica.php', '2022-06-20 21:26:37', 'Windows Google Chrome', '::1'),
(879, 1, 4, 'zemljaPorijekla.php', '2022-06-20 21:26:39', 'Windows Google Chrome', '::1'),
(880, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-20 21:26:42', 'Windows Google Chrome', '::1'),
(881, 1, 4, 'konfiguracijaSustava.php', '2022-06-20 21:26:48', 'Windows Google Chrome', '::1'),
(882, 1, 4, 'dnevnikRada.php', '2022-06-20 21:26:52', 'Windows Google Chrome', '::1'),
(883, 1, 4, 'index.php', '2022-06-20 21:26:56', 'Windows Google Chrome', '::1'),
(884, 1, 4, 'pivo.php', '2022-06-20 21:26:59', 'Windows Google Chrome', '::1'),
(885, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-20 21:27:03', 'Windows Google Chrome', '::1'),
(886, 1, 4, 'statistikaNarudzbi.php', '2022-06-20 21:27:05', 'Windows Google Chrome', '::1'),
(887, 1, 4, 'index.php', '2022-06-20 21:27:12', 'Windows Google Chrome', '::1'),
(888, 1, 4, 'statistikaNovosti.php', '2022-06-20 21:27:16', 'Windows Google Chrome', '::1'),
(889, 1, 4, 'index.php', '2022-06-20 22:14:50', 'Windows Google Chrome', '::1'),
(890, 1, 4, 'index.php', '2022-06-20 22:14:53', 'Windows Google Chrome', '::1'),
(891, 1, 4, 'index.php', '2022-06-20 22:14:56', 'Windows Google Chrome', '::1'),
(892, 1, 4, 'index.php', '2022-06-20 22:14:58', 'Windows Google Chrome', '::1'),
(893, 1, 4, 'index.php', '2022-06-20 22:15:00', 'Windows Google Chrome', '::1'),
(894, 1, 4, 'index.php', '2022-06-20 22:15:05', 'Windows Google Chrome', '::1'),
(895, 1, 4, 'index.php', '2022-06-21 01:16:30', 'Windows Google Chrome', '::1'),
(896, 1, 2, 'odjava.php', '2022-06-21 01:16:30', 'Windows Google Chrome', '::1'),
(897, 1, 1, 'prijava.php', '2022-06-21 02:23:16', 'Windows Google Chrome', '::1'),
(898, 1, 4, 'index.php', '2022-06-21 02:23:16', 'Windows Google Chrome', '::1'),
(899, 1, 4, 'index.php', '2022-06-21 02:23:18', 'Windows Google Chrome', '::1'),
(900, 1, 4, 'pivnica.php', '2022-06-21 02:23:21', 'Windows Google Chrome', '::1'),
(901, 1, 4, 'pivnica.php', '2022-06-21 02:24:38', 'Windows Google Chrome', '::1'),
(902, 1, 4, 'pivnica.php', '2022-06-21 02:25:45', 'Windows Google Chrome', '::1'),
(903, 1, 4, 'pivnica.php', '2022-06-21 02:26:44', 'Windows Google Chrome', '::1'),
(904, 1, 4, 'dnevnikRada.php', '2022-06-21 02:27:22', 'Windows Google Chrome', '::1'),
(905, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 02:27:29', 'Windows Google Chrome', '::1'),
(906, 1, 4, 'dnevnikRada.php', '2022-06-21 02:27:31', 'Windows Google Chrome', '::1'),
(907, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 02:27:34', 'Windows Google Chrome', '::1'),
(908, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 02:27:36', 'Windows Google Chrome', '::1'),
(909, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 02:27:40', 'Windows Google Chrome', '::1'),
(910, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 02:27:42', 'Windows Google Chrome', '::1'),
(911, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 02:28:01', 'Windows Google Chrome', '::1'),
(912, 1, 4, 'zemljaPorijekla.php', '2022-06-21 02:28:03', 'Windows Google Chrome', '::1'),
(913, 1, 4, 'index.php', '2022-06-21 02:28:30', 'Windows Google Chrome', '::1'),
(914, 1, 4, 'pivnica.php', '2022-06-21 02:28:32', 'Windows Google Chrome', '::1'),
(915, 1, 4, 'moderatoriPivnica.php', '2022-06-21 02:28:35', 'Windows Google Chrome', '::1'),
(916, 1, 4, 'zemljaPorijekla.php', '2022-06-21 02:28:37', 'Windows Google Chrome', '::1'),
(917, 1, 4, 'index.php', '2022-06-21 02:29:03', 'Windows Google Chrome', '::1'),
(918, 1, 4, 'pivo.php', '2022-06-21 02:29:05', 'Windows Google Chrome', '::1'),
(919, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-21 02:29:10', 'Windows Google Chrome', '::1'),
(920, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 02:29:13', 'Windows Google Chrome', '::1'),
(921, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 02:48:06', 'Windows Google Chrome', '::1'),
(922, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 02:48:09', 'Windows Google Chrome', '::1'),
(923, 1, 4, 'pivo.php', '2022-06-21 02:48:11', 'Windows Google Chrome', '::1'),
(924, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-21 02:48:16', 'Windows Google Chrome', '::1'),
(925, 1, 4, 'index.php', '2022-06-21 02:48:27', 'Windows Google Chrome', '::1'),
(926, 1, 4, 'index.php', '2022-06-21 02:48:28', 'Windows Google Chrome', '::1'),
(927, 1, 4, 'index.php', '2022-06-21 02:48:31', 'Windows Google Chrome', '::1'),
(928, 1, 4, 'index.php', '2022-06-21 02:48:33', 'Windows Google Chrome', '::1'),
(929, 1, 4, 'index.php', '2022-06-21 02:48:35', 'Windows Google Chrome', '::1'),
(930, 1, 4, 'statistikaNovosti.php', '2022-06-21 02:48:36', 'Windows Google Chrome', '::1'),
(931, 1, 4, 'statistikaNovosti.php', '2022-06-21 02:49:57', 'Windows Google Chrome', '::1'),
(932, 1, 4, 'pivnica.php', '2022-06-21 02:50:00', 'Windows Google Chrome', '::1'),
(933, 1, 4, 'pivnica.php', '2022-06-21 02:56:29', 'Windows Google Chrome', '::1'),
(934, 1, 4, 'pivnica.php', '2022-06-21 02:59:18', 'Windows Google Chrome', '::1'),
(935, 1, 4, 'pivnica.php', '2022-06-21 03:01:21', 'Windows Google Chrome', '::1'),
(936, 1, 4, 'pivnica.php', '2022-06-21 03:04:31', 'Windows Google Chrome', '::1'),
(937, 1, 4, 'pivnica.php', '2022-06-21 03:11:01', 'Windows Google Chrome', '::1'),
(938, 1, 4, 'pivnica.php', '2022-06-21 03:12:56', 'Windows Google Chrome', '::1'),
(939, 1, 4, 'pivnica.php', '2022-06-21 03:13:23', 'Windows Google Chrome', '::1'),
(940, 1, 3, 'insert into pivnica', '2022-06-21 03:13:24', 'Windows Google Chrome', '::1'),
(941, 1, 3, 'update pivo', '2022-06-21 03:13:24', 'Windows Google Chrome', '::1'),
(942, 1, 4, 'pivnica.php', '2022-06-21 03:14:00', 'Windows Google Chrome', '::1'),
(943, 1, 3, 'insert into pivnica', '2022-06-21 03:14:00', 'Windows Google Chrome', '::1'),
(944, 1, 3, 'update pivo', '2022-06-21 03:14:01', 'Windows Google Chrome', '::1'),
(945, 1, 4, 'pivnica.php', '2022-06-21 03:16:07', 'Windows Google Chrome', '::1'),
(946, 1, 3, 'insert into pivnica', '2022-06-21 03:16:07', 'Windows Google Chrome', '::1'),
(947, 1, 3, 'update pivnica', '2022-06-21 03:16:07', 'Windows Google Chrome', '::1'),
(948, 1, 4, 'pivnica.php', '2022-06-21 03:16:28', 'Windows Google Chrome', '::1'),
(949, 1, 4, 'pivnica.php', '2022-06-21 03:16:57', 'Windows Google Chrome', '::1'),
(950, 1, 4, 'pivnica.php', '2022-06-21 03:17:11', 'Windows Google Chrome', '::1'),
(951, 1, 3, 'insert into pivnica', '2022-06-21 03:17:11', 'Windows Google Chrome', '::1'),
(952, 1, 3, 'update pivnica', '2022-06-21 03:17:11', 'Windows Google Chrome', '::1'),
(953, 1, 4, 'pivnica.php', '2022-06-21 03:18:08', 'Windows Google Chrome', '::1'),
(954, 1, 3, 'insert into pivnica', '2022-06-21 03:18:08', 'Windows Google Chrome', '::1'),
(955, 1, 3, 'update pivnica', '2022-06-21 03:18:08', 'Windows Google Chrome', '::1'),
(956, 1, 4, 'pivnica.php', '2022-06-21 03:22:05', 'Windows Google Chrome', '::1'),
(957, 1, 4, 'pivnica.php', '2022-06-21 03:22:09', 'Windows Google Chrome', '::1'),
(958, 1, 3, 'insert into pivnica', '2022-06-21 03:22:09', 'Windows Google Chrome', '::1'),
(959, 1, 3, 'update pivnica', '2022-06-21 03:22:09', 'Windows Google Chrome', '::1'),
(960, 1, 4, 'index.php', '2022-06-21 03:25:02', 'Windows Google Chrome', '::1'),
(961, 1, 4, 'pivnica.php', '2022-06-21 03:25:04', 'Windows Google Chrome', '::1'),
(962, 1, 4, 'pivnica.php', '2022-06-21 03:25:28', 'Windows Google Chrome', '::1'),
(963, 1, 3, 'insert into pivnica', '2022-06-21 03:25:28', 'Windows Google Chrome', '::1'),
(964, 1, 3, 'update pivnica', '2022-06-21 03:25:28', 'Windows Google Chrome', '::1'),
(965, 1, 4, 'pivnica.php', '2022-06-21 03:28:09', 'Windows Google Chrome', '::1'),
(966, 1, 4, 'pivnica.php', '2022-06-21 03:28:22', 'Windows Google Chrome', '::1'),
(967, 1, 4, 'pivnica.php', '2022-06-21 03:28:31', 'Windows Google Chrome', '::1'),
(968, 1, 4, 'pivnica.php', '2022-06-21 03:28:37', 'Windows Google Chrome', '::1'),
(969, 1, 3, 'insert into pivnica', '2022-06-21 03:28:37', 'Windows Google Chrome', '::1'),
(970, 1, 4, 'pivnica.php', '2022-06-21 03:29:36', 'Windows Google Chrome', '::1'),
(971, 1, 3, 'update pivnica', '2022-06-21 03:29:36', 'Windows Google Chrome', '::1'),
(972, 1, 4, 'index.php', '2022-06-21 03:30:26', 'Windows Google Chrome', '::1'),
(973, 1, 4, 'pivnica.php', '2022-06-21 03:30:28', 'Windows Google Chrome', '::1'),
(974, 1, 4, 'pivnica.php', '2022-06-21 03:31:18', 'Windows Google Chrome', '::1'),
(975, 1, 4, 'pivnica.php', '2022-06-21 03:31:54', 'Windows Google Chrome', '::1'),
(976, 1, 3, 'insert into pivnica', '2022-06-21 03:31:54', 'Windows Google Chrome', '::1'),
(977, 1, 4, 'pivnica.php', '2022-06-21 03:32:26', 'Windows Google Chrome', '::1'),
(978, 1, 3, 'update pivnica', '2022-06-21 03:32:26', 'Windows Google Chrome', '::1'),
(979, 1, 4, 'moderatoriPivnica.php', '2022-06-21 03:33:57', 'Windows Google Chrome', '::1'),
(980, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:33:59', 'Windows Google Chrome', '::1'),
(981, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:36:18', 'Windows Google Chrome', '::1'),
(982, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:36:24', 'Windows Google Chrome', '::1'),
(983, 1, 3, 'insert into zemlja_porijekla', '2022-06-21 03:36:24', 'Windows Google Chrome', '::1'),
(984, 1, 3, 'update pivo', '2022-06-21 03:36:24', 'Windows Google Chrome', '::1'),
(985, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:40:37', 'Windows Google Chrome', '::1'),
(986, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:48:05', 'Windows Google Chrome', '::1'),
(987, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:50:39', 'Windows Google Chrome', '::1'),
(988, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:51:39', 'Windows Google Chrome', '::1'),
(989, 1, 3, 'update zemlja_porijekla', '2022-06-21 03:51:39', 'Windows Google Chrome', '::1'),
(990, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:52:07', 'Windows Google Chrome', '::1'),
(991, 1, 3, 'insert into zemlja_porijekla', '2022-06-21 03:52:07', 'Windows Google Chrome', '::1'),
(992, 1, 4, 'pivnica.php', '2022-06-21 03:52:33', 'Windows Google Chrome', '::1'),
(993, 1, 4, 'moderatoriPivnica.php', '2022-06-21 03:52:40', 'Windows Google Chrome', '::1'),
(994, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:52:45', 'Windows Google Chrome', '::1'),
(995, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 03:52:49', 'Windows Google Chrome', '::1'),
(996, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 03:52:56', 'Windows Google Chrome', '::1'),
(997, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 03:53:02', 'Windows Google Chrome', '::1'),
(998, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 03:55:13', 'Windows Google Chrome', '::1'),
(999, 1, 3, 'update konfiguracija_sustava', '2022-06-21 03:55:13', 'Windows Google Chrome', '::1'),
(1000, 1, 4, 'pivnica.php', '2022-06-21 03:55:21', 'Windows Google Chrome', '::1'),
(1001, 1, 4, 'moderatoriPivnica.php', '2022-06-21 03:55:29', 'Windows Google Chrome', '::1'),
(1002, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:55:32', 'Windows Google Chrome', '::1'),
(1003, 1, 4, 'pivnica.php', '2022-06-21 03:55:41', 'Windows Google Chrome', '::1'),
(1004, 1, 4, 'pivnica.php', '2022-06-21 03:55:45', 'Windows Google Chrome', '::1'),
(1005, 1, 4, 'moderatoriPivnica.php', '2022-06-21 03:55:48', 'Windows Google Chrome', '::1'),
(1006, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:55:54', 'Windows Google Chrome', '::1'),
(1007, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:56:04', 'Windows Google Chrome', '::1'),
(1008, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 03:56:06', 'Windows Google Chrome', '::1'),
(1009, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 03:56:10', 'Windows Google Chrome', '::1'),
(1010, 1, 4, 'dnevnikRada.php', '2022-06-21 03:56:26', 'Windows Google Chrome', '::1'),
(1011, 1, 4, 'dnevnikRada.php', '2022-06-21 03:56:50', 'Windows Google Chrome', '::1'),
(1012, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 03:56:54', 'Windows Google Chrome', '::1'),
(1013, 1, 4, 'pivnica.php', '2022-06-21 03:56:58', 'Windows Google Chrome', '::1'),
(1014, 1, 4, 'moderatoriPivnica.php', '2022-06-21 03:57:04', 'Windows Google Chrome', '::1'),
(1015, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:57:07', 'Windows Google Chrome', '::1'),
(1016, 1, 4, 'zemljaPorijekla.php', '2022-06-21 03:57:13', 'Windows Google Chrome', '::1'),
(1017, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 03:57:15', 'Windows Google Chrome', '::1'),
(1018, 1, 4, 'dnevnikRada.php', '2022-06-21 03:57:29', 'Windows Google Chrome', '::1'),
(1019, 1, 4, 'dnevnikRada.php', '2022-06-21 03:58:23', 'Windows Google Chrome', '::1'),
(1020, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 03:58:29', 'Windows Google Chrome', '::1'),
(1021, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:07:09', 'Windows Google Chrome', '::1'),
(1022, 1, 4, 'pivnica.php', '2022-06-21 04:11:43', 'Windows Google Chrome', '::1'),
(1023, 1, 4, 'moderatoriPivnica.php', '2022-06-21 04:11:47', 'Windows Google Chrome', '::1'),
(1024, 1, 4, 'zemljaPorijekla.php', '2022-06-21 04:11:49', 'Windows Google Chrome', '::1'),
(1025, 1, 4, 'zemljaPorijekla.php', '2022-06-21 04:11:53', 'Windows Google Chrome', '::1'),
(1026, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:11:55', 'Windows Google Chrome', '::1'),
(1027, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:12:01', 'Windows Google Chrome', '::1'),
(1028, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 04:12:03', 'Windows Google Chrome', '::1'),
(1029, 1, 4, 'dnevnikRada.php', '2022-06-21 04:12:06', 'Windows Google Chrome', '::1'),
(1030, 1, 4, 'pivnica.php', '2022-06-21 04:12:18', 'Windows Google Chrome', '::1'),
(1031, 1, 4, 'moderatoriPivnica.php', '2022-06-21 04:12:21', 'Windows Google Chrome', '::1'),
(1032, 1, 4, 'zemljaPorijekla.php', '2022-06-21 04:12:23', 'Windows Google Chrome', '::1'),
(1033, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:12:28', 'Windows Google Chrome', '::1'),
(1034, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:15:12', 'Windows Google Chrome', '::1'),
(1035, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:15:16', 'Windows Google Chrome', '::1'),
(1036, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:16:51', 'Windows Google Chrome', '::1'),
(1037, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:18:02', 'Windows Google Chrome', '::1'),
(1038, 1, 4, 'index.php', '2022-06-21 04:18:05', 'Windows Google Chrome', '::1'),
(1039, 1, 4, 'pivnica.php', '2022-06-21 04:18:07', 'Windows Google Chrome', '::1'),
(1040, 1, 4, 'moderatoriPivnica.php', '2022-06-21 04:18:15', 'Windows Google Chrome', '::1'),
(1041, 1, 4, 'zemljaPorijekla.php', '2022-06-21 04:18:23', 'Windows Google Chrome', '::1'),
(1042, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:18:38', 'Windows Google Chrome', '::1'),
(1043, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 04:18:48', 'Windows Google Chrome', '::1'),
(1044, 1, 4, 'dnevnikRada.php', '2022-06-21 04:18:51', 'Windows Google Chrome', '::1'),
(1045, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:20:34', 'Windows Google Chrome', '::1'),
(1046, 1, 4, 'dnevnikRada.php', '2022-06-21 04:20:43', 'Windows Google Chrome', '::1'),
(1047, 1, 4, 'dnevnikRada.php', '2022-06-21 04:27:12', 'Windows Google Chrome', '::1'),
(1048, 1, 4, 'dnevnikRada.php', '2022-06-21 04:27:39', 'Windows Google Chrome', '::1'),
(1049, 1, 4, 'dnevnikRada.php', '2022-06-21 04:29:10', 'Windows Google Chrome', '::1'),
(1050, 1, 4, 'index.php', '2022-06-21 04:31:06', 'Windows Google Chrome', '::1'),
(1051, 1, 4, 'pivnica.php', '2022-06-21 04:31:08', 'Windows Google Chrome', '::1'),
(1052, 1, 4, 'moderatoriPivnica.php', '2022-06-21 04:31:10', 'Windows Google Chrome', '::1'),
(1053, 1, 4, 'zemljaPorijekla.php', '2022-06-21 04:31:12', 'Windows Google Chrome', '::1'),
(1054, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:31:13', 'Windows Google Chrome', '::1'),
(1055, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 04:31:15', 'Windows Google Chrome', '::1'),
(1056, 1, 4, 'dnevnikRada.php', '2022-06-21 04:31:18', 'Windows Google Chrome', '::1'),
(1057, 1, 4, 'dnevnikRada.php', '2022-06-21 04:39:33', 'Windows Google Chrome', '::1'),
(1058, 1, 4, 'pivnica.php', '2022-06-21 04:39:36', 'Windows Google Chrome', '::1'),
(1059, 1, 4, 'moderatoriPivnica.php', '2022-06-21 04:39:40', 'Windows Google Chrome', '::1'),
(1060, 1, 4, 'zemljaPorijekla.php', '2022-06-21 04:39:42', 'Windows Google Chrome', '::1'),
(1061, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 04:39:45', 'Windows Google Chrome', '::1'),
(1062, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 04:39:51', 'Windows Google Chrome', '::1'),
(1063, 1, 4, 'dnevnikRada.php', '2022-06-21 04:39:54', 'Windows Google Chrome', '::1'),
(1064, 1, 4, 'index.php', '2022-06-21 04:40:00', 'Windows Google Chrome', '::1'),
(1065, 1, 4, 'index.php', '2022-06-21 04:40:02', 'Windows Google Chrome', '::1'),
(1066, 1, 4, 'pivo.php', '2022-06-21 04:40:03', 'Windows Google Chrome', '::1'),
(1067, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-21 04:40:15', 'Windows Google Chrome', '::1'),
(1068, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 04:40:24', 'Windows Google Chrome', '::1'),
(1069, 1, 4, 'pivo.php', '2022-06-21 04:40:34', 'Windows Google Chrome', '::1'),
(1070, 1, 4, 'index.php', '2022-06-21 04:41:31', 'Windows Google Chrome', '::1'),
(1071, 1, 4, 'index.php', '2022-06-21 04:41:34', 'Windows Google Chrome', '::1'),
(1072, 1, 4, 'index.php', '2022-06-21 04:41:37', 'Windows Google Chrome', '::1'),
(1073, 1, 4, 'index.php', '2022-06-21 04:41:39', 'Windows Google Chrome', '::1'),
(1074, 1, 4, 'index.php', '2022-06-21 04:41:41', 'Windows Google Chrome', '::1'),
(1075, 1, 4, 'statistikaNovosti.php', '2022-06-21 04:41:43', 'Windows Google Chrome', '::1'),
(1076, 1, 4, 'statistikaNovosti.php', '2022-06-21 04:41:50', 'Windows Google Chrome', '::1'),
(1077, 1, 4, 'statistikaNovosti.php', '2022-06-21 04:44:26', 'Windows Google Chrome', '::1'),
(1078, 1, 4, 'index.php', '2022-06-21 04:48:05', 'Windows Google Chrome', '::1'),
(1079, 1, 4, 'pivo.php', '2022-06-21 04:48:07', 'Windows Google Chrome', '::1'),
(1080, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-21 04:48:21', 'Windows Google Chrome', '::1'),
(1081, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 04:48:24', 'Windows Google Chrome', '::1'),
(1082, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 04:57:32', 'Windows Google Chrome', '::1'),
(1083, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 04:57:57', 'Windows Google Chrome', '::1'),
(1084, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 04:58:01', 'Windows Google Chrome', '::1'),
(1085, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 04:59:16', 'Windows Google Chrome', '::1'),
(1086, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 04:59:48', 'Windows Google Chrome', '::1'),
(1087, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 04:59:50', 'Windows Google Chrome', '::1'),
(1088, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 04:59:50', 'Windows Google Chrome', '::1'),
(1089, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:00:40', 'Windows Google Chrome', '::1'),
(1090, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:01:42', 'Windows Google Chrome', '::1'),
(1091, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:03:10', 'Windows Google Chrome', '::1'),
(1092, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:05:04', 'Windows Google Chrome', '::1'),
(1093, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:05:43', 'Windows Google Chrome', '::1'),
(1094, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:07:52', 'Windows Google Chrome', '::1'),
(1095, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:08:16', 'Windows Google Chrome', '::1'),
(1096, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:10:44', 'Windows Google Chrome', '::1'),
(1097, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:11:35', 'Windows Google Chrome', '::1'),
(1098, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:13:47', 'Windows Google Chrome', '::1'),
(1099, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:14:07', 'Windows Google Chrome', '::1'),
(1100, 1, 4, 'pivo.php', '2022-06-21 05:14:44', 'Windows Google Chrome', '::1'),
(1101, 1, 4, 'pivo.php', '2022-06-21 05:14:57', 'Windows Google Chrome', '::1'),
(1102, 1, 4, 'pivo.php', '2022-06-21 05:16:28', 'Windows Google Chrome', '::1'),
(1103, 1, 4, 'pivo.php', '2022-06-21 05:17:27', 'Windows Google Chrome', '::1'),
(1104, 1, 4, 'pivo.php', '2022-06-21 05:23:38', 'Windows Google Chrome', '::1'),
(1105, 1, 4, 'pivo.php', '2022-06-21 05:31:14', 'Windows Google Chrome', '::1'),
(1106, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 05:37:08', 'Windows Google Chrome', '::1'),
(1107, 1, 4, 'pivo.php', '2022-06-21 05:42:08', 'Windows Google Chrome', '::1'),
(1108, 1, 4, 'pivo.php', '2022-06-21 05:42:46', 'Windows Google Chrome', '::1'),
(1109, 1, 4, 'pivo.php', '2022-06-21 05:43:53', 'Windows Google Chrome', '::1'),
(1110, 1, 4, 'pivo.php', '2022-06-21 05:47:04', 'Windows Google Chrome', '::1'),
(1111, 1, 4, 'pivo.php', '2022-06-21 06:02:22', 'Windows Google Chrome', '::1'),
(1112, 1, 4, 'pivo.php', '2022-06-21 06:04:42', 'Windows Google Chrome', '::1'),
(1113, 1, 4, 'pivo.php', '2022-06-21 06:06:30', 'Windows Google Chrome', '::1'),
(1114, 1, 4, 'pivo.php', '2022-06-21 06:06:34', 'Windows Google Chrome', '::1'),
(1115, 1, 4, 'pivo.php', '2022-06-21 06:07:48', 'Windows Google Chrome', '::1'),
(1116, 1, 4, 'pivo.php', '2022-06-21 06:07:50', 'Windows Google Chrome', '::1'),
(1117, 1, 4, 'pivo.php', '2022-06-21 06:07:55', 'Windows Google Chrome', '::1'),
(1118, 1, 4, 'pivo.php', '2022-06-21 06:07:57', 'Windows Google Chrome', '::1'),
(1119, 1, 4, 'pivo.php', '2022-06-21 06:08:02', 'Windows Google Chrome', '::1'),
(1120, 1, 4, 'pivo.php', '2022-06-21 06:11:08', 'Windows Google Chrome', '::1'),
(1121, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-21 06:11:10', 'Windows Google Chrome', '::1'),
(1122, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 06:11:13', 'Windows Google Chrome', '::1'),
(1123, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 06:12:02', 'Windows Google Chrome', '::1'),
(1124, 1, 4, 'pivo.php', '2022-06-21 06:12:08', 'Windows Google Chrome', '::1'),
(1125, 1, 4, 'pivo.php', '2022-06-21 06:13:12', 'Windows Google Chrome', '::1'),
(1126, 1, 4, 'pivo.php', '2022-06-21 06:13:39', 'Windows Google Chrome', '::1'),
(1127, 1, 4, 'pivo.php', '2022-06-21 06:14:09', 'Windows Google Chrome', '::1'),
(1128, 1, 4, 'pivo.php', '2022-06-21 06:14:36', 'Windows Google Chrome', '::1'),
(1129, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 06:14:54', 'Windows Google Chrome', '::1'),
(1130, 1, 4, 'index.php', '2022-06-21 06:15:02', 'Windows Google Chrome', '::1'),
(1131, 1, 4, 'index.php', '2022-06-21 06:15:04', 'Windows Google Chrome', '::1'),
(1132, 1, 4, 'statistikaNovosti.php', '2022-06-21 06:15:07', 'Windows Google Chrome', '::1'),
(1133, 1, 4, 'statistikaNovosti.php', '2022-06-21 06:18:07', 'Windows Google Chrome', '::1'),
(1134, 1, 4, 'statistikaNovosti.php', '2022-06-21 06:18:53', 'Windows Google Chrome', '::1'),
(1135, 1, 4, 'statistikaNovosti.php', '2022-06-21 06:19:15', 'Windows Google Chrome', '::1'),
(1136, 1, 4, 'statistikaNovosti.php', '2022-06-21 06:19:32', 'Windows Google Chrome', '::1'),
(1137, 1, 4, 'statistikaNovosti.php', '2022-06-21 06:20:30', 'Windows Google Chrome', '::1'),
(1138, 1, 4, 'statistikaNovosti.php', '2022-06-21 06:21:10', 'Windows Google Chrome', '::1'),
(1139, 1, 4, 'statistikaNovosti.php', '2022-06-21 06:21:54', 'Windows Google Chrome', '::1'),
(1140, 1, 4, 'statistikaNovosti.php', '2022-06-21 06:24:38', 'Windows Google Chrome', '::1'),
(1141, 1, 4, 'statistikaNovosti.php', '2022-06-21 06:25:17', 'Windows Google Chrome', '::1'),
(1142, 1, 4, 'index.php', '2022-06-21 06:25:21', 'Windows Google Chrome', '::1'),
(1143, 1, 4, 'pivo.php', '2022-06-21 06:25:23', 'Windows Google Chrome', '::1'),
(1144, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-21 06:25:38', 'Windows Google Chrome', '::1'),
(1145, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-21 06:25:49', 'Windows Google Chrome', '::1'),
(1146, 1, 4, 'pivo.php', '2022-06-21 06:25:57', 'Windows Google Chrome', '::1'),
(1147, 1, 4, 'pivoZemljaPorijekla.php', '2022-06-21 06:27:08', 'Windows Google Chrome', '::1'),
(1148, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 06:27:24', 'Windows Google Chrome', '::1'),
(1149, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 06:27:43', 'Windows Google Chrome', '::1'),
(1150, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 06:28:43', 'Windows Google Chrome', '::1'),
(1151, 1, 4, 'pivo.php', '2022-06-21 06:29:34', 'Windows Google Chrome', '::1'),
(1152, 1, 4, 'statistikaNarudzbi.php', '2022-06-21 06:29:45', 'Windows Google Chrome', '::1'),
(1153, 1, 4, 'index.php', '2022-06-21 06:30:26', 'Windows Google Chrome', '::1'),
(1154, 1, 4, 'statistikaNovosti.php', '2022-06-21 06:33:35', 'Windows Google Chrome', '::1'),
(1155, 1, 2, 'odjava.php', '2022-06-21 06:35:52', 'Windows Google Chrome', '::1'),
(1156, 1, 1, 'prijava.php', '2022-06-21 09:48:06', 'Windows Google Chrome', '::1'),
(1157, 1, 4, 'index.php', '2022-06-21 09:48:07', 'Windows Google Chrome', '::1'),
(1158, 1, 4, 'pivnica.php', '2022-06-21 09:48:09', 'Windows Google Chrome', '::1'),
(1159, 1, 4, 'moderatoriPivnica.php', '2022-06-21 09:48:52', 'Windows Google Chrome', '::1'),
(1160, 1, 4, 'zemljaPorijekla.php', '2022-06-21 09:48:54', 'Windows Google Chrome', '::1'),
(1161, 1, 4, 'moderatoriPivnica.php', '2022-06-21 09:48:55', 'Windows Google Chrome', '::1'),
(1162, 1, 4, 'moderatoriPivnica.php', '2022-06-21 09:48:57', 'Windows Google Chrome', '::1'),
(1163, 1, 4, 'blokiranjeOtkljucavanje.php', '2022-06-21 09:49:01', 'Windows Google Chrome', '::1'),
(1164, 1, 4, 'konfiguracijaSustava.php', '2022-06-21 09:49:09', 'Windows Google Chrome', '::1'),
(1165, 1, 4, 'dnevnikRada.php', '2022-06-21 09:49:13', 'Windows Google Chrome', '::1'),
(1166, 1, 4, 'dnevnikRada.php', '2022-06-21 09:49:17', 'Windows Google Chrome', '::1'),
(1167, 1, 2, 'odjava.php', '2022-06-21 09:51:49', 'Windows Google Chrome', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `konfiguracija_sustava`
--

CREATE TABLE `konfiguracija_sustava` (
  `id_konfiguracija_sustava` int(11) NOT NULL,
  `pomak` int(11) NOT NULL,
  `stranicanje` int(11) NOT NULL,
  `trajanje_sesija` int(11) NOT NULL,
  `trajanje_kolacic` int(11) NOT NULL,
  `trajanje_aktivacijski_kod` int(11) NOT NULL,
  `broj_pokusaja` int(11) NOT NULL,
  `top_lista` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfiguracija_sustava`
--

INSERT INTO `konfiguracija_sustava` (`id_konfiguracija_sustava`, `pomak`, `stranicanje`, `trajanje_sesija`, `trajanje_kolacic`, `trajanje_aktivacijski_kod`, `broj_pokusaja`, `top_lista`) VALUES
(1, 1, 5, 2, 7, 7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id_korisnik` int(11) NOT NULL,
  `id_tip_korisnika` int(11) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `korisnicko_ime` varchar(45) NOT NULL,
  `lozinka` varchar(45) NOT NULL,
  `lozinka_kriptirana` varchar(45) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `spol` varchar(1) DEFAULT NULL,
  `datum_pristupa` datetime DEFAULT NULL,
  `datum_zabrane` datetime DEFAULT NULL,
  `broj_pokusaja` int(11) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `datum_rodjenja` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id_korisnik`, `id_tip_korisnika`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `lozinka_kriptirana`, `email`, `adresa`, `spol`, `datum_pristupa`, `datum_zabrane`, `broj_pokusaja`, `status`, `datum_rodjenja`) VALUES
(1, 4, 'Petar', 'Matisic', 'pmatisic', 'SSxrsBVbgc', 'c094541608311bc0375fb0ec6bbe47a4eab4525f', 'pmatisic@foi.hr', 'Medjimurska 18', 'M', '2022-04-01 00:00:00', '2022-06-16 08:04:16', 0, 'A', '2022-03-31 00:00:00'),
(2, 3, 'Ante', 'Antic', 'aantic', 'lkHSPIcVoU', '370a7d9c4f9b8ed24da234c538b67cf914ed294f', 'aantic@mail.com', 'Medjimurska 1', 'M', '2022-04-09 00:00:00', '2022-06-17 08:39:42', 0, 'A', '2022-03-31 00:00:00'),
(3, 3, 'Ivo', 'Ivic', 'iivic', 'ivoisifra', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', 'iivic@foi.hr', 'Medjimurska 2', 'M', '2022-04-09 00:00:00', '2022-04-04 00:00:00', 0, 'A', '2022-03-31 00:00:00'),
(4, 3, 'Ana', 'Anic', 'aanic', 'anaasifra', 'df211ccdd94a63e0bcb9e6ae427a249484a49d60', 'aanic@foi.hr', 'Medjimurska 3', 'Z', '2022-04-08 00:00:00', '2022-04-05 00:00:00', 0, 'A', '2022-03-31 00:00:00'),
(6, 2, 'Pero', 'Peric', 'pperic', 'peropsifra', 'e27bbd8f0edf45c9d762ebed78707f02aa137165', 'pperic@foi.hr', 'Medjimurska 5', 'M', '2022-04-06 00:00:00', '2022-06-17 08:40:40', 3, 'A', '2022-03-31 00:00:00'),
(8, 3, 'Marko', 'Markovic', 'mmarkovic', 'markomsifra', '2db627d2084295470dc48de9e7b6d9f741f0bc00', 'mmarkovic@foi.hr', 'Medjimurska 9', 'M', '2022-04-04 00:00:00', '2022-04-09 00:00:00', 0, 'A', '2022-03-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `moderator`
--

CREATE TABLE `moderator` (
  `id_pivnica` int(11) NOT NULL,
  `id_moderator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moderator`
--

INSERT INTO `moderator` (`id_pivnica`, `id_moderator`) VALUES
(1, 5),
(1, 6),
(1, 7),
(1, 9),
(2, 2),
(2, 4),
(2, 9),
(3, 3),
(3, 7),
(3, 9),
(4, 2),
(4, 8),
(4, 9),
(5, 5),
(5, 6),
(5, 9),
(5, 10),
(6, 1),
(6, 6),
(6, 7),
(7, 5),
(7, 6),
(11, 16),
(17, 6);

-- --------------------------------------------------------

--
-- Table structure for table `narudzba`
--

CREATE TABLE `narudzba` (
  `id_narudzba` int(11) NOT NULL,
  `broj_narudzbe` int(11) NOT NULL,
  `vrijeme_dostave` datetime NOT NULL,
  `cijena_dostave` decimal(10,2) NOT NULL,
  `napomena` varchar(45) NOT NULL,
  `vrijeme_postavljanja` datetime NOT NULL,
  `vrijeme_odustajanja` datetime NOT NULL,
  `korisnik_id_korisnik` int(11) NOT NULL,
  `pivnica_id_pivnica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `narudzba`
--

INSERT INTO `narudzba` (`id_narudzba`, `broj_narudzbe`, `vrijeme_dostave`, `cijena_dostave`, `napomena`, `vrijeme_postavljanja`, `vrijeme_odustajanja`, `korisnik_id_korisnik`, `pivnica_id_pivnica`) VALUES
(1, 123, '2022-04-01 00:00:00', '12.00', 'Napomena broj 1.', '2022-04-02 00:00:00', '2022-04-01 00:00:00', 1, 3),
(2, 12313, '2022-04-02 00:00:00', '10.00', 'Napomena broj 3.', '2022-04-03 00:00:00', '2022-04-02 00:00:00', 3, 5),
(3, 12313, '2022-04-03 00:00:00', '14.00', 'Napomena broj 2.', '2022-04-04 00:00:00', '2022-04-03 00:00:00', 3, 5),
(4, 12312, '2022-04-04 00:00:00', '15.00', 'Napomena broj 3.', '2022-04-05 00:00:00', '2022-04-04 00:00:00', 6, 6),
(5, 23131, '2022-04-05 00:00:00', '16.00', 'Napomena broj 1.', '2022-04-06 00:00:00', '2022-04-05 00:00:00', 7, 1),
(6, 112, '2022-04-06 00:00:00', '11.00', 'Napomena broj 5.', '2022-04-07 00:00:00', '2022-04-06 00:00:00', 8, 1),
(7, 333, '2022-04-07 00:00:00', '9.00', 'Napomena broj 7.', '2022-04-08 00:00:00', '2022-04-07 00:00:00', 8, 1),
(8, 12313, '2022-04-08 00:00:00', '15.00', 'Napomena broj 9.', '2022-04-09 00:00:00', '2022-04-08 00:00:00', 4, 3),
(9, 33343, '2022-04-09 00:00:00', '17.00', 'Napomena broj 3.', '2022-04-10 00:00:00', '2022-04-09 00:00:00', 6, 2),
(10, 112332, '2022-04-10 00:00:00', '13.00', 'Napomena broj 4.', '2022-04-11 00:00:00', '2022-04-10 00:00:00', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `pivnica`
--

CREATE TABLE `pivnica` (
  `id_pivnica` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `adresa` varchar(45) NOT NULL,
  `broj_telefona` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `detalji` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pivnica`
--

INSERT INTO `pivnica` (`id_pivnica`, `naziv`, `adresa`, `broj_telefona`, `email`, `detalji`) VALUES
(1, 'Medonja', 'Vukovarska 1', 111222, 'medonja@mail.com', 'Detalj broj 1.'),
(2, 'Medina skrinja', 'Vukovarska 2', 222333, 'medinjaskrinja@mail.com', 'Detalj broj 2.'),
(3, 'Stari Mlin', 'Vukovarska 3', 333444, 'starimlin@mail.com', 'Detalj broj 3.'),
(4, 'Medvedgrad', 'Vukovarska 4', 444555, 'medvedgrad@mail.com', 'Detalj broj 4.'),
(5, 'Mlinarica', 'Vukovarska 5', 555666, 'mlinarica@mail.com', 'Detalj broj 5.'),
(6, 'Craft Room', 'Vukovarska 6', 666777, 'craftroom@mail.com', 'Detalj broj 6.'),
(7, 'Mali Medo', 'Vukovarska 7', 777888, 'malimedo@mail.com', 'Detalj broj 7.'),
(8, 'Zeppelin', 'Vukovarska 8', 888999, 'zeppelin@mail.com', 'Detalj broj 8.'),
(9, 'Zlatni medo', 'Vukovarska 9', 999000, 'zlatnimedo@mail.com', 'Detalj broj 9.'),
(28, 'Cajt', 'Medjimurska 12', 123123, 'cajt@tagbert.com', 'Detalj br. 33');

-- --------------------------------------------------------

--
-- Table structure for table `pivo`
--

CREATE TABLE `pivo` (
  `id_pivo` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `cijena` decimal(10,2) NOT NULL,
  `godina_proizvodnje` int(11) NOT NULL,
  `novosti` varchar(45) NOT NULL,
  `slika` varchar(45) NOT NULL,
  `postotak_alkohola` decimal(5,2) NOT NULL,
  `kategorija` varchar(45) NOT NULL,
  `narudzba_id_narudzba` int(11) NOT NULL,
  `zemlja_porijekla_idzemlja_porijekla` int(11) NOT NULL,
  `opis` varchar(45) NOT NULL,
  `volumen` varchar(45) NOT NULL,
  `rok_trajanja` datetime NOT NULL DEFAULT '2022-06-15 14:30:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pivo`
--

INSERT INTO `pivo` (`id_pivo`, `naziv`, `cijena`, `godina_proizvodnje`, `novosti`, `slika`, `postotak_alkohola`, `kategorija`, `narudzba_id_narudzba`, `zemlja_porijekla_idzemlja_porijekla`, `opis`, `volumen`, `rok_trajanja`) VALUES
(1, 'Franziskaner', '24.00', 2011, 'Novost broj 1.', 'franziskaner.jpg', '5.00', 'Pilsner', 1, 2, 'Opis broj 1.', '0.5l', '2022-06-15 14:30:00'),
(2, 'Ozujsko', '23.00', 2011, 'Novost broj 1.', 'ozujsko.jpg', '5.00', 'Lager', 2, 2, 'Opis broj 2.', '0.5l', '2022-06-15 14:30:00'),
(3, 'Paulaner', '22.00', 2011, 'Novost broj 1.', 'paulaner.jpg', '5.00', 'Ale', 3, 3, 'Opis broj 1.', '0.5l', '2022-06-15 14:30:00'),
(4, 'Karlovacko', '21.00', 2011, 'Novost broj 1.', 'karlovacko.jpg', '5.00', 'Pilsner', 3, 1, 'Opis broj 3.', '0.5l', '2022-06-15 14:30:00'),
(5, 'Nektar', '25.00', 2011, 'Novost broj 1.', 'nektar.jpg', '5.00', 'Lager', 4, 5, 'Opis broj 4.', '0.5l', '2022-06-15 14:30:00'),
(6, 'Pan', '20.00', 2011, 'Novost broj 1.', 'pan.jpeg', '5.00', 'Ale', 2, 1, 'Opis broj 1.', '0.5l', '2022-06-15 14:30:00'),
(7, 'Lasko', '20.00', 2011, 'Novost broj 1.', 'lasko.jpg', '5.00', 'Ale', 6, 6, 'Opis broj 7.', '0.5l', '2022-06-15 14:30:00'),
(8, 'Leffe', '23.00', 2011, 'Novost broj 1.', 'leffe.jpg', '5.00', 'Lager', 3, 7, 'Opis broj 6.', '0.5l', '2022-06-15 14:30:00'),
(9, 'Trippel', '25.00', 2011, 'Novost broj 1.', 'trippel.jpeg', '5.00', 'Ale', 8, 7, 'Opis broj 9.', '0.5l', '2022-06-15 14:30:00'),
(10, 'Blanche', '22.00', 2011, 'Novost broj 1.', 'blanche.jpg', '5.00', 'Pilsner', 1, 2, 'Opis broj 7.', '0.5l', '2022-06-15 14:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `recenzija`
--

CREATE TABLE `recenzija` (
  `id_recenzija` int(11) NOT NULL,
  `ocjena` int(1) NOT NULL,
  `opaska` varchar(45) NOT NULL,
  `preporuka` tinyint(1) NOT NULL,
  `pivo_id_pivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recenzija`
--

INSERT INTO `recenzija` (`id_recenzija`, `ocjena`, `opaska`, `preporuka`, `pivo_id_pivo`) VALUES
(1, 4, 'Opaska broj 1.', 1, 1),
(2, 4, 'Opaska broj 10.', 1, 2),
(3, 3, 'Opaska broj 2.', 1, 3),
(4, 2, 'Opaska broj 3.', 0, 4),
(5, 1, 'Opaska broj 1.', 0, 5),
(6, 5, 'Opaska broj 2.', 1, 6),
(7, 2, 'Opaska broj 8.', 0, 7),
(8, 1, 'Opaska broj 5.', 0, 8),
(9, 3, 'Opaska broj 6.', 1, 9),
(10, 4, 'Opaska broj 9.', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tip_korisnika`
--

CREATE TABLE `tip_korisnika` (
  `id_tip_korisnika` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `opis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tip_korisnika`
--

INSERT INTO `tip_korisnika` (`id_tip_korisnika`, `naziv`, `opis`) VALUES
(1, 'Anonimni', 'Korisnik koji nije registriran'),
(2, 'Registrirani', 'Korisnik koji je registriran'),
(3, 'Moderator', 'Korisnik koji je moderator i ima sva prava anonimnog i registriranog korisnika'),
(4, 'Administrator', 'Korisnik koji je administrator i ima sva prava koje imaju ostale uloge');

-- --------------------------------------------------------

--
-- Table structure for table `tip_zapisa`
--

CREATE TABLE `tip_zapisa` (
  `id_tip_zapisa` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `opis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tip_zapisa`
--

INSERT INTO `tip_zapisa` (`id_tip_zapisa`, `naziv`, `opis`) VALUES
(1, 'Prijava', 'Korisnik se prijavio u sustav'),
(2, 'Odjava', 'Korisnik se odjavio iz sustava'),
(3, 'Upit', 'Korisnik izvrsio upit'),
(4, 'Posjeta', 'Korisnik posjetio stranicu'),
(5, 'Zakljucavanje', 'Korisniku zakljucan korisnicki racun.'),
(6, 'Slanje lozinke', 'Korisnik je zatrazio novu lozinku.'),
(7, 'Aktivacija', 'Korisnik je aktivirao korisnicki racun unosom aktivacijskog koda.');

-- --------------------------------------------------------

--
-- Table structure for table `zemlja_porijekla`
--

CREATE TABLE `zemlja_porijekla` (
  `idzemlja_porijekla` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zemlja_porijekla`
--

INSERT INTO `zemlja_porijekla` (`idzemlja_porijekla`, `naziv`) VALUES
(1, 'Hrvatska'),
(2, 'Francuska'),
(3, 'Njemacka'),
(5, 'BiH'),
(6, 'Slovenija'),
(7, 'Belgija'),
(8, 'Austrija'),
(9, 'Croatia'),
(10, 'Danska'),
(11, 'Australija'),
(12, 'Svedska');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktivacijski_kodovi`
--
ALTER TABLE `aktivacijski_kodovi`
  ADD PRIMARY KEY (`id_aktivacijski_kod`),
  ADD KEY `id_korisnik` (`id_korisnik`);

--
-- Indexes for table `cjenik`
--
ALTER TABLE `cjenik`
  ADD PRIMARY KEY (`id_cjenik`),
  ADD KEY `fk_cjenik_korisnik1_idx` (`korisnik_id_korisnik`);

--
-- Indexes for table `dnevnik`
--
ALTER TABLE `dnevnik`
  ADD PRIMARY KEY (`id_dnevnik`),
  ADD KEY `fk_dnevnik_korisnik1_idx` (`id_korisnik`),
  ADD KEY `fk_dnevnik_tip_zapisa1_idx` (`id_tip_zapisa`);

--
-- Indexes for table `konfiguracija_sustava`
--
ALTER TABLE `konfiguracija_sustava`
  ADD PRIMARY KEY (`id_konfiguracija_sustava`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id_korisnik`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `korisnicko_ime_UNIQUE` (`korisnicko_ime`),
  ADD KEY `fk_korisnik_tip_korisnika1_idx` (`id_tip_korisnika`);

--
-- Indexes for table `moderator`
--
ALTER TABLE `moderator`
  ADD PRIMARY KEY (`id_pivnica`,`id_moderator`),
  ADD KEY `fk_moderator_korisnik1_idx` (`id_moderator`),
  ADD KEY `fk_moderator_pivnica1_idx` (`id_pivnica`);

--
-- Indexes for table `narudzba`
--
ALTER TABLE `narudzba`
  ADD PRIMARY KEY (`id_narudzba`,`korisnik_id_korisnik`),
  ADD KEY `fk_narudzba_korisnik1_idx` (`korisnik_id_korisnik`),
  ADD KEY `fk_narudzba_pivnica1_idx` (`pivnica_id_pivnica`);

--
-- Indexes for table `pivnica`
--
ALTER TABLE `pivnica`
  ADD PRIMARY KEY (`id_pivnica`);

--
-- Indexes for table `pivo`
--
ALTER TABLE `pivo`
  ADD PRIMARY KEY (`id_pivo`,`narudzba_id_narudzba`),
  ADD KEY `fk_pivo_narudzba1_idx` (`narudzba_id_narudzba`),
  ADD KEY `fk_pivo_zemlja_porijekla1` (`zemlja_porijekla_idzemlja_porijekla`);

--
-- Indexes for table `recenzija`
--
ALTER TABLE `recenzija`
  ADD PRIMARY KEY (`id_recenzija`),
  ADD KEY `fk_recenzija_pivo1_idx` (`pivo_id_pivo`);

--
-- Indexes for table `tip_korisnika`
--
ALTER TABLE `tip_korisnika`
  ADD PRIMARY KEY (`id_tip_korisnika`),
  ADD UNIQUE KEY `naziv_UNIQUE` (`naziv`);

--
-- Indexes for table `tip_zapisa`
--
ALTER TABLE `tip_zapisa`
  ADD PRIMARY KEY (`id_tip_zapisa`);

--
-- Indexes for table `zemlja_porijekla`
--
ALTER TABLE `zemlja_porijekla`
  ADD PRIMARY KEY (`idzemlja_porijekla`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktivacijski_kodovi`
--
ALTER TABLE `aktivacijski_kodovi`
  MODIFY `id_aktivacijski_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `cjenik`
--
ALTER TABLE `cjenik`
  MODIFY `id_cjenik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dnevnik`
--
ALTER TABLE `dnevnik`
  MODIFY `id_dnevnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1168;

--
-- AUTO_INCREMENT for table `konfiguracija_sustava`
--
ALTER TABLE `konfiguracija_sustava`
  MODIFY `id_konfiguracija_sustava` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id_korisnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `narudzba`
--
ALTER TABLE `narudzba`
  MODIFY `id_narudzba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pivnica`
--
ALTER TABLE `pivnica`
  MODIFY `id_pivnica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pivo`
--
ALTER TABLE `pivo`
  MODIFY `id_pivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recenzija`
--
ALTER TABLE `recenzija`
  MODIFY `id_recenzija` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tip_korisnika`
--
ALTER TABLE `tip_korisnika`
  MODIFY `id_tip_korisnika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tip_zapisa`
--
ALTER TABLE `tip_zapisa`
  MODIFY `id_tip_zapisa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `zemlja_porijekla`
--
ALTER TABLE `zemlja_porijekla`
  MODIFY `idzemlja_porijekla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aktivacijski_kodovi`
--
ALTER TABLE `aktivacijski_kodovi`
  ADD CONSTRAINT `aktivacijski_kodovi_ibfk_1` FOREIGN KEY (`id_korisnik`) REFERENCES `korisnik` (`id_korisnik`);

--
-- Constraints for table `cjenik`
--
ALTER TABLE `cjenik`
  ADD CONSTRAINT `fk_cjenik_korisnik1` FOREIGN KEY (`korisnik_id_korisnik`) REFERENCES `korisnik` (`id_korisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dnevnik`
--
ALTER TABLE `dnevnik`
  ADD CONSTRAINT `fk_dnevnik_korisnik1` FOREIGN KEY (`id_korisnik`) REFERENCES `korisnik` (`id_korisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dnevnik_tip_zapisa1` FOREIGN KEY (`id_tip_zapisa`) REFERENCES `tip_zapisa` (`id_tip_zapisa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `fk_korisnik_tip_korisnika1` FOREIGN KEY (`id_tip_korisnika`) REFERENCES `tip_korisnika` (`id_tip_korisnika`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `moderator`
--
ALTER TABLE `moderator`
  ADD CONSTRAINT `fk_moderator_korisnik1` FOREIGN KEY (`id_moderator`) REFERENCES `korisnik` (`id_korisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_moderator_pivnica1` FOREIGN KEY (`id_pivnica`) REFERENCES `pivnica` (`id_pivnica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `narudzba`
--
ALTER TABLE `narudzba`
  ADD CONSTRAINT `fk_narudzba_korisnik1` FOREIGN KEY (`korisnik_id_korisnik`) REFERENCES `korisnik` (`id_korisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_narudzba_pivnica1` FOREIGN KEY (`pivnica_id_pivnica`) REFERENCES `pivnica` (`id_pivnica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pivo`
--
ALTER TABLE `pivo`
  ADD CONSTRAINT `fk_pivo_narudzba1` FOREIGN KEY (`narudzba_id_narudzba`) REFERENCES `narudzba` (`id_narudzba`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pivo_zemlja_porijekla1` FOREIGN KEY (`zemlja_porijekla_idzemlja_porijekla`) REFERENCES `zemlja_porijekla` (`idzemlja_porijekla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `recenzija`
--
ALTER TABLE `recenzija`
  ADD CONSTRAINT `fk_recenzija_pivo1` FOREIGN KEY (`pivo_id_pivo`) REFERENCES `pivo` (`id_pivo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
