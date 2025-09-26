-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2025 at 08:33 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rent_stry`
--

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `k_mobil` char(3) NOT NULL,
  `no_pol` varchar(20) DEFAULT NULL,
  `j_mobil` varchar(20) DEFAULT NULL,
  `harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`k_mobil`, `no_pol`, `j_mobil`, `harga`) VALUES
('M01', 'B 1234 KO', 'Sedan', 600000),
('M02', 'B 4321 BL', 'Mini Bus', 50000),
('M03', 'B 6789 MH', 'Mini Bus', 50000),
('M04', 'B 9876 MN', 'Mini Bus', 450000),
('M05', 'B 3333 SS', 'Mini Bus', 600000);

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `no_ktp` char(16) NOT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `kontak` varchar(13) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`no_ktp`, `nama`, `jk`, `kontak`, `alamat`) VALUES
('1234003', 'Ulfa', 'P', '081223456653', 'Tasikmalaya'),
('1234004', 'Dani', 'L', '081223456652', 'Ciamis'),
('1234007', 'Enid', 'P', '081223456654', 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `penyewaan`
--

CREATE TABLE `penyewaan` (
  `notrans` varchar(10) NOT NULL,
  `no_ktp` char(16) DEFAULT NULL,
  `k_mobil` char(3) DEFAULT NULL,
  `tgl_sewa` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `lama_sewa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyewaan`
--

INSERT INTO `penyewaan` (`notrans`, `no_ktp`, `k_mobil`, `tgl_sewa`, `tgl_kembali`, `lama_sewa`) VALUES
('TRS001', '1234003', 'M01', '2022-01-14', '2022-01-16', 2),
('TRS003', '1234004', 'M03', '2022-01-17', '2022-01-21', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`k_mobil`),
  ADD UNIQUE KEY `no_pol` (`no_pol`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`no_ktp`);

--
-- Indexes for table `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD PRIMARY KEY (`notrans`),
  ADD KEY `no_ktp` (`no_ktp`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD CONSTRAINT `fk_penyewa` FOREIGN KEY (`no_ktp`) REFERENCES `penyewa` (`no_ktp`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
