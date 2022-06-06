-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2022 at 02:22 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodejs-datlichkham`
--

-- --------------------------------------------------------

--
-- Table structure for table `allcodes`
--

CREATE TABLE `allcodes` (
  `id` int(11) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `valueEn` varchar(255) DEFAULT NULL,
  `valueVi` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `statusId` varchar(255) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `patientId` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `timeType` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_clinic_specialties`
--

CREATE TABLE `doctor_clinic_specialties` (
  `id` int(11) NOT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `clinicId` int(11) DEFAULT NULL,
  `specialtyId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id` int(11) NOT NULL,
  `patienId` int(11) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `files` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `markdowns`
--

CREATE TABLE `markdowns` (
  `id` int(11) NOT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `clinicId` int(11) DEFAULT NULL,
  `specialtyId` int(11) DEFAULT NULL,
  `contentHTML` text DEFAULT NULL,
  `contentMarkdown` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `currentNumber` int(11) DEFAULT NULL,
  `maxNumber` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `timeType` varchar(255) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20220526011151-create-user.js'),
('20220526154059-create-allcode.js'),
('20220526155317-create-booking.js'),
('20220526155724-create-clinic.js'),
('20220526160133-create-history.js'),
('20220526160444-create-schedule.js'),
('20220526160635-create-specialty.js'),
('20220526160920-create-markdown.js'),
('20220526161055-create-doctor-clinic-specialty.js'),
('20220527135255-create-doctor-info.js');

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

CREATE TABLE `specialties` (
  `id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `positionId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `address`, `gender`, `roleId`, `phoneNumber`, `image`, `positionId`, `createdAt`, `updatedAt`) VALUES
(4, 'id 4 Test Update ', 'Lasst 4 Tesst', 'hue@gmail.com', '$2a$10$cfYLfR.GhnM.1yqFYG8Gbu7f.c6.hFoWiKUV6It1OZICBXY/TPvf6', 'quang dien', 1, '3', '0912123213', NULL, '3', '2022-05-27 17:32:27', '2022-06-02 11:20:58'),
(18, 'Quốc Tuấn', 'Tuan 2002', 'test2@gmail.com', '$2a$10$IoYKcxCC1ZhHHEndoUNXke42bul6wfwbGwXmA4TeNrQ8LjpWd18SC', 'Quận 4, hồ chí minh', 0, NULL, NULL, NULL, NULL, '2022-06-05 10:00:50', '2022-06-06 00:03:48'),
(20, 'Trần ', 'Văn', 'Testtrenform@gmail.com', '$2a$10$IoYKcxCC1ZhHHEndoUNXkeKlDNDsqrT37rlRIZykPyCnOB4Ue3tb.', 'Huế, Phường Phạm Ngũ Lão', 0, NULL, NULL, NULL, NULL, '2022-06-05 10:07:19', '2022-06-05 10:07:19'),
(23, 'Vansssss', 'test', 'Văn Test', '$2a$10$IoYKcxCC1ZhHHEndoUNXkeKlDNDsqrT37rlRIZykPyCnOB4Ue3tb.', 'Huế Quảng Điền', 0, NULL, NULL, NULL, NULL, '2022-06-05 10:18:21', '2022-06-06 00:14:19'),
(25, 'trung', 'tra', 'the new getAllUsser', '$2a$10$IoYKcxCC1ZhHHEndoUNXkeKlDNDsqrT37rlRIZykPyCnOB4Ue3tb.', 'Haf nội việt nban', 0, NULL, NULL, NULL, NULL, '2022-06-05 10:30:34', '2022-06-05 10:30:34'),
(26, 'xin chao 6/6', 'Việt nam', 'the new get all User', '$2a$10$IoYKcxCC1ZhHHEndoUNXkeYcLaN3QEa2UXmxHwsbfbYBtwm7/CRj.', 'Quangr Ngãi, nhứ động', 0, NULL, NULL, NULL, NULL, '2022-06-05 10:31:27', '2022-06-06 00:06:07'),
(28, 'Vantrung', 'Vantrung', 'trung1@gmail.com', '$2a$10$yTqAXAn1q1xr34kI6XlyRejcekzIknarLwDDICVsIcs04l/llmRg6', 'Quãng Ngãi', 0, NULL, NULL, NULL, NULL, '2022-06-05 10:48:57', '2022-06-05 10:48:57'),
(31, 'Hỏi dân IT', 'hỏi', 'hoidanit@gmail.com', '$2a$10$LcxeLbke4Ak9I8UjY4k9rO83MzvAWoqQT.vrjGcbo0bIEg1dOK2um', 'Hà nội', 0, NULL, NULL, NULL, NULL, '2022-06-05 22:45:04', '2022-06-05 22:45:04'),
(32, 'Nguyễn ', 'Văn Định', 'ádasdasd', '$2a$10$LcxeLbke4Ak9I8UjY4k9rONp.1kHoMjPwkOYuylHKhdxXdgpQcQyK', 'Đà nẵg, nguyễn thị thập', 0, NULL, NULL, NULL, NULL, '2022-06-05 22:59:50', '2022-06-06 00:07:30'),
(33, 'co don ', 'Hoài Lâm', 'cô đơn trong cn', '$2a$10$LcxeLbke4Ak9I8UjY4k9rO1AZDgE5u8AQYiYr03xEI0JLrxRWy47.', 'Cô Đơn trong chính căn nhà mình', 0, NULL, NULL, NULL, NULL, '2022-06-05 23:00:45', '2022-06-06 00:19:00'),
(34, 'Tấn Tài', 'Văn', 'the phương đông', '$2a$10$LcxeLbke4Ak9I8UjY4k9rO83MzvAWoqQT.vrjGcbo0bIEg1dOK2um', 'Bình Định', 0, NULL, NULL, NULL, NULL, '2022-06-05 23:01:55', '2022-06-05 23:01:55'),
(35, 'Trung', 'Trần Văn', 'trung@gmail.com', '$2a$10$LcxeLbke4Ak9I8UjY4k9rO83MzvAWoqQT.vrjGcbo0bIEg1dOK2um', 'Thôn Đông, Kiệt 491, Trần Khánh Tông, Hà Nội', 0, NULL, NULL, NULL, NULL, '2022-06-06 00:08:48', '2022-06-06 00:09:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allcodes`
--
ALTER TABLE `allcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_clinic_specialties`
--
ALTER TABLE `doctor_clinic_specialties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `markdowns`
--
ALTER TABLE `markdowns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allcodes`
--
ALTER TABLE `allcodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_clinic_specialties`
--
ALTER TABLE `doctor_clinic_specialties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `markdowns`
--
ALTER TABLE `markdowns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
