-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2025 at 09:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jb_stry`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `kode_transaksi` varchar(8) NOT NULL,
  `kode_produk` varchar(8) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `kode_transaksi`, `kode_produk`, `jumlah`) VALUES
(1, 'TRN001', 'PRD001', 1),
(2, 'TRN001', 'PRD006', 1),
(3, 'TRN002', 'PRD005', 3),
(4, 'TRN003', 'PRD007', 1),
(5, 'TRN004', 'PRD003', 1),
(6, 'TRN004', 'PRD002', 3),
(7, 'TRN004', 'PRD006', 1),
(8, 'TRN004', 'PRD009', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Perlengkapan Sekolah'),
(2, 'Elektronik');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `kode_pembeli` varchar(5) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL,
  `kontak` varchar(13) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`kode_pembeli`, `nama_pembeli`, `kontak`, `alamat`) VALUES
('P001', 'Wildan', '087654321000', 'Bojongkoneng,Singaparna'),
('P002', 'Ria', '012345678900', 'Cikeusal'),
('P003', 'Rina', '08123287490', 'Garut');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `kode_produk` varchar(8) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga` double NOT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`kode_produk`, `id_kategori`, `nama_produk`, `satuan`, `harga`, `stok`) VALUES
('PRD001', 1, 'Buku Tulis Sidu 58', 'Lusin', 35000, 100),
('PRD002', 1, 'Buku Tulis Sidu 58', 'Buah', 4000, 100),
('PRD003', 1, 'Pulpen Joyco Gel', 'Pack', 25000, 100),
('PRD004', 1, 'Pulpen Faber Castell 2B', 'Pack', 25000, 100),
('PRD005', 1, 'Buku Gambar A4 SIDU', 'Pack', 21000, 100),
('PRD006', 1, 'Tip-X Joyco', 'Buah', 3000, 100),
('PRD007', 2, 'Laptop Lenovo core i3 RAM 4GB SSD 512GB', 'Buah', 7500000, 100),
('PRD008', 1, 'Penghapus Faber Castell', 'Buah', 2500, 100),
('PRD009', 2, 'HP SAMSUNG A50', 'Buah', 2950000, 100);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `kode_transaksi` varchar(8) NOT NULL,
  `kode_pembeli` varchar(5) NOT NULL,
  `tgl_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`kode_transaksi`, `kode_pembeli`, `tgl_transaksi`) VALUES
('TRN001', 'P001', '2025-01-07'),
('TRN002', 'P002', '2025-01-09'),
('TRN003', 'P001', '2025-01-11'),
('TRN004', 'P003', '2025-09-07'),
('TRN005', 'P003', '2025-09-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`kode_pembeli`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
