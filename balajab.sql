-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2025 at 04:23 PM
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
-- Database: `balajab`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorite`
--

CREATE TABLE `kategorite` (
  `id` int(11) NOT NULL,
  `kategorite` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorite`
--

INSERT INTO `kategorite` (`id`, `kategorite`) VALUES
(1, 'Lidhëse'),
(2, 'Zvogëlues'),
(3, 'Kthesë'),
(4, 'Kthesë për fontana muri'),
(5, 'Kthesa FJ'),
(6, 'Kthesa FB'),
(7, 'Kokë përfunduese'),
(8, 'Kokë përfunduese qarkulluese');

-- --------------------------------------------------------

--
-- Table structure for table `produktet`
--

CREATE TABLE `produktet` (
  `shifra` varchar(50) NOT NULL,
  `emertimi` varchar(100) DEFAULT NULL,
  `dimensionet` varchar(20) DEFAULT NULL,
  `cmimi` double DEFAULT NULL,
  `kategoria` int(11) DEFAULT NULL,
  `sasia` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produktet`
--

INSERT INTO `produktet` (`shifra`, `emertimi`, `dimensionet`, `cmimi`, `kategoria`, `sasia`) VALUES
('PFK1616', 'PipeTec press Lidhese', 'Fi 16x16', 2.9, 1, 0),
('PFK2016', 'PipeTec press Zvogeluese', 'Fi 20x16', 3.9, 2, 0),
('PFK2020', 'PipeTec press Lidhese', 'Fi 20x20', 3.65, 1, 0),
('PFK2616', 'PipeTec press Zvogeluese', 'Fi 26x16', NULL, 2, 0),
('PFK2620', 'PipeTec press Zvogeluese', 'Fi 26x20', 5.2, 2, 0),
('PFK2626', 'PipeTec press Lidhese', 'Fi 26x26', 5.5, 1, 0),
('PFK3220', 'PipeTec press Zvogeluese', 'Fi 32x20', NULL, 2, 0),
('PFK3226', 'PipeTec press Zvogeluese', 'Fi 32x26', NULL, 2, 0),
('PFK3232', 'PipeTec press Lidhese', 'Fi 32x32', 8.3, 1, 0),
('PFTC16', 'PipeTec press Kthese per fontane muri', 'Fi 16x1/2', 9.25, 4, 0),
('PFW1616', 'PipeTec press Kthese', 'Fi 16x16', 3.6, 3, 0),
('PFW2020', 'PipeTec press Kthese', 'Fi 20x20', 4.35, 3, 0),
('PFW2626', 'PipeTec press Kthese', 'Fi 26x26', 6.5, 3, 0),
('PFW3232', 'PipeTec press Kthese', 'Fi 32x32', 8.85, 3, 0),
('PFWA1604', 'PipeTec press Kthese FJ', 'Fi 16x1/2', 3.8, 5, 0),
('PFWA1605', 'PipeTec press Kthese FJ', 'Fi 16x3/4', NULL, 5, 0),
('PFWA2004', 'PipeTec press Kthese FJ', 'Fi 20x1/2', 4.3, 5, 0),
('PFWA2005', 'PipeTec press Kthese FJ', 'Fi 20x3/4', 4.45, 5, 0),
('PFWA2605', 'PipeTec press Kthese FJ', 'Fi 26x3/4', 6, 5, 0),
('PFWA2606', 'PipeTec press Kthese FJ', 'Fi 26x1\"', 7.85, 5, 0),
('PFWA3206', 'PipeTec press Kthese FJ', 'Fi 32x1\"', 7.85, 5, 0),
('PFWI1604', 'PipeTec press Kthese FB', 'Fi 16x1/2', 3, 6, 0),
('PFWI2004', 'PipeTec press Kthese FB', 'Fi 20x1/2', 4.15, 6, 0),
('PFWI2005', 'PipeTec press Kthese FB', 'Fi 20x3/4', 5.6, 6, 0),
('PFWI2605', 'PipeTec press Kthese FB', 'Fi 26x3/4', 6.35, 6, 0),
('PFWI2606', 'PipeTec press Kthese FB', 'Fi 26x1\"', 8.2, 6, 0),
('PFWI3206', 'PipeTec press Kthese FB', 'Fi 32x1\"', 8.05, 6, 0),
('PFWWL1604', 'Koke perfunduese', 'Fi 16x1/2 L=7.8cm', 7.5, 7, 0),
('PFWWL2004', 'Koke perfunduese', 'Fi 20x1/2 L=7.8cm', NULL, 7, 0),
('PFWWM1604', 'Koke perfunduese', 'Fi 16x1/2 L=5.2cm', 5.3, 7, 0),
('PFWWM2004', 'Koke perfunduese', 'Fi 20x1/2 L=5.2cm', 5.1, 7, 0),
('PFWWM2005', 'Koke perfunduese', 'Fi 20x3/4 L=5.2cm', NULL, 7, 0),
('PFWWM2605', 'Koke perfunduese', 'Fi 26x3/4 L=5.2cm', NULL, 7, 0),
('PFWWUSA160416', 'Koke perfunduese qarkulluese', 'Fi 16x1/2', 18.2, 8, 0),
('PFWWUSA200420', 'Koke perfunduese qarkulluese', 'Fi 20x1/2', 18.9, 8, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategorite`
--
ALTER TABLE `kategorite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produktet`
--
ALTER TABLE `produktet`
  ADD PRIMARY KEY (`shifra`),
  ADD KEY `kategoria` (`kategoria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorite`
--
ALTER TABLE `kategorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produktet`
--
ALTER TABLE `produktet`
  ADD CONSTRAINT `produktet_ibfk_1` FOREIGN KEY (`kategoria`) REFERENCES `kategorite` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
