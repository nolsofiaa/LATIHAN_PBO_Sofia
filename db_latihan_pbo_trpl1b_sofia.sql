-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 17, 2026 at 05:01 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_latihan_pbo_trpl1b_sofia`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_tiket`
--

CREATE TABLE `tabel_tiket` (
  `id_tiket` int NOT NULL,
  `nama_film` varchar(100) NOT NULL,
  `jadwal_tayang` datetime NOT NULL,
  `jumlah_kursi` int NOT NULL,
  `harga_dasar_tiket` decimal(10,2) NOT NULL,
  `jenis_studio` enum('Regular','IMAX','Velvet') NOT NULL,
  `tipe_audio` varchar(50) DEFAULT NULL,
  `lokasi_baris` varchar(10) DEFAULT NULL,
  `kacamata_3d_id` varchar(50) DEFAULT NULL,
  `efek_gerak_fitur` varchar(100) DEFAULT NULL,
  `bantal_selimut_pack` varchar(50) DEFAULT NULL,
  `layanan_butler` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tabel_tiket`
--

INSERT INTO `tabel_tiket` (`id_tiket`, `nama_film`, `jadwal_tayang`, `jumlah_kursi`, `harga_dasar_tiket`, `jenis_studio`, `tipe_audio`, `lokasi_baris`, `kacamata_3d_id`, `efek_gerak_fitur`, `bantal_selimut_pack`, `layanan_butler`) VALUES
(1, 'Avengers: Endgame', '2026-01-20 13:00:00', 2, '45000.00', 'Regular', 'Stereo', 'B3', NULL, NULL, NULL, NULL),
(2, 'Spider-Man: No Way Home', '2026-01-20 15:30:00', 3, '45000.00', 'Regular', 'Dolby', 'C5', NULL, NULL, NULL, NULL),
(3, 'The Batman', '2026-01-21 10:00:00', 1, '45000.00', 'Regular', 'Stereo', 'A1', NULL, NULL, NULL, NULL),
(4, 'Joker', '2026-01-21 19:00:00', 4, '45000.00', 'Regular', 'Dolby', 'D7', NULL, NULL, NULL, NULL),
(5, 'Inception', '2026-01-22 12:00:00', 2, '45000.00', 'Regular', 'Stereo', 'B4', NULL, NULL, NULL, NULL),
(6, 'Interstellar', '2026-01-22 16:00:00', 3, '45000.00', 'Regular', 'Dolby', 'C6', NULL, NULL, NULL, NULL),
(7, 'The Dark Knight', '2026-01-23 14:00:00', 2, '45000.00', 'Regular', 'Stereo', 'A3', NULL, NULL, NULL, NULL),
(8, 'Dune: Part Two', '2026-01-20 14:00:00', 2, '75000.00', 'IMAX', NULL, NULL, 'IMAX-3D-001', 'Motion Seat Enabled', NULL, NULL),
(9, 'Oppenheimer', '2026-01-20 17:00:00', 1, '75000.00', 'IMAX', NULL, NULL, 'IMAX-3D-002', 'Standard', NULL, NULL),
(10, 'Avatar: Way of Water', '2026-01-21 11:00:00', 3, '75000.00', 'IMAX', NULL, NULL, 'IMAX-3D-003', 'Motion Seat Enabled', NULL, NULL),
(11, 'Top Gun: Maverick', '2026-01-21 20:00:00', 2, '75000.00', 'IMAX', NULL, NULL, 'IMAX-3D-001', 'Motion Seat Enabled', NULL, NULL),
(12, 'Mission Impossible 7', '2026-01-22 13:00:00', 4, '75000.00', 'IMAX', NULL, NULL, 'IMAX-3D-002', 'Standard', NULL, NULL),
(13, 'No Time to Die', '2026-01-22 18:00:00', 2, '75000.00', 'IMAX', NULL, NULL, 'IMAX-3D-003', 'Motion Seat Enabled', NULL, NULL),
(14, 'Tenet', '2026-01-23 15:00:00', 3, '75000.00', 'IMAX', NULL, NULL, 'IMAX-3D-001', 'Standard', NULL, NULL),
(15, 'The Godfather', '2026-01-20 19:00:00', 2, '120000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Premium Pack A', 'Butler John'),
(16, 'The Irishman', '2026-01-21 18:00:00', 1, '120000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Premium Pack B', 'Butler Sarah'),
(17, 'Once Upon a Time in Hollywood', '2026-01-22 20:00:00', 3, '120000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Premium Pack A', 'Butler Mike'),
(18, 'The Great Gatsby', '2026-01-23 19:00:00', 2, '120000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Premium Pack C', 'Butler Anna'),
(19, 'La La Land', '2026-01-24 16:00:00', 4, '120000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Premium Pack B', 'Butler John'),
(20, 'Bohemian Rhapsody', '2026-01-24 20:00:00', 2, '120000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Premium Pack A', 'Butler Sarah');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_tiket`
--
ALTER TABLE `tabel_tiket`
  ADD PRIMARY KEY (`id_tiket`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabel_tiket`
--
ALTER TABLE `tabel_tiket`
  MODIFY `id_tiket` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
