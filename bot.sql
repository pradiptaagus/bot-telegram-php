-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2019 at 03:45 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mca_remidi`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_tb_crud` (IN `nip` VARCHAR(15), `nama` VARCHAR(100), `jk` ENUM('Laki-laki','Perempuan'), `alamat` VARCHAR(255))  BEGIN
		declare id int;
		
		# select id query
		select tb_crud.`id` into id from tb_crud 
		WHERE tb_crud.`nip` = nip;
		
		# update query
		update tb_crud set tb_crud.`nip` = nip, tb_crud.`nama` = nama, tb_crud.`jk` = jk, tb_crud.`alamat` = alamat, tb_crud.`tgl_ubah` = NOW()
		where tb_crud.`nip` = nip;
				
		select(id);
	END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_crud`
--

CREATE TABLE `tb_crud` (
  `id` int(11) UNSIGNED NOT NULL,
  `nip` varchar(15) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jk` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `tgl_buat` timestamp NULL DEFAULT NULL,
  `tgl_ubah` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_crud`
--

INSERT INTO `tb_crud` (`id`, `nip`, `nama`, `jk`, `alamat`, `tgl_buat`, `tgl_ubah`) VALUES
(1, '1605551033', 'I Gede Agus Pradipta', 'Laki-laki', 'Banda', '2019-01-13 11:21:46', '2019-01-14 02:17:42'),
(3, '1605551035', 'i wayan gus arisna', 'Laki-laki', 'Banda', '2019-01-13 12:08:23', '2019-01-13 12:20:37'),
(4, '1605551036', 'pande natayasa', 'Laki-laki', 'Banda', '2019-01-13 12:28:55', '2019-01-13 12:28:55'),
(5, '1605551037', 'I Komang Pande Natayasa', 'Laki-laki', 'Bangli', '2019-01-14 02:19:38', '2019-01-14 02:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `tb_file`
--

CREATE TABLE `tb_file` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_operasi` int(11) NOT NULL,
  `sql` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_inbox`
--

CREATE TABLE `tb_inbox` (
  `id_inbox` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `msg_id` bigint(20) NOT NULL,
  `in_msg` text,
  `flag` enum('0','1','2','3','4') DEFAULT '0',
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_inbox`
--

INSERT INTO `tb_inbox` (`id_inbox`, `chat_id`, `msg_id`, `in_msg`, `flag`, `tgl`) VALUES
(1, 767095712, 23, 'hai', '1', '2019-01-13 03:20:03'),
(2, 767095712, 25, '1', '1', '2019-01-13 03:20:17'),
(3, 767095712, 30, '1', '1', '2019-01-13 03:33:16'),
(4, 767095712, 33, '1', '1', '2019-01-13 03:36:46'),
(5, 767095712, 35, '1', '1', '2019-01-13 03:39:16'),
(6, 767095712, 37, 'tes', '1', '2019-01-13 05:22:15'),
(7, 767095712, 39, '1', '1', '2019-01-13 05:25:45'),
(8, 767095712, 41, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 05:26:16'),
(9, 767095712, 43, 'tes', '1', '2019-01-13 05:31:47'),
(10, 767095712, 45, 'hai', '1', '2019-01-13 05:33:57'),
(11, 767095712, 47, 'tes', '1', '2019-01-13 05:35:03'),
(12, 767095712, 48, 'tes', '1', '2019-01-13 05:35:30'),
(13, 767095712, 50, '1', '1', '2019-01-13 05:35:58'),
(14, 767095712, 52, '2', '1', '2019-01-13 05:36:08'),
(15, 767095712, 54, '2', '1', '2019-01-13 05:36:48'),
(16, 767095712, 56, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 05:37:12'),
(17, 767095712, 58, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 05:38:22'),
(18, 767095712, 60, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 05:42:12'),
(19, 767095712, 61, 'tes', '1', '2019-01-13 05:43:01'),
(20, 767095712, 63, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 05:43:39'),
(21, 767095712, 64, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 05:45:22'),
(22, 767095712, 66, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 05:48:04'),
(23, 767095712, 68, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 09:36:22'),
(24, 767095712, 70, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 09:44:30'),
(25, 767095712, 71, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 09:51:15'),
(26, 767095712, 72, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 09:57:37'),
(27, 767095712, 74, 'hai', '1', '2019-01-13 09:58:03'),
(28, 767095712, 77, '1', '1', '2019-01-13 09:58:28'),
(29, 767095712, 79, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 09:58:49'),
(30, 767095712, 81, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 10:04:00'),
(31, 767095712, 82, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 10:06:15'),
(32, 767095712, 84, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 10:09:52'),
(33, 767095712, 86, 'menu', '1', '2019-01-13 10:10:25'),
(34, 767095712, 88, '3', '1', '2019-01-13 10:10:35'),
(35, 767095712, 90, 'hapus pegawai #1605551033', '1', '2019-01-13 10:10:53'),
(36, 767095712, 92, 'hapus pegawai #1605551033', '1', '2019-01-13 10:12:28'),
(37, 767095712, 94, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-13 10:12:49'),
(38, 767095712, 96, 'menu', '1', '2019-01-13 10:19:00'),
(39, 767095712, 98, '4', '1', '2019-01-13 10:19:14'),
(40, 767095712, 100, '4', '1', '2019-01-13 10:19:55'),
(41, 767095712, 102, 'tambah pegawai #1605551034 #pradipta #Laki-laki #banda', '1', '2019-01-13 10:21:10'),
(42, 767095712, 104, 'menu', '1', '2019-01-13 10:22:07'),
(43, 767095712, 107, '4', '1', '2019-01-13 10:22:39'),
(44, 767095712, 109, '4', '1', '2019-01-13 11:24:25'),
(45, 767095712, 111, 'tambah pegawai #1605551034 #gus manis #Laki-laki, #Banda', '1', '2019-01-13 11:25:42'),
(46, 767095712, 113, 'men', '1', '2019-01-13 11:25:56'),
(47, 767095712, 115, '2', '1', '2019-01-13 11:27:02'),
(48, 767095712, 117, 'update pegawai #1605551033 #pradipta #Laki-laki #Banda', '1', '2019-01-13 11:27:39'),
(49, 767095712, 119, 'update pegawai #1605551033 #pradipta #Laki-laki #Banda', '1', '2019-01-13 11:32:36'),
(50, 767095712, 121, 'update pegawai #1605551034 #pradipta agus #Laki-laki #Banda', '1', '2019-01-13 11:40:45'),
(51, 767095712, 122, 'update pegawai #1605551034 #gus manis #Laki-laki #Banda', '1', '2019-01-13 11:46:02'),
(52, 767095712, 123, 'update pegawai #1605551034 #pradipta agus #Laki-laki #Banda', '1', '2019-01-13 11:51:25'),
(53, 767095712, 124, 'update pegawai #1605551034 #pradipta agus #Laki-laki #Banda', '1', '2019-01-13 11:54:28'),
(54, 767095712, 125, 'update pegawai #1605551034 #pradipta agus #Laki-laki #Banda', '1', '2019-01-13 11:56:30'),
(55, 767095712, 126, 'update pegawai #1605551034 #pradipta agus #Laki-laki #Banda', '1', '2019-01-13 11:58:35'),
(56, 767095712, 127, 'update pegawai #1605551034 #pradipta agus #Laki-laki #Banda', '1', '2019-01-13 11:59:28'),
(57, 767095712, 128, 'menu', '1', '2019-01-13 12:00:07'),
(58, 767095712, 129, 'menu', '1', '2019-01-13 12:00:37'),
(59, 767095712, 132, 'update pegawai #1605551034 #pradipta agus #Laki-laki #Banda', '1', '2019-01-13 12:01:38'),
(60, 767095712, 133, 'hai', '1', '2019-01-13 12:06:46'),
(61, 767095712, 135, '3', '1', '2019-01-13 12:07:05'),
(62, 767095712, 137, '4', '1', '2019-01-13 12:07:54'),
(63, 767095712, 139, 'tambah pegawai #1605551035 #gus arisna #Laki-laki #Banda', '1', '2019-01-13 12:08:23'),
(64, 767095712, 141, 'menu', '1', '2019-01-13 12:08:38'),
(65, 767095712, 143, '1', '1', '2019-01-13 12:08:50'),
(66, 767095712, 145, 'cari pegawai #1605551033 #gus arisna', '1', '2019-01-13 12:09:16'),
(67, 767095712, 147, 'cari pegawai #1605551035 #gus arisna', '1', '2019-01-13 12:09:43'),
(68, 767095712, 149, '2', '1', '2019-01-13 12:10:00'),
(69, 767095712, 151, 'update pegawai #1605551035 #i wayan gus arisna #Laki-laki #Banda', '1', '2019-01-13 12:10:49'),
(70, 767095712, 152, 'update pegawai #1605551035 #i wayan gus arisna #Laki-laki #Banda', '1', '2019-01-13 12:11:58'),
(71, 767095712, 153, 'update pegawai #1605551035 #i wayan gus arisna #Laki-laki #Banda', '1', '2019-01-13 12:13:46'),
(72, 767095712, 154, 'update pegawai #1605551035 #i wayan gus arisna #Laki-laki #Banda', '1', '2019-01-13 12:13:46'),
(73, 767095712, 155, 'menu', '1', '2019-01-13 12:13:50'),
(74, 767095712, 158, 'update pegawai #1605551035 #i wayan gus arisna #Laki-laki #Banda', '1', '2019-01-13 12:18:18'),
(75, 767095712, 159, 'update pegawai #1605551035 #i wayan gus arisna #Laki-laki #Banda', '1', '2019-01-13 12:19:33'),
(76, 767095712, 160, 'update pegawai #1605551035 #i wayan gus arisna #Laki-laki #Banda', '1', '2019-01-13 12:19:37'),
(77, 767095712, 161, 'menu', '1', '2019-01-13 12:20:32'),
(78, 767095712, 162, 'menu', '1', '2019-01-13 12:23:52'),
(79, 767095712, 164, 'cari pegawai #1605551033 #pradipta', '1', '2019-01-13 12:24:19'),
(80, 767095712, 166, 'update pegawai #1605551033 #pradipta agus #Laki-laki #Banda', '1', '2019-01-13 12:24:59'),
(81, 767095712, 167, 'menu', '1', '2019-01-13 12:25:32'),
(82, 767095712, 170, '4', '1', '2019-01-13 12:26:30'),
(83, 767095712, 171, '4', '1', '2019-01-13 12:26:30'),
(84, 767095712, 172, 'menu', '1', '2019-01-13 12:27:28'),
(85, 767095712, 175, 'tambah pegawai #1605551036 #pande natayasa #Laki-laki #Banda', '1', '2019-01-13 12:28:54'),
(86, 767095712, 178, 'cari pegawai #1605551036 #pande natayasa', '1', '2019-01-13 12:30:43'),
(87, 767095712, 178, 'cari pegawai #1605551036 #pande natayasa', '1', '2019-01-13 12:32:18'),
(88, 767095712, 181, 'update pegawai #1605551033 #pradipta #Laki-laki #Banda', '1', '2019-01-13 12:33:59'),
(89, 767095712, 182, 'menu', '1', '2019-01-13 12:36:13'),
(90, 767095712, 184, 'menu', '1', '2019-01-13 12:53:14'),
(91, 767095712, 187, '2', '1', '2019-01-13 12:53:33'),
(92, 767095712, 189, 'update pegawai #pradipta agus #Laki-laki #Banda #1605551033', '1', '2019-01-13 12:54:29'),
(93, 767095712, 191, 'update pegawai #pradipta agus #Laki-laki #Banda #1605551033', '1', '2019-01-13 12:55:21'),
(94, 767095712, 193, 'update pegawai #pradipta agus #Laki-laki #Banda #1605551033', '1', '2019-01-13 12:55:56'),
(95, 767095712, 195, 'update pegawai #gus manis #Laki-laki #Banda #1605551034', '1', '2019-01-13 12:56:30'),
(96, 767095712, 197, 'menu', '1', '2019-01-13 18:38:20'),
(97, 767095712, 199, '5', '1', '2019-01-13 18:38:30'),
(98, 767095712, 201, 'download pegawai', '1', '2019-01-13 18:38:44'),
(99, 767095712, 202, 'download pegawai', '1', '2019-01-13 18:40:24'),
(100, 767095712, 203, 'download pegawai', '1', '2019-01-13 18:48:37'),
(101, 767095712, 204, 'donwload pegawai', '1', '2019-01-13 18:54:14'),
(102, 767095712, 206, 'download pegawai', '1', '2019-01-13 18:54:49'),
(103, 767095712, 207, 'download pegawai', '1', '2019-01-13 18:56:16'),
(104, 767095712, 208, 'download pegawai', '1', '2019-01-13 18:57:34'),
(105, 767095712, 209, 'download pegawai', '1', '2019-01-13 18:58:37'),
(106, 767095712, 210, 'download pgawai', '1', '2019-01-13 18:59:27'),
(107, 767095712, 213, 'download pegawai', '1', '2019-01-13 18:59:55'),
(108, 767095712, 214, 'download pegawai', '1', '2019-01-13 19:14:03'),
(109, 767095712, 215, 'download pegawai', '1', '2019-01-13 19:20:02'),
(110, 767095712, 216, 'download pegawai', '1', '2019-01-13 19:20:47'),
(111, 767095712, 217, 'download pegawai', '1', '2019-01-13 19:21:17'),
(112, 767095712, 218, 'download pegawai', '1', '2019-01-13 19:45:03'),
(113, 767095712, 219, 'halo', '1', '2019-01-13 19:47:09'),
(114, 767095712, 220, 'halo', '1', '2019-01-13 19:49:35'),
(115, 767095712, 222, 'download pegawai', '1', '2019-01-13 19:49:49'),
(116, 767095712, 223, 'download pegawai', '1', '2019-01-13 19:53:56'),
(117, 767095712, 224, 'download pegawai', '1', '2019-01-13 19:59:31'),
(118, 767095712, 225, 'halo', '1', '2019-01-13 20:06:55'),
(119, 767095712, 227, 'download pegawai', '1', '2019-01-13 20:07:06'),
(120, 767095712, 228, 'download pegawai', '1', '2019-01-13 20:07:51'),
(121, 767095712, 229, 'menu', '1', '2019-01-13 23:23:33'),
(122, 767095712, 231, '5', '1', '2019-01-13 23:23:47'),
(123, 767095712, 233, 'download data pegawai', '1', '2019-01-13 23:24:16'),
(124, 767095712, 236, 'download pegawai', '1', '2019-01-13 23:24:51'),
(125, 767095712, 237, 'download pegawai', '1', '2019-01-13 23:27:27'),
(126, 767095712, 238, 'download pegawai', '1', '2019-01-13 23:28:27'),
(127, 767095712, 239, 'download pegawai', '1', '2019-01-14 00:00:52'),
(128, 767095712, 240, 'download pegawai', '1', '2019-01-14 00:03:51'),
(129, 767095712, 241, 'download pegawai', '1', '2019-01-14 00:04:51'),
(130, 767095712, 242, 'download pegawai', '1', '2019-01-14 00:06:01'),
(131, 767095712, 243, 'menu', '1', '2019-01-14 00:06:22'),
(132, 767095712, 245, '5', '1', '2019-01-14 00:06:32'),
(133, 767095712, 247, 'dowload data pegawai', '1', '2019-01-14 00:06:46'),
(134, 767095712, 249, 'download data pegawai', '1', '2019-01-14 00:07:01'),
(135, 767095712, 250, 'download data pegawai', '1', '2019-01-14 00:08:26'),
(136, 767095712, 251, 'download data pegawai', '1', '2019-01-14 00:11:01'),
(137, 767095712, 252, 'download data pegawai', '1', '2019-01-14 00:22:20'),
(138, 767095712, 253, 'download data pegawai', '1', '2019-01-14 00:23:27'),
(139, 767095712, 254, 'download data pegawai', '1', '2019-01-14 00:25:20'),
(140, 767095712, 255, 'download data pegawai', '1', '2019-01-14 00:33:03'),
(141, 767095712, 256, 'download data pegawai', '1', '2019-01-14 00:34:03'),
(142, 767095712, 257, 'download data pegawai', '1', '2019-01-14 00:34:53'),
(143, 767095712, 258, 'download data pegawai', '1', '2019-01-14 00:35:35'),
(144, 767095712, 259, 'download data pegawai', '1', '2019-01-14 00:36:14'),
(145, 767095712, 260, 'download data pegawai', '1', '2019-01-14 00:40:22'),
(146, 767095712, 261, 'download data pegawai', '1', '2019-01-14 00:41:54'),
(147, 767095712, 262, 'download data pegawai', '1', '2019-01-14 00:45:41'),
(148, 767095712, 263, 'download data pegawai', '1', '2019-01-14 00:47:08'),
(149, 767095712, 264, 'download data pegawai', '1', '2019-01-14 00:47:33'),
(150, 767095712, 265, 'download data pegawai', '1', '2019-01-14 00:48:12'),
(151, 767095712, 266, 'download data pegawai', '1', '2019-01-14 00:49:47'),
(152, 767095712, 267, 'download data pegawai', '1', '2019-01-14 00:52:30'),
(153, 767095712, 268, 'download data pegawai', '1', '2019-01-14 00:52:55'),
(154, 767095712, 269, 'download data pegawa', '1', '2019-01-14 00:54:25'),
(155, 767095712, 272, 'download data pegawai', '1', '2019-01-14 00:54:53'),
(156, 767095712, 273, 'download data pegawai', '1', '2019-01-14 00:56:00'),
(157, 767095712, 274, 'download data pegawai', '1', '2019-01-14 00:57:29'),
(158, 767095712, 275, 'download data pegawai', '1', '2019-01-14 00:58:04'),
(159, 767095712, 276, 'download data pegawai', '1', '2019-01-14 01:06:33'),
(160, 767095712, 277, 'download data pegawai', '1', '2019-01-14 01:07:18'),
(161, 767095712, 278, 'download data pegawai', '1', '2019-01-14 01:10:11'),
(162, 767095712, 279, 'download data pegawai', '1', '2019-01-14 01:14:57'),
(163, 767095712, 280, 'download data pegawai', '1', '2019-01-14 01:27:11'),
(164, 767095712, 281, 'download data pegawai', '1', '2019-01-14 01:30:36'),
(165, 767095712, 282, 'download data pegawai', '1', '2019-01-14 01:33:50'),
(166, 767095712, 283, 'download data pegawai', '1', '2019-01-14 01:35:31'),
(167, 767095712, 284, 'download data pegawai', '1', '2019-01-14 01:36:17'),
(168, 767095712, 285, 'download data pegawai', '1', '2019-01-14 01:36:49'),
(169, 767095712, 286, 'download data pegawai', '1', '2019-01-14 01:37:17'),
(170, 767095712, 287, 'download data pegawai', '1', '2019-01-14 01:38:19'),
(171, 767095712, 288, 'download data pegawai', '1', '2019-01-14 01:40:02'),
(172, 767095712, 289, 'download data pegawai', '1', '2019-01-14 01:41:16'),
(173, 767095712, 290, 'download data pegawai', '1', '2019-01-14 01:42:44'),
(174, 767095712, 291, 'download data pegawai', '1', '2019-01-14 01:50:09'),
(175, 767095712, 292, 'download data pegawai', '1', '2019-01-14 01:50:58'),
(176, 767095712, 294, 'download data pegawai', '1', '2019-01-14 02:02:37'),
(177, 767095712, 296, 'download data pegawai', '1', '2019-01-14 02:03:20'),
(178, 767095712, 298, 'download data pegawai', '1', '2019-01-14 02:04:30'),
(179, 767095712, 300, 'download data pegawai', '1', '2019-01-14 02:05:23'),
(180, 767095712, 302, 'download data pegawai', '1', '2019-01-14 02:06:30'),
(181, 767095712, 304, 'download data pegawai', '1', '2019-01-14 02:07:13'),
(182, 767095712, 306, 'download data pegawai', '1', '2019-01-14 02:09:49'),
(183, 767095712, 308, 'download data pegawai', '1', '2019-01-14 02:11:10'),
(184, 767095712, 310, 'download data pegawai', '1', '2019-01-14 02:14:41'),
(185, 767095712, 312, 'menu', '1', '2019-01-14 02:15:13'),
(186, 767095712, 315, '1', '1', '2019-01-14 02:15:41'),
(187, 767095712, 317, 'cari pegawai #1605551033 #pradipta agus', '1', '2019-01-14 02:16:03'),
(188, 767095712, 319, '2', '1', '2019-01-14 02:16:59'),
(189, 767095712, 321, 'update pegawai #I Gede Agus Pradipta #Laki-laki #Banda #1605551033', '1', '2019-01-14 02:17:41'),
(190, 767095712, 323, 'cari pegawai #1605551033 #I Gede Agus Pradipta', '1', '2019-01-14 02:18:10'),
(191, 767095712, 325, '3', '1', '2019-01-14 02:18:20'),
(192, 767095712, 327, 'hapus pegawai #1605551034', '1', '2019-01-14 02:18:41'),
(193, 767095712, 329, '4', '1', '2019-01-14 02:18:59'),
(194, 767095712, 331, 'tambah pegawai #1605551037 #I Komang Pande Natayasa #Laki-laki #Bangli', '1', '2019-01-14 02:19:38'),
(195, 767095712, 333, 'cari pegawai #1605551037 #I Komang Pande Natayasa', '1', '2019-01-14 02:20:03'),
(196, 767095712, 335, 'download data pegawai', '1', '2019-01-14 02:20:20'),
(197, 767095712, 337, 'menu', '1', '2019-01-14 06:44:57'),
(198, 45561076, 339, '/start', '1', '2019-01-14 06:53:00'),
(199, 45561076, 340, 'halo', '1', '2019-01-14 06:53:04'),
(200, 45561076, 342, 'tes', '1', '2019-01-14 06:53:07'),
(201, 45561076, 343, 'tes', '1', '2019-01-14 06:53:07'),
(202, 45561076, 345, 'shshs', '1', '2019-01-14 06:53:11'),
(203, 45561076, 348, 'dgdg', '1', '2019-01-14 06:53:14'),
(204, 45561076, 352, '1', '1', '2019-01-14 06:53:30'),
(205, 767095712, 354, '1', '1', '2019-01-14 06:54:34'),
(206, 767095712, 356, 'cari pegawai #1605551033 #I Gede Agus Pradipta', '1', '2019-01-14 06:55:11'),
(207, 767095712, 358, '5', '1', '2019-01-14 06:55:29'),
(208, 767095712, 360, 'download data pegawai', '1', '2019-01-14 06:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `tb_operasi`
--

CREATE TABLE `tb_operasi` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_operasi` varchar(50) NOT NULL,
  `keyword` varchar(50) NOT NULL,
  `format` varchar(255) NOT NULL,
  `flag_file` enum('0','1','2','3','4') NOT NULL,
  `type` enum('insert','update','delete','select','download') NOT NULL,
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_operasi`
--

INSERT INTO `tb_operasi` (`id`, `nama_operasi`, `keyword`, `format`, `flag_file`, `type`, `query`) VALUES
(1, 'Pencarian data pegawai', 'cari pegawai', 'cari pegawai #nip #nama', '0', 'select', 'SELECT tb_crud.`nip` AS NIP, tb_crud.`nama` AS Nama, tb_crud.`jk` AS JK, tb_crud.`alamat` AS Alamat FROM tb_crud WHERE tb_crud.`nip` = \'?\' and tb_crud.`nama` = \'?\';'),
(2, 'Update data pegawai', 'update pegawai', 'update pegawai #nama #jk (Laki-laki / Perempuan) #alamat #nip', '0', 'update', 'UPDATE tb_crud SET nama = \'?\', jk = \'?\', alamat = \'?\' WHERE nip = \'?\''),
(3, 'Hapus data pegawai', 'hapus pegawai', 'hapus pegawai #nip', '0', 'delete', 'DELETE FROM tb_crud WHERE tb_crud.`nip` = \'?\''),
(4, 'Tambah data pegawai', 'tambah pegawai', 'tambah pegawai #nip #nama #jk (Laki-laki / Perempuan) #alamat', '0', 'insert', 'INSERT INTO tb_crud(nip, nama, jk, alamat, tgl_buat, tgl_ubah) VALUES(\'?\', \'?\', \'?\', \'?\', NOW(), NOW());'),
(5, 'Download semua data pegawai', 'download data pegawai', 'download data pegawai', '1', 'download', 'SELECT tb_crud.`id` AS ID, tb_crud.`nip` AS NIP, tb_crud.`nama` AS Nama, tb_crud.`jk` AS JK, tb_crud.`alamat` AS Alamat FROM tb_crud');

-- --------------------------------------------------------

--
-- Table structure for table `tb_outbox`
--

CREATE TABLE `tb_outbox` (
  `id_outbox` bigint(20) NOT NULL,
  `id_inbox` bigint(20) DEFAULT NULL,
  `chat_id` bigint(20) DEFAULT NULL,
  `msg_id` bigint(20) DEFAULT NULL,
  `out_msg` text,
  `type` enum('msg','file') DEFAULT 'msg',
  `flag` enum('0','1','2') DEFAULT '0',
  `tgl_kirim` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_outbox`
--

INSERT INTO `tb_outbox` (`id_outbox`, `id_inbox`, `chat_id`, `msg_id`, `out_msg`, `type`, `flag`, `tgl_kirim`) VALUES
(1, 1, 767095712, 23, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 03:20:05'),
(2, 2, 767095712, 25, 'M', '', '1', '2019-01-13 03:20:20'),
(3, 2, 767095712, 25, 'M', '', '1', '2019-01-13 03:25:38'),
(4, 2, 767095712, 25, 'M', '', '1', '2019-01-13 03:27:24'),
(5, 1, 767095712, 23, '', 'msg', '1', '2019-01-13 03:29:42'),
(6, 1, 767095712, 23, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 03:33:04'),
(7, 3, 767095712, 30, 'M', '', '1', '2019-01-13 03:33:18'),
(8, 1, 767095712, 23, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 03:36:20'),
(9, 4, 767095712, 33, 'M', '', '1', '2019-01-13 03:36:48'),
(10, 5, 767095712, 35, 'Masukkan perintah berikut:<pre>cari pegawai #nip #nama</pre>', 'msg', '1', '2019-01-13 03:39:16'),
(11, 6, 767095712, 37, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 05:22:21'),
(12, 7, 767095712, 39, 'Masukkan perintah berikut:<pre>cari pegawai #nip #nama</pre>', 'msg', '1', '2019-01-13 05:25:49'),
(13, 8, 767095712, 41, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 05:26:23'),
(14, 9, 767095712, 43, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 05:31:54'),
(15, 10, 767095712, 45, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 05:34:02'),
(16, 12, 767095712, 48, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 05:35:34'),
(17, 13, 767095712, 50, 'Masukkan perintah berikut:<pre>cari pegawai #nip #nama</pre>', 'msg', '1', '2019-01-13 05:36:01'),
(18, 14, 767095712, 52, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 05:36:13'),
(19, 15, 767095712, 54, 'Masukkan perintah berikut:<pre>update pegawai #nama #nip #alamat</pre>', 'msg', '1', '2019-01-13 05:36:51'),
(20, 16, 767095712, 56, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 05:37:17'),
(21, 17, 767095712, 58, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 05:38:25'),
(22, 18, 767095712, 60, '', 'msg', '1', '2019-01-13 05:42:16'),
(23, 19, 767095712, 61, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 05:43:09'),
(24, 20, 767095712, 63, '', 'msg', '1', '2019-01-13 05:43:43'),
(25, 21, 767095712, 64, 'A', '', '1', '2019-01-13 05:45:27'),
(26, 22, 767095712, 66, 'A', '', '1', '2019-01-13 05:48:09'),
(27, 23, 767095712, 68, 'A', '', '1', '2019-01-13 09:36:25'),
(28, 26, 767095712, 72, 'id	: 1\nnama	: pradipta agus\nnip	: 1605551033\nalamat	: Klungkung\njk	: Laki-laki\ntgl_buat	: 2019-01-12 19:22:29\ntgl_ubah	: 2019-01-12 13:05:16\n', 'msg', '1', '2019-01-13 09:57:40'),
(29, 27, 767095712, 74, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 09:58:06'),
(30, 28, 767095712, 77, 'Masukkan perintah berikut:<pre>cari pegawai #nip #nama</pre>', 'msg', '1', '2019-01-13 09:58:32'),
(31, 29, 767095712, 79, 'id	: 1\nnama	: pradipta agus\nnip	: 1605551033\nalamat	: Klungkung\njk	: Laki-laki\ntgl_buat	: 2019-01-12 19:22:29\ntgl_ubah	: 2019-01-12 13:05:16\n', 'msg', '1', '2019-01-13 09:58:53'),
(32, 31, 767095712, 82, 'Data tidak ditemukan', 'msg', '1', '2019-01-13 10:06:18'),
(33, 32, 767095712, 84, 'NIP	: 1605551033\nNama	: pradipta agus\nJK	: Laki-laki\nAlamat	: Klungkung\n', 'msg', '1', '2019-01-13 10:09:56'),
(34, 33, 767095712, 86, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n', 'msg', '1', '2019-01-13 10:10:28'),
(35, 34, 767095712, 88, 'Masukkan perintah berikut:<pre>hapus pegawai #nip</pre>', 'msg', '1', '2019-01-13 10:10:38'),
(36, 35, 767095712, 90, 'Delete gagal dilakukan', 'msg', '1', '2019-01-13 10:10:56'),
(37, 36, 767095712, 92, 'Delete berhasil dilakukan', 'msg', '1', '2019-01-13 10:12:30'),
(38, 37, 767095712, 94, 'Data tidak ditemukan', 'msg', '1', '2019-01-13 10:12:52'),
(39, 38, 767095712, 96, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 10:19:04'),
(40, 39, 767095712, 98, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 10:19:18'),
(41, 40, 767095712, 100, 'Masukkan perintah berikut:<pre>tambah pegawai #nip #nama #jk #alamat</pre>', 'msg', '1', '2019-01-13 10:20:00'),
(42, 41, 767095712, 102, 'Insert berhasil dilakukan', 'msg', '1', '2019-01-13 10:21:14'),
(43, 42, 767095712, 104, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 10:22:10'),
(44, 43, 767095712, 107, 'Masukkan perintah berikut:<pre>tambah pegawai #nip #nama #jk (Laki-laki / Perempuan) #alamat</pre>', 'msg', '1', '2019-01-13 10:22:42'),
(45, 44, 767095712, 109, 'Masukkan perintah berikut:<pre>tambah pegawai #nip #nama #jk (Laki-laki / Perempuan) #alamat</pre>', 'msg', '1', '2019-01-13 11:24:48'),
(46, 45, 767095712, 111, 'Insert berhasil dilakukan', 'msg', '1', '2019-01-13 11:25:45'),
(47, 46, 767095712, 113, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 11:26:01'),
(48, 47, 767095712, 115, 'Masukkan perintah berikut:<pre>update pegawai #nip #nama #jk (Laki-laki / Perempuan) #alamat</pre>', 'msg', '1', '2019-01-13 11:27:07'),
(49, 48, 767095712, 117, 'Update gagal dilakukan', 'msg', '1', '2019-01-13 11:27:43'),
(50, 49, 767095712, 119, 'Update gagal dilakukan', 'msg', '1', '2019-01-13 11:32:43'),
(51, 57, 767095712, 128, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 12:01:26'),
(52, 58, 767095712, 129, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 12:01:28'),
(53, 60, 767095712, 133, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 12:06:49'),
(54, 61, 767095712, 135, 'Masukkan perintah berikut:<pre>hapus pegawai #nip</pre>', 'msg', '1', '2019-01-13 12:07:09'),
(55, 62, 767095712, 137, 'Masukkan perintah berikut:<pre>tambah pegawai #nip #nama #jk (Laki-laki / Perempuan) #alamat</pre>', 'msg', '1', '2019-01-13 12:07:57'),
(56, 63, 767095712, 139, 'Insert berhasil dilakukan', 'msg', '1', '2019-01-13 12:08:25'),
(57, 64, 767095712, 141, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 12:08:43'),
(58, 65, 767095712, 143, 'Masukkan perintah berikut:<pre>cari pegawai #nip #nama</pre>', 'msg', '1', '2019-01-13 12:08:55'),
(59, 66, 767095712, 145, 'Data tidak ditemukan', 'msg', '1', '2019-01-13 12:09:22'),
(60, 67, 767095712, 147, 'NIP	: 1605551035\nNama	: gus arisna\nJK	: Laki-laki\nAlamat	: Banda\n', 'msg', '1', '2019-01-13 12:09:47'),
(61, 68, 767095712, 149, 'Masukkan perintah berikut:<pre>update pegawai #nip #nama #jk (Laki-laki / Perempuan) #alamat</pre>', 'msg', '1', '2019-01-13 12:10:06'),
(62, 71, 767095712, 153, 'Update berhasil dilakukan', 'msg', '1', '2019-01-13 12:15:23'),
(63, 73, 767095712, 155, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 12:18:03'),
(64, 78, 767095712, 162, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 12:23:58'),
(65, 79, 767095712, 164, 'NIP	: 1605551033\nNama	: pradipta\nJK	: Laki-laki\nAlamat	: Banda\n', 'msg', '1', '2019-01-13 12:24:28'),
(66, 81, 767095712, 167, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 12:25:54'),
(67, 82, 767095712, 170, 'Masukkan perintah berikut:<pre>tambah pegawai #nip #nama #jk (Laki-laki / Perempuan) #alamat</pre>', 'msg', '1', '2019-01-13 12:27:30'),
(68, 83, 767095712, 171, 'Masukkan perintah berikut:<pre>tambah pegawai #nip #nama #jk (Laki-laki / Perempuan) #alamat</pre>', 'msg', '1', '2019-01-13 12:27:42'),
(69, 84, 767095712, 172, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 12:28:58'),
(70, 85, 767095712, 175, 'Insert berhasil dilakukan', 'msg', '1', '2019-01-13 12:29:04'),
(71, 86, 767095712, 178, 'NIP	: 1605551036\nNama	: pande natayasa\nJK	: Laki-laki\nAlamat	: Banda\n', 'msg', '1', '2019-01-13 12:31:23'),
(72, 87, 767095712, 178, 'NIP	: 1605551036\nNama	: pande natayasa\nJK	: Laki-laki\nAlamat	: Banda\n', 'msg', '1', '2019-01-13 12:32:45'),
(73, 89, 767095712, 182, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 12:37:13'),
(74, 90, 767095712, 184, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n', 'msg', '1', '2019-01-13 12:53:16'),
(75, 91, 767095712, 187, 'Masukkan perintah berikut:<pre>update pegawai #nama #jk (Laki-laki / Perempuan) #alamat #nip</pre>', 'msg', '1', '2019-01-13 12:53:39'),
(76, 92, 767095712, 189, 'Update gagal dilakukan', 'msg', '1', '2019-01-13 12:54:33'),
(77, 93, 767095712, 191, 'Update gagal dilakukan', 'msg', '1', '2019-01-13 12:55:29'),
(78, 94, 767095712, 193, 'Update berhasil dilakukan', 'msg', '1', '2019-01-13 12:56:00'),
(79, 95, 767095712, 195, 'Update berhasil dilakukan', 'msg', '1', '2019-01-13 12:56:41'),
(80, 96, 767095712, 197, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-13 18:38:23'),
(81, 97, 767095712, 199, 'Masukkan perintah berikut:<pre>download pegawai</pre>', 'msg', '1', '2019-01-13 18:38:33'),
(82, 100, 767095712, 203, 'Generate file berhasil dilakukan', 'file', '1', '2019-01-13 18:48:42'),
(83, 101, 767095712, 204, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-13 18:54:19'),
(84, 102, 767095712, 206, 'Generate file berhasil dilakukan', 'file', '1', '2019-01-13 18:54:51'),
(85, 103, 767095712, 207, 'Generate file berhasil dilakukan', 'file', '1', '2019-01-13 18:56:17'),
(86, 104, 767095712, 208, 'Generate file berhasil dilakukan', 'file', '1', '2019-01-13 18:57:37'),
(87, 105, 767095712, 209, 'Generate file berhasil dilakukan', 'file', '1', '2019-01-13 18:58:40'),
(88, 106, 767095712, 210, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-13 18:59:31'),
(89, 107, 767095712, 213, 'Generate file berhasil dilakukan', 'file', '1', '2019-01-13 18:59:57'),
(90, 108, 767095712, 214, 'Generate file berhasil dilakukan', 'file', '1', '2019-01-13 19:14:05'),
(91, 110, 767095712, 216, 'Generate file berhasil dilakukan', 'file', '1', '2019-01-13 19:20:50'),
(92, 111, 767095712, 217, 'Generate file berhasil dilakukan', 'file', '1', '2019-01-13 19:21:20'),
(93, 112, 767095712, 218, 'C:xampphtdocsmca_php_websocketdownload.xlsx', 'file', '1', '2019-01-13 19:45:07'),
(94, 113, 767095712, 219, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-13 19:47:11'),
(95, 114, 767095712, 220, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-13 19:49:40'),
(96, 115, 767095712, 222, 'C:xampphtdocsmca_php_websocketdownload.xlsx', 'file', '1', '2019-01-13 19:49:54'),
(97, 117, 767095712, 224, '.', 'file', '1', '2019-01-13 19:59:35'),
(98, 118, 767095712, 225, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-13 20:07:00'),
(99, 119, 767095712, 227, '', 'file', '1', '2019-01-13 20:07:09'),
(100, 120, 767095712, 228, 'Resource id #134', 'file', '1', '2019-01-13 20:07:53'),
(101, 121, 767095712, 229, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-13 23:23:38'),
(102, 122, 767095712, 231, 'Masukkan perintah berikut:<pre>download pegawai</pre>', 'msg', '1', '2019-01-13 23:23:52'),
(103, 123, 767095712, 233, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-13 23:24:20'),
(104, 124, 767095712, 236, 'Resource id #134', 'file', '1', '2019-01-13 23:24:57'),
(105, 125, 767095712, 237, 'Resource id #135', 'file', '1', '2019-01-13 23:27:31'),
(106, 126, 767095712, 238, 'file:///C:/xampp/htdocs/mca_php_websocket/download.xlsx', 'file', '1', '2019-01-13 23:28:29'),
(107, 127, 767095712, 239, 'download.xlsx', 'file', '1', '2019-01-14 00:00:57'),
(108, 128, 767095712, 240, 'download.xlsx', 'file', '1', '2019-01-14 00:03:54'),
(109, 129, 767095712, 241, 'download.xlsx', 'file', '1', '2019-01-14 00:04:53'),
(110, 130, 767095712, 242, 'download.xlsx', 'file', '1', '2019-01-14 00:06:04'),
(111, 131, 767095712, 243, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-14 00:06:26'),
(112, 132, 767095712, 245, 'Masukkan perintah berikut:<pre>download data pegawai</pre>', 'msg', '1', '2019-01-14 00:06:35'),
(113, 133, 767095712, 247, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-14 00:06:49'),
(114, 134, 767095712, 249, 'download.xlsx', 'file', '1', '2019-01-14 00:07:01'),
(115, 135, 767095712, 250, 'download.xlsx', 'file', '1', '2019-01-14 00:08:28'),
(116, 136, 767095712, 251, 'file:///C:/xampp/htdocs/mca_php_websocket/download.xlsx', 'file', '1', '2019-01-14 00:13:13'),
(117, 138, 767095712, 253, '', 'file', '1', '2019-01-14 00:23:31'),
(118, 139, 767095712, 254, '', 'file', '1', '2019-01-14 00:25:25'),
(119, 141, 767095712, 256, '', 'file', '1', '2019-01-14 00:34:09'),
(120, 143, 767095712, 258, '', 'file', '1', '2019-01-14 00:35:40'),
(121, 144, 767095712, 259, 'C:xampphtdocsmca_php_websocketdownload.xlsx', 'file', '1', '2019-01-14 00:36:18'),
(122, 145, 767095712, 260, '', 'file', '1', '2019-01-14 00:40:26'),
(123, 146, 767095712, 261, ' ', 'file', '1', '2019-01-14 00:41:58'),
(124, 147, 767095712, 262, ' ', 'file', '1', '2019-01-14 00:45:44'),
(125, 148, 767095712, 263, '#', 'file', '1', '2019-01-14 00:47:12'),
(126, 149, 767095712, 264, '#', 'file', '1', '2019-01-14 00:47:36'),
(127, 150, 767095712, 265, '#', 'file', '1', '2019-01-14 00:48:15'),
(128, 151, 767095712, 266, 'C:xampphtdocsmca_php_websocketdownload.xlsx', 'file', '1', '2019-01-14 00:49:51'),
(129, 152, 767095712, 267, 'Array', 'file', '1', '2019-01-14 00:52:33'),
(130, 153, 767095712, 268, 'download.php', 'file', '1', '2019-01-14 00:52:58'),
(131, 154, 767095712, 269, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-14 00:54:28'),
(132, 155, 767095712, 272, 'download.php', 'file', '1', '2019-01-14 00:54:58'),
(133, 156, 767095712, 273, 'download.php', 'file', '1', '2019-01-14 00:56:04'),
(134, 157, 767095712, 274, 'download.php', 'file', '1', '2019-01-14 00:57:32'),
(135, 158, 767095712, 275, 'download.php', 'file', '1', '2019-01-14 00:58:10'),
(136, 159, 767095712, 276, 'download.php', 'file', '1', '2019-01-14 01:06:36'),
(137, 165, 767095712, 282, 'download.php', 'file', '1', '2019-01-14 01:33:53'),
(138, 166, 767095712, 283, 'download.php', 'file', '1', '2019-01-14 01:35:35'),
(139, 167, 767095712, 284, 'download.php', 'file', '1', '2019-01-14 01:36:21'),
(140, 168, 767095712, 285, 'download.php', 'file', '1', '2019-01-14 01:36:52'),
(141, 170, 767095712, 287, 'download.php', 'file', '1', '2019-01-14 01:38:22'),
(142, 171, 767095712, 288, 'download.pdf', 'file', '1', '2019-01-14 01:40:06'),
(143, 172, 767095712, 289, 'download.pdf', 'file', '1', '2019-01-14 01:41:20'),
(144, 173, 767095712, 290, 'download.pdf', 'file', '1', '2019-01-14 01:42:47'),
(145, 174, 767095712, 291, 'download.pdf', 'file', '1', '2019-01-14 01:50:15'),
(146, 175, 767095712, 292, 'download.pdf', 'file', '1', '2019-01-14 01:51:03'),
(147, 176, 767095712, 294, 'download.pdf', 'file', '1', '2019-01-14 02:02:43'),
(148, 177, 767095712, 296, 'download.pdf', 'file', '1', '2019-01-14 02:03:26'),
(149, 178, 767095712, 298, 'download.pdf', 'file', '1', '2019-01-14 02:04:36'),
(150, 179, 767095712, 300, 'download.pdf', 'file', '1', '2019-01-14 02:05:29'),
(151, 180, 767095712, 302, 'download.pdf', 'file', '1', '2019-01-14 02:06:36'),
(152, 181, 767095712, 304, 'download.pdf', 'file', '1', '2019-01-14 02:07:19'),
(153, 182, 767095712, 306, 'download.pdf', 'file', '1', '2019-01-14 02:09:55'),
(154, 183, 767095712, 308, 'download.pdf', 'file', '1', '2019-01-14 02:11:16'),
(155, 184, 767095712, 310, 'download.pdf', 'file', '1', '2019-01-14 02:14:48'),
(156, 185, 767095712, 312, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-14 02:15:16'),
(157, 186, 767095712, 315, 'Masukkan perintah berikut:<pre>cari pegawai #nip #nama</pre>', 'msg', '1', '2019-01-14 02:15:46'),
(158, 187, 767095712, 317, 'NIP	: 1605551033\nNama	: pradipta agus\nJK	: Laki-laki\nAlamat	: Banda\n', 'msg', '1', '2019-01-14 02:16:06'),
(159, 188, 767095712, 319, 'Masukkan perintah berikut:<pre>update pegawai #nama #jk (Laki-laki / Perempuan) #alamat #nip</pre>', 'msg', '1', '2019-01-14 02:17:02'),
(160, 189, 767095712, 321, 'Update berhasil dilakukan', 'msg', '1', '2019-01-14 02:17:44'),
(161, 190, 767095712, 323, 'NIP	: 1605551033\nNama	: I Gede Agus Pradipta\nJK	: Laki-laki\nAlamat	: Banda\n', 'msg', '1', '2019-01-14 02:18:12'),
(162, 191, 767095712, 325, 'Masukkan perintah berikut:<pre>hapus pegawai #nip</pre>', 'msg', '1', '2019-01-14 02:18:26'),
(163, 192, 767095712, 327, 'Delete berhasil dilakukan', 'msg', '1', '2019-01-14 02:18:45'),
(164, 193, 767095712, 329, 'Masukkan perintah berikut:<pre>tambah pegawai #nip #nama #jk (Laki-laki / Perempuan) #alamat</pre>', 'msg', '1', '2019-01-14 02:19:03'),
(165, 194, 767095712, 331, 'Insert berhasil dilakukan', 'msg', '1', '2019-01-14 02:19:41'),
(166, 195, 767095712, 333, 'NIP	: 1605551037\nNama	: I Komang Pande Natayasa\nJK	: Laki-laki\nAlamat	: Bangli\n', 'msg', '1', '2019-01-14 02:20:07'),
(167, 196, 767095712, 335, 'download.pdf', 'file', '1', '2019-01-14 02:20:26'),
(168, 197, 767095712, 337, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-14 06:45:01'),
(169, 198, 45561076, 339, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-14 06:53:04'),
(170, 199, 45561076, 340, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-14 06:53:07'),
(171, 200, 45561076, 342, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-14 06:53:11'),
(172, 201, 45561076, 343, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-14 06:53:13'),
(173, 202, 45561076, 345, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-14 06:53:17'),
(174, 203, 45561076, 348, '<b>List operasi</b>\n1.	Pencarian data pegawai\n2.	Update data pegawai\n3.	Hapus data pegawai\n4.	Tambah data pegawai\n5.	Download semua data pegawai\n', 'msg', '1', '2019-01-14 06:53:21'),
(175, 204, 45561076, 352, 'Masukkan perintah berikut:<pre>cari pegawai #nip #nama</pre>', 'msg', '1', '2019-01-14 06:53:34'),
(176, 205, 767095712, 354, 'Masukkan perintah berikut:<pre>cari pegawai #nip #nama</pre>', 'msg', '1', '2019-01-14 06:54:38'),
(177, 206, 767095712, 356, 'NIP	: 1605551033\nNama	: I Gede Agus Pradipta\nJK	: Laki-laki\nAlamat	: Banda\n', 'msg', '1', '2019-01-14 06:55:14'),
(178, 207, 767095712, 358, 'Masukkan perintah berikut:<pre>download data pegawai</pre>', 'msg', '1', '2019-01-14 06:55:33'),
(179, 208, 767095712, 360, 'download.pdf', 'file', '1', '2019-01-14 06:56:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_crud`
--
ALTER TABLE `tb_crud`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- Indexes for table `tb_file`
--
ALTER TABLE `tb_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_inbox`
--
ALTER TABLE `tb_inbox`
  ADD PRIMARY KEY (`id_inbox`),
  ADD KEY `id_chat` (`chat_id`);

--
-- Indexes for table `tb_operasi`
--
ALTER TABLE `tb_operasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_outbox`
--
ALTER TABLE `tb_outbox`
  ADD PRIMARY KEY (`id_outbox`),
  ADD KEY `id_inbox` (`id_inbox`),
  ADD KEY `chat_id` (`chat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_crud`
--
ALTER TABLE `tb_crud`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_file`
--
ALTER TABLE `tb_file`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_inbox`
--
ALTER TABLE `tb_inbox`
  MODIFY `id_inbox` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `tb_operasi`
--
ALTER TABLE `tb_operasi`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_outbox`
--
ALTER TABLE `tb_outbox`
  MODIFY `id_outbox` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
